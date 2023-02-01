RegisterCommand("intro2", function()
    TriggerEvent("glow:gotobunker")
end)

RegisterNetEvent("glow:gotobunker")
AddEventHandler("glow:gotobunker", function()
    TriggerEvent("cS.MidsizeBanner", "~b~WELCOME TO LOS SANTOS~s~", "Meet Agent 14 at your Bunker", 5, 9, true)
    alert("Go to your ~y~Bunker ~w~to meet Agent 14 ")
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-3155.76, 1376.65, 17.09)
    SetBlipSprite(blip, 557)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-3155.76, 1376.65, 17.09))
        if dist < 2 then
            inArea = true
            print("done")
            TriggerEvent("glow:atbunker")
            RemoveBlip(blip)
            
        end
    end
end)

RegisterNetEvent("glow:atbunker")
AddEventHandler("glow:atbunker", function()
    local e_key = 38
    while true do
        Citizen.Wait(1)
        alert("~g~∑ Press ~INPUT_PICKUP~ to enter your Bunker and meet Agent 14")
        if IsControlJustReleased(38,  e_key --[[ H key ]]) then
            TriggerEvent("glow:bunkercut")
            break
            
        end
    end
end)



RegisterNetEvent("glow:bunkercut")
AddEventHandler("glow:bunkercut", function()
    RequestCutscene('bunk_int', 8) -- Usually 8.
    DoScreenFadeOut(1000)
    Citizen.Wait(8500)
    DoScreenFadeIn(1000)
    
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



end)

RegisterCommand("rappell", function()
    local coords = vector3(258.68, -3311.5, 45.72)
    RopeLoadTextures()
    SetEntityCoords(PlayerPedId(), coords - vector3(0, 0, 10.0))
    local ropeId = AddRope(coords, -90.0, 90.0, -90.0, 78.0, 7, 78.0, 78.0, 5.2, false, false, true, 10.0, false, 0)
    TaskRappelDownWall(PlayerPedId(), coords, coords, -130.0, ropeId, "clipset@anim_heist@hs3f@ig1_rappel@male", 1)
    N_0xa1ae736541b0fca3(ropeId, true)
    PinRopeVertex(ropeId, (GetRopeVertexCount(ropeId) - 1), coords + vector3(0, 0, 1.0))
    RopeSetUpdateOrder(ropeId, 0)
end)

RegisterCommand('sf_drilling', function(...)
    TriggerEvent("Drilling:Start",function(success)
      if (success) then
        print("Drilling complete.")
      else
        print("Drilling failed.")
      end
    end)
end)

