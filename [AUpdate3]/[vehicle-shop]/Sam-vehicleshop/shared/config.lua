-- Configuration settings for the GPS system.
Config               = {}

-- Debug print setting for displaying debug messages.
Config.DebugPrint    = true

-- Locale setting for language localization.
Config.Locale        = "en"

-- ("esx" | "qb") -- > The latest version is always used.
Config.FrameWork     = "qb"

-- ("esx_notify" | "qb_notify" | "custom_notify") -- > System to be used
Config.NotifyType    = "qb_notify"

---("ox_inventory" | "qb_inventory" | "custom") System to be used
Config.InventoryType = "qb_inventory"

--[[
    -- QB | ESX
    ("owned_vehicles" | "player_vehicles")
    Database table name where player vehicles are save.
    It must be set to one of the two databases.
    Table columns will be written accordingly.
    Currently only 2 databases can be used.
    !!! "owned_vehicles" for ESX | "player_vehicles" for QB !!!
--]]
Config.PlayerVehiclesDB = "player_vehicles"

Config.Plate            = {
    -- Total number max 8, for ex: Letters = 6, Numbers = 2 => 6 + 2 = 8
    NumberOfLetters = 6,
    NumberOfNumbers = 2,
    Letters = {
        "A", "B", "C", "D", "E", "F",
        "G", "H", "I", "J", "K", "L",
        "M", "N", "O", "P", "Q", "R",
        "S", "T", "U", "V", "W", "X",
        "Y", "Z"
    }
}

Config.VehicleKeys      = {
    -- (true | false) -- Will keys be given after vehicle purchases?
    status = true,
    -- [
    -- If you are setting custom. Please review server/utils.lua and configure it accordingly.
    --]
    -- ("qb" | "custom") -- The key system depends on which plugin.
    system = "qb",
}

Config.Music            = {
    status = true,
    -- Volume: 0.1 - 1.0
    volume = 0.5,
    -- Music Urls: <youtube> link
    musics = {
        [1] = {
            -- file name: "public/music/x_music.mp3"
            fileName = "skyfall.mp3",
            name = "Skyfall - Adele",
            author = "Adele"
        },
    }
}

Config.Shops            = {
    {
        name              = "车店",
        vehicles          = Config.Vehicles,
        type              = "car", -- > car | boat | helicopter
        job               = false, -- > false or job name
        isMoneyAnItem     = {
            status = true,
            -- Item name if status is true
            item = "cash"
        },
        buyWithBlackMoney = {
            active = true,
            -- Item name if active is true
            item = "blackmoney",
            -- Calculated x times the normal vehicle price
            multiplier = 1.5
        },
        vehiclesBeRented  = {
            active = true,
            --[[
                Value percentage calculates the daily rate of the vehicle price,
                for ex: X Vehicle Price = 100.000, Percentage = 10% -> Daily Fee = 10.000
            --]]
            percentageOfRentalFee = 10,
        },
        customPlate       = {
            active = true,
            price = 2000
        },
        coords            = vector3(-56.403923797607, -1096.7048095703, 25.5),
        camCoords         = vector3(-38.0, -1059.0, -42.5),
        camRotation       = vector3(190.0, 180.0, 5.00),
        distance          = 2.0,
        carSpawnCoords    = vector4(-37.279121, -1064.109863, -44.359741, -10.0),
        deliveryCoords    = vector4(-48.906772613525, -1077.6535644531, 26.81402015686, 66.28524017334),
        deliveryGarage    = "pillboxgarage", -- if u need, the QB Framework player_vehicles table needs it.
        compareCoords     = {
            selectedVehicleCoords = vector4(-35.5, -1064.109863, -44.359741, 0.0),
            selectedCam = {
                coords = vector3(-38.0, -1059.0, -42.5),
                rotation = vector3(190.0, 180.0, 5.00),
            },
            comparedVehicleCoords = vector4(-45.758240, -1055.221924, -44.359741, 270.0),
            -- The coordinate we set to center the vehicle a little more when the vehicle properties panel is closed !
            nosm_com_veh_coords = vector4(-45.758240, -1054.221924, -44.359741, 270.0),
            comparedCam = {
                coords = vector3(-40.5, -1053.0, -42.5),
                rotation = vector3(190.0, 180.0, -85.00),
            },
        },
        testDrive         = {
            active      = true, -- if you want to allow a test drive
            seconds     = 30,
            startCoords = vector3(-54.5, -1107.6, 26.5),
            range       = 400,
        },
        discount          = {
            active = true,
            -- Makes a certain percentage discount on existing prices (1-100)
            percentage = 10
        },
        textType          = "ox", -- > "drawtext" | "ox" | "qb"
    },
}

Config.VehicleClasses   = {
    [0] = "Compacts",
    [1] = "Sedans",
    [2] = "SUVs",
    [3] = "Coupes",
    [4] = "Muscle",
    [5] = "Sports Classics",
    [6] = "Sports",
    [7] = "Super",
    [8] = "Motorcycles",
    [9] = "Off-road",
    [10] = "Industrial",
    [11] = "Utility",
    [12] = "Vans",
    [13] = "Cycles",
    [14] = "Boats",
    [15] = "Helicopters",
    [16] = "Planes",
    [17] = "Service",
    [18] = "Emergency",
    [19] = "Military",
    [20] = "Commercial",
    [21] = "Trains",
    [22] = "Open Wheel",
}

Config.Vehicles         = {
    ["紧凑"] = {
        { label = "Blista",     name = "blista",     price = 15000 },
        { label = "Brioso",     name = "brioso",     price = 20000 },
        { label = "Dilettante", name = "dilettante", price = 13000 },
        { label = "Panto",      name = "panto",      price = 16000 },
        { label = "Prairie",    name = "prairie",    price = 25000 },
        { label = "Rhapsody",   name = "rhapsody",   price = 23000 },
        { label = "Brioso2",    name = "brioso2",    price = 22000 },
        { label = "Weevil",     name = "weevil",     price = 25000 },
        { label = "Issi2",      name = "issi2",      price = 28000 },
        { label = "Weevil",     name = "weevil",     price = 21000 },
    },
    ["轿跑"] = {
        { label = "Cogcabrio",  name = "cogcabrio",  price = 170000 },
        { label = "Exemplar",   name = "exemplar",   price = 160000 },
        { label = "F620",       name = "f620",       price = 220000 },
        { label = "Felon",      name = "felon",      price = 230000 },
        { label = "Jackal",     name = "jackal",     price = 180000 },
        { label = "Windsor",    name = "windsor",    price = 250000 },
    },
    
    ["摩托车"] = {
        { label = "Faggio",      name = "faggio",      price = 8000 },
        { label = "Faggio2",     name = "faggio2",     price = 7000 },
        { label = "Avarus",      name = "avarus",      price = 12000 },
        { label = "Cliffhanger", name = "cliffhanger", price = 15000 },
        { label = "Daemon",      name = "daemon",      price = 16000 },
        { label = "Diablous",    name = "diablous",    price = 18000 },
        { label = "Sovereign",   name = "sovereign",   price = 22000 },
        { label = "Zombiea",     name = "zombiea",     price = 19000 },
        { label = "Wolfsbane",   name = "wolfsbane",   price = 17000 },
    },
    
    ["肌肉车"] = {
        { label = "Blade",       name = "blade",       price = 32000 },
        { label = "Buccaneer",   name = "buccaneer",   price = 33000 },
        { label = "Buccaneer2",  name = "buccaneer2",  price = 35000 },
        { label = "Chino",       name = "chino",       price = 34000 },
        { label = "Chino2",      name = "chino2",      price = 32000 },
        { label = "Coquette3",   name = "coquette3",   price = 33000 },
        { label = "Dominator3",  name = "dominator3",  price = 42000 },
        { label = "Faction",     name = "faction",     price = 36000 },
        { label = "Faction2",    name = "faction2",    price = 35000 },
        { label = "Moonbeam",    name = "moonbeam",    price = 28000 },
        { label = "Slamvan3",    name = "slamvan3",    price = 38000 },
        { label = "Voodoo",      name = "voodoo",      price = 58888 },
        { label = "Voodoo2",     name = "voodoo2",     price = 59999 },
    },
    
    --[[ ["offroad"] = {
        { label = "Bf Injection", name = "bfinjection", price = 15000 },
        { label = "Bifta",        name = "bifta",       price = 18000 },
        { label = "Brawler",      name = "brawler",     price = 30000 },
        { label = "Mesa OR",      name = "mesa3",       price = 45000 },
        { label = "Rancher XL",   name = "rancherxl",   price = 30000 },
        { label = "Rebel OR",     name = "rebel2",      price = 20000 },
    }, ]]
    ["普通轿车"] = {
        { label = "Asterope",  name = "asterope",  price = 33000 },
        { label = "Emperor",   name = "emperor",   price = 35000 },
        { label = "Emperor3",  name = "emperor3",  price = 35500 },
        { label = "Fugitive",  name = "fugitive",  price = 32000 },
        { label = "Intruder",  name = "intruder",  price = 31000 },
        { label = "Primo",     name = "primo",     price = 34000 },
        { label = "Regina",    name = "regina",    price = 36000 },
        { label = "Washington",name = "washington",price = 32000 },
        { label = "Tailgater", name = "tailgater", price = 38000 },
        { label = "Sentinel",  name = "sentinel",  price = 58000 },
        { label = "Oracle2",   name = "oracle2",   price = 55000 },
    },
    ["豪华轿车"] = {
        { label = "COG55",       name = "cog55",       price = 220000 },
        { label = "COG552",      name = "cog552",      price = 230000 },
        { label = "Cognoscenti", name = "cognoscenti", price = 220000 },
        { label = "Cognoscenti2",name = "cognoscenti2",price = 210000 },
        { label = "Superd",      name = "superd",      price = 250000 },
        { label = "Stretch",     name = "stretch",     price = 150000 },
        { label = "Dubsta",      name = "dubsta",      price = 180000 },
        { label = "Huntley",     name = "huntley",     price = 190000 },
    },
    
    ["运动型轿车"] = {
        { label = "Alpha",        name = "alpha",       price = 210000 },
        { label = "Banshee",      name = "banshee",     price = 250000 },
        { label = "Bestiagts",    name = "bestiagts",   price = 190000 },
        { label = "Buffalo",      name = "buffalo",     price = 220000 },
        { label = "Carbonizzare", name = "carbonizzare",price = 230000 },
        { label = "Comet2",       name = "comet2",      price = 260000 },
        { label = "Coquette",     name = "coquette",    price = 280000 },
        { label = "Elegy",        name = "elegy",       price = 300000 },
        { label = "Jester",       name = "jester",      price = 270000 },
        { label = "Massacro",     name = "massacro",    price = 250000 },
        { label = "Neo",          name = "neo",         price = 290000 },
        { label = "Neon",         name = "neon",        price = 300000 },
        { label = "Ninef",        name = "ninef",       price = 280000 },
        { label = "Paragon",      name = "paragon",     price = 280000 },
        { label = "Schafter4",    name = "schafter4",   price = 330000 },
        { label = "Schlagen",     name = "schlagen",    price = 240000 },
        { label = "Seven70",      name = "seven70",     price = 290000 },
        { label = "Specter",      name = "specter",     price = 280000 },
        { label = "Vectre",       name = "vectre",      price = 270000 },
        { label = "Growler",      name = "growler",     price = 290000 },
    },
    
    --[[ ["super"] = {
        { label = "Adder",        name = "adder",      price = 120000 },
        { label = "Banshee 900R", name = "banshee2",   price = 60000 },
        { label = "Bullet",       name = "bullet",     price = 95000 },
        { label = "Cyclone",      name = "cyclone",    price = 127000 },
        { label = "drafter",      name = "drafter",    price = 500000 },
        { label = "Entity XF",    name = "entityxf",   price = 60000 },
        { label = "FMJ",          name = "fmj",        price = 150000 },
        { label = "GPL",          name = "gp1",        price = 127000 },
        { label = "Italigtb",     name = "italigtb",   price = 200000 },
        { label = "jugular",      name = "jugular",    price = 500000 },
        { label = "LE7B",         name = "le7b",       price = 85000 },
        { label = "Nero",         name = "nero",       price = 220000 },
        { label = "Osiris",       name = "osiris",     price = 100000 },
        { label = "Penetrator",   name = "penetrator", price = 69999 },
        { label = "Pfister",      name = "pfister811", price = 130000 },
        { label = "Prototipo",    name = "prototipo",  price = 125000 },
        { label = "Reaper",       name = "reaper",     price = 167000 },
        { label = "SCL",          name = "sc1",        price = 100000 },
        { label = "Sheava",       name = "sheava",     price = 147000 },
        { label = "sultanrs",     name = "sultanrs",   price = 95000 },
        { label = "T20",          name = "t20",        price = 250000 },
        { label = "Tempesta",     name = "tempesta",   price = 127000 },
        { label = "Turismor",     name = "turismor",   price = 127000 },
        { label = "Tyrus",        name = "tyrus",      price = 135000 },
        { label = "Vagner",       name = "vagner",     price = 127000 },
        { label = "Visione",      name = "visione",    price = 130000 },
        { label = "Voltic",       name = "voltic",     price = 127000 },
        { label = "XA21",         name = "xa21",       price = 150000 },
        { label = "Zentorno",     name = "zentorno",   price = 325000 },
    }, ]]
    ["suvs"] = {
        { label = "Baller",      name = "baller",      price = 42000 },
        { label = "Granger",     name = "granger",     price = 65000 },
        { label = "Cavalcade2",  name = "cavalcade2",  price = 43000 },
        { label = "Patriot",     name = "patriot",     price = 55000 },
        { label = "Baller6",     name = "baller6",     price = 65000 },
        { label = "Rebla",       name = "rebla",       price = 60000 },
    }
    
    --[[ ["vans"] = {
        { label = "Bobcatxl", name = "bobcatxl", price = 50000 },
        { label = "Camper",   name = "camper",   price = 60000 },
        { label = "Journey",  name = "journey",  price = 80000 },
        { label = "Minivan",  name = "minivan",  price = 70000 },
        { label = "Minivan2", name = "minivan2", price = 50000 },
        { label = "Rumpo VN", name = "rumpo3",   price = 65000 },
        { label = "Speedo",   name = "speedo",   price = 100000 },
        { label = "Youga",    name = "Youga",    price = 24000 },
        { label = "Youga VN", name = "youga2",   price = 20000 },
    }, ]]
}
