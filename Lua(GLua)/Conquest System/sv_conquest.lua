print('Серверная часть загружена!')


function SpawnFlags()
    
    for flagid,tbl in pairs(rp.Conquest.Config) do 
        local cpoint = ents.Create("flag")
        cpoint.id = flagid
        cpoint:SetPos(tbl.flag[1])
        cpoint:SetAngles(tbl.flag[2])
        cpoint:Spawn()

        local ccontainer = ents.Create("conqueststorage")
        ccontainer.id = flagid
        ccontainer:SetPos(tbl.container[1])
        ccontainer:SetAngles(tbl.container[2])
        ccontainer:Spawn()
    end
end


function CheckFlag()
    for k, v in pairs(ents.GetAll()) do
        if v:GetClass() == "flag" then
            print(v.id .. " пренадлежит " .. v:GetNVar("FlagOwner"))
        end
    end
end


function PlayersOnTerritory(flag, team)
    local pos1 = rp.Conquest.Config[flag.id].coords[1]
    local pos2 = rp.Conquest.Config[flag.id].coords[2]
    local result = 0
    local b
    if pos1[1] > pos2[1] then 
        b = pos1[1]
        pos1[1] = pos2[1]
        pos2[1] = b
    end
    if pos1[2] > pos2[2] then 
        b = pos1[2]
        pos1[2] = pos2[2]
        pos2[2] = b
    end
    if pos1[3] > pos2[3] then 
        b = pos1[3]
        pos1[3] = pos2[3]
        pos2[3] = b
    end


    for k,v in pairs(player.GetAll()) do
        local plypos = v:GetPos()

        if v:getJobTable().category == team then
            if plypos[1] > pos1[1] and plypos[2] > pos1[2] and plypos[3] > pos1[3] then
                if plypos[1] < pos2[1] and plypos[2] < pos2[2] and plypos[3] < pos2[3] then
                    result = result + 1
                end
            end 
        end 
    end

    return result
end

function CaptureCheck(flag, activator)
    local CapturingPlayers = PlayersOnTerritory(flag, activator:getJobTable().category)
    local players = 0
    for k,v in pairs(player.GetAll()) do 
        players = players + 1
    end

    if flag:GetNVar("FlagOwner") == "Ничей" then
        if (CapturingPlayers >= 1 and players >= 10 and players < 16) or (CapturingPlayers >= 2 and players >= 16 and players < 30) or (CapturingPlayers >= 3 and players > 30) then
            return true
        else
            activator:ChatPrint( 'Слишком мало союзников на территории для захвата!' )
            return false
        end
    else
        local OwnersOnTerritory = PlayersOnTerritory(flag, flag:GetNVar("FlagOwner"))

        if CapturingPlayers >= 1 and CapturingPlayers > OwnersOnTerritory then
            return true
        else
            timer.Simple( math.random(7,25), function()
                rp.GlobalChat(CHAT_NONE, Color(255,0,0) ,"[Общая частота] ", Color(128, 128, 128), "Неизвестный", Color(255,255,255), ": " .. flag:GetNVar("FlagOwner") .. " смогли отбить атаку " .. string.lower( activator:getJobTable().category ) .. " на территорию '" .. flag.id .. "'")
            end)
            return false
        end
    end
end

function PlayersOnTerritoryAsEntities(flag, team)
    local pos1 = rp.Conquest.Config[flag.id].coords[1]
    local pos2 = rp.Conquest.Config[flag.id].coords[2]
    local result = {}
    local b
    if pos1[1] > pos2[1] then 
        b = pos1[1]
        pos1[1] = pos2[1]
        pos2[1] = b
    end
    if pos1[2] > pos2[2] then 
        b = pos1[2]
        pos1[2] = pos2[2]
        pos2[2] = b
    end
    if pos1[3] > pos2[3] then 
        b = pos1[3]
        pos1[3] = pos2[3]
        pos2[3] = b
    end


    for k,v in pairs(player.GetAll()) do
        local plypos = v:GetPos()

        if v:getJobTable().category == team then
            if plypos[1] > pos1[1] and plypos[2] > pos1[2] and plypos[3] > pos1[3] then
                if plypos[1] < pos2[1] and plypos[2] < pos2[2] and plypos[3] < pos2[3] then
                    table.insert( result, k, v)
                end
            end 
        end 
    end

    return result
end



local rewardtimer = 0
function HoldingTerritories()
    for k, v in pairs(ents.GetAll()) do -- Проверка на наличие людей на территории флага
        if v:GetClass() == "flag" then
            if v:GetNVar("FlagOwner") ~= "Ничей" then
                local plholding = PlayersOnTerritory(v, v:GetNVar("FlagOwner"))
                if plholding == 0 then
                    if v.losetick < 4 then
                        v.losetick = v.losetick + 1
                    else
                        rp.GlobalChat(CHAT_NONE, Color(255,0,0) ,"[Общая частота] ", Color(128, 128, 128), "Неизвестный", Color(255,255,255), ": " .. v:GetNVar("FlagOwner") .. " бросили свою территорию '" .. v.id .. "'")
                        v:SetNVar("FlagOwner", "Ничей", NETWORK_PROTOCOL_PUBLIC)
                        for _,storage in pairs(ents.GetAll()) do
                            if storage:GetClass() == "conqueststorage" then
                                if storage.id == v.id then
                                    v:SetNVar("FlagOwner", "Ничей", NETWORK_PROTOCOL_PUBLIC)
                                end
                            end
                        end
                        v:SetColor(Color(255,255,255, 0))
                        v.losetick = 0
                    end
                else
                    v.losetick = 0
                end
            end
        end
    end
    -- Выдача наград за удержание
    rewardtimer = rewardtimer + 1
    if rewardtimer >= 10 then
        rewardtimer = 0
        for k, flag in pairs(ents.GetAll()) do
            if flag:GetClass() == "flag" then
                if flag:GetNVar("FlagOwner") ~= "Ничей" then
                    for _,ply in pairs(player.GetAll()) do -- Выдача жалования всем из группировки
                        if flag:GetNVar("FlagOwner") == ply:getJobTable().category then
                            ply:AddMoney(50)
                            ply:ChatPrint( 'Вы получили дополнительное жалование за захваченные территории.' )
                        end
                    end
                    for _,cont in pairs(ents.GetAll()) do
                        if cont:GetClass() == "conqueststorage" then
                            if flag.id == cont.id then
                                local count = 0
                                for k,v in pairs(cont.inv['entity']) do 
                                    count = count + v
                                end
                                -- Обычные награды за территорию
                                if count >= 12 then return end
                                for i = 1,4 do 
                                    cont:AddItem(INV_ENTITY, rp.Conquest.Config[cont.id].rewards[ math.random( #rp.Conquest.Config[cont.id].rewards ) ])
                                end
                                for k,v in pairs(PlayersOnTerritoryAsEntities(flag, flag:GetNVar("FlagOwner"))) do
                                    v:ChatPrint( 'На склад поступила добыча с удерживаемой территории.' )
                                end
                                -- Спец награды
                                
                                for ownername,specrew in pairs(rp.Conquest.SpecRewards) do
                                    if ownername == cont:GetNVar("FlagOwner") then
                                        for specrewid,specrewtbl in pairs(specrew) do
                                            if specrewtbl.territories == cont.id then
                                                for i = 1,2 do
                                                    cont:AddItem(INV_ENTITY, specrewtbl.rewards[ math.random( #specrewtbl.rewards ) ])
                                                end
                                                for k,v in pairs(PlayersOnTerritoryAsEntities(flag, flag:GetNVar("FlagOwner"))) do
                                                    v:ChatPrint( 'Умелое управление территорией позволило найти больше добычи.' )
                                                end
                                            end
                                        end
                                    end
                                end

                            end
                        end
                    end
                end
            end
        end
    end 

end

hook.Add( "InitPostEntity", "SpawnFlagsAndStartTimerForHoldingAndGiveRewards", function()
    SpawnFlags()
    timer.Create( "HoldingTerritoriesTick", 60, 0, HoldingTerritories )
end)