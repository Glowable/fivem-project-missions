RegisterNetEvent("dopeAllPlayers", function()
    local src = source
    TriggerClientEvent("dopePlayer", -1)
end)

RegisterNetEvent("zoneAllPlayers", function()
    local src = source
    TriggerClientEvent("zonePlayer", -1)
end)