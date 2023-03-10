function cayocam1()
    TriggerEvent("mt:missiontext", "", 500000)
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

RegisterCommand("aftercutscene", function()
    cutscene1()
end)

RegisterCommand("cinematicshot", function()
    local player = PlayerPedId()
    CreateCinematicShot(`CAMERA_MAN_SHOT`, 10000, player,player)
end)

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
    local player = PlayerPedId()
    CreateCinematicShot(`CAMERA_MAN_SHOT`, 10000, player,player)
    DoScreenFadeIn(1000)
    Citizen.Wait(500)
    startRaceIntro()
    Citizen.Wait(4000)
    TriggerEvent("glow:optionalvehicle")
    arrivedtodrug()
    TriggerEvent("glow:missionland")
end




function arrivedtodrug()
    TriggerEvent("mt:missiontext", "Go to the ~y~Port", 500000)
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(4984.2, -5193.32, 2.5)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(4984.2, -5193.32, 2.5))
        if dist < 140.6 then
            inArea = true
            print("done")
            RemoveBlip(blip)
            spawncocaine()
        end
    end
end


function jumpoutplane()
    alert("Press ~INPUT_VEH_EXIT~ to jump out the Plane")
end

RegisterCommand("spawnoptional", function()
    spawnoptionalvehicle()
end)
