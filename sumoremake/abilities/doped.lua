RegisterNetEvent("dopePlayer", function()
    TriggerEvent("sumo:dopedvl")
    TriggerEvent("cS.MidsizeBanner", "~o~DOPED~w~", "", 5, 9, true)
    dopeEffect()
end)

function dopeAllPlayers()
    local e_key = 38
    while true do
        Citizen.Wait(1)
        alert("∑ Press ~INPUT_PICKUP~ to ~r~DOPE ~w~all players")
        if IsControlJustReleased(38, e_key --[[ H key ]]) then
            TriggerServerEvent("dopeAllPlayers")    
            break
        end
    end
end

function dopeEffect()
    print("started dope effect")
    AnimpostfxPlay("DrugsTrevorClownsFightIn", 5000, false)
    Citizen.Wait(10000)
    AnimpostfxStopAll()
    print("stopped dope effect")
end

RegisterNetEvent("sumo:dopedvl")
AddEventHandler("sumo:dopedvl", function()
    local dialogue = {
        gxt = "expowau", -- GXT name
        line = "EXPOW_STTHEY", -- Line name without 1A lines and such
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

