

function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

TriggerEvent('lobbymenu:CreateMenu', 'critMenu.ExampleMenu', "GRUPPE 6 Delivery", "Deliver the GRUPPE 6 truck to Pacific Standard Bank.", "MENU", "PLAYERS", "INFORMATION")
TriggerEvent('lobbymenu:SetHeaderDetails', 'critMenu.ExampleMenu', true, true, 2, 6, 0)
TriggerEvent('lobbymenu:SetDetailsTitle', 'critMenu.ExampleMenu', "Gruppe 6 Delivery", 'sproffroad', 'spr_offroad_1')

TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', {text = "Showing button 3"}, "Start Mission", "", false, 0, "lobby.AddWarningToMenu")
TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', {id = 0, text = "Button Used"}, "Close Menu", "", false, 0, "lobbymenu:CloseMenu")

TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "PLAYER1", '', "PRE ALPHA TEST", 65, 1234, true, 12, 6)

TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Contracted by", "~r~Lester~s~")

TriggerEvent('lobbymenu:SetTextBoxToColumn', 'critMenu.ExampleMenu', 0, "Title", "This is a text box. You can add as much text as you want here and no one will care.\n\n~y~It's great for info and stuff...~s~", "Footer text.")

AddEventHandler("lobby.AddPlayerToMenu", function(_buttonParams)
    setMenuColumnFocus(3)
    TriggerEvent('lobbymenu:SetTextBoxToColumn', 'critMenu.ExampleMenu', 1, "Title", "This is a text box. You can add as much text as you want here and no one will care.\n\n~y~It's great for info and stuff...~s~", "Footer text.")
    TriggerEvent('lobbymenu:ResetPlayerList', 'critMenu.ExampleMenu')
    TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "CritteR", '', math.random(1,100), 65, 1, true, 12, 6, 'lobby.UsePlayerEvent', {player = "CritteR"}, false)
    TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "NTT", '', math.random(1,100), 65, 2, true, 12, 6, 'lobby.UsePlayerEvent', {player = "NTT"})

    TriggerEvent('lobbymenu:SetTooltipMessage', 'critMenu.ExampleMenu', "MISSION IS IN EARLY DEVELOPMENT, EXPECT IMPERFECTIONS, AND GLITCHES.")
    TriggerEvent('lobbymenu:UpdateMenu', 'critMenu.ExampleMenu')
end)

AddEventHandler("lobby.AddDetailsToMenu", function(_buttonParams)
    TriggerEvent('lobbymenu:SetTextBoxToColumn', 'critMenu.ExampleMenu', 2, "Title", "You can even set it to the second column, if that's what you want.", "Footer text.")
    TriggerEvent('lobbymenu:ResetDetailsRowList', 'critMenu.ExampleMenu')
    TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Updated Row 1", "~y~2 minutes~s~")
    TriggerEvent('lobbymenu:SetTooltipMessage', 'critMenu.ExampleMenu', "")

    TriggerEvent('lobbymenu:UpdateMenu', 'critMenu.ExampleMenu')
end)

AddEventHandler("lobby.AddWarningToMenu", function(_buttonParams)
    TriggerEvent('lobbymenu:CloseMenu')
    TriggerEvent("glow:gruppe")
end)

AddEventHandler("lobby.UsePlayerEvent", function(_buttonParams)
    TriggerEvent('lobbymenu:CloseMenu')
    SetTooltipOnly('You selected player: '.._buttonParams.player, false, false)
    print('You selected player: '.._buttonParams.player)
end)

RegisterCommand('showpl', function()
    TriggerEvent('lobbymenu:OpenMenu', 'critMenu.ExampleMenu', true)
end)

--]]
TriggerEvent('lobbymenu:CreateMenu', 'critMenu.ExampleMenuu', "Lester", "Lester would like to talk to you.", "MENU", "PLAYERS", "INFORMATION")
TriggerEvent('lobbymenu:SetHeaderDetails', 'critMenu.ExampleMenuu', true, true, 2, 6, 0)
TriggerEvent('lobbymenu:SetDetailsTitle', 'critMenu.ExampleMenuu', "Gruppe 6 Delivery", 'sproffroad', 'spr_offroad_1')

TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenuu', {text = "Showing button 3"}, "Start Mission", "", false, 0, "lobby.AddWarningToMenuu")
TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenuu', {id = 0, text = "Button Used"}, "Close Menu", "", false, 0, "lobbymenu:CloseMenu")

TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenuu', "PLAYER1", '', "PRE ALPHA TESTt", 65, 1234, true, 12, 6)

TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenuu', "Contracted by", "~r~Lester~s~")

TriggerEvent('lobbymenu:SetTextBoxToColumn', 'critMenu.ExampleMenuu', 0, "Title", "This is a text box. You can add as much text as you want here and no one will care.\n\n~y~It's great for info and stuff...~s~", "Footer text.")

AddEventHandler("lobby.AddPlayerToMenu", function(_buttonParams)
    setMenuColumnFocus(3)
    TriggerEvent('lobbymenu:SetTextBoxToColumn', 'critMenu.ExampleMenuu', 1, "Title", "This is a text box. You can add as much text as you want here and no one will care.\n\n~y~It's great for info and stuff...~s~", "Footer text.")
    TriggerEvent('lobbymenu:ResetPlayerList', 'critMenu.ExampleMenuu')
    TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenuu', "CritteR", '', math.random(1,100), 65, 1, true, 12, 6, 'lobby.UsePlayerEvent', {player = "CritteR"}, false)
    TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenuu', "NTT", '', math.random(1,100), 65, 2, true, 12, 6, 'lobby.UsePlayerEvent', {player = "NTT"})

    TriggerEvent('lobbymenu:SetTooltipMessage', 'critMenu.ExampleMenuu', "MISSION IS IN EARLY DEVELOPMENT, EXPECT IMPERFECTIONS, AND GLITCHES.")
    TriggerEvent('lobbymenu:UpdateMenu', 'critMenu.ExampleMenuu')
end)

AddEventHandler("lobby.AddDetailsToMenu", function(_buttonParams)
    TriggerEvent('lobbymenu:SetTextBoxToColumn', 'critMenu.ExampleMenuu', 2, "Title", "You can even set it to the second column, if that's what you want.", "Footer text.")
    TriggerEvent('lobbymenu:ResetDetailsRowList', 'critMenu.ExampleMenuu')
    TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenuu', "Updated Row 1", "~y~2 minutes~s~")
    TriggerEvent('lobbymenu:SetTooltipMessage', 'critMenu.ExampleMenuu', "")

    TriggerEvent('lobbymenu:UpdateMenu', 'critMenu.ExampleMenuu')
end)

AddEventHandler("lobby.AddWarningToMenuu", function(_buttonParams)
    TriggerEvent('lobbymenu:CloseMenu')
end)

AddEventHandler("lobby.UsePlayerEvent", function(_buttonParams)
    TriggerEvent('lobbymenu:CloseMenu')
    SetTooltipOnly('You selected player: '.._buttonParams.player, false, false)
    print('You selected player: '.._buttonParams.player)
end)

RegisterCommand('showfrr', function()
    TriggerEvent('lobbymenu:OpenMenu', 'critMenu.ExampleMenuu', true)
end)

TriggerEvent('critMenu.CreateMenu', "test1", "Avaliable", "_menuDesc", "Select Mission", "Up", "Down", "_quitText")

TriggerEvent('critMenu.AddButton', "test1", "test1button", "Gruppe 6 Delivery.", "~g~LEGAL~g~", "_strike", "Deliver the Gruppe 6 Van to the location.", "test.showlobby")
TriggerEvent('critMenu.AddButton', "test1", "test2button", "Cayo Perico Drug Delivery", "~r~ILLEGAL~r~", "_strike", "Deliver the Velum loaded with drugs to Cayo Perico.", "test.startcayomission")
TriggerEvent('critMenu.AddButton', "test1", "test3button", "_buttonText3", "~b~_buttonRightText", "_strike", "~b~_buttonDescription", "test.event")
TriggerEvent('critMenu.AddButton', "test1", "test4button", "_buttonText4", "~g~_buttonRightText", "_strike", "~g~_buttonDescription", "lobby.AddWarningToMenuuu")

AddEventHandler('test.showlobby', function(_menu, _button)
    TriggerEvent('lobbymenu:OpenMenu', 'critMenu.ExampleMenu', true)
end)

AddEventHandler('test.startcayomission', function(_menu, _button)
    TriggerEvent('lobbymenu:OpenMenu', 'critMenu.ExampleMenuuu', true)
end)

RegisterCommand('showmen', function()
    TriggerEvent('critMenu.ShowMenu', "test1")
end)

RegisterCommand('critcredits', function()
    TriggerEvent('critMenu.ShowMenu', "critmenu:internalmenu:credits")
end)

AddEventHandler('test.event', function(_menu, _button)
    TriggerEvent('critMenu.HideMenu')
    print('button ['.._button..'] from menu ['.._menu..'] triggered this event')
end)

TriggerEvent('lobbymenu:CreateMenu', 'critMenu.ExampleMenuuu', "Cayo Perico Drug Delivery", "Deliver the Velum that is loaded with drugs to Cayo Perico", "MENU", "PLAYERS", "INFORMATION")
TriggerEvent('lobbymenu:SetHeaderDetails', 'critMenu.ExampleMenuuu', true, true, 2, 6, 0)
TriggerEvent('lobbymenu:SetDetailsTitle', 'critMenu.ExampleMenuuu', "Cayo Perico Drug Delivery", 'sproffroad', 'spr_offroad_1')

TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenuuu', {text = "Showing button 3"}, "Start Mission", "", false, 0, "lobby.AddWarningToMenuuu")
TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenuuu', {id = 0, text = "Button Used"}, "Close Menu", "", false, 0, "lobbymenu:CloseMenu")

TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenuuu', "PLAYER1", '', "PRE ALPHA TEST", 65, 1234, true, 12, 6)

TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenuuu', "Contracted by", "~r~El Rubio~s~")

TriggerEvent('lobbymenu:SetTextBoxToColumn', 'critMenu.ExampleMenuuu', 0, "Title", "This is a text box. You can add as much text as you want here and no one will care.\n\n~y~It's great for info and stuff...~s~", "Footer text.")

AddEventHandler("lobby.AddPlayerToMenu", function(_buttonParams)
    setMenuColumnFocus(3)
    TriggerEvent('lobbymenu:SetTextBoxToColumn', 'critMenu.ExampleMenuuu', 1, "Title", "This is a text box. You can add as much text as you want here and no one will care.\n\n~y~It's great for info and stuff...~s~", "Footer text.")
    TriggerEvent('lobbymenu:ResetPlayerList', 'critMenu.ExampleMenuuu')
    TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenuuu', "CritteR", '', math.random(1,100), 65, 1, true, 12, 6, 'lobby.UsePlayerEvent', {player = "CritteR"}, false)
    TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenuuu', "NTT", '', math.random(1,100), 65, 2, true, 12, 6, 'lobby.UsePlayerEvent', {player = "NTT"})

    TriggerEvent('lobbymenu:SetTooltipMessage', 'critMenu.ExampleMenuuu', "MISSION IS IN EARLY DEVELOPMENT, EXPECT IMPERFECTIONS, AND GLITCHES.")
    TriggerEvent('lobbymenu:UpdateMenu', 'critMenu.ExampleMenuuu')
end)

AddEventHandler("lobby.AddDetailsToMenu", function(_buttonParams)
    TriggerEvent('lobbymenu:SetTextBoxToColumn', 'critMenu.ExampleMenuuu', 2, "Title", "You can even set it to the second column, if that's what you want.", "Footer text.")
    TriggerEvent('lobbymenu:ResetDetailsRowList', 'critMenu.ExampleMenuuu')
    TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenuuu', "Updated Row 1", "~y~2 minutes~s~")
    TriggerEvent('lobbymenu:SetTooltipMessage', 'critMenu.ExampleMenuuu', "")

    TriggerEvent('lobbymenu:UpdateMenu', 'critMenu.ExampleMenuuu')
end)

AddEventHandler("lobby.AddWarningToMenuuu", function(_buttonParams)
    TriggerEvent('lobbymenu:CloseMenu')
    SetEntityCoords(PlayerPedId(), -53.87, -787.42, 44.22, true, true, true, false)
    TriggerEvent('critMenu.HideMenu')
    TriggerEvent("glow:cayodrugplane")
end)

AddEventHandler("lobby.UsePlayerEvent", function(_buttonParams)
    TriggerEvent('lobbymenu:CloseMenu')
    SetTooltipOnly('You selected player: '.._buttonParams.player, false, false)
    print('You selected player: '.._buttonParams.player)
end)

RegisterCommand('showfrrr', function()
    TriggerEvent('lobbymenu:OpenMenu', 'critMenu.ExampleMenuuu', true)
end)

RegisterCommand("midsized", function()
    local scaleform = RequestScaleformMovie("MIDSIZED_MESSAGE")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end

    BeginScaleformMovieMethod(scaleform, "SHOW_MIDSIZED_MESSAGE")
    PushScaleformMovieMethodParameterString("a")
    PushScaleformMovieMethodParameterString("a")
    PushScaleformMovieMethodParameterInt(5)
    EndScaleformMovieMethod()
    while true do -- loop how you need
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
        Citizen.Wait(0)
    end
end)


RegisterNetEvent("glow:bombdefuse")
AddEventHandler("glow:bombdefuse", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(380.09, -834.95, 29.29)
    SetBlipSprite(blip, 473)
    SetBlipColour(blip, 11)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    TriggerEvent("mt:missiontext", "Go to the ~g~Warehouse~w~", 500000)
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(380.09, -834.95, 29.29))
        if dist < 2 then
            inArea = true
            SetEntityCoords(PlayerPedId(), 1173.50, -3196.66, -39.01, true, true, true, false)
            RemoveBlip(blip)
            alert("Search the office for Indicatiors to where the bomb may have been planted.")
            TriggerEvent("mt:missiontext", "Search the office", 500000)
        end
    end
end)

RegisterNetEvent("glow:bombdefuseleave")
AddEventHandler("glow:bombdefuseleave", function()
    local ped = PlayerPedId()
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(1173.08, -3196.59, -39.01))
        if dist < 2 then
            inArea = true
            SetEntityCoords(PlayerPedId(), 380.23, -836.93, 29.29, true, true, true, false)
            TriggerEvent("mt:missiontext", "Go to ~r~Pacific Bluffs~w~", 500000)
        end
    end
end)

RegisterNetEvent("glow:bombdefuse")
AddEventHandler("glow:bombdefuse", function()
    local ped = PlayerPedId()
    local h_key = 74
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(1160.25, -3192.06, -39.01))
        if dist < 2 then
            inArea = true
            TriggerEvent("cS.missionQuit", "~g~You have found the documents~s~", "The bomb is located in ~r~Pacific Bluffs~w~", 5, true)
            TriggerEvent('glow:bombdefuseleave')
            TriggerEvent('glow:bombdefusewaypoint')
            TriggerEvent("mt:missiontext", "Leave the office.", 500000)
        end
    end
end)

RegisterNetEvent("glow:pacmusic")
AddEventHandler("glow:pacmusic", function()
    SetAudioFlag("WantedMusicDisabled", true)
    PrepareMusicEvent("EXTREME1_BIKE")
	Citizen.Wait(100)
    TriggerMusicEvent("EXTREME1_BIKE")
end)

RegisterCommand("bombdiffuse", function()
    PrepareMusicEvent("HEIST_STATS_SCREEN_START")
	Citizen.Wait(100)
    TriggerMusicEvent("HEIST_STATS_SCREEN_START")
    Citizen.Wait(3000)
    TriggerEvent("cS.MidsizeBanner", "~g~BOMB DIFFUSAL~s~", "Go to the Warehouse", 5, 9, true)
    TriggerEvent('glow:bombdefuse')
    Citizen.Wait(0)
    TriggerEvent('glow:bombdefusefound')
end)

RegisterNetEvent("glow:bombdefusewaypoint")
AddEventHandler("glow:bombdefusewaypoint", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-2292.31, 367.93, 174.6)
    SetBlipSprite(blip, 378)
    SetBlipColour(blip, 1)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    TriggerEvent("mt:missiontext", "Go to the ~g~Warehouse~w~", 500000)
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-2292.31, 367.93, 174.6))
        if dist < 2 then
            inArea = true
            print("donee")
            RemoveBlip(blip)
            TriggerEvent("glow:bombdefusea")
        end
    end
end)

RegisterNetEvent("glow:bombdefusechangemusic")
AddEventHandler("glow:bombdefusechangemusic", function()
    PrepareMusicEvent("TRV1_CHASE_BIKERS_RT")
	Citizen.Wait(100)
    TriggerMusicEvent("TRV1_CHASE_BIKERS_RT")
end)

RegisterNetEvent("glow:bombdefusehei")
AddEventHandler("glow:bombdefuseheli", function()
	local vehicleName = 'frogger'
	
	RequestModel(vehicleName)
	while not HasModelLoaded(vehicleName) do
		Citizen.Wait(2)
	end

	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(playerPed)

	local vehicle = CreateVehicle(vehicleName, -2322.41, 292.97, 169.47, GetEntityHeading(playerPed), true, false)

	local blip = AddBlipForEntity(vehicle)
    SetBlipSprite(blip, 64)
    SetBlipColour(blip, 3)

	SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)

    TriggerEvent("mt:missiontext", "Go into the ~b~Helicopter~w~ and escape", 500000)
    TriggerEvent("cS.MidsizeBanner", "~b~GET INTO THE ~b~HELICOPTER~w~", "", 5, 9, true)
end)

RegisterCommand("finalstage", function()
    TriggerEvent('glow:bombdefuseheli')
end)

RegisterNetEvent("glow:bombdefusehack")
AddEventHandler("glow:bombdefusehack", function()
    TriggerEvent("utk_fingerprint:Start", 4, 6, 2, function(outcome, reason)
        if outcome == true then -- reason will be nil if outcome is true
            TriggerEvent('glow:bombdefuseheli')
        elseif outcome == false then
            print("Failed. Reason: "..reason)
        end
    end)
end)

RegisterNetEvent("glow:bombdefusea")
AddEventHandler("glow:bombdefusea", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-2216.53, 187.5, 174.6)
    SetBlipSprite(blip, 486)
    SetBlipColour(blip, 46)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    TriggerEvent("mt:missiontext", "DIFFUSE THE ~r~BOMB~w~", 500000)
    TriggerEvent("cS.MidsizeBanner", "~r~DIFFUSE THE BOMB~w~", "", 5, 9, true)
    TriggerEvent('glow:bombdefusechangemusic')
    TriggerEvent('glow:bomblester')
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-2216.08, 186.94, 174.6))
        if dist < 2 then
            inArea = true
            print("done")
            RemoveBlip(blip)
            TriggerEvent('glow:bombdefusehack')
        end
    end
end)

RegisterCommand("startearly", function()
    TriggerEvent("glow:bombdefusea")
end)


RegisterCommand("subtitletest", function()
    TriggerEvent("mt:missiontext", "Here is some rredw asdasdtext.", 500000)
end)

RegisterCommand('me', function() --midsize banner. Same as big banner, but midsized.
    --TriggerEvent("cS.MidsizeBanner", _title, _subtitle, _waitTimeSeconds, _playShound)
    TriggerEvent("cS.MidsizeBanner", "~y~Test Scaleform~s~.", "You ~g~can ~r~use ~y~colors ~b~here ~s~too.", 2, 9, true)
end)

RegisterCommand('mq', function() --"Mission Quit" scaleform. Low opacity black background with title and subtitle.
    --TriggerEvent("cS.missionQuit", _title, _subtitle, _waitTimeSeconds, _playShound)
    TriggerEvent("cS.missionQuit", "~y~Test Scaleform~s~.", "You ~g~can ~r~use ~y~colors ~b~here ~s~too.", 5, true)
end)

RegisterNetEvent("glow:lesterr")
AddEventHandler("glow:lesterr", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-1044.15, -229.84, 39.01)
    SetBlipSprite(blip, 475)
    SetBlipColour(blip, 2)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    TriggerEvent("mt:missiontext", "Go to the ~b~Lifeinvader building~w~", 500000)
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-1044.15, -229.84, 39.01))
        if dist < 2 then
            inArea = true
            RemoveBlip(blip)
            TriggerEvent('glow:lestergetphone')
        end
    end
end)

RegisterNetEvent("glow:lestergetphone")
AddEventHandler("glow:lestergetphone", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-1054.08, -230.75, 44.02)
    SetBlipSprite(blip, 436)
    SetBlipColour(blip, 2)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    alert("Go upstairs in the Lifeinvader building to retrieve the ~r~phone~w~")
    TriggerEvent("mt:missiontext", "Retrieve the ~r~phone~w~", 500000)
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-1054.08, -230.75, 44.02))
        if dist < 2 then
            inArea = true
            RemoveBlip(blip)
            print("worked")
            TriggerEvent('glow:lesterreturn')
        end
    end
end)

RegisterNetEvent("glow:lesterreturn")
AddEventHandler("glow:lesterreturn", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(718.04, -974.22, 24.91)
    SetBlipSprite(blip, 77)
    SetBlipColour(blip, 1)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    TriggerEvent("mt:missiontext", "Return the ~b~Phone~w back to ~r~Lester~w~", 500000)
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(718.04, -974.22, 24.91))
        if dist < 2 then
            inArea = true
            RemoveBlip(blip)
            print("worked")
            TriggerEvent("cS.MidsizeBanner", "~r~Mission Complete.", "You retrieved the phone.", 2, 9, true)
            TriggerEvent("mt:missiontext", "", 500000)
        end
    end
end)

RegisterCommand("findingit", function()
    test = CreateCam()
    test = CreateCamWithParams("test", -1761.323, -862.844, 8.164, 0.4405, 0, 92.1012, 45, true, 2)
    test = SetCamActive("test", true)
    test = RenderScriptCams("true", false, 3000, true, false, 0)
end)

RegisterCommand("bird",function(source, args)

	local ad = "anim@mp_player_intselfiethe_bird"
	local player = GetPlayerPed( -1 )
	
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, "idle_a", 3 ) ) then 
			TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			Wait (100)
			ClearPedSecondaryTask(GetPlayerPed(-1))
		else
			TaskPlayAnim( player, ad, "idle_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			Wait (500)
		end     
	end
end, false)

RegisterCommand("findingitt", function()
    local generalPed
    local generalLoaded = false
    local pos = GetEntityCoords(generalPed)
    local PlayingAnim = false
    local general_peds = {
        {x=-2276.61, y=313.02, z=184.6, a=245.000457763672},
        {x=-2263.35, y=318.1, z=184.6, a=245.000457763672},
        {x=-2243.42, y=293.04, z=184.6, a=245.000457763672},
    }
    while true do
      Citizen.Wait(0)
      
      if (not generalLoaded) then
        
        for k,v in ipairs(general_peds) do
          RequestModel(GetHashKey("mp_m_shopkeep_01"))
          while not HasModelLoaded(GetHashKey("mp_m_shopkeep_01")) do
            Wait(1)
          end
          
          generalPed = CreatePed(2, "mp_m_shopkeep_01", v.x, v.y, v.z, v.a, false, false)
          GiveWeaponToPed(generalPed, GetHashKey("WEAPON_PISTOL"), 1, false, false)
          SetPedAsEnemy(generalPed, true)
          

          local blip = AddBlipForEntity(generalPed)
          SetBlipSprite(blip, 270)
          SetBlipColour(blip, 23)
          
          while not IsEntityDead(generalPed) do
            Citizen.Wait(2)
          end

          if IsEntityDead(generalPed) then
            RemoveBlip(blip)
          end
          
        end
        generalLoaded = true
          
      end
      
    end
  end)

RegisterCommand("colourhud", function()
    ReplaceHudColourWithRgba(
        116, -- old Color
        255, -- R
        102, -- G
        0, -- B
        255 -- A
    )
end)

RegisterCommand("effect", function()
    StopAllScreenEffects()
end)

RegisterNetEvent("glow:lestercutscene") 
AddEventHandler("glow:lestercutscene", function()
    RequestCutscene("heist_int")
    repeat Wait(0) until HasCutsceneLoaded()
    StartCutscene(10)
end)

RegisterCommand("lesterstep1", function()
    TriggerEvent('glow:lesterr')
end)

RegisterCommand("lestermission", function()
    TriggerEvent('glow:lestercutscene')
    TriggerEvent('glow:lesterr')
end)

RegisterNetEvent("glow:bomblester")
AddEventHandler("glow:bomblester", function()
    Citizen.Wait(7000)
    local dialogue = {
        gxt = "obhfau", -- GXT name
        line = "OBHF_CHASE4", -- Line name without 1A lines and such
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

RegisterCommand("firsttest", function()
    PrepareMusicEvent("HEIST_STATS_SCREEN_START")
	Citizen.Wait(100)
    TriggerMusicEvent("HEIST_STATS_SCREEN_START")
    Citizen.Wait(3000)
    TriggerEvent('glow:fleeca1')
end)

--RegisterNetEvent("glow:aaaa")
--AddEventHandler("glow:aaaa", function()
	--local vehicleName = 'kuruma2'
	
	--RequestModel(vehicleName)
	--while not HasModelLoaded(vehicleName) do
	--	Citizen.Wait(2)
	--end

	--local playerPed = PlayerPedId()
	--local pos = GetEntityCoords(playerPed)

	--local vehicle = CreateVehicle(vehicleName, -1184.82, -688.17, 40.36, GetEntityHeading(playerPed), true, false)

	--local blip = AddBlipForEntity(vehicle)
   -- SetBlipSprite(blip, 663)
    --SetBlipColour(blip, 11)

	--SetEntityAsNoLongerNeeded(vehicle)
   -- SetModelAsNoLongerNeeded(vehicleName)

   -- TriggerEvent("mt:missiontext", "Steal the ~g~Kurama", 500000)
   -- TriggerEvent("glow:wtf")
--end)

RegisterNetEvent("glow:wtf")
AddEventHandler("glow:wtf", function()
    TriggerEvent("mt:missiontext", "Steal the ~g~Kurama", 500000)
    Citizen.Wait(10000)
    local dialogue = {
        gxt = "tucarau", -- GXT name
        line = "TUCAR_SET", -- Line name without 1A lines and such
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
    TriggerEvent('glow:wtf2')
end)

RegisterCommand("wtftest", function()
    TriggerEvent('glow:wtf')
end)

RegisterCommand("wtftest2", function()
    TriggerEvent('glow:wtf2')
end)

RegisterNetEvent("glow:wtf2")
AddEventHandler("glow:wtf2", function()
    local dialogue = {
        gxt = "tucarau", -- GXT name
        line = "TUCAR_SET2", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:wtf3")
AddEventHandler("glow:wtf3", function()
    local dialogue = {
        gxt = "tucarau", -- GXT name
        line = "TUCAR_APPR", -- Line name without 1A lines and such
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
    Citizen.Wait(12000)
    TriggerEvent('glow:wtf4')
end)

RegisterNetEvent("glow:wtf4")
AddEventHandler("glow:wtf4", function()
    local dialogue = {
        gxt = "tucarau", -- GXT name
        line = "TUCAR_APP2", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:wtf5")
AddEventHandler("glow:wtf5", function()
    local dialogue = {
        gxt = "tucarau", -- GXT name
        line = "TUCAR_HAVE", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:fleeca1")
AddEventHandler("glow:fleeca1", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-1184.82, -688.17, 40.36)
    SetBlipSprite(blip, 663)
    SetBlipColour(blip, 11)
    SetBlipRoute(blip, true)
    TriggerEvent("glow:leaveho")
    local inArea = false
    local coords
    local dist
    TriggerEvent("glow:wtf")
    TriggerEvent("cS.MidsizeBanner", "~r~Fleeca Job - Kuruma", "Steal the Kuruma", 2, 9, true)
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-1226.92, -646.41, 25.9))
        if dist < 5 then
            inArea = true
            RemoveBlip(blip)
            print("worked")
            TriggerEvent('glow:spawnkuruma')
            alert('worked')
            TriggerEvent('glow:wtf3')
            TriggerEvent('glow:bombdefusechangemusic')
        end
    end
end)

RegisterNetEvent("glow:fleeca1")
AddEventHandler("glow:fleeca1", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-1184.82, -688.17, 40.36)
    SetBlipSprite(blip, 663)
    SetBlipColour(blip, 11)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist

    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-1184.82, -688.17, 40.36))
        if dist < 2 then
            inArea = true
            print("worked")
            RemoveBlip(blip)
            TriggerEvent('glow:wtf5')
            TriggerEvent('glow:fleecalaststep')
        end
    end
end)

RegisterNetEvent("glow:fleecalaststep")
AddEventHandler("glow:fleecalaststep", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(697.97, -987.16, 24.06)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(697.97, -987.16, 24.06))
        if dist < 2 then
            inArea = true
            print("worked")
            alert('worked')
            TriggerEvent('wk:deleteVehicle')
            TriggerEvent("glow:celeb")
            RemoveBlip(blip)
        end
    end
end)

RegisterNetEvent("glow:celeb")
AddEventHandler("glow:celeb", function()
    RequestCutscene("mph_fin_cel_apt")
    repeat Wait(0) until HasCutsceneLoaded()
    StartCutscene(0)
    Citizen.Wait(2000)
    TriggerEvent('heist:start')
    Citizen.Wait(10000)
    exports["DarkRP_XP"]:AddPlayerXPToServer(13456)
end)


RegisterNetEvent("glow:spawnkuruma")
AddEventHandler("glow:spawnkuruma", function()
	local vehicleName = 'kuruma2'
	
	RequestModel(vehicleName)
	while not HasModelLoaded(vehicleName) do
		Citizen.Wait(2)
	end

	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(playerPed)

	local vehicle = CreateVehicle(vehicleName, -1184.82, -688.17, 40.36, GetEntityHeading(playerPed), true, false)
end)

--actual heist

RegisterCommand('startheist', function()
    TriggerEvent('glow:fleecastartheist')
    
end)

RegisterCommand("microwave", function()
    TriggerEvent("cS.MidsizeBanner", "~y~SUCK MY DICK MICROWAVE", "BITCH", 2, 9, true)
end)

RegisterNetEvent("glow:fleecastartheist")
AddEventHandler("glow:fleecastartheist", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(707.71, -985.16, 24.11)
    TriggerEvent("glow:leaveho")
    SetBlipSprite(blip, 663)
    SetBlipColour(blip, 11)
    SetBlipRoute(blip, true)
    
    local vehicleName = 'kuruma2'
	
	RequestModel(vehicleName)
	while not HasModelLoaded(vehicleName) do
		Citizen.Wait(2)
	end

	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(playerPed)

	local vehicle = CreateVehicle(vehicleName, 707.71, -985.16, 24.11, GetEntityHeading(playerPed), true, false)
    TriggerEvent("cS.MidsizeBanner", "~r~Heist", "The Fleeca Job", 2, 9, true)
    TriggerEvent('glow:wtff1')
    TriggerEvent('glow:fleecamusic2')
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(707.71, -985.16, 24.11))
        if dist < 2 then
            inArea = true
            RemoveBlip(blip)
            TriggerEvent('glow:wtff3')
            TriggerEvent('glow:fleecagotobank')
            Citizen.Wait(7000)
            TriggerEvent('glow:wtff4')
        end
    end
end)

RegisterNetEvent("glow:wtff1")
AddEventHandler("glow:wtff1", function()
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
    Citizen.Wait(20000)
    TriggerEvent('glow:wtff2')
    alert('You are the ~b~Driller')
end)

RegisterNetEvent("glow:wtff2")
AddEventHandler("glow:wtff2", function()
    local dialogue = {
        gxt = "tufin", -- GXT name
        line = "TUFIN_APP", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:wtff3")
AddEventHandler("glow:wtff3", function()
    local dialogue = {
        gxt = "tufin", -- GXT name
        line = "TUFIN_APP2", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:fleecagotobank")
AddEventHandler("glow:fleecagotobank", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-2975.67, 481.34, 14.99)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-2975.67, 481.34, 14.99))
        if dist < 2 then
            inArea = true
            RemoveBlip(blip)
            TriggerEvent("glow:wtff7")
            TriggerEvent("glow:wtff8")
            TriggerEvent('glow:fleecaenter')
        end
    end
end)

RegisterNetEvent("glow:fleecabackcar")
AddEventHandler("glow:fleecabackcar", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-2975.67, 481.34, 14.99)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-2975.67, 481.34, 14.99))
        if dist < 2 then
            inArea = true
            RemoveBlip(blip)
            TriggerEvent('glow:escapefleeca')
            alert("Get back in the ~y~Kuruma")
        end
    end
end)

RegisterCommand("workplease", function()
    TriggerEvent('glow:fleecaenter')
end)

RegisterNetEvent("glow:fleecaenter")
AddEventHandler("glow:fleecaenter", function()
    local ped = PlayerPedId()
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-2957.78, 481.9, 15.7))
        if dist < 2 then
            inArea = true
            print("worked")
            SetEntityCoords(PlayerPedId(), -2957.74, 483.59, 15.68, true, true, true, false)
            TriggerEvent('glow:fleecafind')
        end
    end
end)

RegisterNetEvent("glow:fleecafind")
AddEventHandler("glow:fleecafind", function()
    local ped = PlayerPedId()
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-2952.96, 484.55, 15.68))
        if dist < 2 then
            inArea = true
            print("worked")
            TriggerEvent('glow:lesterkeypad')
        end
    end
end)

RegisterNetEvent("glow:fleecaleavevault")
AddEventHandler("glow:fleecaleavevault", function()
    local ped = PlayerPedId()
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-2957.74, 483.59, 15.68))
        if dist < 2 then
            inArea = true
            print("worked")
            SetEntityCoords(PlayerPedId(), -2957.88, 480.89, 15.71, true, true, true, false)
            TriggerEvent('glow:wantedlevel')
        end
    end
end)


RegisterNetEvent("glow:lesterexplain1")
AddEventHandler("glow:lesterexplain1", function()
    local dialogue = {
        gxt = "hs3fiau", -- GXT name
        line = "HS3F_ST2_1", -- Line name without 1A lines and such
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

RegisterCommand("workmaybe", function()
    TriggerEvent("glow:fleecagotobank")
end)

RegisterNetEvent("glow:wtff8")
AddEventHandler("glow:wtff8", function()
    Citizen.Wait(6000)
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

RegisterNetEvent("glow:wtff7")
AddEventHandler("glow:wtff7", function()
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

RegisterNetEvent("glow:lesterkeypad")
AddEventHandler("glow:lesterkeypad", function()
    TriggerEvent("utk_fingerprint:Start", 4, 6, 2, function(outcome, reason)
        if outcome == true then -- reason will be nil if outcome is true
            TriggerEvent('glow:fleecaleavevault')
            TriggerEvent('glow:fleecabackcar')
            TriggerEvent('wantedlevel')
            TriggerEvent('glow:fleecamusic1')
        elseif outcome == false then
            TriggerEvent('glow:fleccahack')
        end
    end)
end)

    RegisterNetEvent("glow:wtff4")
    AddEventHandler("glow:wtff4", function()
        local dialogue = {
            gxt = "tufin", -- GXT name
            line = "TUFIN_GETCAR", -- Line name without 1A lines and such
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
        Citizen.Wait(10000)
        TriggerEvent('glow:wtff5')
    end)

RegisterNetEvent("glow:wtff5")
AddEventHandler("glow:wtff5", function()
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
    Citizen.Wait(50000)
    TriggerEvent('glow:wtff6')
end)


RegisterNetEvent("glow:wtff6")
AddEventHandler("glow:wtff6", function()
    local dialogue = {
        gxt = "tufin", -- GXT name
        line = "TUFIN_NEAR", -- Line name without 1A lines and such
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

RegisterCommand('testingvoiceline', function()
    TriggerEvent('glow:wtff5')
end)

RegisterCommand('addit', function()
    exports["DarkRP_XP"]:AddPlayerXPToServer(1000)
end)

RegisterNetEvent("glow:escapefleeca")
AddEventHandler("glow:escapefleeca", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-2700.82, 2347.72, 16.95)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    TriggerEvent('glow:escape1')
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-2700.82, 2347.72, 16.95))
        if dist < 20 then
            inArea = true
            RemoveBlip(blip)
            TriggerEvent("glow:escape4")
            TriggerEvent("cS.MidsizeBanner", "~r~HELICOPTER INBOUND~s~", "", 5, 9, true)
            TriggerEvent("glow:fleecacut")
        end
    end
end)

RegisterNetEvent("glow:fleecamusic1")
AddEventHandler("glow:fleecamusic1", function()
    SetAudioFlag("WantedMusicDisabled", true)
    PrepareMusicEvent("EXTREME1_BIKE")
    Citizen.Wait(100)
    TriggerMusicEvent("EXTREME1_BIKE")
end)

RegisterNetEvent("glow:fleecamusic2")
AddEventHandler("glow:fleecamusic2", function()
    PrepareMusicEvent("HEIST_STATS_SCREEN_START")
	Citizen.Wait(100)
    TriggerMusicEvent("HEIST_STATS_SCREEN_START")
end)

RegisterCommand("pacific", function()
    RequestCutscene("mph_pac_fin_int")
    repeat Wait(0) until HasCutsceneLoaded()
    StartCutscene(10)
end)

RegisterNetEvent("glow:fleecacut")
AddEventHandler("glow:fleecacut", function()
    Citizen.Wait(10000)
    RequestCutscene("mph_tut_ext")
    repeat Wait(0) until HasCutsceneLoaded()
    StartCutscene(10)
end)

RegisterCommand("leaving", function()
    TriggerEvent('glow:escapefleeca')
end)

RegisterNetEvent("glow:escape1")
AddEventHandler("glow:escape1", function()
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
    TriggerEvent("glow:escape2")
end)

RegisterNetEvent("glow:escape2")
AddEventHandler("glow:escape2", function()
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
    Citizen.Wait(10000)
    TriggerEvent("glow:escape3")
end)

RegisterNetEvent("glow:escape3")
AddEventHandler("glow:escape3", function()
    local dialogue = {
        gxt = "tufin", -- GXT name
        line = "TUFIN_EDDIE", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:escape4")
AddEventHandler("glow:escape4", function()
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

RegisterNetEvent("glow:wantedlevel")
AddEventHandler("glow:wantedlevel", function()
    local ped = PlayerPedId()
    while true do
        Wait(0)

        SetPlayerWantedLevel(PlayerId(), 4, false)
        SetPlayerWantedLevelNow(PlayerId(), false)
    end
end)

RegisterNetEvent("glow:wantedleveloff")
AddEventHandler("glow:wantedleveloff", function()
    local ped = PlayerPedId()
    while true do
        Wait(0)

        SetPlayerWantedLevel(PlayerId(), 0, false)
        SetPlayerWantedLevelNow(PlayerId(), false)
    end
end)


RegisterNetEvent("glow:voltlab")
AddEventHandler("glow:voltlab", function()
    TriggerEvent('ultra-voltlab', 40, function(outcome ,reason)
        -- time: Time in seconds which player has. Min is 10, Max is 60
        -- result: Reason is the reason of result. Result is an integer code which represents result.
        -- 	   0: Hack failed by player
        -- 	   1: Hack successful
        -- 	   2: Time ran out and hack failed
        -- 	  -1: Error occured i.e. passed input or contents in config is wrong
            if outcome == 0 then
                print('Hack failed', reason)
            elseif outcome == 1 then
                TriggerEvent('glow:wtff4')
            elseif outcome == 2 then
                print('Timed out')
            elseif outcome == -1 then
                print('Error occured',reason)
            end
        end)
    end)

--pacific heist!!
RegisterCommand("startpac", function()
TriggerEvent("glow:startpac")
end)


RegisterNetEvent("glow:startpac")
AddEventHandler("glow:startpac", function()
    TriggerEvent("glow:leaveho")
    Citizen.Wait(2000)
    TriggerEvent("cS.MidsizeBanner", "~p~Heist", "The Pacific Standard Job", 2, 9, true)
    TriggerEvent("glow:pwaypoint1")
    PrepareMusicEvent("BIKER_DEFEND_POLICE_RAID_START")
	Citizen.Wait(100)
    TriggerMusicEvent("BIKER_DEFEND_POLICE_RAID_START")
end)

RegisterNetEvent("glow:pwaypoint1")
AddEventHandler("glow:pwaypoint1", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(229.11, 214.07, 105.54)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    TriggerEvent('glow:pacific1')
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(229.11, 214.07, 105.54))
        if dist < 3 then
            inArea = true
            RemoveBlip(blip)
            TriggerEvent('glow:pacenter')
            SetEntityCoords(PlayerPedId(), 238.3, 223.65, 106.29, true, true, true, false)
        end
    end
end)

RegisterNetEvent("glow:pacific1")
AddEventHandler("glow:pacific1", function()
    local dialogue = {
        gxt = "obhfau", -- GXT name
        line = "OBHF_SETR2", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:pacific2")
AddEventHandler("glow:pacific2", function()
    local dialogue = {
        gxt = "obhfau", -- GXT name
        line = "OBHF2", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:pacific3")
AddEventHandler("glow:pacific3", function()
    Citizen.Wait(8000)
    local dialogue = {
        gxt = "obhfau", -- GXT name
        line = "OBHF4", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:pacific4")
AddEventHandler("glow:pacific4", function()
    local dialogue = {
        gxt = "obhfau", -- GXT name
        line = "OBHF_SECOND", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:pacific5")
AddEventHandler("glow:pacific5", function()
    Citizen.Wait(5000)
    local dialogue = {
        gxt = "obhfau", -- GXT name
        line = "OBHF6", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:pacific6")
AddEventHandler("glow:pacific6", function()
    local dialogue = {
        gxt = "obhfau", -- GXT name
        line = "OBHF8", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:pacific7")
AddEventHandler("glow:pacific7", function()
    Citizen.Wait(5000)
    local dialogue = {
        gxt = "obhfau", -- GXT name
        line = "OBHF10", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:pacific8")
AddEventHandler("glow:pacific8", function()
    Citizen.Wait(5000)
    local dialogue = {
        gxt = "obhfau", -- GXT name
        line = "OBHF11", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:door1")
AddEventHandler("glow:door1", function()
    local pid = PlayerPedId()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_prop_heist_thermite_flash")
    RequestModel("hei_p_m_bag_var22_arm_s")
    while (not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge"))
        or not HasModelLoaded("hei_prop_heist_thermite_flash")
        or not HasModelLoaded("hei_p_m_bag_var22_arm_s") do
            Citizen.Wait(0)
    end
    TaskPlayAnim(pid,"anim@heists@ornate_bank@thermal_charge","thermal_charge",1.0,-1.0, 5000, 0, 1, true, true, true)
    Citizen.Wait(6000)
    TriggerEvent('glow:pacific4')
    TriggerEvent('glow:charges2')
end)

RegisterNetEvent("glow:door2")
AddEventHandler("glow:door2", function()
    local pid = PlayerPedId()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_prop_heist_thermite_flash")
    RequestModel("hei_p_m_bag_var22_arm_s")
    while (not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge"))
        or not HasModelLoaded("hei_prop_heist_thermite_flash")
        or not HasModelLoaded("hei_p_m_bag_var22_arm_s") do
            Citizen.Wait(0)
    end
    TaskPlayAnim(pid,"anim@heists@ornate_bank@thermal_charge","thermal_charge",1.0,-1.0, 5000, 0, 1, true, true, true)
    Citizen.Wait(6000)
    TriggerEvent('glow:pachack')
end)

RegisterNetEvent("glow:door3")
AddEventHandler("glow:door3", function()
    local pid = PlayerPedId()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_prop_heist_thermite_flash")
    RequestModel("hei_p_m_bag_var22_arm_s")
    while (not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge"))
        or not HasModelLoaded("hei_prop_heist_thermite_flash")
        or not HasModelLoaded("hei_p_m_bag_var22_arm_s") do
            Citizen.Wait(0)
    end
    TaskPlayAnim(pid,"anim@heists@ornate_bank@thermal_charge","thermal_charge",1.0,-1.0, 5000, 0, 1, true, true, true)
    Citizen.Wait(3000)
    TriggerEvent('glow:pacific7')
end)

RegisterNetEvent("glow:pull")
AddEventHandler("glow:pull", function()
    local pid = PlayerPedId()
    RequestAnimDict("missheist_agency3amcs_2")
    while (not HasAnimDictLoaded("missheist_agency3amcs_2")) do 
        Citizen.Wait(0)
    end
    TaskPlayAnim(pid,"missheist_agency3amcs_2","pull_driver_player1",1.0,-1.0, 5000, 0, 1, true, true, true)
    Citizen.Wait(3000)
    TriggerEvent('glow:pacific8')
end)


RegisterNetEvent("glow:slowmo")
AddEventHandler("glow:slowmo", function()
    Citizen.Wait(2000)
    TriggerEvent("cS.MidsizeBanner", "~r~DEAD EYE~w~", "~B~SPRAY AND PRAY", 5, 9, true)
    AnimpostfxPlay('SwitchOpenMichaelIn', 500, true)
    SetSpecialAbility(PlayerId(), 2, 1)
    SpecialAbilityActivate(PlayerId(), 1)
    Citizen.Wait(10000)
    AnimpostfxStopAll()
    SpecialAbilityDeactivateFast(PlayerId(), 1)
end)



RegisterNetEvent("glow:datahack")
AddEventHandler("glow:datahack", function()
    TriggerEvent("datacrack:start", 3, function(output)
        if output == true then
        TriggerEvent("glow:pacific6")
        SetEntityCoords(PlayerPedId(), 253.2, 223.13, 101.68, true, true, true, false)
        TriggerEvent('glow:grabcash')
        else
        print("idk")
        end
    end)
end)

RegisterNetEvent("glow:grabcash")
AddEventHandler("glow:grabcash", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(253.29, 221.26, 101.68)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(253.29, 221.26, 101.68))
        if dist < 1 then
            inArea = true
            RemoveBlip(blip)
            TriggerEvent('glow:door3')
            TriggerEvent('glow:pullbox')
        end
    end
end)

RegisterNetEvent("glow:pullbox")
AddEventHandler("glow:pullbox", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(265.39, 213.72, 101.68)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(265.39, 213.72, 101.68))
        if dist < 1 then
            inArea = true
            RemoveBlip(blip)
            SetEntityHeading(PlayerPedId(), 75.0)
            TriggerEvent('glow:pull')
            TriggerEvent('glow:regroup')
        end
    end
end)

RegisterNetEvent("glow:regroup")
AddEventHandler("glow:regroup", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(234.21, 216.42, 106.29)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(234.21, 216.42, 106.29))
        if dist < 1 then
            inArea = true
            RemoveBlip(blip)
            SetEntityHeading(PlayerPedId(), 75.0)
            TriggerEvent('glow:pacleave')
        end
    end
end)

RegisterCommand("ScreenTesting", function()
    AnimpostfxPlay('FocusIn', 500, true)
    Citizen.Wait(10000)
    AnimpostfxPlay('FocusOut', 500, true)
end)

RegisterCommand("stoptesting", function()
    AnimpostfxStopAll()

end)

RegisterCommand("musictestingg", function()
    PrepareMusicEvent("MP_MC_SUSPENSE_HFIN")
	Citizen.Wait(100)
    TriggerMusicEvent("MP_MC_SUSPENSE_HFIN")
end)

RegisterNetEvent("glow:charges1")
AddEventHandler("glow:charges1", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(256.91, 219.58, 106.29)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    TriggerEvent('glow:pacific2')
    TriggerEvent('glow:pacific3')
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(256.91, 219.58, 106.29))
        if dist < 1 then
            inArea = true
            RemoveBlip(blip)
            TriggerEvent('glow:door1')
        end
    end
end)

RegisterNetEvent("glow:charges2")
AddEventHandler("glow:charges2", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(261.21, 221.96, 106.28)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(261.21, 221.96, 106.28))
        if dist < 1 then
            inArea = true
            RemoveBlip(blip)
            TriggerEvent('glow:door2')
        end
    end
end)

RegisterNetEvent("glow:charges3")
AddEventHandler("glow:charges3", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(253.27, 221.24, 101.68)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(253.27, 221.24, 101.68))
        if dist < 1 then
            inArea = true
            RemoveBlip(blip)
            TriggerEvent('glow:door2')
        end
    end
end)

RegisterNetEvent("glow:pachack")
AddEventHandler("glow:pachack", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(253.16, 228.4, 101.68)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    TriggerEvent("glow:pacific5")
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(253.16, 228.4, 101.68))
        if dist < 1 then
            inArea = true
            RemoveBlip(blip)
            TriggerEvent('glow:datahack')
        end
    end
end)


RegisterNetEvent("glow:pacroute1")
AddEventHandler("glow:pacroute1", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(263.36, 131.16, 102.98)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(263.36, 131.16, 102.98))
        if dist < 3 then
            inArea = true
            RemoveBlip(blip)
            TriggerEvent('glow:pacrun2')
            TriggerEvent('glow:pacroute2')
        end
    end
end)

RegisterNetEvent("glow:pacroute2")
AddEventHandler("glow:pacroute2", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(246.45, 82.68, 92.95)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(246.45, 82.68, 92.95))
        if dist < 3 then
            inArea = true
            RemoveBlip(blip)
            TriggerEvent('glow:paccc')
            TriggerEvent('glow:pacroute3')
        end
    end
end)

RegisterNetEvent("glow:pacroute3")
AddEventHandler("glow:pacroute3", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(211.38, 55.43, 83.84)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(211.38, 55.43, 83.84))
        if dist < 3 then
            inArea = true
            RemoveBlip(blip)
            TriggerEvent('glow:pacc')
            TriggerEvent('glow:pacroute4')
        end
    end
end)

RegisterCommand("asd", function()
    TriggerEvent('glow:pacroute4')
end)

RegisterNetEvent("glow:pacroute4")
AddEventHandler("glow:pacroute4", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(123.64, 96.05, 81.76)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(123.64, 96.05, 81.76))
        if dist < 3 then
            inArea = true
            RemoveBlip(blip)
            TriggerEvent('glow:grabgo')
            TriggerEvent("glow:pacspawn")
            TriggerEvent('glow:pacroute5')
        end
    end
end)



RegisterNetEvent("glow:pacroute5")
AddEventHandler("glow:pacroute5", function()
    local ped = PlayerPedId()
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(11.76, 113.38, 79.02))
        if dist < 3 then
            inArea = true
            TriggerEvent('glow:pacroute6')
        end
    end
end)

RegisterNetEvent("glow:pacroute6")
AddEventHandler("glow:pacroute6", function()
    local ped = PlayerPedId()
    local blip = AddBlipForCoord(-134.07, 4615.48, 125.29)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 5)
    SetBlipRoute(blip, true)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(-134.07, 4615.48, 125.29))
        if dist < 3 then
            inArea = true
            RemoveBlip(blip)
        end
    end
end)

RegisterNetEvent("glow:pacspawn")
AddEventHandler("glow:pacspawn", function()
	local vehicleName = 'lectro'
	
	RequestModel(vehicleName)
	while not HasModelLoaded(vehicleName) do
		Citizen.Wait(2)
	end

	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(playerPed)

	local vehicle = CreateVehicle(vehicleName, 11.76, 113.38, 79.02, GetEntityHeading(playerPed), true, false)

	local blip = AddBlipForEntity(vehicle)
    SetBlipSprite(blip, 226)
    SetBlipColour(blip, 5)

	SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)


    TriggerEvent("cS.MidsizeBanner", "~b~GET TO THE LECTRO~w~", "", 5, 9, true)
end)

RegisterNetEvent("glow:pacrun1")
AddEventHandler("glow:pacrun1", function()
    Citizen.Wait(5000)
    local dialogue = {
        gxt = "obhfau", -- GXT name
        line = "OBHF13", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:pacrun2")
AddEventHandler("glow:pacrun2", function()
    local dialogue = {
        gxt = "obhfau", -- GXT name
        line = "OBHF15", -- Line name without 1A lines and such
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
    TriggerEvent('glow:pacrun3')
end)

RegisterNetEvent("glow:pacrun3")
AddEventHandler("glow:pacrun3", function()
    Citizen.Wait(7000)
    local dialogue = {
        gxt = "obhfau", -- GXT name
        line = "OBHF_ENCOUR2", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:paccc")
AddEventHandler("glow:paccc", function()
    Citizen.Wait(7000)
    local dialogue = {
        gxt = "obhfau", -- GXT name
        line = "OBHF_ENCOUR", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:upstate")
AddEventHandler("glow:upstate", function()
    Citizen.Wait(15000)
    local dialogue = {
        gxt = "obhfau", -- GXT name
        line = "OBHF_DIN", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:pacc")
AddEventHandler("glow:pacc", function()
    local dialogue = {
        gxt = "obhfau", -- GXT name
        line = "OBHF17", -- Line name without 1A lines and such
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

RegisterNetEvent("glow:grabgo")
AddEventHandler("glow:grabgo", function()
    local dialogue = {
        gxt = "obhfau", -- GXT name
        line = "OBHF_MORE", -- Line name without 1A lines and such
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
    TriggerEvent('glow:upstate')
end)

RegisterCommand("huh", function()
    TriggerEvent("glow:grabgo")
end)

RegisterNetEvent("glow:pacenter")
AddEventHandler("glow:pacenter", function()
    PrepareMusicEvent("BIKER_DEFEND_POLICE_RAID_DELIVERING")
	Citizen.Wait(100)
    TriggerMusicEvent("BIKER_DEFEND_POLICE_RAID_DELIVERING")
    RequestCutscene('mph_pac_fin_mcs0', 8) -- Usually 8.
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
    
    TriggerEvent('glow:charges1')
    TriggerEvent('glow:spawnguards')

end)

RegisterNetEvent("glow:pacleave")
AddEventHandler("glow:pacleave", function()
    TriggerEvent('glow:pacmusic')
    RequestCutscene('mph_pac_fin_mcs1', 8) -- Usually 8.
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

    
    TriggerEvent('glow:pacrun1')
    TriggerEvent('glow:pacroute1')
    TriggerEvent('glow:cop')
    TriggerEvent('glow:cop2')
    TriggerEvent('glow:cop3')
    TriggerEvent('glow:cop4')
    TriggerEvent('glow:cop5')
    TriggerEvent('glow:cop6')
    TriggerEvent('glow:cop7')
    TriggerEvent('glow:cop8')
    TriggerEvent('glow:cop9')
    TriggerEvent('glow:pac1')
    TriggerEvent('glow:pac2')
    TriggerEvent('glow:pac3')
    TriggerEvent('glow:pac4')
    TriggerEvent('glow:pac5')
    TriggerEvent('glow:pac6')
    TriggerEvent('glow:pac7')
    TriggerEvent('glow:pac8')
    TriggerEvent('glow:pac9')
    TriggerEvent('glow:pac10')
    TriggerEvent('glow:pac11')
    TriggerEvent('glow:pac12')
    TriggerEvent('glow:slowmo')
    

end)

RegisterCommand("pacleavecut", function()
    TriggerEvent('glow:pacleave')
end)

RegisterNetEvent("glow:spawnguards")
AddEventHandler("glow:spawnguards", function()
    TriggerEvent('glow:spawnguard')
    TriggerEvent('glow:spawnguard2')
end)

RegisterNetEvent("glow:spawnguard")
AddEventHandler("glow:spawnguard", function()
    local generalPed
    local generalLoaded = false
    local pos = GetEntityCoords(generalPed)
    local PlayingAnim = false
    local general_peds = {
        {x=246.79, y=218.69, z=106.29, a=245.000457763672},
    }
    while true do
      Citizen.Wait(0)
      
      if (not generalLoaded) then
        
        for k,v in ipairs(general_peds) do
          RequestModel(GetHashKey("mp_m_securoguard_01"))
          while not HasModelLoaded(GetHashKey("mp_m_securoguard_01")) do
            Wait(1)
          end
          
          generalPed = CreatePed(2, "mp_m_securoguard_01", v.x, v.y, v.z, v.a, false, false)
          GiveWeaponToPed(generalPed, GetHashKey("WEAPON_PISTOL"), 1, false, false)
          SetPedAsEnemy(generalPed, true)
          

          local blip = AddBlipForEntity(generalPed)
          SetBlipSprite(blip, 270)
          SetBlipColour(blip, 23)
          
          while not IsEntityDead(generalPed) do
            Citizen.Wait(2)
          end

          if IsEntityDead(generalPed) then
            RemoveBlip(blip)
          end
          
        end
        generalLoaded = true
          
      end
      
    end
  end)

  RegisterNetEvent("glow:spawnguard2")
  AddEventHandler("glow:spawnguard2", function()
      local generalPed
      local generalLoaded = false
      local pos = GetEntityCoords(generalPed)
      local PlayingAnim = false
      local general_peds = {
          {x=251.69, y=218.69, z=106.29, a=245.000457763672},
      }
      while true do
        Citizen.Wait(0)
        
        if (not generalLoaded) then
          
          for k,v in ipairs(general_peds) do
            RequestModel(GetHashKey("mp_m_securoguard_01"))
            while not HasModelLoaded(GetHashKey("mp_m_securoguard_01")) do
              Wait(1)
            end
            
            generalPed = CreatePed(2, "mp_m_securoguard_01", v.x, v.y, v.z, v.a, false, false)
            GiveWeaponToPed(generalPed, GetHashKey("WEAPON_PISTOL"), 1, false, false)
            SetPedAsEnemy(generalPed, true)
            
  
            local blip = AddBlipForEntity(generalPed)
            SetBlipSprite(blip, 270)
            SetBlipColour(blip, 23)
            
            while not IsEntityDead(generalPed) do
              Citizen.Wait(2)
            end
  
            if IsEntityDead(generalPed) then
              RemoveBlip(blip)
            end
            
          end
          generalLoaded = true
            
        end
        
      end
    end)

local config = {
    pedFrequency = 0.2,
    trafficFrequency = 0.2,
}

RegisterNetEvent("glow:cop")
AddEventHandler("glow:cop", function()
    local generalPed
    local generalLoaded = false
    local pos = GetEntityCoords(generalPed)
    local PlayingAnim = false
    local general_peds = {
        {x=216.91, y=205.96, z=105.55, a=292.55},
    }
    while true do
      Citizen.Wait(0)
      
      if (not generalLoaded) then
        
        for k,v in ipairs(general_peds) do
          RequestModel(GetHashKey("s_m_y_cop_01"))
          while not HasModelLoaded(GetHashKey("s_m_y_cop_01")) do
            Wait(1)
          end
          
          generalPed = CreatePed(2, "s_m_y_cop_01", v.x, v.y, v.z, v.a, false, false)
          GiveWeaponToPed(generalPed, GetHashKey("WEAPON_PISTOL"), 1, false, false)
          SetPedAsEnemy(generalPed, true)
          

          local blip = AddBlipForEntity(generalPed)
          SetBlipSprite(blip, 270)
          SetBlipColour(blip, 23)
          
          while not IsEntityDead(generalPed) do
            Citizen.Wait(2)
          end

          if IsEntityDead(generalPed) then
            RemoveBlip(blip)
          end
          
        end
        generalLoaded = true
          
      end
      
    end
  end)

RegisterNetEvent("glow:cop2")
AddEventHandler("glow:cop2", function()
    local generalPed
    local generalLoaded = false
    local pos = GetEntityCoords(generalPed)
    local PlayingAnim = false
    local general_peds = {
        {x=198.18, y=190.47, z=105.57, a=311.47},
    }
    while true do
      Citizen.Wait(0)
      
      if (not generalLoaded) then
        
        for k,v in ipairs(general_peds) do
          RequestModel(GetHashKey("s_m_y_cop_01"))
          while not HasModelLoaded(GetHashKey("s_m_y_cop_01")) do
            Wait(1)
          end
          
          generalPed = CreatePed(2, "s_m_y_cop_01", v.x, v.y, v.z, v.a, false, false)
          GiveWeaponToPed(generalPed, GetHashKey("WEAPON_PISTOL"), 1, false, false)
          SetPedAsEnemy(generalPed, true)
          

          local blip = AddBlipForEntity(generalPed)
          SetBlipSprite(blip, 270)
          SetBlipColour(blip, 23)
          
          while not IsEntityDead(generalPed) do
            Citizen.Wait(2)
          end

          if IsEntityDead(generalPed) then
            RemoveBlip(blip)
          end
          
        end
        generalLoaded = true
          
      end
      
    end
  end)

  RegisterNetEvent("glow:cop3")
  AddEventHandler("glow:cop3", function()
      local generalPed
      local generalLoaded = false
      local pos = GetEntityCoords(generalPed)
      local PlayingAnim = false
      local general_peds = {
          {x=196.8, y=187.57, z=105.55, a=300.67},
      }
      while true do
        Citizen.Wait(0)
        
        if (not generalLoaded) then
          
          for k,v in ipairs(general_peds) do
            RequestModel(GetHashKey("s_m_y_cop_01"))
            while not HasModelLoaded(GetHashKey("s_m_y_cop_01")) do
              Wait(1)
            end
            
            generalPed = CreatePed(2, "s_m_y_cop_01", v.x, v.y, v.z, v.a, false, false)
            GiveWeaponToPed(generalPed, GetHashKey("WEAPON_PISTOL"), 1, false, false)
            SetPedAsEnemy(generalPed, true)
            
  
            local blip = AddBlipForEntity(generalPed)
            SetBlipSprite(blip, 270)
            SetBlipColour(blip, 23)
            
            while not IsEntityDead(generalPed) do
              Citizen.Wait(2)
            end
  
            if IsEntityDead(generalPed) then
              RemoveBlip(blip)
            end
            
          end
          generalLoaded = true
            
        end
        
      end
    end)


  RegisterNetEvent("glow:cop3")
  AddEventHandler("glow:cop3", function()
      local generalPed
      local generalLoaded = false
      local pos = GetEntityCoords(generalPed)
      local PlayingAnim = false
      local general_peds = {
          {x=196.8, y=187.57, z=105.55, a=300.67},
      }
      while true do
        Citizen.Wait(0)
        
        if (not generalLoaded) then
          
          for k,v in ipairs(general_peds) do
            RequestModel(GetHashKey("s_m_y_cop_01"))
            while not HasModelLoaded(GetHashKey("s_m_y_cop_01")) do
              Wait(1)
            end
            
            generalPed = CreatePed(2, "s_m_y_cop_01", v.x, v.y, v.z, v.a, false, false)
            GiveWeaponToPed(generalPed, GetHashKey("WEAPON_PISTOL"), 1, false, false)
            SetPedAsEnemy(generalPed, true)
            
  
            local blip = AddBlipForEntity(generalPed)
            SetBlipSprite(blip, 270)
            SetBlipColour(blip, 23)
            
            while not IsEntityDead(generalPed) do
              Citizen.Wait(2)
            end
  
            if IsEntityDead(generalPed) then
              RemoveBlip(blip)
            end
            
          end
          generalLoaded = true
            
        end
        
      end
    end)

RegisterNetEvent("glow:cop4")
AddEventHandler("glow:cop4", function()
    local generalPed
    local generalLoaded = false
    local pos = GetEntityCoords(generalPed)
    local PlayingAnim = false
    local general_peds = {
        {x=214.69, y=177.37, z=105.4, a=358.61},
    }
    while true do
      Citizen.Wait(0)
      
      if (not generalLoaded) then
        
        for k,v in ipairs(general_peds) do
          RequestModel(GetHashKey("s_m_y_cop_01"))
          while not HasModelLoaded(GetHashKey("s_m_y_cop_01")) do
            Wait(1)
          end
          
          generalPed = CreatePed(2, "s_m_y_cop_01", v.x, v.y, v.z, v.a, false, false)
          GiveWeaponToPed(generalPed, GetHashKey("WEAPON_PISTOL"), 1, false, false)
          SetPedAsEnemy(generalPed, true)
          

          local blip = AddBlipForEntity(generalPed)
          SetBlipSprite(blip, 270)
          SetBlipColour(blip, 23)
          
          while not IsEntityDead(generalPed) do
            Citizen.Wait(2)
          end

          if IsEntityDead(generalPed) then
            RemoveBlip(blip)
          end
          
        end
        generalLoaded = true
          
      end
      
    end
  end)

RegisterNetEvent("glow:cop5")
AddEventHandler("glow:cop5", function()
    local generalPed
    local generalLoaded = false
    local pos = GetEntityCoords(generalPed)
    local PlayingAnim = false
    local general_peds = {
        {x=194.47, y=197.16, z=105.58, a=274.73},
    }
    while true do
      Citizen.Wait(0)
      
      if (not generalLoaded) then
        
        for k,v in ipairs(general_peds) do
          RequestModel(GetHashKey("s_m_y_swat_01"))
          while not HasModelLoaded(GetHashKey("s_m_y_swat_01")) do
            Wait(1)
          end
          
          generalPed = CreatePed(2, "s_m_y_swat_01", v.x, v.y, v.z, v.a, false, false)
          GiveWeaponToPed(generalPed, GetHashKey("WEAPON_PISTOL"), 1, false, false)
          SetPedAsEnemy(generalPed, true)
          

          local blip = AddBlipForEntity(generalPed)
          SetBlipSprite(blip, 270)
          SetBlipColour(blip, 23)
          
          while not IsEntityDead(generalPed) do
            Citizen.Wait(2)
          end

          if IsEntityDead(generalPed) then
            RemoveBlip(blip)
          end
          
        end
        generalLoaded = true
          
      end
      
    end
  end)

RegisterNetEvent("glow:cop6")
AddEventHandler("glow:cop6", function()
    local generalPed
    local generalLoaded = false
    local pos = GetEntityCoords(generalPed)
    local PlayingAnim = false
    local general_peds = {
        {x=194.48, y=200.62, z=105.57, a=274.73},
    }
    while true do
      Citizen.Wait(0)
      
      if (not generalLoaded) then
        
        for k,v in ipairs(general_peds) do
          RequestModel(GetHashKey("s_m_y_swat_01"))
          while not HasModelLoaded(GetHashKey("s_m_y_swat_01")) do
            Wait(1)
          end
          
          generalPed = CreatePed(2, "s_m_y_swat_01", v.x, v.y, v.z, v.a, false, false)
          GiveWeaponToPed(generalPed, GetHashKey("WEAPON_PISTOL"), 1, false, false)
          SetPedAsEnemy(generalPed, true)
          

          local blip = AddBlipForEntity(generalPed)
          SetBlipSprite(blip, 270)
          SetBlipColour(blip, 23)
          
          while not IsEntityDead(generalPed) do
            Citizen.Wait(2)
          end

          if IsEntityDead(generalPed) then
            RemoveBlip(blip)
          end
          
        end
        generalLoaded = true
          
      end
      
    end
  end)

RegisterNetEvent("glow:cop7")
AddEventHandler("glow:cop7", function()
    local generalPed
    local generalLoaded = false
    local pos = GetEntityCoords(generalPed)
    local PlayingAnim = false
    local general_peds = {
        {x=222.16, y=210.55, z=105.55, a=296.3},
    }
    while true do
      Citizen.Wait(0)
      
      if (not generalLoaded) then
        
        for k,v in ipairs(general_peds) do
          RequestModel(GetHashKey("s_m_y_swat_01"))
          while not HasModelLoaded(GetHashKey("s_m_y_swat_01")) do
            Wait(1)
          end
          
          generalPed = CreatePed(2, "s_m_y_swat_01", v.x, v.y, v.z, v.a, false, false)
          GiveWeaponToPed(generalPed, GetHashKey("WEAPON_PISTOL"), 1, false, false)
          SetPedAsEnemy(generalPed, true)
          

          local blip = AddBlipForEntity(generalPed)
          SetBlipSprite(blip, 270)
          SetBlipColour(blip, 23)
          
          while not IsEntityDead(generalPed) do
            Citizen.Wait(2)
          end

          if IsEntityDead(generalPed) then
            RemoveBlip(blip)
          end
          
        end
        generalLoaded = true
          
      end
      
    end
  end)

RegisterNetEvent("glow:cop8")
AddEventHandler("glow:cop8", function()
    local generalPed
    local generalLoaded = false
    local pos = GetEntityCoords(generalPed)
    local PlayingAnim = false
    local general_peds = {
        {x=226.42, y=207.79, z=105.52, a=328.16},
    }
    while true do
      Citizen.Wait(0)
      
      if (not generalLoaded) then
        
        for k,v in ipairs(general_peds) do
          RequestModel(GetHashKey("s_m_y_swat_01"))
          while not HasModelLoaded(GetHashKey("s_m_y_swat_01")) do
            Wait(1)
          end
          
          generalPed = CreatePed(2, "s_m_y_swat_01", v.x, v.y, v.z, v.a, false, false)
          GiveWeaponToPed(generalPed, GetHashKey("WEAPON_PISTOL"), 1, false, false)
          SetPedAsEnemy(generalPed, true)
          

          local blip = AddBlipForEntity(generalPed)
          SetBlipSprite(blip, 270)
          SetBlipColour(blip, 23)
          
          while not IsEntityDead(generalPed) do
            Citizen.Wait(2)
          end

          if IsEntityDead(generalPed) then
            RemoveBlip(blip)
          end
          
        end
        generalLoaded = true
          
      end
      
    end
  end)

RegisterNetEvent("glow:cop9")
AddEventHandler("glow:cop9", function()
    local generalPed
    local generalLoaded = false
    local pos = GetEntityCoords(generalPed)
    local PlayingAnim = false
    local general_peds = {
        {x=222.31, y=212.42, z=105.52, a=284.72},
    }
    while true do
      Citizen.Wait(0)
      
      if (not generalLoaded) then
        
        for k,v in ipairs(general_peds) do
          RequestModel(GetHashKey("s_m_y_swat_01"))
          while not HasModelLoaded(GetHashKey("s_m_y_swat_01")) do
            Wait(1)
          end
          
          generalPed = CreatePed(2, "s_m_y_swat_01", v.x, v.y, v.z, v.a, false, false)
          GiveWeaponToPed(generalPed, GetHashKey("WEAPON_PISTOL"), 1, false, false)
          SetPedAsEnemy(generalPed, true)
          

          local blip = AddBlipForEntity(generalPed)
          SetBlipSprite(blip, 270)
          SetBlipColour(blip, 23)
          
          while not IsEntityDead(generalPed) do
            Citizen.Wait(2)
          end

          if IsEntityDead(generalPed) then
            RemoveBlip(blip)
          end
          
        end
        generalLoaded = true
          
      end
      
    end
  end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetPedDensityMultiplierThisFrame(config.pedFrequency) -- https://runtime.fivem.net/doc/natives/#_0x95E3D6257B166CF2
        --[[ 
        Values:  
        → 0.0 = no peds on streets  
        → 1.0 = normal peds on streets   
        ]]
        SetScenarioPedDensityMultiplierThisFrame(config.pedFrequency, config.pedFrequency) -- https://runtime.fivem.net/doc/natives/#_0x7A556143A1C03898
        -------------------------------
        SetRandomVehicleDensityMultiplierThisFrame(config.trafficFrequency) -- https://runtime.fivem.net/doc/natives/#_0xB3B3359379FE77D3
        SetParkedVehicleDensityMultiplierThisFrame(config.trafficFrequency) -- https://runtime.fivem.net/doc/natives/#_0xEAE6DCC7EEE3DB1D
        SetVehicleDensityMultiplierThisFrame(config.trafficFrequency) -- https://runtime.fivem.net/doc/natives/#_0x245A6883D966D537
        --[[ 
        Use this native inside a looped function.
        Values:
        0.0 = no vehicles on streets
        1.0 = normal vehicles on streets
        0.0 ≤ x ≤ 1.0
        ]]
    end 
end)


RegisterNetEvent("glow:pac1")
AddEventHandler("glow:pac1", function()
    local vehicleName = 'police3'
            
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Citizen.Wait(2)
    end
        
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
        
    local vehicle = CreateVehicle(vehicleName, 219.2, 207.97, 105.19, 221, GetEntityHeading(playerPed), true, false)
        
    local blip = AddBlipForEntity(vehicle)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 3)


end)


RegisterNetEvent("glow:pac2")
AddEventHandler("glow:pac2", function()
    local vehicleName = 'police3'
            
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Citizen.Wait(2)
    end
        
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
        
    local vehicle = CreateVehicle(vehicleName, 219.2, 207.97, 105.19, 75, GetEntityHeading(playerPed), true, false)
        
    local blip = AddBlipForEntity(vehicle)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 3)
        


end)

RegisterNetEvent("glow:pac3")
AddEventHandler("glow:pac3", function()
    local vehicleName = 'police3'
            
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Citizen.Wait(2)
    end
        
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
        
    local vehicle = CreateVehicle(vehicleName, 213.15, 176.19, 105.16, 86.62, GetEntityHeading(playerPed), true, false)
        
    local blip = AddBlipForEntity(vehicle)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 3)
        


end)

RegisterNetEvent("glow:pac4")
AddEventHandler("glow:pac4", function()
    local vehicleName = 'riot'
            
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Citizen.Wait(2)
    end
        
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
        
    local vehicle = CreateVehicle(vehicleName, 192.66, 199.87, 105.33, 224, GetEntityHeading(playerPed), true, false)
        
    local blip = AddBlipForEntity(vehicle)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 3)
        


end)

RegisterNetEvent("glow:pac5")
AddEventHandler("glow:pac5", function()
    local vehicleName = 'police3'
            
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Citizen.Wait(2)
    end
        
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
        
    local vehicle = CreateVehicle(vehicleName, 197.28, 189.37, 105.33, 27.34, GetEntityHeading(playerPed), true, false)
        
    local blip = AddBlipForEntity(vehicle)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 3)
        


end)

RegisterNetEvent("glow:pac6")
AddEventHandler("glow:pac6", function()
    local vehicleName = 'riot'
            
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Citizen.Wait(2)
    end
        
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
        
    local vehicle = CreateVehicle(vehicleName, 283.15, 160.87, 104.37, 161.36, GetEntityHeading(playerPed), true, false)
        
    local blip = AddBlipForEntity(vehicle)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 3)
        


end)

RegisterNetEvent("glow:pac7")
AddEventHandler("glow:pac7", function()
    local vehicleName = 'riot'
            
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Citizen.Wait(2)
    end
        
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
        
    local vehicle = CreateVehicle(vehicleName, 285.81, 170.95, 104.37, 161.36, GetEntityHeading(playerPed), true, false)
        
    local blip = AddBlipForEntity(vehicle)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 3)
        


end)

RegisterNetEvent("glow:pac8")
AddEventHandler("glow:pac8", function()
    local vehicleName = 'police3'
            
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Citizen.Wait(2)
    end
        
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
        
    local vehicle = CreateVehicle(vehicleName, 202.56, 200.07, 105.34, 224.02, GetEntityHeading(playerPed), true, false)
        
    local blip = AddBlipForEntity(vehicle)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 3)
        


end)

RegisterNetEvent("glow:pac9")
AddEventHandler("glow:pac9", function()
    local vehicleName = 'police3'
            
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Citizen.Wait(2)
    end
        
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
        
    local vehicle = CreateVehicle(vehicleName, 212.39, 188.93, 105.39, 282.54, GetEntityHeading(playerPed), true, false)
        
    local blip = AddBlipForEntity(vehicle)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 3)
        


end)

RegisterNetEvent("glow:pac10")
AddEventHandler("glow:pac10", function()
    local vehicleName = 'police3'
            
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Citizen.Wait(2)
    end
        
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
        
    local vehicle = CreateVehicle(vehicleName, 211.42, 201.76, 105.32, 34.08, GetEntityHeading(playerPed), true, false)
        
    local blip = AddBlipForEntity(vehicle)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 3)
        


end)

RegisterNetEvent("glow:pac11")
AddEventHandler("glow:pac11", function()
    local vehicleName = 'riot'
            
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Citizen.Wait(2)
    end
        
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
        
    local vehicle = CreateVehicle(vehicleName, 201.89, 210.72, 105.32, 303.32, GetEntityHeading(playerPed), true, false)
        
    local blip = AddBlipForEntity(vehicle)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 3)
        


end)

RegisterNetEvent("glow:pac12")
AddEventHandler("glow:pac12", function()
    local vehicleName = 'riot'
            
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Citizen.Wait(2)
    end
        
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
        
    local vehicle = CreateVehicle(vehicleName, 225.92, 196.97, 105.32, 103.98, GetEntityHeading(playerPed), true, false)
        
    local blip = AddBlipForEntity(vehicle)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 3)
        


end)

function LoadModels(models)
    for i = 1, #models do
        RequestModel(GetHashKey(models[i]))
    end
    while not HasModelLoaded(GetHashKey(models[1])) do
        Wait(0)
    end
end

-- requires that you have a container made already, can swap code out to just make one
-- /makemeacontainer is provided

RegisterCommand("animseq24", function()
    local models = {
        "tr_prop_tr_grinder_01a",
        "tr_prop_tr_container_01a",
        "tr_prop_tr_lock_01a",
        "hei_p_m_bag_var22_arm_s", -- guessed prop
        "tr_prop_tr_cont_coll_01a" -- collision
    }
    
    local dict = "anim@scripted@player@mission@tunf_train_ig1_container_p1@male@"
    RequestNamedPtfxAsset("scr_tn_tr")
    RequestAnimDict(dict)
    RequestScriptAudioBank("dlc_tuner/dlc_tuner_generic")
    LoadModels(models)
    repeat Wait(0) until HasAnimDictLoaded(dict)
    repeat Wait(0) until HasNamedPtfxAssetLoaded("scr_tn_tr")
    repeat Wait(0) until RequestScriptAudioBank("dlc_tuner/dlc_tuner_generic")

    local player = PlayerPedId()
    --local container = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 10.0, GetHashKey(models[2]), false, false, false)

    local playerPos = GetEntityCoords(player)
    local heading = GetEntityHeading(player)

    local grinder = CreateObject(GetHashKey(models[1]), playerPos.x, playerPos.y, playerPos.z, true, true, false)
    --local container = CreateObject(GetHashKey(models[2]), playerPos.x, playerPos.y, playerPos.z, true, true, false)

    local container = GetClosestObjectOfType(playerPos, 10.0, GetHashKey(models[2]), false, false, false)
    RemoveDecalsFromObject(container)
    local containerPos = GetEntityCoords(container)
    local containerHeading = GetEntityHeading(container)
    local containerRotation = GetEntityRotation(container)
    --local lock = CreateObject(GetHashKey(models[3]), playerPos.x, playerPos.y, playerPos.z, true, true, false)
    
    local lock = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 5.0, GetHashKey(models[3]), false, false, false)

    NetworkRequestControlOfEntity(container)
    NetworkRequestControlOfEntity(lock)
    local starttime = GetGameTimer()
    -- yes yes, network ownership, onesync, bad.
    while not NetworkHasControlOfEntity(container) or not NetworkHasControlOfEntity(lock) do
        DrawSimpleText("Waiting for network ownership...", 0.5, 0.95)
        Wait(0)
        if GetGameTimer() - starttime > 7500 then
            print("Timed out waiting for control of container")
            break
        end
    end

    local bag = CreateObject(GetHashKey(models[4]), playerPos.x, playerPos.y, playerPos.z, true, true, false)

    FreezeEntityPosition(container, true)
    local scene = NetworkCreateSynchronisedScene(containerPos.x, containerPos.y, containerPos.z, containerRotation.x, containerRotation.y, containerRotation.z, 2, true, false, 1.0, 0.0, 1.0)
    
    
    NetworkAddPedToSynchronisedScene(player, scene, dict, "action", 8.0, 8.0, 0, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(grinder, scene, dict, "action_angle_grinder", 8.0, 8.0, 0)
    NetworkAddEntityToSynchronisedScene(lock, scene, dict, "action_lock", 8.0, 8.0, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene, dict, "action_bag", 8.0, 8.0, 0)
    --NetworkAddEntityToSynchronisedScene(container, scene, dict, "action_container", 8.0, -8.0, 0)
    AttachSynchronizedSceneToEntity(scene, container, -1)
    NetworkStartSynchronisedScene(scene)
    -- container has to be done the old fashioned way
    -- because i can't seem to figure out a good way to make it lock on the last frame
    -- this isn't much of an issue courtesy of the fact that the container is the basis of the animation
    PlayEntityAnim(container, "action_container", dict, -8.0, false, true, false, 0, 0)
    while NetworkGetLocalSceneFromNetworkId(scene) == -1 do Wait(0) end
    local localscene = NetworkGetLocalSceneFromNetworkId(scene)

    local particle = nil

    while GetSynchronizedScenePhase(localscene) < 0.99 and IsSynchronizedSceneRunning(localscene) do
        if HasAnimEventFired(player, -1953940906) then
            UseParticleFxAsset("scr_tn_tr")
            particle = StartNetworkedParticleFxLoopedOnEntity("scr_tn_tr_angle_grinder_sparks", grinder, 0.0, 0.25, 0.0, 0.0, 0.0, 0.0, 1.0, false, false, false, 1065353216, 1065353216, 1065353216, 1)
        end
        if HasAnimEventFired(player, -258875766) then
            StopParticleFxLooped(particle, 0)
        end

        DisableCamCollisionForEntity(grinder, true)
        DisableCamCollisionForEntity(container, true)
        DisableCamCollisionForEntity(lock, true)
        DisableCamCollisionForEntity(bag, true)

        Wait(0)
    end
    print("Synchronized scene finished")
    print("Setting final collision")

    -- transition to complete collision
    SetEntityCollision(container, false, false)
    FreezeEntityPosition(container, true)
    local collisionBlocker = CreateObject(GetHashKey(models[5]), containerPos.x, containerPos.y, containerPos.z, true, true, false)
    SetEntityCoordsNoOffset(collisionBlocker, containerPos.x, containerPos.y, containerPos.z, true, false, false)
    SetEntityRotation(collisionBlocker, containerRotation.x, containerRotation.y, containerRotation.z, 2, true)
    FreezeEntityPosition(collisionBlocker, true)
    DeleteEntity(grinder)
    DeleteEntity(bag)
    DeleteEntity(lock)

    -- clean up memory
    for k,v in models do SetModelAsNoLongerNeeded(GetHashKey(v)) end
    RemoveAnimDict(dict)
    ReleaseNamedScriptAudioBank("dlc_tuner/dlc_tuner_generic")
    DisposeSynchronizedScene(scene)
end)

RegisterCommand("makemeacontainer", function()
    local dict = "anim@scripted@player@mission@tunf_train_ig1_container_p1@male@"
    RequestAnimDict(dict)

    local model = GetHashKey("tr_prop_tr_container_01a")
    local lockmodel = GetHashKey("tr_prop_tr_lock_01a")
    RequestModel(model)
    RequestModel(lockmodel)
    while not HasModelLoaded(model) do Wait(0) end
    while not HasModelLoaded(lockmodel) do Wait(0) end
    while not HasAnimDictLoaded(dict) do Wait(0) end

    local container = CreateObject(model, GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 5.0, 0.0), true, false, true)
    SetEntityHeading(container, GetEntityHeading(PlayerPedId()))
    SetModelAsNoLongerNeeded(model)
    SetEntityDynamic(container, true)

    print("Waiting for container to settle")
    Wait(2500)

    local lockoffset = GetAnimInitialOffsetPosition(dict, "action_lock", GetEntityCoords(container), GetEntityRotation(container), 0.0, 0)
    local lockrot = GetAnimInitialOffsetRotation(dict, "action_lock", GetEntityCoords(container), GetEntityRotation(container), 0.0, 0)
    local lock = CreateObject(lockmodel, lockoffset, true, false, true)
    SetEntityRotation(lock, lockrot.x, lockrot.y, lockrot.z, 2, true)
end)

