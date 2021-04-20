rp.curLoot = rp.curLoot or {}

function SpawnLootOnFloor()
    local id = 1
    for type, typetbl in pairs(rp.LootSystem.RandomLoot) do
        for _, place in pairs(typetbl.places) do
            
            -- Если нет шансов - создаем их
            local chanceSummary = 0

            for lootid, loot in pairs(typetbl.loot) do
                if (not loot.chance1 or not loot.chance2) then
                    loot.chance1 = chanceSummary
                    loot.chance2 = chanceSummary + loot.chance
                end
                chanceSummary = chanceSummary + loot.chance
            end
            

            local spawnposes = table.Copy(place.poses)
            local cyclesAmount = place.count or 5
            if #place.poses < cyclesAmount then cyclesAmount = #place.poses end
            
            for i=1, cyclesAmount do
                local chanceitems = math.Rand(0, chanceSummary)
                for lootname1, loottable1 in pairs(typetbl.loot) do
                    if loottable1.chance1 < chanceitems and loottable1.chance2 >= chanceitems then


                        for lootname, loottable in pairs(rp.LootSystem.LootTypes) do
                            if lootname == lootname1 then

                                    local item = loottable.loot[math.random(1, #loottable.loot)]
                                    local tblkey = math.random(1, #spawnposes)
                                    local pos = spawnposes[tblkey]
                                    table.remove( spawnposes, tblkey)

                                    rp.curLoot[id] = {
                                        item = item, 
                                        pos = pos,
                                        type = loottable.type,
                                        spawned = false,
                                    }
                                    if IsPlayersAround(pos) then 
                                        SpawnLoot(item, pos, loottable.type, id)
                                        rp.curLoot[id].spawned = true
                                    end
                                    id = id + 1 
                                break
                            end
                        end  
                        break   


                    end
                end
            end 
        end
    end  
end


function SpawnLootContainers()
    for type, typetbl in pairs(rp.LootSystem.RandomLootContainers) do
        for _, variant in pairs(typetbl.variants) do
            for _, pos in pairs(variant.pos) do
                local containerent = ents.Create("loot_container")
                -- containerent:SetNVar('LootContainerId', contid, NETWORK_PROTOCOL_PUBLIC)
                containerent.spawnedloot = true
                containerent:SetPos(pos[1])
                containerent:SetAngles(pos[2])
                containerent:SetModel(variant.model)
                containerent:Spawn()
                local phys = containerent:GetPhysicsObject()
                if IsValid(phys) then
                    phys:EnableMotion(false)
                end
                constraint.RemoveAll(containerent)

                -- Если нет шансов - создаем их
                local chanceSummary = 0

                for lootid, loot in pairs(typetbl.loot) do
                    if (not loot.chance1 or not loot.chance2) then
                        loot.chance1 = chanceSummary
                        loot.chance2 = chanceSummary + loot.chance
                    end
                    chanceSummary = chanceSummary + loot.chance
                end


                local cyclesAmount = 5
                for i=1, cyclesAmount do
                    local chanceitems = math.Rand(0, chanceSummary)
                    for lootname1, loottable1 in pairs(typetbl.loot) do
                        if loottable1.chance1 <= chanceitems and loottable1.chance2 > chanceitems then
                            for lootname, loottable in pairs(rp.LootSystem.LootTypes) do
                                if lootname == lootname1 then
                                    for i = 1, math.random(loottable1.count[1], loottable1.count[2]) do 
                                        containerent:AddItem(loottable.type, loottable.loot[math.random(#loottable.loot)], 1)    
                                    end
                                    break
                                end
                            end  
                            break         
                        end
                    end
                end 
            end
        end
    end  
end


function DeleteLoot()
    rp.curLoot = {}
    for _,ent in pairs(ents.GetAll()) do
        if ent.IsLoot then 
            ent:Remove()
        end
    end
end

function IsPlayersAround(pos, radius)
    radius = radius or 4000
    for _,ply in pairs(player.GetAll()) do
        if pos:DistToSqr(ply:GetPos()) < radius*radius then 
            return true
        end
    end
    return false
end

timer.Create("rp.LootSystem.SpawnNewRadiation", 1800, 0, function()
    SpawnRadEnts()
end)

concommand.Add("lootTest", function( ply, cmd, args )
    ply:ChatPrint("Лут на полу:")
    local successCheck = true
    for type, typetbl in pairs(rp.LootSystem.RandomLoot) do
        local summarychance = 0
        for _, variant in pairs(typetbl.loot) do
            summarychance = summarychance + variant.chance
        end
        if summarychance ~= 100 then
            successCheck = false
            ply:ChatPrint( type .. " имеет " .. summarychance .. " суммарных процентов шанса")
        end
    end
    if successCheck == true then
        ply:ChatPrint("Лут на полу успешно прошел проверку")
    end

    ply:ChatPrint("Лут в ящиках:")
    local successCheck = true
    for type, typetbl in pairs(rp.LootSystem.RandomLootContainers) do
        local summarychance = 0
        for _, variant in pairs(typetbl.loot) do
            summarychance = summarychance + variant.chance
        end
        if summarychance ~= 100 then
            successCheck = false
            ply:ChatPrint( type .. " имеет " .. summarychance .. " суммарных процентов шанса")
        end
    end
    if successCheck == true then
        ply:ChatPrint("Лут в ящиках успешно прошел проверку")
    end
end)

function RespawnLootContainers()
    for k, v in pairs(ents.GetAll()) do
        if v:GetClass() == "loot_container" then
            if v.spawnedloot then v:Remove() end
        end
        if v.Loot then v:Remove() end
    end
    SpawnLootContainers()
end

hook.Add( "InitPostEntity", "rp.LootSystem.InitSpawn", function()
    SpawnLootContainers()
    SpawnLootOnFloor()
end)

timer.Create("rp.LootSystem.RespawnTimer", rp.LootSystem.RespawnTimer, 0, function()
    DeleteLoot()
    RespawnLootContainers()
    SpawnLootOnFloor()
    SpawnRocks()
end)




-------------------------------------------
-------------------------------------------
-------------------------------------------



timer.Create("rp.LootSystem.PlayerNearLootTimer", 20, 0, function()
    for k, loot in pairs(rp.curLoot) do 


        local plyexist = IsPlayersAround(loot.pos)
        if loot.spawned == false and plyexist then
            SpawnLoot(loot.item, loot.pos, loot.type, k) 
            loot.spawned = true
        elseif loot.spawned and not plyexist then
            for k,v in pairs(ents.GetAll()) do 
                if v.IsLoot and v.id == k then
                    v:Remove()
                    loot.spawned = false
                    break
                end
            end
        end


    end
end)

function SpawnLoot(class, pos, type, id)
    if type == INV_WEAPON then
            for k, v in pairs(rp.shipments) do
                if v.entity == class then
                    local weapon = ents.Create("spawned_weapon")
                    weapon:SetModel(v.model)
                    weapon.weaponclass = v.entity
                    weapon.ShareGravgun = true
                    weapon:SetPos(pos)
                    weapon.nodupe = true
                    weapon.id = id
                    weapon:Spawn()
                    weapon.IsLoot = true
                    weapon:DropToFloor()
                -- weapon:CPPISetOwner(ply)
                -- weapon:SetNVar('PropOwner', ply, NETWORK_PROTOCOL_PUBLIC)
                    weapon:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
                    break
                end
            end
        elseif type == INV_ENTITY then
            for k, v in pairs(rp.entities) do
                if v.ent == class then
                    local item = ents.Create(v.ent)
                    item.dt = item.dt or {}
                    --if item.Setowning_ent then item:Setowning_ent(ply) end
                    item:SetPos(pos)
                    item.onlyremover = true
                    item.allowed = v.allowed
                    item.DarkRPItem = v
                    item:Spawn()
                    item.id = id
                    item:DropToFloor()
                    item.IsLoot = true
                -- item:CPPISetOwner(ply)
                -- item:SetNVar('PropOwner', ply, NETWORK_PROTOCOL_PUBLIC)
                    item:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
                    break
                end
            end
        elseif type == INV_FOOD then
            for k, v in pairs(rp.Foods) do
                if v.model == class then    
                    local item = v
                    local SpawnedFood = ents.Create("spawned_food")
                --  SpawnedFood:Setowning_ent(ply)
                    SpawnedFood.ShareGravgun = true
                    SpawnedFood:SetPos(pos)
                    SpawnedFood.onlyremover = true
                    SpawnedFood:SetFoodAmount(v.amount or 0)
                    SpawnedFood:SetThirstAmount(v.thirst or 0)
                    SpawnedFood:SetModel(v.model)
                    SpawnedFood.FoodName = v.name
                    SpawnedFood.id = id
                    --SpawnedFood.FoodEnergy = v.energy
                    SpawnedFood.FoodPrice = v.price
                    SpawnedFood:Spawn()
                    SpawnedFood:DropToFloor()
                    SpawnedFood.IsLoot = true
                -- SpawnedFood:CPPISetOwner(ply)
                -- SpawnedFood:SetNVar('PropOwner', ply, NETWORK_PROTOCOL_PUBLIC)
                SpawnedFood:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
                end
            end
        elseif type == INV_HATS then
            for k, v in pairs(Cosmetics.Items) do
                    if k == class then
                        local SpawnedHat = ents.Create("rp_cosmetics")
                        SpawnedHat:SetModel(v.model)
                        SpawnedHat:SetSkin(v.skin or 0)                   
                        SpawnedHat:SetPos(pos + Vector(0,0,15))
                        SpawnedHat:DropToFloor()
                        SpawnedHat:Spawn()
                        SpawnedHat.IsLoot = true
                        SpawnedHat.id = id
                        SpawnedHat:DropToFloor()
                        -- SpawnedFood:CPPISetOwner(ply)
                        -- SpawnedFood:SetNVar('PropOwner', ply, NETWORK_PROTOCOL_PUBLIC)
                        SpawnedHat:SetCosmeticType(class)
                        SpawnedHat:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
                    end
            end
        elseif type == INV_CLOTHES then
            for k, v in pairs(Cosmetics.Female.ListBottoms) do
                    if k == class then
                        local ent = ents.Create("cm_cloth")
                        ent:SetModel("models/props_junk/cardboard_box003a.mdl")
                        ent:SetPos( pos )
                        ent:Spawn()
                        ent:SetCName(k)
                        ent.Type = 2
                        ent.Sex = 1
                        ent.id = id
                        ent:DropToFloor()
                        ent.IsLoot = true
                        ent.Texture = v.texture
                        ent:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
                        return true
                    end
                end
                for k, v in pairs(Cosmetics.Female.ListTops) do
                    if k == class then
                        local ent = ents.Create("cm_cloth")
                        ent:SetModel("models/props_junk/cardboard_box003a.mdl")
                        ent:SetPos( pos )
                        ent:Spawn()
                        ent:SetCName(k)
                        ent.Type = 1.2
                        ent.Sex = 1
                        ent.id = id
                        ent:DropToFloor()
                        ent.IsLoot = true
                        ent.Texture = v.texture
                        ent:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
                        return true
                    end
                end
                for k, v in pairs(Cosmetics.Male.ListBottoms) do
                    if k == class then
                        local ent = ents.Create("cm_cloth")
                        ent:SetModel("models/props_junk/cardboard_box003a.mdl")
                        ent:SetPos( pos )
                        ent:Spawn()
                        ent:SetCName(k)
                        ent.Type = 2
                        ent.Sex = 1
                        ent.id = id
                        ent:DropToFloor()
                        ent.IsLoot = true
                        ent.Texture = v.texture
                        ent:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
                        return true
                    end
                end
                for k, v in pairs(Cosmetics.Male.ListTops) do
                    if k == class then
                        local ent = ents.Create("cm_cloth")
                        ent:SetModel("models/props_junk/cardboard_box003a.mdl")
                        ent:SetPos( pos )
                        ent:Spawn()
                        ent:SetCName(k)
                        ent.Type = 1.2
                        ent.Sex = 1
                        ent.id = id
                        ent:DropToFloor()
                        ent.IsLoot = true
                        ent.Texture = v.texture
                        ent:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
                        return true
                    end
                end         
        end
end

function SpawnRocks()
    for key, info in pairs(rp.LootSystem.Rocks) do
        local vec = info.tbl[1]
        local ang = info.tbl[2]
        local exist = info.exist or false
        local shouldspawn = math.random(1,2)
        if not exist and shouldspawn == 1 then 
            info.exist = true
            local rock = ents.Create("ent_rock")
            rock:SetPos(vec)
            rock:SetAngles(ang)
            rock:Spawn()
            rock.id = key
            local phys = rock:GetPhysicsObject()
            if IsValid(phys) then
                phys:EnableMotion(false)
            end
            constraint.RemoveAll(rock)
        end
    end
end

function SpawnRadEnts()
    if not rp.LootSystem.RadEnts then return end

    for key, info in pairs(rp.LootSystem.RadEnts) do
        if info.ent then 
            info.ent:Remove()
            info.ent = nil
        end
    end

    local newrad = rp.LootSystem.RadEnts[math.random(1, #rp.LootSystem.RadEnts)]
    local radent = ents.Create("rp_newradiation")
    radent:SetPos(newrad.pos)
    radent:SetAngles(newrad.ang)
    radent:Spawn()
    local phys = radent:GetPhysicsObject()
    if IsValid(phys) then
        phys:EnableMotion(false)
    end
    constraint.RemoveAll(radent)
    newrad.ent = radent
end