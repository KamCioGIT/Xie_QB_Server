fx_version 'adamant'
game 'gta5'

lua54 'yes'
--[[ escrow_ignore {
 'config.lua',
 'functions.lua',
 'client.lua',
 'server.lua',
} ]]

client_script 'client.lua'
server_script 'server.lua'

-- Editable
client_script 'functions.lua'
shared_script 'config.lua'

ui_page('html/index.html')

files({
 'html/index.html',
 'html/script.js',
 'html/style.css',
 'html/images/axon.png'
})

exports {
 'addBodycamAccess',
 'removeBodycamAccess',
 'hasBodycamAccess'
}
dependency '/assetpacks'
dependency '/assetpacks'