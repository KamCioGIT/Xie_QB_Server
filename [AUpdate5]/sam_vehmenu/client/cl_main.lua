local enabled = false
local player = false
local veh = 0

damageLevel, currPlate, currName, currFuel, currEngineStatus = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if veh ~= 0 then
            if enabled then
                refreshUI()
            else
                Wait(100)
            end
        else
            Wait(250)
        end
    end
end)

if Config.OpenKeyMapping then
    RegisterKeyMapping(Config.OpenCommand, Config.OpenKeyMappingText, 'keyboard', Config.OpenKeyMappingKey)
end

if Config.Opencommand then
    RegisterCommand(Config.OpenCommand,function(source, args)
        if not enabled then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            if veh ~= 0 then
                EnableGUI(true)
            end
        end
    end)
end

Citizen.CreateThread(function()
    while true do
        player = PlayerPedId()
        veh = GetVehiclePedIsIn(player, false)
        if veh ~= 0 then
            if enabled then
                damageLevel = GetVehicleEngineHealth(veh)
                currPlate = GetVehicleNumberPlateText(veh)
                currName = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
                currFuel = GetVehicleFuelLevel(veh)
                currEngineStatus = GetIsVehicleEngineRunning(veh)
            end
        end
        Wait(1000)
    end
end)

function EnableGUI(enable)
    enabled = enable
    SetNuiFocus(enable, enable)
    SendNUIMessage({
        type = "enablecarmenu",
        enable = enable
    })
end

function checkSeat(player, veh, seatIndex)
    local ped = GetPedInVehicleSeat(veh, seatIndex);
    if ped == player then
        return seatIndex;
    elseif ped ~= 0 then
        return false;
    else
        return true;
    end
end

function refreshUI()
    local settings = {}
    if veh ~= 0 then
        settings.seat1 = checkSeat(player, veh, -1)
        settings.seat2 = checkSeat(player, veh,  0)
        settings.seat3 = checkSeat(player, veh,  1)
        settings.seat4 = checkSeat(player, veh,  2)
        settings.engineAccess = settings.seat1 == -1 and true or false
        if GetVehicleDoorAngleRatio(veh, 0) ~= 0 then settings.door0 = true end
        if GetVehicleDoorAngleRatio(veh, 1) ~= 0 then settings.door1 = true end
        if GetVehicleDoorAngleRatio(veh, 2) ~= 0 then settings.door2 = true end
        if GetVehicleDoorAngleRatio(veh, 3) ~= 0 then settings.door3 = true end
        if GetVehicleDoorAngleRatio(veh, 4) ~= 0 then settings.hood = true end
        if GetVehicleDoorAngleRatio(veh, 5) ~= 0 then settings.trunk = true end

        if not IsVehicleWindowIntact(veh, 0) then settings.windowr1 = true end
        if not IsVehicleWindowIntact(veh, 1) then settings.windowl1 = true end
        if not IsVehicleWindowIntact(veh, 2) then settings.windowr2 = true end
        if not IsVehicleWindowIntact(veh, 3) then settings.windowl2 = true end

    SendNUIMessage({ type = "refreshcarmenu", settings = settings })
    else SendNUIMessage({ type = "resetcarmenu" }) end
end

RegisterNUICallback('openDoor', function(data, cb)
    doorIndex = tonumber(data['doorIndex'])
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)

    if veh ~= 0 then
        local lockStatus = GetVehicleDoorLockStatus(veh)
        if lockStatus == 1 or lockStatus == 0 then
            if (GetVehicleDoorAngleRatio(veh, doorIndex) == 0) then
                SetVehicleDoorOpen(veh, doorIndex, false, false)
            else
                SetVehicleDoorShut(veh, doorIndex, false)
            end
        end
    end
    cb('ok')
end)

RegisterNUICallback('switchSeat', function(data, cb)
    seatIndex = tonumber(data['seatIndex'])
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)
    if veh ~= 0 then
        SetPedIntoVehicle(player, veh, seatIndex)
    end
    cb('ok')
end)

RegisterCommand('neon', function(src, args)
    local id = tonumber(args[1])
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)
    local neonStatus = false
    if IsVehicleNeonLightEnabled(veh) == false then neonStatus = true end

    if veh ~= 0 then
        local lockStatus = GetVehicleDoorLockStatus(veh)
        if lockStatus == 1 or lockStatus == 0 then
            if id ~= nil then
                if IsVehicleNeonLightEnabled(veh, id) == false then neonStatus = true end
                SetVehicleNeonLightEnabled(veh, id, neonStatus)
            else
                SetVehicleNeonLightEnabled(veh, 0, neonStatus)
                SetVehicleNeonLightEnabled(veh, 1, neonStatus)
                SetVehicleNeonLightEnabled(veh, 2, neonStatus)
                SetVehicleNeonLightEnabled(veh, 3, neonStatus)
            end
        end
    end
end)

RegisterCommand(Config.DoorCommand, function(src, args)
    local id = tonumber(args[1])
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)

    if veh ~= 0 then
        local lockStatus = GetVehicleDoorLockStatus(veh)
        if lockStatus == 1 or lockStatus == 0 then
            if (GetVehicleDoorAngleRatio(veh, id) == 0) then
                SetVehicleDoorOpen(veh, id, false, false)
            else
                SetVehicleDoorShut(veh, id, false)
            end
        end
    end
end)

RegisterCommand(Config.WindowCommand, function(src, args)
    local id = tonumber(args[1])
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)
    if veh ~= 0 then
        if not IsVehicleWindowIntact(veh, id) then
            RollUpWindow(veh, id)
            if not IsVehicleWindowIntact(veh, id) then
                RollDownWindow(veh, id)
            end
        else
            RollDownWindow(veh, id)
        end
    end
end)

RegisterNUICallback('togglewindow', function(data, cb)
    windowIndex = tonumber(data['windowIndex'])
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)
    if veh ~= 0 then
        if not IsVehicleWindowIntact(veh, windowIndex) then
            RollUpWindow(veh, windowIndex)
            if not IsVehicleWindowIntact(veh, windowIndex) then
                RollDownWindow(veh, windowIndex)
            end
        else
            RollDownWindow(veh, windowIndex)
        end
    end
    cb('ok')
end)

RegisterNUICallback('togglealldoor', function(data, cb)
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)
    if veh ~= 0 then
        if GetVehicleDoorAngleRatio(veh, 0) and GetVehicleDoorAngleRatio(veh, 1) and GetVehicleDoorAngleRatio(veh, 2) and GetVehicleDoorAngleRatio(veh, 3) == 0  then
            SetVehicleDoorOpen(veh, 0, false, false)
            SetVehicleDoorOpen(veh, 1, false, false)
            SetVehicleDoorOpen(veh, 2, false, false)
            SetVehicleDoorOpen(veh, 3, false, false)
            SetVehicleDoorOpen(veh, 4, false, false)
            SetVehicleDoorOpen(veh, 5, false, false)
            SetVehicleDoorOpen(veh, 6, false, false)
        else
            SetVehicleDoorShut(veh, 0, false, false)
            SetVehicleDoorShut(veh, 1, false, false)
            SetVehicleDoorShut(veh, 2, false, false)
            SetVehicleDoorShut(veh, 3, false, false)
            SetVehicleDoorShut(veh, 4, false, false)
            SetVehicleDoorShut(veh, 5, false, false)
            SetVehicleDoorShut(veh, 6, false, false)
        end
    end
    cb('ok')
end)

RegisterNUICallback('lockdoors', function(data, cb)
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)
    if veh ~= 0 then
        SetVehicleEngineOn(veh, not GetIsVehicleEngineRunning(veh), false, true)
    end
    cb('ok')
end)

RegisterNUICallback('convertroof', function(data, cb)
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)
    if veh ~= 0 then
        local roofState = GetConvertibleRoofState(veh)
        if roofState == 0 then
            LowerConvertibleRoof(veh)
        elseif roofState == 2 then
            RaiseConvertibleRoof(veh)
        end
    end
    cb('ok')
end)

RegisterNUICallback('neon', function(data, cb)
    player = PlayerPedId()
    veh = GetVehiclePedIsIn(player, false)
    local neonStatus = false
    if IsVehicleNeonLightEnabled(veh) == false then neonStatus = true end

    if veh ~= 0 then
        local lockStatus = GetVehicleDoorLockStatus(veh)
        if lockStatus == 1 or lockStatus == 0 then
            if id ~= nil then
                if IsVehicleNeonLightEnabled(veh, id) == false then neonStatus = true end
                SetVehicleNeonLightEnabled(veh, id, neonStatus)
            else
                SetVehicleNeonLightEnabled(veh, 0, neonStatus)
                SetVehicleNeonLightEnabled(veh, 1, neonStatus)
                SetVehicleNeonLightEnabled(veh, 2, neonStatus)
                SetVehicleNeonLightEnabled(veh, 3, neonStatus)
            end
        end
    end
    cb('ok')
end)

RegisterNUICallback('escape', function(data, cb) EnableGUI(false) cb('ok') end)