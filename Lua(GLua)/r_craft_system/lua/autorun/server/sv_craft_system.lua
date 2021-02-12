util.AddNetworkString("R_CraftSystem.OpenMenu")
util.AddNetworkString("R_CraftSystem.Craft")
util.AddNetworkString("R_CraftSystem.Disassembly")

local function CanCraftRecipe(ply, recipe)
	local can_craft = true
	for k,v in pairs(recipe) do
		local has = ply:HaveItem("entity", k, v)
		if not has then
			can_craft = false
		end
	end
	return can_craft
end

net.Receive("R_CraftSystem.Craft", function(_, ply)
	local r_name = net.ReadString()
	if not r_name then return end
	local recipe = R_CraftSystem.Recipes[r_name]
	if not recipe then return end
	local category

	for k, v in pairs(R_CraftSystem.Categories) do
		if v.name == recipe.category then 
			category = v.category
		end
	end

	if not category then return false end

	local item = Inventory.GetItem( category, r_name )
	if not item then DarkRP.notify(ply, 1, 4, "Кажется что-то пошло не так, сообщите администрации об этом.") return false end

	if ply.craft_used and ply.craft_used > CurTime() then 
		DarkRP.notify(ply, 1, 4, "Вы должны подождать "..math.Round(ply.craft_used - CurTime()).."с!")
		return false
	end

	ply.craft_used = CurTime() + R_CraftSystem.UsageCooldown

	if CanCraftRecipe(ply, recipe.recipe) then
		for k,v in pairs(recipe.recipe) do
			ply:RemoveItem( "entity", k, v )
		end
		ply:AddItem( category, r_name, 1 )

		DarkRP.notify(ply, 0, 4, "Вы скрафтили "..recipe.name..".")
	end

end)


net.Receive("R_CraftSystem.Disassembly", function(_, ply)
	local r_name = net.ReadString()
	if not r_name then return end
	local item = R_CraftSystem.Disassembly[r_name]
	if not item then return end

	local has_item = ply:HaveItem("entity", r_name)
	if not has_item then 
		DarkRP.notify(ply, 1, 4, "У тебя нет этого предмета!")
		return false
	end
	
	ply:RemoveItem("entity", r_name, 1 )

	for k,v in pairs(item.player_get) do
		for i=1, v do
			local item2 = Inventory.GetItem( "entity", k )
			if not item2 then DarkRP.notify(ply, 1, 4, "Кажется что-то пошло не так, сообщите администрации об этом.") return false end
			ply:AddItem("entity", k)
		end
	end

	local itemname = Inventory.GetItem( "entity", r_name )
	if not itemname then DarkRP.notify(ply, 1, 4, "Кажется что-то пошло не так, сообщите администрации об этом.") return false end

	DarkRP.notify(ply, 0, 4, "Вы разобрали "..itemname.name..".")
end)