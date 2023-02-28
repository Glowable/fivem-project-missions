local NPC = { x = -2962.72, y = 483.09, z = 15.7, rotation = 268, NetworkSync = true}


RegisterCommand("startcayomis", function()
    print("mission started")
    TriggerEvent("glow:startcayo")

end)



RegisterNetEvent("glow:startcayo")
AddEventHandler("glow:startcayo", function()
    TriggerEvent("mt:missiontext", "Go to ~y~Los Santos International Airport", 500000)
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-1037.75, -2736.93, 20.17)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-1037.75, -2736.93, 20.17))
        if dist < 2 then
            inArea = true
            print("done")
            RemoveBlip(blip)
            TriggerEvent("glow:arrivelsia")
            
        end
    end
end)

RegisterNetEvent("glow:arrivelsia")
AddEventHandler("glow:arrivelsia", function()
    print("awaiting player input")
    local e_key = 38
    while true do
        Citizen.Wait(1)
        alert("∑ Press ~INPUT_PICKUP~ to board the ~b~Plane ~s~and travel to ~g~Cayo Perico")
        if IsControlJustReleased(38,  e_key --[[ H key ]]) then
            cayocam1()
            TriggerEvent("mt:missiontext", "", 500000)
            break
            
        end
    end
end)

RegisterCommand("step2cayo", function()
    TriggerEvent("glow:cutsceneleave")
end)






RegisterCommand("stage2cocaine", function()
    alert("~r~Police ~w~has seized the ~y~Port. ~w~Shoot your way through to steal the ~b~Cocaine")
    arrivedtodrug()
end)



