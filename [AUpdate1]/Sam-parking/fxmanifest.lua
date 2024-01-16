fx_version 'adamant'
game 'gta5'
version '1.0'
author 'SupremeSam'

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua',
	'@oxmysql/lib/MySQL.lua',
}

shared_scripts {
	'locales/cn.lua',
	'config.lua',
    '@ox_lib/init.lua'
}

dependency 'oxmysql'
escrow_ignore{
	'client/unlock.lua',
	'locales/*.lua',
	'config.lua'
}

lua54 'yes'
dependency '/assetpacks'