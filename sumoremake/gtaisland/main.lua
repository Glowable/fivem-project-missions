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

function showmessagelol(msg, time)
	ShowMpMessageLarge(msg, time)
end

function fadeshortlong()
    DoScreenFadeOut(200)
    Citizen.Wait(6000)
    DoScreenFadeIn(200)
end

RegisterNetEvent("mt:missiontext")
AddEventHandler("mt:missiontext", function(text, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(text)
    DrawSubtitleTimed(time, 1)
end)

RegisterCommand("startsumo", function()
    TriggerEvent("sumo:welcomevl")
    TriggerEvent("sumo:scaleformstart")
    InitPowerPlay()
    startZone()
    disableKeys()
end)

RegisterCommand("startsumo2", function()
    TriggerServerEvent("spawnAllPlayers")
end)

RegisterCommand("explodevehicle", function()
    print("boom")
    NetworkExplodeVehicle(GetVehiclePedIsIn(PlayerPedId(), false), true, true)
    SetEntityHealth(GetPlayerPed(-1), 0)
end)



function DisplayNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end


local deathMessages = {
    "WASTED!",
    "GG!",
    "YOU DIED!",
    "YOU SUCK!",
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        if IsEntityDead(playerPed) then
            -- Print message to server console
            print("Player " .. GetPlayerName(PlayerId()) .. " has died.")
            
            -- Choose random death message
            local message = deathMessages[math.random(1, #deathMessages)]
            
            -- Display death message and screen effect to player
            TriggerEvent('cS.banner', "~r~" .. message .. "~s~", "Player " .. GetPlayerName(PlayerId()) .. " has died.", 3, true)
            Citizen.Wait(10000)
        end
    end
end)



           





