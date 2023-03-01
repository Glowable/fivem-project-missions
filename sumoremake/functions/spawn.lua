function setSpawn()
    SetEntityCoords(PlayerPedId(), 185.89, 7396.32, 14.08, 178.91, true, true, true, false)

end

function spawnAbilties()

    pickup1 = CreatePickupRotate(GetHashKey("PICKUP_PORTABLE_CRATE_FIXED_INCAR"), 219.48, 7405.74, 17.46, 180.1, 180.1, 210.1)
    local blip1 = AddBlipForCoord(219.48, 7405.74, 17.46)
    SetBlipSprite(blip1, 514)
    SetBlipColour(blip1, 3)
    SetBlipRoute(blip1, false)



    while true do
        if HasPickupBeenCollected(pickup1) then


            TriggerEvent("cS.MidsizeBanner", "~o~DOPED~w~", "", 5, 9, true)
            notify("YOUR TEAM GOT ~O~DOPED")
            RemoveBlip(blip1)
        end
        Citizen.Wait(0)
    end
end