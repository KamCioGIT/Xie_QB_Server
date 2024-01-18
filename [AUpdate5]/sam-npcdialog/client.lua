local peds = {}
local extraLocations = {}

local intalk
local camera
local animLoadTime = 0
-----------------------------------------------------------------------------------------
-- EVENT'S --
-----------------------------------------------------------------------------------------

RegisterNetEvent('wais:pload:npctalk', function()
    CreateInterActivePeds()
end)

RegisterNetEvent('wais:talktonpc', function()
    local ped = PlayerPedId()   
    local pedCoords = GetEntityCoords(ped)
    
    for k, v in pairs(Config.Peds) do
        local distance = math.floor(#(pedCoords - vector3(v.coords.x, v.coords.y, v.coords.z)))
        if distance <= v.interactive.distance then
            openModal(k)
            return
        end
    end 

    for k, v in pairs(extraLocations) do
        local distance = math.floor(#(pedCoords - vector3(v.coords.x, v.coords.y, v.coords.z)))
        if distance <= v.interactive.distance then
            openModal(k)
        end
    end
end)

RegisterNetEvent('wais:add:dialog', addExtraDialog)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        CreateInterActivePeds()
    end
end)

-----------------------------------------------------------------------------------------
-- NUI CALLBACK'S --
-----------------------------------------------------------------------------------------

RegisterNUICallback('modalClose', function(data, cb)
    closeModal()
    cb('ok')
end)

RegisterNUICallback('modalCallback', function(data, cb)
    if Config.Peds[intalk] ~= nil then
        if Config.Peds[intalk]["options"][data.option]["funcion_name"] ~= nil then
            Config.Peds[intalk][Config.Peds[intalk]["options"][data.option]["funcion_name"]]()
        end
    else
        if extraLocations[intalk]["options"][data.option]["eventType"] == "client" then
            TriggerEvent(extraLocations[intalk]["options"][data.option]["trigger"], extraLocations[intalk]["options"][data.option]["trigger_data"])
        elseif extraLocations[intalk]["options"][data.option]["eventType"] == "server" then
            TriggerServerEvent(extraLocations[intalk]["options"][data.option]["trigger"], extraLocations[intalk]["options"][data.option]["trigger_data"])
        end
    end
    closeModal()
    cb('ok')
end)

-----------------------------------------------------------------------------------------
-- FUNCTION'S --
-----------------------------------------------------------------------------------------

function CreateInterActivePeds()
    if next(peds) ~= nil then
        for k, v in pairs(peds) do
            ox_target:removeModel(v)
            DeleteEntity(v)
        end
    end

    for k, v in pairs(Config.Peds) do
        local hash = joaat(v.model)

        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Wait(100)
        end

        ped = CreatePed(4, hash, v.coords.x, v.coords.y, v.coords.z, v.coords.w, false, true)
        PlaceObjectOnGroundProperly(ped)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityAsMissionEntity(ped, false, false)
        SetPedCanPlayAmbientAnims(ped, false) 
        setPedAnimation(ped, v.animName, v.animDict, true, k)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)

        peds[k] = ped

        if v.interactive.type == "target" then
            if GetResourceState('ox_target') == 'started' then
                exports.ox_target:addModel(hash, {
                    [1] = {
                        name = 'talknpc',
                        event = 'wais:talktonpc',
                        icon = v.interactive.icon,
                        label = v.interactive.text,
                    }
                })
            elseif GetResourceState('qb-target') == 'started' then
                exports['qb-target']:AddTargetModel(hash, {
                    options = {
                        {
                            type = "client",
                            event = "wais:talktonpc",
                            icon = v.interactive.icon,
                            label = v.interactive.text,
                        },
                    },
                    distance = v.interactive.distance
                })
            end
        end
    end
end

function setPedAnimation(ped, name, dic, loop, index)
    RequestAnimDict(dic)
    while not HasAnimDictLoaded(dic) do
        Wait(250)
        animLoadTime = animLoadTime + 250
        if animLoadTime >= 1000 then
            print(('Failed to load animation dictionary. Config Index:%s so skipped'):format(k))
            animLoadTime = 0
            return
        end
    end

    TaskPlayAnim(ped, dic, name, 8.0, 8.0, -1, 1, 0, false, false, false)
end

function openModal(index)
    intalk = index
    cameraAnimation(index)
    local ped = Config.Peds[index] ~= nil and Config.Peds[index] or extraLocations[index]
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "OPEN_MODAL",
        name = ped.name,
        job = ped.title,
        text = ped.question,
        buttons = ped.options,
        style = ped.modal_style
    })

end

function closeModal()
    closeText(intalk)
    closeMarker(intalk)
    SetNuiFocus(false, false)
    SendNUIMessage({type = "CLOSE_MODAL"})
    RenderScriptCams(false, false, 0, true, true)
    DestroyCam(camera, false)
    camera = nil
    intalk = nil
end

function cameraAnimation(index)
    local p = promise:new()
    local npcCoords = Config.Peds[index] ~= nil and Config.Peds[index].cam or extraLocations[index].coords
    local rotation = Config.Peds[index] ~= nil and Config.Peds[index].cam.w or extraLocations[index].coords.w
    local playerCoords = GetEntityCoords(PlayerPedId())
    SetTimecycleModifier("int_extlight_small_sets")

    camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", playerCoords, 0.0, 0.0, 0.0, 90.0, false, 2)
    SetCamActive(camera, true)
    RenderScriptCams(true, true, 550, true, true)
    SetCamUseShallowDofMode(camera, true)
    SetCamNearDof(camera, 0)
    SetCamFarDof(camera, 1.1)
    SetCamDofStrength(camera, 0.1)

    p:resolve(AnimateCameraToPosition(playerCoords, npcCoords, 250, rotation))
    return Citizen.Await(p)
end

function AnimateCameraToPosition(startcoords, targetCoords, duration, rotation)
    local startCoords = startcoords
    local startTime = GetGameTimer()
    local endTime = startTime + duration

    CreateThread(function()
        while GetGameTimer() < endTime do
            local progress = (GetGameTimer() - startTime) / duration
            local easingProgress = progress
            local x = Lerp(startCoords.x, targetCoords.x, easingProgress)
            local y = Lerp(startCoords.y, targetCoords.y, easingProgress)
            local z = Lerp(startCoords.z, targetCoords.z, easingProgress)
            SetCamCoord(camera, x, y, z)
            Wait(0)
        end
    end)

    SetCamRot(camera, 0.0, 0.0, rotation)
    return true
end

function Lerp(start, stop, amount)
    return start + (stop - start) * amount
end

function GetScreenPosition(entity, distance, coord)
    if not coord then
        local entityCoord = GetEntityCoords(entity)
        local min, max = GetModelDimensions(GetEntityModel(entity))
        local height = (max.y - min.y) / 2
        local onScreen, coordX, coordY = GetHudScreenPositionFromWorldPosition(entityCoord.x, entityCoord.y + height, entityCoord.z)
        return onScreen, coordX - 0.01, coordY -0.05, entity, distance
    else
        local onScreen, coordX, coordY = GetHudScreenPositionFromWorldPosition(coord.x, coord.y, coord.z)
        return onScreen, coordX - 0.01, coordY -0.05, entity, distance
    end
end

function uiMarker(x, y, i, distance, style)
    SendNUIMessage({
        type = "ADD_MARKER",
        position = {
            x = x, 
            y = y,
            d = distance
        },
        index = tostring(i),
        style = style
    })
end

function uiText(x, y, i, text, label, style)
    SendNUIMessage({
        type = "ADD_TEXT",
        content = {
            x = x, 
            y = y,
            t = text,
            l = label,
            style = style,
        },
    })
end

function closeMarker(i)
    local index
    if Config.Peds[i] ~= nil then
        Config.Peds[i].interactive.markerState = false
        index = peds[i]
    else
        extraLocations[i].markerState = false
        index = i
    end
    SendNUIMessage({
        type = "REMOVE_MARKER",
        index = tostring(index)
    })    
end

function closeText(i)
    local index
    if Config.Peds[i] ~= nil then
        Config.Peds[i].interactive.interactiveState = false
        index = peds[i]
    else
        extraLocations[i].interactiveState = false
        index = i
    end
    SendNUIMessage({
        type = "REMOVE_TEXT",
        index = tostring(index)
    })
end

function DrawText3D(x, y, z, text)
	SetTextScale(0.20, 0.20)
	SetTextFont(0)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	SetDrawOrigin(x,y,z, 0)
	DrawText(0.0, 0.0)
	local factor = (string.len(text)) / 370
    ClearDrawOrigin()
end

function moveForward(position)
    -- Extract the x, y, z, and w components from the position
    local x, y, z, w = position.x, position.y, position.z, position.w

    -- Convert w from degrees to radians for trigonometric calculations
    local wRadians = math.rad(w+90.0)

    -- Calculate the change in x and y using trigonometry
    local dx = math.cos(wRadians) * 0.8
    local dy = math.sin(wRadians) * 0.8

    -- Update the x and y coordinates
    local newX = x + dx
    local newY = y + dy

    return vector4(newX, newY, z+1.5, w-180.0)
end

function addExtraDialog(table)
    if type(table) ~= 'table' then return {added = false, message = 'Invalid table'} end
    if table.label == nil then return {added = false, message = 'Invalid label'} end

    if extraLocations[table.label] == nil then
        
        extraLocations[table.label] = {
            entity = table.entity,
            label = table.label,
            coords = moveForward(table.coords),
            distance = table.distance,
            marker_distance = table.markerdistance,
            modal_style = table.modal_style,
            interactive = {
                type = table.interactive.type,
                label = table.interactive.label,
                key_label = table.interactive.label,
                icon = table.interactive.icon,
            },
            name = table.name,
            title = table.title,
            question = table.question,
            options = table.options,
            interactiveState = false,
            markerState = false,
        }

        if table.interactive.type == "target" then
            if GetResourceState('ox_target') == 'started' then
                exports.ox_target:addEntity(table.entity, {
                    [1] = {
                        name = 'talknpc',
                        event = 'wais:talktonpc',
                        icon = table.interactive.icon,
                        label = table.interactive.label,
                    }
                })
            elseif GetResourceState('qb-target') == 'started' then
                exports['qb-target']:AddTargetEntity(table.entity, {
                    options = {
                        {
                            type = "client",
                            event = "wais:talktonpc",
                            icon = table.interactive.icon,
                            label = table.interactive.label,
                        },
                    },
                    distance = table.distance
                })
            end
        end

        return {added = true,message = 'Added new dialog'}
    end

    return {added = false, message = 'Dialog already exists. Please use a different label.'}
end

exports('addExtraDialog', addExtraDialog)

-----------------------------------------------------------------------------------------
-- COMMAND'S --
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- THREAD'S --
-----------------------------------------------------------------------------------------

CreateThread(function()
    while true do
        local sleep = 1000
        local ped = PlayerPedId()
        if intalk ~= nil then
            sleep = 7
            DisableAllControlActions()
            local coords = GetEntityCoords(ped)
            local distance = Config.Peds[intalk] ~= nil and math.floor(#(coords - vector3(Config.Peds[intalk].coords.x, Config.Peds[intalk].coords.y, Config.Peds[intalk].coords.z))) or math.floor(#(coords - vector3(extraLocations[intalk].coords.x, extraLocations[intalk].coords.y, extraLocations[intalk].coords.z)))
            if GetEntityHealth(ped) <= 0 or IsPedRagdoll(ped) then
                if (intalk) and distance > (Config.Peds[intalk] ~= nil and Config.Peds[intalk].interactive.distance or extraLocations[intalk].distance) then
                    closeModal()
                end
                closeModal()
            end
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    while true do
        local sleep = 550
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)

        if intalk == nil then
            for k, v in pairs(Config.Peds) do
                local distance = math.floor(#(pedCoords - vector3(v.coords.x, v.coords.y, v.coords.z)))
                if distance <= v.interactive.drawmarker_distance and not IsPauseMenuActive() then
                    sleep = 7
                    if v.interactive.uiMarker then
                        if not v.interactive.interactiveState then
                            local _, x, y, e, d = GetScreenPosition(peds[k], distance, false)
                            uiMarker(x, y, e, distance, v.modal_style)
                            v.interactive.markerState = true
                        else
                            closeMarker(k)
                        end
                    else
                        if not HasStreamedTextureDictLoaded("marker") then
                            RequestStreamedTextureDict("marker", true)
                            while not HasStreamedTextureDictLoaded("marker") do
                                Wait(1)
                            end
                            return
                        end

                        if not v.interactive.interactiveState then
                            local markerWidth = (distance / v.interactive.drawmarker_math) * 1.5
                            DrawMarker(9, v.markerCoord.x, v.markerCoord.y, v.markerCoord.z, 0.0, 0.0, 0.0, 90.0, 0.0, 0.0, markerWidth, markerWidth, markerWidth, 255, 255, 255, 255, false, true, 0, false, "marker", "interactive", false)
                        end
                    end

                    if v.interactive.type ~= "target" then
                        if distance <= v.interactive.distance then
                            if v.interactive.uiDrawText then
                                v.interactive.interactiveState = true
                                local _, x, y, e, d = GetScreenPosition(peds[k], distance, false)
                                uiText(x, y, k, v.interactive.text, v.interactive.key_label, v.modal_style)
                            else
                                DrawText3D(v.markerCoord.x, v.markerCoord.y, v.markerCoord.z, v.interactive.text)
                            end
                            if IsControlJustPressed(0, v.interactive.type) then
                                openModal(k)
                            end
                        elseif v.interactive.interactiveState then
                            closeText(k)
                        end
                    end
                elseif v.interactive.markerState then
                    closeMarker(k)
                elseif v.interactive.interactiveState then
                    closeText(k)
                end
            end

            for k, v in pairs(extraLocations) do
                local distance = math.floor(#(pedCoords - vector3(v.coords.x, v.coords.y, v.coords.z)))
                if distance <= v.marker_distance and not IsPauseMenuActive() then
                    sleep = 7
                    if not v.interactiveState then
                        local _, x, y, e, d = GetScreenPosition(nil, distance, v.coords)
                        uiMarker(x, y, k, distance, v.modal_style)
                        v.markerState = true
                    else
                        closeMarker(k)
                    end

                    if v.interactive.type ~= "target" then
                        if distance <= v.distance then
                            v.interactiveState = true
                            local _, x, y, e, d = GetScreenPosition(nil, distance, v.coords)
                            uiText(x, y, k, v.interactive.label, v.interactive.key_label, v.modal_style)
                            if IsControlJustPressed(0, v.interactive.type) then
                                openModal(k)
                            end
                        elseif v.interactiveState then
                            closeText(k)
                        end
                    end
                elseif v.markerState then
                    print(k, json.encode(v))
                    closeMarker(k)
                elseif v.interactiveState then
                    closeText(k)
                end
            end
        end

        Wait(sleep)
    end
end)