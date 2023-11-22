fx_version 'adamant'
---created by Mr.NOBODY#6666
---edited/converted by Davitko ve stylu.#3722
game 'gta5'

server_scripts {

	'config.lua',
	'server/*.lua',
	'@oxmysql/lib/MySQL.lua',
}

files {
    'theme/style.css',
}

client_scripts {

	'config.lua',
	'client/*.lua'
}
escrow_ignore {
    'config.lua',
}

chat_theme 'ccChat' {
    styleSheet = 'style.css',
    msgTemplates = {
        ccChat = '<div id="notification" class="noisy"><div id="color-box" style="background-color: {0} !important;" class="noisy"></div><div id="info"><div id="top-info"><div id="left-info"><h1 id="title"><i class="{1}"></i></h1><h2 id="sub-title">{2}</h2></div><h2 id="time">{3}</h2></div><div id="bottom-info"><br><p id="text">{4}</p></div></div>'
    }
}

chat_theme 'gtao' {
    styleSheet = 'theme/style.css',
    msgTemplates = {
        default = '<b>{0}</b><span>{1}</span>'
    }
}

lua54 'yes'
dependency '/assetpacks'
dependency '/assetpacks'