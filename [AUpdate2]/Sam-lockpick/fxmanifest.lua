fx_version 'bodacious'
game 'gta5'

description 'sh-lockpick Lockpick script by stay dev.'
version '1.0.0'

ui_page 'html/index.html'

client_scripts {
    'client.lua',
    'config.lua'
}

server_scripts {
    'server.lua',
    'config.lua'
}

files {
    'html/*.html',
    'html/*.js',
    'html/*.css',
    'html/*.mp3'
}

exports {
    'createLockpickGame',
    'createLockpickGameCb'
}

--[[ escrow_ignore {
  '**/*.*',
  '*'
} ]]

lua54 'yes'
dependency '/assetpacks'
dependency '/assetpacks'