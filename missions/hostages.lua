RegisterCommand("testingletsgo", function()
    print ("hello")
end)

local NPC = { x = -2962.72, y = 483.09, z = 15.7, rotation = 268, NetworkSync = true}
local NPCC = { x = -2964.48, y = 479.87, z = 15.7, rotation = 344, NetworkSync = true}


RegisterNetEvent("glow:spawnpeds")
AddEventHandler("glow:spawnpeds", function()
  modelHash = GetHashKey("a_f_m_bevhills_01")
  RequestModel(modelHash)
  while not HasModelLoaded(modelHash) do
       Wait(1)
  end
  createNPC() 
  createNPC2()
end)
function createNPC()
	created_ped = CreatePed(0, modelHash , NPC.x,NPC.y,NPC.z - 1, NPC.rotation, NPC.NetworkSync)
	FreezeEntityPosition(created_ped, true)
	SetEntityInvincible(created_ped, true)
	TaskStartScenarioInPlace(created_ped, "CODE_HUMAN_STAND_COWER", 0, true)
    
    local blip = AddBlipForEntity(created_ped)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 3)
    SetBlipScale(blip, 0.8)
end

function createNPC2()
    created_pedd = CreatePed(0, modelHash , NPCC.x,NPCC.y,NPCC.z - 1, NPCC.rotation, NPCC.NetworkSync)
    FreezeEntityPosition(created_pedd, true)
	SetEntityInvincible(created_pedd, true)
    TaskStartScenarioInPlace(created_pedd, "CODE_HUMAN_STAND_COWER", 0, true)
    
    local blip = AddBlipForEntity(created_pedd)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 3)
    SetBlipScale(blip, 0.8)

end