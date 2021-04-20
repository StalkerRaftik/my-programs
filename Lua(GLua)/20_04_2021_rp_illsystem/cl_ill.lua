net.Receive( "rp.illness.SendIllsToClient", function()
    LocalPlayer():SetIllsFromData(net.ReadTable())
end )


local PANEL = {}

function PANEL:Init()
    LocalPlayer().Ills = LocalPlayer().Ills or {}

    local text = ""
    text = text .. "Кровь: " .. LocalPlayer():Health()*120 .. " л.\n\n"

    local hunger = LocalPlayer():GetHunger()
    local htext = ""
    if hunger > 80 then htext = "сытый"
    elseif hunger > 50 then htext = "немного проголодался"
    elseif hunger > 20 then htext = "голоден"
    elseif hunger > 0 then htext = "очень голоден"
    else htext = "умираю с голоду" end
    text = text .. "Голод: " .. htext .. "\n\n"

    local thirst = LocalPlayer():GetThirst()
    local ttext = ""
    if thirst > 80 then ttext = "не хочу пить"
    elseif thirst > 50 then ttext = "немного хочу пить"
    elseif thirst > 20 then ttext = "хочу пить"
    elseif thirst > 0 then ttext = "очень хочу пить"
    else ttext = "умираю с жажды" end
    text = text .. "Жажда: " .. ttext .. "\n\n"
    
    text = text .. "Болезни: " .. "\n"
    for name,ill in pairs(LocalPlayer().Ills) do
        text = text .. name
    end

    self.rewardsdesc = self:Add( "DLabel")
    self.rewardsdesc:Dock(TOP)    
    self.rewardsdesc:SetTall(70)
    self.rewardsdesc:DockPadding(5,0,5,5)
    self.rewardsdesc:DockMargin(5,30,5,5)
    self.rewardsdesc:SetWrap(true)
    self.rewardsdesc:SetAutoStretchVertical( true )
    self.rewardsdesc:SetText(text)
    self.rewardsdesc:SetFont("rp.ui.24")
    self.rewardsdesc:SetWrap(true)
    self.rewardsdesc:SetContentAlignment(7)

    -- self.limbpanel = self.Add("Limb.Panel")
    -- self.limbpanel:Dock(TOP)    
end

vgui.Register('rp.HealthMenu', PANEL, 'monoPanel')

-- local PANEL = {}
--     local tickmat = Material("eft/tickmat.png")
--     local damagepanel = Material("eft/damagepanel.png")
--     local brokenmat = Material("eft/fracture.png")
--     local bleedingmat = Material("eft/bleeding.png")
--     local framemat = Material("eft/framemat.png")
--     local butmat = "eft/butmat.png"
--     local body  = "eft/body.png"

--     function PANEL:Init()
--         self:SetSize(505, 699)
--         self:Center()
--         self:MakePopup()
--         self:ShowCloseButton(false)
--         self:SetDraggable(false)
--         self:SetTitle("LIMBS")
        
--         self.submit = self:Add("DButton")
--         self.submit:Dock(BOTTOM)
--         self.submit:SetTall(30)
--         self.submit.DoClick = function()
--             self:Remove()
--         end

--         local submitmat = vgui.Create( "Material", self.submit )
--         submitmat:SetPos(0, 0 )
--         submitmat:SetMaterial( butmat )

--         local submittext = vgui.Create( "DLabel", self.submit )
--         submittext:SetPos(237, 7)
--         submittext:SetText("CLOSE")
        
--         self.body = vgui.Create( "Material", self )
--         self.body:SetMaterial(body)
--         self.body:SetSize(505, 699) 
--         self.body:SetPos( 0, 0 )

--         self.body.AutoSize = false
--     end

--     function PANEL:Paint(intW, intH)
--         surface.SetDrawColor(color_white)
--         surface.SetMaterial(framemat)
--         surface.DrawTexturedRect(0, 0, intW, intH)
--     end
    
--     local limbs = { -- # I like micro-ops.
--         [1] = "eft/head.png",
--         [6] = "eft/left_leg.png",
--         [4] = "eft/left_arm.png",
--         [7] = "eft/right_leg.png",
--         [5] = "eft/right_arm.png",
--         [2] = "eft/chest.png"
--     }
    
--     local inst = { -- # I like micro-ops.
--         [1] = {360, 36},
--         [2] = {274, 148},
--         [3] = {0, 0},
--         [4] = {374, 288},
--         [5] = {94, 233},
--         [6] = {374, 429},
--         [7] = {126, 426}
--     }
    
--     function PANEL:PaintOver(intW, intH)
--         for k = 1, #inst do
--             if (k == 3) then continue end
--             self:DrawDamagedLimb(k)
--             self:DrawDamagePanel(k, inst[k][1], inst[k][2])
--         end
--     end

--     function PANEL:Think()
--         --if ((self.nextUpdate or 0) < CurTime()) then
--             self:MoveToFront()
            
--             --self.nextUpdate = CurTime() + 0.1
--         --end
--     end

--     function PANEL:DrawDamagedLimb(intLimbID)
--         limbname = intLimbID
--         if (Limb:GetHealthPercentage(limbname, true)) < 100 then
--             local icon = limbs[intLimbID]
--             surface.SetMaterial(Material(icon))
--             surface.SetDrawColor(hook.Run("GetLimbAlp"))
--             surface.DrawTexturedRect(0, 0, self:GetWide(),self:GetTall()) -- # 505, 699
--             icon = nil
--         end 
--     end
    
--     local font = font -- # Pre cache, bitch!
--     local defColor = Color(255, 255, 255, 255)
--     function PANEL:DrawDamagePanel(intLimbID, dpW, dpH)
--         local dlimbname = intLimbID
--         local maxHealth = Limb:GetDataHigtroup()[dlimbname][1]
--         local dlimbname1 = Limb:GetName(intLimbID)
--         local tick = math.Clamp(GetHealthFlip(dlimbname), 1, maxHealth) / maxHealth
--         local isBroken = Limb:IsBroken(intLimbID)
--         local isBleeding = Limb:IsBleeding(intLimbID)

--         surface.SetMaterial(tickmat)
--         surface.SetDrawColor(color_white)
--         surface.DrawTexturedRect(dpW + 2, dpH + 22, 121 * tick, 10)

--         surface.SetMaterial(damagepanel)
--         surface.SetDrawColor(color_white)
--         surface.DrawTexturedRect(dpW, dpH, 126, 33)

--         draw.SimpleText(dlimbname1, font, dpW + 10, dpH + 10, defColor, TEXT_ALIGN_CENTER + 2, TEXT_ALIGN_CENTER)
--         draw.SimpleText(GetHealthFlip(dlimbname).." / "..maxHealth, font, dpW + 60, dpH + 26, defColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

--         if isBroken then
--             surface.SetMaterial(brokenmat)
--             surface.SetDrawColor(color_white)
--             surface.DrawTexturedRect(dpW, dpH + 35, 32, 32)
            
--             dpW = dpW + 35
--         end

--         if isBleeding then
--             surface.SetMaterial(bleedingmat)
--             surface.SetDrawColor(color_white)
--             surface.DrawTexturedRect(dpW, dpH + 35, 32, 32)
            
--             dpW = dpW + 35
--         end
--     end

--     hook.Add("GetLimbAlp", "LimbAlpha", function()
--         local limbperc = Limb:GetHealthPercentage(limbname, true)
--         local limbalp = 255
--         if (limbperc) then
--             limbalp = limbalp - (255 * (limbperc / 100))
--         end

--         return Color(255,255,255,limbalp)
--     end)
-- vgui.Register("Limb.Panel", PANEL, "DFrame")