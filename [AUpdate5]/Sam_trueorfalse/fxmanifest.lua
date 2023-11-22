fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_script 'config.lua'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/utils.lua',
    'client/main.lua',
}

server_scripts {
    'server/questions.lua',
    'server/utils.lua',
    'server/main.lua',
}

ui_page 'ui/index.html'

files {
    'ui/**/*.*',
    'ui/*.*',
}

--[[ escrow_ignore{
    'config.lua',
    'server/questions.lua',
    'server/questions.lua',
    'server/utils.lua',
    'server/main.lua',
    'client/utils.lua',
    'client/main.lua'
} ]]
dependency '/assetpacks'
dependency '/assetpacks'