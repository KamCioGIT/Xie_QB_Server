CodeStudio = {}

CodeStudio.Wait_TIme = 2    --Blower Waiting Time in seconds

CodeStudio.Animations = {
    Enable = true,
    Tester_Prop = `prop_inhaler_01`,

    Share_Anim = 'package_dropoff',
    Share_Dict = 'mp_safehouselost@',

    Use_Anim = 'loop',
    Use_Dict = 'mp_player_inteat@pnq'
}

CodeStudio.DrunkLevel = {   
    [25] = 'green',     --Low Value [25 means upto 25 is low value of drunk]
    [70] = 'yellow',    --Mid Value
    [100] = 'red'       --High Value
}


CodeStudio.DrunkSettings = {
    Enable = false,             --Enble/Disable Drunk Value Deductions after certain time
    Reduce_Interval = 0.1,      --This will reduce alcholic level after certain minutes (In Minutes)
    Reduce_Level = 5            --Reduce Level
}


CodeStudio.DrunkEffect = false    --Enble/Disable Drunk Effect
CodeStudio.Effect_Interval = {
    --You can add more stages if you want
    [10] = {    --Drunk Level at which this Effect will occur
        Enable = true,                      --Enable/Disable Stage
        Animation = 'move_m@drunk@a'        --WalkStyle
    },
    [40] = {
        Enable = true,
        Animation = 'move_m@drunk@moderatedrunk'
    },
    [80] = {
        Enable = true,
        Animation = 'move_m@drunk@slightlydrunk'
    },
    [95] = {                     --Heavy Drunk Max Stage
        Enable = true,
        Animation = 'move_m@drunk@verydrunk'
    },
}


----Notifications Customization----

function Notify(msg)

    SetNotificationTextEntry('STRING') --- DELETE ME IF YOU ARE USING ANOTHER SYSTEM
    AddTextComponentString(msg)  --- DELETE ME IF YOU ARE USING ANOTHER SYSTEM
    DrawNotification(0,1)  --- DELETE ME IF YOU ARE USING ANOTHER SYSTEM
  
    --MORE EXAMPLES OF NOTIFICATIONS.
    --QBCore.Functions.Notify(msg, state)
    --exports['qb-core']:Notify(msg, "primary")
    --exports['mythic_notify']:DoHudText('inform', msg)
end


----Language Editor----

CodeStudio.Language = {
    wait_blow = '等待',
    blow_txt = '吹',
    tester_share = '将酒精测试器给附近的玩家',
    tester_smoke = '寻问最近的玩家吹气'
}