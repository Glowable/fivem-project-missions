fx_version 'cerulean'
game 'gta5'

author 'CritteR / CritteRo / Other Lads'
description 'Lobby style menu framework.'

client_scripts {
    'client/cl_lobby_scaleform.lua',
    'client/cl_lobby_handle.lua',
    'client/cl_lobby_example.lua',
    'client/warmenu_demo.lua',
}

exports {
    "LobbyMenuGetActiveMenu",
    "LobbyMenuGetSelectedButtonParam",
    'setMenuColumnFocus',
    'SetTooltipOnly'
}

files {
    --'runtime.png',
}