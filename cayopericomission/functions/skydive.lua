RegisterCommand("testingplane", function()
    local playerPed = GetPlayerPed(-1) 
        TaskPlaneMission(playerPed, GetVehiclePedIsIn(PlayerPedId(), false), 0, 0, 5178.2, -5980.21, 365.19, 4, GetVehicleModelMaxSpeed(`velum`), 1.0, 238.0, 360.0, 370.0)
end)

local NPC = { x = -2962.72, y = 483.09, z = 15.7, rotation = 268, NetworkSync = true}

RegisterCommand("spawnpilot", function()
    TriggerEvent("glow:spawnpilot")
end)


RegisterNetEvent("glow:spawnpilot")
AddEventHandler("glow:spawnpilot", function()
  modelHash = GetHashKey("a_f_m_bevhills_01")
  RequestModel(modelHash)
  while not HasModelLoaded(modelHash) do
       Wait(1)
  end

	pilot = CreatePed(0, modelHash , NPC.x,NPC.y,NPC.z - 1, NPC.rotation, NPC.NetworkSync)
	SetEntityInvincible(pilot, true)
    
    local blip = AddBlipForEntity(pilot)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 3)
    SetBlipScale(blip, 0.8)
end)