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
        coords            = vector3(-235.41, 6216.53, 31.94),
        camCoords         = vector3(-38.0, -1059.0, -42.5),
        camRotation       = vector3(190.0, 180.0, 5.00),
        distance          = 2.0,
        carSpawnCoords    = vector4(-224.7, 6254.92, 31.45, 132.05),
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
            active = false,
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
        { label = "Dilettante", name = "dilettante", price = 21000 },
        { label = "Panto",      name = "panto",      price = 16000 },
        { label = "Prairie",    name = "prairie",    price = 21000 },
        { label = "Rhapsody",   name = "rhapsody",   price = 16000 },
        { label = "Asea",       name = "asea",       price = 20000 },
        { label = "Ingot",      name = "ingot",      price = 22000 },
        { label = "Asterope",   name = "asterope",   price = 25000 },
        { label = "Emperor",    name = "emperor",    price = 26000 },
        { label = "Fugitive",   name = "fugitive",   price = 26000 },
        { label = "Glendale",   name = "glendale",   price = 26000 },
        { label = "Intruder",   name = "intruder",   price = 26000 },
        { label = "Premier",    name = "premier",    price = 23000 },
        { label = "Primo",      name = "primo",      price = 25000 },
        { label = "Stanier",    name = "stanier",    price = 25000 },
        { label = "Surge",      name = "surge",      price = 25000 },
        { label = "Tailgater",  name = "tailgater",  price = 26000 },
        { label = "Washington", name = "washington", price = 27000 },
        { label = "Issi2",      name = "issi2",      price = 28000 },
        { label = "Sadler",     name = "sadler",     price = 33000 },
        { label = "Burrito3",   name = "burrito3",   price = 33000 },
        { label = "Rumpo",      name = "rumpo",      price = 32000 },
    },
    
    ["经典轿车"] = {
        { label = "Blade",     name = "blade",     price = 25000 },
        { label = "Buccaneer", name = "buccaneer", price = 25000 },
        { label = "Chino",     name = "chino",     price = 25000 },
        { label = "Clique",    name = "clique",    price = 25000 },
        { label = "Coquette3", name = "coquette3", price = 30000 },
        { label = "Dukes",     name = "dukes",     price = 25000 },
        { label = "Faction",   name = "faction",   price = 26000 },
        { label = "Ellie",     name = "ellie",     price = 28000 },
        { label = "Gauntlet",  name = "gauntlet",  price = 28000 },
        { label = "Hermes",    name = "hermes",    price = 32000 },
        { label = "Hotknife",  name = "hotknife",  price = 33000 },
        { label = "Hustler",   name = "hustler",   price = 31000 },
        { label = "Moonbeam",  name = "moonbeam",  price = 26000 },
        { label = "Nightshade", name = "nightshade", price = 29000 },
        { label = "Phoenix",   name = "phoenix",   price = 26000 },
        { label = "Ruiner",    name = "ruiner",    price = 31000 },
        { label = "Sabregt",   name = "sabregt",   price = 33000 },
        { label = "Sabregt2",  name = "sabregt2",  price = 28000 },
        { label = "Stalion",   name = "stalion",   price = 26000 },
        { label = "Tampa",     name = "tampa",     price = 27000 },
        { label = "Virgo",     name = "virgo",     price = 33000 },
        { label = "Btype",     name = "btype",     price = 28000 },
        { label = "Casco",     name = "casco",     price = 26000 },
        { label = "Tornado",   name = "tornado",   price = 28000 },
        { label = "Dominator", name = "dominator", price = 33000 },
        { label = "Gauntlet",  name = "gauntlet",  price = 32000 },
    },
    
    ["高级轿车"] = {
        { label = "Sentinel",     name = "sentinel",     price = 30000 },
        { label = "Zion",         name = "zion",         price = 32000 },
        { label = "Oracle2",      name = "oracle2",      price = 35000 },
        { label = "Felon",        name = "felon",        price = 36000 },
        { label = "Exemplar",     name = "exemplar",     price = 36000 },
        { label = "Jackal",       name = "jackal",       price = 35000 },
        { label = "CogCabrio",    name = "cogcabrio",    price = 36000 },
        { label = "F620",         name = "f620",         price = 40000 },
        { label = "Stretch",      name = "stretch",      price = 99999 },
        { label = "Superd",       name = "superd",       price = 110000 },
        { label = "Windsor2",     name = "windsor2",     price = 120000 },
        { label = "Cog55",        name = "cog55",        price = 130000 },
        { label = "Cognoscenti",  name = "cognoscenti",  price = 150000 },
        { label = "Voodoo",       name = "voodoo",       price = 88888 },
    },

    ["运动轿跑"] = {
        { label = "Alpha",        name = "alpha",        price = 172000 },
        { label = "Banshee",      name = "banshee",      price = 175000 },
        { label = "Bestia GTS",   name = "bestiagts",    price = 180000 },
        { label = "Buffalo",      name = "buffalo",      price = 171000 },
        { label = "Carbonizzare", name = "carbonizzare", price = 181000 },
        { label = "Comet2",       name = "comet2",       price = 179000 },
        { label = "Coquette",     name = "coquette",     price = 183000 },
        { label = "Drafter",      name = "drafter",      price = 175000 },
        { label = "Elegy",        name = "elegy",        price = 178000 },
        { label = "Furore GT",    name = "furoregt",     price = 179000 },
        { label = "Fusilade",     name = "fusilade",     price = 183000 },
        { label = "Jester",       name = "jester",       price = 185000 },
        { label = "Khamelion",    name = "khamelion",    price = 187000 },
        { label = "Kuruma",       name = "kuruma",       price = 173000 },
        { label = "Lynx",         name = "lynx",         price = 172000 },
        { label = "Massacro",     name = "massacro",     price = 186000 },
        { label = "Neo",          name = "neo",          price = 190000 },
        { label = "Neon",         name = "neon",         price = 198000 },
        { label = "Ninef",        name = "ninef",        price = 199000 },
        { label = "Paragon",      name = "paragon",      price = 199000 },
        { label = "Pariah",       name = "pariah",       price = 170000 },
        { label = "Revolter",     name = "revolter",     price = 173000 },
        { label = "Seven-70",     name = "seven70",      price = 180000 },
        { label = "Specter",      name = "specter",      price = 172000 },
        { label = "Surano",       name = "surano",       price = 175000 },
        { label = "Infernus2",    name = "infernus2",    price = 173000 },
        { label = "Stromberg",    name = "stromberg",    price = 176000 },
        { label = "Turismo2",     name = "turismo2",     price = 185000 },
    },
    
    ["城市越野"] = {
        { label = "Rancher XL",   name = "rancherxl",   price = 32000 },
        { label = "BJXL",         name = "bjxl",         price = 33000 },
        { label = "Cavalcade",    name = "cavalcade",    price = 33000 },
        { label = "Gresley",      name = "gresley",      price = 35000 },
        { label = "Landstalker",  name = "landstalker",  price = 34000 },
        { label = "Mesa",         name = "mesa",         price = 37000 },
        { label = "XLS",          name = "xls",          price = 33000 },
        { label = "Patriot",      name = "patriot",      price = 45000 },
        { label = "Baller",       name = "baller",       price = 48000 },
        { label = "Baller3",      name = "baller3",      price = 60000 },
        { label = "Baller4",      name = "baller4",      price = 70000 },
        { label = "Dubsta2",      name = "dubsta2",      price = 75000 },
        { label = "Granger",      name = "granger",      price = 85000 },
        { label = "Huntley",      name = "huntley",      price = 90000 },
    },
    
    
    ["摩托车"] = {
        { label = "Vader",      name = "vader",      price = 32000 },
        { label = "Wolfsbane",  name = "wolfsbane",  price = 35000 },
        { label = "Zombiea",    name = "zombiea",    price = 34000 },
        { label = "Thrust",     name = "thrust",     price = 35000 },
        { label = "Sanchez2",   name = "sanchez2",   price = 35000 },
        { label = "Sovereign",  name = "sovereign",  price = 36000 },
        { label = "Ruffian",    name = "ruffian",    price = 37000 },
        { label = "PCJ",        name = "pcj",        price = 35000 },
        { label = "Hakuchou",   name = "hakuchou",   price = 50000 },
        { label = "Diablous",   name = "diablous",   price = 52000 },
        { label = "Carbonrs",   name = "carbonrs",   price = 55000 },
        { label = "Bagger",     name = "bagger",     price = 42000 },
        { label = "Avarus",     name = "avarus",     price = 38000 },
        { label = "Bati",       name = "bati",       price = 51000 },
        { label = "Daemon",     name = "daemon",     price = 36000 },
        { label = "BF400",      name = "bf400",      price = 51000 },
        { label = "Hakuchou2",  name = "hakuchou2",  price = 55000 },
        { label = "Vindicator", name = "vindicator", price = 40000 },
        { label = "Blazer",     name = "blazer",     price = 32000 },
        { label = "Blazer2",    name = "blazer2",    price = 33000 },
        { label = "Blazer3",    name = "blazer3",    price = 34000 },
        { label = "Blazer4",    name = "blazer4",    price = 35000 },
    },

    ["1车"] = {
        { label = "Blazer4",    name = "06w906l2h2",    price = 35000 },
        { label = "Blazer4",    name = "7death",    price = 35000 },
        { label = "Blazer4",    name = "16challenger",    price = 35000 },
        { label = "Blazer4",    name = "17powerwagon",    price = 35000 },
        { label = "Blazer4",    name = "18performante",    price = 35000 },
        { label = "Blazer4",    name = "19ramoffroad",    price = 35000 },
        { label = "Blazer4",    name = "19raptor",    price = 35000 },
        { label = "Blazer4",    name = "19x5",    price = 35000 },
        { label = "Blazer4",    name = "66fastback",    price = 35000 },
        { label = "Blazer4",    name = "150raptor",    price = 35000 },
        { label = "Blazer4",    name = "350zrb",    price = 35000 },
        { label = "Blazer4",    name = "488lb",    price = 35000 },
        { label = "Blazer4",    name = "488sp2",    price = 35000 },

    },

}
