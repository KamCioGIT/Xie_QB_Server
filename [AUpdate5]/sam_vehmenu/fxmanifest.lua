fx_version 'cerulean'
author 'shinohere #discord'
description 'shx-vehmenu'
game 'gta5'
lua54 'yes'

shared_script {
    'config.lua'
}

client_script 'client/cl_main.lua'

ui_page('html/index.html')

files({
    'html/index.html',
    'html/app.js',
    'html/style.css',
    'html/img/*.png',
})


escrow_ignore {
	'config.lua',
    'client/cl_main.lua',
}
dependency '/assetpacks'
dependency '/assetpacks'