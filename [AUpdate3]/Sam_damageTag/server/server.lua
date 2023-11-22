local DamageBones = {}
local Players = {}

Citizen.CreateThread(function()
    while(onlinePlayers == {} or onlinePlayers == nil)do
        Citizen.Wait(0)
    end
    while true do
        for i, playerId in ipairs(onlinePlayers) do
            local alreadyInList = false
            for j, player in ipairs(Players) do
                if(player.id == playerId)then
                    alreadyInList = true 
                    break 
                end
            end
            if(not alreadyInList)then
                local playerPed = GetPlayerPed(playerId)
                table.insert(Players, {id = playerId, status = false, bones = {}, ped = playerPed, hits = 0})
            end
        end
        Citizen.Wait(100)
    end
end)


RegisterCommand('damage', function(source, args, rawCommand)
    local src = source
    if(#args > 0)then
        local result = {}
        for i, v in ipairs(Players) do
            if(v.id == tonumber(args[1]))then
                TriggerClientEvent('GC_DamageTags:ShowStats', src, v.bones)
            end
        end
    end
end, false)

RegisterNetEvent('GC_DamageTags:SaveDamage')
AddEventHandler('GC_DamageTags:SaveDamage', function(damagedBone)
    local src = source
    for i, player in ipairs(Players) do
        if(player.id == src)then
            Players[i].bones = damagedBone
            return
        end
    end
end)

RegisterNetEvent('GC_DamageTags:DeleteDamage')
AddEventHandler('GC_DamageTags:DeleteDamage', function()
    local src = source
    for i, v in ipairs(Players) do
        if(v.id == src)then
            Players[i].bones = {}
            Players[i].hits = 0
        end
    end
    TriggerClientEvent('GC_DamageTags:ReceivePlayers', -1, Players)
end)

RegisterNetEvent('GC_DamageTags:SaveHit')
AddEventHandler('GC_DamageTags:SaveHit', function()
    local src = source
    for i, v in ipairs(Players) do
        if(v.id == src)then
            Players[i].hits = Players[i].hits + 1
        end
    end
    TriggerClientEvent('GC_DamageTags:ReceivePlayers', -1, Players)
end)

RegisterNetEvent('hospital:server:SetLaststandStatus')
AddEventHandler('hospital:server:SetLaststandStatus', function(status)
    local src = source
    for i, v in ipairs(Players) do
        if(v.id == src)then
            Players[i].status = status
            if(status == false)then
                Players[i].bones = {}
                Players[i].hits = 0
                TriggerClientEvent('GC_DamageTags:DeletePlayerDamage', v.id)
            end
            return
        end
    end
    --table.insert(Players, {id = src, status = status})
    --TriggerClientEvent('GC_DamageTags:DeletePlayer', -1, src)
end)

Citizen.CreateThread(function()
    while true do
        TriggerClientEvent('GC_DamageTags:ReceivePlayers', -1, Players)
        if(not Config.QBCore)then
            for k, player in pairs(Players) do
                local ped = GetPlayerPed(player.id)
                if(GetEntityHealth(ped) <= 0)then
                    Players[k].status = true
                else
                    Players[k].status = false
                end
            end
        end
        Citizen.Wait(1000)
    end
end)