function setSpawn()
    SetEntityCoords(PlayerPedId(), 133.59, 7347.34, 9.63, 299.79, true, true, true, false)
    TriggerEvent("sumo:spawnplayercar")

end

RegisterNetEvent("spawnPlayer", function()
    TriggerEvent("cS.PopupWarning", "~y~Loading~s~", "You are now loading into a Sumo Game. Please wait.", "GlowTM", 10, true)

    setSpawn()
    TriggerEvent("sumo:clouds")

end)

function spawnAllPlayers()
    TriggerServerEvent("spawnAllPlayers")    
end

function spawnEffect()
    print("stuffhappenshere1")
end

RegisterNetEvent("sumo:clouds")
AddEventHandler("sumo:clouds", function()
    Citizen.Wait(9500)
    StartPlayerSwitch(PlayerPedId(), PlayerPedId(), 255, 1)
    Citizen.Wait(9000) 
    StopPlayerSwitch()
    TriggerEvent("sumo:startsequence")
end)

RegisterNetEvent("sumo:startsequence")
AddEventHandler("sumo:startsequence", function()
    TriggerEvent("sumo:abil")
    TriggerEvent("sumo:welcomevl")
    TriggerEvent("sumo:scaleformstart")
    startZone()
    disableKeys()
    print("awaitstart")
    TriggerEvent("cS.Countdown", 0, 150, 200, 5, true)
    InitPowerPlay()
end)




RegisterNetEvent("sumo:spawnplayercar")
AddEventHandler("sumo:spawnplayercar", function()
    local vehicleName = 'adder'

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

    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, 299.79, true, false)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1) 
	vehicle = AddBlipForEntity(vehicle)
	SetBlipSprite(carBlip,number)

	if GetEntityHealth(vehicle) == 0 then
		SetEntityAsNoLongerNeeded(vehicle)
		RemoveBlip(carBlip)
		blip = nil
	end

    SetModelAsNoLongerNeeded(vehicleName)
    
end, false)


