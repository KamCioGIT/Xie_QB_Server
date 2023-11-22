local currentCallsign = {}

function CheckVehicleList(curVeh)
  for _, v in pairs(Config.Vehicles) do
    if GetEntityModel(curVeh) == v then
      return true
    end
  end

  return false
end

RegisterCommand("nk", function()
  if Framework == "qb" then
    if QBCore.Functions.GetPlayerData().job.name ~= "police" then
      TriggerEvent("chatMessage", "", {255,255,255}, "^1[错误]^7 你不是警察.")
      return
    end
  elseif Framework == "esx" then
    if ESX.PlayerData.job.name ~= "police" then
      TriggerEvent("chatMessage", "", {255,255,255}, "^1[错误]^7 你不是警察.")
      return
    end
  elseif not Framework == "qb" or not Framework == "esx" then
    TriggerEvent("chatMessage", "", {255,255,255}, "^1[错误]^7 您必须使用QBCore或ESX来使用此命令.")
    return
  end

  local getCurrentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)

  if not DoesEntityExist(getCurrentVehicle) then
    TriggerEvent("chatMessage", "", {255,255,255}, "^1[错误]^7 您必须在车辆上使用此命令.")
    return
  end

  if not CheckVehicleList(getCurrentVehicle) then
    TriggerEvent("chatMessage", "", {255,255,255}, "^1[错误]^7 您必须在有呼号的车辆中使用此命令.")
    return
  end

  currentCallsign = {
    GetVehicleMod(getCurrentVehicle, 8),
    GetVehicleMod(getCurrentVehicle, 9),
    GetVehicleMod(getCurrentVehicle, 10)
  }

  SendNUIMessage({
    type = "openCallsignMenu",
    payload = {
      currentCallsign = currentCallsign,
      language = "en"
    }
  })
  SetNuiFocus(true, true)
end, false)

RegisterNUICallback("closeCallsignMenu", function(_, cb)
  local getCurrentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)

  SetVehicleModKit(getCurrentVehicle, 0)
  SetVehicleMod(getCurrentVehicle, 8, currentCallsign[1], false)
  SetVehicleMod(getCurrentVehicle, 9, currentCallsign[2], false)
  SetVehicleMod(getCurrentVehicle, 10, currentCallsign[3], false)

  SetNuiFocus(false, false)

  cb(0)
end)


RegisterNUICallback("setCallsign", function(payload, cb)
  local getCurrentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)

  SetVehicleModKit(getCurrentVehicle, 0)
  SetVehicleMod(getCurrentVehicle, payload.index, payload.number, false)

  cb(0)
end)

RegisterNUICallback("clearCallsigns", function(_, cb)
  local getCurrentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)

  SetVehicleModKit(getCurrentVehicle, 0)
  SetVehicleMod(getCurrentVehicle, 8, -1, false)
  SetVehicleMod(getCurrentVehicle, 9, -1, false)
  SetVehicleMod(getCurrentVehicle, 10, -1, false)

  cb(0)
end)

RegisterNUICallback("saveCallsignMenu", function(_, cb)
  SetNuiFocus(false, false)

  cb(0)
end)
