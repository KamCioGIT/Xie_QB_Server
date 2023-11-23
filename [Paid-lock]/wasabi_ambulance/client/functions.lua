-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end

CreateBlip = function(output, sprite, color, text, scale, flash, type, short)
	type = type or 'coords'
	local blip
	if type == 'coords' then
		local x, y, z = table.unpack(output)
		blip = AddBlipForCoord(x, y, z)
	elseif type == 'entity' then
		blip = AddBlipForEntity(output)
	end

    SetBlipSprite(blip, sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, scale)
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, short)
	SetBlipFlashes(blip, flash)

	local blipStr = ('hospital_%s'):format(tostring(blip))
	AddTextEntry(blipStr, text)
    BeginTextCommandSetBlipName(blipStr)
    EndTextCommandSetBlipName(blip)

    return blip
end

addCommas = function(n)
	return tostring(math.floor(n)):reverse():gsub("(%d%d%d)","%1,")
									:gsub(",(%-?)$","%1"):reverse()
end

secondsToClock = function(seconds)
	seconds = tonumber(seconds)
	if seconds <= 0 then
		return 0, 0
	else
		local hours = string.format('%02.f', math.floor(seconds / 3600))
		local mins = string.format('%02.f', math.floor(seconds / 60 - (hours * 60)))
		local secs = string.format('%02.f', math.floor(seconds - hours * 3600 - mins * 60))
		return mins, secs
	end
end

isPlayerDead = function(serverId)
	local playerDead
	if not serverId then
		playerDead = isDead or false
	else
		playerDead = lib.callback.await('wasabi_ambulance:isPlayerDead', 500, serverId)
	end
	return playerDead
end

exports('isPlayerDead', isPlayerDead)

DrawGenericTextThisFrame = function()
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)
end

RespawnPed = function(ped, coords, heading)
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false)
	SetPlayerInvincible(ped, false)
	ClearPedBloodDamage(ped)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	if wsb.framework == 'esx' then
		TriggerEvent('esx:onPlayerSpawn')
	else
		TriggerEvent('wasabi_bridge:onPlayerSpawn')
	end
	if wsb.framework == 'qb' and wsb.playerData.metadata.injail > 0 then
		TriggerEvent("prison:client:Enter", wsb.playerData.metadata.injail)
	end
end

getClosestHospital = function(coords)
	local closestHospital
	local done
	for k, v in pairs(Config.Locations) do
		if not closestHospital then
			closestHospital = v.RespawnPoint
		else
			local oldDist = #(vector3(coords.x, coords.y, coords.z) - vector3(closestHospital.coords.x, closestHospital.coords.y, closestHospital.coords.z))
			local newDist = #(vector3(coords.x, coords.y, coords.z) - vector3(v.RespawnPoint.coords.x, v.RespawnPoint.coords.y, v.RespawnPoint.coords.z))
			if newDist < oldDist then
				closestHospital = v.RespawnPoint
			end
		end
	end
	return closestHospital
end

StartRPDeath = function()
	TriggerServerEvent('wasabi_ambulance:setDeathStatus', false, true)
	DrugIntake = {}
	if wsb.framework == 'esx' then
		TriggerEvent('esx:onPlayerSpawn')
	else
		TriggerEvent('wasabi_bridge:onPlayerSpawn')
		TriggerServerEvent('wasabi_ambulance:resetThirstHunger')
	end
	CreateThread(function()
		DoScreenFadeOut(800)
		while not IsScreenFadedOut() do
			Wait(100)
		end
		if wsb.framework == 'esx' then ESX.SetPlayerData('loadout', {}) end
		if Config.removeItemsOnDeath then
			TriggerServerEvent('wasabi_ambulance:removeItemsOnDeath')
		end
		local spawnCoords = getClosestHospital(GetEntityCoords(cache.ped))
		RespawnPed(cache.ped, vector3(spawnCoords.coords.x, spawnCoords.coords.y, spawnCoords.coords.z), spawnCoords.heading)
		lib.requestAnimDict('missarmenian2', 3000)
		disableKeys = true
		TaskPlayAnim(cache.ped, 'missarmenian2', 'corpse_search_exit_ped', 8.0, 8.0, -1, 3, 0, false, false, false)
		AnimpostfxStop('DeathFailOut')
		DoScreenFadeIn(1500)
		while IsScreenFadedOut() do
			Wait(100)
		end
		TriggerEvent('wasabi_bridge:notify', Strings.alive_again, Strings.alive_again_desc, 'error', 'user-nurse')
		Wait(4000)
		DoScreenFadeOut(800)
		while not IsScreenFadedOut() do
			Wait(100)
		end
		ClearPedTasks(cache.ped)
		ClearPedBloodDamage(cache.ped)
		disableKeys = false
		DoScreenFadeIn(800)
		if Config?.wasabi_crutch?.crutchOnBleedout?.enabled then
			TriggerServerEvent('wasabi_crutch:giveCrutch', cache.serverId, Config.wasabi_crutch.crutchOnBleedout.duration)
		end
	end)
end

-- Last Stand
local isCrawling, crwl = false, 'onfront'

local function movePedHeading(p, a, t)
    local ts = math.abs(a)
    local te = a / ts
    local w = t / ts
    for _i = 1, ts do
        Wait(w)
        SetEntityHeading(p, GetEntityHeading(p) + te)
    end
end

local function playAnimOnce(ped, animDict, animName, blendInSpeed, blendOutSpeed, duration, startTime)
	lib.requestAnimDict(animDict, 3000)
    TaskPlayAnim(ped, animDict, animName, blendInSpeed or 2.0, blendOutSpeed or 2.0, duration or -1, 0, startTime or 0.0, false, false, false)
    RemoveAnimDict(animDict)
end

local function lastStandCrawl(ped, crawl, d)
	isCrawling = true
    TaskPlayAnim(ped, "move_crawl", crawl.."_"..d, 8.0, -8.0, -1, 2, 0.0, false, false, false)
    local timeout = {
        ["onfront"] = {
            ["fwd"] = 820,
            ["bwd"] = 990
        },
        ["onback"] = {
            ["fwd"] = 1200,
            ["bwd"] = 1200
        }
    }
	SetTimeout(timeout[crawl][d], function()
        isCrawling = false
    end)
end

local function playIdleCrawlAnim(ped, heading, blend)
    local playerCoords = GetEntityCoords(ped)
    TaskPlayAnimAdvanced(ped, "move_crawl", crwl.."_fwd", playerCoords.x, playerCoords.y, playerCoords.z, 0.0, 0.0, heading or GetEntityHeading(ped), blend or 2.0, 2.0, -1, 2, 1.0, false, false)
end

local function crawlFlip(ped)
    local heading = GetEntityHeading(ped)
    if crwl == "onfront" then
        crwl = "onback"
        playAnimOnce(ped, "get_up@directional_sweep@combat@pistol@front", "front_to_prone", 2.0)
        movePedHeading(ped, -18.0, 3600)
    else
        crwl = "onfront"

        playAnimOnce(ped, "move_crawlprone2crawlfront", "back", 2.0, nil, -1)
        movePedHeading(ped, 12.0, 1700)
    end

    playIdleCrawlAnim(ped, heading + 180.0)
    Wait(400)
end

local function startLastStandAnim()
	if wsb.framework == 'esx' then ESX.UI.Menu.CloseAll() end
	while IsPedRagdoll(cache.ped) or GetEntitySpeed(cache.ped) > 0.5 do Wait(5) end
	local coords = GetEntityCoords(cache.ped)
	local heading = GetEntityHeading(cache.ped)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z+0.45, heading, true, false)
	--if cache.vehicle and cache.seat then SetPedIntoVehicle(cache.ped, cache.vehicle, cache.seat) end
	TriggerEvent('wasabi_ambulance:resetStatus')
	lib.requestAnimDict('combat@damage@writhe', 3000)
	lib.requestAnimDict('move_crawl', 3000)
	lib.requestAnimDict('move_crawlprone2crawlfront', 3000)
	StartDeathTimer()
	StartDistressSignal()
	CreateThread(function()
		while true do
			Wait(500)
			::startover::
			if not DoesEntityExist(cache.ped) then goto startover end
			if isDead ~= 'laststand' then break end
			if not placedOnStretcher then
				local currentHealth = GetEntityHealth(cache.ped)
				local decreaseThreshold = math.random(8, 15)
				SetEntityHealth(cache.ped, currentHealth - decreaseThreshold)
			end
			Wait(Config.LastStandTickTime)
		end
	end)
	while true do
		if isDead ~= 'laststand' then crwl = 'onfront' break end
		if IsCheckedIn or placedOnStretcher then
			Wait(2000)
		else
			local forward, backwards = IsControlPressed(0, 32), IsControlPressed(0, 33)
			local left, right = IsControlPressed(0, 34), IsControlPressed(0, 35)
			if not isCrawling then
				if forward then 
					lastStandCrawl(cache.ped, crwl, "fwd")
				elseif backwards then
					lastStandCrawl(cache.ped, crwl, "bwd")
				end
			end
			if left then
				if isCrawling then
					local headingDiff = forward and 1.0 or -1.0
					SetEntityHeading(cache.ped, GetEntityHeading(cache.ped) + headingDiff)
				else
					if crwl == "onfront" then
						local playerCoords = GetEntityCoords(cache.ped)
						TaskPlayAnimAdvanced(cache.ped, "move_crawlprone2crawlfront", "left", playerCoords.x, playerCoords.y, playerCoords.z, 0.0, 0.0, GetEntityHeading(cache.ped), 2.0, 2.0, -1, 2, 0.1, false, false)
						movePedHeading(cache.ped, -10.0, 300)
						Wait(700)
					else
						playAnimOnce(cache.ped, "get_up@directional_sweep@combat@pistol@left", "left_to_prone")
						movePedHeading(cache.ped, 25.0, 400)
						playIdleCrawlAnim(cache.ped)
						Wait(600)
					end
				end
			elseif right then
				if isCrawling then
					local headingDiff = backwards and 1.0 or -1.0
					SetEntityHeading(cache.ped, GetEntityHeading(cache.ped) + headingDiff)
				else
					if crwl == "onfront" then
						local playerCoords = GetEntityCoords(cache.ped)
						TaskPlayAnimAdvanced(cache.ped, "move_crawlprone2crawlfront", "right", playerCoords.x, playerCoords.y, playerCoords.z, 0.0, 0.0, GetEntityHeading(cache.ped), 2.0, 2.0, -1, 2, 0.1, false, false)
						movePedHeading(cache.ped, 10.0, 300)
						Wait(700)
					else
						playAnimOnce(cache.ped, "get_up@directional_sweep@combat@pistol@right", "right_to_prone")
						movePedHeading(cache.ped, -25.0, 400)
						playIdleCrawlAnim(cache.ped)
						Wait(600)
					end
				end
			end
			if not isCrawling then
				if IsControlPressed(0, 22) then
					crawlFlip(cache.ped)
				end
				if crwl == 'onfront' and not IsEntityPlayingAnim(cache.ped, 'combat@damage@writhe', 'writhe_loop', 3) then
					local playerCoords = GetEntityCoords(cache.ped)
					TaskPlayAnimAdvanced(cache.ped, "combat@damage@writhe", "writhe_loop", playerCoords.x, playerCoords.y, playerCoords.z, 0.0, 0.0, GetEntityHeading(cache.ped)/2, 8.0, 8.0, -1, 3, 0, false, false)
				end
			end
			Wait(0)
		end
	end
end

function OnLastStand()
	if isDead then
		OnPlayerDeath(true)
		return
	end
	isDead = 'laststand'
	TriggerServerEvent('wasabi_ambulance:setDeathStatus', 'laststand', true)
	DrugIntake = {}
	ResetAnimation()
	startLastStandAnim()
end

function ResetAnimation()
	if not Config.EnableAnimReset then return end
    CreateThread(function()
        while isDead do
            Wait(30000)
            ClearPedTasks(cache.ped)
        end
    end)
end

startDeathAnimation = function(dead)
	if Config.DisableDeathAnimation then return end
	while IsPedRagdoll(cache.ped) or GetEntitySpeed(cache.ped) > 0.5 do Wait(5) end
    local coords = GetEntityCoords(cache.ped)
    local heading = GetEntityHeading(cache.ped)
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z+0.45, heading, true, false)
	while not DoesEntityExist(cache.ped) do Wait(500) end
	if cache.vehicle and cache.seat then SetPedIntoVehicle(cache.ped, cache.vehicle, cache.seat) end
    SetEntityInvincible(cache.ped, true)
	TriggerEvent('wasabi_ambulance:resetStatus')
    lib.requestAnimDict(Config.DeathAnimation.anim, 3000)
    lib.requestAnimDict('veh@bus@passenger@common@idle_duck', 3000)
	ClearPedTasks(cache.ped)
    TaskPlayAnim(cache.ped, Config.DeathAnimation.anim, Config.DeathAnimation.lib, 8.0, 8.0, -1, 3, 0, false, false, false)
	if not dead then
		CreateThread(function()
			while isDead do
				local sleep = 1500
				if IsPedInAnyVehicle(cache.ped, false) then
					if not IsEntityPlayingAnim(cache.ped, 'veh@bus@passenger@common@idle_duck', 'sit', 3) then
						sleep = 0
						ClearPedTasks(cache.ped)
						TaskPlayAnim(cache.ped, 'veh@bus@passenger@common@idle_duck', 'sit', 8.0, -8, -1, 2, 0, false, false, false)
					end
				else
					if not IsEntityPlayingAnim(cache.ped, Config.DeathAnimation.anim, Config.DeathAnimation.lib, 3) then
						if not IsEntityPlayingAnim(cache.ped, 'nm', 'firemans_carry', 33)
						and not IsEntityPlayingAnim(cache.ped, 'anim@gangops@morgue@table@', 'body_search', 33) -- If on the stretcher
						and not placedOnStretcher -- If on the stretcher
						and not IsEntityPlayingAnim(cache.ped, 'anim@arena@celeb@flat@paired@no_props@', 'piggyback_c_player_b', 33) -- If being /piggyback
						and not IsCheckedIn then -- If player is checked in to hospital
							sleep = 0
							ClearPedTasks(cache.ped)
							TaskPlayAnim(cache.ped, Config.DeathAnimation.anim, Config.DeathAnimation.lib, 8.0, 8.0, -1, 3, 0, false, false, false)
						end
					end
				end
				Wait(sleep)
			end
		end)
	end
    RemoveAnimDict(Config.DeathAnimation.anim)
    RemoveAnimDict('veh@bus@passenger@common@idle_duck')
end

setRoute = function(data)
	local coords = lib.callback.await('wasabi_ambulance:getDeathPos', 500, data.plyId)
	SetNewWaypoint(coords.x, coords.y)
	TriggerEvent('wasabi_bridge:notify', Strings.route_set_title, Strings.route_set_desc, 'success', 'location-dot')
end

function CapitalizeEachWord(str)
    return (str:gsub("(%l)(%w*)", function(firstLetter, restOfString)
        return firstLetter:upper() .. restOfString:lower()
    end))
end

function GetSeverityString(level)
	local levels = {
		[0] = Strings.none,
		[1] = Strings.mild,
		[2] = Strings.moderate,
		[3] = Strings.severe,
		[4] = Strings.deadly
	}
	if level > 4 then level = 4 end
	return levels[level]
end


local function formatInjuryReport(plyInjuries)
	if not next(plyInjuries) then
		return false
	end
	local blood = 0
	local options = {}
    for k, injury in pairs(plyInjuries) do
		local percent = (injury.data.level / 4) * 100
		options[#options+1] = {
			title = CapitalizeEachWord(injury.data.label),
			description = (Strings.injury_report_type):format(CapitalizeEachWord(Strings[injury.type])),
			progress = percent,
			icon = 'file-waveform',
			arrow = false,
		}
		if injury.data.bleed then blood = blood + injury.data.bleed end
	end
	if blood > 4 then blood = 4 end
	local bloodPercent = (blood / 4) * 100
	options[#options+1] = {
		title = Strings.injury_report_bleed,
		description = (Strings.injury_report_severity):format(GetSeverityString(blood)),
		progress = bloodPercent,
		icon = 'droplet',
		arrow = false,
	}
	return options
end

diagnosePatient = function()
	local coords = GetEntityCoords(cache.ped)
	local player = lib.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 4.0, false)
	if not player then
		TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
	else
		local targetPed = GetPlayerPed(player)
		local tCoords = GetEntityCoords(targetPed)
		TaskTurnPedToFaceCoord(cache.ped, tCoords.x, tCoords.y, tCoords.z, 3000)
		Wait(1000)
		local progressUI
		if Config.ProgressCircle then progressUI = 'progressCircle' else progressUI = 'progressBar' end
		if lib[progressUI]({
			duration = Config.DiagnoseTime,
			label = Strings.diagnosing_patient_progress,
			useWhileDead = false,
			canCancel = true,
			disable = {
				car = true,
				move = true
			},
			anim = {
				dict = 'random@train_tracks',
				clip = 'idle_e'
			},
		}) then
			local servId = GetPlayerServerId(player)
			local plyInjury = lib.callback.await('wasabi_ambulance:diagnosePatient', 1000, servId)
			if not plyInjury and Player(servId).state.dead then
				TriggerEvent('wasabi_bridge:notify', Strings.no_injury, Strings.no_injury_dead_desc, 'inform', 'stethoscope')
			elseif not plyInjury then
				TriggerEvent('wasabi_bridge:notify', Strings.no_injury, Strings.no_injury_desc, 'inform', 'stethoscope')
			elseif type(plyInjury) == 'string' then
				if Player(servId).state.dead ~= 'laststand' then
					TriggerEvent('wasabi_bridge:notify', Strings.player_injury, (Strings.player_injury_desc):format(Strings[plyInjury]), 'error', 'stethoscope')
				else
					TriggerEvent('wasabi_bridge:notify', Strings.player_injury, (Strings.player_injury_critical_desc):format(Strings[plyInjury]), 'error', 'stethoscope')
				end
			else
				local options = formatInjuryReport(plyInjury)
				if not options then
					TriggerEvent('wasabi_bridge:notify', Strings.no_injury, Strings.no_injury_desc, 'inform', 'stethoscope')
					return
				end
				lib.registerContext({
					id = 'ems_diagnose_menu',
					title = Strings.injury_report,
					options = options
				})
				lib.showContext('ems_diagnose_menu')
			end
		else
			TriggerEvent('wasabi_bridge:notify', Strings.action_cancelled, Strings.action_cancelled_desc, 'error')
		end
	end
end

exports('diagnosePatient', diagnosePatient)


reviveTarget = function()
	local authorized = false
	local jobCheck = wsb.playerData.job.name
    if Config?.policeCanTreat?.enabled then
		for i=1, #Config.policeCanTreat.jobs do
			if Config.policeCanTreat.jobs[i] == jobCheck then
				authorized = true
			end
		end
	end
    if authorized or jobCheck == Config.ambulanceJob then
		local coords = GetEntityCoords(cache.ped)
		local player = lib.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 3.0, false)
		if not player then
			TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
		elseif not isBusy then
			local quantity = lib.callback.await('wasabi_ambulance:itemCheck', 500, Config.EMSItems.revive.item)
			if quantity > 0 then
				local targetId = GetPlayerServerId(player)
				local isPlyDead = lib.callback.await('wasabi_ambulance:isPlayerDead', 500, targetId)
				if isPlyDead then
					isBusy = true
					local ped = cache.ped
					lib.requestAnimDict('mini@cpr@char_a@cpr_str', 3000)
					TriggerEvent('wasabi_bridge:notify', Strings.player_reviving, Strings.player_reviving_desc, 'success')
					local targetPed = GetPlayerPed(player)
					local tCoords = GetEntityCoords(targetPed)
					TaskTurnPedToFaceCoord(ped, tCoords.x, tCoords.y, tCoords.z, 3000)
					disableKeys = true
					Wait(3000)
					for i=1, 15 do
						Wait(900)
						TaskPlayAnim(ped, 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest', 8.0, -8.0, -1, 0, 0.0, false, false, false)
					end
					disableKeys = nil
					RemoveAnimDict('mini@cpr@char_a@cpr_str')
					isBusy = nil
					TriggerServerEvent('wasabi_ambulance:revivePlayer', targetId)
				else
					TriggerEvent('wasabi_bridge:notify', Strings.player_not_unconcious, Strings.player_not_unconcious_desc, 'error')
				end
			else
				TriggerEvent('wasabi_bridge:notify', Strings.player_noitem, Strings.player_noitem_desc, 'error')
			end
		else
			TriggerEvent('wasabi_bridge:notify', Strings.player_busy, Strings.player_busy_desc, 'error')
		end
	end
end

exports('reviveTarget', reviveTarget)

healTarget = function()
	local progressUI
	if Config.ProgressCircle then progressUI = 'progressCircle' else progressUI = 'progressBar' end
	local coords = GetEntityCoords(cache.ped)
	local player = lib.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
	if not player then
		local quantity = lib.callback.await('wasabi_ambulance:itemCheck', 500, Config.EMSItems.heal.item)
		if quantity > 0 then
			local isPlyDead = isDead
			if not isPlyDead then
				if lib[progressUI]({
					duration = Config.EMSItems.heal.duration,
					label = Strings.healing_self_prog,
					useWhileDead = false,
					canCancel = true,
					disable = {
						car = true,
					},
					anim = {
						dict = 'missheistdockssetup1clipboard@idle_a',
						clip = 'idle_a'
					},
				}) then
					TriggerServerEvent('wasabi_ambulance:healPlayer', cache.serverId)
				else
					TriggerEvent('wasabi_bridge:notify', Strings.action_cancelled, Strings.action_cancelled_desc, 'error')
				end
			else
				TriggerEvent('wasabi_bridge:notify', Strings.player_unconcious, Strings.player_unconcious_desc, 'error')
			end
		else
			TriggerEvent('wasabi_bridge:notify', Strings.player_noitem, Strings.player_noitem_desc, 'error')
		end
	else
		local quantity = lib.callback.await('wasabi_ambulance:itemCheck', 500, Config.EMSItems.heal.item)
		if quantity > 0 then
			local targetId = GetPlayerServerId(player)
			local isPlyDead = lib.callback.await('wasabi_ambulance:isPlayerDead', 500, targetId)
			if not isPlyDead then
				local ped = cache.ped
				TriggerEvent('wasabi_bridge:notify', Strings.player_healing, Strings.player_healing_desc, 'success')
				lib.requestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 3000)
				local targetPed = GetPlayerPed(player)
				local tCoords = GetEntityCoords(targetPed)
				TaskTurnPedToFaceCoord(ped, tCoords.x, tCoords.y, tCoords.z, 3000)
				Wait(1000)
				if lib[progressUI]({
					duration = Config.EMSItems.heal.duration,
					label = Strings.healing_self_prog,
					useWhileDead = false,
					canCancel = true,
					disable = {
						car = true,
						move = true
					},
					anim = {
						dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
						clip = 'machinic_loop_mechandplayer'
					},
				}) then
					TriggerServerEvent('wasabi_ambulance:healPlayer', targetId)
				else
					TriggerEvent('wasabi_bridge:notify', Strings.action_cancelled, Strings.action_cancelled_desc, 'error')
				end
			else
				TriggerEvent('wasabi_bridge:notify', Strings.player_unconcious, Strings.player_unconcious_desc, 'error')
			end
		else
			TriggerEvent('wasabi_bridge:notify', Strings.player_noitem, Strings.player_noitem_desc, 'error')
		end
	end
end

exports('healTarget', healTarget)

useSedative = function()
	local coords = GetEntityCoords(cache.ped)
	local player = lib.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
	if not player then
		TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
	else
		local quantity = lib.callback.await('wasabi_ambulance:itemCheck', 500, Config.EMSItems.sedate.item)
		if quantity > 0 then
			TriggerServerEvent('wasabi_ambulance:sedatePlayer', GetPlayerServerId(player))
		else
			TriggerEvent('wasabi_bridge:notify', Strings.player_noitem, Strings.player_noitem_desc, 'error')
		end
	end
end

exports('useSedative', useSedative)

placeInVehicle = function()
	local coords = GetEntityCoords(cache.ped)
	local player = lib.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 7.5, false)
	
	if not player then
		TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
		return
	end
	if stretcherMoving then stretcherMoving = false end

	if Player(GetPlayerServerId(player)).state.onStretcher then
		ToggleStretcher()
		return
	end
	TriggerServerEvent('wasabi_ambulance:putInVehicle', GetPlayerServerId(player))
end

exports('placeInVehicle', placeInVehicle)


NearestVehicle = function()
    local dist = 50.0
    local pedCoords = GetEntityCoords(cache.ped)
    local vehicle = 0
    for k, data in pairs(GetGamePool('CVehicle')) do
        local vehCoords = GetEntityCoords(data)
        local temp = #(vector3(vehCoords.x, vehCoords.y, vehCoords.z) - vector3(pedCoords.x ,pedCoords.y, pedCoords.z))

        if temp < dist then
            dist = temp
            vehicle = data
        end
    end

    return vehicle
end
exports('NearestVehicle', NearestVehicle)

useStretcher = function(vehicle)
	if not DoesEntityExist(vehicle) then return end
	if isPlayerDead() then return end
	local ped = cache.ped
	local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(ped,0.0,2.0,0.5))
	local textUI = false
	stretcherMoving = true
	lib.requestModel(Config.StretcherProp, 3000)
	lib.requestAnimDict('anim@heists@box_carry@', 3000)
	TaskPlayAnim(ped, 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)
	stretcher = CreateObjectNoOffset(Config.StretcherProp, x, y, z, true, false, false)
	SetModelAsNoLongerNeeded(Config.StretcherProp)
	NetworkRequestControlOfEntity(stretcher)
	AttachEntityToEntity(stretcher, ped, GetPedBoneIndex(ped,  28422), 0.0, -0.9, -0.56, 195.0, 180.0, 180.0, false, false, false, true, 1, true)
	TriggerServerEvent('wasabi_ambulance:setEntityState', ObjToNet(stretcher), 'ambulance', VehToNet(vehicle))
	Entity(stretcher).state.ambulance = VehToNet(vehicle)
	while true do
		Wait(0)
		if not stretcherMoving or not IsEntityAttachedToEntity(ped, stretcher) or IsPedDeadOrDying(ped, false) then
			RemoveAnimDict('anim@heists@box_carry@')
			ClearPedTasks(ped)
			DetachEntity(stretcher, false, true)
			stretcherMoving = false
			wsb.hideTextUI()
			textUI = false
			break
		end
		if not textUI then
			wsb.showTextUI(Strings.drop_stretch_ui)
			textUI = true
		end
		if IsControlJustPressed(0, 38) or IsDisabledControlJustPressed(0, 305) or IsDisabledControlPressed(0, 120) then
			if IsDisabledControlJustPressed(0, 305) or IsDisabledControlPressed(0, 120) then
				ClearPedTasks(ped)
				TaskPlayAnim(ped, 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)
				Wait(500)
			end
            DetachEntity(stretcher, false, true)
            ClearPedTasks(ped)
			RemoveAnimDict('anim@heists@box_carry@')
			wsb.hideTextUI()
			textUI = false
            stretcherPlaced(stretcher)
			break
        end
	end
end

ToggleStretcher = function()
	local coords = GetEntityCoords(cache.ped)
	local vehicle = lib.getClosestVehicle(vector3(coords.x, coords.y, coords.z), 10.0, false)
	if not vehicle or not DoesEntityExist(vehicle) then
		TriggerEvent('wasabi_bridge:notify', Strings.no_vehicle_nearby, Strings.no_vehicle_nearby_desc, 'error')
		return
	end
	local found
	local vehData
	for k,v in pairs(Config.AmbulanceOffsets) do
		if GetEntityModel(vehicle) == GetHashKey(k) then found = true vehData = v break end
	end
	if not found then
		TriggerEvent('wasabi_bridge:notify', Strings.no_vehicle_nearby, Strings.no_vehicle_nearby_desc, 'error')
		return
	end
	local vehCoords = GetEntityCoords(vehicle)
	if stretcher and DoesEntityExist(stretcher) then
		if #(vec3(vehCoords.x, vehCoords.y, vehCoords.z) - GetEntityCoords(stretcher)) > 7.0 then
			TriggerEvent('wasabi_bridge:notify', Strings.no_stretcher_detected, Strings.no_stretcher_detected_desc, 'error')
			return
		elseif IsEntityAttachedToAnyVehicle(stretcher) or IsEntityAttachedToEntity(stretcher, vehicle) then
			StretcherOutCar()
			return
		else
			StretcherInCar()
		end
	elseif Entity(vehicle).state.stretcher then
		TriggerEvent('wasabi_bridge:notify', Strings.stretcher_already_deployed, Strings.stretcher_already_deployed_desc, 'error')
	else
		TaskTurnPedToFaceCoord(cache.ped, vehCoords.x, vehCoords.y, vehCoords.z, 2000)
		CreateThread(function()
			if vehData.trunkAsBackDoor then
				SetVehicleDoorOpen(vehicle, 5, false, false)
				Wait(1000)
				SetVehicleDoorShut(vehicle, 5, false)
			else
				SetVehicleDoorOpen(vehicle, 2, false, false)
				SetVehicleDoorOpen(vehicle, 3, false, false)
				Wait(1000)
				SetVehicleDoorShut(vehicle, 2, false)
				SetVehicleDoorShut(vehicle, 3, false)
			end
		end)
		useStretcher(vehicle)
		TriggerServerEvent('wasabi_ambulance:setEntityState', VehToNet(vehicle), 'stretcher', true)
	end
end

exports('ToggleStretcher', ToggleStretcher)

StretcherInCar = function()
    local veh = NearestVehicle()
	local vehData

	for model, data in pairs(Config.AmbulanceOffsets) do
		if IsVehicleModel(veh, GetHashKey(model)) then
			vehData = data
			break
		end
	end

	if not vehData then
		TriggerEvent('wasabi_bridge:notify', Strings.no_vehicle_nearby, Strings.no_ambulance_nearby_desc, 'error')
		return
	end

	if stretcher and DoesEntityExist(stretcher) then
        if GetVehiclePedIsIn(cache.ped, false) == 0 and DoesEntityExist(veh) and IsEntityAVehicle(veh) then
			wsb.target.removeZone('stretcherzone')
			if stretcherMoving then
				stretcherMoving = false
				textUI = false
				wsb.hideTextUI()
				DetachEntity(stretcher, false, true)
				Wait(100)
				ClearPedTasksImmediately(cache.ped)
			end
			CreateThread(function()
				if vehData.trunkAsBackDoor then
					SetVehicleDoorOpen(veh, 5, false, false)
					Wait(1000)
					SetVehicleDoorShut(veh, 5, false)
				else
					SetVehicleDoorOpen(veh, 2, false, false)
					SetVehicleDoorOpen(veh, 3, false, false)
					Wait(1000)
					SetVehicleDoorShut(veh, 2, false)
					SetVehicleDoorShut(veh, 3, false)
				end
			end)
			NetworkRequestControlOfEntity(stretcher)
			NetworkRequestControlOfEntity(veh)
			SetEntityAsMissionEntity(veh, true, true)
			Wait(100)
            AttachEntityToEntity(stretcher, veh, 0, vehData.pos.x, vehData.pos.y, vehData.pos.z, vehData.rot.x, vehData.rot.y, vehData.rot.z, false, false, true, false, 2, true)
        --    FreezeEntityPosition(stretcher, true)
        end
    end
end
exports('StretcherInCar', StretcherInCar)

StretcherOutCar = function()
    local veh = NearestVehicle()
	local vehData

	for model, data in pairs(Config.AmbulanceOffsets) do
		if IsVehicleModel(veh, GetHashKey(model)) then
			vehData = data
			break
		end
	end

	if not vehData then
		TriggerEvent('wasabi_bridge:notify', Strings.no_vehicle_nearby, Strings.no_ambulance_nearby_desc, 'error')
		return
	end

	if stretcher and DoesEntityExist(stretcher) then
        if GetVehiclePedIsIn(cache.ped, false) == 0 and DoesEntityExist(veh) and IsEntityAVehicle(veh) then
            DetachEntity(stretcher, false, true)
            FreezeEntityPosition(stretcher, false)
			CreateThread(function()
				if vehData.trunkAsBackDoor then
					SetVehicleDoorOpen(veh, 5, false, false)
					Wait(1000)
					SetVehicleDoorShut(veh, 5, false)
				else
					SetVehicleDoorOpen(veh, 2, false, false)
					SetVehicleDoorOpen(veh, 3, false, false)
					Wait(1000)
					SetVehicleDoorShut(veh, 2, false)
					SetVehicleDoorShut(veh, 3, false)
				end
			end)
			moveStretcher()
        end
    end
end
exports('StretcherOutCar', StretcherOutCar)


placeOnStretcher = function()
	if placedOnStretcher then
		RemoveAnimDict('anim@gangops@morgue@table@')
		lib.requestAnimDict(Config.DeathAnimation.anim, 3000)
		DetachEntity(cache.ped, false, false)
		ClearPedTasks(cache.ped)
		TriggerServerEvent('wasabi_ambulance:setEntityState', placedOnStretcher, 'patient', false)
		TriggerServerEvent('wasabi_ambulance:setPlayerState', 'onStretcher', placedOnStretcher)
		placedOnStretcher = false
		return
	end
	local coords = GetEntityCoords(cache.ped)
	local objHash = GetHashKey(Config.StretcherProp)
	local stretcherObj = GetClosestObjectOfType(coords.x, coords.y, coords.z, 1.5, objHash, false, false, false)
	local objCoords = GetEntityCoords(stretcherObj)
	lib.requestAnimDict('anim@gangops@morgue@table@', 3000)
	SetEntityAsMissionEntity(stretcherObj, true, true)
	ClearPedTasks(cache.ped)
	Wait(100)
	AttachEntityToEntity(cache.ped, stretcherObj, 0, 0, 0.0, 1.0, 195.0, 0.0, 180.0, false, false, false, false, 2, true)
	Wait(100)
	TaskPlayAnim(cache.ped, 'anim@gangops@morgue@table@', 'body_search', 8.0, 8.0, -1, 33, 0, false, false, false)
	Wait(100)
	placedOnStretcher = ObjToNet(stretcherObj)
	TriggerServerEvent('wasabi_ambulance:setEntityState', placedOnStretcher, 'patient', cache.serverId)
	TriggerServerEvent('wasabi_ambulance:setPlayerState', 'onStretcher', placedOnStretcher)
end

loadStretcher = function()
	if not stretcher or not DoesEntityExist(stretcher) then return end
	local coords = GetEntityCoords(stretcher)
	local player = lib.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
	if player then
		if stretcherMoving then stretcherMoving = false end
		TriggerServerEvent('wasabi_ambulance:placeOnStretcher', GetPlayerServerId(player))
	else
		TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
	end
end

exports('loadStretcher', loadStretcher)

moveStretcher = function()
	if isPlayerDead() or not stretcher then return end
	wsb.target.removeZone('stretcherzone')
	local ped = cache.ped
	stretcherMoving = true
	local textUI
	lib.requestAnimDict('anim@heists@box_carry@', 3000)
	SetEntityAsMissionEntity(stretcher, true, true)
	TaskPlayAnim(ped, 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)
	Wait(400)
	AttachEntityToEntity(stretcher, ped, GetPedBoneIndex(ped,  28422), 0.0, -0.9, -0.52, 195.0, 180.0, 180.0, false, false, true, false, 1, true)
    while true do
		Wait(0)
		if not stretcherMoving or not IsEntityAttachedToEntity(ped, stretcher) then
			ClearPedTasks(ped)
			DetachEntity(stretcher, false, true)
			stretcherMoving = false
			wsb.hideTextUI()
			textUI = false
			break
		end
		if not textUI then
			wsb.showTextUI(Strings.drop_stretch_ui)
			textUI = true
		end
		if IsControlJustPressed(0, 38) or IsDisabledControlJustPressed(0, 305) or IsDisabledControlPressed(0, 120) then
			if IsDisabledControlJustPressed(0, 305) or IsDisabledControlPressed(0, 120) then
				ClearPedTasks(ped)
				TaskPlayAnim(ped, 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)
				Wait(500)
			end
			DetachEntity(stretcher, false, true)
			ClearPedTasks(ped)
			RemoveAnimDict('anim@heists@box_carry@')
			wsb.hideTextUI()
			textUI = false
			stretcherPlaced(stretcher)
			break
		end
	end
    RemoveAnimDict('anim@heists@box_carry@')
end

OpenMobileMenu = function(id, title, options)
	if isPlayerDead() then return end
    local Options = {}
    for i=1, #options do
        Options[#Options + 1] = {
            icon = (options[i].icon or false),
            label = options[i].title,
            description = (options[i].description or false),
            args = {event = options[i].event, args = (options[i].args or false)}
        }
    end
    lib.registerMenu({
        id = id,
        title = title,
        position = Config.MobileMenu.position,
        options = Options
    }, function(selected, scrollIndex, args)
        if selected then
            TriggerEvent(args.event, (args.args or false))
        end
    end)
    lib.showMenu(id)
end

openOutfits = function(hospital)
	if isPlayerDead() then return end
	if Config.skinScript == 'qb' then
		TriggerEvent('qb-clothing:client:openMenu')
	else
		local data = Config.Locations[hospital].Cloakroom.Uniforms
		local Options = {
			{
				title = Strings.civilian_wear,
				description = '',
				arrow = false,
				event = 'wasabi_ambulance:changeClothes',
				args = 'civ_wear'
			}
		}
		for i=1, #data do
			if data[i].minGrade then
				local _job, grade = wsb.hasGroup({Config.ambulanceJob})
				if grade and grade >= data[i].minGrade then
					Options[#Options + 1] = {
						title = data[i].label,
						description = '',
						arrow = false,
						event = 'wasabi_ambulance:changeClothes',
						args = {male = data[i].male, female = data[i].female}
					}
				end 
			else
				Options[#Options + 1] = {
					title = data[i].label,
					description = '',
					arrow = false,
					event = 'wasabi_ambulance:changeClothes',
					args = {male = data[i].male, female = data[i].female}
				}
			end
		end
		if Config.MobileMenu.enabled then
			OpenMobileMenu('ems_cloakroom', Strings.cloakroom, Options)
		else
			lib.registerContext({
				id = 'ems_cloakroom',
				title = Strings.cloakroom,
				options = Options
			})
			lib.showContext('ems_cloakroom')
		end
	end
end

exports('openOutfits', openOutfits)

function SavePreviousOutfit()
    local previousOutfit = {}
    for i = 0, 11 do -- There are 12 component slots (0-11) we need to account for
        local drawable = GetPedDrawableVariation(cache.ped, i)
        local texture = GetPedTextureVariation(cache.ped, i)
        previousOutfit[i] = {drawable = drawable, texture = texture}
    end
	TriggerServerEvent('wasabi_ambulance:saveOutfit', previousOutfit)
end

function LoadPreviousOutfit()
	local previousOutfit = lib.callback.await('wasabi_ambulance:loadPreviousOutfit', 500)
	if not previousOutfit then return end
    for k, v in pairs(previousOutfit) do
        SetPedComponentVariation(cache.ped, k, v.drawable, v.texture, 2)
    end
end

pickupStretcher = function()
	if isPlayerDead() then return end
	local ped = cache.ped
	local coords = GetEntityCoords(ped)
	local stretchHash = GetHashKey(Config.StretcherProp)
	local obj = GetClosestObjectOfType(coords.x, coords.y, coords.z, 3.0, stretchHash, false, false, false)
	local objCoords = GetEntityCoords(obj)
--	TaskTurnPedToFaceCoord(ped, objCoords.x, objCoords.y, objCoords.z, 2000)
	local state = Entity(obj).state
	local ambulanceState = state.ambulance
	local hasPatient = state.patient
	if hasPatient then
		TriggerServerEvent('wasabi_ambulance:placeOnStretcher', hasPatient)
	end
	if ambulanceState then
		Entity(NetToVeh(ambulanceState)).state.stretcher = nil
		TriggerServerEvent('wasabi_ambulance:setEntityState', ambulanceState, 'stretcher', nil)
		TriggerEvent('wasabi_bridge:notify', Strings.successful, Strings.stretcher_pickup, 'success')
	else
		TriggerEvent('wasabi_bridge:notify', Strings.successful, Strings.ambulance_not_found, 'success')
	end
	TriggerServerEvent('wasabi_ambulance:removeObj', ObjToNet(obj))
end

InteractWithStretcher = function(obj)
	if isPlayerDead() then return end
	if not DoesEntityExist(obj) then return end
	local Options = {
		{
			title = Strings.send_stretcher_home,
			arrow = false,
			event = 'wasabi_ambulance:pickupStretcher',
		},
		{
			title = Strings.move_target,
			arrow = false,
			event = 'wasabi_ambulance:moveStretcher',
		},
		{
			title = Strings.place_stretcher_target,
			arrow = false,
			event = 'wasabi_ambulance:loadStretcher',
		}
	}
	if Config.MobileMenu.enabled then
		OpenMobileMenu('interact_stretcher_menu', Strings.stretcher_menu_title, Options)
	else
		lib.registerContext({
			id = 'interact_stretcher_menu',
			title = Strings.stretcher_menu_title,
			options = Options
		})
		lib.showContext('interact_stretcher_menu')
	end
end

stretcherPlaced = function(obj)
	stretcherMoving = false
	if isPlayerDead() then return end
	local coords = GetEntityCoords(obj)
	local heading = GetEntityHeading(obj)
	local targetPlaced = false
	local textUI = false
	CreateThread(function()
		while true do
			local sleep = 1500
			if DoesEntityExist(obj) then
				if Config.targetSystem then
					if not targetPlaced then
						wsb.target.boxZone('stretcherzone', coords, 2.5, 2.5, {
							name = 'stretcherzone',
							heading = heading,
							debugPoly = false,
							minZ = coords.z-5,
							maxZ = coords.z+5,
							options = {
								{
									event = 'wasabi_ambulance:pickupStretcher',
									icon = 'fas fa-ambulance',
									label = Strings.send_stretcher_home,
								},
								{
									event = 'wasabi_ambulance:moveStretcher',
									icon = 'fas fa-ambulance',
									label = Strings.move_target,
									job = Config.ambulanceJob,
									groups = Config.ambulanceJob
								},
								{
									event = 'wasabi_ambulance:loadStretcher',
									icon = 'fas fa-ambulance',
									label = Strings.place_stretcher_target,
									job = Config.ambulanceJob,
									groups = Config.ambulanceJob
								}
							},
							job = Config.ambulanceJob,
							distance = 2.5
						})
						targetPlaced = true
					end
				else
					local plyCoords = GetEntityCoords(cache.ped)
					local dist = #(vector3(plyCoords.x, plyCoords.y, plyCoords.z) - vector3(coords.x, coords.y, coords.z))
					if dist <= 2.5 then
						if not textUI then
							wsb.showTextUI(Strings.interact_stretcher_ui)
							textUI = true
						end
						sleep = 0
						if IsControlJustPressed(0, 38) then
							InteractWithStretcher(obj)
						end
					else
						if textUI then
							wsb.hideTextUI()
							textUI = false
						end
					end
				end
			elseif not DoesEntityExist(obj) or stretcherMoving then
				if Config.targetSystem then
					wsb.target.removeZone('stretcherzone')
					targetPlaced = false
					break
				else
					if textUI then
						wsb.hideTextUI()
						textUI = false
						break
					end
				end
			end
			Wait(sleep)
		end
	end)
end

treatPatient = function(injury)
	if isPlayerDead() then return end
	local coords = GetEntityCoords(cache.ped)
	local player = lib.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
	if not player then
		TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
	elseif wsb.hasGroup(Config.ambulanceJob) or Authorized then
		local progressUI
		if Config.ProgressCircle then progressUI = 'progressCircle' else progressUI = 'progressBar' end
		local targetId = GetPlayerServerId(player)
		local plyInjury = lib.callback.await('wasabi_ambulance:diagnosePatient', 500, targetId)
		if plyInjury then
			if plyInjury == 'bleedout' then plyInjury = 'stabbed' end
			if type(plyInjury) == 'string' and plyInjury == injury then
				local ped = cache.ped
				local targetPed = GetPlayerPed(player)
				local tCoords = GetEntityCoords(targetPed)
				TaskTurnPedToFaceCoord(ped, tCoords.x, tCoords.y, tCoords.z, 3000)
				Wait(1000)
				TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
				Wait(Config.TreatmentTime)
				ClearPedTasks(ped)
				TriggerServerEvent('wasabi_ambulance:treatPlayer', targetId, injury)
			elseif type(plyInjury) == 'table' then
				local found
				for _,v in pairs(plyInjury) do
					if v.type == injury then found = true break end
				end
				if not found then
					TriggerEvent('wasabi_bridge:notify', Strings.wrong_equipment, Strings.wrong_equipment_desc, 'error')
				else
					local ped = cache.ped
					local targetPed = GetPlayerPed(player)
					local tCoords = GetEntityCoords(targetPed)
					TaskTurnPedToFaceCoord(ped, tCoords.x, tCoords.y, tCoords.z, 3000)
					Wait(1000)
					if lib[progressUI]({
						duration = Config.TreatmentTime,
						label = Strings.treating_patient_progress,
						useWhileDead = false,
						canCancel = true,
						disable = {
							car = true,
							move = true
						},
						anim = {
							dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
							clip = 'machinic_loop_mechandplayer'
						},
					}) then
						TriggerServerEvent('wasabi_ambulance:treatPlayer', targetId, injury)
					else
						TriggerEvent('wasabi_bridge:notify', Strings.action_cancelled, Strings.action_cancelled_desc, 'error')
					end
				end
			else
				TriggerEvent('wasabi_bridge:notify', Strings.wrong_equipment, Strings.wrong_equipment_desc, 'error')
			end
		else
			TriggerEvent('wasabi_bridge:notify', Strings.player_not_injured, Strings.player_not_injured_desc, 'error')
		end
	else
		TriggerEvent('wasabi_bridge:notify', Strings.not_medic, Strings.not_medic_desc, 'error')
	end
end

exports('treatPatient', treatPatient)

gItem = function(data)
	local item = data.item
	local cb = lib.callback.await('wasabi_ambulance:gItem', 500, item)
	if cb then
		TriggerEvent('wasabi_bridge:notify', Strings.successful, Strings.item_grab, 'success')
	else
		TriggerEvent('wasabi_bridge:notify', Strings.successful, Strings.medbag_pickup_civ, 'success')
	end
end

interactBag = function()
	if isPlayerDead() then return end
	if wsb.hasGroup(Config.ambulanceJob) or (Config.policeCanTreat.enabled and wsb.hasGroup(Config.policeCanTreat.jobs)) then
		local Options = {
			{
				title = Strings.medbag_tweezers,
				description = Strings.medbag_tweezers_desc,
				arrow = false,
				event = 'wasabi_ambulance:gItem',
				args = {item = Config.TreatmentItems.shot}
			},
			{
				title = Strings.medbag_suture,
				description = Strings.medbag_suture_desc,
				arrow = false,
				event = 'wasabi_ambulance:gItem',
				args = {item = Config.TreatmentItems.stabbed}
			},
			{
				title = Strings.medbag_icepack,
				description = Strings.medbag_icepack_desc,
				arrow = false,
				event = 'wasabi_ambulance:gItem',
				args = {item = Config.TreatmentItems.beat}
			},
			{
				title = Strings.medbag_burncream,
				description = Strings.medbag_burncream_desc,
				arrow = false,
				event = 'wasabi_ambulance:gItem',
				args = {item = Config.TreatmentItems.burned}
			},
			{
				title = Strings.medbag_defib,
				description = Strings.medbag_defib_desc,
				arrow = false,
				event = 'wasabi_ambulance:gItem',
				args = {item = Config.EMSItems.revive.item}
			},
			{
				title = Strings.medbag_medikit,
				description = Strings.medbag_medikit_desc,
				arrow = false,
				event = 'wasabi_ambulance:gItem',
				args = {item = Config.EMSItems.heal.item}
			},
			{
				title = Strings.medbag_sedative,
				description = Strings.medbag_sedative_desc,
				arrow = false,
				event = 'wasabi_ambulance:gItem',
				args = {item = Config.EMSItems.sedate.item}
			}

		}
		if Config?.wasabi_crutch?.crutchInMedbag?.enabled then
			Options[#Options + 1] = {
				title = Strings.medbag_crutch,
				description = Strings.medbag_crutch_desc,
				arrow = false,
				event = 'wasabi_ambulance:gItem',
				args = {item = Config.wasabi_crutch.crutchInMedbag.item}
			}
		end
		if Config?.wasabi_crutch?.chairInMedbag?.enabled then
			Options[#Options + 1] = {
				title = Strings.medbag_chair,
				description = Strings.medbag_chair_desc,
				arrow = false,
				event = 'wasabi_ambulance:gItem',
				args = {item = Config.wasabi_crutch.chairInMedbag.item}
			}
		end
		if Config.MobileMenu.enabled then
			OpenMobileMenu('medbag', Strings.medbag, Options)
		else
			lib.registerContext({
				id = 'medbag',
				title = Strings.medbag,
				options = Options
			})
			lib.showContext('medbag')
		end
	else
		TriggerEvent('wasabi_bridge:notify', Strings.not_medic, Strings.not_medic_desc, 'error')
	end
end

deleteObj = function(entity)
	if DoesEntityExist(entity) then
		SetEntityAsMissionEntity(entity, true, true)
		DeleteObject(entity)
		DeleteEntity(entity)
	end
end

pickupBag = function()
	if isPlayerDead() then return end
	local ped = cache.ped
	local coords = GetEntityCoords(ped)
	local bagHash = Config.BagProp
	local closestBag = GetClosestObjectOfType(coords.x, coords.y, coords.z, 3.0, bagHash, false, false, false)
	local bagCoords = GetEntityCoords(closestBag)
	TaskTurnPedToFaceCoord(ped, bagCoords.x, bagCoords.y, bagCoords.z, 2000)
	TaskPlayAnim(ped, 'pickup_object', 'pickup_low', 8.0, 8.0, 1000, 50, 0, false, false, false)
	Entity(closestBag).state.useable = false
	Wait(1000)
	TriggerServerEvent('wasabi_ambulance:removeObj', ObjToNet(closestBag))
	Wait(500)
	if not DoesEntityExist(closestBag) then
		local cb = lib.callback.await('wasabi_ambulance:gItem', 500, Config.EMSItems.medbag)
		if cb then
			TriggerEvent('wasabi_bridge:notify', Strings.successful, Strings.medbag_pickup, 'success')
		else
			TriggerEvent('wasabi_bridge:notify', Strings.successful, Strings.medbag_pickup_civ, 'success')
		end
	end
end

medicalSuppliesMenu = function(id)
	if isPlayerDead() then return end
	if wsb.hasGroup(Config.ambulanceJob) then
		local supplies = Config.Locations[id].MedicalSupplies.Supplies
		local Options = {}
		for i=1, #supplies do
			if supplies[i].price then
				Options[#Options + 1] = {
					title = supplies[i].label..' - '..Strings.currency..''..addCommas(supplies[i].price),
					description = '',
					arrow = false,
					event = 'wasabi_ambulance:buyItem',
					args = { hospital = id, item = supplies[i].item, price = supplies[i].price }
				}
			else
				Options[#Options + 1] = {
					title = supplies[i].label,
					description = '',
					arrow = false,
					event = 'wasabi_ambulance:buyItem',
					args = { hospital = id, item = supplies[i].item }
				}
			end
		end
		if Config.MobileMenu.enabled then
			OpenMobileMenu('ems_supply_menu', Strings.request_supplies_target, Options)
		else
			lib.registerContext({
				id = 'ems_supply_menu',
				title = Strings.request_supplies_target,
				options = Options
			})
			lib.showContext('ems_supply_menu')
		end
	end
end

openVehicleMenu = function(hosp)
    if isPlayerDead() then return end
    if not wsb.hasGroup(Config.ambulanceJob) then return end
    local data, grade
    local _, level = wsb.getGroup()
    if level > #Config.Locations[hosp].Vehicles.Options then
        grade = #Config.Locations[hosp].Vehicles.Options
        data = Config.Locations[hosp].Vehicles.Options[#Config.Locations[hosp].Vehicles.Options]
    elseif not Config.Locations[hosp].Vehicles.Options[level] then
        print('[wasabi_ambulance] : Ambulance garage not set up properly for job grade: '..level)
        return
    else
        grade = level
        data = Config.Locations[hosp].Vehicles.Options[level]
    end
    local Options = {}
    for k,v in pairs(data) do
        if v.category == 'land' then
            Options[#Options + 1] = {
				title = v.label,
				description = '',
				icon = 'car',
				arrow = true,
				event = 'wasabi_ambulance:spawnVehicle',
				args = { hospital = hosp, model = k, grade = grade }
            }
        elseif v.category == 'air' then
            Options[#Options + 1] = {
				title = v.label,
				description = '',
				icon = 'helicopter',
				arrow = true,
				event = 'wasabi_ambulance:spawnVehicle',
				args = { hospital = hosp, model = k, grade = grade, category = v.category }
            }
        end
    end
    if Config.MobileMenu.enabled then
        OpenMobileMenu('ems_garage_menu', Strings.hospital_garage, Options)
    else
        lib.registerContext({
            id = 'ems_garage_menu',
            title = Strings.hospital_garage,
            onExit = function()
                inMenu = false
            end,
            options = Options
        })
        lib.showContext('ems_garage_menu')
    end
end

InteractWithMedbag = function(obj)
	if isPlayerDead() then return end
	if not DoesEntityExist(obj) then return end
	local Options = {
		{
			title = Strings.pickup_bag_target,
			arrow = false,
			event = 'wasabi_ambulance:pickupBag',
		},
		{
			title = Strings.interact_bag_target,
			arrow = false,
			event = 'wasabi_ambulance:interactBag',
		}
	}
	if Config.MobileMenu.enabled then
		OpenMobileMenu('interact_medbag_menu', Strings.medbag, Options)
	else
		lib.registerContext({
			id = 'interact_medbag_menu',
			title = Strings.medbag,
			options = Options
		})
		lib.showContext('interact_medbag_menu')
	end
end

medBagPlaced = function(obj)
	if not DoesEntityExist(obj) then return end
	local coords = GetEntityCoords(obj)
	targetPlaced = false
	local textUI = false
	CreateThread(function()
		while true do
			local sleep = 1500
			if DoesEntityExist(obj) then
				local plyCoords = GetEntityCoords(cache.ped)
				local dist = #(vector3(plyCoords.x, plyCoords.y, plyCoords.z) - vector3(coords.x, coords.y, coords.z))
				if dist <= 2.0 then
					if not textUI then
						wsb.showTextUI(Strings.interact_stretcher_ui)
						textUI = true
					end
					sleep = 0
					if IsControlJustPressed(0, 38) then
						InteractWithMedbag(obj)
					end
				else
					if textUI then
						wsb.hideTextUI()
						textUI = false
					end
				end
			else
				if textUI then
					wsb.hideTextUI()
					textUI = false
				end
				break
			end
			Wait(sleep)
		end
	end)
end

local medbagObj
useMedbag = function()
	if isPlayerDead() then return end
	local ped = cache.ped
	local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(ped,0.0,2.0,0.55))
	lib.requestModel(Config.BagProp, 3000)
	medbagObj = CreateObjectNoOffset(Config.BagProp, x, y, z, true, false, false)
	TriggerServerEvent('wasabi_ambulance:setBagState', ObjToNet(medbag))
	SetModelAsNoLongerNeeded(Config.BagProp)
	SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, false)
	NetworkRequestControlOfEntity(medbagObj)
	AttachEntityToEntity(medbagObj, ped, GetPedBoneIndex(ped, 57005), 0.42, 0, -0.05, 0.10, 270.0, 60.0, true, true, false, true, 1, true)
	local bagEquipped = true
	local text_ui
	CreateThread(function()
		while bagEquipped do
			Wait(0)
			if not text_ui then
				wsb.showTextUI(Strings.drop_bag_ui)
				text_ui = true
			end
			if IsControlJustReleased(0, 38) then
				TaskPlayAnim(ped, 'pickup_object', 'pickup_low', 8.0, 8.0, 1000, 50, 0, false, false, false)
				bagEquipped = false
				text_ui = nil
				wsb.hideTextUI()
				Wait(1000)
				DetachEntity(medbagObj, false, true)
				PlaceObjectOnGroundProperly(medbagObj)
				Entity(medbagObj).state.useable = true
				if not Config.targetSystem then
					medBagPlaced(medbagObj)
				end
			end
		end
	end)
end

openDispatchMenu = function()
	if isPlayerDead() then return end
	if wsb.hasGroup(Config.ambulanceJob) then
		local Options = {
			{
				title = Strings.GoBack,
				description = '',
				icon = 'chevron-left',
				arrow = false,
				event = 'wasabi_ambulance:emsJobMenu',
				disabled = isPlayerDead() == true
			},
		}
		for k,v in pairs(plyRequests) do
			Options[#Options + 1] = {
				title = v,
				description = '',
				arrow = true,
				event = 'wasabi_ambulance:setRoute',
				args = {plyId = k},
				disabled = isPlayerDead() == true
			}
		end
		if #Options < 2 then
			Options[#Options + 1] = {
				title = Strings.no_requests,
				description = '',
				arrow = false,
				event = '',
				disabled = isPlayerDead() == true
			}
		end
		if Config.MobileMenu.enabled then
			OpenMobileMenu('ems_dispatch_menu', Strings.DispatchMenuTitle, Options)
		else
			lib.registerContext({
				id = 'ems_dispatch_menu',
				title = Strings.DispatchMenuTitle,
				options = Options
			})
			lib.showContext('ems_dispatch_menu')
		end
	end
end

SetHealthDefaults = function()
	while not DoesEntityExist(PlayerPedId()) do Wait(100) end
	local player = PlayerId()
	SetPlayerHealthRechargeMultiplier(player, 0.0)
    SetPlayerHealthRechargeLimit(player, 0.0)
	local health = GetEntityHealth(PlayerPedId())
	if health == 200 then return end
	SetEntityMaxHealth(PlayerPedId(), 200)
    SetEntityHealth(PlayerPedId(), 200)
end

function SetPlayerLimp(state)
    local clipSet = `move_m@injured`
    if state then
        if not HasAnimSetLoaded(clipSet) then
            RequestAnimSet(clipSet)
            while not HasAnimSetLoaded(clipSet) do Wait(5) end
        end
        SetPedMovementClipset(cache.ped, clipSet, 1.0)
    else
        ResetPedMovementClipset(cache.ped, 0)
    end
end

function IsPedWalkingWithLimp()
	local movement = GetPedMovementClipset(cache.ped)
    return movement == `move_m@injured`
end

local function getInjuryData(ped)
	local injuryData
    for k, v in pairs(InjuryReasons) do
		for _,weapon in pairs(v) do
			if HasPedBeenDamagedByWeapon(ped, weapon, 0) then
				local bypassWeapon = false
				if Config.BypassInjuryWeapons and #Config.BypassInjuryWeapons > 0 then
					for _,whitelistWeapon in pairs(Config.BypassInjuryWeapons) do
						if weapon == whitelistWeapon then bypassWeapon = true break end
					end
				end
				if not bypassWeapon then
					local hit, bone = GetPedLastDamageBone(ped)
					local bodypart = Bones[bone]
					if hit and bodypart then
						injuryData = {type = k, weapon = weapon, location = bodypart, data = PlayerSkeleton[bodypart] }
					end
				else
					injuryData = 'UNARMED'
				end
				ClearEntityLastDamageEntity(ped)
				break
			end
		end
		if injuryData then break end
	end
	if not injuryData then injuryData = {type = 'beat', weapon = 'unknown', location = 'spine', data = PlayerSkeleton.spine} end
	if injuryData == 'UNARMED' then injuryData = nil end
	return injuryData
end

local setActiveInjuryNotification
function SetActiveInjury(data)
	if not PlayerInjury[data.location] then
		PlayerInjury[data.location] = { type = data.type, data = data.data }
	else
		local foundInjury = PlayerInjury[data.location]
		if (foundInjury.type == 'stabbed' and data.type == 'shot') or foundInjury.type ~= 'shot' then
			foundInjury.type = data.type
		end
		foundInjury.data.limp = foundInjury.data.limp or data.data.limp
		foundInjury.data.level = foundInjury.data.level + data.data.level
		if foundInjury.data.level > 4 then foundInjury.data.level = 4 end
		foundInjury.data.bleed = foundInjury.data.bleed + data.data.bleed
		if foundInjury.data.bleed > 4 then foundInjury.data.bleed = 4 end
		PlayerInjury[data.location] = foundInjury
	end
	TriggerServerEvent('wasabi_ambulance:injurySync', PlayerInjury)
	if not setActiveInjuryNotification then setActiveInjuryNotification = GetGameTimer() end
	if (GetGameTimer() - setActiveInjuryNotification) < 4500 then return end
	setActiveInjuryNotification = GetGameTimer()
	local severity = PlayerInjury[data.location].data.level
	if severity == 1 then
		TriggerEvent('wasabi_bridge:notify', Strings.light_injury_title, (Strings.light_injury_desc):format(PlayerInjury[data.location].data.label), 'error', 'bandage')
	elseif severity >= 2 and severity <= 3 then
		TriggerEvent('wasabi_bridge:notify', Strings.moderate_injury_title, (Strings.moderate_injury_desc):format(PlayerInjury[data.location].data.label), 'error', 'kit-medical')
	elseif severity >= 4 then
		TriggerEvent('wasabi_bridge:notify', Strings.extreme_injury_title, (Strings.extreme_injury_desc):format(PlayerInjury[data.location].data.label), 'error', 'skull')
	end
end

function ChanceInjury()
	if isDead then return end
	local injuryData = getInjuryData(cache.ped)
	if not injuryData then return nil end
	local severity = (WeaponInjuryTable[injuryData.data.weapon] or 1)

	local random = math.random(1,100)
	if 10 > random then return end

	injuryData.data.level = severity
	injuryData.data.bleed = Config?.BleedMultiplier?[injuryData.type] or 1
	if injuryData.data.bleed > 4 then injuryData.data.bleed = 4 end
	SetActiveInjury(injuryData)
end

local lastStagger
function SimulatePedStagger(ped, duration)
	if not lastStagger then lastStagger = GetGameTimer() end
	if GetGameTimer() - lastStagger <= 16000 then return false end
	if IsPedInAnyVehicle(ped, false) then return false end
	ClearPedTasks(ped)
	CreateThread(function()
		lib.requestAnimDict('misscarsteal4@actor', 3000)
		TaskPlayAnim(ped, 'misscarsteal4@actor', 'stumble', 8.0, 8.0, -1, 3, 0, false, false, false)
		Wait(duration)
		ClearPedTasks(ped)
		RemoveAnimDict('misscarsteal4@actor')
	end)
	lastStagger = GetGameTimer()
	return true
end

function SimulateAimPain(ped)
	if not GameShake then
		local cameraShakeType = 'HAND_SHAKE'
		local cameraShakeAmplitude = 4.0
		ShakeGameplayCam(cameraShakeType, cameraShakeAmplitude)
		GameShake = cameraShakeAmplitude
	end

    if IsPedShooting(ped) then
        local deviation = math.random(10, 30) * 0.01
        local randomX = math.random(-1, 1) * deviation
        local randomY = math.random(-1, 1) * deviation

        local x, y, z = table.unpack(GetGameplayCamCoord())
        SetPedShootsAtCoord(ped, x + randomX, y + randomY, z, 0)
    end
end

function SendBlackoutNotify(location)
	TriggerEvent('wasabi_bridge:notify', Strings.blackout_title, (Strings.blackout_desc):format(location), 'error', 'skull')
end

function SendInjuredNotification()
    local injuryMessages = {
        [1] = Strings.injury_msg_one,
        [2] = Strings.injury_msg_two,
        [3] = Strings.injury_msg_three,
        [4] = Strings.injury_msg_four
    }

    local bleedMessages = {
        [1] = Strings.bleed_msg_one,
        [2] = Strings.bleed_msg_two,
        [3] = Strings.bleed_msg_three
    }

    local combinedMessage = ""
    local totalBleed = 0
	local highestInjuryLevel = 0

    for k, v in pairs(PlayerInjury) do
        if v.data.level > highestInjuryLevel then highestInjuryLevel = v.data.level end
        totalBleed = totalBleed + v.data.bleed
    end

	if highestInjuryLevel > 4 then highestInjuryLevel = 4 end
	combinedMessage = combinedMessage .. injuryMessages[highestInjuryLevel] .. " "
	if totalBleed > 0 and totalBleed <= 2 then
		combinedMessage = combinedMessage .. bleedMessages[1] .. " "
	elseif totalBleed > 2 and totalBleed <= 5 then
		combinedMessage = combinedMessage .. bleedMessages[2] .. " "
	elseif totalBleed > 5 then
		combinedMessage = combinedMessage .. bleedMessages[3] .. " "
	end

    combinedMessage = combinedMessage:sub(1, -2)
    
    if combinedMessage ~= "" then
        TriggerEvent('wasabi_bridge:notify', Strings.injury_bleed_notify, combinedMessage, 'error', 'skull')
    end
end

local previousBlackout
function BlackoutEffect(fadeTime, duration)
	if not previousBlackout then previousBlackout = GetGameTimer() end
	if (GetGameTimer() - previousBlackout) <= 18000 then return false end
    fadeTime = fadeTime or 1000
    local totalTimeBlackout = duration or 5000
	CreateThread(function()
	    DoScreenFadeOut(fadeTime)
		while not IsScreenFadedOut() do Wait(0) end
		Wait(totalTimeBlackout)
		DoScreenFadeIn(fadeTime)
		while not IsScreenFadedIn() do Wait(0) end
		previousBlackout = GetGameTimer()
	end)
	return true
end

local function nodOutThread()
	while true do
		if currentDrugEffect and currentDrugEffect >= 14 then
			if 70 <= math.random(1,100) then
				local blackedOut = BlackoutEffect(700, 3000)
				if blackedOut then
					SetPedToRagdoll(cache.ped, 7000, 5000, 0, true, true, false)
					TriggerEvent('wasabi_bridge:notify', Strings.fainted_title, Strings.fainted_so_high_desc, 'error')
				end
			end
		else
			break
		end
		Wait(1000)
	end
end

function SetDrugEffect(ped, drugLevel)
	if not currentDrugEffect then
		lib.requestAnimSet('move_m@hobo@a', 3000)
		SetTimecycleModifier('spectator3')
		SetPedMotionBlur(ped, true)
		SetPedIsDrunk(ped, true)
		AnimpostfxPlay('HeistCelebPass', 0, true)
		SetPedMovementClipset(ped, 'move_m@hobo@a', 1.0)
	end
	if currentDrugEffect and currentDrugEffect >= drugLevel then return end
	currentDrugEffect = drugLevel
    if currentDrugEffect >= 1 and currentDrugEffect <= 3 then
		ShakeGameplayCam('DRUNK_SHAKE', 1.5)
    elseif currentDrugEffect >= 4 and currentDrugEffect <= 7 then
		ShakeGameplayCam('DRUNK_SHAKE', 3.0)
    elseif currentDrugEffect >= 8 then
		SetTimecycleModifier('Dax_TripBase')
		ShakeGameplayCam('DRUNK_SHAKE', 3.0)
		if currentDrugEffect >= 19 then
			if not nodOutRunning then nodOutRunning = true nodOutThread() end
		end
	end
end


function ClearDrugEffects(ped)
    StopScreenEffect("HeistCelebPass")
	ResetPedMovementClipset(ped, 0)
    ClearTimecycleModifier()
	ShakeGameplayCam('DRUNK_SHAKE', 0.0)
	RemoveAnimSet('move_m@hobo@a')
end

function PlayTakePillAnimation()
    local ped = cache.ped
	lib.requestAnimDict('mp_suicide', 3000)
    TaskPlayAnim(ped, 'mp_suicide', 'pill', 8.0, -8.0, -1, 49, 0, false, false, false)
	Wait(3000)
	StopAnimTask(ped, 'mp_suicide', 'pill', 1.0)
    RemoveAnimDict('mp_suicide')
end

function DisableJumpingOnFrame()
	if Config.DisableNoJumpInjury then return end
	if 50 <= math.random(1,100) then
		DisableControlAction(0, 22, true)
		if IsDisabledControlJustReleased(0, 22) then
			SetPedToRagdoll(cache.ped, 5000, 3000, 0, true, true, false)
			TriggerEvent('wasabi_bridge:notify', Strings.cant_jump_title, Strings.cant_jump_desc, 'error')
		end
	end
end

function AttemptCheckIn(hospital, standaloneID)
	
	local progressUI
	if Config.ProgressCircle then progressUI = 'progressCircle' else progressUI = 'progressBar' end
	local checkIn
	if hospital == 'standalone' then
		checkIn = Config.StandaloneCheckIns[standaloneID]
		if not checkIn then return end
		hospital = 'standaloneCheckIn_'..standaloneID
	else
		local hospitalData = Config.Locations[hospital]
		if not hospitalData then return end
		checkIn = hospitalData.CheckIn
		if not checkIn.Enabled then return end
	end
	if not checkIn.DisableHospitalBeds then
		local hospitalBeds = GlobalState.HospitalBeds
		if not hospitalBeds or not next(hospitalBeds) or not hospitalBeds[hospital] then return end
		local foundBed
		for _,v in ipairs(hospitalBeds[hospital]) do
			if not v.inUse then
				v.inUse = cache.serverId
				foundBed = v
				break
			end
		end
		if not foundBed then
			TriggerEvent('wasabi_bridge:notify', Strings.no_beds, Strings.no_beds_desc, 'error')
			return
		end
		TriggerServerEvent('wasabi_ambulance:hospitalBedSync', hospitalBeds)
		IsCheckedIn = foundBed
		DoScreenFadeOut(2000)
		while not IsScreenFadedOut() do Wait(500) end
		if IsPedDeadOrDying(cache.ped, false) then
			local coords = GetEntityCoords(cache.ped, true)
			local heading GetEntityHeading(cache.ped)
			NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
		end
		IsCheckedIn.object = GetClosestObjectOfType(IsCheckedIn.coords.x, IsCheckedIn.coords.y, IsCheckedIn.coords.z, 1.0, IsCheckedIn.model, false, false, false)
		FreezeEntityPosition(IsCheckedIn.object, true)
		if Config.DeathScreenEffects then AnimpostfxStopAll() end
		SetEntityCoords(cache.ped, IsCheckedIn.coords.x, IsCheckedIn.coords.y, IsCheckedIn.coords.z+0.02)
		Wait(500)
		FreezeEntityPosition(cache.ped, true)
		lib.requestAnimDict('anim@gangops@morgue@table@', 3000)
		ClearPedTasks(cache.ped)
		TaskPlayAnim(cache.ped, 'anim@gangops@morgue@table@', 'body_search', 8.0, 1.0, -1, 1, 0, false, false, false )
		local playerHeading = (IsCheckedIn.heading > 180) and IsCheckedIn.heading - 180 or IsCheckedIn.heading + 180
		SetEntityHeading(cache.ped, playerHeading)
		IsCheckedIn.cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
		SetCamActive(IsCheckedIn.cam , true)
		RenderScriptCams(true, false, 1, true, true)
		AttachCamToPedBone(IsCheckedIn.cam , cache.ped, 31085, 0, 1.0, 1.0 , true)
		SetCamFov(IsCheckedIn.cam , 90.0)
		local heading = GetEntityHeading(cache.ped)
		heading = (heading > 180) and heading - 180 or heading + 180
		SetCamRot(IsCheckedIn.cam , -45.0, 0.0, heading, 2)
		TriggerEvent('wasabi_bridge:notify', Strings.checkin_hospital, Strings.checkin_hospital_desc, 'success')
		DrugIntake = {}
		nodOutRunning = false
		currentDrugEffect = false
		OnPainKillers = false
		DoScreenFadeIn(1200)
		while not IsScreenFadedIn do Wait(100) end
		if lib[progressUI]({
			duration = checkIn.Duration,
			label = Strings.recovering_progress,
			useWhileDead = true,
			canCancel = false,
			disable = {
				car = true,
				move = true
			},
		}) then
			lib.requestAnimDict('switch@franklin@bed', 3000)
			FreezeEntityPosition(cache.ped, false)
			SetEntityInvincible(cache.ped, false)
			SetEntityHeading(cache.ped, IsCheckedIn.heading - 90.0)
			TaskPlayAnim(cache.ped, 'switch@franklin@bed' , 'sleep_getup_rubeyes', 100.0, 1.0, -1, 8, -1, false, false, false)
			Wait(4000)
			ClearPedTasks(cache.ped)
			FreezeEntityPosition(IsCheckedIn.object, false)
			RenderScriptCams(false, true, 200, true, true)
			DestroyCam(IsCheckedIn.cam, false)
			TriggerServerEvent('wasabi_ambulance:setDeathStatus', false, true)
			isDead = false
			PlayerInjury = {}
			TriggerServerEvent('wasabi_ambulance:injurySync', false)
			local health = GetEntityHealth(cache.ped)
			if health < 200 then SetEntityHealth(cache.ped, 200) end
			if wsb.framework == 'esx' then
				TriggerServerEvent('esx:onPlayerSpawn')
				TriggerEvent('esx:onPlayerSpawn')
			elseif wsb.framework == 'qb' then
				TriggerServerEvent('hospital:server:resetHungerThirst') -- qb-ambulancejob compatibility
				TriggerServerEvent('hud:server:RelieveStress', 100)
				TriggerEvent('wasabi_bridge:onPlayerSpawn')
			end
			TriggerEvent('wasabi_ambulance:resetStatus')
			TriggerServerEvent('wasabi_ambulance:resetThirstHunger')
			IsCheckedIn = false
			hospitalBeds = GlobalState.HospitalBeds
			if not hospitalBeds or not hospitalBeds[hospital] then return end
			foundBed = false
			for _,b in ipairs(hospitalBeds[hospital]) do
				if b.inUse == cache.serverId then b.inUse = false foundBed = true break end
			end
			if not foundBed then return end
			TriggerServerEvent('wasabi_ambulance:hospitalBedSync', hospitalBeds)
			if Config?.wasabi_crutch?.crutchOnCheckIn?.enabled then
				Wait(3000)
				TriggerServerEvent('wasabi_crutch:giveCrutch', cache.serverId, Config.wasabi_crutch.crutchOnCheckIn.duration)
			end
		end
	else
		if Config.DeathScreenEffects then AnimpostfxStopAll() end
		if lib[progressUI]({
			duration = checkIn.Duration,
			label = Strings.checkingin_progress,
			useWhileDead = true,
			canCancel = false,
			disable = {
				car = true,
				move = true
			},
		}) then
			DoScreenFadeOut(2000)
			while not IsScreenFadedOut() do Wait(500) end
			if IsPedDeadOrDying(cache.ped, false) then
				local coords = GetEntityCoords(cache.ped, true)
				local heading GetEntityHeading(cache.ped)
				NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
			end
			SetEntityInvincible(cache.ped, false)
			IsCheckedIn = true
			TriggerEvent('wasabi_bridge:notify', Strings.checkin_hospital, Strings.checkin_hospital_desc, 'success')
			DrugIntake = {}
			nodOutRunning = false
			currentDrugEffect = false
			OnPainKillers = false
			TriggerServerEvent('wasabi_ambulance:setDeathStatus', false, true)
			isDead = false
			PlayerInjury = {}
			TriggerServerEvent('wasabi_ambulance:injurySync', false)
			local health = GetEntityHealth(cache.ped)
			if health < 200 then SetEntityHealth(cache.ped, 200) end
			if wsb.framework == 'esx' then
				TriggerServerEvent('esx:onPlayerSpawn')
				TriggerEvent('esx:onPlayerSpawn')
			elseif wsb.framework == 'qb' then
				TriggerServerEvent('hospital:server:resetHungerThirst') -- qb-ambulancejob compatibility
				TriggerServerEvent('hud:server:RelieveStress', 100)
				TriggerEvent('wasabi_bridge:onPlayerSpawn')
			end
			TriggerEvent('wasabi_ambulance:resetStatus')
			TriggerServerEvent('wasabi_ambulance:resetThirstHunger')
			IsCheckedIn = false
			ClearPedTasks(cache.ped)
			DoScreenFadeIn(1200)
			if Config?.wasabi_crutch?.crutchOnCheckIn?.enabled then
				Wait(3000)
				TriggerServerEvent('wasabi_crutch:giveCrutch', cache.serverId, Config.wasabi_crutch.crutchOnCheckIn.duration)
			end
		end
	end
end

function GetDeadPlayerInsideVehicle(vehicleEntity)
    local players = GetActivePlayers()
    for _, player in ipairs(players) do
        local ped = GetPlayerPed(player)
        if IsPedInVehicle(ped, vehicleEntity, false) then
			local serverID = GetPlayerServerId(player)
			if Player(serverID).state.dead then
				return serverID
			end
        end
    end
	return false
end

exports('IsOnStretcher', function(playerId)
	local state = Player(playerId).state
	return state.onStretcher
end)
