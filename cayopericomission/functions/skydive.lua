RegisterCommand("testingplane", function()
    local playerPed = GetPlayerPed(-1) 
        TaskPlaneMission(playerPed, GetVehiclePedIsIn(PlayerPedId(), false), 0, 0, 5178.2, -5980.21, 365.19, 4, GetVehicleModelMaxSpeed(`velum`), 1.0, 238.0, 360.0, 370.0)
end)
