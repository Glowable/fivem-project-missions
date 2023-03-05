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

local isTrevorAbilityActive = false

RegisterCommand('trevor', function()
    -- toggle Trevor's ability
    isTrevorAbilityActive = not isTrevorAbilityActive

    -- notify the player about the ability status
    if isTrevorAbilityActive then
        notify('~g~Trevor\'s ability activated')
    else
        notify('~r~Trevor\'s ability deactivated')
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsControlPressed(0, 137) and isTrevorAbilityActive then -- Caps Lock key
            SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
            SetPlayerWeaponDamageModifier(PlayerId(), 2.0)
        else
            SetPlayerHealthRechargeMultiplier(PlayerId(), 1.0)
            SetPlayerWeaponDamageModifier(PlayerId(), 1.0)
        end
    end
end)

-- helper function to display notifications on the player's screen
function notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end
