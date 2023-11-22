--[[FX INFO]]
fx_version 'cerulean'
game 'gta5'
use_experimental_fxv2_oal 'yes'
lua54 'yes'

--[[RESOURCE INFO]]
name 'Sam_smallresources'
author 'Sam'
description 'Small functions'
version '1.0.0'

--[[ shared_scripts {
    'config.lua'
} ]]

--[[FX FILES]]
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua',
}

ui_page {
    'nui/ui.html',
}

files {
    'nui/**',
}
dependency '/assetpacks'