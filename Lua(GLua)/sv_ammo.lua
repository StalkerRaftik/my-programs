function PLAYER:UpdateAmmo(class)
	if not rp.Ammo[class] then return end

	local ammo = 0
	for key, tbl in pairs(self.inv[INV_ENTITY][class]) do
		ammo = ammo + tbl.count
	end
	self:SetAmmo(ammo, game.GetAmmoID(rp.Ammo[class].AmmoType))
end

function PLAYER:UpdateAllAmmo()
	if not self.inv then return end
	self:StripAmmo()
	for class, classtbl in pairs(self.inv[INV_ENTITY]) do
		if not rp.Ammo[class] then continue end

		local ammo = 0
		for key, itemtbl in pairs(classtbl) do
			ammo = ammo + itemtbl.count
		end
		self:SetAmmo(ammo, game.GetAmmoID(rp.Ammo[class].AmmoType))
	end
end

hook.Add( "rp.inv.AddItem", "UpdateAmmoAfterAddItem", function(ply, type, class)
	ply:UpdateAmmo(class)
end )

hook.Add( "rp.inv.RemoveItem", "UpdateAmmoAfterRemoveItem", function(ply, type, class)
	ply:UpdateAmmo(class)
end )

hook.Add("PlayerCharLoaded", "RestorePlayerAmmo", function(ply)
	ply:UpdateAllAmmo()
end)

hook.Add("PlayerDeath", "PlayerDeathAmmoSave", function(ply)
	ply:StripAmmo()
end)

hook.Add("PlayerSpawn", "GiveAmmoBackSpawn", function(ply)
	ply:UpdateAllAmmo()
end)

hook.Add("PlayerAmmoChanged", "AmmoInventorySync", function(ply, ammoID, oldCount, newCount)
	local ammoName = game.GetAmmoName(ammoID)
	local class = rp.AmmoClass[ammoName] and rp.AmmoClass[ammoName].AmmoType
	if not class then return end

	if newCount == 0 and ply.inv[INV_ENTITY] and ply.inv[INV_ENTITY][class] then
		ply.inv[INV_ENTITY][class] = nil
		db:Query('UPDATE darkrp_inventory SET data=? WHERE steamid64=' .. ply:SteamID64() .. ' AND charid='..ply:GetNVar('CurrentChar')..';', util.TableToJSON(ply.inv))
		ply:UpdateInventory(INV_ENTITY)
		ply:UpdateInventory()
	elseif newCount ~= 0 then
		if ply.inv[INV_ENTITY] and ply.inv[INV_ENTITY][class] and ply.inv[INV_ENTITY][class][1] and ply.inv[INV_ENTITY][class][1].count then
			ply.inv[INV_ENTITY][class][1].count = newCount
		elseif ply.inv[INV_ENTITY] then
			ply.inv[INV_ENTITY][class] = {}
			local tbl = {}
			tbl.count = newCount
			table.insert(ply.inv[INV_ENTITY][class], tbl)
		end
		db:Query('UPDATE darkrp_inventory SET data=? WHERE steamid64=' .. ply:SteamID64() .. ' AND charid='..ply:GetNVar('CurrentChar')..';', util.TableToJSON(ply.inv))
		ply:UpdateInventory(INV_ENTITY)
		ply:UpdateInventory()
	end
end)

hook.Add( "TFA_CompleteReload", "RemoveAmmoAfterReload", function(wep)
	local maxclip = wep:GetPrimaryClipSizeForReload(true)
	local curclip = wep:Clip1()
	local amounttoreplace = math.min(maxclip - curclip, wep:Ammo1())
	local ply = wep:GetOwner()
	local ammotype = string.lower(game.GetAmmoName(wep:GetPrimaryAmmoType()))
	for class, tbl in pairs(rp.Ammo) do
		if string.lower(tbl.AmmoType) == ammotype and ply.inv[INV_ENTITY][class] and ply.inv[INV_ENTITY][class][1] and ply.inv[INV_ENTITY][class][1].count then
			ply.inv[INV_ENTITY][class][1].count = ply.inv[INV_ENTITY][class][1].count - amounttoreplace
			if ply:IsPlayer() then
				db:Query('UPDATE darkrp_inventory SET data=? WHERE steamid64=' .. ply:SteamID64() .. ' AND charid='..ply:GetNVar('CurrentChar')..';', util.TableToJSON(ply.inv))
				ply:UpdateInventory(INV_ENTITY)
				ply:UpdateInventory()
			end
		end
	end
end )

-- Немного другое, но тоже с патрошками связано
hook.Add("PlayerDisconnected", "PlayerDisconnectedSaveAmmoInEquipedGuns", function(ply)
	ply:SavePlayerData("cosmetics", ply.Cosmetics)
end)