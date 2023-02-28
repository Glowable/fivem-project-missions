function startZone()
    print("done")
    local ped = PlayerPedId()
    local blip = AddBlipForRadius(-75.22, -819.13, 326.18, 30.0) -- need to have .0
    SetBlipColour(blip, 3)
    SetBlipAlpha(blip, 128)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-75.22, -819.13, 260.18))
        if dist < 100.6 then
            inArea = true
            print("done")
            NetworkExplodeVehicle(GetVehiclePedIsIn(PlayerPedId(), false), true, true)
        end
    end
    disableKeys()
    setSpawn()
end

function disableKeys()
    DisableControlAction(2, 75, true)
end

function setSpawn()
    SetEntityCoords(PlayerPedId(), -74.32, -812.53, 326.18, 178.91, true, true, true, false)
    spawnVehicle()
end

function spawnVehicle()
    local vehicleName = 'blista'


    RequestModel(vehicleName)

    while not HasModelLoaded(vehicleName) do
        Citizen.Wait(500)
    end

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)

    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, 178.91, true, false)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1) 
	vehicle = AddBlipForEntity(vehicle)
	SetBlipSprite(carBlip,number)

	if GetEntityHealth(vehicle) == 0 then
		SetEntityAsNoLongerNeeded(vehicle)
		RemoveBlip(carBlip)
		blip = nil
	end

    SetModelAsNoLongerNeeded(vehicleName)
end