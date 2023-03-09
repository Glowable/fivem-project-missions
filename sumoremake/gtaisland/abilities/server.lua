RegisterNetEvent("dopeAllPlayers", function()
    local src = source
    TriggerClientEvent("dopePlayer", -1)
end)

RegisterNetEvent("zoneAllPlayers", function()
    local src = source
    TriggerClientEvent("zonePlayer", -1)
end)

RegisterNetEvent("spawnAllPlayers", function()
    local src = source
    TriggerClientEvent("spawnPlayer", -1)
end)

RegisterNetEvent("menuAllPlayers", function()
    local src = source
    TriggerClientEvent("menuPlayer", -1)
end)