RegisterNetEvent("dopeAllPlayers", function()
    local src = source
    -- Run some checks on src, just make sure they are in the right condition to actually "dope all players"
    TriggerClientEvent("dopePlayer", -1)
end)