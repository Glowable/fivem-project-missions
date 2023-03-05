RegisterNetEvent("zonePlayer", function()
    TriggerEvent("sumo:zonevl")
    ActivateIcon(5, "zoned", "You are in the Zone", true, 1)
    zoneEffect()
end)

RegisterCommand("zoneplayer", function()
    zoneAllPlayers()
end)

function zoneAllPlayers()
    local e_key = 38
    while true do
        Citizen.Wait(1)
        alert("∑ Press ~INPUT_PICKUP~ to ~r~ZONE ~w~all players")
        if IsControlJustReleased(38, e_key --[[ H key ]]) then
            TriggerServerEvent("zoneAllPlayers")    
            break
        end
    end
end

---the actual effect
function zoneEffect()
    print("started zone effect")
    SetSpecialAbility(PlayerId(), 2, 1)
    AnimpostfxPlay("SwitchOpenMichaelIn", 5000, false)
    Citizen.Wait(10000)
    AnimpostfxStopAll()
    SpecialAbilityDeactivateFast(PlayerId(), 1)
    print("stopped zone effect")
end

RegisterNetEvent("sumo:zonevl")
AddEventHandler("sumo:zonevl", function()
    local dialogue = {
        gxt = "expowau", -- GXT name
        line = "EXPOW_BTYOUN", -- Line name without 1A lines and such
        speakers = {
            ["2"] = "EXEC1_POWERANN", -- Speakers, required, based on SL. needs to be accurate
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

