function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end

function giveWeapon(weaponHash)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weaponHash), 999, false, false --[[equips when gotten]])
end

RegisterCommand("textchat", function()
	SetTextChatEnabled(true)
end)

RegisterNetEvent("glow:giveweapons")
AddEventHandler("glow:giveweapons", function()
	giveWeapon("weapon_knife")
	giveWeapon("weapon_knightstick")
	giveWeapon("weapon_hammer")
	giveWeapon("weapon_bat")
	giveWeapon("weapon_crowbar")
	giveWeapon("weapon_golfclub")
	giveWeapon("weapon_pistol")
	giveWeapon("weapon_combatpistol")
	giveWeapon("weapon_appistol")
	giveWeapon("weapon_pistol50")
	giveWeapon("weapon_microsmg")
	giveWeapon("weapon_smg")
	giveWeapon("weapon_assaultsmg")
	giveWeapon("weapon_assaultrifle")
	giveWeapon("weapon_carbinerifle")
	giveWeapon("weapon_advancedrifle")
	giveWeapon("weapon_pumpshotgun")
	giveWeapon("weapon_fireextinguisher")
	giveWeapon("weapon_flare")
	giveWeapon("weapon_snspistol")
	giveWeapon("weapon_heavypistol")
	giveWeapon("weapon_bullpuprifle")
	giveWeapon("weapon_dagger")
	giveWeapon("weapon_vintagepistol")
	giveWeapon("weapon_firework")
	giveWeapon("weapon_flaregun")
	giveWeapon("weapon_marksmanpistol")
	giveWeapon("weapon_knuckle")
	giveWeapon("weapon_hatchet")
	giveWeapon("weapon_switchblade")
	giveWeapon("weapon_revolver")
	giveWeapon("weapon_battleaxe")
	giveWeapon("weapon_minismg")
	giveWeapon("weapon_poolcue")
	giveWeapon("weapon_wrench")
end)

RegisterNetEvent("glow:godon")
AddEventHandler("glow:godon", function(source, args)
    SetEntityInvincible(GetPlayerPed(-1), true)
    notify("~g~God Mode On")
end)
RegisterNetEvent("glow:godoff")
AddEventHandler("glow:godoff", function(source, args)
    SetEntityInvincible(GetPlayerPed(-1), false)
    notify("~r~God Mode Off")
end)

RegisterNetEvent("glow:clouds")
AddEventHandler("glow:clouds", function()
    StartPlayerSwitch(PlayerPedId(), PlayerPedId(), 255, 1)
    Citizen.Wait(6000) 
    StopPlayerSwitch()
end)

RegisterNetEvent("glow:fade")
AddEventHandler("glow:fade", function()
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    DoScreenFadeIn(1000)
    Citizen.Wait(1000)  
end)

local pool = MenuPool.New()
local animEnabled = true
local timerBarPool = TimerBarPool.New()

RegisterCommand("testing123", function()
	ShowMissionPassedMessage("hello", 100)
end)

Citizen.CreateThread(function()
    local f1_key = 288
    while true do
        Citizen.Wait(1)
        if IsControlJustReleased(1,  f1_key --[[ H key ]]) then
			TriggerEvent("glow:interactionmenu")
        end
    end
end)

RegisterCommand("willthiwork", function()
	local txd = CreateRuntimeTxd("scaleformui")
	local dui = CreateDui("https://i.imgur.com/mH0Y65C.gif", 288, 160)
	CreateRuntimeTextureFromDuiHandle(txd, "sidepanel", GetDuiHandle(dui))
	
	local exampleMenu = UIMenu.New("ScaleformUI UI", "ScaleformUI SHOWCASE", 50, 50, true, nil, nil, true)
	exampleMenu:MaxItemsOnScreen(7)
	exampleMenu:BuildAsync(true) -- set to false to build in a sync way (might freeze game for a couple ms for high N of items in menus)
	exampleMenu:BuildingAnimation(MenuBuildingAnimation.LEFT_RIGHT)
	exampleMenu:AnimationType(MenuAnimationType.CUBIC_INOUT)
	pool:Add(exampleMenu)

	local ketchupItem = UIMenuCheckboxItem.New("Scrolling animation enabled?", animEnabled, 1, "Do you wish to enable the scrolling animation?")

	local sidePanel = UIMissionDetailsPanel.New(1, "Side Panel", 6, true, "scaleformui", "sidepanel")
	local detailItem1 = UIMenuFreemodeDetailsItem.New("Left Label", "Right Label", false, BadgeStyle.BRIEFCASE, Colours.HUD_COLOUR_FREEMODE)
	local detailItem2 = UIMenuFreemodeDetailsItem.New("Left Label", "Right Label", false, BadgeStyle.STAR, Colours.HUD_COLOUR_GOLD)
	local detailItem3 = UIMenuFreemodeDetailsItem.New("Left Label", "Right Label", false, BadgeStyle.ARMOR, Colours.HUD_COLOUR_PURPLE)
	local detailItem4 = UIMenuFreemodeDetailsItem.New("Left Label", "Right Label", false, BadgeStyle.BRAND_DILETTANTE, Colours.HUD_COLOUR_GREEN)
	local detailItem5 = UIMenuFreemodeDetailsItem.New("Left Label", "Right Label", false, BadgeStyle.COUNTRY_GERMANY, Colours.HUD_COLOUR_WHITE, true)
	local detailItem6 = UIMenuFreemodeDetailsItem.New("Left Label", "Right Label", true)
	local detailItem7 = UIMenuFreemodeDetailsItem.New("Left Label", "Right Label", false)
end)

RegisterNetEvent("glow:interactionmenu")
AddEventHandler("glow:interactionmenu", function()
	local txd = CreateRuntimeTxd("scaleformui")
	local dui = CreateDui("https://i.imgur.com/mH0Y65C.gif", 288, 160)
	CreateRuntimeTextureFromDuiHandle(txd, "sidepanel", GetDuiHandle(dui))
	
	local exampleMenu = UIMenu.New(GetPlayerName(PlayerId()), "Interaction Menu", 50, 50, true, nil, nil, true)
	exampleMenu:MaxItemsOnScreen(7)
	exampleMenu:BuildAsync(true) -- set to false to build in a sync way (might freeze game for a couple ms for high N of items in menus)
	exampleMenu:BuildingAnimation(MenuBuildingAnimation.LEFT_RIGHT)
	exampleMenu:AnimationType(MenuAnimationType.CUBIC_INOUT)
	pool:Add(exampleMenu)

	local ketchupItem = UIMenuCheckboxItem.New("Enable GOD MODE", animEnabled, 1, "Do you want to enable GOD MODE?")
	


	exampleMenu:AddItem(ketchupItem)

	local animations = {}
	for k,v in pairs(MenuAnimationType) do
		-- table.insert(animations, k) -- Instead of this , use it like below (learn more here : https://springrts.com/wiki/Lua_Performance#TEST_12:_Adding_Table_Items_.28table.insert_vs._.5B_.5D.29)
		animations[#animations + 1] = k
	end









	--[[
		2 ways to add submenus.. 
		- the old way => local submenu = pool:AddSubMenu(parent, ...)
		- way.New => 
			local subMenu = UIMenu.New()
			parent:AddSubMenu(subMenu, itemText, itemDescription, offset, KeepBanner)
	]]
	local missle = UIMenu.New("Miscellaneous", "Features")
	exampleMenu:AddSubMenu(missle, "Miscellaneous", "Miscellaneous options", nil, true)


	local weapons = UIMenuItem.New("Give All Weapons", "Give all weapons to your player.")
	missle:AddItem(weapons)

	local windowSubmenu = UIMenu.New("Missions", "Missions")
	exampleMenu:AddSubMenu(windowSubmenu, "Missions", "Start a mission from the interaction menu.", nil, true)
	
	
	local gruppe = UIMenuItem.New("Gruppe 6 Delivery", "Deliver the Gruppe 6 truck to the pacific standard bank.")
	windowSubmenu:AddItem(gruppe)

	local fleecah = UIMenuItem.New("(WIP) Fleeca Bank Heist", "Note From Developer: This isn't close to being finished, you may find yourself being softlocked playing this mission or encountering bugs.")
	windowSubmenu:AddItem(fleecah)

	local fasttravel = UIMenu.New("Fast Travel", "Fast Travel")
	exampleMenu:AddSubMenu(fasttravel, "Fast Travel", "Fast Travel to a location", nil, true)
	
	local vespucci = UIMenuItem.New("Vespucci Beach", "Fast Travel to Vespucci Beach.")
	fasttravel:AddItem(vespucci)

	local timetrial = UIMenuItem.New("Time Trial", "Teleport to the currently active Time Trial.")
	fasttravel:AddItem(timetrial)

	local office = UIMenuItem.New("Office", "Teleport to the Office.")
	fasttravel:AddItem(office)

	local yourhome = UIMenuItem.New("Home", "Teleport to your home.")
	fasttravel:AddItem(yourhome)

	local speed = UIMenuItem.New("(DEV) Speed Demo Derby Map", "Work in progress speed demolition derby map.")
	fasttravel:AddItem(speed)

	local fleeca = UIMenuItem.New("(DEV) Fleeca Bank", "Fleeca bank testing")
	fasttravel:AddItem(fleeca)

	local casinoh = UIMenuItem.New("Niels Diamond Casino Heist", "Let's help Niels test his Diamond Casino Heist Remake!")
	fasttravel:AddItem(casinoh)

	local cayoperico = UIMenuItem.New("Cayo Perico", "Teleport to Cayo Perico!")
	fasttravel:AddItem(cayoperico)

	local wantedlevel = UIMenuItem.New("Reset Wanted Level", "Reset your wanted level.")
	missle:AddItem(wantedlevel)

	local helicopter = UIMenuItem.New("Spawn Helicopter", "Spawn a Sparrow")
	missle:AddItem(helicopter)

	local car = UIMenuItem.New("Spawn A Car", "Spawn adder")
	missle:AddItem(car)

	local musicevents = UIMenu.New("Music Events", "Play Any Music Event")
	exampleMenu:AddSubMenu(musicevents, "Music Events", "Play Any Music Event", nil, true)

	local drugwars = UIMenu.New("Drug Wars", "Drug Wars Music Events")
	musicevents:AddSubMenu(drugwars, "Drug Wars", "Drug Wars Music Events", nil, true)

	local deliverystart = UIMenuItem.New("Delivery Start", "M22_DELIVERING_START")
	drugwars:AddItem(deliverystart)

	local gunfightstart = UIMenuItem.New("Gunfight Start", "CM22_GUNFIGHT_START")
	drugwars:AddItem(gunfightstart)

	local vehiclestart = UIMenuItem.New("Vehicle Start", "CM22_VEHICLE_ACTION_START")
	drugwars:AddItem(vehiclestart)

	local stopmusic = UIMenuItem.New("Stop Music", "Cancels all music events and replaces it with HEI4_FIN_START_STA until the next music event is played.")
	drugwars:AddItem(stopmusic)


	deliverystart.Activated = function(menu)
		if Activated then
			print("worked")
			PrepareMusicEvent("CM22_DELIVERING_START")
			Citizen.Wait(100)
			TriggerMusicEvent("CM22_DELIVERING_START")
		else
			print("worked?")
			PrepareMusicEvent("CM22_DELIVERING_START")
			Citizen.Wait(100)
			TriggerMusicEvent("CM22_DELIVERING_START")
		end
	end

	gunfightstart.Activated = function(menu)
		if Activated then
			print("worked")
			PrepareMusicEvent("CM22_DELIVERING_START")
			Citizen.Wait(100)
			TriggerMusicEvent("CM22_DELIVERING_START")
		else
			print("worked?")
			PrepareMusicEvent("CM22_DELIVERING_START")
			Citizen.Wait(100)
			TriggerMusicEvent("CM22_DELIVERING_START")
		end
	end

	vehiclestart.Activated = function(menu)
		if Activated then
			print("worked")
			PrepareMusicEvent("CM22_VEHICLE_ACTION_START")
			Citizen.Wait(100)
			TriggerMusicEvent("CM22_VEHICLE_ACTION_START")
		else
			print("worked?")
			PrepareMusicEvent("CM22_VEHICLE_ACTION_START")
			Citizen.Wait(100)
			TriggerMusicEvent("CM22_VEHICLE_ACTION_START")
		end
	end

	stopmusic.Activated = function(menu)
		if Activated then
			print("worked")
			PrepareMusicEvent("HEI4_FIN_START_STA")
			Citizen.Wait(100)
			TriggerMusicEvent("HEI4_FIN_START_STA")
		else
			print("worked?")
			PrepareMusicEvent("HEI4_FIN_START_STA")
			Citizen.Wait(100)
			TriggerMusicEvent("HEI4_FIN_START_STA")
		end
	end

	wantedlevel.Activated = function(menu)
		if Activated then
			SetPlayerWantedLevel(PlayerId(), 0, false)
			SetPlayerWantedLevelNow(PlayerId(), false)
			alert ("~p~Wanted level has been reset")
		else
			SetPlayerWantedLevel(PlayerId(), 0, false)
			SetPlayerWantedLevelNow(PlayerId(), false)
			alert ("~p~Wanted level has been reset")
		end
	end

	exampleMenu.OnMenuChanged = function(old, new, type)
		if type == "opened" then
			print("Menu opened!")
		elseif type == "closed" then
			print("Menu closed!")
		elseif type == "backwards" then
			print("Menu going backwards!")
		elseif type == "forwards" then
			print("Menu going forwards!")
		end
	end

	ketchupItem.OnCheckboxChanged = function(menu, item, checked)
		menu:AnimationEnabled(checked)
		if checked then
			TriggerEvent('glow:godon')
		else
			TriggerEvent('glow:godoff')
		end
	end

	gruppe.Activated = function(menu)
		if Activated then
			print("worked")
			TriggerEvent('glow:gruppe')
		else
			print("worked?")
			TriggerEvent('glow:gruppe')
		end
	end

	vespucci.Activated = function(menu)
		if Activated then
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)	
			SetEntityCoords(PlayerPedId(), -1542.66, -879.05, 21.5)  
			Citizen.Wait(10000)	 
			TriggerEvent("glow:clouds")
			DoScreenFadeIn(1000)
			Citizen.Wait(1000)
			Citizen.Wait(6000)
			TriggerEvent("cS.MidsizeBanner", "~b~FAST TRAVELLED~w~", "Vespucci Beach", 5, 9, true)
		else
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)	
			SetEntityCoords(PlayerPedId(), -1542.66, -879.05, 21.5)  
			Citizen.Wait(10000)	 
			TriggerEvent("glow:clouds")
			DoScreenFadeIn(1000)
			Citizen.Wait(1000)
			Citizen.Wait(6000)
			TriggerEvent("cS.MidsizeBanner", "~b~FAST TRAVELLED~w~", "Vespucci Beach", 5, 9, true)
		end
	end

	cayoperico.Activated = function(menu)
		if Activated then
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)	
			SetEntityCoords(PlayerPedId(), 4865.9, -5171.46, 2.44)  
			Citizen.Wait(10000)	 
			TriggerEvent("glow:clouds")
			DoScreenFadeIn(1000)
			Citizen.Wait(1000)
			Citizen.Wait(6000)
			TriggerEvent("cS.MidsizeBanner", "~b~FAST TRAVELLED~w~", "Vespucci Beach", 5, 9, true)
		else
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)	
			SetEntityCoords(PlayerPedId(), 4865.9, -5171.46, 2.44)  
			Citizen.Wait(10000)	 
			TriggerEvent("glow:clouds")
			DoScreenFadeIn(1000)
			Citizen.Wait(1000)
			Citizen.Wait(6000)
			TriggerEvent("cS.MidsizeBanner", "~b~FAST TRAVELLED~w~", "Vespucci Beach", 5, 9, true)
		end
	end

	timetrial.Activated = function(menu)
		if Activated then
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)	
			SetEntityCoords(PlayerPedId(), -404.46, 1158.73, 325.91)  
			Citizen.Wait(10000)	 
			TriggerEvent("glow:clouds")
			DoScreenFadeIn(1000)
			Citizen.Wait(1000)
			Citizen.Wait(6000)
			TriggerEvent("cS.MidsizeBanner", "~b~FAST TRAVELLED~w~", "Time Trial", 5, 9, true)
		else
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)	
			SetEntityCoords(PlayerPedId(), -404.46, 1158.73, 325.91)  
			Citizen.Wait(10000)	 
			TriggerEvent("glow:clouds")
			DoScreenFadeIn(1000)
			Citizen.Wait(1000)
			Citizen.Wait(6000)
			TriggerEvent("cS.MidsizeBanner", "~b~FAST TRAVELLED~w~", "Time Trial", 5, 9, true)
		end
	end

	office.Activated = function(menu)
		if Activated then
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)	
			SetEntityCoords(PlayerPedId(), -75.64, -823.99, 243.39, true, true, true, false)  
			Citizen.Wait(10000)	 
			TriggerEvent("glow:clouds")
			DoScreenFadeIn(1000)
			Citizen.Wait(1000)
			Citizen.Wait(6000)
			TriggerEvent("cS.MidsizeBanner", "~b~FAST TRAVELLED~w~", "Office", 5, 9, true)
		else
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)	
			SetEntityCoords(PlayerPedId(), -75.64, -823.99, 243.39, true, true, true, false)  
			Citizen.Wait(10000)	 
			TriggerEvent("glow:clouds")
			DoScreenFadeIn(1000)
			Citizen.Wait(1000)
			Citizen.Wait(6000)
			TriggerEvent("cS.MidsizeBanner", "~b~FAST TRAVELLED~w~", "Office", 5, 9, true)
		end
	end

	yourhome.Activated = function(menu)
		if Activated then
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)	
			SetEntityCoords(PlayerPedId(), -1441.24, -547.71, 34.74, true, true, true, false)  
			Citizen.Wait(10000)	 
			TriggerEvent("glow:clouds")
			DoScreenFadeIn(1000)
			Citizen.Wait(1000)
			Citizen.Wait(6000)
			TriggerEvent("cS.MidsizeBanner", "~b~FAST TRAVELLED~w~", "Home", 5, 9, true)
		else
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)	
			SetEntityCoords(PlayerPedId(), -1441.24, -547.71, 34.74, true, true, true, false)  
			Citizen.Wait(10000)	 
			TriggerEvent("glow:clouds")
			DoScreenFadeIn(1000)
			Citizen.Wait(1000)
			Citizen.Wait(6000)
			TriggerEvent("cS.MidsizeBanner", "~b~FAST TRAVELLED~w~", "Home", 5, 9, true)
		end
	end

	speed.Activated = function(menu)
		if Activated then
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)	
			SetEntityCoords(PlayerPedId(), 37.58, -603.84, 444.19, true, true, true, false) 
			Citizen.Wait(10000)	 
			TriggerEvent("glow:clouds")
			DoScreenFadeIn(1000)
			Citizen.Wait(1000)
			Citizen.Wait(6000)
			TriggerEvent("cS.MidsizeBanner", "~b~FAST TRAVELLED~w~", "Speed Demo Map (Work In Progress)", 5, 9, true)
		else
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)	
			SetEntityCoords(PlayerPedId(), 37.58, -603.84, 444.19, true, true, true, false) 
			Citizen.Wait(10000)	 
			TriggerEvent("glow:clouds")
			DoScreenFadeIn(1000)
			Citizen.Wait(1000)
			Citizen.Wait(6000)
			TriggerEvent("cS.MidsizeBanner", "~b~FAST TRAVELLED~w~", "Speed Demo Map (Work In Progress)", 5, 9, true)
		end
	end

	fleeca.Activated = function(menu)
		if Activated then
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)	
			SetEntityCoords(PlayerPedId(), -2973.87, 482.28, 15.26, true, true, true, false) 
			Citizen.Wait(10000)	 
			TriggerEvent("glow:clouds")
			DoScreenFadeIn(1000)
			Citizen.Wait(1000)
			Citizen.Wait(6000)
			TriggerEvent("cS.MidsizeBanner", "~b~FAST TRAVELLED~w~", "Fleeca Bank", 5, 9, true)
		else
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)	
			SetEntityCoords(PlayerPedId(), -2973.87, 482.28, 15.26, true, true, true, false) 
			Citizen.Wait(10000)	 
			TriggerEvent("glow:clouds")
			DoScreenFadeIn(1000)
			Citizen.Wait(1000)
			Citizen.Wait(6000)
			TriggerEvent("cS.MidsizeBanner", "~b~FAST TRAVELLED~w~", "Fleeca Bank", 5, 9, true)
		end
	end

	casinoh.Activated = function(menu)
		if Activated then
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)	
			SetEntityCoords(PlayerPedId(), 762.29, -816.03, 26.33, true, true, true, false) 
			Citizen.Wait(10000)	 
			TriggerEvent("glow:clouds")
			DoScreenFadeIn(1000)
			Citizen.Wait(1000)
			Citizen.Wait(6000)
			TriggerEvent("cS.MidsizeBanner", "~b~FAST TRAVELLED~w~", "Arcade", 5, 9, true)
		else
			DoScreenFadeOut(1000)
			Citizen.Wait(1000)	
			SetEntityCoords(PlayerPedId(), 762.29, -816.03, 26.33, true, true, true, false) 
			Citizen.Wait(10000)	 
			TriggerEvent("glow:clouds")
			DoScreenFadeIn(1000)
			Citizen.Wait(1000)
			Citizen.Wait(6000)
			TriggerEvent("cS.MidsizeBanner", "~b~FAST TRAVELLED~w~", "Arcade", 5, 9, true)
		end
	end

	weapons.Activated = function(menu)
		if Activated then
			alert("~p~All weapons have been given.")
			TriggerEvent('glow:giveweapons')
		else
			alert("~p~All weapons have been given.")
			TriggerEvent('glow:giveweapons')
		end
	end

	fleecah.Activated = function(menu)
		if Activated then
			TriggerEvent("glow:camera")
		else
			TriggerEvent("glow:camera")
		end
	end

	helicopter.Activated = function(menu)
		if Activated then
			local vehicleName = 'buzzard'

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
		else
			local vehicleName = 'buzzard'

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
		end
	end

	car.Activated = function(menu)
		if Activated then
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
		else
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
		end
	end






	exampleMenu:Visible(true)
end)


---
RegisterNetEvent("glow:selectheist")
AddEventHandler("glow:selectheist", function()
	local txd = CreateRuntimeTxd("scaleformui")
	local dui = CreateDui("https://i.imgur.com/mH0Y65C.gif", 288, 160)
	CreateRuntimeTextureFromDuiHandle(txd, "sidepanel", GetDuiHandle(dui))
	
	local heistselect = UIMenu.New("Heists", "Heist Selector", 50, 50, true, nil, nil, true)
	heistselect:MaxItemsOnScreen(7)
	heistselect:BuildAsync(true) -- set to false to build in a sync way (might freeze game for a couple ms for high N of items in menus)
	heistselect:BuildingAnimation(MenuBuildingAnimation.LEFT_RIGHT)
	heistselect:AnimationType(MenuAnimationType.CUBIC_INOUT)
	pool:Add(heistselect)


	local animations = {}
	for k,v in pairs(MenuAnimationType) do
		-- table.insert(animations, k) -- Instead of this , use it like below (learn more here : https://springrts.com/wiki/Lua_Performance#TEST_12:_Adding_Table_Items_.28table.insert_vs._.5B_.5D.29)
		animations[#animations + 1] = k
	end









	--[[
		2 ways to add submenus.. 
		- the old way => local submenu = pool:AddSubMenu(parent, ...)
		- way.New => 
			local subMenu = UIMenu.New()
			parent:AddSubMenu(subMenu, itemText, itemDescription, offset, KeepBanner)
	]]

	local missle = UIMenu.New("The Fleeca Bank", "Features")
	heistselect:AddSubMenu(missle, "The Fleeca Bank", "Setups & Heist", nil, true)


	local fleeca1 = UIMenuItem.New("Setup: Kuruma", "Retrieve the kuruma")
	missle:AddItem(fleeca1)

	local fleeca2 = UIMenuItem.New("The Fleeca Job", "Take down the Fleeca franchise. The driver controls the crowd. The hacker gets box 167 from the vault. Then everyone gets out and gets away in the Kuruma.")
	missle:AddItem(fleeca2)

	local pacific = UIMenu.New("The Pacific Standard Bank", "Setups & Heist")
	heistselect:AddSubMenu(pacific, "The Pacific Standard Heist", "Setups & Heist", nil, true)

	local pacific1 = UIMenuItem.New("Pacific Standard - Vans", "Get hold of a Post OP van fitted with a transponder that can be programmed to disable the Pacific Standard dye packs. You'll have to photograph a few vans in the field to identify the right one.")
	pacific:AddItem(pacific1)

	local pacific2 = UIMenuItem.New("Pacific Standard - Signal", "Bring the transponder to Avi Schwartzman, a signal expert, so he can tune it to the right frequency for the Pacific Standard dye packs. Avi's a fugitive hiding out in North Chumash")
	pacific:AddItem(pacific2)

	local pacific3 = UIMenuItem.New("Pacific Standard - Hack", "Borrow a hacking rig from a rival high-end heist crew in Vinewood. Take out the guards, swap the setup of their van and into ours, distract the crew, and bring it to Paige.")
	pacific:AddItem(pacific3)

	local pacific4 = UIMenuItem.New("Pacific Standard - Convoy", "Hijack a Merryweather convoy in Blaine County to get thermal charges to use on the security doors at the Pacific Standard.")
	pacific:AddItem(pacific4)

	local pacific5 = UIMenuItem.New("Pacific Standard - Bikes", "Source the the getaway vehicles for the Pacific Standard job. Take four state-of-the-art sports bikes from The Lost MC Clubhouse in East Los Santos and store them near the bank.")
	pacific:AddItem(pacific5)

	local pacific6 = UIMenuItem.New("The Pacific Standard Job", "Clear out the flagship branch of the Pacific Standard Bank on Vinewood Blvd. Bust into the bank, control the crowd, crack the vault, pull out what you can, and make a getaway on the bikes")
	pacific:AddItem(pacific6)

	fleeca1.Activated = function(menu)
		if Activated then
			print("worked")
			TriggerEvent('glow:fleeca1')
		else
			print("worked?")
			TriggerEvent('glow:fleeca1')
		end
	end




	fleeca1.Activated = function(menu)
		if Activated then
			print("worked")
			TriggerEvent('glow:fleeca1')
		else
			print("worked?")
			TriggerEvent('glow:fleeca1')
		end
	end



	fleeca2.Activated = function(menu)
		if Activated then
			print("worked")
			TriggerEvent('glow:fleecastartheist')
		else
			print("worked?")
			TriggerEvent('glow:fleecastartheist')
		end
	end

	pacific6.Activated = function(menu)
		if Activated then
			print("worked")
			TriggerEvent("glow:startpac")
		else
			print("worked?")
			TriggerEvent("glow:startpac")
		end
	end




	heistselect:Visible(true)
end)



function CreatePauseMenu()
	local pauseMenuExample = TabView.New("ScaleformUI LUA", "THE LUA API", GetPlayerName(PlayerId()), "String middle", "String bottom")

	local handle = RegisterPedheadshot(PlayerPedId())
    while not IsPedheadshotReady(handle) or not IsPedheadshotValid(handle) do Wait(0) end
    local txd = GetPedheadshotTxdString(handle)
	pauseMenuExample:HeaderPicture(txd, txd) 	-- pauseMenuExample:CrewPicture used to add a picture on the left of the HeaderPicture
	print("PedHandle => " .. handle)
	UnregisterPedheadshot(handle) -- call it right after adding the menu.. this way the txd will be loaded correctly by the scaleform.. 

	pool:AddPauseMenu(pauseMenuExample)

	local basicTab = TextTab.New("TEXTTAB", "This is the Title!")
	basicTab:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~y~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	basicTab:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~r~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	basicTab:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~b~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	basicTab:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~g~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	basicTab:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~p~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	basicTab:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~p~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	basicTab:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~p~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	basicTab:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~p~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	basicTab:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~p~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	basicTab:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~p~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	basicTab:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~p~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	basicTab:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~r~Use the mouse wheel to scroll the text!!"))
	pauseMenuExample:AddTab(basicTab)

	local multiItemTab = SubmenuTab.New("SUBMENUTAB") -- this is the tab with multiple sub menus in it.. each submenu has a different purpose
	pauseMenuExample:AddTab(multiItemTab)
	local first = TabLeftItem.New("1 - Empty", LeftItemType.Empty) -- empty item.. 
	local second = TabLeftItem.New("2 - Info", LeftItemType.Info) -- info (like briefings..)
	local third = TabLeftItem.New("3 - Statistics", LeftItemType.Statistics) -- for statistics
	local fourth = TabLeftItem.New("4 - Settings", LeftItemType.Settings) -- well.. settings..
	local fifth = TabLeftItem.New("5 - Keymaps", LeftItemType.Keymap) -- keymaps for custom keymapping 
	first:Enabled(false)
	multiItemTab:AddLeftItem(first)
	multiItemTab:AddLeftItem(second)
	multiItemTab:AddLeftItem(third)
	multiItemTab:AddLeftItem(fourth)
	multiItemTab:AddLeftItem(fifth)

	second.TextTitle = "Info Title!!"
	second:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~y~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	second:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~r~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	second:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~b~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	second:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~g~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	second:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~p~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	second:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~p~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	second:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~p~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	second:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~p~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	second:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~p~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	second:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~p~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	second:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~p~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
	second:AddItem(BasicTabItem.New("~BLIP_INFO_ICON~ ~r~Use the mouse wheel to scroll the text!!"))

	local _labelStatItem = StatsTabItem.NewBasic("Item's Label", "Item's right label")
	local _coloredBarStatItem0 = StatsTabItem.NewBar("Item's Label", 0, Colours.HUD_COLOUR_ORANGE)
	local _coloredBarStatItem1 = StatsTabItem.NewBar("Item's Label", 25, Colours.HUD_COLOUR_RED)
	local _coloredBarStatItem2 = StatsTabItem.NewBar("Item's Label", 50, Colours.HUD_COLOUR_BLUE)
	local _coloredBarStatItem3 = StatsTabItem.NewBar("Item's Label", 75, Colours.HUD_COLOUR_GREEN)
	local _coloredBarStatItem4 = StatsTabItem.NewBar("Item's Label", 100, Colours.HUD_COLOUR_PURPLE)

	third:AddItem(_labelStatItem)
	third:AddItem(_coloredBarStatItem0)
	third:AddItem(_coloredBarStatItem1)
	third:AddItem(_coloredBarStatItem2)
	third:AddItem(_coloredBarStatItem3)
	third:AddItem(_coloredBarStatItem4)

	local itemList = { "This", "Is", "The", "List", "Super", "Power", "Wooow" }
	local _settings1 = SettingsItem.New("Item's Label", "Item's right Label") 
	local _settings2 = SettingsListItem.New("Item's Label", itemList, 0)
	local _settings3 = SettingsProgressItem.New("Item's Label", 100, 25, false, Colours.HUD_COLOUR_FREEMODE)
	local _settings4 = SettingsProgressItem.New("Item's Label", 100, 75, true, Colours.HUD_COLOUR_PINK)
	local _settings5 = SettingsCheckboxItem.New("Item's Label", 1, true) -- 0 = cross / 1 = tick
	local _settings6 = SettingsSliderItem.New("Item's Label", 100, 50, Colours.HUD_COLOUR_RED)
	fourth:AddItem(_settings1)
	fourth:AddItem(_settings2)
	fourth:AddItem(_settings3)
	fourth:AddItem(_settings4)
	fourth:AddItem(_settings5)
	fourth:AddItem(_settings6)

	fifth.TextTitle = "ACTION"
	fifth.KeymapRightLabel_1 = "PRIMARY"
	fifth.KeymapRightLabel_2 = "SECONDARY"
	local key1 = KeymapItem.New("Simple Keymap", "~INPUT_FRONTEND_ACCEPT~", "~INPUT_VEH_EXIT~")
	local key2 = KeymapItem.New("Advanced Keymap", "~INPUT_SPRINT~ + ~INPUT_CONTEXT~", "", "", "~INPUTGROUP_FRONTEND_TRIGGERS~")
	fifth:AddItem(key1)
	fifth:AddItem(key2)
	fifth:AddItem(key1)
	fifth:AddItem(key2)
	fifth:AddItem(key1)
	fifth:AddItem(key2)
	fifth:AddItem(key1)
	fifth:AddItem(key2)

	local playersTab = PlayerListTab.New("PLAYERLISTTAB")
	pauseMenuExample:AddTab(playersTab)

	local item = UIMenuItem.New("UIMenuItem", "UIMenuItem description")
	local item1 = UIMenuListItem.New("UIMenuListItem", { "This", "is", "a", "Test"}, 0, "UIMenuListItem description")
	local item2 = UIMenuCheckboxItem.New("UIMenuCheckboxItem", true, 1, "UIMenuCheckboxItem description")
	local item3 = UIMenuSliderItem.New("UIMenuSliderItem", 100, 5, 50, false, "UIMenuSliderItem description")
	local item4 = UIMenuProgressItem.New("UIMenuProgressItem", 10, 5, "UIMenuProgressItem description")
	item:BlinkDescription(true)

	playersTab.SettingsColumn:AddSettings(item)
	playersTab.SettingsColumn:AddSettings(item1)
	playersTab.SettingsColumn:AddSettings(item2)
	playersTab.SettingsColumn:AddSettings(item3)
	playersTab.SettingsColumn:AddSettings(item4)

	local friend = FriendItem.New(GetPlayerName(PlayerId()), Colours.HUD_COLOUR_GREEN, true, GetRandomIntInRange(15, 55), "Status", "CrewTag")
	local friend1 = FriendItem.New(GetPlayerName(PlayerId()), Colours.HUD_COLOUR_MENU_YELLOW, true, GetRandomIntInRange(15, 55), "Status", "CrewTag")
	local friend2 = FriendItem.New(GetPlayerName(PlayerId()), Colours.HUD_COLOUR_PINK, true, GetRandomIntInRange(15, 55), "Status", "CrewTag")
	local friend3 = FriendItem.New(GetPlayerName(PlayerId()), Colours.HUD_COLOUR_BLUE, true, GetRandomIntInRange(15, 55), "Status", "CrewTag")
	local friend4 = FriendItem.New(GetPlayerName(PlayerId()), Colours.HUD_COLOUR_ORANGE, true, GetRandomIntInRange(15, 55), "Status", "CrewTag")
	local friend5 = FriendItem.New(GetPlayerName(PlayerId()), Colours.HUD_COLOUR_RED, true, GetRandomIntInRange(15, 55), "Status", "CrewTag")
	friend:SetLeftIcon(LobbyBadgeIcon.IS_CONSOLE_PLAYER, false)
	friend1:SetLeftIcon(LobbyBadgeIcon.IS_PC_PLAYER, false)
	friend2:SetLeftIcon(LobbyBadgeIcon.SPECTATOR, false)
	friend3:SetLeftIcon(LobbyBadgeIcon.INACTIVE_HEADSET, false)
	friend4:SetLeftIcon(BadgeStyle.COUNTRY_ITALY, true)
	friend5:SetLeftIcon(BadgeStyle.CASTLE, true)

	friend:AddPedToPauseMenu(PlayerPedId()) -- defaulted to 0 if you set it to nil / 0 the ped will be removed from the pause menu
	friend1:AddPedToPauseMenu(PlayerPedId()) -- defaulted to 0 if you set it to nil / 0 the ped will be removed from the pause menu
	friend2:AddPedToPauseMenu(PlayerPedId()) -- defaulted to 0 if you set it to nil / 0 the ped will be removed from the pause menu
	friend3:AddPedToPauseMenu(PlayerPedId()) -- defaulted to 0 if you set it to nil / 0 the ped will be removed from the pause menu
	friend4:AddPedToPauseMenu(PlayerPedId()) -- defaulted to 0 if you set it to nil / 0 the ped will be removed from the pause menu
	friend5:AddPedToPauseMenu(PlayerPedId()) -- defaulted to 0 if you set it to nil / 0 the ped will be removed from the pause menu

	local panel = PlayerStatsPanel.New("Player 1", Colours.HUD_COLOUR_GREEN)
	panel:Description("This is the description for Player 1!!")
	panel:HasPlane(true)
	panel:HasHeli(true)
	panel.RankInfo:RankLevel(150)
	panel.RankInfo:LowLabel("This is the low label")
	panel.RankInfo:MidLabel("This is the middle label")
	panel.RankInfo:UpLabel("This is the upper label")
	panel:AddStat(PlayerStatsPanelStatItem.New("Statistic 1", "Description 1", GetRandomIntInRange(30, 150)))
	panel:AddStat(PlayerStatsPanelStatItem.New("Statistic 2", "Description 2", GetRandomIntInRange(30, 150)))
	panel:AddStat(PlayerStatsPanelStatItem.New("Statistic 3", "Description 3", GetRandomIntInRange(30, 150)))
	panel:AddStat(PlayerStatsPanelStatItem.New("Statistic 4", "Description 4", GetRandomIntInRange(30, 150)))
	panel:AddStat(PlayerStatsPanelStatItem.New("Statistic 5", "Description 5", GetRandomIntInRange(30, 150)))
	friend:AddPanel(panel)

	local panel1 = PlayerStatsPanel.New("Player 2", Colours.HUD_COLOUR_MENU_YELLOW)
	panel1:Description("This is the description for Player 2!!")
	panel1:HasPlane(true)
	panel1:HasVehicle(true)
	panel1.RankInfo:RankLevel(70)
	panel1.RankInfo:LowLabel("This is the low label")
	panel1.RankInfo:MidLabel("This is the middle label")
	panel1.RankInfo:UpLabel("This is the upper label")
	panel1:AddStat(PlayerStatsPanelStatItem.New("Statistic 1", "Description 1", GetRandomIntInRange(30, 150)))
	panel1:AddStat(PlayerStatsPanelStatItem.New("Statistic 2", "Description 2", GetRandomIntInRange(30, 150)))
	panel1:AddStat(PlayerStatsPanelStatItem.New("Statistic 3", "Description 3", GetRandomIntInRange(30, 150)))
	panel1:AddStat(PlayerStatsPanelStatItem.New("Statistic 4", "Description 4", GetRandomIntInRange(30, 150)))
	panel1:AddStat(PlayerStatsPanelStatItem.New("Statistic 5", "Description 5", GetRandomIntInRange(30, 150)))
	friend1:AddPanel(panel1)

	local panel2 = PlayerStatsPanel.New("Player 3", Colours.HUD_COLOUR_PINK)
	panel2:Description("This is the description for Player 3!!")
	panel2:HasPlane(true)
	panel2:HasHeli(true)
	panel2:HasVehicle(true)
	panel2.RankInfo:RankLevel(15)
	panel2.RankInfo:LowLabel("This is the low label")
	panel2.RankInfo:MidLabel("This is the middle label")
	panel2.RankInfo:UpLabel("This is the upper label")
	panel2:AddStat(PlayerStatsPanelStatItem.New("Statistic 1", "Description 1", GetRandomIntInRange(30, 150)))
	panel2:AddStat(PlayerStatsPanelStatItem.New("Statistic 2", "Description 2", GetRandomIntInRange(30, 150)))
	panel2:AddStat(PlayerStatsPanelStatItem.New("Statistic 3", "Description 3", GetRandomIntInRange(30, 150)))
	panel2:AddStat(PlayerStatsPanelStatItem.New("Statistic 4", "Description 4", GetRandomIntInRange(30, 150)))
	panel2:AddStat(PlayerStatsPanelStatItem.New("Statistic 5", "Description 5", GetRandomIntInRange(30, 150)))
	friend2:AddPanel(panel2)

	local panel3 = PlayerStatsPanel.New("Player 4", Colours.HUD_COLOUR_FREEMODE)
	panel3:Description("This is the description for Player 4!!")
	panel3:HasPlane(true)
	panel3:HasHeli(true)
	panel3:HasBoat(true)
	panel3.RankInfo:RankLevel(10)
	panel3.RankInfo:LowLabel("This is the low label")
	panel3.RankInfo:MidLabel("This is the middle label")
	panel3.RankInfo:UpLabel("This is the upper label")
	panel3:AddStat(PlayerStatsPanelStatItem.New("Statistic 1", "Description 1", GetRandomIntInRange(30, 150)))
	panel3:AddStat(PlayerStatsPanelStatItem.New("Statistic 2", "Description 2", GetRandomIntInRange(30, 150)))
	panel3:AddStat(PlayerStatsPanelStatItem.New("Statistic 3", "Description 3", GetRandomIntInRange(30, 150)))
	panel3:AddStat(PlayerStatsPanelStatItem.New("Statistic 4", "Description 4", GetRandomIntInRange(30, 150)))
	panel3:AddStat(PlayerStatsPanelStatItem.New("Statistic 5", "Description 5", GetRandomIntInRange(30, 150)))
	friend3:AddPanel(panel3)

	local panel4 = PlayerStatsPanel.New("Player 5", Colours.HUD_COLOUR_ORANGE)
	panel4:Description("This is the description for Player 5!!")
	panel4:HasPlane(true)
	panel4:HasHeli(true)
	panel4.RankInfo:RankLevel(1000)
	panel4.RankInfo:LowLabel("This is the low label")
	panel4.RankInfo:MidLabel("This is the middle label")
	panel4.RankInfo:UpLabel("This is the upper label")
	panel4:AddStat(PlayerStatsPanelStatItem.New("Statistic 1", "Description 1", GetRandomIntInRange(30, 150)))
	panel4:AddStat(PlayerStatsPanelStatItem.New("Statistic 2", "Description 2", GetRandomIntInRange(30, 150)))
	panel4:AddStat(PlayerStatsPanelStatItem.New("Statistic 3", "Description 3", GetRandomIntInRange(30, 150)))
	panel4:AddStat(PlayerStatsPanelStatItem.New("Statistic 4", "Description 4", GetRandomIntInRange(30, 150)))
	panel4:AddStat(PlayerStatsPanelStatItem.New("Statistic 5", "Description 5", GetRandomIntInRange(30, 150)))
	friend4:AddPanel(panel4)

	local panel5 = PlayerStatsPanel.New("Player 6", Colours.HUD_COLOUR_RED)
	panel5:Description("This is the description for Player 6!!")
	panel5:HasPlane(true)
	panel5:HasHeli(true)
	panel5.RankInfo:RankLevel(22)
	panel5.RankInfo:LowLabel("This is the low label")
	panel5.RankInfo:MidLabel("This is the middle label")
	panel5.RankInfo:UpLabel("This is the upper label")
	panel5:AddStat(PlayerStatsPanelStatItem.New("Statistic 1", "Description 1", GetRandomIntInRange(30, 150)))
	panel5:AddStat(PlayerStatsPanelStatItem.New("Statistic 2", "Description 2", GetRandomIntInRange(30, 150)))
	panel5:AddStat(PlayerStatsPanelStatItem.New("Statistic 3", "Description 3", GetRandomIntInRange(30, 150)))
	panel5:AddStat(PlayerStatsPanelStatItem.New("Statistic 4", "Description 4", GetRandomIntInRange(30, 150)))
	panel5:AddStat(PlayerStatsPanelStatItem.New("Statistic 5", "Description 5", GetRandomIntInRange(30, 150)))
	friend5:AddPanel(panel5)

	playersTab.PlayersColumn:AddPlayer(friend)
	playersTab.PlayersColumn:AddPlayer(friend1)
	playersTab.PlayersColumn:AddPlayer(friend2)
	playersTab.PlayersColumn:AddPlayer(friend3)
	playersTab.PlayersColumn:AddPlayer(friend4)
	playersTab.PlayersColumn:AddPlayer(friend5)

	
	playersTab.PlayersColumn.OnIndexChanged = function(idx)
		ScaleformUI.Notifications:ShowSubtitle("PlayersColumn index =>~b~ ".. idx .. "~w~.")
	end
	playersTab.SettingsColumn.OnIndexChanged = function(idx)
		ScaleformUI.Notifications:ShowSubtitle("SettingsColumn index =>~b~ ".. idx .. "~w~.")
	end

	pauseMenuExample.OnPauseMenuOpen = function(menu)
		Notifications:ShowSubtitle(menu.Title .. " Opened!")
	end

	pauseMenuExample.OnPauseMenuClose = function(menu)
		Notifications:ShowSubtitle(menu.Title .. " Closed!")
	end

	pauseMenuExample.OnPauseMenuTabChanged = function(menu, tab, tabIndex)
		Notifications:ShowSubtitle(tab.Label .. " Selected!")
	end

	pauseMenuExample.OnPauseMenuFocusChanged = function(menu, tab, focusLevel)
		Notifications:ShowSubtitle(tab.Label .. " Focus at level =>~y~ " .. focusLevel .. " ~w~~s~!")
		if focusLevel == 1 then
			local _, subType = tab()
			if subType == "TextTab" then
				local buttons = {
					InstructionalButton.New(GetLabelText("HUD_INPUT3"), -1, 177, 177, -1),
					InstructionalButton.New("Scroll text", 0, 2, -1, -1),
					InstructionalButton.New("Scroll text", 1, -1, -1, "INPUTGROUP_CURSOR_SCROLL")
					-- cannot make difference between controller / keyboard here in 1 line because we are using the InputGroup for keyboard
				}
				ScaleformUI.Scaleforms.InstructionalButtons:SetInstructionalButtons(buttons)
			end 
		elseif focusLevel == 0 then
			ScaleformUI.Scaleforms.InstructionalButtons:SetInstructionalButtons(menu.InstructionalButtons)
		end
	end

	pauseMenuExample.OnLeftItemChange = function(menu, item, leftItemIndex)
		Notifications:ShowSubtitle("OnLeftItemChange:"..menu.Tabs[menu.Index].Label .. " Focus at level =>~y~ " .. menu.focusLevel .. "~s~~w~, and left Item ~o~N° " .. leftItemIndex .. "~w~ selected!")
	end

	pauseMenuExample.OnRightItemChange = function (menu, item, rightItemIndex)
		Notifications:ShowSubtitle(menu.Tabs[menu.Index].Label .. " Focus at level => ~y~ " .. menu:FocusLevel() .. "~w~, left Item ~o~N° " .. menu:LeftItemIndex() .. "~w~ and right Item ~b~N° " .. rightItemIndex .. "~w~ selected!")
	end

	pauseMenuExample:Visible(true)
end

RegisterCommand("lobbymenu", function()
		local lobbyMenu = MainView.New("Lobby Menu", "ScaleformUI for you by Manups4e!", "Detail 1", "Detail 2", "Detail 3")
		local columns = {
			SettingsListColumn.New("COLUMN SETTINGS", Colours.HUD_COLOUR_RED),
			PlayerListColumn.New("COLUMN PLAYERS", Colours.HUD_COLOUR_ORANGE),
			MissionDetailsPanel.New("COLUMN INFO PANEL", Colours.HUD_COLOUR_GREEN),
		}
		lobbyMenu:SetupColumns(columns)

		local handle = RegisterPedheadshot(PlayerPedId())
		while not IsPedheadshotReady(handle) or not IsPedheadshotValid(handle) do Wait(0) end
		local txd = GetPedheadshotTxdString(handle)
		lobbyMenu:HeaderPicture(txd, txd) 	-- lobbyMenu:CrewPicture used to add a picture on the left of the HeaderPicture

		UnregisterPedheadshot(handle) -- call it right after adding the menu.. this way the txd will be loaded correctly by the scaleform.. 

		pool:AddPauseMenu(lobbyMenu)
		lobbyMenu:CanPlayerCloseMenu(true)
		-- this is just an example..CanPlayerCloseMenu is always defaulted to true.. if you set this to false.. be sure to give the players a way out of your menu!!! 
		local item = UIMenuItem.New("UIMenuItem", "UIMenuItem description")
		local item1 = UIMenuListItem.New("UIMenuListItem", { "This", "is", "a", "Test"}, 0, "UIMenuListItem description")
		local item2 = UIMenuCheckboxItem.New("UIMenuCheckboxItem", true, 1, "UIMenuCheckboxItem description")
		local item3 = UIMenuSliderItem.New("UIMenuSliderItem", 100, 5, 50, false, "UIMenuSliderItem description")
		local item4 = UIMenuProgressItem.New("UIMenuProgressItem", 10, 5, "UIMenuProgressItem description")
		item:BlinkDescription(true)
		lobbyMenu.SettingsColumn:AddSettings(item)
		lobbyMenu.SettingsColumn:AddSettings(item1)
		lobbyMenu.SettingsColumn:AddSettings(item2)
		lobbyMenu.SettingsColumn:AddSettings(item3)
		lobbyMenu.SettingsColumn:AddSettings(item4)

		local friend = FriendItem.New(GetPlayerName(PlayerId()), Colours.HUD_COLOUR_GREEN, true, GetRandomIntInRange(15, 55), "Status", "CrewTag")
		local friend1 = FriendItem.New(GetPlayerName(PlayerId()), Colours.HUD_COLOUR_MENU_YELLOW, true, GetRandomIntInRange(15, 55), "Status", "CrewTag")
		local friend2 = FriendItem.New(GetPlayerName(PlayerId()), Colours.HUD_COLOUR_PINK, true, GetRandomIntInRange(15, 55), "Status", "CrewTag")
		local friend3 = FriendItem.New(GetPlayerName(PlayerId()), Colours.HUD_COLOUR_BLUE, true, GetRandomIntInRange(15, 55), "Status", "CrewTag")
		local friend4 = FriendItem.New(GetPlayerName(PlayerId()), Colours.HUD_COLOUR_ORANGE, true, GetRandomIntInRange(15, 55), "Status", "CrewTag")
		local friend5 = FriendItem.New(GetPlayerName(PlayerId()), Colours.HUD_COLOUR_RED, true, GetRandomIntInRange(15, 55), "Status", "CrewTag")
		friend:SetLeftIcon(LobbyBadgeIcon.IS_CONSOLE_PLAYER, false)
		friend1:SetLeftIcon(LobbyBadgeIcon.IS_PC_PLAYER, false)
		friend2:SetLeftIcon(LobbyBadgeIcon.SPECTATOR, false)
		friend3:SetLeftIcon(LobbyBadgeIcon.INACTIVE_HEADSET, false)
		friend4:SetLeftIcon(BadgeStyle.COUNTRY_ITALY, true)
		friend5:SetLeftIcon(BadgeStyle.CASTLE, true)

		friend:AddPedToPauseMenu(PlayerPedId()) -- defaulted to 0 if you set it to nil / 0 the ped will be removed from the pause menu
		friend1:AddPedToPauseMenu(PlayerPedId()) -- defaulted to 0 if you set it to nil / 0 the ped will be removed from the pause menu
		friend2:AddPedToPauseMenu(PlayerPedId()) -- defaulted to 0 if you set it to nil / 0 the ped will be removed from the pause menu
		friend3:AddPedToPauseMenu(PlayerPedId()) -- defaulted to 0 if you set it to nil / 0 the ped will be removed from the pause menu
		friend4:AddPedToPauseMenu(PlayerPedId()) -- defaulted to 0 if you set it to nil / 0 the ped will be removed from the pause menu
		friend5:AddPedToPauseMenu(PlayerPedId()) -- defaulted to 0 if you set it to nil / 0 the ped will be removed from the pause menu
	
		local panel = PlayerStatsPanel.New("Player 1", Colours.HUD_COLOUR_GREEN)
		panel:Description("This is the description for Player 1!!")
		panel:HasPlane(true)
		panel:HasHeli(true)
		panel.RankInfo:RankLevel(150)
		panel.RankInfo:LowLabel("This is the low label")
		panel.RankInfo:MidLabel("This is the middle label")
		panel.RankInfo:UpLabel("This is the upper label")
		panel:AddStat(PlayerStatsPanelStatItem.New("Statistic 1", "Description 1", GetRandomIntInRange(30, 150)))
		panel:AddStat(PlayerStatsPanelStatItem.New("Statistic 2", "Description 2", GetRandomIntInRange(30, 150)))
		panel:AddStat(PlayerStatsPanelStatItem.New("Statistic 3", "Description 3", GetRandomIntInRange(30, 150)))
		panel:AddStat(PlayerStatsPanelStatItem.New("Statistic 4", "Description 4", GetRandomIntInRange(30, 150)))
		panel:AddStat(PlayerStatsPanelStatItem.New("Statistic 5", "Description 5", GetRandomIntInRange(30, 150)))
		friend:AddPanel(panel)
	
		local panel1 = PlayerStatsPanel.New("Player 2", Colours.HUD_COLOUR_MENU_YELLOW)
		panel1:Description("This is the description for Player 2!!")
		panel1:HasPlane(true)
		panel1:HasVehicle(true)
		panel1.RankInfo:RankLevel(70)
		panel1.RankInfo:LowLabel("This is the low label")
		panel1.RankInfo:MidLabel("This is the middle label")
		panel1.RankInfo:UpLabel("This is the upper label")
		panel1:AddStat(PlayerStatsPanelStatItem.New("Statistic 1", "Description 1", GetRandomIntInRange(30, 150)))
		panel1:AddStat(PlayerStatsPanelStatItem.New("Statistic 2", "Description 2", GetRandomIntInRange(30, 150)))
		panel1:AddStat(PlayerStatsPanelStatItem.New("Statistic 3", "Description 3", GetRandomIntInRange(30, 150)))
		panel1:AddStat(PlayerStatsPanelStatItem.New("Statistic 4", "Description 4", GetRandomIntInRange(30, 150)))
		panel1:AddStat(PlayerStatsPanelStatItem.New("Statistic 5", "Description 5", GetRandomIntInRange(30, 150)))
		friend1:AddPanel(panel1)
	
		local panel2 = PlayerStatsPanel.New("Player 3", Colours.HUD_COLOUR_PINK)
		panel2:Description("This is the description for Player 3!!")
		panel2:HasPlane(true)
		panel2:HasHeli(true)
		panel2:HasVehicle(true)
		panel2.RankInfo:RankLevel(15)
		panel2.RankInfo:LowLabel("This is the low label")
		panel2.RankInfo:MidLabel("This is the middle label")
		panel2.RankInfo:UpLabel("This is the upper label")
		panel2:AddStat(PlayerStatsPanelStatItem.New("Statistic 1", "Description 1", GetRandomIntInRange(30, 150)))
		panel2:AddStat(PlayerStatsPanelStatItem.New("Statistic 2", "Description 2", GetRandomIntInRange(30, 150)))
		panel2:AddStat(PlayerStatsPanelStatItem.New("Statistic 3", "Description 3", GetRandomIntInRange(30, 150)))
		panel2:AddStat(PlayerStatsPanelStatItem.New("Statistic 4", "Description 4", GetRandomIntInRange(30, 150)))
		panel2:AddStat(PlayerStatsPanelStatItem.New("Statistic 5", "Description 5", GetRandomIntInRange(30, 150)))
		friend2:AddPanel(panel2)
	
		local panel3 = PlayerStatsPanel.New("Player 4", Colours.HUD_COLOUR_FREEMODE)
		panel3:Description("This is the description for Player 4!!")
		panel3:HasPlane(true)
		panel3:HasHeli(true)
		panel3:HasBoat(true)
		panel3.RankInfo:RankLevel(10)
		panel3.RankInfo:LowLabel("This is the low label")
		panel3.RankInfo:MidLabel("This is the middle label")
		panel3.RankInfo:UpLabel("This is the upper label")
		panel3:AddStat(PlayerStatsPanelStatItem.New("Statistic 1", "Description 1", GetRandomIntInRange(30, 150)))
		panel3:AddStat(PlayerStatsPanelStatItem.New("Statistic 2", "Description 2", GetRandomIntInRange(30, 150)))
		panel3:AddStat(PlayerStatsPanelStatItem.New("Statistic 3", "Description 3", GetRandomIntInRange(30, 150)))
		panel3:AddStat(PlayerStatsPanelStatItem.New("Statistic 4", "Description 4", GetRandomIntInRange(30, 150)))
		panel3:AddStat(PlayerStatsPanelStatItem.New("Statistic 5", "Description 5", GetRandomIntInRange(30, 150)))
		friend3:AddPanel(panel3)
	
		local panel4 = PlayerStatsPanel.New("Player 5", Colours.HUD_COLOUR_ORANGE)
		panel4:Description("This is the description for Player 5!!")
		panel4:HasPlane(true)
		panel4:HasHeli(true)
		panel4.RankInfo:RankLevel(1000)
		panel4.RankInfo:LowLabel("This is the low label")
		panel4.RankInfo:MidLabel("This is the middle label")
		panel4.RankInfo:UpLabel("This is the upper label")
		panel4:AddStat(PlayerStatsPanelStatItem.New("Statistic 1", "Description 1", GetRandomIntInRange(30, 150)))
		panel4:AddStat(PlayerStatsPanelStatItem.New("Statistic 2", "Description 2", GetRandomIntInRange(30, 150)))
		panel4:AddStat(PlayerStatsPanelStatItem.New("Statistic 3", "Description 3", GetRandomIntInRange(30, 150)))
		panel4:AddStat(PlayerStatsPanelStatItem.New("Statistic 4", "Description 4", GetRandomIntInRange(30, 150)))
		panel4:AddStat(PlayerStatsPanelStatItem.New("Statistic 5", "Description 5", GetRandomIntInRange(30, 150)))
		friend4:AddPanel(panel4)
	
		local panel5 = PlayerStatsPanel.New("Player 6", Colours.HUD_COLOUR_RED)
		panel5:Description("This is the description for Player 6!!")
		panel5:HasPlane(true)
		panel5:HasHeli(true)
		panel5.RankInfo:RankLevel(22)
		panel5.RankInfo:LowLabel("This is the low label")
		panel5.RankInfo:MidLabel("This is the middle label")
		panel5.RankInfo:UpLabel("This is the upper label")
		panel5:AddStat(PlayerStatsPanelStatItem.New("Statistic 1", "Description 1", GetRandomIntInRange(30, 150)))
		panel5:AddStat(PlayerStatsPanelStatItem.New("Statistic 2", "Description 2", GetRandomIntInRange(30, 150)))
		panel5:AddStat(PlayerStatsPanelStatItem.New("Statistic 3", "Description 3", GetRandomIntInRange(30, 150)))
		panel5:AddStat(PlayerStatsPanelStatItem.New("Statistic 4", "Description 4", GetRandomIntInRange(30, 150)))
		panel5:AddStat(PlayerStatsPanelStatItem.New("Statistic 5", "Description 5", GetRandomIntInRange(30, 150)))
		friend5:AddPanel(panel5)
	
		lobbyMenu.PlayersColumn:AddPlayer(friend)
		lobbyMenu.PlayersColumn:AddPlayer(friend1)
		lobbyMenu.PlayersColumn:AddPlayer(friend2)
		lobbyMenu.PlayersColumn:AddPlayer(friend3)
		lobbyMenu.PlayersColumn:AddPlayer(friend4)
		lobbyMenu.PlayersColumn:AddPlayer(friend5)

		
		local txd = CreateRuntimeTxd("scaleformui");
		local _paneldui = CreateDui("https://i.imgur.com/mH0Y65C.gif", 288, 160)
		CreateRuntimeTextureFromDuiHandle(txd, "lobby_panelbackground", GetDuiHandle(_paneldui))

		lobbyMenu.MissionPanel:UpdatePanelPicture("scaleformui", "lobby_panelbackground")
		lobbyMenu.MissionPanel:Title("ScaleformUI - Title")
		local detailItem1 = UIMenuFreemodeDetailsItem.New("Left Label", "Right Label", false, BadgeStyle.BRIEFCASE, Colours.HUD_COLOUR_FREEMODE)
		local detailItem2 = UIMenuFreemodeDetailsItem.New("Left Label", "Right Label", false, BadgeStyle.STAR, Colours.HUD_COLOUR_GOLD)
		local detailItem3 = UIMenuFreemodeDetailsItem.New("Left Label", "Right Label", false, BadgeStyle.ARMOR, Colours.HUD_COLOUR_PURPLE)
		local detailItem4 = UIMenuFreemodeDetailsItem.New("Left Label", "Right Label", false, BadgeStyle.BRAND_DILETTANTE, Colours.HUD_COLOUR_GREEN)
		local detailItem5 = UIMenuFreemodeDetailsItem.New("Left Label", "Right Label", false, BadgeStyle.COUNTRY_ITALY, Colours.HUD_COLOUR_WHITE, true)
		local detailItem6 = UIMenuFreemodeDetailsItem.New("Left Label", "Right Label", true)
		local detailItem7 = UIMenuFreemodeDetailsItem.New("Left Label", "Right Label", false)
		--local missionItem4 = new("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", "", false)
		lobbyMenu.MissionPanel:AddItem(detailItem1)
		lobbyMenu.MissionPanel:AddItem(detailItem2)
		lobbyMenu.MissionPanel:AddItem(detailItem3)
		lobbyMenu.MissionPanel:AddItem(detailItem4)
		lobbyMenu.MissionPanel:AddItem(detailItem5)
		lobbyMenu.MissionPanel:AddItem(detailItem6)
		lobbyMenu.MissionPanel:AddItem(detailItem7)

		lobbyMenu.SettingsColumn.OnIndexChanged = function(idx)
			ScaleformUI.Notifications:ShowSubtitle("SettingsColumn index =>~b~ ".. idx .. "~w~.")
		end

		lobbyMenu.PlayersColumn.OnIndexChanged = function(idx)
			ScaleformUI.Notifications:ShowSubtitle("PlayersColumn index =>~b~ ".. idx .. "~w~.")
		end

		lobbyMenu:Visible(true)
end)

local MissionSelectorVisible = false
function CreateMissionSelectorMenu()

	MissionSelectorVisible = not MissionSelectorVisible

	if not MissionSelectorVisible then 
		ScaleformUI.Scaleforms.JobMissionSelector:Enabled(false) 
		return
	end

	local txd = CreateRuntimeTxd("test");
	local _paneldui = CreateDui("https://i.imgur.com/mH0Y65C.gif", 288, 160);
	CreateRuntimeTextureFromDuiHandle(txd, "panelbackground", GetDuiHandle(_paneldui));

	ScaleformUI.Scaleforms.JobMissionSelector:SetTitle("MISSION SELECTOR")
	ScaleformUI.Scaleforms.JobMissionSelector.MaxVotes = 3
	ScaleformUI.Scaleforms.JobMissionSelector:SetVotes(0, "VOTED")
	ScaleformUI.Scaleforms.JobMissionSelector.Cards = {}

	local card = JobSelectionCard.New("Test 1", "~y~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", "test", "panelbackground", 12, 15, JobSelectionCardIcon.BASE_JUMPING, Colours.HUD_COLOUR_FREEMODE, 2, {
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOMission, Colours.HUD_COLOUR_FREEMODE),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.Deathmatch, Colours.HUD_COLOUR_GOLD),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.RaceFinish, Colours.HUD_COLOUR_PURPLE),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOSurvival, Colours.HUD_COLOUR_GREEN),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.TeamDeathmatch, Colours.HUD_COLOUR_WHITE, true),
	})
	ScaleformUI.Scaleforms.JobMissionSelector:AddCard(card)

	local card1 = JobSelectionCard.New("Test 2", "~y~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", "test", "panelbackground", 12, 15, JobSelectionCardIcon.BASE_JUMPING, Colours.HUD_COLOUR_FREEMODE, 2, {
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOMission, Colours.HUD_COLOUR_FREEMODE),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.Deathmatch, Colours.HUD_COLOUR_GOLD),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.RaceFinish, Colours.HUD_COLOUR_PURPLE),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOSurvival, Colours.HUD_COLOUR_GREEN),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.TeamDeathmatch, Colours.HUD_COLOUR_WHITE, true),
	})
	ScaleformUI.Scaleforms.JobMissionSelector:AddCard(card1)

	local card2 = JobSelectionCard.New("Test 3", "~y~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", "test", "panelbackground", 12, 15, JobSelectionCardIcon.BASE_JUMPING, Colours.HUD_COLOUR_FREEMODE, 2, {
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOMission, Colours.HUD_COLOUR_FREEMODE),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.Deathmatch, Colours.HUD_COLOUR_GOLD),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.RaceFinish, Colours.HUD_COLOUR_PURPLE),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOSurvival, Colours.HUD_COLOUR_GREEN),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.TeamDeathmatch, Colours.HUD_COLOUR_WHITE, true),
	})
	ScaleformUI.Scaleforms.JobMissionSelector:AddCard(card2)

	local card3 = JobSelectionCard.New("Test 4", "~y~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", "test", "panelbackground", 12, 15, JobSelectionCardIcon.BASE_JUMPING, Colours.HUD_COLOUR_FREEMODE, 2, {
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOMission, Colours.HUD_COLOUR_FREEMODE),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.Deathmatch, Colours.HUD_COLOUR_GOLD),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.RaceFinish, Colours.HUD_COLOUR_PURPLE),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOSurvival, Colours.HUD_COLOUR_GREEN),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.TeamDeathmatch, Colours.HUD_COLOUR_WHITE, true),
	})
	ScaleformUI.Scaleforms.JobMissionSelector:AddCard(card3)

	local card4 = JobSelectionCard.New("Test 5", "~y~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", "test", "panelbackground", 12, 15, JobSelectionCardIcon.BASE_JUMPING, Colours.HUD_COLOUR_FREEMODE, 2, {
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOMission, Colours.HUD_COLOUR_FREEMODE),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.Deathmatch, Colours.HUD_COLOUR_GOLD),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.RaceFinish, Colours.HUD_COLOUR_PURPLE),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOSurvival, Colours.HUD_COLOUR_GREEN),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.TeamDeathmatch, Colours.HUD_COLOUR_WHITE, true),
	})
	ScaleformUI.Scaleforms.JobMissionSelector:AddCard(card4)

	local card5 = JobSelectionCard.New("Test 6", "~y~Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", "test", "panelbackground", 12, 15, JobSelectionCardIcon.BASE_JUMPING, Colours.HUD_COLOUR_FREEMODE, 2, {
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOMission, Colours.HUD_COLOUR_FREEMODE),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.Deathmatch, Colours.HUD_COLOUR_GOLD),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.RaceFinish, Colours.HUD_COLOUR_PURPLE),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOSurvival, Colours.HUD_COLOUR_GREEN),
		MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.TeamDeathmatch, Colours.HUD_COLOUR_WHITE, true),
	})
	ScaleformUI.Scaleforms.JobMissionSelector:AddCard(card5)

	ScaleformUI.Scaleforms.JobMissionSelector.Buttons = {
		JobSelectionButton.New("Button 1", "description test", {
			MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOMission, Colours.HUD_COLOUR_FREEMODE),
			MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.Deathmatch, Colours.HUD_COLOUR_GOLD),
			MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.RaceFinish, Colours.HUD_COLOUR_PURPLE),
			MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOSurvival, Colours.HUD_COLOUR_GREEN),
			MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.TeamDeathmatch, Colours.HUD_COLOUR_WHITE, true),
		}),
		JobSelectionButton.New("Button 2", "description test", {
			MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOMission, Colours.HUD_COLOUR_FREEMODE),
			MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.Deathmatch, Colours.HUD_COLOUR_GOLD),
			MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.RaceFinish, Colours.HUD_COLOUR_PURPLE),
			MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOSurvival, Colours.HUD_COLOUR_GREEN),
			MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.TeamDeathmatch, Colours.HUD_COLOUR_WHITE, true),
		}),
		JobSelectionButton.New("Button 3", "description test", {
			MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOMission, Colours.HUD_COLOUR_FREEMODE),
			MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.Deathmatch, Colours.HUD_COLOUR_GOLD),
			MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.RaceFinish, Colours.HUD_COLOUR_PURPLE),
			MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.GTAOSurvival, Colours.HUD_COLOUR_GREEN),
			MissionDetailsItem.New("Left Label", "Right Label", false, JobIcon.TeamDeathmatch, Colours.HUD_COLOUR_WHITE, true),
		}),
	}
	ScaleformUI.Scaleforms.JobMissionSelector.Buttons[1].Selectable = false
	ScaleformUI.Scaleforms.JobMissionSelector.Buttons[2].Selectable = false
	ScaleformUI.Scaleforms.JobMissionSelector.Buttons[3].Selectable = true

	ScaleformUI.Scaleforms.JobMissionSelector.Buttons[1].OnButtonPressed = function()
		ScaleformUI.Notifications:ShowSubtitle("Button Pressed => " .. ScaleformUI.Scaleforms.JobMissionSelector.Buttons[1].Text)
	end
	ScaleformUI.Scaleforms.JobMissionSelector:Enabled(true)
	
	Wait(1000)
	ScaleformUI.Scaleforms.JobMissionSelector:ShowPlayerVote(3, "PlayerName", Colours.HUD_COLOUR_GREEN, true, true)
end

