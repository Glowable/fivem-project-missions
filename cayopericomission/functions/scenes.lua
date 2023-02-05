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
    Citizen.Wait(7000)
    jumpoutplane()
    TriggerEvent("glow:missionland")
end

RegisterNetEvent("glow:missionland")
AddEventHandler("glow:missionland", function()
    TriggerEvent("mt:missiontext", "Jump out the ~g~Plane ~s~and land on ~b~Cayo Perico", 500000)
end)

local NPC = { x = -2962.72, y = 483.09, z = 15.7, rotation = 268, NetworkSync = true}



function jumpoutplane()
    alert("Press ~INPUT_VEH_EXIT~ to jump out the Plane")
end
