Config = {}

Config.Framework = 'qb'        -- 'esx' or 'qb'
Config.Target = 'qb-target'    -- 'qb-target', 'ox_target' or 'qtarget'

Config.ESXName = 'es_extended' -- custom ESX name
Config.QBName = "qb-core"      -- custom QB-Core name

Config.Debug = false           -- Set to true to enable debug mode

-- Tool Settings

-- (Remove Wheels)
Config.EnableImpactDriver = true -- enable/disable the impact_driver

-- (Remove Doors)
Config.EnableSaw = true -- enable/disable the buzz_saw

-- (Cut Brakes)
Config.EnablePliers = true -- enable/disable the pliers
Config.NoBrakesSpeed = 35  -- Speed at which the brakes will fail (MPH) - to allow reversing - 0 will disable reversing, anything under 35 may glitch reversing animation

-- (Sabotage Controls)
Config.EnableAdjSpanner = true -- enable/disable the adjustable_spanner

-- (Sabotage Gas Tank)
Config.EnableDrill = true -- enable/disable the drill
Config.LeakSpeed = 60     -- Speed at which the gas tank can start leaking (MPH)

-- (Loosen Wheel Nuts)
Config.EnableSpanner = true   -- enable/disable the spanner
Config.WheelFallOffSpeed = 15 -- Speed at which wheels can start falling off (MPH)



-- Car Bomb Settings
Config.EnableIgnitionBomb = true
Config.EnableRemoteBomb = true
Config.EnableImpactBomb = true

Config.IgnitionBombItem = 'ignition_bomb' -- Item to use for ignition bomb
Config.ImpactBombItem = 'impact_bomb'     -- Item to use for impact bomb
Config.RemoteBombItem = 'remote_bomb'     -- Item to use for remote bomb
Config.RemoteDetonatorItem = 'phone_bomb' -- Item to use for remote detonator

-- Arson Settings
Config.EnableFireLighter = true
Config.LightFireItem = 'firelighter' -- Item to use for lighting fires

-- Repair Settings
Config.RepairJob = 'mechanic' -- Job to use for repairs
Config.RepairTime = 10        -- Time in seconds to repair a vehicle

Config.RealisticRepair = true -- enable/disable realistic repairs for brakes, controls, gas tank etc.
-- if true you must be holding the right tool for some repairs (brakes = spanner, controls = adjustable spanner)
--(to enable this you must use vehicle lifts (such as in wasabi_mechanic) as it will require you to be underneath the vehicle for some repairs)




-- Sound Settings          -- You must have the sound files in your Interact-Sound folder for this to work!
Config.SawVolume = 0.8 -- [0.1 = 10% volume, 1.0 = 100% volume]
Config.ImpactDriverVolume = 0.5
Config.DrillVolume = 0.3

Config.MiniGame = false                                                 -- Set to true to enable the minigames

function skillCheckEasy()                                               -- change your minigame here
    return lib.skillCheck({ 'easy' }, { 'e' })                          --lib.skillCheck({'easy'}, {'w', 'a', 's', 'd'})
end

function skillCheckFast()                                               -- change your minigame here
    return lib.skillCheck({ areaSize = 100, speedMultiplier = 2 }, { 'e' }) --lib.skillCheck({'easy'}, {'w', 'a', 's', 'd'})
end

function skillCheckLong() -- change your minigame here
    return lib.skillCheck(
    { 'easy', 'easy', 'easy', 'easy', 'medium', 'medium', { areaSize = 100, speedMultiplier = 2 }, 'hard' },
        { 'w', 'a', 's', 'd' })
end

-- Language
Config.Lang = {
    -- Door Names
    ['driver_door'] = '驾驶员门',
    ['passenger_door'] = '乘客门',
    ['back_driver_door'] = '后排驾驶员门',
    ['back_passenger_door'] = '后排乘客门',
    ['hood'] = '引擎盖',
    ['trunk'] = '后备箱',

    -- Tire label
    ['remove_wheel'] = '拆除车轮',

    -- Target labels
    ['chop_target'] = '移除',
    ['saw_off'] = '锯断',
    ['saw_off_door'] = '锯断门',
    ['impact_driver'] = '冲击驱动器',
    ['buzz_saw'] = '圆锯',
    ['pickup_buzz_saw'] = '拆卸圆锯',
    ['loosen'] = '松开轮毂螺栓',
    ['sabotage_tank'] = '破坏燃油箱',
    ['fix_tank'] = '修复燃油箱',
    ['cut_brakes'] = '切断刹车线',
    ['fix_brakes'] = '修复刹车线',
    ['sabotage_controls'] = '破坏控制盒',
    ['fix_controls'] = '修复控制盒',
    ['rig_ignition'] = '设置点火装置爆炸装置',
    ['rig_remote'] = '设置远程爆炸装置',
    ['rig_impact'] = '设置冲击爆炸装置',
    ['disarm_bomb'] = '拆除爆炸装置',



}
