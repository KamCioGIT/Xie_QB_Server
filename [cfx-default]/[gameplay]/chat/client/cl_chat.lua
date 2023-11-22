local isRDR = not TerraingridActivate and true or false

local chatInputActive = false
local chatInputActivating = false
local chatLoaded = false

local showtime = true


RegisterNetEvent('chatMessage')
RegisterNetEvent('chat:addTemplate')
RegisterNetEvent('chat:addMessage')
RegisterNetEvent('chat:addSuggestion')
RegisterNetEvent('chat:addSuggestions')
RegisterNetEvent('chat:addMode')
RegisterNetEvent('chat:removeMode')
RegisterNetEvent('chat:removeSuggestion')
RegisterNetEvent('chat:clear')

-- internal events
RegisterNetEvent('__cfx_internal:serverPrint')

RegisterNetEvent('_chat:messageEntered')

RegisterNetEvent('Sam_chat:cl:showTime', function(status)
    showtime = status
end)

RegisterNetEvent('Sam_chat:cl:moreLine', function(status)
    SendNUIMessage({
        type = 'ON_MORELINE',
        status = status
    })
end)

--debug
--[[ CreateThread(function()
    Wait(1200)
    for i = 1, 20 do
        TriggerEvent('chatMessage', '', { 255, 255, 255 }, '0')
    end
end) ]]

--deprecated, use chat:addMessage
AddEventHandler('chatMessage', function(author, color, text, warzone)
    local years, months, days, hours, minutes, seconds = Citizen.InvokeNative(0x50C7A99057A69748,
        Citizen.PointerValueInt(),
        Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(),
        Citizen.PointerValueInt())
    if seconds < 10 then seconds = "0" .. seconds end
    if minutes < 10 then minutes = "0" .. minutes end
    if hours < 10 then hours = "0" .. hours end
    local times = "[" .. hours .. ":" .. minutes .. ":" .. seconds .. "] "
    local args = { times .. text } --显示时间
    if not showtime then
        args = { text }
    end
    --local args = { text }--不显示时间
    if author ~= "" then
        table.insert(args, 1, author)
    end
    SendNUIMessage({
        type = 'ON_MESSAGE',
        message = {
            color = color,
            multiline = true,
            args = args
        }
    })
end)

AddEventHandler('__cfx_internal:serverPrint', function(msg)
    print(msg)

    SendNUIMessage({
        type = 'ON_MESSAGE',
        message = {
            templateId = 'print',
            multiline = true,
            args = { msg },
            mode = '_global'
        }
    })
end)

-- addMessage
local addMessage = function(message)
    if type(message) == 'string' then
        message = {
            args = { message }
        }
    end

    SendNUIMessage({
        type = 'ON_MESSAGE',
        message = message
    })
end

exports('addMessage', addMessage)
AddEventHandler('chat:addMessage', addMessage)

-- addSuggestion
local addSuggestion = function(name, help, params)
    SendNUIMessage({
        type = 'ON_SUGGESTION_ADD',
        suggestion = {
            name = name,
            help = help,
            params = params or nil
        }
    })
end

exports('addSuggestion', addSuggestion)
AddEventHandler('chat:addSuggestion', addSuggestion)

AddEventHandler('chat:addSuggestions', function(suggestions)
    for _, suggestion in ipairs(suggestions) do
        SendNUIMessage({
            type = 'ON_SUGGESTION_ADD',
            suggestion = suggestion
        })
    end
end)

AddEventHandler('chat:removeSuggestion', function(name)
    SendNUIMessage({
        type = 'ON_SUGGESTION_REMOVE',
        name = name
    })
end)

AddEventHandler('chat:addMode', function(mode)
    SendNUIMessage({
        type = 'ON_MODE_ADD',
        mode = mode
    })
end)

AddEventHandler('chat:removeMode', function(name)
    SendNUIMessage({
        type = 'ON_MODE_REMOVE',
        name = name
    })
end)

AddEventHandler('chat:addTemplate', function(id, html)
    SendNUIMessage({
        type = 'ON_TEMPLATE_ADD',
        template = {
            id = id,
            html = html
        }
    })
end)

AddEventHandler('chat:clear', function(name)
    SendNUIMessage({
        type = 'ON_CLEAR'
    })
end)

function checkCmd(cmd)
    local registeredCommands = GetRegisteredCommands()
    for _, command in ipairs(registeredCommands) do
        if command.name == string.lower(cmd) then
            return true
        end
    end
    return false
end

RegisterNUICallback('chatResult', function(data, cb)
    chatInputActive = false
    SetNuiFocus(false)
    TriggerEvent("Sam-chat:cl:input", false)
    if not data.canceled then
        local id = PlayerId()

        --deprecated
        local r, g, b = 0, 0x99, 255

        if data.message:sub(1, 1) == '/' then
            ExecuteCommand(data.message:sub(2))
            local cmd = data.message:sub(2)
            local pattern = "(%w+)"
            local result = string.match(cmd, pattern)
            if not checkCmd(result) then
                TriggerServerEvent('Sam-rpchat:server:sendCommand', data.message:sub(2))
            end
        else
            TriggerServerEvent('_chat:messageEntered', GetPlayerName(id), { r, g, b }, data.message, data.mode)
        end
    end

    cb('ok')
end)

local function refreshCommands()
    if GetRegisteredCommands then
        local registeredCommands = GetRegisteredCommands()

        local suggestions = {}

        for _, command in ipairs(registeredCommands) do
            if IsAceAllowed(('command.%s'):format(command.name)) and command.name ~= 'toggleChat' then
                table.insert(suggestions, {
                    name = '/' .. command.name,
                    help = ''
                })
            end
        end

        TriggerEvent('chat:addSuggestions', suggestions)
    end
end

local function refreshThemes()
    local themes = {}

    for resIdx = 0, GetNumResources() - 1 do
        local resource = GetResourceByFindIndex(resIdx)

        if GetResourceState(resource) == 'started' then
            local numThemes = GetNumResourceMetadata(resource, 'chat_theme')

            if numThemes > 0 then
                local themeName = GetResourceMetadata(resource, 'chat_theme')
                local themeData = json.decode(GetResourceMetadata(resource, 'chat_theme_extra') or 'null')

                if themeName and themeData then
                    themeData.baseUrl = 'nui://' .. resource .. '/'
                    themes[themeName] = themeData
                end
            end
        end
    end

    SendNUIMessage({
        type = 'ON_UPDATE_THEMES',
        themes = themes
    })
end

AddEventHandler('onClientResourceStart', function(resName)
    Wait(500)

    refreshCommands()
    refreshThemes()
end)

AddEventHandler('onClientResourceStop', function(resName)
    Wait(500)

    refreshCommands()
    refreshThemes()
end)

RegisterNUICallback('loaded', function(data, cb)
    TriggerServerEvent('chat:init')

    refreshCommands()
    refreshThemes()

    chatLoaded = true

    cb('ok')
end)

local CHAT_HIDE_STATES = {
    SHOW_WHEN_ACTIVE = 0,
    ALWAYS_SHOW = 1,
    ALWAYS_HIDE = 2
}

local kvpEntry = GetResourceKvpString('hideState')
local chatHideState = kvpEntry and tonumber(kvpEntry) or CHAT_HIDE_STATES.ALWAYS_SHOW
local isFirstHide = true

--[[ RegisterCommand('chattime', function()
    showtime = not showtime
end) ]]

if not isRDR then
    --[[if RegisterKeyMapping then
    RegisterKeyMapping('toggleChat', 'Toggle chat', 'keyboard', 'l')
  end]]
    --

    RegisterCommand('toggleChat', function()
        if chatHideState == CHAT_HIDE_STATES.SHOW_WHEN_ACTIVE then
            chatHideState = CHAT_HIDE_STATES.ALWAYS_SHOW
        elseif chatHideState == CHAT_HIDE_STATES.ALWAYS_SHOW then
            chatHideState = CHAT_HIDE_STATES.ALWAYS_HIDE
        elseif chatHideState == CHAT_HIDE_STATES.ALWAYS_HIDE then
            chatHideState = CHAT_HIDE_STATES.SHOW_WHEN_ACTIVE
        end
        --chatHideState = CHAT_HIDE_STATES.ALWAYS_SHOW
        isFirstHide = false
        chatHideState = CHAT_HIDE_STATES.ALWAYS_SHOW
        SetResourceKvp('hideState', tostring(chatHideState))
    end, false)
end

RegisterNUICallback('ChangeStatus', function(hide)
    --TriggerEvent('chat:client:ChangeStatus',hide.action)
    chatHideState = CHAT_HIDE_STATES.ALWAYS_SHOW
    SetResourceKvp('hideState', tostring(chatHideState))
    --[[ if hide.action then
	    chatHideState = CHAT_HIDE_STATES.ALWAYS_HIDE
		SetResourceKvp('hideState', tostring(chatHideState))
	else
	    chatHideState = CHAT_HIDE_STATES.ALWAYS_SHOW
		SetResourceKvp('hideState', tostring(chatHideState))
	end ]]
end)

RegisterNetEvent('chat:client:ChangeStatus')
AddEventHandler('chat:client:ChangeStatus', function(hide)
    print(hide)
    if hide then
        chatHideState = CHAT_HIDE_STATES.ALWAYS_HIDE
        SetResourceKvp('hideState', "CHAT_HIDE_STATES.ALWAYS_HIDE")
    else
        chatHideState = CHAT_HIDE_STATES.ALWAYS_SHOW
        SetResourceKvp('hideState', "CHAT_HIDE_STATES.ALWAYS_SHOW")
    end
end)

Citizen.CreateThread(function()
    SetTextChatEnabled(false)
    SetNuiFocus(false)

    local lastChatHideState = -1
    local origChatHideState = -1

    while true do
        Wait(0)

        if not chatInputActive then
            if IsControlPressed(0, isRDR and `INPUT_MP_TEXT_CHAT_ALL` or 245) --[[ INPUT_MP_TEXT_CHAT_ALL ]] then
                chatInputActive = true
                chatInputActivating = true
                TriggerEvent("Sam-chat:cl:input", true)

                SendNUIMessage({
                    type = 'ON_OPEN'
                })
            end
        end

        if chatInputActivating then
            if not IsControlPressed(0, isRDR and `INPUT_MP_TEXT_CHAT_ALL` or 245) then
                SetNuiFocus(true)
                TriggerEvent("Sam-chat:cl:input", true)
                chatInputActivating = false
            end
        end

        if chatLoaded then
            local forceHide = IsScreenFadedOut() or IsPauseMenuActive()
            local wasForceHide = false

            if chatHideState ~= CHAT_HIDE_STATES.ALWAYS_HIDE then
                if forceHide then
                    origChatHideState = chatHideState
                    chatHideState = CHAT_HIDE_STATES.ALWAYS_HIDE
                end
            elseif not forceHide and origChatHideState ~= -1 then
                chatHideState = origChatHideState
                origChatHideState = -1
                wasForceHide = true
            end

            if chatHideState ~= lastChatHideState then
                lastChatHideState = chatHideState

                SendNUIMessage({
                    type = 'ON_SCREEN_STATE_CHANGE',
                    hideState = chatHideState,
                    fromUserInteraction = not forceHide and not isFirstHide and not wasForceHide
                })

                isFirstHide = false
            end
        end
    end
end)
