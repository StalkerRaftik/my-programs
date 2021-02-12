function SpawnLootContainers()
    for house, htable in pairs(rp.LootSystem.RandomLoot) do
        for contid, container in pairs(htable) do
            if istable(container) then
            	local containerent = ents.Create("loot_container")
            	-- containerent:SetNVar('LootContainerId', contid, NETWORK_PROTOCOL_PUBLIC)
                containerent.spawnedloot = true
                local stable = table.Random(container.pos)
            	containerent:SetPos(stable[1])
            	containerent:SetAngles(stable[2])
            	containerent:SetModel(container.model)
            	containerent:Spawn()
            	local phys = containerent:GetPhysicsObject()
            	if IsValid(phys) then
            	    phys:EnableMotion(false)
            	end
            	constraint.RemoveAll(containerent)
                for i=1, 5 do
                    local chanceitems = math.Rand(0, 1)
                    for _, itemtable in pairs(container.loot) do
                        if itemtable.chance1 <= chanceitems and itemtable.chance2 > chanceitems then
                            containerent:AddItem(itemtable.type, itemtable.loot[math.random(#itemtable.loot)], itemtable.count)    
                            break             
                        end
                    end
                end       
            end
        end
    end  
	-- for house, fltable in pairs(rp.LootSystem.RandomFloorLoot) do
	--     for i=1, 3 do
	--         for _, itemtable in pairs(fltable.floorloot) do
	--             local chanceitems = math.Rand(0, 1)
	--             if itemtable.chance1 <= chanceitems and chanceitems < itemtable.chance2 then
	--                 if itemtable.type == INV_WEAPON then
	--                     for k, v in pairs(rp.shipments) do
	--                         local sloot = itemtable.loot[math.random(#itemtable.loot)]
	--                         if v.entity == sloot then
	--                             local weapon = ents.Create("spawned_weapon")
	--                             weapon:SetModel(v.model)
	--                             weapon.weaponclass = v.entity
	--                             weapon.ShareGravgun = true
	--                             weapon:SetPos(rp.LootSystem.RandomVector(house))
	--                             weapon.ammoadd = weapons.Get(v.entity) and (v.spareammo or weapons.Get(v.entity).Primary.DefaultClip)
	--                             weapon.clip1 = v.clip1
	--                             weapon.clip2 = v.clip2
	--                             weapon.nodupe = true
	--                             weapon:Spawn()
	--                             weapon:DropToFloor()
	--                             weapon.Loot = true
	--                             local phys = weapon:GetPhysicsObject()
	--                             if IsValid(phys) then
	--                                 phys:EnableMotion(false)
	--                             end
	--                             constraint.RemoveAll(weapon)
	--                         end
	--                     end
	--                 elseif itemtable.type == INV_ENTITY then
	--                     for k, v in pairs(rp.entities) do
	--                         local sloot = itemtable.loot[math.random(#itemtable.loot)]
	--                         if v.ent == sloot then
	--                             local item = ents.Create(v.ent)
	--                             item.dt = item.dt or {}
	--                             item:SetPos(rp.LootSystem.RandomVector(house))
	--                             item.onlyremover = true
	--                             item.allowed = v.allowed
	--                             item.DarkRPItem = v
	--                             item:Spawn()
	--                             item:DropToFloor()
	--                             item.Loot = true
	--                             local phys = item:GetPhysicsObject()
	--                             if IsValid(phys) then
	--                                 phys:EnableMotion(false)
	--                             end
	--                             constraint.RemoveAll(item) 
	--                         end
	--                     end
	--                 elseif itemtable.type == INV_FOOD then
	--                     for k, v in pairs(rp.Foods) do
	--                         local sloot = itemtable.loot[math.random(#itemtable.loot)]
	--                         if v.model == sloot then    
	--                             local item = v
	--                             local SpawnedFood = ents.Create("spawned_food")
	--                             SpawnedFood.ShareGravgun = true
	--                             SpawnedFood:SetPos(rp.LootSystem.RandomVector(house))
	--                             SpawnedFood.onlyremover = true
	--                             SpawnedFood:SetFoodAmount(v.amount or 0)
	--                             SpawnedFood:SetThirstAmount(v.thirst or 0)
	--                             SpawnedFood:SetModel(v.model)
	--                             SpawnedFood.FoodName = v.name
	--                             SpawnedFood.FoodPrice = v.price
	--                             SpawnedFood:Spawn()
	--                             SpawnedFood:DropToFloor()
	--                             SpawnedFood.Loot = true
	--                             local phys = SpawnedFood:GetPhysicsObject()
	--                             if IsValid(phys) then
	--                                 phys:EnableMotion(false)
	--                             end
	--                             constraint.RemoveAll(SpawnedFood)
	--                         end
	--                     end
	--                 elseif itemtable.type == INV_HATS then
	           
	--                     for k, v in pairs(Cosmetics.Items) do
	--                         local sloot = itemtable.loot[math.random(#itemtable.loot)]
	--                         if k == sloot then
	--                             if not v.dropblock then
	--                                 local SpawnedFood = ents.Create("rp_cosmetics")
	--                                 SpawnedFood:SetPos(rp.LootSystem.RandomVector(house))
	--                                 SpawnedFood:Spawn()
	--                                 SpawnedFood:SetCosmeticType(sloot)
	--                                 SpawnedFood:SetModel(v.model)
	--                                 SpawnedFood.Loot = true
	--                                 SpawnedFood:DropToFloor()
	--                                 local phys = SpawnedFood:GetPhysicsObject()
	--                                 if IsValid(phys) then
	--                                     phys:EnableMotion(false)
	--                                 end
	--                                 constraint.RemoveAll(SpawnedFood)
	--                             else
	--                                 DarkRP.notify(ply, 4, NOTIFY_ERROR, "Вы не можете выбросить "..v.name)
	--                             end
	--                         end
	--                     end
	--                 elseif itemtable.type == INV_CLOTHES then
	--                     for k, v in pairs(Cosmetics.Female.ListBottoms) do
	--                         local sloot = itemtable.loot[math.random(#itemtable.loot)]
	--                         if v.texture == sloot then
	--                             local ent = ents.Create("cm_cloth")
	--                             ent:SetModel("models/props_junk/cardboard_box003a.mdl")
	--                             ent:SetPos( rp.LootSystem.RandomVector(house) )
	--                             ent:Spawn()
	--                             ent:SetCName(k)
	--                             ent.Type = 2
	--                             ent.Sex = 1
	--                             ent.Texture = v.texture
	--                             ent.Loot = true
	--                             ent:DropToFloor()
	--                             local phys = ent:GetPhysicsObject()
	--                             if IsValid(phys) then
	--                                 phys:EnableMotion(false)
	--                             end
	--                             constraint.RemoveAll(ent)
	--                         end
	--                     end
	--                     for k, v in pairs(Cosmetics.Female.ListTops) do
	--                         local sloot = itemtable.loot[math.random(#itemtable.loot)]
	--                         if v.texture == sloot then
	--                             local ent = ents.Create("cm_cloth")
	--                             ent:SetModel("models/props_junk/cardboard_box003a.mdl")
	--                             ent:SetPos( rp.LootSystem.RandomVector(house) )
	--                             ent:Spawn()
	--                             ent:SetCName(k)
	--                             ent.Type = 1.2
	--                             ent.Sex = 1
	--                             ent.Texture = v.texture
	--                             ent.Loot = true
	--                             ent:DropToFloor()
	--                             local phys = ent:GetPhysicsObject()
	--                             if IsValid(phys) then
	--                                 phys:EnableMotion(false)
	--                             end
	--                             constraint.RemoveAll(ent)
	--                         end
	--                     end
	--                     for k, v in pairs(Cosmetics.Male.ListBottoms) do
	--                         local sloot = itemtable.loot[math.random(#itemtable.loot)]
	--                         if v.texture == sloot then
	--                             local ent = ents.Create("cm_cloth")
	--                             ent:SetModel("models/props_junk/cardboard_box003a.mdl")
	--                             ent:SetPos( rp.LootSystem.RandomVector(house) )
	--                             ent:Spawn()
	--                             ent:SetCName(k)
	--                             ent.Type = 2
	--                             ent.Sex = 1
	--                             ent.Texture = v.texture
	--                             ent.Loot = true
	--                             ent:DropToFloor()
	--                             local phys = ent:GetPhysicsObject()
	--                             if IsValid(phys) then
	--                                 phys:EnableMotion(false)
	--                             end
	--                             constraint.RemoveAll(ent)
	--                         end
	--                     end
	--                     for k, v in pairs(Cosmetics.Male.ListTops) do
	--                         local sloot = itemtable.loot[math.random(#itemtable.loot)]
	--                         if v.texture == sloot then
	--                             local ent = ents.Create("cm_cloth")
	--                             ent:SetModel("models/props_junk/cardboard_box003a.mdl")
	--                             ent:SetPos( rp.LootSystem.RandomVector(house) )
	--                             ent:Spawn()
	--                             ent:SetCName(k)
	--                             ent.Type = 1.2
	--                             ent.Sex = 1
	--                             ent.Texture = v.texture
	--                             ent.Loot = true
	--                             ent:DropToFloor()
	--                             local phys = ent:GetPhysicsObject()
	--                             if IsValid(phys) then
	--                                 phys:EnableMotion(false)
	--                             end
	--                             constraint.RemoveAll(ent)
	--                         end
	--                     end         
	--                 end
	--             end
	--         end  
	--     end
	-- end

end

function RespawnLootContainers()
    for k, v in pairs(ents.GetAll()) do
        if v:GetClass() == "loot_container" then
            if v.spawnedloot then v:Remove()end
        end
        if v.Loot then v:Remove() end
    end
    SpawnLootContainers()
end

hook.Add( "InitPostEntity", "rp.LootSystem.InitSpawn", function()
    RespawnLootContainers()
end)

timer.Create("rp.LootSystem.RespawnTimer", rp.LootSystem.RespawnTimer, 0, function()
    RespawnLootContainers()
end)