fx_version 'cerulean'
game 'gta5'
description 'Sumo Remake'
 
client_scripts {
    "main.lua",
    "functions/zone.lua",
    "functions/spawn.lua",
    "functions/voicelines.lua",
    "abilities/doped/doped.lua",
    "abilities/doped/spawn.lua",
    "abilities/zoned/zoned.lua",
    "scaleforms/modestart.lua",
} 
 
server_scripts {
    "abilities/doped/dopedserver.lua",
    "abilities/zoned/zonedserver.lua",
} 