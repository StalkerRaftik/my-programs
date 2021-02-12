util.AddNetworkString("rp.illness.SendIllToClient")

hook.Add("Initialize", "rp.illness.CreateDB", function()
	db:Query("CREATE TABLE IF NOT EXISTS rp_illnesses(SteamID64 VARCHAR(255) NOT NULL, charid INT(11) NOT NULL PRIMARY KEY, data TEXT NOT NULL)")
end)

hook.Add("PlayerCharLoaded", "rp.illness.IllSetup", function(ply)
    db:Query('SELECT * FROM rp_illnesses WHERE SteamID64=' .. ply:SteamID64() .. " AND charid = " .. ply:GetNVar("CurrentChar") .. ';', function(data)
        if data[1] then
            if (data[1].data ~= nil) and data[1].data ~= "[]" then
                ply.ills = util.JSONToTable(data[1].data)
                ply:SendIlls(ply.ills)
            else 
            	ply.ills = {}
            end
        else
        	ply.ills = {}
        	db:Query('INSERT INTO rp_illnesses (SteamID64, charid, data) VALUES(?, ?, ?);', ply:SteamID64(), ply:GetNVar("CurrentChar"), util.TableToJSON(ply.ills))
        end
    end)
end)

function PLAYER:AddIll(ill) 
	self.ills[ill] = true
	self:SendIlls(self.ills)
end

function PLAYER:RemoveIll(ill) 
	if self.ills[ill] then
		self.ills[ill] = nil
	end
	self:SendIlls(self.ills)
end

function PLAYER:SendIlls(tbl)
	net.Start("rp.illness.SendIllToClient")
	    net.WriteTable(self.ills)
	net.Send(self)
end

hook.Add("PlayerDisconnected", "rp.illness.SaveIllsToDB", function(ply)
	db:Query('UPDATE rp_illnesses SET data=' .. util.TableToJSON(ply.ills) .. 'WHERE SteamID64=' .. ply:SteamID64() .. ' AND charidid='..ply:GetNVar('CurrentChar')..';')
end)

timer.Create( "rp.illness.updateBD", 60, 0, function()
	for k,v in pairs(player.GetAll()) do
		if v.ills then
			db:Query("UPDATE rp_illnesses SET data = '" .. util.TableToJSON(v.ills, false) .. "' WHERE SteamID64 = '" .. v:SteamID64() .. "' AND charid='" ..v:GetNVar('CurrentChar').."'")
		end
	end
end)

timer.Create("TempUpdate", 5, 0,function()
	-- for _, v in ipairs(player.GetAll()) do
	-- 	if not IsValid(v) or not v:Alive() or v:GetNVar('CharSelected') == 0 then continue end
	-- 	if v:IsSOD() then
	-- 		continue
	-- 	end
	-- 	if isbool(v:GetNVar('Temperature')) then continue end

 --        print(v:RPName().." TEMP: "..v:GetNVar('Temperature')) --DEBUG
 --        local firearound = false
 --        for k, d in pairs(ents.FindInSphere(v:GetPos(), 100)) do
 --            if d:GetClass() == "sent_vj_fireplace" then
 --                firearound = true
 --               	break
 --            end
 --        end

 --        if firearound == true then 
 --        	v:SetNVar('Temperature', math.Clamp( v:GetNVar('Temperature') + 5, 0, 100))
 --        else
 --        	v:SetNVar('Temperature', math.Clamp( v:GetNVar('Temperature') - rp.cfg.DefaultColdRate, 0, 100))
 --        end

	-- 	if v:GetNVar('Temperature') < 30 then
	-- 		-- v:SetNVar('Temperature', 0, NETWORK_PROTOCOL_PRIVATE)
 --            if v.ColdSoundTimer and v.ColdSoundTimer <= CurTime() then return end
 --            v:EmitSound(Sound("lostcity/cold/cold1.mp3"), SNDLVL_45dB)
 --            v.ColdSoundTimer = CurTime() + 600
	-- 	end        
	-- 	if v:GetNVar('Temperature') <= 0 then
	-- 		-- v:SetNVar('Temperature', 0, NETWORK_PROTOCOL_PRIVATE)
	-- 		v:TakeDamage( 5, v, v )
 --            if v.ColdSoundTimer and v.ColdSoundTimer <= CurTime() then return end
 --            v:EmitSound(Sound("lostcity/cold/cold1.mp3"), SNDLVL_45dB)
 --            v.ColdSoundTimer = CurTime() + 600
	-- 	end
	-- end
end)

function PLAYER:SetTemp(int)
    self:SetNVar("Temperature", int, NETWORK_PROTOCOL_PRIVATE)
end