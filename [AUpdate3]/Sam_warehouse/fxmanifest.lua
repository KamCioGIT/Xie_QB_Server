fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'Power Scripts (power-scripts.com)'

escrow_ignore {
 'stream/*.*',
}

ui_page('html/index.html')

files({
 'html/index.html',
 'html/script.js',
 'html/style.css',
 'html/devices.css'
})

client_script 'encrypted/client.lua'

shared_script 'config.lua'
client_script 'client.lua'
server_script 'server.lua'

server_script '@mysql-async/lib/MySQL.lua'

this_is_a_map 'yes'

data_file 'DLC_ITYP_REQUEST' 'stream/power_warehouse.ytyp'

files {
 'stream/power_warehouse_shell.ydr',
 'stream/power_warehouse.ytyp',
}
dependency '/assetpacks'
dependency '/assetpacks'