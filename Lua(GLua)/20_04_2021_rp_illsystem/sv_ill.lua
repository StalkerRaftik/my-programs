hook.Add("Initialize", "rp.illness.CreateDB", function()
    db:Query("CREATE TABLE IF NOT EXISTS rp_illnesses(SteamID64 VARCHAR(255) NOT NULL, charid INT(11) NOT NULL PRIMARY KEY, data TEXT NOT NULL)")
end)

hook.Add("PlayerCharLoaded", "rp.illness.IllSetup", function(ply)
    db:Query('SELECT * FROM rp_illnesses WHERE steamid64=' .. ply:SteamID64() .. " AND charid = " .. ply:GetNVar("CurrentChar") .. ';', function(json)
        if json[1] then
            if (json[1].data ~= nil) and json[1].data ~= "[]" then
                data = util.JSONToTable(json[1].data)
                ply:SetIllsFromData(data)
                ply:SendIlls()
            else 
                ply.Ills = {}
            end
        else
            ply.Ills = {}
            db:Query('INSERT INTO rp_illnesses (SteamID64, charid, data) VALUES(?, ?, ?);', ply:SteamID64(), ply:GetNVar("CurrentChar"), util.TableToJSON(ply.Ills))
        end
    end)
end)


util.AddNetworkString("rp.illness.SendIllsToClient")
function PLAYER:SendIlls()
    net.Start("rp.illness.SendIllsToClient")
        net.WriteTable(self.Ills)
    net.Send(self)
end

hook.Add("PlayerDisconnected", "rp.illness.SaveIllsToDB", function(ply)
    _Ill:SaveDataToDB(ply)
end)

timer.Create( "rp.illness.updateBD", 60, 0, function()
    for _,ply in pairs(player.GetAll()) do
        _Ill:SaveDataToDB(ply)
    end
end)






timer.Create("TempUpdate", 10, 0,function()
    for _, v in ipairs(player.GetAll()) do
        if not IsValid(v) or not v:Alive() or v:GetNVar('CharSelected') == 0 then continue end
        if v:IsSOD() then
            continue
        end
        if isbool(v:GetNVar('Temperature')) then continue end

        --print(v:RPName().." TEMP: "..v:GetNVar('Temperature')) --DEBUG
        local firearound = false
        for k, d in pairs(ents.FindInSphere(v:GetPos(), 100)) do
            if d:GetClass() == "sent_vj_fireplace" and d:GetNWBool("VJ_FirePlace_Activated") == true then
                firearound = true
                break
            end
        end

        local isUnderRoof = v:IsUnderRoof()

        if firearound == true then 
            v:SetNVar('Temperature', math.Clamp( v:GetNVar('Temperature') + 5, 0, 100))
        elseif isUnderRoof == true then
            v:SetNVar('Temperature', math.Clamp( v:GetNVar('Temperature') + 1, 0, 100))
        else
            v:SetNVar('Temperature', math.Clamp( v:GetNVar('Temperature') - rp.cfg.DefaultColdRate, 0, 100))
        end

        if v:GetNVar('Temperature') < 10 then
            local rand = math.random(1,1000)
            if rand == 1 then
                v:ChatPrint("Апхчи! Кажется, я заболел...")
                v:AddIll("flu")
            end
            -- v:SetNVar('Temperature', 0, NETWORK_PROTOCOL_PRIVATE)
            if v.ColdSoundTimer and v.ColdSoundTimer <= CurTime() then return end
            v:EmitSound(Sound("lostcity/cold/cold1.mp3"), SNDLVL_45dB)
            v.ColdSoundTimer = CurTime() + 600
        end        
        if v:GetNVar('Temperature') <= 0 then
            -- v:SetNVar('Temperature', 0, NETWORK_PROTOCOL_PRIVATE)
            v:TakeDamage( 1, v, v )
            if v.ColdSoundTimer and v.ColdSoundTimer <= CurTime() then return end
            v:EmitSound(Sound("lostcity/cold/cold1.mp3"), SNDLVL_45dB)
            v.ColdSoundTimer = CurTime() + 600
        end
    end
end)

function PLAYER:SetTemp(int)
    self:SetNVar("Temperature", int, NETWORK_PROTOCOL_PRIVATE)
end

hook.Add("PlayerSpawn", "SetTempOnSpawn", function(ply)
    ply:SetNVar("Temperature", 100, NETWORK_PROTOCOL_PRIVATE)
end)