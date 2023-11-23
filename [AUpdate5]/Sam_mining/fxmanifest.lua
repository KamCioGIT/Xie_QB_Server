fx_version 'cerulean'
game 'gta5'

description 'Mining script for QBCore'
version '1.0.1'

client_script {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'client/*.lua'
}

server_scripts {'server/*.lua'}

shared_scripts {'config.lua'}

lua54 'yes'

escrow_ignore {
    'config.lua'
}

dependencies {
    'PolyZone',
    'qb-menu',
    'qb-target'
}
dependency '/assetpacks'