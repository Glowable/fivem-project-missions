fx_version 'cerulean'
game 'gta5'
description 'Sumo Remake'
 
client_scripts {
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
    "@ScaleformUI_Lua/ScaleformUI.lua"

} 
 
server_script 'gtaisland/abilities/server.lua'