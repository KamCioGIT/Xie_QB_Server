RegisterNetEvent('Sam-parking:client:notify', function(text, type, time)
    if not time then time = 5000 end
    QBCore.Functions.Notify(text, type, time)
end)

function SetFuel(veh, fuel)
    exports['LegacyFuel']:SetFuel(veh, fuel)
end