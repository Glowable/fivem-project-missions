function setSpawn()
    SetEntityCoords(PlayerPedId(), 133.59, 7347.34, 9.63, 299.79, true, true, true, false)
    TriggerEvent("sumo:spawnplayercar")
    FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), true)
end

RegisterNetEvent("spawnPlayer", function()
    TriggerEvent("cS.PopupWarning", "~y~Loading~s~", "You are now loading into a Sumo Game. Please wait.", "GlowTM", 10, true)


    TriggerEvent("sumo:clouds")
    setSpawn()

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
    TriggerEvent("sumo:cam1")
    Citizen.Wait(2000) 
    StopPlayerSwitch()
end)

RegisterNetEvent("sumo:startsequence")
AddEventHandler("sumo:startsequence", function()
    TriggerEvent("sumo:abil")
    TriggerEvent("sumo:welcomevl")
    TriggerEvent("sumo:startzone")
    disableKeys()
    print("awaitstart")
    TriggerEvent("cS.Countdown", 0, 150, 200, 5, true)
    Citizen.Wait(5000)
    TriggerEvent("sumo:scaleformstart")
    InitPowerPlay()
    FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), false)
end)



RegisterNetEvent("sumo:cam1")
AddEventHandler("sumo:cam1", function()
    print("created camera")
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(cam, 213.37, 7395.11, 150.11)
    SetCamRot(cam, -90.0, 0.0, 45.01, 0.0)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1000, true, false)
    DisplayRadar(false)
    DisplayHud(false)
    Citizen.Wait(5000)
    TriggerEvent('cS.banner', "~o~SUMO X POWERPLAY~s~", "Knock the Enemy Players off the Island.", 5, true)

    Citizen.Wait(10000)
    DoScreenFadeOut(20)
    DisplayRadar(true)
    DisplayHud(true)
    RenderScriptCams(false, true, 1000, true, false)
    DestroyCam(cam, true)
    print("destroyed camera")
    Citizen.Wait(2000)
    DoScreenFadeIn(1000)
    Citizen.Wait(3000)
    TriggerEvent("sumo:startsequence")
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


RegisterCommand("testsumocam", function()
    TriggerEvent("sumo:cam1")
end)