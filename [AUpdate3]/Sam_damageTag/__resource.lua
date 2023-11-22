fx_version 'cerulean'

games "gta5"

author "Pluton Dev"
description "Damage Tags"
version '1.0.0'

lua54 'yes'

client_scripts {
    'client/c_util.lua',
    'client/client.lua',
}

server_scripts {
    'server/s_util.lua',
    'server/server.lua',
}

shared_scripts {
    'config.lua',
}

--[[ escrow_ignore {
    'config.lua',
    'server/s_util.lua',
    'server/server.lua',
    'client/c_util.lua',
    'client/client.lua',

  } ]]


  