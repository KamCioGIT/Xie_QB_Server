fx_version 'cerulean'
games {'gta5'}
lua54 "yes"

author 'T1GER#9080'
discord 'https://discord.gg/FdHkq5q'
description 'T1GER Gang System'
version '1.1.2'

dependency 't1ger_lib'

client_scripts {
	'language.lua',
	'config.lua',
	'client/main.lua',
	--'escrow/client.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'language.lua',
	'config.lua',
	'server/main.lua',
	--'escrow/server.lua'
}

shared_scripts {
    '@ox_lib/init.lua'
}

ui_page 'html/index.html';
files {
    'html/*',
}

--[[ escrow_ignore {
    'config.lua',
    'language.lua',
    'client/*.lua',
    'server/*.lua',
	'html/*'
} ]]

exports {
	'AdminGangMenu',
	'PlayerGangMenu',
	'IsTargetZiptied',
	'ZiptieAdd',
	'ZiptieRemove',
	'EscortPlayer',
	'VehicleIn',
	'VehicleOut',
	'TrunkIn',
	'TrunkOut',
	'HeadbagPlayer',
	'TakeHostage',
	'ReleaseHostage',
	'KillHostage'
}

server_exports {
	'GetGangData',
	'GetPlayerGang',
	'GetPlayerGangId',
	'GetPlayerGangRank',
	'GetGangNotoriety',
	'PlusGangNotoriety',
	'MinusGangNotoriety',
	'GetGangCash',
	'PlusGangCash',
	'MinusGangCash',
	'IsPlayerZiptied',
	'SetPlayerZiptied'
}
dependency '/assetpacks'
dependency '/assetpacks'