RegisterNetEvent("sumo:abil")
AddEventHandler("sumo:abil", function()

    pickup1 = CreatePickupRotate(GetHashKey("PICKUP_PORTABLE_CRATE_FIXED_INCAR"), 219.48, 7405.74, 17.46, 180.1, 180.1, 210.1)
    local blip1 = AddBlipForCoord(219.48, 7405.74, 17.46)
    SetBlipSprite(blip1, 469)
    SetBlipColour(blip1, 2)
    SetBlipRoute(blip1, false)



    while true do
        if HasPickupBeenCollected(pickup1) then



            RemoveBlip(blip1)
            dopeAllPlayers() 
        end
        Citizen.Wait(0)
    end
end)