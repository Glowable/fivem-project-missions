
RegisterCommand("startcayomis", function()
    TriggerEvent("glow:startcayo")

end)

RegisterNetEvent("glow:startcayo")
AddEventHandler("glow:startcayo", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-1037.75, -2736.93, 20.17)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-1037.75, -2736.93, 20.17))
        if dist < 2 then
            inArea = true
            print("done")
            RemoveBlip(blip)
            TriggerEvent("glow:arrivelsia")
            
        end
    end
end)

RegisterNetEvent("glow:arrivelsia")
AddEventHandler("glow:arrivelsia", function()
    local e_key = 38
    while true do
        Citizen.Wait(1)
        alert("∑ Press ~INPUT_PICKUP~ to board the ~b~Plane ~s~and travel to ~b~Cayo Perico")
        if IsControlJustReleased(38,  e_key --[[ H key ]]) then
            TriggerEvent("glow:cayocam1")
            break
            
        end
    end
end)

RegisterNetEvent("glow:cutsceneleave")
AddEventHandler("glow:cutsceneleave", function()
    RequestCutscene('hs4_lsa_take_nimb2', 128, 64) -- Usually 8.
    
    while not (HasCutsceneLoaded()) do
        Wait(0)
    end
    -- Sets current player ped as cutscene mp ped.
    SetCutsceneEntityStreamingFlags('MP_1', 0, 1)
    RegisterEntityForCutscene(PlayerPedId(), 'MP_1', 0, 0, 64)

    StartCutscene(0)
    -- Waiting for the cutscene to spawn the mp ped.
    while not (DoesCutsceneEntityExist('MP_1', 0)) do
        Wait(0)
    end

    -- Set the clothing you want on the cutscene ped.
    SetPedComponentVariation(PlayerPedId(), componentId, drawableId, textureId, paletteId)

    while not (HasCutsceneFinished()) do
        Wait(0)
    end

    fadeshortlong()
end)



RegisterNetEvent( "glow:cayocam1" )
AddEventHandler( "glow:cayocam1", function()
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
    DoScreenFadeOut(500)
    DisplayRadar(true)
    DisplayHud(true)
    RenderScriptCams(false, true, 1000, true, false)
    DestroyCam(cam, true)
    Citizen.Wait(6000)
    DoScreenFadeIn(500)
    TriggerEvent("glow:cutsceneleave")
end)



RegisterCommand("testingplane", function()
    local playerPed = GetPlayerPed(-1) 
        TaskPlaneMission(playerPed, GetVehiclePedIsIn(PlayerPedId(), false), 0, 0, 5178.2, -5980.21, 365.19, 4, GetVehicleModelMaxSpeed(`velum`), 1.0, 238.0, 360.0, 370.0)
end)




