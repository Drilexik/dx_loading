fx_version 'cerulean'
game 'gta5'

author 'Drilexik'
version '1.0'
description 'A custom loading screen for FiveM servers.'

loadscreen 'ui/index.html'
loadscreen_manual_shutdown "yes"

files {
    'ui/index.html',
    'ui/style.css',
    'ui/img/logo/logo.png',
    'ui/img/img*.jpg',
    'music.mp3'
}

client_script 'client/client.lua'

is_debug 'yes'