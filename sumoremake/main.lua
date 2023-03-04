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
    TriggerEvent("sumo:welcomevl")
    startZone()
    disableKeys()
end)

RegisterCommand("explodevehicle", function()
    print("boom")
    NetworkExplodeVehicle(GetVehiclePedIsIn(PlayerPedId(), false), true, true)
    SetEntityHealth(GetPlayerPed(-1), 0)
end)