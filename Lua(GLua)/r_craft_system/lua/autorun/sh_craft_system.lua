R_CraftSystem = R_CraftSystem or {}

R_CraftSystem.UsageCooldown = 3

R_CraftSystem.HeaderColor = Color(100, 100, 100)


/*---------------------------------------------------------------------------
Категории
---------------------------------------------------------------------------*/

R_CraftSystem.Categories = {}

R_CraftSystem.Categories[1] = {
	color = Color(30, 30, 30),
	name = "Все",
}

R_CraftSystem.Categories[2] = {
	color = Color(105, 105, 105),
	name = "Аммуниция",
	category = "entity",
}

R_CraftSystem.Categories[3] = {
	color = Color(160, 0, 0),
	name = "Медикаменты", 
	category = "entity",
}

R_CraftSystem.Categories[4] = {
	color = Color(92, 138, 191),
	name = "Оружие",
	category = "weapon",
}

R_CraftSystem.Categories[9] = {
	color = Color(43, 43, 43),
	name = "Разное", 
	category = "entity",
}

R_CraftSystem.Categories[10] = {
	color = Color(199, 99, 0),
	name = "Инструменты", 
	category = "weapon",
}
-- for i=4,25 do
-- 	R_CraftSystem.Categories[i] = {
-- 		color = Color(50,50,50),
-- 		name = "Оружие"..i, 
-- 	}
-- end

/*---------------------------------------------------------------------------
Рецепты
---------------------------------------------------------------------------*/

R_CraftSystem.Recipes = {}

R_CraftSystem.Recipes["tfa_ins2_akm_bw"] = {
	category = "Оружие",
	type = "main",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 80,
		["zapchasti"] = 50,
		["wood"] = 40,
		["cloth"] = 30,
		["forend"] = 1,
		["handle"] = 1,
		["trigger"] = 1,
		["wbutt"] = 1,
	},
}

R_CraftSystem.Recipes["tfa_ins2_mr96"] = {
	category = "Оружие",
	type = "pistol",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 50,
		["zapchasti"] = 30,
		["wood"] = 25,
		["handle"] = 1,
		["trigger"] = 1,
	},
}

R_CraftSystem.Recipes["tfa_nam_sawed_off_shotty"] = {
	category = "Оружие",
	type = "main",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 70,
		["zapchasti"] = 50,
		["wood"] = 70,
		["wbutt"] = 1,
		["trigger"] = 1,
	},
}

R_CraftSystem.Recipes["tfa_nam_browning_hi_power"] = {
	category = "Оружие",
	type = "pistol",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 45,
		["zapchasti"] = 40,
		["wood"] = 20,
		["handle"] = 1,
		["trigger"] = 1,
	},
}

R_CraftSystem.Recipes["tfa_doublebarrel"] = {
	category = "Оружие",
	type = "main",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 70,
		["zapchasti"] = 50,
		["wood"] = 80,
		["wbutt"] = 1,
		["trigger"] = 1,
	},
}

R_CraftSystem.Recipes["tfa_ins2_p320"] = {
	category = "Оружие",
	type = "pistol",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 90,
		["zapchasti"] = 40,
		["plastic"] = 75,
		["handle"] = 1,
		["trigger"] = 1,
	},
}

R_CraftSystem.Recipes["tfa_ins2_imi_uzi"] = {
	category = "Оружие",
	type = "main",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 90,
		["zapchasti"] = 60,
		["plastic"] = 75,
		["handle"] = 1,
		["trigger"] = 1,
	},
}

R_CraftSystem.Recipes["tfa_ins2_sks"] = {
	category = "Оружие",
	type = "main",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 120,
		["zapchasti"] = 70,
		["wood"] = 90,
		["forend"] = 1,
		["trigger"] = 1,
		["wbutt"] = 1,
	},
}

R_CraftSystem.Recipes["fnfnp45"] = {
	category = "Оружие",
	type = "pistol",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 70,
		["zapchasti"] = 70,
		["plastic"] = 65,
		["handle"] = 1,
		["trigger"] = 1,
	},
}

R_CraftSystem.Recipes["tfa_ins2_ak105"] = {
	category = "Оружие",
	type = "main",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 120,
		["zapchasti"] = 80,
		["plastic"] = 50,
		["forend"] = 1,
		["handle"] = 1,
		["trigger"] = 1,
		["wbutt"] = 1,
	},
}

R_CraftSystem.Recipes["tfa_nam_ak47"] = {
	category = "Оружие",
	type = "main",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 105,
		["zapchasti"] = 80,
		["wood"] = 60,
		["forend"] = 1,
		["handle"] = 1,
		["trigger"] = 1,
		["wbutt"] = 1,
	},
}

R_CraftSystem.Recipes["tfa_ins2_cw_ar15"] = {
	category = "Оружие",
	type = "main",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 105,
		["zapchasti"] = 80,
		["plastic"] = 120,
		["forend"] = 1,
		["handle"] = 1,
		["trigger"] = 1,
		["wbutt"] = 1,
	},
}

R_CraftSystem.Recipes["tfa_ins2_aug"] = {
	category = "Оружие",
	type = "main",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 130,
		["zapchasti"] = 90,
		["plastic"] = 105,
		["handle"] = 1,
		["trigger"] = 1,
	},
}

R_CraftSystem.Recipes["tfa_ins2_gol"] = {
	category = "Оружие",
	type = "main",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 150,
		["zapchasti"] = 100,
		["plastic"] = 80,
		["forend"] = 1,
		["handle"] = 1,
		["trigger"] = 1,
		["wbutt"] = 1,	
	},
}

R_CraftSystem.Recipes["tfa_ins2_m590o"] = {
	category = "Оружие",
	type = "main",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 130,
		["zapchasti"] = 70,
		["wood"] = 110,
		["handle"] = 1,
		["trigger"] = 1,
		["wbutt"] = 1,	},
}

R_CraftSystem.Recipes["tfa_ins2_m9"] = {
	category = "Оружие",
	type = "pistol",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 105,
		["zapchasti"] = 60,
		["plastic"] = 40,
		["handle"] = 1,
		["trigger"] = 1,
	},
}

R_CraftSystem.Recipes["tfa_fas2_glock20"] = {
	category = "Оружие",
	type = "pistol",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 55,
		["zapchasti"] = 80,
		["plastic"] = 100,
		["handle"] = 1,
		["trigger"] = 1,
	},
}

R_CraftSystem.Recipes["tfa_ins2_mk18"] = {
	category = "Оружие",
	type = "main",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 175,
		["zapchasti"] = 130,
		["plastic"] = 150,
		["forend"] = 1,
		["handle"] = 1,
		["trigger"] = 1,
		["wbutt"] = 1,	
	},
}

R_CraftSystem.Recipes["tfa_ins2_codol_msr"] = {
	category = "Оружие",
	type = "main",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 210,
		["zapchasti"] = 170,
		["plastic"] = 150,
		["forend"] = 1,
		["handle"] = 1,
		["trigger"] = 1,
		["wbutt"] = 1,	
	},
}

R_CraftSystem.Recipes["tfa_ins2_m1014"] = {
	category = "Оружие",
	type = "main",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
    needbody = true,
	recipe = {
		["hlam5"] = 1,
		["steel"] = 95,
		["zapchasti"] = 70,
		["wood"] = 110,
		["handle"] = 1,
		["trigger"] = 1,
		["wbutt"] = 1,	
	},
}

R_CraftSystem.Recipes["tfa_ins_rgo_grenade_owo"] = {
	category = "Оружие",
    pos = Vector(-10,-5,8),
    ang = Angle(0,-90,0),
	recipe = {
		["hlam5"] = 1,
		["reaktiv"] = 200,
		["plastic"] = 50,
		["steel"] = 150,
		["zapchasti"] = 40,
	},
}

-- R_CraftSystem.Recipes["acetone"] = {
-- 	name = "Ацетон",
-- 	model = "models/winningrook/gtav/meth/acetone/acetone.mdl",
-- 	category = "Разное",
-- 	recipe = {
-- 		["reaktiv"] = 1,
-- 		["plastic"] = 4,
-- 	},
-- }


-- R_CraftSystem.Recipes["benznatriya"] = {
-- 	name = "Бензоат Натрия",
-- 	model = "models/winningrook/gtav/meth/sacid/sacid.mdl",
-- 	category = "Разное",
-- 	recipe = {
-- 		["reaktiv"] = 1,
-- 		["plastic"] = 4,
-- 	},
-- }

-- R_CraftSystem.Recipes["bismuth"] = {
-- 	name = "Висмут",
-- 	model = "models/winningrook/gtav/meth/hcacid/hcacid.mdl",
-- 	category = "Разное",
-- 	recipe = {
-- 		["reaktiv"] = 1,
-- 		["plastic"] = 4,
-- 	},
-- }

-- R_CraftSystem.Recipes["toluol"] = {
-- 	name = "Толуол",
-- 	model = "models/winningrook/gtav/meth/toulene/toulene.mdl",
-- 	category = "Разное",
-- 	recipe = {
-- 		["reaktiv"] = 1,
-- 		["plastic"] = 4,
-- 	},
-- }


/*---------------------------------------------------------------------------
Детали
---------------------------------------------------------------------------*/

R_CraftSystem.Details = {} -- Это детали - пустышки, просто энтити, которые используются исключительно для крафта(так же можно использовать любые нормальные энтити)

R_CraftSystem.Details["wood"] = {
	name = "Дерево",
	model = "models/fallout/components/wood.mdl",
}

R_CraftSystem.Details["steel"] = {
	name = "Сталь",
	model = "models/fallout/components/ingot.mdl",
}

R_CraftSystem.Details["cloth"] = {
	name = "Текстиль",
	model = "models/fallout/components/spool_2.mdl",
}

R_CraftSystem.Details["reaktiv"] = {
	name = "Хим. реактивы",
	model = "models/fallout/components/nuclear_material.mdl",
}

R_CraftSystem.Details["plastic"] = {
	name = "Пластмасса",
	model = "models/fallout/components/box.mdl",
}

R_CraftSystem.Details["zapchasti"] = {
	name = "Запчасти",
	model = "models/fallout/components/circuitry.mdl",
}



R_CraftSystem.Details["hlam12"] = {
	name = "Сломанная гитара",
	model = "models/hgn/srp/items/guitar.mdl",
}

R_CraftSystem.Details["hlam19"] = {
	name = "Сломанное радио",
	model = "models/stalker/item/handhelds/radio.mdl",
}



R_CraftSystem.Details["ins2_br_supp"] = {
	name = "Глушитель",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["ar15_si_folded"] = {
	name = "Открытый прицел для AR-15",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["ins2_si_eotech"] = {
	name = "Голографический прицел",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["ins2_si_rds"] = {
	name = "Коллиматорный прицел",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["ins2_si_2xrds"] = {
	name = "Прицел Aimpoint X2",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["ar15_magpul_barrel"] = {
	name = "Цевье Magpul для AR-15",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["ar15_m16_barrel"] = {
	name = "Цевье M16 для AR-15",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["ar15_ris_barrel"] = {
	name = "Цевье RIS для AR-15",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["ar15_ext_ris_barrel"] = {
	name = "Цевье RIS удлененный для AR-15",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["ins2_fg_grip"] = {
	name = "Оружейная рукоять",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["ar15_magpul_stock"] = {
	name = "Приклад Magpul для AR-15",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["ar15_m16_stock"] = {
	name = "Приклад M16 для AR-15",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["ins2_si_po4x"] = {
	name = "Прицел PO X4",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["xps2"] = {
	name = "Голографический прицел с пистолетным креплением",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["rmr"] = {
	name = "Триикон прицел для пистолета",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["ins2_si_mosin"] = {
	name = "Прицел для снайперской винтовки X7",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["ins2_br_heavy"] = {
	name = "Тяжелый оружейный ствол",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["ins2_mag_speedloader"] = {
	name = "Лоэдер для револьвера",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}

R_CraftSystem.Details["forend"] = {
	name = "Цевье",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["wbutt"] = {
	name = "Приклад",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["handle"] = {
	name = "Рукоять",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}
R_CraftSystem.Details["trigger"] = {
	name = "Курок",
	model = "models/illusion/eftcontainers/ammocase.mdl",
}




/*---------------------------------------------------------------------------
Энтити на разбор
---------------------------------------------------------------------------*/

R_CraftSystem.Disassembly = {}

R_CraftSystem.Disassembly["hlam1"] = {
	name = "Электронный хлам",
	model = "models/box_condensers.mdl",
	player_get = {
		["zapchasti"] = 1,
		["plastic"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam2"] = {
	name = "Набор инструментов",
	model = "models/box_toolkit_2.mdl",
	player_get = {
		["zapchasti"] = 1,
		["wood"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam3"] = {
	name = "Набор инструментов 2",
	model = "models/box_toolkit_3.mdl",
	player_get = {
		["zapchasti"] = 1,
		["steel"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam4"] = {
	name = "Коробка с транзисторами",
	model = "models/box_transistors.mdl",
	player_get = {
		["zapchasti"] = 1,
		["plastic"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam5"] = {
	name = "Большая коробка с инструментами",
	model = "models/instrument.mdl",
	player_get = {
		["zapchasti"] = 3,
		["steel"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam8"] = {
	name = "Набор микрочипов",
	model = "models/materials_textolite.mdl",
	player_get = {
		["plastic"] = 1,
		["zapchasti"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam9"] = {
	name = "Медная леска",
	model = "models/materials_wire.mdl",
	player_get = {
		["zapchasti"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam10"] = {
	name = "Нерабочий ноутбук",
	model = "models/noteb.mdl",
	player_get = {
		["steel"] = 1,
		["plastic"] = 2,
		["zapchasti"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam11"] = {
	name = "Набор для чистки ствола",
	model = "models/toolkit_p.mdl",
	player_get = {
		["wood"] = 1,
		["zapchasti"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam12"] = {
	name = "Сломанная гитара",
	model = "models/hgn/srp/items/guitar.mdl",
	player_get = {
		["wood"] = 3,
	}
}

R_CraftSystem.Disassembly["hlam13"] = {
	name = "Сломанный фонарик",
	model = "models/raviool/flashlight.mdl",
	player_get = {
		["steel"] = 1,
		["plastic"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam14"] = {
	name = "Разбитый телефон",
	model = "models/samsung_s7/samsung_s7.mdl",
	player_get = {
		["zapchasti"] = 1,
		["plastic"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam15"] = {
	name = "Старые документы",
	model = "models/stalker/item/handhelds/files1.mdl",
	player_get = {
		["cloth"] = 2,
	}
}

R_CraftSystem.Disassembly["hlam16"] = {
	name = "Старые документы",
	model = "models/stalker/item/handhelds/files2.mdl",
	player_get = {
		["cloth"] = 2,
	}
}

R_CraftSystem.Disassembly["hlam17"] = {
	name = "Старые документы",
	model = "models/stalker/item/handhelds/files3.mdl",
	player_get = {
		["cloth"] = 2,
	}
}

R_CraftSystem.Disassembly["hlam18"] = {
	name = "Старые документы",
	model = "models/stalker/item/handhelds/files4.mdl",
	player_get = {
		["cloth"] = 2,
	}
}

R_CraftSystem.Disassembly["hlam19"] = {
	name = "Сломанное радио",
	model = "models/stalker/item/handhelds/radio.mdl",
	player_get = {
		["zapchasti"] = 1,
		["plastic"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam20"] = {
	name = "Коробка с игрой",
	model = "models/unconid/pc_models/big_box_v2.mdl",
	player_get = {
		["plastic"] = 1,
		["cloth"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam21"] = {
	name = "Диск с игрой",
	model = "models/unconid/pc_models/big_box_v2_slim.mdl",
	player_get = {
		["plastic"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam22"] = {
	name = "Коробка с игрой",
	model = "models/unconid/pc_models/big_box_v3.mdl",
	player_get = {
		["plastic"] = 1,
		["cloth"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam23"] = {
	name = "Диск с игрой",
	model = "models/unconid/pc_models/cd_jewel_case.mdl",
	player_get = {
		["plastic"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam24"] = {
	name = "Старая сломанная кукла",
	model = "models/props_c17/doll01.mdl",
	player_get = {
		["plastic"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam25"] = {
	name = "Сковорода",
	model = "models/props_c17/metalPot002a.mdl",
	player_get = {
		["steel"] = 2,
	}
}

R_CraftSystem.Disassembly["hlam26"] = {
	name = "Гаечный ключ(ржавый)",
	model = "models/props_c17/tools_wrench01a.mdl",
	player_get = {
		["steel"] = 2,
	}
}

R_CraftSystem.Disassembly["hlam27"] = {
	name = "Глобус",
	model = "models/props_combine/breenglobe.mdl",
	player_get = {
		["cloth"] = 1,
		["plastic"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam28"] = {
	name = "Чайник",
	model = "models/props_interiors/pot01a.mdl",
	player_get = {
		["steel"] = 2,
	}
}

R_CraftSystem.Disassembly["hlam29"] = {
	name = "Пустая банка",
	model = "models/props_junk/garbage_metalcan002a.mdl",
	player_get = {
		["steel"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam30"] = {
	name = "Старая газета",
	model = "models/props_junk/garbage_newspaper001a.mdl",
	player_get = {
		["cloth"] = 2,
	}
}

R_CraftSystem.Disassembly["hlam31"] = {
	name = "Банка с краской",
	model = "models/props/cs_militia/paintbucket01.mdl",
	player_get = {
		["steel"] = 2,
	}
}

R_CraftSystem.Disassembly["hlam32"] = {
	name = "Ведро",
	model = "models/props_junk/MetalBucket01a.mdl",
	player_get = {
		["steel"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam33"] = {
	name = "Канистра(ржавая)",
	model = "models/props_junk/metalgascan.mdl",
	player_get = {
		["steel"] = 2,
	}
}

R_CraftSystem.Disassembly["hlam34"] = {
	name = "Ботинок",
	model = "models/props_junk/Shoe001a.mdl",
	player_get = {
		["cloth"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam35"] = {
	name = "Сломанное настольное радио",
	model = "models/condemned criminal origins/radio.mdl",
	player_get = {
		["steel"] = 2,
		["zapchasti"] = 1,
	}
}

R_CraftSystem.Disassembly["update01_hlam1"] = {
	name = "Фотоаппарат",
	model = "models/condemned criminal origins/camera_2.mdl",
	player_get = {
		["plastic"] = 1,
		["zapchasti"] = 1,
	}
}

R_CraftSystem.Disassembly["update01_hlam2"] = {
	name = "Видеокамера",
	model = "models/condemned criminal origins/camera.mdl",
	player_get = {
		["plastic"] = 1,
		["steel"] = 1,
		["zapchasti"] = 1,
	}
}

R_CraftSystem.Disassembly["update01_hlam3"] = {
	name = "Пустая банка",
	model = "models/condemned criminal origins/soda_can.mdl",
	player_get = {
		["steel"] = 1,
	}
}

R_CraftSystem.Disassembly["update01_hlam4"] = {
	name = "Средство для мытья окон",
	model = "models/condemned criminal origins/spray_bottle.mdl",
	player_get = {
		["plastic"] = 1,
		["reaktiv"] = 1,
	}
}

R_CraftSystem.Disassembly["update01_hlam5"] = {
	name = "Степлер",
	model = "models/condemned criminal origins/stapler.mdl",
	player_get = {
		["plastic"] = 1,
	}
}

R_CraftSystem.Disassembly["update01_hlam6"] = {
	name = "Отвёртка",
	model = "models/props/generic/screwer01.mdl",
	player_get = {
		["plastic"] = 1,
		["steel"] = 1,
	}
}

R_CraftSystem.Disassembly["update01_hlam7"] = {
	name = "Пустая чашка",
	model = "models/condemned criminal origins/cup_plastic.mdl",
	player_get = {
		["plastic"] = 1,
	}
}

R_CraftSystem.Disassembly["update01_hlam8"] = {
	name = "Машинное масло",
	model = "models/condemned criminal origins/oil.mdl",
	player_get = {
		["zapchasti"] = 1,
	}
}

R_CraftSystem.Disassembly["update01_hlam9"] = {
	name = "Туалетная бумага",
	model = "models/foodnhouseholditems/toiletpaper2.mdl",
	player_get = {
		["zapchasti"] = 1,
	}
}

R_CraftSystem.Disassembly["update01_hlam10"] = {
	name = "Пакет",
	model = "models/foodnhouseholditems/paperbag3.mdl",
	player_get = {
		["cloth"] = 1,
	}
}

R_CraftSystem.Disassembly["update01_hlam11"] = {
	name = "Пустая пачка из под яиц",
	model = "models/foodnhouseholditems/egg_box3.mdl",
	player_get = {
		["cloth"] = 1,
	}
}

R_CraftSystem.Disassembly["hlam36"] = {
	name = "Системный блок",
	model = "models/props_lab/harddrive01.mdl",
	player_get = {
		["steel"] = 1,
		["zapchasti"] = 2,
	}
}



R_CraftSystem.Disassembly["newhlam1"] = {
	name = "Жесткий диск(нерабочий)",
	model = "models/props/cs_office/computer_caseb_p6b.mdl",
	player_get = {
		["steel"] = 1,
		["zapchasti"] = 1,
	}
}

R_CraftSystem.Disassembly["newhlam2"] = {
	name = "Ножницы",
	model = "models/unconid/props_pack/scissors_u.mdl",
	player_get = {
		["steel"] = 1,
		["plastic"] = 1,
	}
}

R_CraftSystem.Disassembly["newhlam3"] = {
	name = "Зажигалка",
	model = "models/unconid/props_pack/lighter.mdl",
	player_get = {
		["plastic"] = 1,
	}
}

R_CraftSystem.Disassembly["newhlam4"] = {
	name = "Мухобойка",
	model = "models/unconid/props_pack/fly_swatter.mdl",
	player_get = {
		["plastic"] = 1,
	}
}

R_CraftSystem.Disassembly["newhlam5"] = {
	name = "Деревянный хлам",
	model = "models/props/de_inferno/crate_fruit_break_p9.mdl",
	player_get = {
		["wood"] = 2,
	}
}

R_CraftSystem.Disassembly["newhlam6"] = {
	name = "Деревянный хлам",
	model = "models/props/de_inferno/flower_barrel_p3.mdl",
	player_get = {
		["wood"] = 2,
	}
}

R_CraftSystem.Disassembly["toluol"] = {
	name = "Толуол",
	model = "models/winningrook/gtav/meth/hcacid/hcacid.mdl",
	player_get = {
		["reaktiv"] = 1,
	}
}

R_CraftSystem.Disassembly["bismuth"] = {
	name = "Висмут",
	model = "models/winningrook/gtav/meth/hcacid/hcacid.mdl",
	player_get = {
		["reaktiv"] = 1,
	}
}

R_CraftSystem.Disassembly["benznatriya"] = {
	name = "Бензоат натрия",
	model = "models/winningrook/gtav/meth/sacid/sacid.mdl",
	player_get = {
		["reaktiv"] = 1,
	}
}

R_CraftSystem.Disassembly["acetone"] = {
	name = "Ацетон",
	model = "models/winningrook/gtav/meth/acetone/acetone.mdl",
	player_get = {
		["reaktiv"] = 1,
	}
}

R_CraftSystem.Disassembly["pervodoroda"] = {
	name = "Пероксид водорода",
	model = "models/winningrook/gtav/meth/sodium/sodium.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["propglicogol"] = {
	name = "Пропиленгликоль",
	model = "models/winningrook/gtav/meth/ammonia/ammonia.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

--[[
====================НОВЫЙ ЛУТ==========================================
]]

R_CraftSystem.Disassembly["30mmround"] = {
	name = "30-миллиметровый снаряд",
	model = "models/illusion/eftcontainers/30mmround.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["airfilter"] = {
	name = "Воздушный фильтр",
	model = "models/illusion/eftcontainers/airfilter.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["washing"] = {
	name = "Средство для стирки",
	model = "models/illusion/eftcontainers/alkali.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["ammocase"] = {
	name = "Кейс для патронов",
	model = "models/illusion/eftcontainers/ammocase.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["aquafilter"] = {
	name = "Фильтр для воды",
	model = "models/illusion/eftcontainers/aquamari.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["armorrepair"] = {
	name = "Набор для ремонта брони",
	model = "models/illusion/eftcontainers/armorrepair.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["usedbandage"] = {
	name = "Использованый бинт",
	model = "models/illusion/eftcontainers/bandage.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["bleach"] = {
	name = "Отбеливатель",
	model = "models/illusion/eftcontainers/bleach.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["bloodexample"] = {
	name = "Склянка с кровью",
	model = "models/illusion/eftcontainers/bloodsample.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["capacitors"] = {
	name = "Набор конденсаторов",
	model = "models/illusion/eftcontainers/capacitors.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["carbattery"] = {
	name = "Аккумулятор",
	model = "models/illusion/eftcontainers/carbattery.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["catfigure"] = {
	name = "Фигурка кота",
	model = "models/illusion/eftcontainers/catfigurine.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["chain"] = {
	name = "Цепочка",
	model = "models/illusion/eftcontainers/chain.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["circuitboard"] = {
	name = "Печатная плата",
	model = "models/illusion/eftcontainers/circuitboard.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["booster"] = {
	name = "Усилитель",
	model = "models/illusion/eftcontainers/controller.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["copypaper"] = {
	name = "Бумага для принтера",
	model = "models/illusion/eftcontainers/copypaper.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["diagset"] = {
	name = "Набор для диагностики",
	model = "models/illusion/eftcontainers/diagset.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["dryfuel"] = {
	name = "Сухое топливо",
	model = "models/illusion/eftcontainers/dryfuel.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["ducttape"] = {
	name = "Белая  изолента",
	model = "models/illusion/eftcontainers/ducttape.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["electricdrill"] = {
	name = "Электро-дрель",
	model = "models/illusion/eftcontainers/electricdrill.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["engine"] = {
	name = "Двигатель",
	model = "models/illusion/eftcontainers/engine.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["flashstorage"] = {
	name = "Переносной жесткий диск",
	model = "models/illusion/eftcontainers/flashstorage.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}


R_CraftSystem.Disassembly["fuelconditioner"] = {
	name = "Топливный кондиционер",
	model = "models/illusion/eftcontainers/fuelconditioner.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["gasanalyser"] = {
	name = "Газоанализатор",
	model = "models/illusion/eftcontainers/gasanalyser.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["gasoline"] = {
	name = "Канистра",
	model = "models/illusion/eftcontainers/gasoline.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["gasoline_filledwithfuel"] = {
	name = "Канистра(с бензином)",
	model = "models/illusion/eftcontainers/gasoline.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["geigercounter"] = {
	name = "Счетчик гейгера",
	model = "models/illusion/eftcontainers/geigercounter.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["goldchain"] = {
	name = "Золотая цепь",
	model = "models/illusion/eftcontainers/goldchain.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["gpblue"] = {
	name = "Порох",
	model = "models/illusion/eftcontainers/gpblue.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["gpgreen"] = {
	name = "Качественный порох",
	model = "models/illusion/eftcontainers/gpgreen.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["gphone"] = {
	name = "Разбитый iPhone 5",
	model = "models/illusion/eftcontainers/gphone.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["gphonex"] = {
	name = "Разбитый iPhone 10",
	model = "models/illusion/eftcontainers/gphonex.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["gpred"] = {
	name = "Пистолетный порох",
	model = "models/illusion/eftcontainers/gpred.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["graphicscard"] = {
	name = "Видеокарта",
	model = "models/illusion/eftcontainers/graphicscard.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["gyroscope"] = {
	name = "Гироскоп",
	model = "models/illusion/eftcontainers/gyroscope.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["gyrotachometer"] = {
	name = "Гироскоп-тахометр",
	model = "models/illusion/eftcontainers/gyrotachometer.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["hdd"] = {
	name = "Жесткий диск",
	model = "models/illusion/eftcontainers/hdd.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["helix"] = {
	name = "Трубка",
	model = "models/illusion/eftcontainers/helix.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["horse"] = {
	name = "Статуя коня",
	model = "models/illusion/eftcontainers/horse.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["hose"] = {
	name = "Шланг",
	model = "models/illusion/eftcontainers/hose.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["insulatingtape"] = {
	name = "Синяя изолента",
	model = "models/illusion/eftcontainers/insulatingtape.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["intel"] = {
	name = "Документы",
	model = "models/illusion/eftcontainers/intel.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["kerosine"] = {
	name = "Канистра с керосином",
	model = "models/illusion/eftcontainers/kerosine.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}


R_CraftSystem.Disassembly["labskeycard"] = {
	name = "Ключ-карта",
	model = "models/illusion/eftcontainers/labskeycard.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["laptop"] = {
	name = "Военный ноутбук",
	model = "models/illusion/eftcontainers/laptop.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["lcdclean"] = {
	name = "Рабочий экран",
	model = "models/illusion/eftcontainers/lcdclean.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["lcddirty"] = {
	name = "Разбитый экран",
	model = "models/illusion/eftcontainers/lcddirty.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["lightbulb"] = {
	name = "Лампочка",
	model = "models/illusion/eftcontainers/lightbulb.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["lionstatue"] = {
	name = "Статуя льва",
	model = "models/illusion/eftcontainers/lionstatue.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["magnet"] = {
	name = "Большой магнит",
	model = "models/illusion/eftcontainers/magnet.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["matches"] = {
	name = "Спички",
	model = "models/illusion/eftcontainers/matches.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["medsyringe"] = {
	name = "Неиспользованный шприц",
	model = "models/illusion/eftcontainers/medsyringe.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["medpile"] = {
	name = "Набор лекарств",
	model = "models/illusion/eftcontainers/medpile.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["militarybattery"] = {
	name = "Военный аккумулятор",
	model = "models/illusion/eftcontainers/militarybattery.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["militarycable"] = {
	name = "Качественный кабель",
	model = "models/illusion/eftcontainers/militarycable.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["pen"] = {
	name = "Ручка",
	model = "models/illusion/eftcontainers/morphine.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["nailpack"] = {
	name = "Пачка гвоздей",
	model = "models/illusion/eftcontainers/nailpack.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["nixxorlens"] = {
	name = "Линза для фотоаппарата",
	model = "models/illusion/eftcontainers/nixxorlens.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["nuts"] = {
	name = "Гайки",
	model = "models/illusion/eftcontainers/nuts.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["packofscrews"] = {
	name = "Набор гвоздей",
	model = "models/illusion/eftcontainers/packofscrews.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["paracord"] = {
	name = "Прочная верёвка",
	model = "models/illusion/eftcontainers/paracord.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["phaseantenna"] = {
	name = "Запчасть антенны",
	model = "models/illusion/eftcontainers/phaseantenna.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["phaserelay"] = {
	name = "Фазовое реле",
	model = "models/illusion/eftcontainers/phaserelay.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["plexiglass"] = {
	name = "Плексиглас",
	model = "models/illusion/eftcontainers/plexiglass.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["pliers"] = {
	name = "Плоскогубцы",
	model = "models/illusion/eftcontainers/pliers.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["powerbank"] = {
	name = "Павер-банк",
	model = "models/illusion/eftcontainers/powerbank.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["powercord"] = {
	name = "Шнур для питания",
	model = "models/illusion/eftcontainers/powercord.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["powerfilter"] = {
	name = "ЭМИ-фильтр",
	model = "models/illusion/eftcontainers/powerfilter.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["powersupplyunit"] = {
	name = "Блок питания",
	model = "models/illusion/eftcontainers/powersupplyunit.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["pressuregauge"] = {
	name = "Манометр",
	model = "models/illusion/eftcontainers/pressuregauge.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["sparkplug"] = {
	name = "Авто свеча",
	model = "models/illusion/eftcontainers/sparkplug.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["soap"] = {
	name = "Мыло",
	model = "models/illusion/eftcontainers/soap.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["shampoo"] = {
	name = "Шампунь",
	model = "models/illusion/eftcontainers/shampoo.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["toolset"] = {
	name = "Набор инструментов для строительства",
	model = "models/illusion/eftcontainers/toolset.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["toothpaste"] = {
	name = "Зубная паста",
	model = "models/illusion/eftcontainers/toothpaste.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["wires"] = {
	name = "Провода",
	model = "models/illusion/eftcontainers/wires.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}

R_CraftSystem.Disassembly["wrench"] = {
	name = "Гаечный ключ",
	model = "models/illusion/eftcontainers/wrench.mdl",
	player_get = {
		["reaktiv"] = 2,
	}
}




/*---------------------------------------------------------------------------
Дальше идет код :D
---------------------------------------------------------------------------*/

function R_CraftSystem:RegisterDetail(class, detail)
	local ENT = {}
	ENT.Base = "base_gmodentity"
	ENT.Type = "anim"
	ENT.PrintName = detail.name
	ENT.WorldModel = detail.model
	ENT.Model = detail.model

	ENT.Category = "R_CraftSystem"
	ENT.Spawnable = true

	if SERVER then
		function ENT:Initialize()
			self:SetModel( self.WorldModel )
			self:PhysicsInit(SOLID_VPHYSICS)
			self:SetMoveType(MOVETYPE_VPHYSICS)
			self:SetSolid(SOLID_VPHYSICS)
			self:SetUseType(SIMPLE_USE)
			local phys = self:GetPhysicsObject()
			phys:Wake()
		end
	end

	scripted_ents.Register( ENT, class )
	-- local k = {
	-- 	name= v.name,
	-- 	id = k,
	-- 	model= v.model,
	-- 	pos = v.pos,
	-- 	ang = v.ang,
	-- 	slot=COSM_SLOT_RHAND,
	-- 	type = "weapon",
	-- 	scale=1,
	-- 	attach = "chest",
	-- 	price=0,
	-- }
	-- table.insert(Cosmetics.Items, k)
end

for k,v in pairs(R_CraftSystem.Details) do
	R_CraftSystem:RegisterDetail(k, v)
end

function R_CraftSystem:RegisterDissamblies(class, dissamblies)
	local ENT = {}
	ENT.Base = "base_gmodentity"
	ENT.Type = "anim"
	ENT.PrintName = dissamblies.name
	ENT.WorldModel = dissamblies.model
	ENT.Model = dissamblies.model

	ENT.Category = "Лут"
	ENT.Spawnable = true

	if SERVER then
		function ENT:Initialize()
			self:SetModel( self.WorldModel )
			self:PhysicsInit(SOLID_VPHYSICS)
			self:SetMoveType(MOVETYPE_VPHYSICS)
			self:SetSolid(SOLID_VPHYSICS)
			self:SetUseType(SIMPLE_USE)
			local phys = self:GetPhysicsObject()
			phys:Wake()
		end
	end

	scripted_ents.Register( ENT, class )
end

for k,v in pairs(R_CraftSystem.Disassembly) do
	R_CraftSystem:RegisterDissamblies(k, v)
end

