--site.staendi.dev
fx_version 'cerulean'
games { 'gta5' }

author 'staendi'
description 'site.staendi.dev'
version '1.0.0'

shared_scripts {
	'@es_extended/imports.lua',
	'config.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',	
	'server.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'client.lua'
}
