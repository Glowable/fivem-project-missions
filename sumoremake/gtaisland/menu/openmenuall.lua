RegisterNetEvent("menuPlayer", function()
    print("hiiii")
end)

RegisterCommand("menuplayer", function()
    menuAllPlayers()
end)

function menuAllPlayers()
    TriggerEvent("sumo:openvehiclemenu")
end

RegisterCommand("testspecialability", function()
    SpecialAbilityDeactivateFast(PlayerId(), 1)
end)

---the actual effect
function menuEffect()
    TriggerEvent("sumo:openvehiclemenu")
end


