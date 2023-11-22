fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'vames™️'
description 'vms_tattooshop'
version '1.0.9'

shared_scripts {
	'config.lua',
	'config.translation.lua',
	'@ox_lib/init.lua'
}

client_scripts {
	'config.tattoos.lua',
	'client/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
}

ui_page 'html/ui.html'

files {
	'html/*.*',
	'translation.js',
	'meta/vms_overlays.xml',
	'meta/shop_tattoo.meta'
}

export 'reloadPlayerTattoos'

data_file 'PED_OVERLAY_FILE' 'meta/vms_overlays.xml'
data_file 'TATTOO_SHOP_DLC_FILE' 'meta/shop_tattoo.meta'

dependency '/assetpacks'
dependency '/assetpacks'