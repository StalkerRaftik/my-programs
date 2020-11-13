print('Шарэд часть загружена!')

rp = rp or {}
rp.Conquest = rp.Conquest or {}
rp.Conquest.Config = {
    ["Больница"] = {
        coords = {
            [1] = Vector(-6532.607910, 15113.353516, 700.691040),
            [2] = Vector(-4805.998047, 11528.458984, 1244.130615),
        },
        flag = {Vector(-5454.531738, 11644.427734, 784.031189), Angle(0.000, 0.000, 0.000)},
        container = {Vector(-5945.934570, 12262.172852, 776.508423), Angle(0, 0, 0)},
        comment = "бинты, аптечки и другие медикаменты",
        rewards = { "ent_bandage","ent_smallmedkit","ent_smallmedkit","ent_smallmedkit","ent_shina", "ent_medkit", "ent_bandage", "ent_bandage", "ent_bandage", "ent_bandage" },
    },
    ["Завод"] = {
        coords = {
            [1] = Vector(-3835.852295, 11516.246094, 527.439819),
            [2] = Vector(14.073106, 6899.096680, 1492.911377),
        },
        flag = {Vector(-2699.450928, 9674.443359, 789.031250), Angle(0.000, 78.625, 0.000)},
        container = {Vector(-2654.074463, 9469.521484, 789.031250), Angle(0.000, 221.348, 0.000)},
        comment = "производственный хлам и химикаты",
        rewards = { "acetone","bismuth", "toluol", "benznatriya", "acetone","bismuth", "toluol", "benznatriya", "hlam5", "update01_hlam2", "hlam4", "hlam11", "hlam2", "hlam3", "hlam8", "hlam10", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1","hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28" },
    },
    ["Кафе у заброшенного города"] = {
        coords = {
            [1] = Vector(862.353699, 31.721272, -261.669250),
            [2] = Vector(-893.914490, 1529.485596, 1090.095703),
        },
        flag = {Vector(-119.774231, 720.624939, -7.709000), Angle(0.000, 94.470, 0.000)},
        container = {Vector(-853.139099, 793.306030, 0.508389), Angle(0.000, 90.136, 0.000)},
        comment = "различные патроны и редкий хлам",
        rewards = { "item_ammo_pistol", "item_ammo_pistol", "item_ammo_357", "item_ammo_357", "item_box_buckshot", "item_box_buckshot","tfa_ammo_ar2", "tfa_ammo_smg", "tfa_ammo_winchester", "update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1" },
    },
    ["Разрушенная школа"] = {
        coords = {
            [1] = Vector(-11099.686523, 1828.043335, -252.228577),
            [2] = Vector(-14423.809570, 5452.342773, 1257.30566),
        },
        flag = {Vector(-11281.442383, 3474.958008, 316.923126), Angle(0.000, 90.789, 0.000)},
        container = {Vector(-11681.695312, 3439.883301, 320.142365), Angle(0.000, 90.395, 0.000)},
        comment = "различный производственный хлам и химикаты",
        rewards = { "acetone","bismuth", "toluol", "benznatriya", "hlam5", "update01_hlam2", "hlam4", "hlam11", "hlam2", "hlam3", "hlam8", "hlam10", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1","hlam31","hlam34", "hlam32", "hlam27", "newhlam6", "newhlam5", "hlam23", "hlam21", "newhlam1", "newhlam3", "hlam22", "hlam20", "hlam9", "newhlam4", "newhlam2", "update01_hlam6", "update01_hlam10", "hlam29", "update01_hlam3", "update01_hlam7", "hlam25", "hlam12", "hlam19", "hlam13", "hlam30", "hlam24", "update01_hlam5", "update01_hlam9", "hlam28", "item_ammo_pistol", "item_ammo_pistol", "item_ammo_357", "item_ammo_357", "item_box_buckshot", "item_box_buckshot","tfa_ammo_ar2", "tfa_ammo_smg", "tfa_ammo_winchester", },
    },
}

rp.Conquest.SpecRewards = {
	["Убежище"] = {
		[1] = {rewards = {"update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "update01_hlam1", "item_ammo_pistol", "item_ammo_pistol", "item_ammo_357", "item_ammo_357", "item_box_buckshot", "item_box_buckshot", "tfa_ammo_smg", "tfa_ammo_smg"}, territories = "Кафе у заброшенного города"},
		[2] = {rewards = {"ent_bandage","ent_smallmedkit","ent_smallmedkit","ent_smallmedkit","ent_shina", "ent_medkit", "ent_bandage", "ent_bandage", "ent_bandage", "ent_bandage", "item_ammo_pistol", "item_ammo_pistol", "item_ammo_357", "item_ammo_357", "item_box_buckshot", "item_box_buckshot", "tfa_ammo_smg"}, territories = "Больница"},
	},
	["Военные"] = {
		[1] = {rewards = {"item_ammo_pistol","item_ammo_pistol", "item_ammo_357", "item_box_buckshot", "item_box_buckshot","tfa_ammo_ar2", "tfa_ammo_smg"}, territories = "Кафе у заброшенного города"},
		[2] = {rewards = {"item_ammo_pistol","item_ammo_pistol", "item_ammo_357", "item_box_buckshot", "item_box_buckshot", "tfa_ammo_ar2", "tfa_ammo_smg"}, territories = "Школа"},
	},
	["Ренегаты"] = {
		[1] = {rewards = {"update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1", "item_ammo_pistol", "item_ammo_pistol", "item_ammo_357", "item_ammo_357", "item_box_buckshot", "item_box_buckshot"}, territories = "Кафе у заброшенного города"},
		[2] = {rewards = {"update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1", "item_ammo_pistol", "item_ammo_pistol", "item_ammo_357", "item_ammo_357", "item_box_buckshot", "item_box_buckshot"}, territories = "Разрушенная школа"},
	},
	["Ученые"] = {
		[1] = {rewards = {"bismuth","toluol","benznatriya","acetone"}, territories = "Завод"},
	},
	["Вознесение"] = {
		[1] = {rewards = {"update01_hlam2", "hlam35", "hlam10", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1", "item_ammo_pistol", "item_ammo_pistol", "item_ammo_357", "item_ammo_357", "item_box_buckshot", "item_box_buckshot"}, territories = "Кафе у заброшенного города"},
		[2] = {rewards = {"ent_bandage","ent_smallmedkit","ent_smallmedkit","ent_smallmedkit","ent_shina", "ent_medkit", "ent_bandage", "ent_bandage", "ent_bandage", "ent_bandage"}, territories = "Больница"},
	},
	["Хаос"] = {
		[1] = {rewards = {"item_ammo_pistol", "item_ammo_357", "item_box_buckshot", "item_box_buckshot","tfa_ammo_ar2", "tfa_ammo_smg", "tfa_ammo_winchester"}, territories = "Кафе у заброшенного города"},
		[2] = {rewards = {"hlam5", "update01_hlam2", "hlam4", "hlam11", "hlam2", "hlam3", "hlam8", "hlam10", "hlam14", "hlam36", "hlam35", "update01_hlam4", "hlam15", "hlam16", "hlam17", "hlam18", "update01_hlam1"}, territories = "Завод"},
	},
}











