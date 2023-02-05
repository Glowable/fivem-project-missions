function cayocam1()
    print("created camera")
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(cam, -1039.14, -2730.64, 24.6, 345)
    SetCamRot(cam, 0.1, 0.0, 180.01, 5)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1000, true, false)
    DisplayRadar(false)
    DisplayHud(false)

    local playerPed = GetPlayerPed(-1) 
 
    local coords = { x = -1045.14, y = -2750.44, z = 21.36, heading = 88.09 }
    TaskGoStraightToCoord(playerPed, coords.x, coords.y, coords.z,1.0,8000,88.67,0)
    Citizen.Wait(8000)
    ClearPedTasks(PlayerPedId())
    DisplayRadar(true)
    DisplayHud(true)
    RenderScriptCams(false, true, 1000, true, false)
    DestroyCam(cam, true)
    print ("destroyed camera")
    cutscene1()
end

function cutscene1()
    RequestCutscene('hs4_lsa_take_nimb2', 128, 64) -- Usually 8.
    
    while not (HasCutsceneLoaded()) do
        DoScreenFadeOut(500)
        Wait(0)
    end
    -- Sets current player ped as cutscene mp ped.
    SetCutsceneEntityStreamingFlags('MP_1', 0, 1)
    RegisterEntityForCutscene(PlayerPedId(), 'MP_1', 0, 0, 64)

    StartCutscene(0)
    print("started cutscene")
    DoScreenFadeIn(500)
    -- Waiting for the cutscene to spawn the mp ped.
    while not (DoesCutsceneEntityExist('MP_1', 0)) do
        Wait(0)
    end

    -- Set the clothing you want on the cutscene ped.
    SetPedComponentVariation(PlayerPedId(), componentId, drawableId, textureId, paletteId)

    while not (HasCutsceneFinished()) do
        Wait(0)
    end

    DoScreenFadeOut(20)
    spawnplane()
    Citizen.Wait(6000)
    DoScreenFadeIn(1000)
    Citizen.Wait(500)
    startRaceIntro()
    Citizen.Wait(14000)
    TriggerEvent("cS.MidsizeBanner", "~b~BE PREPARED TO JUMP~w~", "~r~Be prepared to jump out the ~g~Plane", 5, 9, true)
end

local NPC = { x = -2962.72, y = 483.09, z = 15.7, rotation = 268, NetworkSync = true}

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

    
    if IsPedJumpingOutOfVehicle(PlayerPedId()) then
        Citizen.Wait(0)
        print("await")
    end

    while not IsPedInVehicle(PlayerPedId(), vehicle, false) do
        Citizen.Wait(0)
        print("jumped")
    end


end