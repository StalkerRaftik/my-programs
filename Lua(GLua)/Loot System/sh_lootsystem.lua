rp.LootSystem = rp.LootSystem or {}
rp.LootSystem.RespawnTimer = 900
rp.LootSystem.RandomLoot = {
    ["House1"] = {
        ["Шкаф"] = {
            loot = {
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0, chance2 = 0.38, count = 1, type = INV_HATS},
                ["Энтити"] = {loot = {"ent_bandage","ent_smallmedkit","ent_shina", "ent_medkit", "ent_bandage", "ent_bandage "}, 
                chance1 = 0.38, chance2 = 0.42, count = 1, type = INV_ENTITY},
                ["Одежда"] = {loot = {"Брюки 1 (муж.)","Брюки 2 (муж.)","Брюки 3 (муж.)","Брюки 4 (муж.)","Брюки 5 (муж.)","Брюки 6 (муж.)","Брюки 7 (муж.)","Брюки 8 (муж.)","Брюки 9 (муж.)","Брюки 10 (муж.)","Футболка 1 (муж.)","Футболка 2 (муж.)","Футболка 3 (муж.)","Футболка 4 (муж.)","Футболка 5 (муж.)","Футболка 6 (муж.)","Футболка 7 (муж.)","Футболка 8 (муж.)","Футболка 9 (муж.)","Футболка 10 (муж.)","Футболка 10 (муж.)","Футболка 11 (муж.)","Футболка 12 (муж.)","Футболка 13 (муж.)","Футболка 14 (муж.)","Футболка 15 (муж.)","Футболка 16 (муж.)","Футболка 17 (муж.)","Футболка 18 (муж.)","Футболка 19 (муж.)","Футболка 20 (муж.)","Футболка 21 (муж.)","Футболка 22 (муж.)","Футболка 23 (муж.)","Футболка 24 (муж.)","Футболка 25 (муж.)","Футболка 26 (муж.)","Футболка 27 (муж.)","Футболка 28 (муж.)","Красная парка (муж.)","Синяя парка (муж.)","Куртка 3 (муж.)","Костюм 1 (муж.)"}, 
                chance1 = 0.42, chance2 = 0.8, count = 1, type = INV_CLOTHES},
                ["Оружие"] = {loot = {"tfa_nmrih_bat","tfa_nmrih_kknife", "tfa_nmrih_spade"}, 
                chance1 = 0.8, chance2 = 0.91, count = 1, type = INV_WEAPON},
                ["Редкое"] = {loot = {"firehelmet","motohelmet","ssh68","firehelmet","motohelmet","ssh68","turtlecap",'motohelmet','backpack_molle','backpack_trizip','backpack_citya','backpack_cityb','backpack_cityc','backpack_city2a','backpack_city2b','backpack_baselardwild'}, 
                chance1 = 0.91, chance2 = 0.97, count = 1, type = INV_HATS},
                ["Бронежилет"] = {loot = {"policevest"}, 
                chance1 = 0.97, chance2 = 0.99, count = 1, type = INV_HATS},
                ["Очень редкое"] = {loot = {"backpack_pilgrim","backpack_pilgrim2a","backpack_pilgrim2b","backpack_pilgrim2c", "pressvest", "helmetmich", "policevest"}, 
                chance1 = 0.99, chance2 = 1, count = 1, type = INV_HATS},
            },
            model = "models/props_c17/furnituredresser001a.mdl",
            pos = {
                {Vector(-10634.673828, 13407.583008, 857.323853), Angle(1.617, -89.949, 0.088)},
                {Vector(-10855.516602, 13068.611328, 857.384644), Angle(1.614, -0.063, -0.144)},
                {Vector(-10712.430664, 13197.018555, 832.522949), Angle(88.372, 28.197, -0.401)},
            },
        },
        ["Холодильник"] = {
			loot = {
                ["Жрачка"] = { loot = {"models/foodnhouseholditems/chipsbag1.mdl","models/foodnhouseholditems/chipscheezit.mdl","models/foodnhouseholditems/chipsbag2.mdl","models/foodnhouseholditems/chipsdoritos2.mdl","models/foodnhouseholditems/chipsdoritos.mdl","models/foodnhouseholditems/chipsdoritos5.mdl","models/foodnhouseholditems/chipsdoritos4.mdl","models/foodnhouseholditems/chipsdoritos6.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipsfritoshoops.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipslays2.mdl","models/foodnhouseholditems/chipslays6.mdl","models/foodnhouseholditems/chipslays5.mdl","models/foodnhouseholditems/chipslays3.mdl","models/foodnhouseholditems/chipslays8.mdl","models/foodnhouseholditems/chipslays7.mdl","models/foodnhouseholditems/chipslays4.mdl","models/foodnhouseholditems/chipsbag3.mdl","models/foodnhouseholditems/chipstropical.mdl","models/foodnhouseholditems/chipstwisties.mdl","models/foodnhouseholditems/cookies.mdl","models/foodnhouseholditems/digestive.mdl","models/foodnhouseholditems/toffifee.mdl",}, 
                    chance1 = 0, chance2 = 0.45, count = 1, type = INV_FOOD
                },
                ["Вода"] = {
                    loot = {"models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/beercan01.mdl","models/foodnhouseholditems/beercan03.mdl","models/foodnhouseholditems/beer_master.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl"}, 
                    chance1 = 0.45, chance2 = 0.95, count = 1, type = INV_FOOD
                },
                ["Пустые банки"] = {
                    loot = {"hlam29", "update01_hlam7", "update01_hlam3", "update01_hlam11", "hlam29", "update01_hlam7", "update01_hlam3",}, 
                    chance1 = 0.95, chance2 = 1, count = 1, type = INV_ENTITY
                },
            },
            model = "models/props_c17/furniturefridge001a.mdl",
            pos = {
                {Vector(-10574.561523, 13058.750977, 853.437500), Angle(0, 180, 0)},
                {Vector(-10760.097656, 13006.650391, 853.371948), Angle(0.010, 89.991, 0.010)},
            },
        },
    },
    ["House2"] = {
        ["Шкаф на стене"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife", "tfa_nmrih_hatchet","tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife",},
                chance1 = 0, chance2 = 0.16, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.16, chance2 = 0.20, count = 1, type = INV_ENTITY},
                ["Редкое оружие"] = {loot = {"weapon_rpw_binoculars","guitar_sad", "wep_jack_job_drpradio",},
                chance1 = 0.2, chance2 = 0.25, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52"},
                chance1 = 0.25, chance2 = 0.26, count = 1, type = INV_ENTITY},
                ["Очень редкое сломанное оружие"] = {loot = {"gun93","gun_lee_enf", "gun39", "gun27", "gun33", "gun31", "gun53", "gun23", "gun41", "gun61", "gun34", "gun37", "gun38"},
                chance1 = 0.26, chance2 = 0.264, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_bandage","ent_smallmedkit", "ent_shina", "ent_medkit", "ent_bandage", "ent_bandage"},
                chance1 = 0.264, chance2 = 0.274, count = 1, type = INV_ENTITY},
                ["Хлам"] = {loot = {"hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28"},
                chance1 = 0.274, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_c17/furniturecupboard001a.mdl",
            pos = {
                {Vector(-11820.867188, 9806.116211, 846.304688), Angle(0.247, -0.081, 8.719)},
                {Vector(-11762.679688, 9849.750000, 795.086853), Angle(-89.789, 88.840, -115.304)},
                {Vector(-11786.475586, 9734.389648, 795.069275), Angle(-89.947, -131.415, 180.000)},
            },
        },
        ["Хлам в гараже(большой)"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_spade", "tfa_nmrih_crowbar"},
                chance1 = 0, chance2 = 0.2, count = 2, type = INV_WEAPON},
                ["Редкое оружие ближнего боя"] = {loot = {"tfa_nmrih_sledge","tfa_nmrih_fubar", "tfa_breadnope_axe",},
                chance1 = 0.2, chance2 = 0.21, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52", "tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.21, chance2 = 0.22, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"sent_soccerball","ent_shina"},
                chance1 = 0.22, chance2 = 0.27, count = 1, type = INV_ENTITY},
                ["Химикаты"] = {loot = {"acetone","bismuth", "toluol", "benznatriya"},
                chance1 = 0.27, chance2 = 0.28, count = 1, type = INV_ENTITY},
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0.28, chance2 = 0.29, count = 1, type = INV_HATS},
                ["Хлам"] = {loot = {"hlam31", "hlam34", "hlam32", "hlam26", "newhlam6", "newhlam5", "hlam27", "newhlam1", "newhlam3", "hlam33", "update01_hlam8", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "hlam29", "update01_hlam3", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "hlam1", "hlam28",},
                chance1 = 0.29, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"hlam5", "update01_hlam2", "hlam4", "hlam11", "hlam2", "hlam3", "hlam8", "hlam10", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props/cs_militia/boxes_frontroom.mdl",
            pos = {
                {Vector(-12207.990234, 9367.959961, 769.232788), Angle(-0.063, 89.928, -1.140)},
                {Vector(-12116.026367, 9971.834961, 768.449158), Angle(-0.091, -89.966, -0.064)},
                {Vector(-12212.870117, 9986.006836, 768.326782), Angle(0.004, 90.247, 0.024)},
            },
        },
        ["Хлам в гараже(маленький)"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe"},
                chance1 = 0, chance2 = 0.08, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.08, chance2 = 0.1, count = 1, type = INV_ENTITY},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52", "tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.100, chance2 = 0.108, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_shina"},
                chance1 = 0.108, chance2 = 0.144, count = 1, type = INV_ENTITY},
                ["Химикаты"] = {loot = {"acetone","bismuth", "toluol", "benznatriya"},
                chance1 = 0.144, chance2 = 0.154, count = 1, type = INV_ENTITY},
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0.154, chance2 = 0.194, count = 1, type = INV_HATS},
                ["Хлам"] = {loot = {"hlam34","hlam26","newhlam6","hlam23","newhlam1","newhlam3","update01_hlam8","hlam9","newhlam4","newhlam2","update01_hlam6","hlam29","update01_hlam3","hlam19","hlam13","update01_hlam5","hlam24"},
                chance1 = 0.194, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Хлам редкий"] = {loot = {"ent_battery","update01_hlam2","hlam4","hlam11","hlam2","hlam3","hlam8","hlam14","update01_hlam4","update01_hlam1","hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_junk/plasticbucket001a.mdl",
            pos = {
                {Vector(-12166.558594, 10182.338867, 800.251221), Angle(0.191, 83.897, -2.126)},
                {Vector(-12124.748047, 10180.663086, 831.651978), Angle(0.191, 83.897, -2.126)},
                {Vector(-12207.122070, 10184.774414, 774.687622), Angle(0.191, 83.897, -2.126)},
                {Vector(-12079.027344, 9385.978516, 849.339172), Angle(0.191, 83.897, -2.126)},
                {Vector(-12079.131836, 9360.846680, 809.846252), Angle(-66.539, 162.005, -86.493)},
                {Vector(-12077.759766, 9400.652344, 830.261841), Angle(22.181, -1.143, 89.707)},
            },
        },
        ["Хлам в машине"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_spade", "tfa_nmrih_crowbar"},
                chance1 = 0, chance2 = 0.2, count = 2, type = INV_WEAPON},
                ["Редкое оружие ближнего боя"] = {loot = {"tfa_nmrih_sledge","tfa_nmrih_fubar", "tfa_breadnope_axe",},
                chance1 = 0.2, chance2 = 0.21, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52", "tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.21, chance2 = 0.22, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"sent_soccerball","ent_shina"},
                chance1 = 0.22, chance2 = 0.27, count = 1, type = INV_ENTITY},
                ["Химикаты"] = {loot = {"acetone","bismuth", "toluol", "benznatriya"},
                chance1 = 0.27, chance2 = 0.28, count = 1, type = INV_ENTITY},
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0.28, chance2 = 0.29, count = 1, type = INV_HATS},
                ["Хлам"] = {loot = {"hlam31", "hlam34", "hlam32", "hlam26", "newhlam6", "newhlam5", "hlam27", "newhlam1", "newhlam3", "hlam33", "update01_hlam8", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "hlam29", "update01_hlam3", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "hlam1", "hlam28",},
                chance1 = 0.29, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"hlam5", "update01_hlam2", "hlam4", "hlam11", "hlam2", "hlam3", "hlam8", "hlam10", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props/cs_assault/washer_box2.mdl",
            pos = {
                {Vector(-11682.900391, 9618.996094, 768.388672), Angle(-0.008, 0.067, -0.007)},
                {Vector(-10879.128906, 9040.227539, 818.701599), Angle(89.965, 134.059, 180.000)},
                {Vector(-10800.304688, 8834.305664, 804.922180), Angle(-89.833, -48.640, 90.296)},
            },
        },
        pos = Vector(-10579.544922, 13014.506836, 874.996216),
        minpos = Vector(-10523, 12965, 746),
        maxpos = Vector(-10867.440430, 13418.893555, 935.100647),
        height = 100,
    },
    ["House3"] = {
        ["Разный хлам"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife", "tfa_nmrih_hatchet","tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife",},
                chance1 = 0, chance2 = 0.16, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.16, chance2 = 0.20, count = 1, type = INV_ENTITY},
                ["Редкое оружие"] = {loot = {"weapon_rpw_binoculars","guitar_sad", "wep_jack_job_drpradio",},
                chance1 = 0.2, chance2 = 0.25, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52"},
                chance1 = 0.25, chance2 = 0.26, count = 1, type = INV_ENTITY},
                ["Очень редкое сломанное оружие"] = {loot = {"gun93","gun_lee_enf", "gun39", "gun27", "gun33", "gun31", "gun53", "gun23", "gun41", "gun61", "gun34", "gun37", "gun38"},
                chance1 = 0.26, chance2 = 0.264, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_bandage","ent_smallmedkit", "ent_shina", "ent_medkit", "ent_bandage", "ent_bandage"},
                chance1 = 0.264, chance2 = 0.274, count = 1, type = INV_ENTITY},
                ["Хлам"] = {loot = {"hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28"},
                chance1 = 0.274, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_wasteland/controlroom_storagecloset001a.mdl",
            pos = {
                {Vector(-8265.896484, 8416.366211, 889.202698), Angle(0.002, -87.139, 90.000)},
                {Vector(-8050.249023, 8234.488281, 802.946167), Angle(-84.929, 4.810, -57.352)},
            },
        },
        ["Холодильник"] = {
            loot = {
                ["Жрачка"] = { loot = {"models/foodnhouseholditems/chipsbag1.mdl","models/foodnhouseholditems/chipscheezit.mdl","models/foodnhouseholditems/chipsbag2.mdl","models/foodnhouseholditems/chipsdoritos2.mdl","models/foodnhouseholditems/chipsdoritos.mdl","models/foodnhouseholditems/chipsdoritos5.mdl","models/foodnhouseholditems/chipsdoritos4.mdl","models/foodnhouseholditems/chipsdoritos6.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipsfritoshoops.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipslays2.mdl","models/foodnhouseholditems/chipslays6.mdl","models/foodnhouseholditems/chipslays5.mdl","models/foodnhouseholditems/chipslays3.mdl","models/foodnhouseholditems/chipslays8.mdl","models/foodnhouseholditems/chipslays7.mdl","models/foodnhouseholditems/chipslays4.mdl","models/foodnhouseholditems/chipsbag3.mdl","models/foodnhouseholditems/chipstropical.mdl","models/foodnhouseholditems/chipstwisties.mdl","models/foodnhouseholditems/cookies.mdl","models/foodnhouseholditems/digestive.mdl","models/foodnhouseholditems/toffifee.mdl",}, 
                    chance1 = 0, chance2 = 0.45, count = 1, type = INV_FOOD
                },
                ["Вода"] = {
                    loot = {"models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/beercan01.mdl","models/foodnhouseholditems/beercan03.mdl","models/foodnhouseholditems/beer_master.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl"}, 
                    chance1 = 0.45, chance2 = 0.95, count = 1, type = INV_FOOD
                },
                ["Пустые банки"] = {
                    loot = {"hlam29", "update01_hlam7", "update01_hlam3", "update01_hlam11", "hlam29", "update01_hlam7", "update01_hlam3",}, 
                    chance1 = 0.95, chance2 = 1, count = 1, type = INV_ENTITY
                },
            },
            model = "models/props_c17/furniturefridge001a.mdl",
            pos = {
                {Vector(-8128.211914, 8774.534180, 901.374268), Angle(0.000, 175.170, -0.000)},
                {Vector(-7358.752930, 8897.123047, 851.820557), Angle(0.209, 179.607, 36.520)},
            },
        },
    },
    ["Больница"] = {
        ["Шкаф"] = {
            loot = {
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0, chance2 = 0.38, count = 1, type = INV_HATS},
                ["Энтити"] = {loot = {"ent_bandage","ent_smallmedkit","ent_shina", "ent_medkit", "ent_bandage", "ent_bandage "}, 
                chance1 = 0.38, chance2 = 0.42, count = 1, type = INV_ENTITY},
                ["Одежда"] = {loot = {"Брюки 1 (муж.)","Брюки 2 (муж.)","Брюки 3 (муж.)","Брюки 4 (муж.)","Брюки 5 (муж.)","Брюки 6 (муж.)","Брюки 7 (муж.)","Брюки 8 (муж.)","Брюки 9 (муж.)","Брюки 10 (муж.)","Футболка 1 (муж.)","Футболка 2 (муж.)","Футболка 3 (муж.)","Футболка 4 (муж.)","Футболка 5 (муж.)","Футболка 6 (муж.)","Футболка 7 (муж.)","Футболка 8 (муж.)","Футболка 9 (муж.)","Футболка 10 (муж.)","Футболка 10 (муж.)","Футболка 11 (муж.)","Футболка 12 (муж.)","Футболка 13 (муж.)","Футболка 14 (муж.)","Футболка 15 (муж.)","Футболка 16 (муж.)","Футболка 17 (муж.)","Футболка 18 (муж.)","Футболка 19 (муж.)","Футболка 20 (муж.)","Футболка 21 (муж.)","Футболка 22 (муж.)","Футболка 23 (муж.)","Футболка 24 (муж.)","Футболка 25 (муж.)","Футболка 26 (муж.)","Футболка 27 (муж.)","Футболка 28 (муж.)","Красная парка (муж.)","Синяя парка (муж.)","Куртка 3 (муж.)","Костюм 1 (муж.)"}, 
                chance1 = 0.42, chance2 = 0.8, count = 1, type = INV_CLOTHES},
                ["Оружие"] = {loot = {"tfa_nmrih_bat","tfa_nmrih_kknife", "tfa_nmrih_spade"}, 
                chance1 = 0.8, chance2 = 0.91, count = 1, type = INV_WEAPON},
                ["Редкое"] = {loot = {"firehelmet","motohelmet","ssh68","firehelmet","motohelmet","ssh68","turtlecap",'motohelmet','backpack_molle','backpack_trizip','backpack_citya','backpack_cityb','backpack_cityc','backpack_city2a','backpack_city2b','backpack_baselardwild'}, 
                chance1 = 0.91, chance2 = 0.97, count = 1, type = INV_HATS},
                ["Бронежилет"] = {loot = {"policevest"}, 
                chance1 = 0.97, chance2 = 0.99, count = 1, type = INV_HATS},
                ["Очень редкое"] = {loot = {"backpack_pilgrim","backpack_pilgrim2a","backpack_pilgrim2b","backpack_pilgrim2c", "pressvest", "helmetmich", "policevest"}, 
                chance1 = 0.99, chance2 = 1, count = 1, type = INV_HATS},
            },
            model = "models/props_c17/furnituredresser001a.mdl",
            pos = {
                {Vector(-5341.902832, 13404.320312, 808.426392), Angle(63.734, 174.332, 11.682)},
                {Vector(-4787.742188, 14271.978516, 960.946899), Angle(1.617, 90.077, 0.000)},
                {Vector(-6444.546875, 14151.372070, 946.790710), Angle(0.015, -69.777, 86.587)},
            },
        },
        ["Шкафчик бытовой"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife", "tfa_nmrih_hatchet","tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife",},
                chance1 = 0, chance2 = 0.16, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.16, chance2 = 0.20, count = 1, type = INV_ENTITY},
                ["Редкое оружие"] = {loot = {"weapon_rpw_binoculars","guitar_sad", "wep_jack_job_drpradio",},
                chance1 = 0.2, chance2 = 0.25, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52"},
                chance1 = 0.25, chance2 = 0.26, count = 1, type = INV_ENTITY},
                ["Очень редкое сломанное оружие"] = {loot = {"gun93","gun_lee_enf", "gun39", "gun27", "gun33", "gun31", "gun53", "gun23", "gun41", "gun61", "gun34", "gun37", "gun38"},
                chance1 = 0.26, chance2 = 0.264, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_bandage","ent_smallmedkit", "ent_shina", "ent_medkit", "ent_bandage", "ent_bandage"},
                chance1 = 0.264, chance2 = 0.274, count = 1, type = INV_ENTITY},
                ["Хлам"] = {loot = {"hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28"},
                chance1 = 0.274, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_c17/furnituredrawer001a.mdl",
            pos = {
                {Vector(-4828.606445, 13874.513672, 939.936890), Angle(0.513, -90.012, 0.015)},
                {Vector(-4804.328125, 13950.625000, 932.363708), Angle(86.657, 104.632, -0.000)},
                {Vector(-6422.960938, 14278.736328, 795.902222), Angle(0.180, 87.284, 0.034)},
            },
        },
        ["Железный шкаф"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife", "tfa_nmrih_hatchet","tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife",},
                chance1 = 0, chance2 = 0.16, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.16, chance2 = 0.20, count = 1, type = INV_ENTITY},
                ["Редкое оружие"] = {loot = {"weapon_rpw_binoculars","guitar_sad", "wep_jack_job_drpradio",},
                chance1 = 0.2, chance2 = 0.25, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52"},
                chance1 = 0.25, chance2 = 0.26, count = 1, type = INV_ENTITY},
                ["Очень редкое сломанное оружие"] = {loot = {"gun93","gun_lee_enf", "gun39", "gun27", "gun33", "gun31", "gun53", "gun23", "gun41", "gun61", "gun34", "gun37", "gun38"},
                chance1 = 0.26, chance2 = 0.264, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_bandage","ent_smallmedkit", "ent_shina", "ent_medkit", "ent_bandage", "ent_bandage"},
                chance1 = 0.264, chance2 = 0.274, count = 1, type = INV_ENTITY},
                ["Хлам"] = {loot = {"hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28"},
                chance1 = 0.274, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_wasteland/controlroom_storagecloset001a.mdl",
            pos = {
                {Vector(-5536.772949, 13000.470703, 819.526611), Angle(0.046, -179.936, -0.017)},
                {Vector(-6111.682617, 12873.833008, 963.482666), Angle(-0.007, 0.013, -0.037)},
                {Vector(-5355.559570, 13023.644531, 963.517944), Angle(-0.033, -89.965, 0.005)},
                {Vector(-5637.725586, 14902.445312, 936.394470), Angle(-89.919, 131.675, -89.127)},
            },
        },
        ["Медицина"] = {
            loot = {
                ["Нож"] = {loot = {"tfa_nmrih_kknife"},
                chance1 = 0, chance2 = 0.05, count = 1, type = INV_WEAPON},
                ["Аптечка"] = {loot = {"ent_medkit"},
                chance1 = 0.05, chance2 = 0.10, count = 1, type = INV_ENTITY},
                ["Бинт"] = {loot = {"ent_bandage"},
                chance1 = 0.10, chance2 = 0.60, count = 1, type = INV_ENTITY},
                ["Обезболивающее"] = {loot = {"sent_smallmedkit"},
                chance1 = 0.60, chance2 = 0.80, count = 1, type = INV_ENTITY},
                ["Шприц"] = {loot = {"ent_medboost"},
                chance1 = 0.80, chance2 = 0.81, count = 1, type = INV_ENTITY},
                ["Шина"] = {loot = {"ent_shina"},
                chance1 = 0.81, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props/generic/medkit01.mdl",
            pos = {
                {Vector(-6356.017578, 14290.089844, 787.289917), Angle(0.128, 81.340, -0.117)},
                {Vector(-5984.594238, 14859.871094, 791.406738), Angle(61.652, -179.908, 0.036)},
                {Vector(-5637.279785, 15025.692383, 775.825317), Angle(0.043, -132.362, 0.020)},
                {Vector(-4900.741211, 13812.669922, 786.898132), Angle(37.306, 62.740, 1.498)},
            },
        },
        ["Медицина"] = {
            loot = {
                ["Нож"] = {loot = {"tfa_nmrih_kknife"},
                chance1 = 0, chance2 = 0.05, count = 1, type = INV_WEAPON},
                ["Аптечка"] = {loot = {"ent_medkit"},
                chance1 = 0.05, chance2 = 0.10, count = 1, type = INV_ENTITY},
                ["Бинт"] = {loot = {"ent_bandage"},
                chance1 = 0.10, chance2 = 0.60, count = 1, type = INV_ENTITY},
                ["Обезболивающее"] = {loot = {"sent_smallmedkit"},
                chance1 = 0.60, chance2 = 0.80, count = 1, type = INV_ENTITY},
                ["Шприц"] = {loot = {"ent_medboost"},
                chance1 = 0.80, chance2 = 0.81, count = 1, type = INV_ENTITY},
                ["Шина"] = {loot = {"ent_shina"},
                chance1 = 0.81, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props/generic/medkit01.mdl",
            pos = {
                {Vector(-6314.440918, 14313.319336, 920.298340), Angle(0.000, 148.689, 0.000)},
                {Vector(-5944.409668, 14969.877930, 935.162964), Angle(-0.035, -38.550, -0.228)},
                {Vector(-5697.588867, 12862.403320, 958.797668), Angle(-0.031, -179.929, 0.077)},
                {Vector(-5269.320801, 15045.045898, 930.231934), Angle(-0.197, -128.684, -0.022)},
            },
        },
        ["Шкафчик на стене"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife", "tfa_nmrih_hatchet","tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife",},
                chance1 = 0, chance2 = 0.16, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.16, chance2 = 0.20, count = 1, type = INV_ENTITY},
                ["Редкое оружие"] = {loot = {"weapon_rpw_binoculars","guitar_sad", "wep_jack_job_drpradio",},
                chance1 = 0.2, chance2 = 0.25, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52"},
                chance1 = 0.25, chance2 = 0.26, count = 1, type = INV_ENTITY},
                ["Очень редкое сломанное оружие"] = {loot = {"gun93","gun_lee_enf", "gun39", "gun27", "gun33", "gun31", "gun53", "gun23", "gun41", "gun61", "gun34", "gun37", "gun38"},
                chance1 = 0.26, chance2 = 0.264, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_bandage","ent_smallmedkit", "ent_shina", "ent_medkit", "ent_bandage", "ent_bandage"},
                chance1 = 0.264, chance2 = 0.274, count = 1, type = INV_ENTITY},
                ["Хлам"] = {loot = {"hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28"},
                chance1 = 0.274, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_c17/furniturecupboard001a.mdl",
            pos = {
                {Vector(-4965.393555, 14323.881836, 838.956909), Angle(0.053, 0.099, 0)},
                {Vector(-6298.699219, 13820.384766, 847.481140), Angle(-0.024, 179.993, 7.459)},
            },
        },

    },
    ["Завод"] = {
        ["Коробка большая"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_spade", "tfa_nmrih_crowbar"},
                chance1 = 0, chance2 = 0.3, count = 2, type = INV_WEAPON},
                ["Редкое оружие ближнего боя"] = {loot = {"tfa_nmrih_sledge","tfa_nmrih_fubar", "tfa_breadnope_axe",},
                chance1 = 0.3, chance2 = 0.32, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52", "tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.32, chance2 = 0.325, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"sent_soccerball","ent_shina"},
                chance1 = 0.325, chance2 = 0.335, count = 1, type = INV_ENTITY},
                ["Химикаты"] = {loot = {"acetone","bismuth", "toluol", "benznatriya"},
                chance1 = 0.335, chance2 = 0.345, count = 1, type = INV_ENTITY},
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0.345, chance2 = 0.347, count = 1, type = INV_HATS},
                ["Хлам"] = {loot = {"hlam31", "hlam34", "hlam32", "hlam26", "newhlam6", "newhlam5", "hlam27", "newhlam1", "newhlam3", "hlam33", "update01_hlam8", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "hlam29", "update01_hlam3", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "hlam1", "hlam28",},
                chance1 = 0.347, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","hlam5", "update01_hlam2", "hlam4", "hlam11", "hlam2", "hlam3", "hlam8", "hlam10", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },         
            model = "models/props/cs_assault/dryer_box.mdl",
            pos = {
                {Vector(-3202.043213, 7611.623535, 771.486572), Angle(0.000, -24.465, 0.000)},
                {Vector(-3527.310547, 8656.948242, 829.506775), Angle(0.097, 87.012, -0.029)},

            },
        },
        ["Коробка большая"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_spade", "tfa_nmrih_crowbar"},
                chance1 = 0, chance2 = 0.3, count = 2, type = INV_WEAPON},
                ["Редкое оружие ближнего боя"] = {loot = {"tfa_nmrih_sledge","tfa_nmrih_fubar", "tfa_breadnope_axe",},
                chance1 = 0.3, chance2 = 0.32, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52", "tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.32, chance2 = 0.325, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"sent_soccerball","ent_shina"},
                chance1 = 0.325, chance2 = 0.335, count = 1, type = INV_ENTITY},
                ["Химикаты"] = {loot = {"acetone","bismuth", "toluol", "benznatriya"},
                chance1 = 0.335, chance2 = 0.345, count = 1, type = INV_ENTITY},
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0.345, chance2 = 0.347, count = 1, type = INV_HATS},
                ["Хлам"] = {loot = {"hlam31", "hlam34", "hlam32", "hlam26", "newhlam6", "newhlam5", "hlam27", "newhlam1", "newhlam3", "hlam33", "update01_hlam8", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "hlam29", "update01_hlam3", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "hlam1", "hlam28",},
                chance1 = 0.347, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","hlam5", "update01_hlam2", "hlam4", "hlam11", "hlam2", "hlam3", "hlam8", "hlam10", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            }, 
            model = "models/props/cs_militia/crate_extrasmallmill.mdl",
            pos = {
                {Vector(-2998.465088, 7465.498535, 771.828308), Angle(-0.056, 128.118, 0.000)},
                {Vector(-3179.379883, 8822.792969, 784.598938), Angle(0.041, 0.085, -0.008)},
            },
        },
        ["Химикаты"] = {
            loot = {
                ["Химикаты обычные"] = {loot = {"acetone","benznatriya","bismuth","toluol"}, chance1 = 0, chance2 = 0.1, count = 1, type = INV_ENTITY},
                ["Химикаты редкие"] = {loot = {"pervodoroda","propglicogol"}, chance1 = 0.1, chance2 = 0.11, count = 1, type = INV_ENTITY},
                ["Химикат"] = {loot = {"reaktiv"}, chance1 = 0.11, chance2 = 0.18, count = 1, type = INV_ENTITY},
                ["Противогаз"] = {loot = {"m10"}, chance1 = 0.18, chance2 = 0.32, count = 1, type = INV_HATS},
            },
            model = "models/winningrook/gtav/meth/phosphoru/phosphoru.mdl",
            pos = {
                {Vector(-534.494202, 7571.459961, 796.295410), Angle(0.352, -179.970, 0.027)},
                {Vector(-1836.402588, 8830.290039, 534.150208), Angle(-89.458, -3.844, -89.612)},
                {Vector(-5355.559570, 13023.644531, 963.517944), Angle(-0.033, -89.965, 0.005)},
                {Vector(-5637.725586, 14902.445312, 936.394470), Angle(-89.919, 131.675, -89.127)},
            },
        },
        ["Коробка"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_spade", "tfa_nmrih_crowbar"},
                chance1 = 0, chance2 = 0.2, count = 2, type = INV_WEAPON},
                ["Редкое оружие ближнего боя"] = {loot = {"tfa_nmrih_sledge","tfa_nmrih_fubar", "tfa_breadnope_axe",},
                chance1 = 0.2, chance2 = 0.21, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52", "tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.21, chance2 = 0.22, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"sent_soccerball","ent_shina"},
                chance1 = 0.22, chance2 = 0.27, count = 1, type = INV_ENTITY},
                ["Химикаты"] = {loot = {"acetone","bismuth", "toluol", "benznatriya"},
                chance1 = 0.27, chance2 = 0.28, count = 1, type = INV_ENTITY},
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0.28, chance2 = 0.29, count = 1, type = INV_HATS},
                ["Хлам"] = {loot = {"hlam31", "hlam34", "hlam32", "hlam26", "newhlam6", "newhlam5", "hlam27", "newhlam1", "newhlam3", "hlam33", "update01_hlam8", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "hlam29", "update01_hlam3", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "hlam1", "hlam28",},
                chance1 = 0.29, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"hlam5", "update01_hlam2", "hlam4", "hlam11", "hlam2", "hlam3", "hlam8", "hlam10", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props/generic/cardboardbox05.mdl",
            pos = {
                {Vector(-3197.215576, 7610.370117, 771.568848), Angle(0.241, -14.506, 0.133)},
                {Vector(-3526.889893, 8831.266602, 784.485840), Angle(0.040, 23.833, -0.026)},
            },
        },
        ["Химикаты"] = {
            loot = {
                ["Химикаты обычные"] = {loot = {"acetone","benznatriya","bismuth","toluol"}, chance1 = 0, chance2 = 0.1, count = 1, type = INV_ENTITY},
                ["Химикаты редкие"] = {loot = {"pervodoroda","propglicogol"}, chance1 = 0.1, chance2 = 0.11, count = 1, type = INV_ENTITY},
                ["Химикат"] = {loot = {"reaktiv"}, chance1 = 0.11, chance2 = 0.18, count = 1, type = INV_ENTITY},
                ["Противогаз"] = {loot = {"m10"}, chance1 = 0.18, chance2 = 0.32, count = 1, type = INV_HATS},
            },
            model = "models/props/de_nuke/nuclearcontainerboxclosed.mdl",
            pos = {
                {Vector(-1112.654541, 10657.485352, 796.346191), Angle(-0.117, -0.049, 0.417)},
                {Vector(-350.936005, 11030.525391, 796.334351), Angle(0.028, 90.450, -0.090)},
            },
        },
        ["Шкаф железный факторка"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_spade", "tfa_nmrih_crowbar"},
                chance1 = 0, chance2 = 0.3, count = 2, type = INV_WEAPON},
                ["Редкое оружие ближнего боя"] = {loot = {"tfa_nmrih_sledge","tfa_nmrih_fubar", "tfa_breadnope_axe",},
                chance1 = 0.3, chance2 = 0.32, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52", "tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.32, chance2 = 0.325, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"sent_soccerball","ent_shina"},
                chance1 = 0.325, chance2 = 0.335, count = 1, type = INV_ENTITY},
                ["Химикаты"] = {loot = {"acetone","bismuth", "toluol", "benznatriya"},
                chance1 = 0.335, chance2 = 0.345, count = 1, type = INV_ENTITY},
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0.345, chance2 = 0.347, count = 1, type = INV_HATS},
                ["Хлам"] = {loot = {"hlam31", "hlam34", "hlam32", "hlam26", "newhlam6", "newhlam5", "hlam27", "newhlam1", "newhlam3", "hlam33", "update01_hlam8", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "hlam29", "update01_hlam3", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "hlam1", "hlam28",},
                chance1 = 0.347, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","hlam5", "update01_hlam2", "hlam4", "hlam11", "hlam2", "hlam3", "hlam8", "hlam10", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },            model = "models/props_wasteland/controlroom_storagecloset001a.mdl",
            pos = {
                {Vector(-856.383789, 9577.489258, 956.646973), Angle(-2.063, -179.980, -0.052)},
                {Vector(-710.807861, 10697.272461, 811.836975), Angle(-61.317, -90.189, 0.083)},
            },
        },
        ["Железный кейс факторка"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe"},
                chance1 = 0, chance2 = 0.08, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.08, chance2 = 0.1, count = 1, type = INV_ENTITY},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52", "tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.100, chance2 = 0.108, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_shina"},
                chance1 = 0.108, chance2 = 0.144, count = 1, type = INV_ENTITY},
                ["Химикаты"] = {loot = {"acetone","bismuth", "toluol", "benznatriya"},
                chance1 = 0.144, chance2 = 0.154, count = 1, type = INV_ENTITY},
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0.154, chance2 = 0.194, count = 1, type = INV_HATS},
                ["Хлам"] = {loot = {"hlam34","hlam26","newhlam6","hlam23","newhlam1","newhlam3","update01_hlam8","hlam9","newhlam4","newhlam2","update01_hlam6","hlam29","update01_hlam3","hlam19","hlam13","update01_hlam5","hlam24"},
                chance1 = 0.194, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Хлам редкий"] = {loot = {"ent_battery","update01_hlam2","hlam4","hlam11","hlam2","hlam3","hlam8","hlam14","update01_hlam4","update01_hlam1","hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props/generic/ammocrate01.mdl",
            pos = {
                {Vector(-738.247192, 10646.924805, 946.034790), Angle(-0.000, 7.196, 0.000)},
                {Vector(-282.662598, 10874.837891, 810.134399), Angle(0.000, -179.660, 0.000)},
            },
        }, 
        minpos = Vector(-14010.547852, 14840.890625, 1288.614502),
        maxpos = Vector(-14897.722656, 15217.665039, 1405.738892),
        height = 100,
    },
    ["Школа"] = {
        ["Стол железный(канцелярия хлам)"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife", "tfa_nmrih_hatchet","tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife",},
                chance1 = 0, chance2 = 0.16, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.16, chance2 = 0.20, count = 1, type = INV_ENTITY},
                ["Редкое оружие"] = {loot = {"weapon_rpw_binoculars","guitar_sad", "wep_jack_job_drpradio",},
                chance1 = 0.2, chance2 = 0.25, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52"},
                chance1 = 0.25, chance2 = 0.26, count = 1, type = INV_ENTITY},
                ["Очень редкое сломанное оружие"] = {loot = {"gun93","gun_lee_enf", "gun39", "gun27", "gun33", "gun31", "gun53", "gun23", "gun41", "gun61", "gun34", "gun37", "gun38"},
                chance1 = 0.26, chance2 = 0.264, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_bandage","ent_smallmedkit", "ent_shina", "ent_medkit", "ent_bandage", "ent_bandage"},
                chance1 = 0.264, chance2 = 0.274, count = 1, type = INV_ENTITY},
                ["Хлам"] = {loot = {"hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28"},
                chance1 = 0.274, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_wasteland/controlroom_desk001b.mdl",
            pos = {
                {Vector(-12535.299805, 2181.024170, 340.943848), Angle(-89.065, 166.579, -1.009)},
                {Vector(-12919.511719, 2393.073730, 479.984741), Angle(-0.141, 109.974, 0.005)},

            },
        },
        ["Большая полка с ящиками факторка"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_spade", "tfa_nmrih_crowbar"},
                chance1 = 0, chance2 = 0.2, count = 2, type = INV_WEAPON},
                ["Редкое оружие ближнего боя"] = {loot = {"tfa_nmrih_sledge","tfa_nmrih_fubar", "tfa_breadnope_axe",},
                chance1 = 0.2, chance2 = 0.21, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52", "tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.21, chance2 = 0.22, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"sent_soccerball","ent_shina"},
                chance1 = 0.22, chance2 = 0.27, count = 1, type = INV_ENTITY},
                ["Химикаты"] = {loot = {"acetone","bismuth", "toluol", "benznatriya"},
                chance1 = 0.27, chance2 = 0.28, count = 1, type = INV_ENTITY},
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0.28, chance2 = 0.29, count = 1, type = INV_HATS},
                ["Хлам"] = {loot = {"hlam31", "hlam34", "hlam32", "hlam26", "newhlam6", "newhlam5", "hlam27", "newhlam1", "newhlam3", "hlam33", "update01_hlam8", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "hlam29", "update01_hlam3", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "hlam1", "hlam28",},
                chance1 = 0.29, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"hlam5", "update01_hlam2", "hlam4", "hlam11", "hlam2", "hlam3", "hlam8", "hlam10", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_industrial/warehouse_shelf002.mdl",
            pos = {
                {Vector(-13066.999023, 4421.567871, 319.946503), Angle(0.000, 45.000, 0.000)},
                {Vector(-12764.759766, 4811.055664, 465.558960), Angle(-0.000, -135.000, 0.000)},
            },
        },
        ["Цемент"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_spade", "tfa_nmrih_crowbar"},
                chance1 = 0, chance2 = 0.3, count = 2, type = INV_WEAPON},
                ["Редкое оружие ближнего боя"] = {loot = {"tfa_nmrih_sledge","tfa_nmrih_fubar", "tfa_breadnope_axe",},
                chance1 = 0.3, chance2 = 0.32, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52", "tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.32, chance2 = 0.325, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"sent_soccerball","ent_shina"},
                chance1 = 0.325, chance2 = 0.335, count = 1, type = INV_ENTITY},
                ["Химикаты"] = {loot = {"acetone","bismuth", "toluol", "benznatriya"},
                chance1 = 0.335, chance2 = 0.345, count = 1, type = INV_ENTITY},
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0.345, chance2 = 0.347, count = 1, type = INV_HATS},
                ["Хлам"] = {loot = {"hlam31", "hlam34", "hlam32", "hlam26", "newhlam6", "newhlam5", "hlam27", "newhlam1", "newhlam3", "hlam33", "update01_hlam8", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "hlam29", "update01_hlam3", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "hlam1", "hlam28",},
                chance1 = 0.347, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","hlam5", "update01_hlam2", "hlam4", "hlam11", "hlam2", "hlam3", "hlam8", "hlam10", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },  
            model = "models/props/de_prodigy/concretebags2.mdl",
            pos = {
                {Vector(-13030.416992, 2506.603760, 319.965210), Angle(0.000, 28.403, 0.000)},
                {Vector(-12626.108398, 2230.602539, 463.965210), Angle(0.000, 49.239, 0.000)},
                {Vector(-13575.214844, 4068.454834, 463.965210), Angle(0.000, -83.371, 0.000)},
                {Vector(-12733.001953, 4611.852539, 463.965210), Angle(0.000, 49.239, 0.000)},
            },
        },
    },
    ["Маленький дом"] = {
        ["Шкаф"] = {
            loot = {
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0, chance2 = 0.38, count = 1, type = INV_HATS},
                ["Энтити"] = {loot = {"ent_bandage","ent_smallmedkit","ent_shina", "ent_medkit", "ent_bandage", "ent_bandage "}, 
                chance1 = 0.38, chance2 = 0.42, count = 1, type = INV_ENTITY},
                ["Одежда"] = {loot = {"Брюки 1 (муж.)","Брюки 2 (муж.)","Брюки 3 (муж.)","Брюки 4 (муж.)","Брюки 5 (муж.)","Брюки 6 (муж.)","Брюки 7 (муж.)","Брюки 8 (муж.)","Брюки 9 (муж.)","Брюки 10 (муж.)","Футболка 1 (муж.)","Футболка 2 (муж.)","Футболка 3 (муж.)","Футболка 4 (муж.)","Футболка 5 (муж.)","Футболка 6 (муж.)","Футболка 7 (муж.)","Футболка 8 (муж.)","Футболка 9 (муж.)","Футболка 10 (муж.)","Футболка 10 (муж.)","Футболка 11 (муж.)","Футболка 12 (муж.)","Футболка 13 (муж.)","Футболка 14 (муж.)","Футболка 15 (муж.)","Футболка 16 (муж.)","Футболка 17 (муж.)","Футболка 18 (муж.)","Футболка 19 (муж.)","Футболка 20 (муж.)","Футболка 21 (муж.)","Футболка 22 (муж.)","Футболка 23 (муж.)","Футболка 24 (муж.)","Футболка 25 (муж.)","Футболка 26 (муж.)","Футболка 27 (муж.)","Футболка 28 (муж.)","Красная парка (муж.)","Синяя парка (муж.)","Куртка 3 (муж.)","Костюм 1 (муж.)"}, 
                chance1 = 0.42, chance2 = 0.8, count = 1, type = INV_CLOTHES},
                ["Оружие"] = {loot = {"tfa_nmrih_bat","tfa_nmrih_kknife", "tfa_nmrih_spade"}, 
                chance1 = 0.8, chance2 = 0.91, count = 1, type = INV_WEAPON},
                ["Редкое"] = {loot = {"firehelmet","motohelmet","ssh68","firehelmet","motohelmet","ssh68","turtlecap",'motohelmet','backpack_molle','backpack_trizip','backpack_citya','backpack_cityb','backpack_cityc','backpack_city2a','backpack_city2b','backpack_baselardwild'}, 
                chance1 = 0.91, chance2 = 0.97, count = 1, type = INV_HATS},
                ["Бронежилет"] = {loot = {"policevest"}, 
                chance1 = 0.97, chance2 = 0.99, count = 1, type = INV_HATS},
                ["Очень редкое"] = {loot = {"backpack_pilgrim","backpack_pilgrim2a","backpack_pilgrim2b","backpack_pilgrim2c", "pressvest", "helmetmich", "policevest"}, 
                chance1 = 0.99, chance2 = 1, count = 1, type = INV_HATS},
            },
            model = "models/props_c17/furnituredresser001a.mdl",
            pos = {
                {Vector(-10464.530273, 16.373371, 359.645355), Angle(-87.910, -151.822, 45.031)},
                {Vector(-10567.888672, 179.955627, 380.196625), Angle(0.000, 177.379, 0.000)},
            },
        },
    },
    ["Заброшенный город"] = {
        ["Столик"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife", "tfa_nmrih_hatchet","tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife",},
                chance1 = 0, chance2 = 0.16, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.16, chance2 = 0.20, count = 1, type = INV_ENTITY},
                ["Редкое оружие"] = {loot = {"weapon_rpw_binoculars","guitar_sad", "wep_jack_job_drpradio",},
                chance1 = 0.2, chance2 = 0.25, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52"},
                chance1 = 0.25, chance2 = 0.26, count = 1, type = INV_ENTITY},
                ["Очень редкое сломанное оружие"] = {loot = {"gun93","gun_lee_enf", "gun39", "gun27", "gun33", "gun31", "gun53", "gun23", "gun41", "gun61", "gun34", "gun37", "gun38"},
                chance1 = 0.26, chance2 = 0.264, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_bandage","ent_smallmedkit", "ent_shina", "ent_medkit", "ent_bandage", "ent_bandage"},
                chance1 = 0.264, chance2 = 0.274, count = 1, type = INV_ENTITY},
                ["Хлам"] = {loot = {"hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28"},
                chance1 = 0.274, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_c17/furnituredresser001a.mdl",
            pos = {
                {Vector(-14341.072266, -14461.669922, 1243.773682), Angle(0.034, 179.698, 179.992)},
                {Vector(-13801.950195, -13631.931641, 1244.324829), Angle(0.191, 0.000, 0.000)},
            },
        },
        ["Коробка факторка"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_spade", "tfa_nmrih_crowbar"},
                chance1 = 0, chance2 = 0.3, count = 2, type = INV_WEAPON},
                ["Редкое оружие ближнего боя"] = {loot = {"tfa_nmrih_sledge","tfa_nmrih_fubar", "tfa_breadnope_axe",},
                chance1 = 0.3, chance2 = 0.32, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52", "tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.32, chance2 = 0.325, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"sent_soccerball","ent_shina"},
                chance1 = 0.325, chance2 = 0.335, count = 1, type = INV_ENTITY},
                ["Химикаты"] = {loot = {"acetone","bismuth", "toluol", "benznatriya"},
                chance1 = 0.335, chance2 = 0.345, count = 1, type = INV_ENTITY},
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0.345, chance2 = 0.347, count = 1, type = INV_HATS},
                ["Хлам"] = {loot = {"hlam31", "hlam34", "hlam32", "hlam26", "newhlam6", "newhlam5", "hlam27", "newhlam1", "newhlam3", "hlam33", "update01_hlam8", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "hlam29", "update01_hlam3", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "hlam1", "hlam28",},
                chance1 = 0.347, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","hlam5", "update01_hlam2", "hlam4", "hlam11", "hlam2", "hlam3", "hlam8", "hlam10", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            }, 
            model = "models/props/cs_militia/crate_extrasmallmill.mdl",
            pos = {
                {Vector(-14205.262695, -13841.719727, 1376.475098), Angle(0.000, 113.233, 0.000)},
                {Vector(-13710.171875, -14673.010742, 1488.508423), Angle(0.000, 72.277, 0.000)},
            },
        },
    },
    ["Дом и гараж"] = {
        ["Холодильник"] = {
            loot = {
                ["Жрачка"] = { loot = {"models/foodnhouseholditems/chipsbag1.mdl","models/foodnhouseholditems/chipscheezit.mdl","models/foodnhouseholditems/chipsbag2.mdl","models/foodnhouseholditems/chipsdoritos2.mdl","models/foodnhouseholditems/chipsdoritos.mdl","models/foodnhouseholditems/chipsdoritos5.mdl","models/foodnhouseholditems/chipsdoritos4.mdl","models/foodnhouseholditems/chipsdoritos6.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipsfritoshoops.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipslays2.mdl","models/foodnhouseholditems/chipslays6.mdl","models/foodnhouseholditems/chipslays5.mdl","models/foodnhouseholditems/chipslays3.mdl","models/foodnhouseholditems/chipslays8.mdl","models/foodnhouseholditems/chipslays7.mdl","models/foodnhouseholditems/chipslays4.mdl","models/foodnhouseholditems/chipsbag3.mdl","models/foodnhouseholditems/chipstropical.mdl","models/foodnhouseholditems/chipstwisties.mdl","models/foodnhouseholditems/cookies.mdl","models/foodnhouseholditems/digestive.mdl","models/foodnhouseholditems/toffifee.mdl",}, 
                    chance1 = 0, chance2 = 0.45, count = 1, type = INV_FOOD
                },
                ["Вода"] = {
                    loot = {"models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/beercan01.mdl","models/foodnhouseholditems/beercan03.mdl","models/foodnhouseholditems/beer_master.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl"}, 
                    chance1 = 0.45, chance2 = 0.95, count = 1, type = INV_FOOD
                },
                ["Пустые банки"] = {
                    loot = {"hlam29", "update01_hlam7", "update01_hlam3", "update01_hlam11", "hlam29", "update01_hlam7", "update01_hlam3",}, 
                    chance1 = 0.95, chance2 = 1, count = 1, type = INV_ENTITY
                },
            },
            model = "models/props_c17/furniturefridge001a.mdl",
            pos = {
                {Vector(-11615.949219, -12574.544922, 858.312988), Angle(-90.000, -90.000, 180.000)},
                {Vector(-11304.470703, -12718.584961, 890.114685), Angle(0.000, 136.646, 0.000)},
            },
        },
        ["Инструменты"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe"},
                chance1 = 0, chance2 = 0.08, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.08, chance2 = 0.1, count = 1, type = INV_ENTITY},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52", "tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.100, chance2 = 0.108, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_shina"},
                chance1 = 0.108, chance2 = 0.144, count = 1, type = INV_ENTITY},
                ["Химикаты"] = {loot = {"acetone","bismuth", "toluol", "benznatriya"},
                chance1 = 0.144, chance2 = 0.154, count = 1, type = INV_ENTITY},
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0.154, chance2 = 0.194, count = 1, type = INV_HATS},
                ["Хлам"] = {loot = {"hlam34","hlam26","newhlam6","hlam23","newhlam1","newhlam3","update01_hlam8","hlam9","newhlam4","newhlam2","update01_hlam6","hlam29","update01_hlam3","hlam19","hlam13","update01_hlam5","hlam24"},
                chance1 = 0.194, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Хлам редкий"] = {loot = {"ent_battery","update01_hlam2","hlam4","hlam11","hlam2","hlam3","hlam8","hlam14","update01_hlam4","update01_hlam1","hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_junk/plasticbucket001a.mdl",
            pos = {
                {Vector(-11197.583984, -12478.748047, 849.927673), Angle(21.105, 168.340, 88.862)},
                {Vector(-10962.842773, -12671.247070, 848.767578), Angle(-23.121, 77.382, 90.155)},
            },
        },
    },
    ["Свалка"] = {
        ["Рад материалы"] = {
            loot = {
                ["Химикаты обычные"] = {loot = {"acetone","benznatriya","bismuth","toluol"}, chance1 = 0, chance2 = 0.1, count = 1, type = INV_ENTITY},
                ["Химикаты редкие"] = {loot = {"pervodoroda","propglicogol"}, chance1 = 0.1, chance2 = 0.11, count = 1, type = INV_ENTITY},
                ["Химикат"] = {loot = {"reaktiv"}, chance1 = 0.11, chance2 = 0.18, count = 1, type = INV_ENTITY},
                ["Противогаз"] = {loot = {"m10"}, chance1 = 0.18, chance2 = 0.32, count = 1, type = INV_HATS},
            },
            model = "models/props/de_train/barrel.mdl",
            pos = {
                {Vector(3508.450684, -10923.217773, 1320.312500), Angle(-90.000, -90.000, 180.000)},
                {Vector(4147.598145, -11183.282227, 1287.966309), Angle(90.000, 135.000, 180.000)},
                {Vector(5213.720215, -11873.851562, 1296.332764), Angle(0.019, 122.140, -0.030)},
            },
        },
        ["Ящик факторка"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_spade", "tfa_nmrih_crowbar"},
                chance1 = 0, chance2 = 0.3, count = 2, type = INV_WEAPON},
                ["Редкое оружие ближнего боя"] = {loot = {"tfa_nmrih_sledge","tfa_nmrih_fubar", "tfa_breadnope_axe",},
                chance1 = 0.3, chance2 = 0.32, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52", "tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.32, chance2 = 0.325, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"sent_soccerball","ent_shina"},
                chance1 = 0.325, chance2 = 0.335, count = 1, type = INV_ENTITY},
                ["Химикаты"] = {loot = {"acetone","bismuth", "toluol", "benznatriya"},
                chance1 = 0.335, chance2 = 0.345, count = 1, type = INV_ENTITY},
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0.345, chance2 = 0.347, count = 1, type = INV_HATS},
                ["Хлам"] = {loot = {"hlam31", "hlam34", "hlam32", "hlam26", "newhlam6", "newhlam5", "hlam27", "newhlam1", "newhlam3", "hlam33", "update01_hlam8", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "hlam29", "update01_hlam3", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "hlam1", "hlam28",},
                chance1 = 0.347, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","hlam5", "update01_hlam2", "hlam4", "hlam11", "hlam2", "hlam3", "hlam8", "hlam10", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },  
            model = "models/props/CS_militia/crate_extrasmallmill.mdl",
            pos = {
                {Vector(3921.430664, -11286.960938, 1295.925903), Angle(0.000, 45.000, 0.000)},
                {Vector(4104.343262, -11411.295898, 1297.569824), Angle(-5.799, -35.751, -21.074)},
            },
        },
    },
    ["Город возле военной базы"] = {
        ["Холодильник"] = {
            loot = {
                ["Жрачка"] = { loot = {"models/foodnhouseholditems/chipsbag1.mdl","models/foodnhouseholditems/chipscheezit.mdl","models/foodnhouseholditems/chipsbag2.mdl","models/foodnhouseholditems/chipsdoritos2.mdl","models/foodnhouseholditems/chipsdoritos.mdl","models/foodnhouseholditems/chipsdoritos5.mdl","models/foodnhouseholditems/chipsdoritos4.mdl","models/foodnhouseholditems/chipsdoritos6.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipsfritoshoops.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipslays2.mdl","models/foodnhouseholditems/chipslays6.mdl","models/foodnhouseholditems/chipslays5.mdl","models/foodnhouseholditems/chipslays3.mdl","models/foodnhouseholditems/chipslays8.mdl","models/foodnhouseholditems/chipslays7.mdl","models/foodnhouseholditems/chipslays4.mdl","models/foodnhouseholditems/chipsbag3.mdl","models/foodnhouseholditems/chipstropical.mdl","models/foodnhouseholditems/chipstwisties.mdl","models/foodnhouseholditems/cookies.mdl","models/foodnhouseholditems/digestive.mdl","models/foodnhouseholditems/toffifee.mdl",}, 
                    chance1 = 0, chance2 = 0.45, count = 1, type = INV_FOOD
                },
                ["Вода"] = {
                    loot = {"models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/beercan01.mdl","models/foodnhouseholditems/beercan03.mdl","models/foodnhouseholditems/beer_master.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl"}, 
                    chance1 = 0.45, chance2 = 0.95, count = 1, type = INV_FOOD
                },
                ["Пустые банки"] = {
                    loot = {"hlam29", "update01_hlam7", "update01_hlam3", "update01_hlam11", "hlam29", "update01_hlam7", "update01_hlam3",}, 
                    chance1 = 0.95, chance2 = 1, count = 1, type = INV_ENTITY
                },
            },
            model = "models/props_c17/furniturefridge001a.mdl",
            pos = {
                {Vector(6256.631836, -12396.897461, 1330.669800), Angle(0.000, -176.237, 0.000)},
                {Vector(7982.760742, -14520.173828, 1365.796753), Angle(-0.000, 135.000, 135.000)},
                {Vector(7320.288086, -14779.875977, 1439.630005), Angle(2.051, 81.443, 90.021)},
            },
        },
        ["Шкафчик"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife", "tfa_nmrih_hatchet","tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife",},
                chance1 = 0, chance2 = 0.16, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.16, chance2 = 0.20, count = 1, type = INV_ENTITY},
                ["Редкое оружие"] = {loot = {"weapon_rpw_binoculars","guitar_sad", "wep_jack_job_drpradio",},
                chance1 = 0.2, chance2 = 0.25, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52"},
                chance1 = 0.25, chance2 = 0.26, count = 1, type = INV_ENTITY},
                ["Очень редкое сломанное оружие"] = {loot = {"gun93","gun_lee_enf", "gun39", "gun27", "gun33", "gun31", "gun53", "gun23", "gun41", "gun61", "gun34", "gun37", "gun38"},
                chance1 = 0.26, chance2 = 0.264, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_bandage","ent_smallmedkit", "ent_shina", "ent_medkit", "ent_bandage", "ent_bandage"},
                chance1 = 0.264, chance2 = 0.274, count = 1, type = INV_ENTITY},
                ["Хлам"] = {loot = {"hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28"},
                chance1 = 0.274, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_c17/furnituredrawer001a.mdl",
            pos = {
                {Vector(7392.992188, -14905.979492, 1444.376831), Angle(0.423, 89.962, 0.007)},
                {Vector(7986.498535, -14778.036133, 1364.443970),Angle(0.506, 90.047, -0.156)},
            },
        },
        ["железный шкаф"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_spade", "tfa_nmrih_crowbar"},
                chance1 = 0, chance2 = 0.3, count = 2, type = INV_WEAPON},
                ["Редкое оружие ближнего боя"] = {loot = {"tfa_nmrih_sledge","tfa_nmrih_fubar", "tfa_breadnope_axe",},
                chance1 = 0.3, chance2 = 0.32, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52", "tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.32, chance2 = 0.325, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"sent_soccerball","ent_shina"},
                chance1 = 0.325, chance2 = 0.335, count = 1, type = INV_ENTITY},
                ["Химикаты"] = {loot = {"acetone","bismuth", "toluol", "benznatriya"},
                chance1 = 0.335, chance2 = 0.345, count = 1, type = INV_ENTITY},
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0.345, chance2 = 0.347, count = 1, type = INV_HATS},
                ["Хлам"] = {loot = {"hlam31", "hlam34", "hlam32", "hlam26", "newhlam6", "newhlam5", "hlam27", "newhlam1", "newhlam3", "hlam33", "update01_hlam8", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "hlam29", "update01_hlam3", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "hlam1", "hlam28",},
                chance1 = 0.347, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","hlam5", "update01_hlam2", "hlam4", "hlam11", "hlam2", "hlam3", "hlam8", "hlam10", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            }, 
            model = "models/props_wasteland/controlroom_storagecloset001a.mdl",
            pos = {
                {Vector(6816.812012, -13661.024414, 1359.192627), Angle(0.001, 0.034, -0.210)},
                {Vector(9007.000000, -13728.791016, 1359.185913), Angle(0.003, -90.009, -0.085)},
                {Vector(8583.543945, -13448.228516, 1331.963623), Angle(-89.906, -116.910, 94.356)},
            },
        },
    },
    ["Военная база"] = {
        ["Ящик патронный"] = {
            loot = {
                ["Обычные патроны"] = {loot = {"tfa_ammo_3577","tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_smgg", "tfa_ammo_winchesterr"}, chance1 = 0.15, chance2 = 0.85, count = 1, type = INV_ENTITY},
                ["Редкие патроны"] = {loot = {"tfa_ammo_ar22","tfa_ammo_sniper_rounds"}, chance1 = 0.85, chance2 = 0.95, count = 1, type = INV_ENTITY},
                ["Оружие(сломанное маленькое)"] = {loot = {"gun30","gun93","gun29","gun24","gun53","gun52","gun31","gun34","gun25","gun23"}, 
                chance1 = 0.95, chance2 = 0.97, count = 1, type = INV_ENTITY},
            },
            model = "models/props/de_prodigy/ammo_can_01.mdl",
            pos = {
                {Vector(11282.603516, -14082.707031, 1524.281250), Angle(0.000, 28.121, 0.000)},
                {Vector(12378.257812, -14550.902344, 1593.204712), Angle(0.000, 129.909, 0.000)},
                {Vector(13066.132812, -13975.247070, 1525.080688), Angle(0.000, -122.178, 0.000)},
                {Vector(13516.428711, -13873.041992, 1524.281250), Angle(0.000, -114.429, 0.000)},
            },
        },
        ["Маленький ящик оружейный"] = {
            loot = {
                ["Обычные патроны"] = {loot = {"tfa_ammo_3577","tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_smgg", "tfa_ammo_winchesterr"}, 
                chance1 = 0, chance2 = 0.5, count = 1, type = INV_ENTITY},
                ["Редкие патроны"] = {loot = {"tfa_ammo_ar22","tfa_ammo_sniper_rounds"}, 
                chance1 = 0.5, chance2 = 0.8, count = 1, type = INV_ENTITY},
                ["Обычное"] = {loot = {"gun30","gun93","gun29","gun24","gun53","gun52","gun31","gun34","gun25","gun23", "gun39", "gun32", "gun_lee_enf", "gun38"}, 
                chance1 = 0.85, chance2 = 0.865, count = 1, type = INV_ENTITY},
                ["Необычное"] = {loot = {"tfa_mp5","tfa_ragingbull","gun63","gun4","gun55","gun39","gun1","gun51","gun11","gun58", "gun56", "gun41", "gun61", "gun26", "gun37"}, 
                chance1 = 0.87, chance2 = 0.877, count = 1, type = INV_ENTITY},
                ["Редкое"] = {loot = {"gun5","gun50","gun9","gun10","gun28","gun21","gun12","gun15","gun8", "gun62", "gun65", "gun2"}, 
                chance1 = 0.877, chance2 = 0.880, count = 1, type = INV_ENTITY},
                ["Очень редкое"] = {loot = {"gun16","gun18","gun47","gun43","gun14","gun13","gun54","gun57","gun7","gun3","gun64", "gun44", "gun49", "gun45", "gun42", "gun65", "gun46" ,"gun19"}, 
                chance1 = 0.875, chance2 = 0.8765, count = 1, type = INV_ENTITY},
            },
            model = "models/props/de_prodigy/ammo_can_02.mdl",
            pos = {
                {Vector(13071.977539, -14631.448242, 1534.322876),Angle(0.035, -89.808, -0.061)},
                {Vector(13055.133789, -14420.573242, 1562.434326),Angle(-0.052, -89.659, 0.014)},
                {Vector(13632.006836, -14930.835938, 1533.026733),Angle(-0.002, 130.475, -0.008)},
                {Vector(13494.501953, -14442.940430, 1590.961182),Angle(-0.024, -109.911, -0.044)},
            },
        },
    },
    ["Бункер"] = {
        ["Ящик патронный"] = {
            loot = {
                ["Обычные патроны"] = {loot = {"tfa_ammo_3577","tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_smgg", "tfa_ammo_winchesterr"}, 
                chance1 = 0, chance2 = 0.4, count = 1, type = INV_ENTITY},
                ["Редкие патроны"] = {loot = {"tfa_ammo_ar22","tfa_ammo_sniper_rounds"}, 
                chance1 = 0.4, chance2 = 0.45, count = 1, type = INV_ENTITY},
                ["Обычное"] = {loot = {"gun30","gun93","gun29","gun24","gun53","gun52","gun31","gun34","gun25","gun23", "gun39", "gun32", "gun_lee_enf", "gun38"}, 
                chance1 = 0.45, chance2 = 0.47, count = 1, type = INV_ENTITY},
                ["Необычное"] = {loot = {"tfa_mp5","tfa_ragingbull","gun63","gun4","gun55","gun39","gun1","gun51","gun11","gun58", "gun56", "gun41", "gun61", "gun26", "gun37"}, 
                chance1 = 0.47, chance2 = 0.477, count = 1, type = INV_ENTITY},
                ["Редкое"] = {loot = {"gun5","gun50","gun9","gun10","gun28","gun21","gun12","gun15","gun8", "gun62", "gun65", "gun2"}, 
                chance1 = 0.477, chance2 = 0.480, count = 1, type = INV_ENTITY},
                ["Очень редкое"] = {loot = {"gun16","gun18","gun47","gun43","gun14","gun13","gun54","gun57","gun7","gun3","gun64", "gun44", "gun49", "gun45", "gun42", "gun65", "gun46" ,"gun19"}, 
                chance1 = 0.475, chance2 = 0.4765, count = 1, type = INV_ENTITY},
            },
            model = "models/props/de_prodigy/ammo_can_01.mdl",
            pos = {
                {Vector(12325.179688, 8760.271484, 512.312500), Angle(0.000, 4.828, 0.000)},
                {Vector(11914.984375, 9852.158203, 512.312500), Angle(0.000, 0, 0.000)},
                {Vector(13267.831055, 10662.137695, 512.312500), Angle(0.000, -67.716, 0.000)},
                {Vector(13693.547852, 10287.796875, 512.312500), Angle(0.000, -67.716, 0.000)},
            },
        },
        ["Ящик патронный 2"] = {
            loot = {
                ["Обычные патроны"] = {loot = {"tfa_ammo_3577","tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_smgg", "tfa_ammo_winchesterr"}, 
                chance1 = 0, chance2 = 0.5, count = 1, type = INV_ENTITY},
                ["Редкие патроны"] = {loot = {"tfa_ammo_ar22","tfa_ammo_sniper_rounds"}, 
                chance1 = 0.5, chance2 = 0.8, count = 1, type = INV_ENTITY},
                ["Обычное"] = {loot = {"gun30","gun93","gun29","gun24","gun53","gun52","gun31","gun34","gun25","gun23", "gun39", "gun32", "gun_lee_enf", "gun38"}, 
                chance1 = 0.85, chance2 = 0.865, count = 1, type = INV_ENTITY},
                ["Необычное"] = {loot = {"tfa_mp5","tfa_ragingbull","gun63","gun4","gun55","gun39","gun1","gun51","gun11","gun58", "gun56", "gun41", "gun61", "gun26", "gun37"}, 
                chance1 = 0.87, chance2 = 0.877, count = 1, type = INV_ENTITY},
                ["Редкое"] = {loot = {"gun5","gun50","gun9","gun10","gun28","gun21","gun12","gun15","gun8", "gun62", "gun65", "gun2"}, 
                chance1 = 0.877, chance2 = 0.880, count = 1, type = INV_ENTITY},
                ["Очень редкое"] = {loot = {"gun16","gun18","gun47","gun43","gun14","gun13","gun54","gun57","gun7","gun3","gun64", "gun44", "gun49", "gun45", "gun42", "gun65", "gun46" ,"gun19"}, 
                chance1 = 0.875, chance2 = 0.8765, count = 1, type = INV_ENTITY},
            },
            model = "models/props/de_prodigy/ammo_can_01.mdl",
            pos = {
                {Vector(12950.247070, 8930.050781, 512.312500), Angle(0.000, 123.600, 0.000)},
                {Vector(13768.890625, 8801.875977, 512.312500), Angle(0.000, 4.343, 0.000)},
                {Vector(12878.384766, 10685.483398, 512.312500), Angle(0.000, -159.876, 0.000)},
                {Vector(12628.724609, 10513.546875, 512.312500), Angle(0.000, -159.876, 0.000)},
                {Vector(12678.461914, 9335.950195, 512.312500), Angle(0.000, 128.876, 0.000)},
            },
        },
    },
    ["Военная база 2"] = {
        ["Ящик патронный"] = {
            loot = {
                ["Обычные патроны"] = {loot = {"tfa_ammo_3577","tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_smgg", "tfa_ammo_winchesterr"}, chance1 = 0.15, chance2 = 0.85, count = 1, type = INV_ENTITY},
                ["Редкие патроны"] = {loot = {"tfa_ammo_ar22","tfa_ammo_sniper_rounds"}, chance1 = 0.85, chance2 = 0.95, count = 1, type = INV_ENTITY},
                ["Оружие(сломанное маленькое)"] = {loot = {"gun30","gun93","gun29","gun24","gun53","gun52","gun31","gun34","gun25","gun23"}, 
                chance1 = 0.95, chance2 = 0.97, count = 1, type = INV_ENTITY},
            },
            model = "models/props/de_prodigy/ammo_can_01.mdl",
            pos = {
                {Vector(13066.132812, -13975.247070, 1525.080688), Angle(0.000, -122.178, 0.000)},
                {Vector(13516.428711, -13873.041992, 1524.281250), Angle(0.000, -114.429, 0.000)},
                {Vector(13299.967773, 1202.446655, 900.312500), Angle(0.000, 1.982, 0.000)},
                {Vector(13516.428711, -13873.041992, 1524.281250), Angle(0.000, -114.429, 0.000)},
            },
        },
        ["Маленький ящик оружейный"] = {
            loot = {
                ["Обычные патроны"] = {loot = {"tfa_ammo_3577","tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_smgg", "tfa_ammo_winchesterr"}, 
                chance1 = 0, chance2 = 0.5, count = 1, type = INV_ENTITY},
                ["Редкие патроны"] = {loot = {"tfa_ammo_ar22","tfa_ammo_sniper_rounds"}, 
                chance1 = 0.5, chance2 = 0.8, count = 1, type = INV_ENTITY},
                ["Обычное"] = {loot = {"gun30","gun93","gun29","gun24","gun53","gun52","gun31","gun34","gun25","gun23", "gun39", "gun32", "gun_lee_enf", "gun38"}, 
                chance1 = 0.85, chance2 = 0.865, count = 1, type = INV_ENTITY},
                ["Необычное"] = {loot = {"tfa_mp5","tfa_ragingbull","gun63","gun4","gun55","gun39","gun1","gun51","gun11","gun58", "gun56", "gun41", "gun61", "gun26", "gun37"}, 
                chance1 = 0.87, chance2 = 0.877, count = 1, type = INV_ENTITY},
                ["Редкое"] = {loot = {"gun5","gun50","gun9","gun10","gun28","gun21","gun12","gun15","gun8", "gun62", "gun65", "gun2"}, 
                chance1 = 0.877, chance2 = 0.880, count = 1, type = INV_ENTITY},
                ["Очень редкое"] = {loot = {"gun16","gun18","gun47","gun43","gun14","gun13","gun54","gun57","gun7","gun3","gun64", "gun44", "gun49", "gun45", "gun42", "gun65", "gun46" ,"gun19"}, 
                chance1 = 0.875, chance2 = 0.8765, count = 1, type = INV_ENTITY},
            },
            model = "models/props/de_prodigy/ammo_can_02.mdl",
            pos = {
                {Vector(14608.128906, 675.367249, 912.855957),Angle(-0.563, -132.655, 179.908)},
                {Vector(13316.419922, 796.037659, 915.146790),Angle(0.776, 79.770, -0.124)},
                {Vector(14625.161133, 1005.611511, 931.851196),Angle(-0.337, -90.098, -0.006)},
                {Vector(14617.707031, 1257.563110, 906.548279),Angle(0.122, -72.268, -0.045)},
            },
        },
    },
    ["Маленький дом"] = {
        ["Холодильник"] = {
            loot = {
                ["Жрачка"] = { loot = {"models/foodnhouseholditems/chipsbag1.mdl","models/foodnhouseholditems/chipscheezit.mdl","models/foodnhouseholditems/chipsbag2.mdl","models/foodnhouseholditems/chipsdoritos2.mdl","models/foodnhouseholditems/chipsdoritos.mdl","models/foodnhouseholditems/chipsdoritos5.mdl","models/foodnhouseholditems/chipsdoritos4.mdl","models/foodnhouseholditems/chipsdoritos6.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipsfritoshoops.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipslays2.mdl","models/foodnhouseholditems/chipslays6.mdl","models/foodnhouseholditems/chipslays5.mdl","models/foodnhouseholditems/chipslays3.mdl","models/foodnhouseholditems/chipslays8.mdl","models/foodnhouseholditems/chipslays7.mdl","models/foodnhouseholditems/chipslays4.mdl","models/foodnhouseholditems/chipsbag3.mdl","models/foodnhouseholditems/chipstropical.mdl","models/foodnhouseholditems/chipstwisties.mdl","models/foodnhouseholditems/cookies.mdl","models/foodnhouseholditems/digestive.mdl","models/foodnhouseholditems/toffifee.mdl",}, 
                    chance1 = 0, chance2 = 0.45, count = 1, type = INV_FOOD
                },
                ["Вода"] = {
                    loot = {"models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/beercan01.mdl","models/foodnhouseholditems/beercan03.mdl","models/foodnhouseholditems/beer_master.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl"}, 
                    chance1 = 0.45, chance2 = 0.95, count = 1, type = INV_FOOD
                },
                ["Пустые банки"] = {
                    loot = {"hlam29", "update01_hlam7", "update01_hlam3", "update01_hlam11", "hlam29", "update01_hlam7", "update01_hlam3",}, 
                    chance1 = 0.95, chance2 = 1, count = 1, type = INV_ENTITY
                },
            },
            model = "models/props_c17/furniturefridge001a.mdl",
            pos = {
                {Vector(-12630.109375, -217.561920, 696.170593), Angle(86.638, 23.186, -0.000)},
                {Vector(-12434.072266, -59.321182, 710.445312), Angle(-0.126, -147.562, -0.001)},
            },
        },
    },
    ["Отель"] = {
        ["Шкафчик"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife", "tfa_nmrih_hatchet","tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife",},
                chance1 = 0, chance2 = 0.16, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.16, chance2 = 0.20, count = 1, type = INV_ENTITY},
                ["Редкое оружие"] = {loot = {"weapon_rpw_binoculars","guitar_sad", "wep_jack_job_drpradio",},
                chance1 = 0.2, chance2 = 0.25, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52"},
                chance1 = 0.25, chance2 = 0.26, count = 1, type = INV_ENTITY},
                ["Очень редкое сломанное оружие"] = {loot = {"gun93","gun_lee_enf", "gun39", "gun27", "gun33", "gun31", "gun53", "gun23", "gun41", "gun61", "gun34", "gun37", "gun38"},
                chance1 = 0.26, chance2 = 0.264, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_bandage","ent_smallmedkit", "ent_shina", "ent_medkit", "ent_bandage", "ent_bandage"},
                chance1 = 0.264, chance2 = 0.274, count = 1, type = INV_ENTITY},
                ["Хлам"] = {loot = {"hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28"},
                chance1 = 0.274, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_c17/furnituredrawer001a.mdl",
            pos = {
                {Vector(10688.245117, -285.863678, 915.798218), Angle(-0.269, -89.941, -0.002)},
                {Vector(10596.238281, -295.315491, 920.363647), Angle(42.246, 95.133, -83.748)},
                {Vector(10657.566406, -322.727600, 1052.349121), Angle(86.616, -102.154, -0.000)},
            },
        },
        ["Шкафчик"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife", "tfa_nmrih_hatchet","tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife",},
                chance1 = 0, chance2 = 0.16, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.16, chance2 = 0.20, count = 1, type = INV_ENTITY},
                ["Редкое оружие"] = {loot = {"weapon_rpw_binoculars","guitar_sad", "wep_jack_job_drpradio",},
                chance1 = 0.2, chance2 = 0.25, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52"},
                chance1 = 0.25, chance2 = 0.26, count = 1, type = INV_ENTITY},
                ["Очень редкое сломанное оружие"] = {loot = {"gun93","gun_lee_enf", "gun39", "gun27", "gun33", "gun31", "gun53", "gun23", "gun41", "gun61", "gun34", "gun37", "gun38"},
                chance1 = 0.26, chance2 = 0.264, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_bandage","ent_smallmedkit", "ent_shina", "ent_medkit", "ent_bandage", "ent_bandage"},
                chance1 = 0.264, chance2 = 0.274, count = 1, type = INV_ENTITY},
                ["Хлам"] = {loot = {"hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28"},
                chance1 = 0.274, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_c17/furniturecupboard001a.mdl",
            pos = {
                {Vector(9930.672852, -366.805939, 1106.344727), Angle(-0.006, 0.026, -5.186)},
                {Vector(10047.914062, -282.806793, 1227.201416), Angle(-0.245, -90.199, -5.404)},
            },
        },
        ["Холодильник"] = {
            loot = {
                ["Жрачка"] = { loot = {"models/foodnhouseholditems/chipsbag1.mdl","models/foodnhouseholditems/chipscheezit.mdl","models/foodnhouseholditems/chipsbag2.mdl","models/foodnhouseholditems/chipsdoritos2.mdl","models/foodnhouseholditems/chipsdoritos.mdl","models/foodnhouseholditems/chipsdoritos5.mdl","models/foodnhouseholditems/chipsdoritos4.mdl","models/foodnhouseholditems/chipsdoritos6.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipsfritoshoops.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipslays2.mdl","models/foodnhouseholditems/chipslays6.mdl","models/foodnhouseholditems/chipslays5.mdl","models/foodnhouseholditems/chipslays3.mdl","models/foodnhouseholditems/chipslays8.mdl","models/foodnhouseholditems/chipslays7.mdl","models/foodnhouseholditems/chipslays4.mdl","models/foodnhouseholditems/chipsbag3.mdl","models/foodnhouseholditems/chipstropical.mdl","models/foodnhouseholditems/chipstwisties.mdl","models/foodnhouseholditems/cookies.mdl","models/foodnhouseholditems/digestive.mdl","models/foodnhouseholditems/toffifee.mdl",}, 
                    chance1 = 0, chance2 = 0.45, count = 1, type = INV_FOOD
                },
                ["Вода"] = {
                    loot = {"models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/beercan01.mdl","models/foodnhouseholditems/beercan03.mdl","models/foodnhouseholditems/beer_master.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl"}, 
                    chance1 = 0.45, chance2 = 0.95, count = 1, type = INV_FOOD
                },
                ["Пустые банки"] = {
                    loot = {"hlam29", "update01_hlam7", "update01_hlam3", "update01_hlam11", "hlam29", "update01_hlam7", "update01_hlam3",}, 
                    chance1 = 0.95, chance2 = 1, count = 1, type = INV_ENTITY
                },
            },
            model = "models/props_c17/furniturefridge001a.mdl",
            pos = {
                {Vector(10626.696289, -416.505829, 1197.527588), Angle(0.196, -130.650, -89.965)},
                {Vector(10485.054688, -370.880157, 902.102844), Angle(-89.962, 115.642, 180.000)},
            },
        },
        ["Медицина"] = {
            loot = {
                ["Нож"] = {loot = {"tfa_nmrih_kknife"},
                chance1 = 0, chance2 = 0.05, count = 1, type = INV_WEAPON},
                ["Аптечка"] = {loot = {"ent_medkit"},
                chance1 = 0.05, chance2 = 0.10, count = 1, type = INV_ENTITY},
                ["Бинт"] = {loot = {"ent_bandage"},
                chance1 = 0.10, chance2 = 0.60, count = 1, type = INV_ENTITY},
                ["Обезболивающее"] = {loot = {"sent_smallmedkit"},
                chance1 = 0.60, chance2 = 0.80, count = 1, type = INV_ENTITY},
                ["Шприц"] = {loot = {"ent_medboost"},
                chance1 = 0.80, chance2 = 0.81, count = 1, type = INV_ENTITY},
                ["Шина"] = {loot = {"ent_shina"},
                chance1 = 0.81, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props/generic/medkit01.mdl",
            pos = {
                {Vector(9903.983398, -361.307434, 1246.312988), Angle(89.140, 92.454, -87.600)},
                {Vector(10831.972656, -359.392029, 1108.528442), Angle(90.000, 180.000, 180.000)},
                {Vector(10831.955078, -348.581451, 973.528748), Angle(90.000, 180.000, 180.000)},
            },
        },
    },
    ["Заправка и дома неподалеку"] = {
        ["Коробка факторка"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_spade", "tfa_nmrih_crowbar"},
                chance1 = 0, chance2 = 0.3, count = 2, type = INV_WEAPON},
                ["Редкое оружие ближнего боя"] = {loot = {"tfa_nmrih_sledge","tfa_nmrih_fubar", "tfa_breadnope_axe",},
                chance1 = 0.3, chance2 = 0.32, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52", "tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.32, chance2 = 0.325, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"sent_soccerball","ent_shina"},
                chance1 = 0.325, chance2 = 0.335, count = 1, type = INV_ENTITY},
                ["Химикаты"] = {loot = {"acetone","bismuth", "toluol", "benznatriya"},
                chance1 = 0.335, chance2 = 0.345, count = 1, type = INV_ENTITY},
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0.345, chance2 = 0.347, count = 1, type = INV_HATS},
                ["Хлам"] = {loot = {"hlam31", "hlam34", "hlam32", "hlam26", "newhlam6", "newhlam5", "hlam27", "newhlam1", "newhlam3", "hlam33", "update01_hlam8", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "hlam29", "update01_hlam3", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "hlam1", "hlam28",},
                chance1 = 0.347, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","hlam5", "update01_hlam2", "hlam4", "hlam11", "hlam2", "hlam3", "hlam8", "hlam10", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            }, 
            model = "models/props/generic/cardboardbox06.mdl",
            pos = {
                {Vector(7020.104980, -556.696899, 824.753052), Angle(0.000, -175.492, 0.000)},
                {Vector(6737.096680, -288.371002, 785.642822), Angle(-0.010, 12.691, 0.046)},
            },
        },
        ["Шкаф"] = {
            loot = {
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0, chance2 = 0.38, count = 1, type = INV_HATS},
                ["Энтити"] = {loot = {"ent_bandage","ent_smallmedkit","ent_shina", "ent_medkit", "ent_bandage", "ent_bandage "}, 
                chance1 = 0.38, chance2 = 0.42, count = 1, type = INV_ENTITY},
                ["Одежда"] = {loot = {"Брюки 1 (муж.)","Брюки 2 (муж.)","Брюки 3 (муж.)","Брюки 4 (муж.)","Брюки 5 (муж.)","Брюки 6 (муж.)","Брюки 7 (муж.)","Брюки 8 (муж.)","Брюки 9 (муж.)","Брюки 10 (муж.)","Футболка 1 (муж.)","Футболка 2 (муж.)","Футболка 3 (муж.)","Футболка 4 (муж.)","Футболка 5 (муж.)","Футболка 6 (муж.)","Футболка 7 (муж.)","Футболка 8 (муж.)","Футболка 9 (муж.)","Футболка 10 (муж.)","Футболка 10 (муж.)","Футболка 11 (муж.)","Футболка 12 (муж.)","Футболка 13 (муж.)","Футболка 14 (муж.)","Футболка 15 (муж.)","Футболка 16 (муж.)","Футболка 17 (муж.)","Футболка 18 (муж.)","Футболка 19 (муж.)","Футболка 20 (муж.)","Футболка 21 (муж.)","Футболка 22 (муж.)","Футболка 23 (муж.)","Футболка 24 (муж.)","Футболка 25 (муж.)","Футболка 26 (муж.)","Футболка 27 (муж.)","Футболка 28 (муж.)","Красная парка (муж.)","Синяя парка (муж.)","Куртка 3 (муж.)","Костюм 1 (муж.)"}, 
                chance1 = 0.42, chance2 = 0.8, count = 1, type = INV_CLOTHES},
                ["Оружие"] = {loot = {"tfa_nmrih_bat","tfa_nmrih_kknife", "tfa_nmrih_spade"}, 
                chance1 = 0.8, chance2 = 0.91, count = 1, type = INV_WEAPON},
                ["Редкое"] = {loot = {"firehelmet","motohelmet","ssh68","firehelmet","motohelmet","ssh68","turtlecap",'motohelmet','backpack_molle','backpack_trizip','backpack_citya','backpack_cityb','backpack_cityc','backpack_city2a','backpack_city2b','backpack_baselardwild'}, 
                chance1 = 0.91, chance2 = 0.97, count = 1, type = INV_HATS},
                ["Бронежилет"] = {loot = {"policevest"}, 
                chance1 = 0.97, chance2 = 0.99, count = 1, type = INV_HATS},
                ["Очень редкое"] = {loot = {"backpack_pilgrim","backpack_pilgrim2a","backpack_pilgrim2b","backpack_pilgrim2c", "pressvest", "helmetmich", "policevest"}, 
                chance1 = 0.99, chance2 = 1, count = 1, type = INV_HATS},
            },
            model = "models/props_c17/furnituredresser001a.mdl",
            pos = {
                {Vector(6688.411133, -3652.787109, 857.322205), Angle(1.625, -0.051, -0.001)},
                {Vector(8484.201172, -5628.108398, 1200.507568), Angle(88.343, -80.190, 1.904)},
            },
        },
    },   
    ["Болото"] = {
        ["Коробка факторка"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_spade", "tfa_nmrih_crowbar"},
                chance1 = 0, chance2 = 0.2, count = 2, type = INV_WEAPON},
                ["Редкое оружие ближнего боя"] = {loot = {"tfa_nmrih_sledge","tfa_nmrih_fubar", "tfa_breadnope_axe",},
                chance1 = 0.2, chance2 = 0.21, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52", "tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.21, chance2 = 0.22, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"sent_soccerball","ent_shina"},
                chance1 = 0.22, chance2 = 0.27, count = 1, type = INV_ENTITY},
                ["Химикаты"] = {loot = {"acetone","bismuth", "toluol", "benznatriya"},
                chance1 = 0.27, chance2 = 0.28, count = 1, type = INV_ENTITY},
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0.28, chance2 = 0.29, count = 1, type = INV_HATS},
                ["Хлам"] = {loot = {"hlam31", "hlam34", "hlam32", "hlam26", "newhlam6", "newhlam5", "hlam27", "newhlam1", "newhlam3", "hlam33", "update01_hlam8", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "hlam29", "update01_hlam3", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "hlam1", "hlam28",},
                chance1 = 0.29, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"hlam5", "update01_hlam2", "hlam4", "hlam11", "hlam2", "hlam3", "hlam8", "hlam10", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props/de_prodigy/concretebags.mdl",
            pos = {
                {Vector(6256.228027, 13922.237305, 1474.540405), Angle(0.000, -109.803, 0.000)},
                {Vector(6332.110352, 9001.209961, 1346.540527), Angle(0.000, 103.183, 0.000)},
            },
        },
        ["Шкаф"] = {
            loot = {
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0, chance2 = 0.38, count = 1, type = INV_HATS},
                ["Энтити"] = {loot = {"ent_bandage","ent_smallmedkit","ent_shina", "ent_medkit", "ent_bandage", "ent_bandage "}, 
                chance1 = 0.38, chance2 = 0.42, count = 1, type = INV_ENTITY},
                ["Одежда"] = {loot = {"Брюки 1 (муж.)","Брюки 2 (муж.)","Брюки 3 (муж.)","Брюки 4 (муж.)","Брюки 5 (муж.)","Брюки 6 (муж.)","Брюки 7 (муж.)","Брюки 8 (муж.)","Брюки 9 (муж.)","Брюки 10 (муж.)","Футболка 1 (муж.)","Футболка 2 (муж.)","Футболка 3 (муж.)","Футболка 4 (муж.)","Футболка 5 (муж.)","Футболка 6 (муж.)","Футболка 7 (муж.)","Футболка 8 (муж.)","Футболка 9 (муж.)","Футболка 10 (муж.)","Футболка 10 (муж.)","Футболка 11 (муж.)","Футболка 12 (муж.)","Футболка 13 (муж.)","Футболка 14 (муж.)","Футболка 15 (муж.)","Футболка 16 (муж.)","Футболка 17 (муж.)","Футболка 18 (муж.)","Футболка 19 (муж.)","Футболка 20 (муж.)","Футболка 21 (муж.)","Футболка 22 (муж.)","Футболка 23 (муж.)","Футболка 24 (муж.)","Футболка 25 (муж.)","Футболка 26 (муж.)","Футболка 27 (муж.)","Футболка 28 (муж.)","Красная парка (муж.)","Синяя парка (муж.)","Куртка 3 (муж.)","Костюм 1 (муж.)"}, 
                chance1 = 0.42, chance2 = 0.8, count = 1, type = INV_CLOTHES},
                ["Оружие"] = {loot = {"tfa_nmrih_bat","tfa_nmrih_kknife", "tfa_nmrih_spade"}, 
                chance1 = 0.8, chance2 = 0.91, count = 1, type = INV_WEAPON},
                ["Редкое"] = {loot = {"firehelmet","motohelmet","ssh68","firehelmet","motohelmet","ssh68","turtlecap",'motohelmet','backpack_molle','backpack_trizip','backpack_citya','backpack_cityb','backpack_cityc','backpack_city2a','backpack_city2b','backpack_baselardwild'}, 
                chance1 = 0.91, chance2 = 0.97, count = 1, type = INV_HATS},
                ["Бронежилет"] = {loot = {"policevest"}, 
                chance1 = 0.97, chance2 = 0.99, count = 1, type = INV_HATS},
                ["Очень редкое"] = {loot = {"backpack_pilgrim","backpack_pilgrim2a","backpack_pilgrim2b","backpack_pilgrim2c", "pressvest", "helmetmich", "policevest"}, 
                chance1 = 0.99, chance2 = 1, count = 1, type = INV_HATS},
            },
            model = "models/props/CS_militia/boxes_garage_lower.mdl",
            pos = {
                {Vector(3857.749268, 11439.932617, 1346.523926), Angle(0.000, -93.602, 0.000)},
                {Vector(3812.354492, 11382.327148, 762.171448), Angle(-1.162, -162.200, 0.597)},
                {Vector(4919.608887, 11736.499023, 711.536255), Angle(-1.070, 3.979, -0.623)},
            },
        },
    },
    ["Город"] = {
        ["Коробка факторка"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_spade", "tfa_nmrih_crowbar"},
                chance1 = 0, chance2 = 0.2, count = 2, type = INV_WEAPON},
                ["Редкое оружие ближнего боя"] = {loot = {"tfa_nmrih_sledge","tfa_nmrih_fubar", "tfa_breadnope_axe",},
                chance1 = 0.2, chance2 = 0.21, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52", "tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.21, chance2 = 0.22, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"sent_soccerball","ent_shina"},
                chance1 = 0.22, chance2 = 0.27, count = 1, type = INV_ENTITY},
                ["Химикаты"] = {loot = {"acetone","bismuth", "toluol", "benznatriya"},
                chance1 = 0.27, chance2 = 0.28, count = 1, type = INV_ENTITY},
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0.28, chance2 = 0.29, count = 1, type = INV_HATS},
                ["Хлам"] = {loot = {"hlam31", "hlam34", "hlam32", "hlam26", "newhlam6", "newhlam5", "hlam27", "newhlam1", "newhlam3", "hlam33", "update01_hlam8", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "hlam29", "update01_hlam3", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "hlam1", "hlam28",},
                chance1 = 0.29, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"hlam5", "update01_hlam2", "hlam4", "hlam11", "hlam2", "hlam3", "hlam8", "hlam10", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props/generic/cardboardbox06.mdl",
            pos = {
                {Vector(3724.282715, 3766.297852, 0.250773), Angle(-0.000, 123.144, 0.000)},
                {Vector(3697.335449, 3395.336182, 0.367448), Angle(-0.017, -45.390, -0.010)},
            },
        },
        ["Холодильник"] = {
            loot = {
                ["Жрачка"] = { loot = {"models/foodnhouseholditems/chipsbag1.mdl","models/foodnhouseholditems/chipscheezit.mdl","models/foodnhouseholditems/chipsbag2.mdl","models/foodnhouseholditems/chipsdoritos2.mdl","models/foodnhouseholditems/chipsdoritos.mdl","models/foodnhouseholditems/chipsdoritos5.mdl","models/foodnhouseholditems/chipsdoritos4.mdl","models/foodnhouseholditems/chipsdoritos6.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipsfritoshoops.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipslays2.mdl","models/foodnhouseholditems/chipslays6.mdl","models/foodnhouseholditems/chipslays5.mdl","models/foodnhouseholditems/chipslays3.mdl","models/foodnhouseholditems/chipslays8.mdl","models/foodnhouseholditems/chipslays7.mdl","models/foodnhouseholditems/chipslays4.mdl","models/foodnhouseholditems/chipsbag3.mdl","models/foodnhouseholditems/chipstropical.mdl","models/foodnhouseholditems/chipstwisties.mdl","models/foodnhouseholditems/cookies.mdl","models/foodnhouseholditems/digestive.mdl","models/foodnhouseholditems/toffifee.mdl",}, 
                    chance1 = 0, chance2 = 0.45, count = 1, type = INV_FOOD
                },
                ["Вода"] = {
                    loot = {"models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/beercan01.mdl","models/foodnhouseholditems/beercan03.mdl","models/foodnhouseholditems/beer_master.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl"}, 
                    chance1 = 0.45, chance2 = 0.95, count = 1, type = INV_FOOD
                },
                ["Пустые банки"] = {
                    loot = {"hlam29", "update01_hlam7", "update01_hlam3", "update01_hlam11", "hlam29", "update01_hlam7", "update01_hlam3",}, 
                    chance1 = 0.95, chance2 = 1, count = 1, type = INV_ENTITY
                },
            },
            model = "models/props_c17/furniturefridge001a.mdl",
            pos = {
                {Vector(3945.826416, 3141.912842, 37.301537), Angle(-0.047, -180.000, -0.447)},
                {Vector(3521.651855, 2886.129639, 24.217329), Angle(89.922, -106.964, 0.000)},
            },
        },
        ["Шкаф"] = {
            loot = {
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0, chance2 = 0.38, count = 1, type = INV_HATS},
                ["Энтити"] = {loot = {"ent_bandage","ent_smallmedkit","ent_shina", "ent_medkit", "ent_bandage", "ent_bandage "}, 
                chance1 = 0.38, chance2 = 0.42, count = 1, type = INV_ENTITY},
                ["Одежда"] = {loot = {"Брюки 1 (муж.)","Брюки 2 (муж.)","Брюки 3 (муж.)","Брюки 4 (муж.)","Брюки 5 (муж.)","Брюки 6 (муж.)","Брюки 7 (муж.)","Брюки 8 (муж.)","Брюки 9 (муж.)","Брюки 10 (муж.)","Футболка 1 (муж.)","Футболка 2 (муж.)","Футболка 3 (муж.)","Футболка 4 (муж.)","Футболка 5 (муж.)","Футболка 6 (муж.)","Футболка 7 (муж.)","Футболка 8 (муж.)","Футболка 9 (муж.)","Футболка 10 (муж.)","Футболка 10 (муж.)","Футболка 11 (муж.)","Футболка 12 (муж.)","Футболка 13 (муж.)","Футболка 14 (муж.)","Футболка 15 (муж.)","Футболка 16 (муж.)","Футболка 17 (муж.)","Футболка 18 (муж.)","Футболка 19 (муж.)","Футболка 20 (муж.)","Футболка 21 (муж.)","Футболка 22 (муж.)","Футболка 23 (муж.)","Футболка 24 (муж.)","Футболка 25 (муж.)","Футболка 26 (муж.)","Футболка 27 (муж.)","Футболка 28 (муж.)","Красная парка (муж.)","Синяя парка (муж.)","Куртка 3 (муж.)","Костюм 1 (муж.)"}, 
                chance1 = 0.42, chance2 = 0.8, count = 1, type = INV_CLOTHES},
                ["Оружие"] = {loot = {"tfa_nmrih_bat","tfa_nmrih_kknife", "tfa_nmrih_spade"}, 
                chance1 = 0.8, chance2 = 0.91, count = 1, type = INV_WEAPON},
                ["Редкое"] = {loot = {"firehelmet","motohelmet","ssh68","firehelmet","motohelmet","ssh68","turtlecap",'motohelmet','backpack_molle','backpack_trizip','backpack_citya','backpack_cityb','backpack_cityc','backpack_city2a','backpack_city2b','backpack_baselardwild'}, 
                chance1 = 0.91, chance2 = 0.97, count = 1, type = INV_HATS},
                ["Бронежилет"] = {loot = {"policevest"}, 
                chance1 = 0.97, chance2 = 0.99, count = 1, type = INV_HATS},
                ["Очень редкое"] = {loot = {"backpack_pilgrim","backpack_pilgrim2a","backpack_pilgrim2b","backpack_pilgrim2c", "pressvest", "helmetmich", "policevest"}, 
                chance1 = 0.99, chance2 = 1, count = 1, type = INV_HATS},
            },
            model = "models/props_c17/furnituredresser001a.mdl",
            pos = {
                {Vector(3705.979980, 1177.538452, 34.238201), Angle(-59.567, -101.596, 24.282)},
                {Vector(3699.625000, -2301.800049, 16.486151), Angle(-88.405, 153.140, -3.529)},
            },
        },
        ["Ящик патронный"] = {
            loot = {
                ["Обычные патроны"] = {loot = {"tfa_ammo_3577","tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_smgg", "tfa_ammo_winchesterr"}, chance1 = 0.15, chance2 = 0.85, count = 1, type = INV_ENTITY},
                ["Редкие патроны"] = {loot = {"tfa_ammo_ar22","tfa_ammo_sniper_rounds"}, chance1 = 0.85, chance2 = 0.95, count = 1, type = INV_ENTITY},
                ["Оружие(сломанное маленькое)"] = {loot = {"gun30","gun93","gun29","gun24","gun53","gun52","gun31","gun34","gun25","gun23"}, 
                chance1 = 0.95, chance2 = 0.97, count = 1, type = INV_ENTITY},
            },
            model = "models/props/de_prodigy/ammo_can_01.mdl",
            pos = {
                {Vector(1865.677734, 2809.989502, 0.312486), Angle(0.000, -87.422, 0.000)},
                {Vector(1491.057129, 2793.123047, 0.312486), Angle(0.000, -87.422, 0.000)},
                {Vector(1590.847412, 3405.377686, 0.312493), Angle(0.000, -102.567, 0.000)},
            },
        },
        ["Маленький ящик оружейный"] = {
            loot = {
                ["Обычные патроны"] = {loot = {"tfa_ammo_3577","tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_smgg", "tfa_ammo_winchesterr"}, 
                chance1 = 0, chance2 = 0.5, count = 1, type = INV_ENTITY},
                ["Редкие патроны"] = {loot = {"tfa_ammo_ar22","tfa_ammo_sniper_rounds"}, 
                chance1 = 0.5, chance2 = 0.8, count = 1, type = INV_ENTITY},
                ["Обычное"] = {loot = {"gun30","gun93","gun29","gun24","gun53","gun52","gun31","gun34","gun25","gun23", "gun39", "gun32", "gun_lee_enf", "gun38"}, 
                chance1 = 0.85, chance2 = 0.865, count = 1, type = INV_ENTITY},
                ["Необычное"] = {loot = {"tfa_mp5","tfa_ragingbull","gun63","gun4","gun55","gun39","gun1","gun51","gun11","gun58", "gun56", "gun41", "gun61", "gun26", "gun37"}, 
                chance1 = 0.87, chance2 = 0.877, count = 1, type = INV_ENTITY},
                ["Редкое"] = {loot = {"gun5","gun50","gun9","gun10","gun28","gun21","gun12","gun15","gun8", "gun62", "gun65", "gun2"}, 
                chance1 = 0.877, chance2 = 0.880, count = 1, type = INV_ENTITY},
                ["Очень редкое"] = {loot = {"gun16","gun18","gun47","gun43","gun14","gun13","gun54","gun57","gun7","gun3","gun64", "gun44", "gun49", "gun45", "gun42", "gun65", "gun46" ,"gun19"}, 
                chance1 = 0.875, chance2 = 0.8765, count = 1, type = INV_ENTITY},
            },
            model = "models/props/de_prodigy/ammo_can_02.mdl",
            pos = {
                {Vector(1196.657104, 2388.622559, 6.457468),Angle(-0.021, 76.784, -0.105)},
                {Vector(1792.775024, 2484.073730, 34.416920),Angle(-0.092, -90.006, -0.000)},
                {Vector(1813.720337, 3083.558105, 14.456622),Angle(0.007, -19.599, -0.099)},
                {Vector(1836.056030, 3531.310791, 39.774189),Angle(-6.630, -94.713, 127.051)},
            },
        },
        ["Шкаф"] = {
            loot = {
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0, chance2 = 0.38, count = 1, type = INV_HATS},
                ["Энтити"] = {loot = {"ent_bandage","ent_smallmedkit","ent_shina", "ent_medkit", "ent_bandage", "ent_bandage "}, 
                chance1 = 0.38, chance2 = 0.42, count = 1, type = INV_ENTITY},
                ["Одежда"] = {loot = {"Брюки 1 (муж.)","Брюки 2 (муж.)","Брюки 3 (муж.)","Брюки 4 (муж.)","Брюки 5 (муж.)","Брюки 6 (муж.)","Брюки 7 (муж.)","Брюки 8 (муж.)","Брюки 9 (муж.)","Брюки 10 (муж.)","Футболка 1 (муж.)","Футболка 2 (муж.)","Футболка 3 (муж.)","Футболка 4 (муж.)","Футболка 5 (муж.)","Футболка 6 (муж.)","Футболка 7 (муж.)","Футболка 8 (муж.)","Футболка 9 (муж.)","Футболка 10 (муж.)","Футболка 10 (муж.)","Футболка 11 (муж.)","Футболка 12 (муж.)","Футболка 13 (муж.)","Футболка 14 (муж.)","Футболка 15 (муж.)","Футболка 16 (муж.)","Футболка 17 (муж.)","Футболка 18 (муж.)","Футболка 19 (муж.)","Футболка 20 (муж.)","Футболка 21 (муж.)","Футболка 22 (муж.)","Футболка 23 (муж.)","Футболка 24 (муж.)","Футболка 25 (муж.)","Футболка 26 (муж.)","Футболка 27 (муж.)","Футболка 28 (муж.)","Красная парка (муж.)","Синяя парка (муж.)","Куртка 3 (муж.)","Костюм 1 (муж.)"}, 
                chance1 = 0.42, chance2 = 0.8, count = 1, type = INV_CLOTHES},
                ["Оружие"] = {loot = {"tfa_nmrih_bat","tfa_nmrih_kknife", "tfa_nmrih_spade"}, 
                chance1 = 0.8, chance2 = 0.91, count = 1, type = INV_WEAPON},
                ["Редкое"] = {loot = {"firehelmet","motohelmet","ssh68","firehelmet","motohelmet","ssh68","turtlecap",'motohelmet','backpack_molle','backpack_trizip','backpack_citya','backpack_cityb','backpack_cityc','backpack_city2a','backpack_city2b','backpack_baselardwild'}, 
                chance1 = 0.91, chance2 = 0.97, count = 1, type = INV_HATS},
                ["Бронежилет"] = {loot = {"policevest"}, 
                chance1 = 0.97, chance2 = 0.99, count = 1, type = INV_HATS},
                ["Очень редкое"] = {loot = {"backpack_pilgrim","backpack_pilgrim2a","backpack_pilgrim2b","backpack_pilgrim2c", "pressvest", "helmetmich", "policevest"}, 
                chance1 = 0.99, chance2 = 1, count = 1, type = INV_HATS},
            },
            model = "models/props_c17/furnituredresser001a.mdl",
            pos = {
                {Vector(1676.887939, -181.737274, 400.515350), Angle(88.385, -175.465, -3.245)},
                {Vector(1217.518311, 196.492935, 400.440796), Angle(-88.376, -57.173, 5.778)},
                {Vector(433.319641, 869.739441, 688.781860), Angle(1.600, -89.787, -0.009)},
            },
        },
        ["Шкафчик"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife", "tfa_nmrih_hatchet","tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife",},
                chance1 = 0, chance2 = 0.16, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.16, chance2 = 0.20, count = 1, type = INV_ENTITY},
                ["Редкое оружие"] = {loot = {"weapon_rpw_binoculars","guitar_sad", "wep_jack_job_drpradio",},
                chance1 = 0.2, chance2 = 0.25, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52"},
                chance1 = 0.25, chance2 = 0.26, count = 1, type = INV_ENTITY},
                ["Очень редкое сломанное оружие"] = {loot = {"gun93","gun_lee_enf", "gun39", "gun27", "gun33", "gun31", "gun53", "gun23", "gun41", "gun61", "gun34", "gun37", "gun38"},
                chance1 = 0.26, chance2 = 0.264, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_bandage","ent_smallmedkit", "ent_shina", "ent_medkit", "ent_bandage", "ent_bandage"},
                chance1 = 0.264, chance2 = 0.274, count = 1, type = INV_ENTITY},
                ["Хлам"] = {loot = {"hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28"},
                chance1 = 0.274, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_wasteland/controlroom_filecabinet002a.mdl",
            pos = {
                {Vector(-824.510010, 2791.887451, 15.825125), Angle(-89.678, 42.325, 89.975)},
                {Vector(1217.518311, 196.492935, 400.440796), Angle(-88.376, -57.173, 5.778)},
                {Vector(433.319641, 869.739441, 688.781860), Angle(1.600, -89.787, -0.009)},
            },
        },
        ["Холодильник"] = {
            loot = {
                ["Жрачка"] = { loot = {"models/foodnhouseholditems/chipsbag1.mdl","models/foodnhouseholditems/chipscheezit.mdl","models/foodnhouseholditems/chipsbag2.mdl","models/foodnhouseholditems/chipsdoritos2.mdl","models/foodnhouseholditems/chipsdoritos.mdl","models/foodnhouseholditems/chipsdoritos5.mdl","models/foodnhouseholditems/chipsdoritos4.mdl","models/foodnhouseholditems/chipsdoritos6.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipsfritoshoops.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipslays2.mdl","models/foodnhouseholditems/chipslays6.mdl","models/foodnhouseholditems/chipslays5.mdl","models/foodnhouseholditems/chipslays3.mdl","models/foodnhouseholditems/chipslays8.mdl","models/foodnhouseholditems/chipslays7.mdl","models/foodnhouseholditems/chipslays4.mdl","models/foodnhouseholditems/chipsbag3.mdl","models/foodnhouseholditems/chipstropical.mdl","models/foodnhouseholditems/chipstwisties.mdl","models/foodnhouseholditems/cookies.mdl","models/foodnhouseholditems/digestive.mdl","models/foodnhouseholditems/toffifee.mdl",}, 
                    chance1 = 0, chance2 = 0.45, count = 1, type = INV_FOOD
                },
                ["Вода"] = {
                    loot = {"models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/beercan01.mdl","models/foodnhouseholditems/beercan03.mdl","models/foodnhouseholditems/beer_master.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl"}, 
                    chance1 = 0.45, chance2 = 0.95, count = 1, type = INV_FOOD
                },
                ["Пустые банки"] = {
                    loot = {"hlam29", "update01_hlam7", "update01_hlam3", "update01_hlam11", "hlam29", "update01_hlam7", "update01_hlam3",}, 
                    chance1 = 0.95, chance2 = 1, count = 1, type = INV_ENTITY
                },
            },
            model = "models/props_c17/furniturefridge001a.mdl",
            pos = {
                {Vector(1129.387817, -2756.460449, 37.360992), Angle(0.186, 179.998, 0.000)},
                {Vector(-872.407288, 1040.992798, 37.274109), Angle(0.018, -1.244, -0.189)},
            },
        },
        ["Стол"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife", "tfa_nmrih_hatchet","tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife",},
                chance1 = 0, chance2 = 0.16, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.16, chance2 = 0.20, count = 1, type = INV_ENTITY},
                ["Редкое оружие"] = {loot = {"weapon_rpw_binoculars","guitar_sad", "wep_jack_job_drpradio",},
                chance1 = 0.2, chance2 = 0.25, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52"},
                chance1 = 0.25, chance2 = 0.26, count = 1, type = INV_ENTITY},
                ["Очень редкое сломанное оружие"] = {loot = {"gun93","gun_lee_enf", "gun39", "gun27", "gun33", "gun31", "gun53", "gun23", "gun41", "gun61", "gun34", "gun37", "gun38"},
                chance1 = 0.26, chance2 = 0.264, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_bandage","ent_smallmedkit", "ent_shina", "ent_medkit", "ent_bandage", "ent_bandage"},
                chance1 = 0.264, chance2 = 0.274, count = 1, type = INV_ENTITY},
                ["Хлам"] = {loot = {"hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28"},
                chance1 = 0.274, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_wasteland/controlroom_desk001b.mdl",
            pos = {
                {Vector(578.593811, -1266.402100, 16.884165), Angle(-0.310, 168.476, 0.075)},
                {Vector(387.183533, -1729.230835, 16.901028), Angle(-0.291, -117.796, 0.002)},
                {Vector(498.513916, -1965.732544, 16.829977), Angle(0.000, 136.424, 0.000)},
            },
        },
        ["Коробка(обычный лут)"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife", "tfa_nmrih_hatchet","tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife",},
                chance1 = 0, chance2 = 0.16, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.16, chance2 = 0.20, count = 1, type = INV_ENTITY},
                ["Редкое оружие"] = {loot = {"weapon_rpw_binoculars","guitar_sad", "wep_jack_job_drpradio",},
                chance1 = 0.2, chance2 = 0.25, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52"},
                chance1 = 0.25, chance2 = 0.26, count = 1, type = INV_ENTITY},
                ["Очень редкое сломанное оружие"] = {loot = {"gun93","gun_lee_enf", "gun39", "gun27", "gun33", "gun31", "gun53", "gun23", "gun41", "gun61", "gun34", "gun37", "gun38"},
                chance1 = 0.26, chance2 = 0.264, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_bandage","ent_smallmedkit", "ent_shina", "ent_medkit", "ent_bandage", "ent_bandage"},
                chance1 = 0.264, chance2 = 0.274, count = 1, type = INV_ENTITY},
                ["Хлам"] = {loot = {"hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28"},
                chance1 = 0.274, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props/generic/cardboardbox07.mdl",
            pos = {
                {Vector(285.067383, -1974.913452, 1.712611), Angle(0.001, 67.966, 0.007)},
                {Vector(564.991638, -1825.052368, 1.549926), Angle(0.000, -167.713, 0.000)},
                {Vector(497.284180, -2787.371094, 1.549926), Angle(0.000, 117.423, 0.000)},
            },
        },
        ["Коробка(обычный лут)"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife", "tfa_nmrih_hatchet","tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife",},
                chance1 = 0, chance2 = 0.16, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.16, chance2 = 0.20, count = 1, type = INV_ENTITY},
                ["Редкое оружие"] = {loot = {"weapon_rpw_binoculars","guitar_sad", "wep_jack_job_drpradio",},
                chance1 = 0.2, chance2 = 0.25, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52"},
                chance1 = 0.25, chance2 = 0.26, count = 1, type = INV_ENTITY},
                ["Очень редкое сломанное оружие"] = {loot = {"gun93","gun_lee_enf", "gun39", "gun27", "gun33", "gun31", "gun53", "gun23", "gun41", "gun61", "gun34", "gun37", "gun38"},
                chance1 = 0.26, chance2 = 0.264, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_bandage","ent_smallmedkit", "ent_shina", "ent_medkit", "ent_bandage", "ent_bandage"},
                chance1 = 0.264, chance2 = 0.274, count = 1, type = INV_ENTITY},
                ["Хлам"] = {loot = {"hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28"},
                chance1 = 0.274, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props/generic/cardboardbox07.mdl",
            pos = {
                {Vector(285.067383, -1974.913452, 1.712611), Angle(0.001, 67.966, 0.007)},
                {Vector(564.991638, -1825.052368, 1.549926), Angle(0.000, -167.713, 0.000)},
                {Vector(497.284180, -2787.371094, 1.549926), Angle(0.000, 117.423, 0.000)},
            },
        },
        ["Холодильник"] = {
            loot = {
                ["Жрачка"] = { loot = {"models/foodnhouseholditems/chipsbag1.mdl","models/foodnhouseholditems/chipscheezit.mdl","models/foodnhouseholditems/chipsbag2.mdl","models/foodnhouseholditems/chipsdoritos2.mdl","models/foodnhouseholditems/chipsdoritos.mdl","models/foodnhouseholditems/chipsdoritos5.mdl","models/foodnhouseholditems/chipsdoritos4.mdl","models/foodnhouseholditems/chipsdoritos6.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipsfritoshoops.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipslays2.mdl","models/foodnhouseholditems/chipslays6.mdl","models/foodnhouseholditems/chipslays5.mdl","models/foodnhouseholditems/chipslays3.mdl","models/foodnhouseholditems/chipslays8.mdl","models/foodnhouseholditems/chipslays7.mdl","models/foodnhouseholditems/chipslays4.mdl","models/foodnhouseholditems/chipsbag3.mdl","models/foodnhouseholditems/chipstropical.mdl","models/foodnhouseholditems/chipstwisties.mdl","models/foodnhouseholditems/cookies.mdl","models/foodnhouseholditems/digestive.mdl","models/foodnhouseholditems/toffifee.mdl",}, 
                    chance1 = 0, chance2 = 0.45, count = 1, type = INV_FOOD
                },
                ["Вода"] = {
                    loot = {"models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/beercan01.mdl","models/foodnhouseholditems/beercan03.mdl","models/foodnhouseholditems/beer_master.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl"}, 
                    chance1 = 0.45, chance2 = 0.95, count = 1, type = INV_FOOD
                },
                ["Пустые банки"] = {
                    loot = {"hlam29", "update01_hlam7", "update01_hlam3", "update01_hlam11", "hlam29", "update01_hlam7", "update01_hlam3",}, 
                    chance1 = 0.95, chance2 = 1, count = 1, type = INV_ENTITY
                },
            },
            model = "models/props_c17/furniturefridge001a.mdl",
            pos = {
                {Vector(1126.919678, -2341.309326, 37.396740), Angle(0.379, -179.774, 0.301)},
                {Vector(1127.961914, -2719.603271, 37.368790), Angle(-0.000, 178.245, -0.032)},
            },
        },
        ["Холодильник"] = {
            loot = {
                ["Жрачка"] = { loot = {"models/foodnhouseholditems/chipsbag1.mdl","models/foodnhouseholditems/chipscheezit.mdl","models/foodnhouseholditems/chipsbag2.mdl","models/foodnhouseholditems/chipsdoritos2.mdl","models/foodnhouseholditems/chipsdoritos.mdl","models/foodnhouseholditems/chipsdoritos5.mdl","models/foodnhouseholditems/chipsdoritos4.mdl","models/foodnhouseholditems/chipsdoritos6.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipsfritoshoops.mdl","models/foodnhouseholditems/chipsfritostwists.mdl","models/foodnhouseholditems/chipslays.mdl","models/foodnhouseholditems/chipslays2.mdl","models/foodnhouseholditems/chipslays6.mdl","models/foodnhouseholditems/chipslays5.mdl","models/foodnhouseholditems/chipslays3.mdl","models/foodnhouseholditems/chipslays8.mdl","models/foodnhouseholditems/chipslays7.mdl","models/foodnhouseholditems/chipslays4.mdl","models/foodnhouseholditems/chipsbag3.mdl","models/foodnhouseholditems/chipstropical.mdl","models/foodnhouseholditems/chipstwisties.mdl","models/foodnhouseholditems/cookies.mdl","models/foodnhouseholditems/digestive.mdl","models/foodnhouseholditems/toffifee.mdl",}, 
                    chance1 = 0, chance2 = 0.45, count = 1, type = INV_FOOD
                },
                ["Вода"] = {
                    loot = {"models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/beercan01.mdl","models/foodnhouseholditems/beercan03.mdl","models/foodnhouseholditems/beer_master.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl","models/foodnhouseholditems/cola_swift2.mdl","models/foodnhouseholditems/sodacan01.mdl","models/foodnhouseholditems/sodacanc01.mdl","models/foodnhouseholditems/sodacan04.mdl","models/foodnhouseholditems/sodacan05.mdl","models/foodnhouseholditems/sprunk1.mdl","models/foodnhouseholditems/sodacanb01.mdl","models/foodnhouseholditems/juicesmall.mdl","models/foodnhouseholditems/juice3.mdl"}, 
                    chance1 = 0.45, chance2 = 0.95, count = 1, type = INV_FOOD
                },
                ["Пустые банки"] = {
                    loot = {"hlam29", "update01_hlam7", "update01_hlam3", "update01_hlam11", "hlam29", "update01_hlam7", "update01_hlam3",}, 
                    chance1 = 0.95, chance2 = 1, count = 1, type = INV_ENTITY
                },
            },
            model = "models/props_c17/furniturefridge001a.mdl",
            pos = {
                {Vector(1129.390747, -2222.240479, 37.227753), Angle(0.183, 179.976, -0.034)},
                {Vector(759.693726, -2921.500488, 37.192585), Angle(0.015, 89.996, 0.179)},
            },
        },
        ["Шкафчик"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife", "tfa_nmrih_hatchet","tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife",},
                chance1 = 0, chance2 = 0.16, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.16, chance2 = 0.20, count = 1, type = INV_ENTITY},
                ["Редкое оружие"] = {loot = {"weapon_rpw_binoculars","guitar_sad", "wep_jack_job_drpradio",},
                chance1 = 0.2, chance2 = 0.25, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52"},
                chance1 = 0.25, chance2 = 0.26, count = 1, type = INV_ENTITY},
                ["Очень редкое сломанное оружие"] = {loot = {"gun93","gun_lee_enf", "gun39", "gun27", "gun33", "gun31", "gun53", "gun23", "gun41", "gun61", "gun34", "gun37", "gun38"},
                chance1 = 0.26, chance2 = 0.264, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_bandage","ent_smallmedkit", "ent_shina", "ent_medkit", "ent_bandage", "ent_bandage"},
                chance1 = 0.264, chance2 = 0.274, count = 1, type = INV_ENTITY},
                ["Хлам"] = {loot = {"hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28"},
                chance1 = 0.274, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_wasteland/controlroom_storagecloset001b.mdl",
            pos = {
                {Vector(-3436.446045, 3255.454834, 17.056610), Angle(-89.939, 116.393, 93.175)},
                {Vector(-2996.157471, 3295.011475, 43.956547), Angle(0.027, -89.934, -0.462)},
                {Vector(-940.937805, 2721.080566, 43.793560), Angle(-0.019, 90.033, -0.031)},
            },
        },
        ["Стол"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife", "tfa_nmrih_hatchet","tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife",},
                chance1 = 0, chance2 = 0.16, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.16, chance2 = 0.20, count = 1, type = INV_ENTITY},
                ["Редкое оружие"] = {loot = {"weapon_rpw_binoculars","guitar_sad", "wep_jack_job_drpradio",},
                chance1 = 0.2, chance2 = 0.25, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52"},
                chance1 = 0.25, chance2 = 0.26, count = 1, type = INV_ENTITY},
                ["Очень редкое сломанное оружие"] = {loot = {"gun93","gun_lee_enf", "gun39", "gun27", "gun33", "gun31", "gun53", "gun23", "gun41", "gun61", "gun34", "gun37", "gun38"},
                chance1 = 0.26, chance2 = 0.264, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_bandage","ent_smallmedkit", "ent_shina", "ent_medkit", "ent_bandage", "ent_bandage"},
                chance1 = 0.264, chance2 = 0.274, count = 1, type = INV_ENTITY},
                ["Хлам"] = {loot = {"hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28"},
                chance1 = 0.274, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_wasteland/controlroom_desk001b.mdl",
            pos = {
                {Vector(-1345.876709, 809.111084, 16.814548), Angle(-0.279, -89.301, -0.004)},
                {Vector(-2725.187744, 3129.423340, 17.161598), Angle(0.900, -179.999, 0.000)},
            },
        },
        ["Шкаф"] = {
            loot = {
                ["Аксессуары"] = {loot = {"gta_bandana01","gta_glasses01","gta_glasses01b","gta_glasses01c","gta_glasses01f","gta_beanie01a","gta_beanie01b","gta_beanie01c","gta_beanie01d","gta_beanie02a","gta_beanie02b","gta_beanie02c","gta_beanie02d","gta_beret01","gta_cap01a","gta_cap01b","gta_cap01c","gta_cap01d","gta_cap01e","gta_cap01f","gta_cap01g","gta_cap01h","gta_cap01i","gta_cap01j","gta_cap02a","gta_cap02b","gta_cap02c","gta_cap02d","gta_cap02e","gta_cap02f","gta_cap02g","gta_cap02h","gta_cap02i","gta_cap02j","gta_cap02k","gta_cap02l"}, 
                chance1 = 0, chance2 = 0.38, count = 1, type = INV_HATS},
                ["Энтити"] = {loot = {"ent_bandage","ent_smallmedkit","ent_shina", "ent_medkit", "ent_bandage", "ent_bandage "}, 
                chance1 = 0.38, chance2 = 0.42, count = 1, type = INV_ENTITY},
                ["Одежда"] = {loot = {"Брюки 1 (муж.)","Брюки 2 (муж.)","Брюки 3 (муж.)","Брюки 4 (муж.)","Брюки 5 (муж.)","Брюки 6 (муж.)","Брюки 7 (муж.)","Брюки 8 (муж.)","Брюки 9 (муж.)","Брюки 10 (муж.)","Футболка 1 (муж.)","Футболка 2 (муж.)","Футболка 3 (муж.)","Футболка 4 (муж.)","Футболка 5 (муж.)","Футболка 6 (муж.)","Футболка 7 (муж.)","Футболка 8 (муж.)","Футболка 9 (муж.)","Футболка 10 (муж.)","Футболка 10 (муж.)","Футболка 11 (муж.)","Футболка 12 (муж.)","Футболка 13 (муж.)","Футболка 14 (муж.)","Футболка 15 (муж.)","Футболка 16 (муж.)","Футболка 17 (муж.)","Футболка 18 (муж.)","Футболка 19 (муж.)","Футболка 20 (муж.)","Футболка 21 (муж.)","Футболка 22 (муж.)","Футболка 23 (муж.)","Футболка 24 (муж.)","Футболка 25 (муж.)","Футболка 26 (муж.)","Футболка 27 (муж.)","Футболка 28 (муж.)","Красная парка (муж.)","Синяя парка (муж.)","Куртка 3 (муж.)","Костюм 1 (муж.)"}, 
                chance1 = 0.42, chance2 = 0.8, count = 1, type = INV_CLOTHES},
                ["Оружие"] = {loot = {"tfa_nmrih_bat","tfa_nmrih_kknife", "tfa_nmrih_spade"}, 
                chance1 = 0.8, chance2 = 0.91, count = 1, type = INV_WEAPON},
                ["Редкое"] = {loot = {"firehelmet","motohelmet","ssh68","firehelmet","motohelmet","ssh68","turtlecap",'motohelmet','backpack_molle','backpack_trizip','backpack_citya','backpack_cityb','backpack_cityc','backpack_city2a','backpack_city2b','backpack_baselardwild'}, 
                chance1 = 0.91, chance2 = 0.97, count = 1, type = INV_HATS},
                ["Бронежилет"] = {loot = {"policevest"}, 
                chance1 = 0.97, chance2 = 0.99, count = 1, type = INV_HATS},
                ["Очень редкое"] = {loot = {"backpack_pilgrim","backpack_pilgrim2a","backpack_pilgrim2b","backpack_pilgrim2c", "pressvest", "helmetmich", "policevest"}, 
                chance1 = 0.99, chance2 = 1, count = 1, type = INV_HATS},
            },
            model = "models/props_c17/furnituredresser001a.mdl",
            pos = {
                {Vector(-1859.875244, 280.109680, 404.866180), Angle(-72.733, 13.620, -32.629)},
                {Vector(-1665.658569, 902.512451, 408.055725), Angle(88.439, -115.747, -3.201)},
                {Vector(-1647.509033, 255.799332, 41.400284), Angle(1.597, 0.010, 0.097)},
            },
        },
        ["Шкафчик"] = {
            loot = {
                ["Оружие ближнего боя"] = {loot = {"tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife", "tfa_nmrih_hatchet","tfa_nmrih_wrench","tfa_nmrih_lpipe", "tfa_nmrih_kknife",},
                chance1 = 0, chance2 = 0.16, count = 1, type = INV_WEAPON},
                ["Патроны"] = {loot = {"tfa_ammo_357", "tfa_ammo_buckshott", "tfa_ammo_pistoll", "tfa_ammo_winchester"},
                chance1 = 0.16, chance2 = 0.20, count = 1, type = INV_ENTITY},
                ["Редкое оружие"] = {loot = {"weapon_rpw_binoculars","guitar_sad", "wep_jack_job_drpradio",},
                chance1 = 0.2, chance2 = 0.25, count = 1, type = INV_WEAPON},
                ["Редкое сломанное оружие"] = {loot = {"gun30","gun32", "gun29", "gun35", "gun24", "gun53", "gun25", "gun52"},
                chance1 = 0.25, chance2 = 0.26, count = 1, type = INV_ENTITY},
                ["Очень редкое сломанное оружие"] = {loot = {"gun93","gun_lee_enf", "gun39", "gun27", "gun33", "gun31", "gun53", "gun23", "gun41", "gun61", "gun34", "gun37", "gun38"},
                chance1 = 0.26, chance2 = 0.264, count = 1, type = INV_ENTITY},
                ["Редкое энтити"] = {loot = {"ent_bandage","ent_smallmedkit", "ent_shina", "ent_medkit", "ent_bandage", "ent_bandage"},
                chance1 = 0.264, chance2 = 0.274, count = 1, type = INV_ENTITY},
                ["Хлам"] = {loot = {"hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28"},
                chance1 = 0.274, chance2 = 0.93, count = 1, type = INV_ENTITY},
                ["Редкий хлам"] = {loot = {"ent_battery","update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"},
                chance1 = 0.93, chance2 = 1, count = 1, type = INV_ENTITY},
            },
            model = "models/props_wasteland/controlroom_storagecloset001a.mdl",
            pos = {
                {Vector(-3014.581055, -879.283447, 171.968475), Angle(0.002, 90.134, -0.001)},
                {Vector(-2767.951660, -2192.136230, 144.865067), Angle(-89.886, -135.239, -92.991)},
                {Vector(1306.935913, -4845.938965, 48.405941), Angle(-89.948, 126.882, 180.000)},
            },
        },
    },
}


rp.LootSystem.RandomFloorLoot = {
    --[[
    ["House1"] = {
        minpos = Vector(-14010.547852, 14840.890625, 1288.614502),
        maxpos = Vector(-14897.722656, 15217.665039, 1405.738892),
        height = 100,
        floorloot = {
            ["Обычный лут"] = {loot = {"firehelmet","helmetmich"}, chance1 = 0, chance2 = 0.9, count = 1, type = INV_HATS},
        }, 
    },
    ["House2"] = {
        pos = Vector(-10579.544922, 13014.506836, 874.996216),
        minpos = Vector(-10523, 12965, 746),
        maxpos = Vector(-10867.440430, 13418.893555, 935.100647),
        height = 100,
        floorloot = {
            ["Обычный лут"] = {loot = {"firehelmet","helmetmich"}, chance1 = 0, chance2 = 0.9, count = 1, type = INV_HATS},
        }, 
    },
    ]]
}

function IsInPolygon( vertices, x, y, z, height )
    local intersectionCount = 0

    local x0 = vertices[#vertices].x - x
    local y0 = vertices[#vertices].y - y

    local min

    for i=1,#vertices do
            if !min || vertices[i].z < min then
                min = vertices[i].z
            end
           local x1 = vertices[i].x - x
           local y1 = vertices[i].y - y

           if y0 > 0 and y1 <= 0 and x1 * y0 > y1 * x0 then
                   intersectionCount = intersectionCount + 1
           end

           if y1 > 0 and y0 <= 0 and x0 * y1 > y0 * x1 then
                   intersectionCount = intersectionCount + 1
           end

           x0 = x1
           y0 = y1
    end

    if z < min || z > min+height then
        return false 
    end

    return (intersectionCount % 2) == 1
end

function IsInsideEntity(ent, propID)
    return IsInPolygon(rp.LootSystem.RandomLoot[propID].coords, ent:GetPos().x, ent:GetPos().y, ent:GetPos().z, rp.LootSystem.RandomLoot[propID].height)
end

function IsInsideVector(vector, propID)
    return IsInPolygon(rp.LootSystem.RandomLoot[propID].coords, vector[1], vector[2], vector[3], rp.LootSystem.RandomLoot[propID].height)
end

local function canSpawnHere(vec)
    local tr = {
           start = vec,
           endpos = vec,
           mins = Vector(-18, -18, 0), -- draw a 3d box of the player hull size
           maxs = Vector(18, 18, 73)
    }

    local hullTrace = util.TraceHull(tr)

    if (hullTrace.Hit) then
           return false
    end

    return true
end
function rp.LootSystem.RandomVector(id)
    local vec
    local min = rp.LootSystem.RandomLoot[id].minpos
    local max = rp.LootSystem.RandomLoot[id].maxpos
    local tries = 0

    while (tries < 50) do
           vec = Vector(math.Rand(min[1], max[1]), math.Rand(min[2], max[2]), math.Rand(min[3], max[3]))
           local result = util.QuickTrace(vec, Vector(0, 0, -100000))
           vec = result.HitPos
           tries = tries + 1
           if util.IsInWorld(vec) and canSpawnHere(vec)    then break end
    end

    if (tries == 50) then
           return false
    end
    return vec + Vector(20,0,0)
end