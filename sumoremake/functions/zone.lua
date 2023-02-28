function startZone()
    TriggerEvent("mt:missiontext", "Throw off other players off the Map", 500000)
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-1037.75, -2736.93, 20.17)
    SetBlipColour(blip, 5)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-1037.75, -2736.93, 20.17))
        if dist < 50 then
            inArea = true
            print("done")
            TriggerEvent("mt:missiontext", "", 500000)
            
        end
    end
end