RegisterNetEvent("sumo:welcomev1")
AddEventHandler("sumo:welcomev1", function()
    local dialogue = {
        gxt = "expowau", -- GXT name
        line = "EXPOW_NEUT1", -- Line name without 1A lines and such
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

RegisterCommand("powerplayvl", function()
    TriggerEvent("sumo:powervl1")
    print("done")
end)