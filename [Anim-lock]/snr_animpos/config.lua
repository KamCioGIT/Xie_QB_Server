Config = {}

--Set Command Name
Config.CommandName = "animpos"

--Set Max Distance
Config.MaxDistance = 2 --default 5
Config.MaxDistanceNotify = "距离限制已超过!"

Config.CancelDistance = 1.8 --default 1.8
Config.CancelMaxDistance = "你不能超过最大距离!"

--Set Notify lang.
Config.AlreadyPosing = "您已经在这样做了！"
Config.AlreadyFinishPosing = "您必须在做之前取消动作!"
Config.isnotanim = "您需要做动作才能使用它!"

--SYNC Optimization
Config.SyncOpt = 50 --default 50 (if you have a high number of players, it is recommended to increase the number. (estimated over 200 players))


function Notify(text)

    -- default
    BeginTextCommandThefeedPost('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandThefeedPostTicker(0,1)

    --  pNotify
    -- exports.pNotify:SendNotification({text = text})

    -- QBCORE
    -- local QBCore = exports['qb-core']:GetCoreObject()
    -- QBCore.Functions.Notify(text, "error")

    --ESX
    -- ESX = nil

    -- Citizen.CreateThread(function()
    --     while ESX == nil do
    --         TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    --         Citizen.Wait(30)
    --     end
    -- end)
    --ESX.ShowHelpNotification(text)
end


function isanimcheck() -- Please edit this function to cooperate with your animation script. 
    -- If you will leave it as is, players can edit their position not only while playing an animation

    -- If you are having issues with the function, please reach out on our Discord server for support by opening a ticket.

    return true -- COMMENT OR REMOVE THIS IF you are USING ONE OF THE CONFIGURATIONS below

    -- Example configurations - uncomment one of them if you have done everything correctly.

    -- return exports.rpemotes:IsPlayerInAnim() -- rpemotes (out of the box NEWEST VERSION)
    -- return exports['esx_animations']:isInAnim() -- esx_animations (read below)
    -- return exports.dpemotes:isInAnim() -- dpemotes (read below)

    -- IF YOU ARE USING dpemotes: Paste this code uncommented in client/Emote.lua

    -- exports('isInAnim', function()
    --     return IsInAnimation 
    -- end)

    -- IF YOU ARE USING esx_animations: Paste this code uncommented in client/main.lua

    -- exports('isInAnim', function()
    --     return inAnim 
    -- end)
end