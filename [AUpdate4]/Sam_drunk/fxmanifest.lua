fx_version 'adamant'
version '1.0'
game 'gta5'
author 'CodeStudio: https://discord.gg/ESwSKregtt'
description 'Code Studio Drunk System + Drunk Test Analyzer'

ui_page 'ui/index.html'


client_script 'main/client.lua'
server_scripts {'main/server.lua', 'config/open.lua'}
shared_scripts {'config/shared.lua', 'main/function.lua'}


files {
	'ui/**',
}

escrow_ignore {'config/*.lua'}

lua54 'yes'

dependency '/assetpacks'