RegisterNetEvent("qub3d:startrotation")
AddEventHandler("qub3d:startrotation", function()
    TriggerEvent("cS.MidsizeBanner", "~o~Grace Period~s~.", "", 2, 5, true)
    local time = 15
    while true do
        time = time - 1
        if time == 0 then
            TriggerEvent("qub3d:startrotation2")
            break
            return
        else
        print(time)
        end
        Wait(1000)
    end
end)

RegisterNetEvent("qub3d:startrotation2")
AddEventHandler("qub3d:startrotation2", function()
    TriggerEvent("cS.MidsizeBanner", "~r~Level 1~s~.", "", 2, 5, true)
    TriggerEvent("qub3d:rotatelevel1")
end)