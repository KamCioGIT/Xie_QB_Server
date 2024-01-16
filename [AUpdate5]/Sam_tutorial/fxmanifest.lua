fx_version "cerulean"
game "gta5"
author "Pickle Mods"
version "v1.2.4"

ui_page "html/index.html"

files {
	"html/index.html",
	"html/*.*",
}

--[[ shared_scripts {
	"@ox_lib/init.lua",
	"config.lua",
	"locales/locale.lua",
    "locales/translations/*.lua",
	"modules/**/shared.lua",
    "core/shared.lua"
} ]]

client_scripts {
	"client.lua",
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
    "server.lua"
}

lua54 'yes'

dependency '/assetpacks'
dependency '/assetpacks'