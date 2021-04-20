rp = rp or {}
rp.Ills = rp.Ills or {}

local Register do
	_Ill = { name = '#NotFound', Start = 0, 
			ThinkRate = -1, NextThink = 0,
			OnThink = function(self, owner, mul)end,
			--RequestHandler = function(...)end,
			OnStart = function(self, owner, mul)end,
			OnFinish = function(self, owner, mul)end,
			Symptoms = {},
			hook = nil,
			hookFunc = function(self, owner, mul)end,
			multiplier = 1, duration = 300,
			latent_period = 0}
	_Ill.__index = _Ill

	AccessorFunc(_Ill, 'latent_period', 'LatentTime', FORCE_NUMBER) -- Бессимптомное время
	AccessorFunc(_Ill, 'ThinkRate', 'ThinkRate', FORCE_NUMBER) -- Частота проверок
	AccessorFunc(_Ill, 'multiplier', 'Multiplier', FORCE_NUMBER) -- Множитель эффектов
	AccessorFunc(_Ill, 'duration', 'Duration', FORCE_NUMBER) -- Продолжительность
	AccessorFunc(_Ill, 'OnThink', 'OnThink') -- Тик
	AccessorFunc(_Ill, 'OnStart', 'OnStart') -- Функция при начале инфекции
	AccessorFunc(_Ill, 'OnFinish', 'OnFinish') -- Функция при конце инфекции
	--AccessorFunc(_Ill, 'RequestHandler', 'RequestHandler') -- ОСНОВНОЙ. Отвечает на запрос от внешних модулей. Для каждой болезни может быть своим
	AccessorFunc(_Ill, 'hook', 'Hook') -- Хук
	AccessorFunc(_Ill, 'hookFunc', 'HookFunc') -- Функция хука
	AccessorFunc(_Ill, 'Symptoms', 'Symptoms') -- симптомы

	function _Ill:Create(name) -- Name should be unique
		assert(rp.Ills[name] == nil, "That illness name is already reserved!")

		local obj = {}
		obj.name = name

		rp.Ills[name] = obj

		setmetatable(obj, self)
		return obj
	end

	function _Ill:Inherit(name)
		assert(rp.Ills[name] ~= nil, 'Ill ' .. name .. " isn't found!" )	

		self = table.Copy(rp.Ills[name])
	end

	function _Ill:CallHandler(ply, HandlerName)
		for name,_ in pairs(ply.Ills) do
			if rp.Ills[name][HandlerName] and isfunction(rp.Ills[name][HandlerName]) then
				return rp.Ills[name][HandlerName](ply)
			end
		end
		return nil
	end

	function _Ill:SetCustomHandler(key, func)
		self[key] = func
	end

	if SERVER then
		function _Ill:SaveDataToDB(pl)
			if not pl.Ills or pl:GetNVar('CharSelected') == 0 then return end

			db:Query('UPDATE rp_illnesses SET data=? WHERE steamid64=? AND charid=?;', util.TableToJSON(pl.Ills), pl:SteamID64(), pl:GetNVar('CurrentChar'))
		end
	end
end



function PLAYER:SetIllsFromData(data)
	for name, duration in pairs(data) do
    	self:SetIll(name, duration, true)
    end
end

function PLAYER:SetIll(name, customDuration, disableLatent)
	assert( rp.Ills[name] ~= nil, 'Ill ' .. name .. " isn't found!" )
	if self.Ills[name] then return end

	local ill = rp.Ills[name]
	self.Ills = self.Ills or {}
	self.Ills[name] = os.time()

	if disableLatent == true then self.Ills[name]:SetLatentTime(0) end

	ill:OnStart(ill, self, ill:GetMultiplier())
	
	self.IllTimers = self.IllTimers or {}
	self.IllTimers[self:SteamID64().."_"..name] = 
		timer.Create(self:SteamID64().."_"..name, customDuration and customDuration or ill:GetDuration(), 1, function() 
			if not IsValid(self) then 
				timer.Remove(self:SteamID64().."_"..name)
				return 
			end

			ill:OnFinish(ill, self, ill:GetMultiplier())
			self.Ills[name] = nil
			_Ill:SaveDataToDB(self)
		end)

	
	if ill:GetThinkRate() >= 0 then
		self.IllThinks = self.IllThinks or {}
		self.IllThinks[self:SteamID64().."_"..name.."_think"] = 
			timer.Create(self:SteamID64().."_"..name.."_think", ill:GetThinkRate(), 1, function() 
				if not IsValid(self) then 
					timer.Remove(self:SteamID64().."_"..name.."_think")
					return 
				end

				rp.Ills[name]:OnThink()
			end)
	end

	if SERVER then _Ill:SaveDataToDB(self) end
end

function PLAYER:RemoveIll(name)
	assert(self.Ills[name] ~= nil, "Player don't have such ill as ".. name .. "!" )

	self.Ills = self.Ills or {}
	self.Ills[name] = nil
	if timer.Exists(self:SteamID64().."_"..name) then timer.Remove(self:SteamID64().."_"..name) end
end


---------------------------------------
--------------CONFIG-------------------
---------------------------------------

-- боль во всем теле - 8% штраф к выносливости,
-- кашель - соответствующий эффект, 
-- морозит - синее покрытие по краям, 
-- отек - трата хп во время движения(маленькое), 
-- слабость - меньше урона с ближнего боя, 5% штраф к скорости
-- дизориентация - эффект флешки пока не вылечишь(может быть тряска экрана)
-- потеря зрения - темный экран
-- сбой сердца - превращается в рагдолл на время, маленький шанс смерти
-- температура - смазанность движений
-- давление - 10% шанс обморока(рагдолла)
-- кашель с скровью - кашель + потеря хп
-- тремор - тряска экрана
-- лихорадка - замерзание потихоньку, тремор
-- потеря голоса - выключение войса и чата
-- боль в желудке - 50% штраф к получению еды
-- обморок - рагдолл игрока
-- обезвоживание - увеличенное уменьшение воды
-- замерзание - шанс заболеть еще чем-то
-- жар - трата воды, усталость
local newIll


newIll = _Ill:Create("Отравление")
newIll:SetDuration(60) -- В секундах
newIll:SetSymptoms({
	"боль в животе", 
	"тошнота",
})
newIll:SetCustomHandler("HungerHandler", function(ply)
	return 0.5 * self:GetMultiplier() -- Add Hunger multiplier
end)





---------------------------------------
---------------------------------------
---------------------------------------

function PLAYER:IsUnderRoof()
	local tr = {collisiongroup = COLLISION_GROUP_DEBRIS}
	tr.start = self:GetPos()
	tr.endpos = self:GetPos() + Vector(0,0,200)
	return util.TraceLine( tr ).HitWorld
end

