fx_version 'cerulean'
game 'gta5'

description 'nk_callsigns'
version '0.0.0'

ui_page 'html/dist/index.html'

files {
  'html/dist/index.html',
  'html/dist/assets/*'
}

client_scripts {
  'bridge/esx.lua',
  'bridge/qbcore.lua',
  'config.lua',
  'main.lua'
}

lua54 'yes'

escrow_ignore {
  'config.lua',
  'bridge/esx.lua',
  'bridge/qbcore.lua',
  'main.lua'
}

dependency '/assetpacks'

dependency '/assetpacks'