local PlayerHealth = 0
local DamagedBones = {}
local PlayerBucket = {}
local alreadyDeleted = false
local QBCore = nil
--Main Thread


Citizen.CreateThread(function()
    if(Config.QBCore)then
        QBCore = exports['qb-core']:GetCoreObject()
        while(QBCore == nil)do Citizen.Wait(0) QBCore = exports['qb-core']:GetCoreObject() end
    end
    --Startup
    --Game Loop
    while true do
        for i, player in ipairs(PlayerBucket) do
            local pos = GetEntityCoords(PlayerPedId())
            if(player.ped)then
                if(player.status)then
                    local playerIdx = GetPlayerFromServerId(player.id)
                    local loc = GetEntityCoords(GetPlayerPed(playerIdx))
                    local dis = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, loc.x, loc.y, loc.z, false)
                    if(dis <= Config.ShowDistance and player.id ~= nil)then
                        Draw3DText(loc.x, loc.y, loc.z + -0.5, T('died', player.hits, player.id), 0.3, 0)
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('GC_DamageTags:ReceivePlayers', function(players)
    PlayerBucket = players
end)

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local health = GetEntityHealth(ped)
        
        if not playerHealth then
            playerHealth = health
        end
        
        --local armorDamaged = (playerArmor ~= armor and armor < (playerArmor - Config.ArmorDamage) and armor > 0) -- Players armor was damaged
        local healthDamaged = (playerHealth > health) -- Players health was damaged

        local damageDone = (playerHealth - health)

        if healthDamaged then
            TriggerServerEvent('GC_DamageTags:SaveHit')
            local hit, bone = GetPedLastDamageBone(ped)
            local bodypart = Config.Bones[bone]
            TriggerEvent('chat:addMessage', {
                color = { 255, 255, 255},
                multiline = true,
                args = {"~r~伤害系统: ", T('player_damage', bodypart, damageDone, health)}
              })

            local alreadyInList = false
            for i, v in ipairs(DamagedBones) do
                if v == bodypart then alreadyInList = true end
            end
            if(not alreadyInList)then
                table.insert(DamagedBones, bodypart)
                TriggerServerEvent('GC_DamageTags:SaveDamage', DamagedBones)
            end
        end
        if(health == GetPedMaxHealth(PlayerPedId()) and not alreadyDeleted and not Config.QBCore)then
            DamagedBones = {}
            alreadyDeleted = true
            TriggerServerEvent('GC_DamageTags:DeleteDamage')
        elseif(GetPedMaxHealth(PlayerPedId()) ~= health and alreadyDeleted and not Config.QBCore)then
            alreadyDeleted = false
        end

        playerHealth = health
        playerArmor = armor

        Wait(10)
    end
end)

RegisterNetEvent('GC_DamageTags:DeletePlayerDamage')
AddEventHandler('GC_DamageTags:DeletePlayerDamage', function()
    DamagedBones = {}
end)

RegisterNetEvent('GC_DamageTags:ShowStats')
AddEventHandler('GC_DamageTags:ShowStats', function(bones)
    if(#bones > 0)then
        for i, v in ipairs(bones) do
            TriggerEvent('chat:addMessage', {
                color = { 255, 255, 255},
                multiline = true,
                args = {"~r~Injuries: ", T('damage', v)}
            })
        end
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 255, 255},
            multiline = true,
            args = {"~g~Injuries: ", T('no_damage')}
        })
    end
end)