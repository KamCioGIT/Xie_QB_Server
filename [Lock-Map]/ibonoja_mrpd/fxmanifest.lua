fx_version 'bodacious'
game 'gta5'
lua54 'yes'

author 'IBONOJA'
description 'MRPD21-22'
version '1.1.0'

this_is_a_map 'yes'


data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'
data_file 'AUDIO_GAMEDATA' 'audio/ibonoja_mrpd.dat' 

files {
	'interiorproxies.meta',
	'audio/ibonoja_mrpd.dat151.rel',
}

client_script {
    'ipl_loader/ibonoja_mrpd_entity_set_senora.lua',
}

escrow_ignore {
	'stream/logos',
	'ipl_loader',
  }
dependency '/assetpacks'