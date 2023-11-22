-- polat
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

ui_page "html/ui.html"

files {
    "html/ui.html",
    "html/ui.css",
    "html/ui.js",
	'html/img/*.png',
	'html/img/*.jpg',
	'html/img/*.svg',
}

server_scripts {
	'locale.lua',
	'config.lua',
	'server.lua',
	'coords.lua'
}

client_scripts {
	'locale.lua',
	'config.lua',
	'client.lua',
}




dependency '/assetpacks'