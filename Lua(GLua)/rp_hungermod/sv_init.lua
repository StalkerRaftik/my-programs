local CurTime 		= CurTime
local math_abs		= math.abs
local math_clamp	= math.Clamp
local math_max 		= math.max


hook.Add("PlayerCharLoaded", "rp.Hunger.SetPlayerHunger", function(ply)
    db:Query('SELECT * FROM player_data WHERE steamid=' .. ply:SteamID64() .. " AND id = " .. ply:GetNVar("CurrentChar") .. ';', function(data)
        if data[1].attributes and data[1].attributes ~= "[]" then
        	print(data[1].attributes)
            local plAttr = util.JSONToTable(data[1].attributes)
            ply:SetHunger(plAttr.hunger)
            ply:SetThirst(plAttr.thirst)
        end
    end)
end)

hook.Add("PlayerDisconnected", "rp.Hunger.SaveAttributesToDB", function(ply)
	if not isnumber(ply:GetNVar('CurrentChar')) then return end

	local plAttr = {
		hunger = ply:GetHunger() or 100,
		thirst = ply:GetThirst() or 100,
	}
	db:Query('UPDATE player_data SET attributes=? WHERE steamid=? AND id =?;', util.TableToJSON(plAttr), ply:SteamID64(), ply:GetNVar('CurrentChar'))
end)



timer.Create("HungerAndThirstUpdate", 10, 0, function()
	for k, v in ipairs(player.GetAll()) do
		if rp.cfg.devmode then continue end
		if not (v:GetNVar('CharSelected') == true) then continue end
		if v:IsSOD() then
			continue
		end
		if IsValid(v) and v:Alive() then
			v:TakeHunger(rp.cfg.HungerTake)
			v:SetThirst(v:GetNVar('Thirst') - rp.cfg.DefaultThirstRate)

			if v:GetNVar('Thirst') < 0 then
				v:SetNVar('Thirst',0,NETWORK_PROTOCOL_PRIVATE)
				v:TakeDamage( 2.5, v, v )
			end
			if v:GetHunger() < 0 then
				v:SetHunger(0)
				v:SetHealth(v:Health() - 2.5)
				v:EmitSound(Sound("lostcity/hunger/h" .. math.random(1, 3) .. ".ogg"), SNDLVL_45dB)
				if (v:Health() <= 0) then
					v:Kill()
				end
			end
		end
	end
end)

hook("PlayerCharLoaded", function(pl)
	pl:SetNVar("Energy", 100, NETWORK_PROTOCOL_PRIVATE)
	pl:SetNVar('Thirst', 100, NETWORK_PROTOCOL_PRIVATE)
end)

function PLAYER:SetHunger(amount, noclamp)
	self:SetNVar('Energy', amount, NETWORK_PROTOCOL_PRIVATE)
end

function PLAYER:SetThirst(num,mclamp)
	if mclamp then
		self:SetNVar('Thirst',math.Clamp( num, 0, 100 ),NETWORK_PROTOCOL_PRIVATE)
	else
		self:SetNVar('Thirst',num,NETWORK_PROTOCOL_PRIVATE)
	end
end

function PLAYER:AddThirst(num)
	self:SetThirst(self:GetThirst() + num,true)
end


function PLAYER:AddHunger(amount)
	self:SetHunger(self:GetHunger() + amount)
end

function PLAYER:TakeHunger(amount)
	self:AddHunger(-math_abs(amount))
end

timer.Create("HealthRegenerationTimer", 60, 0, function()
	for k, v in pairs(player.GetAll()) do
		if IsValid(v) and v:Alive() and (v:GetNVar('CharSelected') == true) and v:GetHunger() >= 80 and v:GetThirst() >= 80 then
			if v:Health() < 100 and v:Alive() then
				if v:Health() > 100 then v:SetHealth(100) end
				v:SetHealth(v:Health() + 5)
			end
		end
	end
end)

-- local function BuyFood(pl, args)
-- 	if args == "" then return "" end
-- 	if not rp.Foods[args] then return "" end

-- 	if pl:GetCount('Food') >= 15 then
-- 		pl:Notify(NOTIFY_ERROR, rp.Term('FoodLimitReached'))
-- 		return
-- 	end

-- 	local trace = {}
-- 	trace.start = pl:EyePos()
-- 	trace.endpos = trace.start + pl:GetAimVector() * 85
-- 	trace.filter = pl

-- 	local tr = util.TraceLine(trace)

-- 	if pl:Team() != TEAM_COOK and team.NumPlayers(TEAM_COOK) > 0 then
-- 		pl:Notify(NOTIFY_ERROR, rp.Term('ThereIsACook'))
-- 		return ""
-- 	end

-- 	if not rp.Foods[args] then return end

-- 	local cost = 50
-- 	if pl:CanAfford(cost) then
-- 		pl:AddMoney(-cost)
-- 	else
-- 		pl:Notify(NOTIFY_ERROR, rp.Term('CannotAfford'))
-- 		return ""
-- 	end

-- 	rp.Notify(pl, NOTIFY_GREEN, rp.Term('RPItemBought'), args, rp.FormatMoney(cost))
	
-- 	local SpawnedFood = ents.Create("spawned_food")
-- 	SpawnedFood:SetPos(tr.HitPos)
-- 	SpawnedFood:SetModel(rp.Foods[args].model)
-- 	SpawnedFood.FoodEnergy = rp.Foods[args].amount
-- 	SpawnedFood.ItemOwner = pl
-- 	SpawnedFood:Spawn()

-- 	pl:_AddCount('Food', SpawnedFood)
-- 	return ""
-- end
-- rp.AddCommand("/buyfood", BuyFood)

