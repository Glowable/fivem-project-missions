RegisterNetEvent("zoneAllPlayers", function()
    local src = source
    TriggerClientEvent("zonePlayer", -1)
end)