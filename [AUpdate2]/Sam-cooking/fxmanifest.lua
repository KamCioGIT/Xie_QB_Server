fx_version 'bodacious'
games { 'gta5' }

author "SupremeSam"

shared_script {
    'config.lua' 
}

client_scripts {
    'client.lua'
}

server_script {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

lua54 'yes'

dependency '/assetpacks'