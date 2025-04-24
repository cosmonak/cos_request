fx_version 'cerulean' 

game 'gta5' 

author 'cosmonak' 
description 'Skript pro správu žádostí o zaměstnání pro různé frakce' 
version '1.0.0' 

dependency 'ox_target' 

client_scripts {
    'client.lua'
}

lua54 'yes'

server_scripts {
    'server.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'  
}