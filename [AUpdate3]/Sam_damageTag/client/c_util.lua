--Translate Text
function T(input, ...)
    local args = {...}
    if(#args>0)then
        return string.format(Config.Translation[Config.Locale][input], table.unpack(args))
    else
        return Config.Translation[Config.Locale][input]
    end
end

--Draws a 3D Text at a given location
function Draw3DText(x, y, z, text, size, font)
    local coords = vector3(x, y, z)

	local camCoords = GetGameplayCamCoords()
	local distance = #(coords - camCoords)

	local scale = ((size or 1) / distance) * 2
	local fov = (1 / GetGameplayCamFov()) * 100
	scale = scale * fov

	SetTextScale(0.0 * scale, 1.55 * scale)
	SetTextFont(font or 0)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)

	SetDrawOrigin(coords, 0)
	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.0, 0.0)
	ClearDrawOrigin()
end

--Auth with server
RegisterNetEvent(Config.ScriptName..':triggerAuthID')
AddEventHandler(Config.ScriptName..':triggerAuthID', function()
    TriggerServerEvent(Config.ScriptName..':authID', GetPlayerServerId(PlayerId()))
end)