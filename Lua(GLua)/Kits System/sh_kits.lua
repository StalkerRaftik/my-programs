rp.Kits = rp.Kits or {}

-- lvl = уровень для кита, не заполнять если не нужен


rp.Kits.NiceNames = {
  {name = "Обычные киты", cooldown = 86400, color = Color(100, 210, 13,150)},
  {name = "Элитные киты", cooldown = 86400, color = Color(255, 236, 0,150), last = true},
}

rp.Kits.Config = {
	{
		{ 
			Name = "Базовый набор для выживания",
			Items = {
				["models/foodnhouseholditems/sodacan04.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/sodacan04.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/chipslays.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/chipslays.mdl"] = INV_FOOD,
				["ent_bandage"] = INV_ENTITY,
				["ent_bandage"] = INV_ENTITY,
				["tfa_nmrih_wrench"] = INV_WEAPON,
			},
			lvl = 1,
			Description = "Раз в 24 часа вы можете получить базовый набор выживания.\nВы получите: гаечный ключ, еду, воду и пару бинтов \nДоступно для всех.", 
			color = Color(150, 200, 150,200),
			model = "models/player/backpack_molle/molle.mdl"
		},
		{ 
			Name = "Набор Опытный выживший",
			Items = {
				["models/foodnhouseholditems/sodacan04.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/sodacan04.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/chipslays.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/chipslays.mdl"] = INV_FOOD,
				["ent_bandage"] = INV_ENTITY,
				["ent_bandage"] = INV_ENTITY,
				["ent_heal"] = INV_ENTITY,
				["ent_heal"] = INV_ENTITY,	
				["tfa_ammo_357"] = INV_ENTITY,
				["tfa_ammo_357"] = INV_ENTITY,									
				["tfa_model627"] = INV_WEAPON,
				["tfa_nmrih_hatchet"] = INV_WEAPON,				
			},
			Upgrade = {"nabor_opitniyvijivshiy", "nabor_opitniyvijivshiy1mo"},
		    Description = "Набор опытного выжившего, который успел обжиться припасами.\nВы получите: S&W 627,самодельный бронежилет,две пачки патронов, еда, вода, топор, рация и медицина(много)/", 
		    color = Color(100, 210, 13,200),
		    model = "models/dean/gtaiv/helmet.mdl",
	    },
		{ 
			Name = "Набор Охотник",
			Items = {
				["models/foodnhouseholditems/beercan01.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/beercan01.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/beercan01.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/steak2.mdl"] = INV_FOOD,
				["ent_bandage"] = INV_ENTITY,
				["tfa_ammo_357"] = INV_ENTITY,
				["tfa_ammo_357"] = INV_ENTITY,			
				["tfa_ammo_ar22"] = INV_ENTITY,								
				["tfa_ragingbull"] = INV_WEAPON,
				["tfa_winchester73"] = INV_WEAPON,	
				["confederate_hat"] = INV_HATS,			
			},
			Upgrade = {"nabor_ohotnik", "nabor_ohotnik1mo"},
		    Description = "Набор охотника, который включает в себя сырое мясо, пару банок пива, Raging Bull, военное кепи и охотничью винтовку Winchester.\nТакже при себе имеет рацию,гитару,бинт и пачку патронов.", 
		    color = Color(255, 158, 13,200),
		    model = "models/player/backpack_baselardwild/scavbp.mdl"
	    },
		{ 
			Name = "Набор Полицейский",
			Items = {
				["models/foodnhouseholditems/bagel3.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/bagel3.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/beercan01.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/sodacan04.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/sodacan04.mdl"] = INV_FOOD,				
				["ent_smallmedkit"] = INV_ENTITY,
				["ent_heal"] = INV_ENTITY,
				["tfa_ammo_pistoll"] = INV_ENTITY,
				["tfa_ammo_buckshott"] = INV_ENTITY,			
				["tfa_ammo_buckshott"] = INV_ENTITY,								
				["tfa_remington870"] = INV_WEAPON,
				["tfa_colt1911"] = INV_WEAPON,	
				["policevest"] = INV_HATS,					
			},
			Upgrade = {"nabor_police", "nabor_police1mo"},
		    Description = "Набор бывшего полицейского,который включает в себя: Полицейский Remington 870 и бронежилет, М1911, пончики и газировку.\nИмеет при себе рацию, аптечку и пачку патронов.", 
		    color = Color(0, 0, 194,200),
		    model = "models/combataegis/body/policevest.mdl",
	    }
	},
	{
		{ 
			Name = "Набор Мародер",
			Items = {
				["models/foodnhouseholditems/chipslays.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/chipslays.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/sodacan04.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/sodacan04.mdl"] = INV_FOOD,				
				["ent_bandage"] = INV_ENTITY,
				["ent_bandage"] = INV_ENTITY,
				["ent_heal"] = INV_ENTITY,
				["ent_heal"] = INV_ENTITY,
				["tfa_ammo_smgg"] = INV_ENTITY,
				["tfa_ammo_buckshott"] = INV_ENTITY,										
				["tfa_ump45"] = INV_WEAPON,
				["tfa_uzi"] = INV_WEAPON,				
				["tfa_nmrih_bat"] = INV_WEAPON,	
				["motohelmet"] = INV_HATS,	
				["policevest"] = INV_HATS,		
			},	
			Upgrade = {"nabor_moroder", "nabor_moroder1mo"},	   
		    Description = "Набор того,кто сделает абсолютно всё чтобы выжить.\nВключает в себя UMP 45 и UZI, мотоциклетный шлем и гражданский бронежилет, а также бейсбольную биту, еду и воду и пачку патронов.", 
		    color = Color(194, 0, 0,200),
		    model = "models/sal/halloween/ninja.mdl"
		},
		{ 
			Name = "Набор Военный",
			Items = {
				["models/foodnhouseholditems/juice3.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/bagette.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/juice3.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/bagette.mdl"] = INV_FOOD,				
				["ent_smallmedkit"] = INV_ENTITY,
				["ent_smallmedkit"] = INV_ENTITY,
				["tfa_ammo_ar22"] = INV_ENTITY,
				["tfa_ammo_ar22"] = INV_ENTITY,										
				["tfa_mp5"] = INV_WEAPON,
				["tfa_usp"] = INV_WEAPON,				
				["tfa_nmrih_crowbar"] = INV_WEAPON,	
				["tacticalvest"] = INV_HATS,	
				["michhelmet"] = INV_HATS,		
			},
			Upgrade = {"nabor_voenniy", "nabor_voenniy1mo"},
		    Description = "Набор рядового бойца американской армии.\nВы получите MP5, USP, тактический бронежилет, военную каску и монтировку. Также имеется дневной рацион питания,рация,аптечка и военный бронежилет.", 
		    color = Color(0, 191, 169,200),
		    model = "models/player/backpack_blackjack/blackjack.mdl"
	    },
		{ 
			Name = "Набор Крушитель",
			Items = {		
				["ent_largemedkit"] = INV_ENTITY,
				["ent_largemedkit"] = INV_ENTITY,
				["tfa_ammo_3577"] = INV_ENTITY,									
				["tfa_nmrih_fubar"] = INV_WEAPON,
				["tfa_coltpython"] = INV_WEAPON,		
				["michhelmet"] = INV_HATS,	
				["armourvest"] = INV_HATS,		
			},
			Upgrade = {"nabor_krushitel", "nabor_krushitel1mo"},		    
		    Description = "Набор выжившего, который делает упор на грубую силу. Включает в себя огромный фубар, Colt Phyton, тяжелый взрывоустойчивый бронежилет, шлем, патроны и две большие аптечки.", 
		    color = Color(176, 0, 164,200),
		    model = "models/combataegis/body/ballisticvest.mdl"
	    },
		{ 
			Name = "Набор Снайпер",
			Items = {
				["models/foodnhouseholditems/beercan01.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/beercan01.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/burgergtaiv.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/burgergtaiv.mdl"] = INV_FOOD,				
				["tfa_ammo_pistoll"] = INV_ENTITY,
				["tfa_ammo_sniper_roundss"] = INV_ENTITY,										
				["tfa_sig_p229r"] = INV_WEAPON,
				["tfa_dragunov"] = INV_WEAPON,				
				["tfa_nmrih_kknife"] = INV_WEAPON,	
				["tacticalvest"] = INV_HATS,		
			},
			Upgrade = {"nabor_sniper", "nabor_sniper1mo"},	
		    Description = "Набор снайпера. Включает в себя SVD Dragunov, SIG P223, тактический бронежилет, бинокль, патроны, еду, воду, рацию и нож.", 
		    color = Color(140, 153, 92,200),
		    model = "models/player/backpack_trizip/trizip.mdl"
	    },
		{ 
			Name = "Набор Дитя Апокалипсиса",
			Items = {
				["models/foodnhouseholditems/cabbage1.mdl"] = INV_FOOD,
				["models/foodnhouseholditems/cabbage1.mdl"] = INV_FOOD,			
				["zombification_cure"] = INV_ENTITY,
				["tfa_ammo_smgg"] = INV_ENTITY,		
				["zombification_cure"] = INV_ENTITY,
				["tfa_ammo_buckshott"] = INV_ENTITY,		
				["tfa_ammo_ar22"] = INV_ENTITY,
				["tfa_ammo_ar22"] = INV_ENTITY,											
				["tfa_spas12"] = INV_WEAPON,
				["tfa_m92beretta"] = INV_WEAPON,				
				["tfa_mp9"] = INV_WEAPON,		
				["tfa_breadnope_axe"] = INV_WEAPON,	
				["ballisticvest"] = INV_HATS,	
				["assaulthelmet"] = INV_HATS,	
			},
			Upgrade = {"nabor_dityaapocalypsisa", "nabor_dityaapocalypsisa1mo"},	
		    Description = "Набор настоящего Дитя Апокалипсиса.\nВключает в себя Spas 12, Desert Eagle, MP9, штурмовой шлем, баллистический бронежилет, двуручный топор, еду, воду, патроны, рацию, бинокль и антидот", 
		    color = Color(0, 0, 0,255),
		    model = "models/player/backpack_pilgrim/pilgrim.mdl"
	    }
	}
}


function PLAYER:AllowedToUseKit(kit)
	if kit.Upgrade then
		return self:HasUpgrade(kit.Upgrade[1]) or self:HasUpgrade(kit.Upgrade[2])
	end
  return true
end