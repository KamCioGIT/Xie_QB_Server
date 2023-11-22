fx_version 'cerulean'
games { 'gta5' }

author 'Liberty Development'
lua54 'yes'
client_scripts {"client/*.lua"}
server_scripts {"server/*.lua",}

shared_scripts {
    'shared/*.lua',
    '@PolyZone/client.lua',
    '@PolyZone/ComboZone.lua',
    '@PolyZone/CircleZone.lua',
}

dependency '/assetpacks'