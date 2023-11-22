fx_version "adamant"
game "gta5"

ui_page 'html/index.html'

files {
  "html/img/*.png",
  "html/index.html",
  "html/*.js",
  "html/style.css"
}

shared_scripts {
  '@ox_lib/init.lua',
  "shared/*.lua"
}

client_scripts {
  "client/cl_*.lua"
}

server_scripts {
  "server/sv_*.lua"
}

lua54 'yes'
dependency '/assetpacks'
dependency '/assetpacks'