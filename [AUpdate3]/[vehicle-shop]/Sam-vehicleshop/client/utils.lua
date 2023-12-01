function closeHud()
    -- If you want to turn off hud in the gallery menu, you can use the hud-close export of the plugin you are using here
    TriggerEvent('Sam_keymenu:client:TriggerMenu',false)
    DisplayRadar(false)
end

function openHud()
    -- If you want to turn one hud in the gallery menu, you can use the hud-open export of the plugin you are using here
    TriggerEvent('Sam_keymenu:client:TriggerMenu',true)
    DisplayRadar(true)
end

function giveVehicleKey(plate)
    if Config.VehicleKeys.status then
        if Config.VehicleKeys.system == "qb" then
            TriggerEvent("vehiclekeys:client:SetOwner", string.upper(plate))
        else
            -- TriggerClientEvent("CustomVehicleKey", playerSource, plate)
        end
    end
end
