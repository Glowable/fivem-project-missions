RegisterNetEvent("spawnPlayerQub3d", function()
    TriggerEvent("cS.PopupWarning", "~y~Loading~s~", "You are now loading into a Sumo Game.\nPlease wait.", "GlowTM", 10, true)
    TriggerEvent("qub3d:spawncube")
    SetEntityCoords(PlayerPedId(), 3267.2, 1452.37, 295.38, 180.53, true, true, true, false)
    TriggerEvent("qub3d:spawnplayercar")
    TriggerEvent("qub3d:clouds") 



end)

RegisterNetEvent("qub3d:clouds")
AddEventHandler("qub3d:clouds", function()
    Citizen.Wait(9500)
    StartPlayerSwitch(PlayerPedId(), PlayerPedId(), 255, 1)
    BeginTextCommandBusyspinnerOn("CUSTOMLOADSTRR")
    EndTextCommandBusyspinnerOn(4)
    Citizen.Wait(9000)
    TriggerEvent("qub3d:cam1")
    Citizen.Wait(2000) 
    BusyspinnerOff()
    StopPlayerSwitch()
end)

function SpawnAllPlayersQub3d()
    print("spawnqued")
end

RegisterCommand("qubedcam", function()
    TriggerEvent("qub3d:startsequence")
end)

RegisterNetEvent("qub3d:startsequence")
AddEventHandler("qub3d:startsequence", function()

    TriggerEvent("qub3d:explode")
    TriggerEvent("qub3d:openvehiclemenu")
    TriggerEvent("mt:missiontext", "Select your ~b~Vehicle", 100000)
    local time = 30
    while true do
        time = time - 1
        if time == 0 then
            TriggerEvent("qub3d:startsequence2")
            return
        else
        print(time)
        end
        Wait(1000)
    end
end)

RegisterNetEvent("qub3d:startsequence2")
AddEventHandler("qub3d:startsequence2", function()
    TriggerEvent("cS.Countdown", 0, 150, 200, 5, true)
    Citizen.Wait(5000)
    TriggerEvent("mt:missiontext", "Throw the ~r~Enemy Players~w~ off the Island", 100000)
    FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), false)
    TriggerEvent("qub3d:startrotation")
end)
RegisterNetEvent("qub3d:explode")
AddEventHandler("qub3d:explode", function(text, time)
    print("explode event started")
    while true do
        Citizen.Wait(1000)
        local playerPed = GetPlayerPed(-1)
        local playerCoords = GetEntityCoords(playerPed)

        -- Check if player is below z level 0
        if playerCoords.z < 170.5 then
            -- Kill the player and display a message
            NetworkExplodeVehicle(GetVehiclePedIsIn(PlayerPedId(), false), true, true)
        end
    end
end)

RegisterNetEvent("qub3d:cam1")
AddEventHandler("qub3d:cam1", function()
    print("created camera")
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(cam, 3243.22, 1474.78, 307.95)
    SetCamRot(cam, 0.0, 0.0, 230.01, 0.0)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1000, true, false)
    DisplayRadar(false)
    DisplayHud(false)
    Citizen.Wait(5000)
    TriggerEvent('cS.banner', "~o~qub3d~s~", "Knock the Enemy Players off the rotating Cube.", 5, true)

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
    TriggerEvent("qub3d:startsequence")
end)

RegisterNetEvent("qub3d:spawnplayercar")
AddEventHandler("qub3d:spawnplayercar", function()
    local vehicleName = 'nero2'

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

    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, 180.0, true, false)
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



