RegisterNetEvent("sumo:abil")
AddEventHandler("sumo:abil", function()
    Citizen.Wait(15000)
    TriggerEvent("cS.MidsizeBanner", "~o~Abilties will Spawn soon~s~.", "", 2, 5, true)
    Citizen.Wait(10000)
    print("abilities spawned")
    TriggerEvent("cS.MidsizeBanner", "~o~ABILITIES SPAWNED~s~.", "", 2, 5, true)
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

RegisterCommand("starttimer", function()
    local time = 15
    while true do
        time = time - 1
        if time == 0 then
            print("BOOOMMM")
            return
        else
        print(time)
        end
        Wait(1000)
    end
end)


RegisterCommand("respawnabil", function()
    TriggerEvent("sumo:abil")
end)

