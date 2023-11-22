fx_version 'bodacious'

description 'lab-petv2'
author 'Furkann#4645'


version '0.0.0'

games { 'gta5' }

lua54 'yes'

--[[ escrow_ignore {
    'config.lua',
    'client/client.lua',
    'config.lua',
    'sql.lua',
    'server/server.lua',
    'locales.lua',
} ]]

ui_page 'html/index.html'
files {
  'html/index.html',
  'html/script.js',
  'html/style.css',
  'html/*otf',
  'stream/*.ytd',
  'stream/*.ydd',
  'stream/*.yft',
  'stream/*.ymt',
  'html/*png',
  'images/*.png',
  'images/*.jpg',
  'images/*.webp',
  'fonts/*.ttf',
  'fonts/*.otf',
  'fonts/*.OTF',
}



shared_scripts {
	'locales.lua',
	'config.lua',
}

client_scripts{
    'client/client.lua',
    'config.lua',
    'sql.lua',
}

-- data_file 'DLC_ITYP_REQUEST' 'stream'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/server.lua',
    'config.lua',
    'sql.lua',
}

dependency '/assetpacks'
dependency '/assetpacks'