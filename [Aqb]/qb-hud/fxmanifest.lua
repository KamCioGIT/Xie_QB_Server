fx_version 'cerulean'
game 'gta5'

description 'qb-hud'
version '2.2.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}

client_script 'client.lua'
server_script 'server.lua'

ui_page 'html/index.html'

files {
    'html/*',
    'html/index.html',
    'html/jquery.min.js',
    'html/quasar.umd.prod.js',
    'html/vue.global.prod.js',
    'html/styles.css',
    'html/responsive.css',
    'html/app.js',
}

lua54 'yes'

dependency '/assetpacks'