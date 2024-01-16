--[[FX INFO]]
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

--[[RESOURCE INFO]]
name 'Sam_scoreboard'
author 'Sam'
version '1.0.0'

client_scripts {
    'client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua',
}

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua'
}

ui_page "web/index.html"

files {
    "web/assets/*.*",
    "web/assets/vehicles/*.*",
    "web/*.**",
}
dependency '/assetpacks'