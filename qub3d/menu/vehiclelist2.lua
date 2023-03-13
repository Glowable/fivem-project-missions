AddTextEntry("CUSTOMLOADSTR", "Loading Vehicle")


RegisterNetEvent("qub3d:spawnnerocustom2")
AddEventHandler("qub3d:spawnnerocustom2", function()
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
    local vehicle = CreateVehicle(vehicleName, 3269.18, 1451.37, 309.38, 180.53, true, false)
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

RegisterNetEvent("qub3d:spawnzentorno2")
AddEventHandler("qub3d:spawnzentorno2", function()
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
    local vehicle = CreateVehicle(vehicleName, 3269.18, 1451.37, 309.38, 180.53, true, false)
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

RegisterNetEvent("qub3d:spawncyclone2")
AddEventHandler("qub3d:spawncyclone2", function()
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
    local vehicle = CreateVehicle(vehicleName, 3269.18, 1451.37, 309.38, 180.53, true, false)
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

RegisterNetEvent("qub3d:spawnkamacho2")
AddEventHandler("qub3d:spawnkamacho2", function()
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
    local vehicle = CreateVehicle(vehicleName, 3269.18, 1451.37, 309.38, 180.53, true, false)
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
