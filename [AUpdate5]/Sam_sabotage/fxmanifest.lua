
fx_version 'cerulean'

game 'gta5'
lua54 'yes'

author 'Envi-Scripts'
version '1.0.6'

client_scripts {
	'client/*.lua',
}

shared_scripts {
	'config.lua',
	'@ox_lib/init.lua',
}

server_scripts {
	'server/*.lua',
}

escrow_ignore {
	'config.lua',
	'install/ITEMS.lua'
}

-- v 1.0.6 - | |
--[QB-TARGET FIX, CUSTOM QB/ESX NAME SUPPORT, ADDED ITEMS TO INSTALL FOLDER]
dependency '/assetpacks'
dependency '/assetpacks'