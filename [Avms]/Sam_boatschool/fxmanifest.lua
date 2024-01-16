fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'vames™️'
description 'vms_boatschoolv2'
version '1.0.1'

shared_scripts {
	'config/config.lua',
}

client_scripts {
	'client/*.lua',
	'config/config.client.lua',
	'config/config.routes.lua',
}

server_scripts {
	'server/*.lua',
	'config/config.server.lua'
}

ui_page 'html/index.html'

files {
	'html/*.*',
	'html/**/*.*',
	'config/*.js',
}

dependency '/assetpacks'
dependency '/assetpacks'