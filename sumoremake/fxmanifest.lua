fx_version 'cerulean'
game 'gta5'
description 'Sumo Remake'
 
client_scripts {
    "@ScaleformUI_Lua/ScaleformUI.lua",
    "gtaisland/main.lua",
    "gtaisland/functions/zone.lua",
    "gtaisland/spawn/spawn.lua",
    "gtaisland/spawn/spawnplayer.lua",
    "gtaisland/functions/voicelines.lua",
    "gtaisland/abilities/spawn.lua",
    "gtaisland/abilities/doped/doped.lua",
    "gtaisland/abilities/zoned/zoned.lua",
    "gtaisland/scaleforms/modestart.lua",
    "gtaisland/menu/vehicleselect.lua",
    "gtaisland/menu/menu.lua",
    "gtaisland/liv/client.lua",
    "gtaisland/liv/entity.lua",


} 
 

server_script {
	'gtaisland/abilities/server.lua',
    'gtaisland/liv/server.lua',
}
