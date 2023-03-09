RegisterNetEvent("sumo:openvehiclemenu")
AddEventHandler("sumo:openvehiclemenu", function()
	local txd = CreateRuntimeTxd("scaleformui")
	local dui = CreateDui("https://i.imgur.com/mH0Y65C.gif", 288, 160)
	CreateRuntimeTextureFromDuiHandle(txd, "sidepanel", GetDuiHandle(dui))
	
	local heistselect = UIMenu.New("Lobby", "VEHICLE SELECTION", 50, 50, true, nil, nil, true)
	heistselect:MaxItemsOnScreen(7)
	heistselect:BuildAsync(false) -- set to false to build in a sync way (might freeze game for a couple ms for high N of items in menus)
	pool:Add(heistselect)











	--[[
		2 ways to add submenus.. 
		- the old way => local submenu = pool:AddSubMenu(parent, ...)
		- way.New => 
			local subMenu = UIMenu.New()
			parent:AddSubMenu(subMenu, itemText, itemDescription, offset, KeepBanner)
	]]

	local vehicles     = { "Nero Custom", "Zentorno", "Cyclone", "Kamacho" }
    local colorListItem = UIMenuListItem.New("Vehicle", vehicles, 0,
        "Select your vehicle!")

    colorListItem.OnListChanged = function(menu, item, newindex)
        local name = item:IndexToItem(newindex)
        if name  == "Zentorno" then
            TriggerEvent("sumo:spawnzentorno")
        elseif name == "Nero Custom" then
            TriggerEvent("sumo:spawnnerocustom")
        elseif name == "Cyclone" then
            TriggerEvent("sumo:spawncyclone")
		elseif name == "Kamacho" then
            TriggerEvent("sumo:spawnkamacho")
        end
    end
    heistselect:AddItem(colorListItem)
	local upgrade = UIMenuItem.New("Upgrade Vehicle", "Coming Later")
	heistselect:AddItem(upgrade)


	upgrade.Activated = function(menu)
		if Activated then
			alert("Coming Eventually")
		else
			alert("Coming Eventually")
		end
	end

	local seperatorItem1 = UIMenuSeperatorItem.New("~g~---------------------------------", true)
	heistselect:AddItem(seperatorItem1)

	local ketchupItem = UIMenuCheckboxItem.New("Ready", animEnabled, 1, "This does nothing right now")
	heistselect:AddItem(ketchupItem)


	ketchupItem.OnCheckboxChanged = function(menu, item, checked)
		if checked then
			print("ready")
		else
			print("notready")
		end
	end




	--[[fleeca1.Activated = function(menu)
		if Activated then
			print("worked")
			TriggerEvent('glow:fleeca1')
		else
			print("worked?")
			TriggerEvent('glow:fleeca1')
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
	end]]




	heistselect:Visible(true)
end)