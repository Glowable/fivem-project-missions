function spawnplane()
    print("place sequence started")
    SetEntityCoords(PlayerPedId(), 4164.47, -2548.39, 526.66, 200.87, true, true, true, false)
    modelHash = GetHashKey("a_f_m_bevhills_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
         Wait(1)
    end
  
      pilot = CreatePed(0, modelHash , 1.1, 2.3, 4.5 - 1, 20.1, true)
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

function spawncocaine()

    pickup1 = CreatePickupRotate(GetHashKey("PICKUP_PORTABLE_CRATE_FIXED_INCAR"), 4924.5, -5245.88, 2.60, 180.1, 180.1, 210.1)
    pickup2 = CreatePickupRotate(GetHashKey("PICKUP_PORTABLE_CRATE_FIXED_INCAR"), 4836.01, -5173.27, 1.42, 90.1, 180.1, 90.1)
    pickup3 = CreatePickupRotate(GetHashKey("PICKUP_PORTABLE_CRATE_FIXED_INCAR"), 4962.65, -5106.74, 3.11, 180.1, 180.1, 150.1)
    pickup4 = CreatePickupRotate(GetHashKey("PICKUP_PORTABLE_CRATE_FIXED_INCAR"), 5001.67, -5190.77, 2.9, 90.1, 180.1, 90.1)

    local blip1 = AddBlipForCoord(4924.5, -5245.88, 2.70)
    local blip2 = AddBlipForCoord(4836.01, -5173.27, 2.12)
    local blip3 = AddBlipForCoord(4962.65, -5106.74, 3.91)
    local blip4 = AddBlipForCoord(5001.67, -5190.77, 2.9)
    SetBlipSprite(blip1, 514)
    SetBlipSprite(blip2, 514)
    SetBlipSprite(blip3, 514)
    SetBlipSprite(blip4, 514)
    SetBlipColour(blip1, 3)
    SetBlipColour(blip2, 3)
    SetBlipColour(blip3, 3)
    SetBlipColour(blip4, 3)
    SetBlipRoute(blip1, false)
    SetBlipRoute(blip2, false)
    SetBlipRoute(blip3, false)
    SetBlipRoute(blip4, false)

    totalPickups = 0

    while true do

        if HasPickupBeenCollected(pickup1) then
            totalPickups = totalPickups + 1


            print(totalPickups)
            TriggerEvent("cS.MidsizeBanner", "~b~PACKAGE COLLECTED~w~", "", 5, 9, true)
            notify("You have collected a ~b~Cocaine Package.")
            RemoveBlip(blip1)
        end

        if HasPickupBeenCollected(pickup2) then
            totalPickups = totalPickups + 1


            print(totalPickups)
            TriggerEvent("cS.MidsizeBanner", "~b~PACKAGE COLLECTED~w~", "", 5, 9, true)
            notify("You have collected a ~b~Cocaine Package.")
            RemoveBlip(blip2)
        end

        if HasPickupBeenCollected(pickup3) then
            totalPickups = totalPickups + 1


            print(totalPickups)
            TriggerEvent("cS.MidsizeBanner", "~b~PACKAGE COLLECTED~w~", "", 5, 9, true)
            notify("You have collected a ~b~Cocaine Package.")
            RemoveBlip(blip3)
        end

        if HasPickupBeenCollected(pickup4) then
            totalPickups = totalPickups + 1


            print(totalPickups)
            TriggerEvent("cS.MidsizeBanner", "~b~PACKAGE COLLECTED~w~", "", 5, 9, true)
            notify("You have collected a ~b~Cocaine Package.")
            RemoveBlip(blip4)
        end

        if totalPickups == 4 then
            print("all collected")
            TriggerEvent("cS.MidsizeBanner", "~b~PACKAGE COLLECTED~w~", "", 5, 9, true)
            alert("~r~COLLECTED!!!")
            break
        end

        Citizen.Wait(0)
    end

    
    RemoveBlip(blip)
end

function spawnoptionalvehicle()
    print("optional vehicle spawned")
    alert("A vehicle is recommended for this Mission, Lester has sourced you one on your minimap")

    local vehicleName = 'vagrant'

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

    local vehicle = CreateVehicle(vehicleName, 5121.13, -4564.68, 3.7, 200.87, true, false)
	vehicle = AddBlipForEntity(vehicle)
	SetBlipSprite(vehicle, 225)
    SetBlipColour(vehicle, 5)
    

	if GetEntityHealth(vehicle) == 0 then
		SetEntityAsNoLongerNeeded(vehicle)
		RemoveBlip(carBlip)
		blip = nil
	end
    Citizen.Wait(3000)

    Citizen.Wait(6000)




end