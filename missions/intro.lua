

---npcs

locations = {
    {
        pos={x=-2936.7, y=461.38, z=15.35},
        tpto={x=-2936.7, y=461.38, z=15.35},
        submarker= {
            marker = 29,
            posz = 15.25,
        },
        marker= 1,--[[ get markers here: https://docs.fivem.net/docs/game-references/markers/ ]]
        scale = 3.0,
        rgba = {120, 255, 120,155}
    },
    {
        pos={x=4483.51, y=-4464.64, z=5.19},
        tpto={x=4446.91, y=-4480.14, z=4.29},
        submarker= {
            marker = 29,
            posz = 15.25,
        },
        marker= 1,--[[ get markers here: https://docs.fivem.net/docs/game-references/markers/ ]]
        scale = 3.0,
        rgba = {120, 255, 120,155}
    },
}

Citizen.CreateThread(
    function()
		local e_key = 38
        while true do
            Citizen.Wait(1)
            for i = 1, #locations, 1 do
                loc = locations[i]
                -- https://runtime.fivem.net/doc/natives/?_0x28477EC23D892089
                DrawMarker(
                    loc.marker,
                    loc.pos.x,
                    loc.pos.y,
                    loc.pos.z-0.75,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    loc.scale,
                    loc.scale,
                    loc.scale,
                    loc.rgba[1],
                    loc.rgba[2],
                    loc.rgba[3],
                    loc.rgba[4],
                    false,
                    true,
                    2,
                    nil,
                    nil,
                    false
                )
                if loc.submarker ~= nil then DrawMarker(
                    loc.submarker.marker,loc.pos.x,loc.pos.y,loc.submarker.posz,
                    0.0,0.0,0.0,0.0,0.0,0.0,
                    loc.scale/2,loc.scale/2,loc.scale/2,
                    loc.rgba[1],loc.rgba[2],loc.rgba[3],loc.rgba[4],
                    false,true,2,nil,nil,false) end
                local playerCoord = GetEntityCoords(PlayerPedId(), false)
                local locVector = vector3(loc.pos.x, loc.pos.y, loc.pos.z)
                if Vdist2(playerCoord, locVector) < loc.scale*1.12 then
						alert("Press ~INPUT_VEH_HEADLIGHT~ to start the Introduction")
						if IsControlJustReleased(2, 38, e_key) then
                            alert("Worked")
					end
                end
            end
        end
    end
)



RegisterNetEvent( "glow:keypress" )
AddEventHandler( "glow:keypress", function()
    local e_key = 38
    while true do
        Citizen.Wait(1)
        alert("~b~Press ~INPUT_PICKUP~ to start your journey.")
        if IsControlJustReleased(38,  e_key --[[ H key ]]) then
            print("hello")
            TriggerEvent("glow:fadescreen")
            break
        end
    end
end)




RegisterNetEvent("glow:slowmo")
AddEventHandler("glow:slowmo", function()
    SetSpecialAbility(PlayerId(), 2, 1)
    SpecialAbilityActivate(PlayerId(), 1)
    AnimpostfxPlay('SwitchOpenMichaelIn', 500, true)
    TriggerEvent("cS.MidsizeBanner", "~b~DEAD EYE~w~", "~r~SPRAY AND PRAY", 5, 9, true)
    Citizen.Wait(10000)
    AnimpostfxStopAll()
    SpecialAbilityDeactivateFast(PlayerId(), 1)
end)

RegisterCommand("walkto", function()
    local playerPed = GetPlayerPed(-1) 
 
    local coords = { x = -2968.77, y = 483.09, z = 15.47, heading = 88.09 }
    TriggerEvent("glow:fle1")
    TriggerEvent("glow:fle2")
    alert "Your ~r~Dead Eye~w~ ability is about to be enabled. This can be used to slow down time."
    SetEntityCoords(PlayerPedId(), -2963.41, 483.05, 15.7, 89.87, true, true, true, false)
    TaskGoStraightToCoord(playerPed, coords.x, coords.y, coords.z,1.0,8000,88.67,0)
    Citizen.Wait(8000)
    TriggerEvent("glow:slowmo")

end)



RegisterNetEvent("glow:introclouds")
AddEventHandler("glow:introclouds", function()
    StartPlayerSwitch(PlayerPedId(), PlayerPedId(), 255, 1)
    Citizen.Wait(25000) 
    StopPlayerSwitch()
end)

RegisterCommand("stopclouds", function()
    StopPlayerSwitch()
end)

RegisterCommand("startintro", function()
    
    TriggerEvent("glow:camera")
end)

RegisterCommand("startdriving", function()
    TriggerEvent("glow:startdriving")
end)





RegisterCommand("clearped", function()
    ClearPedTasks(PlayerPedId())
end)

---starting intro

RegisterNetEvent( "glow:camera" )
AddEventHandler( "glow:camera", function()
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(cam, -2971.18, 471.23, 17.29, 345)
    SetCamRot(cam, 50, 0.0, -50.01, 5)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1000, true, false)
    SetEntityCoords(PlayerPedId(), -2973.87, 482.28, 15.26, 148, true, true, true, false)
    DisplayRadar(false)
    DisplayHud(false)
    local enter_key = 191
    local space_key = 18
    while true do
        Citizen.Wait(1)
        alert("~y~∑ Introduction: The Fleeca Bank Heist\n~r~Press ~INPUT_FRONTEND_RDOWN~ to Start")
        if IsControlJustReleased(191,  enter_key --[[ H key ]]) then
            print("hello")
            DoScreenFadeOut(1000)
            Citizen.Wait(2500)
            SetEntityCoords(PlayerPedId(), 472.68, 12.88, 87.21, 148, true, true, true, false)
            TriggerEvent("glow:spawnkuruma")
            RenderScriptCams(false, true, 1000, true, false)
            DestroyCam(cam, true)	
            Citizen.Wait(2500) 
            DoScreenFadeIn(1000)
            TriggerEvent("glow:clouds")  
            TriggerEvent("glow:startdriving")
            TriggerEvent("glow:destination")
            DisplayRadar(true)
            DisplayHud(true)
            break
            
        end

        if IsControlJustReleased(18,  space_key --[[ H key ]]) then
            TriggerEvent("cS.PopupWarning", "~r~Returning to Free Roam~s~", "To play, press M and navigate to the Missions Section", "CHECK 1: RETURN TO FREEROAM", 5, true)
            RenderScriptCams(false, true, 1000, true, false)
            DestroyCam(cam, true)
            Citizen.Wait(5000)
            TriggerEvent("glow:clouds")
            DisplayRadar(true)
            DisplayHud(true) 	
            break
        end
    end


end)



RegisterNetEvent( "glow:camera2" )
AddEventHandler( "glow:camera2", function()
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(cam, 521.26, 94.81, 146.44, 154.25)
    SetCamRot(cam, -50.0, 0.0, 150.0, 2)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1000, true, false)

    Wait(4500)

    RenderScriptCams(false, true, 1000, true, false)
    DestroyCam(cam, true)
end)

---driving part

RegisterNetEvent( "glow:startdriving" )
AddEventHandler( "glow:startdriving", function()
    local playerPed = GetPlayerPed(-1) 
    TriggerEvent("glow:voiceline1")
    TaskVehicleDriveToCoordLongrange(
	playerPed --[[ Ped ]], 
	GetVehiclePedIsIn(PlayerPedId(), false) --[[ Vehicle ]], 
	-2973.91 --[[ number ]], 
	483.72 --[[ number ]], 
	15.27 --[[ number ]], 
	50.0 --[[ number ]], 
	524300 --[[ integer ]], 
	20.0 --[[ number ]]
)
    SetAudioFlag("WantedMusicDisabled", true)
    PrepareMusicEvent("MP_MC_START_HEIST_FIN_NEW")
    Citizen.Wait(100)
    TriggerMusicEvent("MP_MC_START_HEIST_FIN_NEW")
    Citizen.Wait(100)
    PrepareMusicEvent("MP_MC_SUSPENSE_HFIN")
    Citizen.Wait(100)
    TriggerMusicEvent("MP_MC_SUSPENSE_HFIN")
    Citizen.Wait(9000)
    TriggerEvent("cS.MidsizeBanner", "~r~be prepared to take over vehicle~s~", "Be prepared to have full control of the vehicle", 5, 9, true)
    Citizen.Wait(10000)
    TriggerEvent("cS.Countdown", 0, 150, 200, 5, true)
    Citizen.Wait(5000)
    ClearPedTasks(PlayerPedId())
    alert("You now have complete full control of the ~b~Vehicle.\n~w~Drive to the ~y~Fleeca Bank")
    Citizen.Wait(7000)
    TriggerEvent("glow:voiceline2")

end)

local vehicle = nil
RegisterNetEvent( "glow:spawnkuruma" )
AddEventHandler( "glow:spawnkuruma", function()
    local vehicleName = 'kuruma2'

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

    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)
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

RegisterCommand("getis", function()
    if not GetIsVehicleEngineRunning(vehicle) then
        Citizen.Wait(1)
        print("hello1")
    else 
        print("hello")
    end 
end)

RegisterCommand("unfreeze", function()
    FreezeEntityPosition(PlayerPedId(), false)
end)

RegisterCommand("destination", function()
    TriggerEvent("glow:destination")
end)

RegisterNetEvent("glow:destination")
AddEventHandler("glow:destination", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-2973.91, 483.72, 15.27)
    SetBlipSprite(blip, 814)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-2973.91, 483.72, 15.27))
        if dist < 2 then
            inArea = true
            print("done")
            RemoveBlip(blip)
            FreezeEntityPosition(vehicle, true)
            TriggerEvent("glow:voiceline3")
            TriggerEvent("glow:enterbank")
            TriggerEvent("glow:spawnpeds")
        end
    end
end)

RegisterCommand("testprompt", function()
    TriggerEvent("glow:entervault")
end)

--entering the bank and stealing the cash
RegisterNetEvent("glow:enterbank")
AddEventHandler("glow:enterbank", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-2957.74, 481.09, 15.71)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-2957.74, 481.09, 15.71))
        if dist < 2 then
            inArea = true
            print("done")
            RemoveBlip(blip)
            TriggerEvent("glow:entervault")
            TriggerEvent("glow:voiceline4")
            
        end
    end
end)


RegisterNetEvent("glow:entervault")
AddEventHandler("glow:entervault", function()
    local e_key = 38
    while true do
        Citizen.Wait(1)
        alert("~r~∑ Press ~INPUT_PICKUP~ to enter the Vault")
        if IsControlJustReleased(38,  e_key --[[ H key ]]) then
            DoScreenFadeOut(1000)
            Citizen.Wait(2000)
            SetEntityCoords(PlayerPedId(), -2957.68, 483.05, 15.68, 358.77, true, true, true, false)
            DoScreenFadeIn(1000)
            print("hello")
            TriggerEvent("glow:gotohack")
            break
            
        end
    end
end)

RegisterNetEvent("glow:gotohack")
AddEventHandler("glow:gotohack", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-2953.15, 484.31, 15.68)
    SetBlipSprite(blip, 619)
    SetBlipColour(blip, 1)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-2953.15, 484.31, 15.68))
        if dist < 2 then
            inArea = true
            print("done")
            RemoveBlip(blip)
            TriggerEvent("glow:gotohack1")
            
        end
    end
end)


RegisterNetEvent("glow:gotohack1")
AddEventHandler("glow:gotohack1", function()
    local e_key = 38
    while true do
        Citizen.Wait(1)
        alert("~y~∑ Press ~INPUT_PICKUP~ to clone the Fingerprint")
        if IsControlJustReleased(38,  e_key --[[ H key ]]) then
            TriggerEvent("glow:voiceline5")
            TriggerEvent("utk_fingerprint:Start", 2, 6, 2, function(outcome, reason)
                if outcome == true then
                    print("Success!!")
                    TriggerEvent("glow:leavevault")
                    TriggerEvent("glow:voiceline6")
                elseif outcome == false then
                    print("Failed! Reason: "..reason)
                end
            end)
        break
        end
    end
end)

RegisterNetEvent("glow:leavevault")
AddEventHandler("glow:leavevault", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-2957.74, 483.48, 15.71)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-2957.74, 483.48, 15.71))
        if dist < 2 then
            inArea = true
            print("done")
            TriggerEvent("glow:leavevault1")
            RemoveBlip(blip)
            
        end
    end
end)

RegisterNetEvent("glow:leavevault1")
AddEventHandler("glow:leavevault1", function()
    local e_key = 38
    while true do
        Citizen.Wait(1)
        alert("~r~∑ Press ~INPUT_PICKUP~ to leave the Vault")
        if IsControlJustReleased(38,  e_key --[[ H key ]]) then
            DoScreenFadeOut(1000)
            Citizen.Wait(2000)
            SetEntityCoords(PlayerPedId(), -2957.74, 481.09, 15.71, 358.77, true, true, true, false)
            DoScreenFadeIn(1000)
            TriggerEvent("glow:gobacktokuruma")
            break
            
        end
    end
end)

RegisterCommand("backto", function()
    TriggerEvent("glow:gobacktokuruma")
end)

RegisterNetEvent("glow:gobacktokuruma")
AddEventHandler("glow:gobacktokuruma", function()
    SetAudioFlag("WantedMusicDisabled", true)
    PrepareMusicEvent("MP_MC_ACTION_HFIN")
    Citizen.Wait(100)
    TriggerMusicEvent("MP_MC_ACTION_HFIN")
    SetPlayerWantedLevel(PlayerId(), 5, false)
    SetPlayerWantedLevelNow(PlayerId(), false)
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-2973.91, 483.72, 15.27)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-2973.91, 483.72, 15.27))
        if dist < 2 then
            inArea = true
            print("done")
            RemoveBlip(blip)
            TriggerEvent("glow:headtoheli")
        end
    end
end)



RegisterNetEvent("glow:headtoheli")
AddEventHandler("glow:headtoheli", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-2701.15, 2347.92, 16.96)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    TriggerEvent("glow:voiceline7")
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-2701.15, 2347.92, 16.96))
        if dist < 7 then
            inArea = true
            print("done")
            RemoveBlip(blip)
            TriggerEvent("glow:voiceline9")
            TriggerEvent("cS.MidsizeBanner", "~y~HELICOPTER INBOUND~s~", "", 5, 9, true)
            TriggerEvent("glow:escapecut")
        end
    end
end)



RegisterCommand("pleasework", function()
    SetPlayerWantedLevel(PlayerId(), 5, false)
    SetPlayerWantedLevelNow(PlayerId(), false)
end)
    ----cutscenes
RegisterNetEvent("glow:escapecut")
AddEventHandler("glow:escapecut", function()
    Citizen.Wait(10000)
    SetPlayerWantedLevel(PlayerId(), 0, false)
    SetPlayerWantedLevelNow(PlayerId(), false)
    CancelMusicEvent("MP_MC_ACTION_HFIN")
    RequestCutscene('mph_tut_ext', 8) -- Usually 8.
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

    TriggerEvent("glow:celebration")

end)

RegisterCommand("celeb", function()
    TriggerEvent("glow:celebration")
end)

RegisterNetEvent("glow:stats")
AddEventHandler("glow:stats", function()
    --All 4 tables are required in order to proprer syncronize the scaleform.
    local _initialText = { --first slide. Consists of 3 text lines.
        missionTextLabel = "~y~HEIST~s~", 
        passFailTextLabel = "PASSED.",
        messageLabel = "",
    }
    local _table = { --second slide. You can add as many "stats" as you want. They will appear from botton to top, so keep that in mind.
        {stat = "Total Payout", value = "~g~$~s~100000"},
        --{stat = "value3", value = "~g~$~s~50000"},
        --{stat = "value2", value = "~b~1999~s~"},
        --{stat = "value1", value = "TEST"},
    }
    local _money = { --third slide. Incremental money. It will start from startMoney and increment to finishMoney. top and bottom text appear above/below the money string.
        startMoney = 0,
        finishMoney = 100000,
        topText = "Money Taken",
        bottomText = "test",
        rightHandStat = "test",
        rightHandStatIcon = 1, --0 or 1 = checked, 2 = X, 3 = no icon
    }
    local _xp = { --fourth and final slide. XP Bar slide. Will start with currentRank and a xp bar filled with (xpBeforeGain - minLevelXP) and will add xpGained. If you rank up, it goes to "Level Up" slide.
        xpGained = 10000,
        xpBeforeGain = 1400,
        minLevelXP = 600,
        maxLevelXP = 2360,
        currentRank = 1,
        nextRank = 2,
        rankTextSmall = "LEVEL UP.",
        rankTextBig = "~b~Nice.~s~",
    }
    TriggerEvent("cS.HeistFinale", _initialText, _table, _money, _xp, 15, true)
end)

RegisterNetEvent("glow:celebration")
AddEventHandler("glow:celebration", function()
    RequestCutscene('apa_fin_cel_apt2', 8) -- Usually 8.
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
    TriggerEvent("glow:stats")
    -- Waiting for the cutscene to spawn the mp ped.
    while not (DoesCutsceneEntityExist('MP_1', 0)) do
        Wait(0)
    end

    -- Set the clothing you want on the cutscene ped.
    SetPedComponentVariation(PlayerPedId(), componentId, drawableId, textureId, paletteId)

    while not (HasCutsceneFinished()) do
        Wait(0)
    end

    DoScreenFadeOut(1000)
    Citizen.Wait(5000)
    DoScreenFadeIn(1000)
    SetEntityCoords(PlayerPedId(), 266.06, 327.05, 105.53, 22.78, true, true, true, false)
    Citizen.Wait(5000)
    TriggerEvent("glow:gotobunker")

end)

--voice lines

RegisterNetEvent("glow:voiceline1")
AddEventHandler("glow:voiceline1", function()
    local dialogue = {
        gxt = "tufin", -- GXT name
        line = "TUFIN_SETOFF", -- Line name without 1A lines and such
        speakers = {
            ["3"] = "LESTER", -- Speakers, required, based on SL. needs to be accurate
        },
        peds = nil,
        --[[peds = {
            ["2"] = PlayerPedId(), -- You can provide the ped to play this on (for facial anims), otherwise it'll generate invisible unnetworked peds attached to the player
        },]]
        forcePedsVisible = false, -- used for debugging purposes only, optional
        phoneCall = false, -- optional, disables fading out with distance
        forceRadio = false, -- optional, enables radio filter
    }
    exports['DialogueController']:startDialogueJson(json.encode(dialogue))
end)

RegisterNetEvent("glow:voiceline2")
AddEventHandler("glow:voiceline2", function()
    local dialogue = {
        gxt = "tufin", -- GXT name
        line = "TUFIN_ONWAY", -- Line name without 1A lines and such
        speakers = {
            ["3"] = "LESTER", -- Speakers, required, based on SL. needs to be accurate
        },
        peds = nil,
        --[[peds = {
            ["2"] = PlayerPedId(), -- You can provide the ped to play this on (for facial anims), otherwise it'll generate invisible unnetworked peds attached to the player
        },]]
        forcePedsVisible = false, -- used for debugging purposes only, optional
        phoneCall = false, -- optional, disables fading out with distance
        forceRadio = false, -- optional, enables radio filter
    }
    exports['DialogueController']:startDialogueJson(json.encode(dialogue))
end)

RegisterNetEvent("glow:voiceline3")
AddEventHandler("glow:voiceline3", function()
    local dialogue = {
        gxt = "tufin", -- GXT name
        line = "TUFIN_NEARG", -- Line name without 1A lines and such
        speakers = {
            ["3"] = "LESTER", -- Speakers, required, based on SL. needs to be accurate
        },
        peds = nil,
        --[[peds = {
            ["2"] = PlayerPedId(), -- You can provide the ped to play this on (for facial anims), otherwise it'll generate invisible unnetworked peds attached to the player
        },]]
        forcePedsVisible = false, -- used for debugging purposes only, optional
        phoneCall = false, -- optional, disables fading out with distance
        forceRadio = false, -- optional, enables radio filter
    }
    exports['DialogueController']:startDialogueJson(json.encode(dialogue))
end)

RegisterNetEvent("glow:voiceline4")
AddEventHandler("glow:voiceline4", function()
    local dialogue = {
        gxt = "tufin", -- GXT name
        line = "TUFIN_BOX", -- Line name without 1A lines and such
        speakers = {
            ["3"] = "LESTER", -- Speakers, required, based on SL. needs to be accurate
        },
        peds = nil,
        --[[peds = {
            ["2"] = PlayerPedId(), -- You can provide the ped to play this on (for facial anims), otherwise it'll generate invisible unnetworked peds attached to the player
        },]]
        forcePedsVisible = false, -- used for debugging purposes only, optional
        phoneCall = false, -- optional, disables fading out with distance
        forceRadio = false, -- optional, enables radio filter
    }
    exports['DialogueController']:startDialogueJson(json.encode(dialogue))
end)

RegisterNetEvent("glow:voiceline5")
AddEventHandler("glow:voiceline5", function()
    Citizen.Wait(3000)
    local dialogue = {
        gxt = "hs3fiau", -- GXT name
        line = "HS3F_ST1_1", -- Line name without 1A lines and such
        speakers = {
            ["2"] = "LESTER", -- Speakers, required, based on SL. needs to be accurate
        },
        peds = nil,
        --[[peds = {
            ["2"] = PlayerPedId(), -- You can provide the ped to play this on (for facial anims), otherwise it'll generate invisible unnetworked peds attached to the player
        },]]
        forcePedsVisible = false, -- used for debugging purposes only, optional
        phoneCall = false, -- optional, disables fading out with distance
        forceRadio = false, -- optional, enables radio filter
    }
    exports['DialogueController']:startDialogueJson(json.encode(dialogue))
end)

RegisterNetEvent("glow:voiceline6")
AddEventHandler("glow:voiceline6", function()
    local dialogue = {
        gxt = "tufin", -- GXT name
        line = "TUFIN_READY", -- Line name without 1A lines and such
        speakers = {
            ["3"] = "LESTER", -- Speakers, required, based on SL. needs to be accurate
        },
        peds = nil,
        --[[peds = {
            ["2"] = PlayerPedId(), -- You can provide the ped to play this on (for facial anims), otherwise it'll generate invisible unnetworked peds attached to the player
        },]]
        forcePedsVisible = false, -- used for debugging purposes only, optional
        phoneCall = false, -- optional, disables fading out with distance
        forceRadio = false, -- optional, enables radio filter
    }
    exports['DialogueController']:startDialogueJson(json.encode(dialogue))
end)

RegisterNetEvent("glow:voiceline7")
AddEventHandler("glow:voiceline7", function()
    local dialogue = {
        gxt = "tufin", -- GXT name
        line = "TUFIN_GO3", -- Line name without 1A lines and such
        speakers = {
            ["3"] = "LESTER", -- Speakers, required, based on SL. needs to be accurate
        },
        peds = nil,
        --[[peds = {
            ["2"] = PlayerPedId(), -- You can provide the ped to play this on (for facial anims), otherwise it'll generate invisible unnetworked peds attached to the player
        },]]
        forcePedsVisible = false, -- used for debugging purposes only, optional
        phoneCall = false, -- optional, disables fading out with distance
        forceRadio = false, -- optional, enables radio filter
    }
    exports['DialogueController']:startDialogueJson(json.encode(dialogue))
    Citizen.Wait(15000)
    TriggerEvent("glow:voiceline8")
end)

RegisterNetEvent("glow:voiceline8")
AddEventHandler("glow:voiceline8", function()
    local dialogue = {
        gxt = "tufin", -- GXT name
        line = "TUFIN_ZAN", -- Line name without 1A lines and such
        speakers = {
            ["3"] = "LESTER", -- Speakers, required, based on SL. needs to be accurate
        },
        peds = nil,
        --[[peds = {
            ["2"] = PlayerPedId(), -- You can provide the ped to play this on (for facial anims), otherwise it'll generate invisible unnetworked peds attached to the player
        },]]
        forcePedsVisible = false, -- used for debugging purposes only, optional
        phoneCall = false, -- optional, disables fading out with distance
        forceRadio = false, -- optional, enables radio filter
    }
    exports['DialogueController']:startDialogueJson(json.encode(dialogue))
end)

RegisterNetEvent("glow:voiceline9")
AddEventHandler("glow:voiceline9", function()
    local dialogue = {
        gxt = "tufin", -- GXT name
        line = "TUFIN_WAY1", -- Line name without 1A lines and such
        speakers = {
            ["7"] = "EDDIE", -- Speakers, required, based on SL. needs to be accurate
        },
        peds = nil,
        --[[peds = {
            ["2"] = PlayerPedId(), -- You can provide the ped to play this on (for facial anims), otherwise it'll generate invisible unnetworked peds attached to the player
        },]]
        forcePedsVisible = false, -- used for debugging purposes only, optional
        phoneCall = false, -- optional, disables fading out with distance
        forceRadio = false, -- optional, enables radio filter
    }
    exports['DialogueController']:startDialogueJson(json.encode(dialogue))
end)



RegisterCommand("voices", function()
    TriggerEvent("glow:voiceline7")
end)
------------

RegisterCommand("fingerprint", function()
    TriggerEvent("utk_fingerprint:Start", 1, 6, 2, function(outcome, reason)
        if outcome == true then
            print("Success!!")
        elseif outcome == false then
            print("Failed! Reason: "..reason)
        end
    end)
end)


RegisterCommand("testplane", function()
    local playerPed = GetPlayerPed(-1) 
    TriggerEvent("glow:voiceline1")
    TaskVehicleDriveToCoordLongrange(
	playerPed --[[ Ped ]], 
	GetVehiclePedIsIn(PlayerPedId(), false) --[[ Vehicle ]], 
	-2973.91 --[[ number ]], 
	483.72 --[[ number ]], 
	60.27 --[[ number ]], 
	50.0 --[[ number ]], 
	524300 --[[ integer ]], 
	20.0 --[[ number ]]
    )
end)
RegisterCommand("testingplane", function()
    local playerPed = GetPlayerPed(-1) 
        TaskPlaneMission(playerPed, GetVehiclePedIsIn(PlayerPedId(), false), 0, 0, 5178.2, -5980.21, 365.19, 4, GetVehicleModelMaxSpeed(`velum`), 1.0, 238.0, 360.0, 370.0)
end)

RegisterCommand("lol", function()
    print("working")
    local scaleform = RequestScaleformMovie("ATM")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    
    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT_EMPTY")
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieMethodParameterInt(0)
    BeginTextCommandScaleformString("MPATM_SER")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieMethodParameterInt(1)
    BeginTextCommandScaleformString("MPATM_WITM")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieMethodParameterInt(2)
    BeginTextCommandScaleformString("MPATM_DIDM")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieMethodParameterInt(3)
    BeginTextCommandScaleformString("MPATM_LOG")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, "DISPLAY_MENU")
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, "DISPLAY_CASH_OPTIONS")
    EndScaleformMovieMethod()
    

    while true do
        Citizen.Wait(0)
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
    end
end)

RegisterCommand("loling", function()
    print("working")
    local scaleform = RequestScaleformMovie("ORBITAL_CANNON_CAM")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    
    BeginScaleformMovieMethod(scaleform, "showMenu")
    EndScaleformMovieMethod()


    BeginScaleformMovieMethod(scaleform, "SET_MENU_TITLE")
    PushScaleformMovieMethodParameterString("~r~glow is amazing")
    EndScaleformMovieMethod()


    

    while true do
        Citizen.Wait(0)
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
    end
end)

RegisterCommand("loling2", function()
    print("working")
    local scaleform = RequestScaleformMovie("HEIST_ENDSCREEN")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    
    BeginScaleformMovieMethod(scaleform, "SET_PIE_CHART")
    EndScaleformMovieMethod()





    

    while true do
        Citizen.Wait(0)
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
    end
end)


RegisterCommand("normal", function()
    local scaleform = RequestScaleformMovie("mp_big_message_freemode")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    
    BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
    PushScaleformMovieMethodParameterString("SOME TEXT")
    PushScaleformMovieMethodParameterString("SOME MORE TEXT")
    PushScaleformMovieMethodParameterInt(5)
    EndScaleformMovieMethod()

    while true do
        Citizen.Wait(0)
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
    end
end)

RegisterCommand("normalstart", function()
    local scaleform = RequestScaleformMovie("MP_CELEBRATION")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    
    BeginScaleformMovieMethod(scaleform, "SET_GFX_TYPE")
    PushScaleformMovieMethodParameterInt(1)
    EndScaleformMovieMethod()

    while true do
        Citizen.Wait(0)
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
    end
end)