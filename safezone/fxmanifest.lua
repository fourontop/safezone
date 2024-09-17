fx_version 'cerulean'
game 'gta5'
lua54 'yes'
description 'Safezone'
version '0.0.1'

ox_lib 'locale'

shared_scripts {
    '@ox_lib/init.lua'
}

client_scripts {
    'client.lua',
    'config.lua'
}

dependencies {
    'ox_lib'
}