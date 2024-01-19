--[[FX INFO]]
fx_version 'cerulean'
game 'gta5'
use_experimental_fxv2_oal 'yes'
lua54 'yes'

--[[RESOURCE INFO]]
name 'Sam_status'
author 'Sam'
description 'Small functions'
version '1.0.0'

shared_scripts {
	'@es_extended/imports.lua',
    'config.lua'
}

--[[FX FILES]]
client_scripts {
    'client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua',
}

escrow_ignore { 'config.lua' }

ui_page {
    'nui/ui.html',
}

files {
    'nui/**',
    'nui/locales/*.js',
}
dependency '/assetpacks'