RegisterNetEvent("sumo:abil")
AddEventHandler("sumo:abil", function()
    print("abilities spawned")
    pickup1 = CreatePickupRotate(GetHashKey("PICKUP_PORTABLE_CRATE_FIXED_INCAR"), 219.48, 7405.74, 17.46, 180.1, 180.1, 210.1)
    local blip1 = AddBlipForCoord(219.48, 7405.74, 17.46)
    SetBlipSprite(blip1, 469)
    SetBlipColour(blip1, 2)
    SetBlipRoute(blip1, false)

    pickup2 = CreatePickupRotate(GetHashKey("PICKUP_PORTABLE_CRATE_FIXED_INCAR"), 222.19, 7418.6, 19.45, 180.1, 180.1, 210.1)
    local blip2 = AddBlipForCoord( 222.19, 7418.6, 19.45)
    SetBlipSprite(blip2, 464)
    SetBlipColour(blip2, 2)
    SetBlipRoute(blip2, false)



    while true do
        if HasPickupBeenCollected(pickup1) then



            RemoveBlip(blip1)
            dopeAllPlayers() 
        end
        Citizen.Wait(0)

        if HasPickupBeenCollected(pickup2) then



            RemoveBlip(blip2)
            zoneAllPlayers() 
        end
        Citizen.Wait(0)
    end
end)

RegisterCommand("dopeall", function()
    dopeAllPlayers()
end)