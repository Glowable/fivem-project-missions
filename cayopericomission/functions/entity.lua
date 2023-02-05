function spawnplane()
    print("place sequence started")
    SetEntityCoords(PlayerPedId(), 4164.47, -2548.39, 526.66, 200.87, true, true, true, false)
    modelHash = GetHashKey("a_f_m_bevhills_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
         Wait(1)
    end
  
      pilot = CreatePed(0, modelHash , NPC.x,NPC.y,NPC.z - 1, NPC.rotation, NPC.NetworkSync)
      SetEntityInvincible(pilot, true)
      


      SetModelAsNoLongerNeeded(vehicleName)

    local vehicleName = 'nimbus'

    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = {'Vehicle not recognised: ' .. vehicleName}
        })
        return
    end

    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Citizen.Wait(500)
    end

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)

    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, 200.87, true, false)
    SetPedIntoVehicle(pilot, vehicle, -1)  
    SetPedIntoVehicle(PlayerPedId(), vehicle, 0)
    TaskPlaneMission(pilot, GetVehiclePedIsIn(pilot, false), 0, 0, 5178.2, -5980.21, 365.19, 4, GetVehicleModelMaxSpeed(`velum`), 1.0, 238.0, 360.0, 370.0)
	vehicle = AddBlipForEntity(vehicle)
	SetBlipSprite(vehicle, 1)
    SetBlipColour(vehicle, 2)
    

	if GetEntityHealth(vehicle) == 0 then
		SetEntityAsNoLongerNeeded(vehicle)
		RemoveBlip(carBlip)
		blip = nil
	end
    Citizen.Wait(3000)

    Citizen.Wait(6000)




end

RegisterCommand("spawnlol", function()
    pickup = CreatePickup(GetHashKey("PICKUP_PORTABLE_CRATE_FIXED_INCAR"), -739.64, -15.14, 38.3)
    local blip = AddBlipForCoord(-739.64, -15.14, 38.3)
    SetBlipSprite(blip, 514)
    SetBlipColour(blip, 1)
    SetBlipRoute(blip, true)
    while not HasPickupBeenCollected(pickup) do
        Citizen.Wait(0)
    end
    
    
    print("hello")
    notify("You have collected a ~r~Cocaine Package.")
    RemoveBlip(blip)
end)