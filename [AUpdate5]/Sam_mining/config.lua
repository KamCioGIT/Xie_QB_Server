Config = Config or {}

Config.UseBlips = true                                              -- True / false option for toggling farm blips
Config.Timeout = 20 * (60 * 1000)                                   -- 20 minutes

--Blips Config
MiningLocation = {
    targetZone = vector3(-600.57, 2092.49, 130.33),                 -- qb-target vector
    targetHeading = 273.47,                                         -- qb-target box zone
    coords = vector4(-600.57, 2092.49, 130.33, 339.52),             -- Move Location (Ped and blip)
    SetBlipSprite = 414,                                            -- Blip Icon (https://docs.fivem.net/docs/game-references/blips/)
    SetBlipDisplay = 6,                                             -- Blip Behavior (https://docs.fivem.net/natives/?_0x9029B2F3DA924928)
    SetBlipScale = 0.7,                                            -- Blip Size
    SetBlipColour = 3,                                             -- Blip Color
    BlipLabel = "~b~[1]矿井",                                       -- Blip Label
    minZ = 129.42,                                                  -- Max Z
    maxZ = 132.42,                                                  -- Max Z
}
MiningText = '对准我按下Alt+鼠标右键打开菜单'
MiningText2 = 'i键有挖矿教程'
WashLocation = {
    targetZone = vector3(77.17, 3150.86, 28.79),
    targetHeading = 80.46,
    coords = vector4(77.17, 3150.86, 28.79, 80.46),
    SetBlipSprite = 162,
    SetBlipDisplay = 6,
    SetBlipScale = 0.7,
    SetBlipColour = 3,
    BlipLabel = "~b~[2]洗矿点",
    minZ = 27,
    maxZ = 31,
}
WashTextPos = vector3(55.02, 3157.12, 25.82)--洗矿点帮助
WashText = '购买清洗剂后对准水面按下Alt+鼠标右键洗矿'
SmeltLocation = {
    coords = vector4(1087.95, -2004.24, 31.38, 56.22),
    SetBlipSprite = 162,
    SetBlipDisplay = 6,
    SetBlipScale = 0.85,
    SetBlipColour = 3,
    BlipLabel = "~b~[3]冶炼厂",
}
SellLocation = {
    targetZone = vector3(579.11, -2804.96, 5.06),
    targetHeading = 242.63,
    coords = vector4(579.11, -2804.96, 5.06, 242.63),
    SetBlipSprite = 431,
    SetBlipDisplay = 6,
    SetBlipScale = 0.85,
    SetBlipColour = 3,
    BlipLabel = "~b~[4]矿物卖家",
    minZ = 3,
    maxZ = 7,
}
--Job Config
MiningJob = {
    Miner = "s_m_m_ammucountry",                                   -- Ped model  https://wiki.rage.mp/index.php?title=Peds
    MinerHash = 0x0DE9A30A,                                         -- Hash numbers for ped model

    Washer = "s_m_m_ammucountry",
    WasherHash = 0x0DE9A30A,

    MiningTimer = 20 * 1000,                                        -- 20 second timer
    WashingTimer = 8 * 1000,                                       -- 10 second timer
    IronTimer = 20 * 1000,                                          -- 25 seconds
    CopperTimer = 25 * 1000,                                        -- 30 seconds
    GoldTimer = 30 * 1000,                                          -- 35 seconds

    PickAxePrice = 750,                                              -- PickAxe Price ($75)
    WashPanPrice = 500,                                               -- Washing Pan Price ($5)
    BetterWashPanPrice = 1500,

    StoneMin = 3,                                                   -- Min amount from mining
    StoneMax = 6,                                                   -- Max amount from mining
    
    -- Washing Min And Max
    IronFragMin = 3,
    IronFragMax = 6,
    GoldNugMin = 0,
    GoldNugMax = 0,
    CopperFragMin = 4,
    CopperFragMax = 7,

    -- Smelting Min and Max
    SmeltIronMin = 7,
    SmeltIronMax = 10,
    SmeltCopperMin = 4,
    SmeltCooperMax = 7,
    SmeltGoldMin = 7,
    SmeltGoldMax = 10,

    -- Bars Received
    IronBarsMin = 1,
    IronBarsMax = 2,
    CopperBarsMin = 1,
    CopperBarsMax = 2,
    GoldBarsMin = 1,
    GoldBarsMax = 2,
}

--[[ vector4(77.17, 3150.86, 29.79, 80.46) ]]
Config.MiningLocation = {
    [1] = {
        ["coords"] = vector3(-590.57, 2073.85, 131.3),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [2] = {
        ["coords"] = vector3(-591.0, 2063.64, 130.08),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [3] = {
        ["coords"] = vector3(-587.13, 2054.63, 130.33),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [4] = {
        ["coords"] = vector3(-587.07, 2043.96, 129.63),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [5] = {
        ["coords"] = vector3(-577.74, 2032.72, 128.58),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [6] = {
        ["coords"] = vector3(-573.13, 2023.77, 127.85),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [7] = {
        ["coords"] = vector3(-565.44, 2015.6, 127.49),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [8] = {
        ["coords"] = vector3(-554.67, 1999.82, 127.26),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [9] = {
        ["coords"] = vector3(-549.8, 1996.89, 127.06),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [10] = {
        ["coords"] = vector3(-544.97, 1988.73, 127.0),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [11] = {
        ["coords"] = vector3(-532.22, 1979.47, 126.99),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [12] = {
        ["coords"] = vector3(-517.84, 1980.41, 126.47),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [13] = {
        ["coords"] = vector3(-541.67, 1974.28, 126.98),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [14] = {
        ["coords"] = vector3(-542.82, 1961.31, 126.82),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
    [15] = {
        ["coords"] = vector3(-538.38, 1951.48, 126.19),
        ["isMined"] = false,
        ["isOccupied"] = false,
    },
}

Config.Sell = {
    ["mining_washedstone"] = {
        ["price"] = math.random(30, 60)                             -- Seller Price
    },
    ["mining_stone"] = {
        ["price"] = 1
    },
    ["mining_ironfragment"] = {
        ["price"] = math.random(170, 190)
    },
    ["mining_ironbar"] = {
        ["price"] = math.random(250, 280)
    },
    ["mining_goldnugget"] = {
        ["price"] = math.random(250, 260)
    },
    ["mining_goldbar"] = {
        ["price"] = math.random(320, 350)
    },
    ["mining_copperfragment"] = {
        ["price"] = math.random(150, 170)
    },
    ["mining_copperbar"] = {
        ["price"] = math.random(200, 230)
    },
}

--- Config Alerts
Config.Text = {
    ['itemamount'] = '您正在尝试处理无效的金额 再试一次!',
    
    ['MenuHeading'] = '矿工老大',
    ['MenuPickAxe'] = '买镐子',
    ['PickAxeText'] = '此商品用于挖矿 价格 $'..MiningJob.PickAxePrice,

    ["MenuTarget"] = '与矿工老板交谈',
    ["goback"] = '<- 返回!',

    ['WashHeading'] = '洗涤剂卖家',
    ['MenuWashPan'] = '购买洗涤剂',
    ['MenuBetterWashPan'] = '高级洗涤剂',
    ['BetterPanText'] = '使用后可加快洗石速度 价格 $' ..MiningJob.BetterWashPanPrice,
    ['PanText'] = '此商品用于洗石 价格 $' ..MiningJob.WashPanPrice,
    ['Menu_pTarget'] = '交谈',

    ['SmethHeading'] = '冶炼选项',
    ['Semlt_Iron'] = '熔炼铁碎片',
    ['smelt_IText'] = '将铁碎片熔炼成铁锭',
    ['Semlt_Copper'] = '熔炼铜碎片',
    ['smelt_CText'] = '将铜碎片熔炼成铜锭',
    ['Smelt_Gold'] = '熔炼金块',
    ['smelt_GText'] = '将金块熔炼成金条',

    ['Pickaxe_Bought'] = '你买了一把镐 $' ..MiningJob.PickAxePrice.. ' ... 祝你好运! 进洞去吧',
    ['Pickaxe_Check'] = '看起来你已经有了镐',
    ['MiningAlert'] = '我的眼睛刚看到闪亮的东西',
    ['StartMining'] = '[E] 开始挖矿',

    ['error_mining'] = '你没有镐开始采矿',
    ['Pan_Bought'] = '你买了一瓶洗涤剂 $' ..MiningJob.WashPanPrice..", 快去水里洗洗吧(对准水按Alt)",
    ['Pan_check'] = '你已经有一瓶洗涤剂',
    ['error_pan'] = '你需要买一瓶洗涤剂',

    ['Mining_ProgressBar'] = '矿石开采',

    ['Washing_Target'] = '洗涤矿石',

    ['error_minerstone'] = '你没有任何石头可以洗',
    ['error_washpan'] = '你需要一个洗涤剂来洗！',

    ['Washing_Rocks'] = '洗涤矿石',

    ['Smeth_Rocks'] = '冶炼矿石',
    
    ['smelt_iron'] = '熔炼铁碎片',
    ['smelt_copper'] = '熔炼铜碎片',
    ['smelt_gold'] = '熔炼金块',

    ['cancel'] = '你取消了操作',

    ['error_ironCheck'] = '你没有任何铁碎片可以熔炼',
    ['error_goldCheck'] = '你没有任何金块可以冶炼',
    ['error_copperCheck'] = '你没有任何铜碎片可以熔炼',

    ['ironSmelted'] = '你冶炼了 ',
    ['ironSmeltedMiddle'] = ' 铁碎片练成了 ',
    ['ironSmeltedEnd'] = ' 铁棒',

    ['CopperSmelted'] = '你冶炼了 ',
    ['CopperSmeltedMiddle'] = ' 铜碎片练成了 ',
    ['CopperSmeltedEnd'] = ' 铜条',

    ['GoldSmelted'] = '你冶炼了 ',
    ['GoldSmeltedMiddle'] = ' 金块练成了 ',
    ['GoldSmeltedEnd'] = ' 金条',

    ['error_alreadymined'] = '这个已经被开采了',

    ['Seller'] = '与买家交谈',
    ['successfully_sold'] = '买家已购买材料',

}

