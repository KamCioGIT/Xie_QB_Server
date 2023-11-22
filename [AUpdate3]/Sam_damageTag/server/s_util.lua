onlinePlayers = {}
--Keep Track of online players
Citizen.CreateThread(function()
	Citizen.Wait(1000)
    TriggerClientEvent(Config.ScriptName..':triggerAuthID', -1)  -- -1 sendet das Event an alle Clients
end)

RegisterServerEvent(Config.ScriptName..':authID')
AddEventHandler(Config.ScriptName..':authID', function(serverId)
    if not table.contains(onlinePlayers, serverId) then  -- table.contains ist hier hypothetisch, du müsstest so eine Funktion selbst implementieren
        print('inserted ' .. serverId)
        table.insert(onlinePlayers, serverId)
    end
end)

RegisterServerEvent('playerConnecting')
AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    local src = source
    table.insert(onlinePlayers, src)
    print(playerName .. " Connecting " .. src)
end)

RegisterServerEvent('playerDropped')
AddEventHandler('playerDropped', function(reason)
    local source = source
    for i, playerID in ipairs(onlinePlayers) do
        if playerID == source then
            table.remove(onlinePlayers, i)
            break
        end
    end
end)

function table.contains(table, key)
	for k, v in pairs(table) do
		if(v == key)then
			return true
		end
	end
	return false
end