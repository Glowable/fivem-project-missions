




RegisterNetEvent( "wk:deleteVehicle" )
AddEventHandler( "wk:deleteVehicle", function()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        local pos = GetEntityCoords( ped )

        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                DeleteEntity( vehicle, numRetries )
            else 
                Notify( "You must be in the driver's seat!" )
            end 
        else
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )

            if ( DoesEntityExist( vehicle ) ) then 
                DeleteEntity( vehicle, numRetries )
            end 
        end 
    end 
end)

RegisterCommand("hackinganim", function()
    TriggerEvent("utku:hackinganim")
end)

RegisterNetEvent("utku:hackinganim")
AddEventHandler("utku:hackinganim", function()
    local animDict = "anim@heists@ornate_bank@hack"

    RequestAnimDict(animDict)
    RequestModel("hei_prop_hst_laptop")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestModel("hei_prop_heist_card_hack_02")

    while not HasAnimDictLoaded(animDict)
        or not HasModelLoaded("hei_prop_hst_laptop")
        or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
        or not HasModelLoaded("hei_prop_heist_card_hack_02") do
        Citizen.Wait(100)
    end
    local ped = PlayerPedId()
    local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))
    local animPos = GetAnimInitialOffsetPosition(animDict, "hack_enter", 253.34, 228.25, 101.39, 253.34, 228.25, 101.39, 0, 2) -- Animasyon kordinatları, buradan lokasyonu değiştirin // These are fixed locations so if you want to change animation location change here
    local animPos2 = GetAnimInitialOffsetPosition(animDict, "hack_loop", 253.34, 228.25, 101.39, 253.34, 228.25, 101.39, 0, 2)
    local animPos3 = GetAnimInitialOffsetPosition(animDict, "hack_exit", 253.34, 228.25, 101.39, 253.34, 228.25, 101.39, 0, 2)
    -- part1
    FreezeEntityPosition(ped, true)
    local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "hack_enter", 1.5, -4.0, 1, 16, 1148846080, 0)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), targetPosition, 1, 1, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene, animDict, "hack_enter_bag", 4.0, -8.0, 1)
    local laptop = CreateObject(GetHashKey("hei_prop_hst_laptop"), targetPosition, 1, 1, 0)
    NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, "hack_enter_laptop", 4.0, -8.0, 1)
    local card = CreateObject(GetHashKey("hei_prop_heist_card_hack_02"), targetPosition, 1, 1, 0)
    NetworkAddEntityToSynchronisedScene(card, netScene, animDict, "hack_enter_card", 4.0, -8.0, 1)
    -- part2
    local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "hack_loop", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene2, animDict, "hack_loop_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, "hack_loop_laptop", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(card, netScene2, animDict, "hack_loop_card", 4.0, -8.0, 1)
    -- part3
    local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "hack_exit", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, netScene3, animDict, "hack_exit_bag", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, "hack_exit_laptop", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(card, netScene3, animDict, "hack_exit_card", 4.0, -8.0, 1)
    --event başlangıç
    SetPedComponentVariation(ped, 5, 0, 0, 0) -- çantayı yok ediyoruz eğer varsa // removes bag from ped so no 2 bags
    SetEntityHeading(ped, 63.60) -- Animasyon düzgün oturması için yön // for proper animation direction

    NetworkStartSynchronisedScene(netScene)
    Citizen.Wait(4500) -- Burayı deneyerek daha iyi hale getirebilirsiniz // You can try editing this to make transitions perfect
    NetworkStopSynchronisedScene(netScene)

    NetworkStartSynchronisedScene(netScene2)
    Citizen.Wait(4500)
    NetworkStopSynchronisedScene(netScene2)

    NetworkStartSynchronisedScene(netScene3)
    Citizen.Wait(4500)
    NetworkStopSynchronisedScene(netScene3)

    DeleteObject(bag)
    DeleteObject(laptop)
    DeleteObject(card)
    FreezeEntityPosition(ped, false)
    SetPedComponentVariation(ped, 5, 45, 0, 0) -- çantayı pede geri veriyor // gives bag back to ped
end)

RegisterCommand("deletedathing", function()
	TriggerEvent('wk:deleteVehicle')
end)

function notify(str)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(str)
    EndTextCommandThefeedPostTicker(true, false)
end



RegisterCommand("clear", function()
    RemoveAllPedWeapons(GetPlayerPed(-1), true)
    notify('~r~Cleared All Weapons.')
    Citizen.Wait(1)
    alert("All weapons has been cleared")
end)

RegisterCommand("fade", function()
    DoScreenFadeIn(2000)
    Citizen.Wait(2000)
    DoScreenFadeOut(2000)
    Citizen.Wait(2000)
end)

RegisterNetEvent("utku:cutscene")
AddEventHandler("utku:cutscene", function()
    RequestCutscene("bmad_intro")
    repeat Wait(0) until HasCutsceneLoaded()
    StartCutscene(10)
end)

RegisterCommand("thingy", function()
	TriggerEvent('heist:start')
end)

RegisterNetEvent("heist:start")
AddEventHandler("heist:start", function()
    --All 4 tables are required in order to proprer syncronize the scaleform.
    local _initialText = { --first slide. Consists of 3 text lines.
        missionTextLabel = "~y~MISSION~s~", 
        passFailTextLabel = "PASSED.",
        messageLabel = "",
    }
    local _table = { --second slide. You can add as many "stats" as you want. They will appear from botton to top, so keep that in mind.
        {stat = "Total Payout", value = "~g~$~s~25000"},
        --{stat = "value3", value = "~g~$~s~50000"},
        --{stat = "value2", value = "~b~1999~s~"},
        --{stat = "value1", value = "TEST"},
    }
    local _money = { --third slide. Incremental money. It will start from startMoney and increment to finishMoney. top and bottom text appear above/below the money string.
        startMoney = 25000,
        finishMoney = 25000,
        topText = "Money Earned",
        bottomText = "",
        rightHandStat = "",
        rightHandStatIcon = 3, --0 or 1 = checked, 2 = X, 3 = no icon
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
    TriggerEvent("cS.HeistFinale", _initialText, _table, _money, _xp, 10, true)
end)



RegisterCommand("testblip", function()
	AddBlipForCoord(2392, 3111, 48)
	SetBlipSprite(1)
    SetBlipColour(2)
    SetBlipRoute(true)
end)


RegisterCommand("scaleform", function()
    Initialize("Welcome to Los Santos")
    announce("Welcome to Los Santos")
end)

RegisterCommand("scaleform1", function()
    Initialize("Welcome to Los Santos")
end)

RegisterCommand("scaleform2", function()
    announce("Welcome to Los Santos")
end)


RegisterCommand("car", function(source, args)
    local vehicleName = args[1] or 'adder'

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
    alert("~y~Vehicle Spawned")
	vehicle = AddBlipForEntity(vehicle)
	SetBlipSprite(carBlip,number)

	if GetEntityHealth(vehicle) == 0 then
		SetEntityAsNoLongerNeeded(vehicle)
		RemoveBlip(carBlip)
		blip = nil
	end

    SetModelAsNoLongerNeeded(vehicleName)
    
end, false)

RegisterCommand("helicopter", function(source, args)
    local vehicleName = args[1] or 'sparrow'

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
    alert("~y~Vehicle Spawned")
	vehicle = AddBlipForEntity(vehicle)
	SetBlipSprite(carBlip,number)

	if GetEntityHealth(vehicle) == 0 then
		SetEntityAsNoLongerNeeded(vehicle)
		RemoveBlip(carBlip)
		blip = nil
	end

    SetModelAsNoLongerNeeded(vehicleName)
end, false)

RegisterCommand("repo", function (source, args)
    local vehicleName = 'zentorno'

    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Citizen.Wait(2)
    end

    local vehicle = CreateVehicle(vehicleName, -1071.06, -1671.09, 4.04, GetEntityHeading(playerPed), true, false)

    TriggerEvent("utk_fingerprint:Start", 4, 6, 2, function(outcome, reason)
    if outcome == true then -- reason will be nil if outcome is true
        vehicle = AddBlipForEntity(vehicle)
	    SetBlipSprite(carBlip,number)
	    SetEntityAsNoLongerNeeded(vehicle)
        SetModelAsNoLongerNeeded(vehicleName)
        FreezeEntityPosition(ped, false)     
        alert("Go to the Vehicle marked on your map and deliver it back to the dealership for Simeon Yeteris.")
        FreezeEntityPosition(ped, false)
        PrepareMusicEvent("TRV1_CHASE_BIKERS_RT")
	    Citizen.Wait(100)
        TriggerMusicEvent("TRV1_CHASE_BIKERS_RT")
        FreezeEntityPosition(ped, false)
        while not IsPedInAnyVehicle(PlayerPedId(), true) do
            Citizen.Wait(2)
            FreezeEntityPosition(ped, false)
        end
    
        while not IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey('zentorno')) do
            Citizen.Wait(2)
            FreezeEntityPosition(ped, false)
        end
    
        if IsPedInAnyVehicle(PlayerPedId(), true) then
            if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey('zentorno')) then
                local blip = AddBlipForCoord(232.60, 198.03, 105)
                SetBlipSprite(blip, 1)
                SetBlipColour(blip, 2)
                SetBlipRoute(blip, true)
            end
        end
    elseif outcome == false then
        alert("Hack failed.")
    end
end)
end)

RegisterCommand("glow:gruppeeee", function()
    TriggerEvent('glow:gruppe')
end)

RegisterNetEvent("glow:gruppe")
AddEventHandler("glow:gruppe", function()
	local vehicleName = 'stockade'
	
	RequestModel(vehicleName)
	while not HasModelLoaded(vehicleName) do
		Citizen.Wait(2)
	end

	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(playerPed)

	local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)

	vehicle = AddBlipForEntity(vehicle)
	SetBlipSprite(carBlip,number)

	SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)

	alert('Enter the ~r~Vehicle')

    while not IsPedInAnyVehicle(PlayerPedId(), false) do
        Citizen.Wait(2)
    end

    while not IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey('stockade')) do
        Citizen.Wait(2)
    end

    if IsPedInAnyVehicle(PlayerPedId(), false) then
        if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey('stockade')) then
            local blip = AddBlipForCoord(232.60, 198.03, 105)
            SetBlipSprite(blip, 1)
            SetBlipColour(blip, 2)
            SetBlipRoute(blip, true)
        end
    end
end, false)

RegisterNetEvent("glow:cayodrugplane")
AddEventHandler("glow:cayodrugplane", function()
	local vehicleName = 'velum'
	
	RequestModel(vehicleName)
	while not HasModelLoaded(vehicleName) do
		Citizen.Wait(2)
	end

	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(playerPed)

	local vehicle = CreateVehicle(vehicleName, -1029.4, -2992.23, 13.95, GetEntityHeading(playerPed), true, false)

	vehicle = AddBlipForEntity(vehicle)
	SetBlipSprite(carBlip,423)

	SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)

	alert('Go to ~b~Los Santos International Airport~w~ and enter the ~r~Plane~w~ and deliver the ~r~drugs~w~ to Cayo Perico.')
    Citizen.Wait(10000)
    alert('You can return back to ~b~Los Santos~w~ from Cayo Perico.')

    while not IsPedInAnyVehicle(PlayerPedId(), false) do
        Citizen.Wait(2)
    end

    while not IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey('velum')) do
        Citizen.Wait(2)
    end

    if IsPedInAnyVehicle(PlayerPedId(), false) then
        if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey('velum')) then
            local blip = AddBlipForCoord(4483.51, -4464.64, 5.19)
            SetBlipSprite(blip, 514)
            SetBlipColour(blip, 5)
            SetBlipRoute(blip, true)
            Citizen.Wait(10000)
            alert('You can return back to ~b~Los Santos~w~ from Cayo Perico.')
        end
    end
end, false)



RegisterCommand("stopmusic", function()
    if IsGameInControlOfMusic() then  
        CancelMusicEvent()
    end
end)

RegisterCommand("Introduction", function()
    PrepareMusicEvent("HELI_OS")
	Citizen.Wait(100)
    TriggerMusicEvent("HELI_OS")
end)

RegisterCommand("musictestt", function()
    PrepareMusicEvent("PENNED_IN_START_MUSIC")
	Citizen.Wait(100)
    TriggerMusicEvent("PENNED_IN_START_MUSIC")
end)



RegisterCommand("EndCredits", function()
	PlayEndCreditsMusic(play)
end)

RegisterCommand("StopMusic", function()
	CancelMusicEvent()
end)



RegisterCommand("SpawnCargoVehicle", function()
	Citizen.Wait(0)
	local myPed = GetPlayerPed(-1)
	local player = PlayerId()
	local vehicle = GetHashKey(Config.Scenarios[scenario].VehicleName)

    RequestModel(vehicle)

	while not HasModelLoaded(vehicle) do
		Wait(1)
	end
	
	colors = table.pack(GetVehicleColours(veh)) 
	extra_colors = table.pack(GetVehicleExtraColours(veh))
	plate = math.random(100, 900)
	local spawned_car = CreateVehicle(vehicle, Config.Scenarios[scenario].SpawnPoint.x, Config.Scenarios[scenario].SpawnPoint.y, Config.Scenarios[scenario].SpawnPoint.z, false, true)

	SetEntityHeading(spawned_car, Config.Scenarios[scenario].SpawnPoint.h)
	SetVehicleOnGroundProperly(spawned_car)
	SetPedIntoVehicle(myPed, spawned_car, - 1)
	SetModelAsNoLongerNeeded(vehicle)
	Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
	CruiseControl = 0
	DTutOpen = false
	SetEntityVisible(myPed, true)
	FreezeEntityPosition(myPed, false)
	event_vehicle = spawned_car

end)

--lester mission below

local coordsVisible = false

function DrawGenericText(text)
	SetTextColour(186, 186, 186, 255)
	SetTextFont(7)
	SetTextScale(0.378, 0.378)
	SetTextWrap(0.0, 1.0)
	SetTextCentre(false)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.40, 0.00)
end

Citizen.CreateThread(function()
    while true do
		local sleepThread = 250
		
		if coordsVisible then
			sleepThread = 5

			local playerPed = PlayerPedId()
			local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
			local playerH = GetEntityHeading(playerPed)

			DrawGenericText(("~g~X~w~: %s ~g~Y~w~: %s ~g~Z~w~: %s ~g~H~w~: %s"):format(FormatCoord(playerX), FormatCoord(playerY), FormatCoord(playerZ), FormatCoord(playerH)))
		end

		Citizen.Wait(sleepThread)
	end
end)

FormatCoord = function(coord)
	if coord == nil then
		return "unknown"
	end

	return tonumber(string.format("%.2f", coord))
end

ToggleCoords = function()
	coordsVisible = not coordsVisible
end

RegisterCommand("coords", function()
    ToggleCoords()
end)

RegisterCommand('god', function(source, args)
    SetEntityInvincible(GetPlayerPed(-1), true)
    notify("~g~God Mode On")
end)
RegisterCommand("godoff", function(source, args)
    SetEntityInvincible(GetPlayerPed(-1), false)
    notify("~r~God Mode Off")
end)

