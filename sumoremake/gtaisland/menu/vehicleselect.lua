RegisterCommand("testopenmenu", function()
    TriggerEvent("sumo:openvehiclemenu")
end)

AddTextEntry("CUSTOMLOADSTR", "Loading Vehicle")


RegisterNetEvent("sumo:spawnnerocustom")
AddEventHandler("sumo:spawnnerocustom", function()
    local vehicleName = 'nero2'

    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = {'Vehicle not recognised: ' .. vehicleName}
        })
        return
    end

    RequestModel(vehicleName)

    while not HasModelLoaded(vehicleName) do
        BeginTextCommandBusyspinnerOn("CUSTOMLOADSTR")
        EndTextCommandBusyspinnerOn(4)
        Citizen.Wait(500)
    end

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    TriggerEvent('wk:deleteVehicle')
    BusyspinnerOff()
    local vehicle = CreateVehicle(vehicleName, 133.59, 7347.34, 9.63, 299.79, true, false)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1) 
	vehicle = AddBlipForEntity(vehicle)
	SetBlipSprite(carBlip,number)

	if GetEntityHealth(vehicle) == 0 then
		SetEntityAsNoLongerNeeded(vehicle)
		RemoveBlip(carBlip)
		blip = nil
	end

    SetModelAsNoLongerNeeded(vehicleName)
    FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), true)
    
end, false)

RegisterNetEvent("sumo:spawnzentorno")
AddEventHandler("sumo:spawnzentorno", function()
    local vehicleName = 'zentorno'

    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = {'Vehicle not recognised: ' .. vehicleName}
        })
        return
    end

    RequestModel(vehicleName)

    while not HasModelLoaded(vehicleName) do
        BeginTextCommandBusyspinnerOn("CUSTOMLOADSTR")
        EndTextCommandBusyspinnerOn(4)
        Citizen.Wait(500)
    end

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    TriggerEvent('wk:deleteVehicle')
    BusyspinnerOff()
    local vehicle = CreateVehicle(vehicleName, 133.59, 7347.34, 9.63, 299.79, true, false)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1) 
	vehicle = AddBlipForEntity(vehicle)
	SetBlipSprite(carBlip,number)

	if GetEntityHealth(vehicle) == 0 then
		SetEntityAsNoLongerNeeded(vehicle)
		RemoveBlip(carBlip)
		blip = nil
	end

    SetModelAsNoLongerNeeded(vehicleName)
    FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), true)
    
end, false)

RegisterNetEvent("sumo:spawncyclone")
AddEventHandler("sumo:spawncyclone", function()
    local vehicleName = 'cyclone'

    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = {'Vehicle not recognised: ' .. vehicleName}
        })
        return
    end

    RequestModel(vehicleName)

    while not HasModelLoaded(vehicleName) do
        BeginTextCommandBusyspinnerOn("CUSTOMLOADSTR")
        EndTextCommandBusyspinnerOn(4)
        Citizen.Wait(500)
    end

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    TriggerEvent('wk:deleteVehicle')
    BusyspinnerOff()
    local vehicle = CreateVehicle(vehicleName, 133.59, 7347.34, 9.63, 299.79, true, false)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1) 
	vehicle = AddBlipForEntity(vehicle)
	SetBlipSprite(carBlip,number)

	if GetEntityHealth(vehicle) == 0 then
		SetEntityAsNoLongerNeeded(vehicle)
		RemoveBlip(carBlip)
		blip = nil
	end

    SetModelAsNoLongerNeeded(vehicleName)
    FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), true)
    
end, false)

RegisterNetEvent("sumo:spawnkamacho")
AddEventHandler("sumo:spawnkamacho", function()
    local vehicleName = 'kamacho'

    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = {'Vehicle not recognised: ' .. vehicleName}
        })
        return
    end

    RequestModel(vehicleName)

    while not HasModelLoaded(vehicleName) do
        BeginTextCommandBusyspinnerOn("CUSTOMLOADSTR")
        EndTextCommandBusyspinnerOn(4)
        Citizen.Wait(500)
    end

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    TriggerEvent('wk:deleteVehicle')
    BusyspinnerOff()
    local vehicle = CreateVehicle(vehicleName, 133.59, 7347.34, 9.63, 299.79, true, false)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1) 
	vehicle = AddBlipForEntity(vehicle)
	SetBlipSprite(carBlip,number)

	if GetEntityHealth(vehicle) == 0 then
		SetEntityAsNoLongerNeeded(vehicle)
		RemoveBlip(carBlip)
		blip = nil
	end

    SetModelAsNoLongerNeeded(vehicleName)
    FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), true)
    
end, false)