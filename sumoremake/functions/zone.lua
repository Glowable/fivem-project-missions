function startZone()
    disableKeys()
    setSpawn()
    print("done")
    local ped = PlayerPedId()
    local blip = AddBlipForRadius(200.89, 7396.32, 14.08, 110.0) -- need to have .0
    SetBlipColour(blip, 3)
    SetBlipAlpha(blip, 128)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(187.89, 7396.52, -188.08))
        if dist < 200.6 then
            inArea = true
            print("reached explosion height")
            NetworkExplodeVehicle(GetVehiclePedIsIn(PlayerPedId(), false), true, true)
        end
    end

end

function disableKeys()
    DisableControlAction(2, 75, true)
end

