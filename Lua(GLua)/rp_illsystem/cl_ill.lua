net.Receive( "rp.illness.SendIllToClient", function()
    LocalPlayer().ills = net.ReadTable()
end )


local PANEL = {}

function PANEL:Init()
    LocalPlayer().ills = LocalPlayer().ills or {}

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
    for k,v in pairs(LocalPlayer().ills) do
        text = text .. rp.illness[k].name .. "\n"
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

end

vgui.Register('rp.HealthMenu', PANEL, 'monoPanel')

