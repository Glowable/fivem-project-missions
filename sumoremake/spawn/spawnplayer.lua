function setSpawn()
    SetEntityCoords(PlayerPedId(), 185.89, 7396.32, 14.08, 178.91, true, true, true, false)
    TriggerEvent("sumo:abil")
end

RegisterNetEvent("spawnPlayer", function()
    print("stuffhappenshere2")
end)

function spawnAllPlayers()
    TriggerServerEvent("spawnAllPlayers")    
end

function spawnEffect()
    print("stuffhappenshere1")
end



