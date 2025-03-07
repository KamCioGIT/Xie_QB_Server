--[[
    Welcome to the qs-housing configuration!
    To start configuring your new asset, please read carefully
    each step in the documentation that we will attach at the end of this message.

    Each important part of the configuration will be highlighted with a box.
    like this one you are reading now, where I will explain step by step each
    configuration available within this file.

    This is not all, most of the settings, you are free to modify it
    as you wish and adapt it to your framework in the most comfortable way possible.
    The configurable files you will find all inside client/custom/*
    or inside server/custom/*.

    Direct link to the resource documentation, read it before you start:
    https://docs.quasar-store.com/information/welcome
]]

Config = Config or {}
Locales = Locales or {}

Keys = {
    ['ESC'] = 322,
    ['F1'] = 288,
    ['F2'] = 289,
    ['F3'] = 170,
    ['F5'] = 166,
    ['F6'] = 167,
    ['F7'] = 168,
    ['F8'] = 169,
    ['F9'] = 56,
    ['F10'] = 57,
    ['~'] = 243,
    ['1'] = 157,
    ['2'] = 158,
    ['3'] = 160,
    ['4'] = 164,
    ['5'] = 165,
    ['6'] = 159,
    ['7'] = 161,
    ['8'] = 162,
    ['9'] = 163,
    ['-'] = 84,
    ['='] = 83,
    ['BACKSPACE'] = 177,
    ['TAB'] = 37,
    ['Q'] = 44,
    ['W'] = 32,
    ['E'] = 38,
    ['R'] = 45,
    ['T'] = 245,
    ['Y'] = 246,
    ['U'] = 303,
    ['P'] = 199,
    ['['] = 39,
    [']'] = 40,
    ['ENTER'] = 18,
    ['CAPS'] = 137,
    ['A'] = 34,
    ['S'] = 8,
    ['D'] = 9,
    ['F'] = 23,
    ['G'] = 47,
    ['H'] = 74,
    ['K'] = 311,
    ['L'] = 182,
    ['LEFTSHIFT'] = 21,
    ['Z'] = 20,
    ['X'] = 73,
    ['C'] = 26,
    ['V'] = 0,
    ['B'] = 29,
    ['N'] = 249,
    ['M'] = 244,
    [','] = 82,
    ['.'] = 81,
    ['LEFTCTRL'] = 36,
    ['LEFTALT'] = 19,
    ['SPACE'] = 22,
    ['RIGHTCTRL'] = 70,
    ['HOME'] = 213,
    ['PAGEUP'] = 10,
    ['PAGEDOWN'] = 11,
    ['DELETE'] = 178,
    ['LEFT'] = 174,
    ['RIGHT'] = 175,
    ['TOP'] = 27,
    ['DOWN'] = 173,
    ['ENTER'] = 201,
    ['N4'] = 108,
    ['N5'] = 60,
    ['N6'] = 107,
    ['N+'] = 96,
    ['N-'] = 97,
    ['N7'] = 117,
    ['N8'] = 61,
    ['N9'] = 118
}

--[[
    The first thing will be to choose our main language, here you can choose
    between the default languages that you will find within locales/*,
    if yours is not there, feel free to create it!
]]

Config.Language = 'en'

--[[
    Framework configuration and scripts of your server!
    In the following configurations you will see the mandatory scripts that
    you should configure in your new housing system, as inventory for the
    stashes, clothing for your wardrobes, synchronization system of
    weather and climate, menu systems, and much more.

    Remember that most of these settings are freely modifiable.
    inside client/custom/* and server/custom/*, but I'll give you the options that
    you have by default:

    Framework:
        'esx'
        'qb'

    MenuType:
        'esx_menu_default'
        'nh-context'
        'ox_lib' -- NEED UNCOMMENT IN FXMANIFEST THE EXPORT
        'qb-menu'
        'esx_context'

    Inventory:
        'esx_inventory'
        'qs-inventory'
        'qb-inventory'
        'ox_inventory'
        'mf-inventory'
        'cheeza_inventory'
        'core_inventory'

    Wardrobe:
        'esx_skin',
        'qb-clothing'
        'raid_clothes'
        'rcore_clothes'
        'ak47_clothing'
        'illenium-appearance'
        'fivem-appearance'

    Garage:
        'qs-garages'
        'qs-advancedgarages'
        'cd_garage'
        'okokGarage'
        'jg-advancedgarages'
        'qb-garages'
        'rcore_garage'
        'zerio-garage'

    Logout:
        'qb-multicharacter'
        'esx_multicharacter'
        'drop'

    Weather:
        'cd_easytime'
        'vSync'
        'qb-weathersync'

    HelpNotification:
        'ShowHelpNotification'
        'DrawText3D'

    The qs-garages and qb-garages options are not editable, so they are selectable but not editable.
    Remember that you can modify them and even create more yourself.

    In case of using 'ox_lib', you must enable it in the first lines of fxmanifest.lua, it is marked there!
]]

local esxHas = GetResourceState('es_extended') == 'started'
local qbHas = GetResourceState('qb-core') == 'started'

Config.Framework = esxHas and 'esx' or qbHas and 'qb' or 'none' -- You can change to 'qb' or 'esx'


Config.MenuType = 'ox_lib'
Config.Inventory = 'qb_inventory'
Config.Wardrobe = 'qb-clothing'
Config.Garage = nil -- or some option above
Config.Logout = 'drop'
Config.Weather = 'vSync'
Config.HelpNotification = 'DrawText3D'

--[[
    Basic configuration of your new housing!
    Next you will see the basic configurations that will allow you
    control most of the basic functionalities of the resource.

    The configurables that do not have a comment, you can read the name of
    their title to see what they do, some are pretty obvious and not
    you need to give it a description.
]]

Config.Smartphone = false -- This enables dispatch email to real estate agents

Config.RemoveRain = false
Config.HideMapDecorateMode = true
Config.SetEntityVisible = true -- Be invisible inside decorate mode?
Config.DecorateDistance = 100  -- Distance you can fly decorating.
Config.VisitTime = 60000       -- In ms

Config.LimitOfKeys = 10        -- Limit of keys that can be owned by house.
Config.LimitOfHouses = 5       -- Limit of houses for each player.


--[[
    Blip System works in blocks, which means if you set ShowAllHouses to true the others will be ignored
    if you set ShowOnlyForJob to the houses available will only be displayed for the jobs set on Config.Realestatejob
]]

Config.BlipsOptions = {
    ShowAllHouses = true,       -- Shows all houses equally with owner and without owner alike
    ShowAvailableForJob = true, -- Shows houses available to sell only for Job -> Config.Realestatejob
    OwnedHouses = false,        -- Shows the houses that the player bought
    AvalibleHouses = false,     -- Shows the houses that are not bought
    BoughtHouses = false,       -- Shows houses bought by other players
}


Config.Blips = {
    ['SetBlipOwnedSprite'] = 40,
    ['SetBlipBoughtSprite'] = 40,
    ['SetBlipAvailableSprite'] = 374,
    ['SetBlipColourNotOwner'] = 55,
    ['SetBlipColourOwner'] = 3,
    ['SetBlipColourAvailable'] = 2,
    ['SetBlipDisplay'] = 4,
    ['SetBlipScale'] = 0.45,
    ['SetBlipAsShortRange'] = true,

}

--[[
    If you press this key along with the MoveToTop key, the object will move upwards.
    However, if you press it alone or with other movement keys, the object will
    move in its current direction without changing its vertical position.
]]

Config.FreeModeKeys = {
    ChangeKey = Keys['LEFTCTRL'],

    MoreSpeed = Keys['.'],
    LessSpeed = Keys[','],

    MoveToTop = Keys['TOP'],            -- Key to move the object upwards (Top Arrow)
    MoveToDown = Keys['DOWN'],          -- Key to move the object downwards (Down Arrow)

    MoveToForward = Keys['TOP'],        -- Key to move the object forward (Top Arrow)
    MoveToBack = Keys['DOWN'],          -- Key to move the object backward (Down Arrow)
    MoveToRight = Keys['RIGHT'],        -- Key to move the object to the right (Right Arrow)
    MoveToLeft = Keys['LEFT'],          -- Key to move the object to the left (Left Arrow)

    RotateToTop = Keys['6'],            -- Key to rotate the object to the top (Number 6)
    RotateToDown = Keys['7'],           -- Key to rotate the object downwards (Number 7)
    RotateToLeft = Keys['8'],           -- Key to rotate the object to the left (Number 8)
    RotateToRight = Keys['9'],          -- Key to rotate the object to the right (Number 9)

    TiltToTop = Keys['Z'],              -- Key to tilt the object to the top
    TiltToDown = Keys['X'],             -- Key to tilt the object downwards
    TiltToLeft = Keys['C'],             -- Key to tilt the object to the left
    TiltToRight = Keys['V'],            -- Key to tilt the object to the right

    StickToTheGround = Keys['LEFTALT'], -- Key to stick the object to the ground (Left Alt)
}

--[[
    Now let's set up our real estate job system!
    As you well know, qs-housing is a system of real estate agents that
    will create houses for sale within your server.
    Here you will have the complete working configuration, where you can
    configure whether to access the work menu, or even keys to open
    this menu, if you want to remove options from the menu or more.

    Please read each setting carefully.
]]

Config.RealEstateMenu = true -- Enable keybind of Config.KeyHouseMenuRealEstate, if need changes go to client/modules/commands.lua
Config.EnableBossMenu = false
Config.EnableDeleteHousesRealEstate = true
Config.KeyHouseMenuRealEstate = 'F6'
Config.HousingTypes = { mlo = true, shell = true, ipl = true }
Config.Realestatejob = {
    ['realestate'] = true,
    ['realestatejob'] = true,
}

--[[
    On the societies, you can choose between the following options or false:

    Society:
        'esx_society'
        'qb-management'
        'ap-government'
        'none' -- Don't give money to anyone
]]

Config.Society = 'none' -- or "Society" options.
Config.SocietyPorcentage = 50
Config.PercentageForSell = 50
Config.Taxes = { AgencyFee = 7, BankFee = 10, TaxesFee = 20 }


--[[
    Advanced configurations of your housing!
    You are doing very well, let's continue with the more advanced configuration
    that will allow you to control the most internal part of your housing.

    Here you will have the mortgage configuration, which has some
    points to clarify before continuing...
    First of all, you can't make it charge for long, just
    charging is allowed within the session, if you restart your server, this count
    of time will start from the beginning, make sure you don't use tenses
    long if you know you will restart your server frequently.

    The rest is about permits for players to sell their houses or
    about the menu inside the house.
]]

Config.Decimals = false
Config.EnableCredit = true    -- Enable or disable mortgages
Config.OnlyInGame = false     -- Counts the time the player is on the server = "true" always count time = "false"
Config.NumberOfPayments = 240 -- Percentage to pay
Config.CreditTime = 5         -- Time between payments, number of minutes, 24h exemple (60*24) Can't be Lower than 5 mins

Config.SellFurniture = 25     -- % This is the % to sell Furniture
Config.SellHouse = true       -- House sell option?
Config.PercentageSell = 50
Config.WordToSell = 'Sell'

Config.KeyHouseMenuMlo = 'F5' -- Key to open the housing menu in MLO
Config.MenuOptions = {        -- Options to menus/radial!
    camera = true,
    invite = true,
    givehousekey = true,
    removehousekey = true,
    toggledoorlock = true,
    decorate = true,
    setwardrobe = true,
    setstash = true,
    setcharger = false, -- only for Smartphone
    setlogout = true,
    sellhouse = true,
    changetype = true
}

--[[
    Configuration of robberies and police!
    This section will allow you to configure everything related
    robberies, raids, or even the police housing system.

    For these systems, we will need the scripts:
        'lockpick'
        'skillbar'

    And if you want to modify the dispatch, you can do it from client/custom/dispatch.lua!
]]

Config.PoliceRaidItemAllow = true       --Enable or disable the object for the police to raid.
Config.MinimumPoliceGrade = 0           -- Set the minimum grade of the police officer to be able to raid a house
Config.ItemRequired = 'police_stormram' --This is the item needed to initiate the raids.
Config.RamsNeeded = 1                   --This will be the number of times you must do the minigame before opening a door.
Config.TimeAutoCloseDoor = 5            -- In minutes

Config.HouseRobbery = true              --If you activate this, the players will be able to rob the houses.
Config.RequiredCops = 1                 --Minimum number of police officers available to initiate house robberies.
Config.RobberyItem = 'lockpick'         --This is the item needed to rob the houses.
Config.LockpickBrokenChance = 80        --You can modify the chance that the item will break, if you place 0, it will never break, if you place 100, it will always break.

Config.PoliceJob = {
    ['police'] = true,
    -- ['sheriff'] = true,
}

--[[
    Weed system, formerly known as qb-weed
    or qs-weed, now integrated into the housing system by default!
]]

--[[
    Plant seed items:

    weed_white-widow_seed
    weed_skunk_seed
    weed_purple-haze_seed
    weed_og-kush_seed
    weed_amnesia_seed
    weed_ak47_seed
]]

Config.Plants = true                           -- Enable weed plants?
Config.PlantsLimit = 5                         -- Limit plants
Config.HarvestTime = 5                         -- Setting it by hours (1 = 60 minutes)
Config.PoliceFirePlants = true                 -- Police can fire plants?
Config.HarvestItem = 'empty_weed_bag'          -- Require item for harvestItem
Config.HarvestAmountWeed = math.random(12, 16) -- Amount of weed that will give you
Config.HarversAmountSeeds = {                  -- Quantity of seeds that dates you depending on the gender
    male = math.random(1, 5),
    female = math.random(3, 8),
}

-- Additional items that you will get when collecting the plant
Config.AdditionalItemsChances = 20 -- Chances of getting an additional item, place 1-100 (for example 50 means 50%)
Config.AdditionalItems = {
    ['empty_weed_bag'] = math.random(1, 2),
    -- ['water_bottle'] = 5,
}

Config.PlantsList = {
    ['og-kush'] = {
        ['label'] = 'OG Kush',
        ['item'] = 'ogkush',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
    ['amnesia'] = {
        ['label'] = 'Amnesia',
        ['item'] = 'amnesia',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
    ['skunk'] = {
        ['label'] = 'Skunk',
        ['item'] = 'skunk',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
    ['ak47'] = {
        ['label'] = 'AK 47',
        ['item'] = 'ak47',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
    ['purple-haze'] = {
        ['label'] = 'Purple Haze',
        ['item'] = 'purplehaze',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
    ['white-widow'] = {
        ['label'] = 'White Widow',
        ['item'] = 'whitewidow',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
}

--[[
    Command configuration!
    This part is not needed anymore, you could ignore it if you want,
    but I will attach it here so you can know what are all the commands and their executable events :)
]]

Config.Commands = {
    ['createhouse'] = 'createhouse',       --Event: housing:client:createHouses
    ['addgarage'] = 'addgarage',           --Event: housing:client:addGarage
    ['setpolyzone'] = 'setpolyzone',       --Event: housing:client:setPolyZone
    ['givehousekey'] = 'givehousekey',     --Event: housing:client:giveHouseKey
    ['removehousekey'] = 'removehousekey', --Event: housing:client:removeHouseKey
    ['toggledoorlock'] = 'toggledoorlock', --Event: housing:client:toggleDoorlock
    ['decorate'] = 'decorate',             --Event: housing:client:decorate
    ['setwardrobe'] = 'setwardrobe',       --Event: housing:client:setLocation
    ['setstash'] = 'setstash',             --Event: housing:client:setLocation
    ['setchargespot'] = 'setchargespot',   --Event: housing:client:setLocation
    ['setlogout'] = 'setlogout',           --Event: housing:client:setLocation
    ['ring'] = 'ring',                     --Event: housing:client:requestRing
    ['deletehouse'] = 'deletehouse',       --Event: housing:client:deleteHouse
    ['changetype'] = 'changetype',         -- ChangeTypeMenu()
    ['checkhouse'] = 'checkhouse',         -- Server Callback housing:server:getCreditState
    ['housemenu'] = 'housemenu',           -- OpenHouseMenu()
    ['housingfix'] = 'housingfix',         -- Interan command
}

--[[
    Help notification system!
    Your new housing system has a series of notifications that will provide help during the
    creation of the house and during its decoration, to make all this more friendly, you will
    have multiple tips that you can configure.
]]

Config.HomeDecorationTips = {
    title = '一般装饰技巧.',
    content = {
        [1] = { text = '欢迎来到装饰模式！在这里，您可以购买并在您的房子里摆放家具！' },
        [2] = { text = '请记住，您的所有家具都将存放在箱子里。' },
        [3] = { text = '您可以从下方的房间形状图标中选择家具的类型。' },
        [4] = { text = '请记住，您可以在下方的箱子中存放、移除或出售您的家具。' },
        [5] = { text = '始终记得查看家具的价格；也许今天您买不起这样的奢侈品！' },
        [6] = { text = '如果您需要控制的指南，请打开右侧的信息菜单。' },
        [7] = { text = '现在，有了自由模式，一切都更快速。您可以迅速移动您房子里的任何家具。' },

    }
}

Config.SpawnObjectDecorationTips = {
    title = '家具放置提示',
    content = {
        [1] = { text = '要移动家具，请单击并拖动它到所需位置。' },
        [2] = { text = '选择带有红色轮廓的家具，然后通过点击并保持点击状态，可以在整个房子内移动它！' },
        [3] = { text = '点击家具并拖动它在整个房子内移动。您还可以使用键盘上的箭头键来控制高度。' },
        [4] = { text = '现在移动家具更容易了。只需点击并拖动家具，不要忘记使用键盘上的箭头键来控制高度！' },

    }
}


Config.StashObjectDecorationTips = {
    title = '家具提示.',
    content = {
        [1] = { text = '自由模式允许您快速而轻松地移动房子内的任何家具。点击家具并拖动它！' },
        [2] = { text = '这种模式使您能够迅速移动家具；只需按住家具并拖动它在整个房子内移动。' },
        [3] = { text = '请记住，要移动家具，只需点击并拖动。您还可以使用鼠标滚轮来围绕其轴旋转它。' },
        [4] = { text = '欢迎来到快速装饰模式，也称为自由模式。在这里，您可以轻松快速地自定义整个房子！' },

    }
}


Config.FreeModeDecorationTips = {
    title = 'General Tips for Free Decoration Mode.',
    content = {
        [1] = { text = '自由模式允许您快速而轻松地移动房子内的任何家具。点击家具并拖动它！' },
        [2] = { text = '这个模式使您能够快速移动家具；只需按住鼠标左键并拖动家具在整个房子中移动。' },
        [3] = { text = '请记住，要移动家具，只需点击并拖动。您还可以使用鼠标滚轮来围绕其轴旋转它。' },
        [4] = { text = '欢迎来到快速装饰模式，也称为自由模式。在这里，您可以轻松快速地自定义整个房子！' },

    }
}

Config.CreateHousePolyZone = {
    title = '创建户外区域。',
    content = '在这个部分，我们需要创建可装饰的户外区域，如果整个绿地都是房子的话。',
    error = '忘记添加一个访客区域，以便玩家在MLO情况下可以访问房子。'

}

Config.CreateHouseDoors = {
    title = '选择门。',
    content =
    '选择房子的主要门。如果有两扇门，您需要同时选择它们。一次只能创建一扇门；请使用您的工作区菜单来创建它们。'

}

Config.CreateHouseShell = {
    title = '内部选择。',
    content =
    '选择您想要的住宅地图和其高度。我们建议它始终位于地图下方，以获得更好的游戏体验。'

}

Config.CreateHouseIPL = {
    title = '内部选择。',
    content = '请记住，一些IPL允许您更改墙壁和地板的颜色，但并非所有IPL都可以。'

}


--[[
    Debug mode, you can see all kinds of prints/logs using debug,
    but it's only for development.
]]

Config.Debug = false
Config.ZoneDebug = false
Config.CreditDebugTime = 1000 -- This value needs to be bigger than 0 and in ms (ADVANCED USERS ONLY AND DO NOT USE THIS ON A LIVE SERVER)

Config.Houses = {}
Config.WeedArea = {}
