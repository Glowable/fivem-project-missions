RegisterCommand("spawncontainers", function()
    container1()
    opencon1()
    container2()
end)

RegisterCommand("opencontainer", function()
    opencontainer()
end)

function LoadModels(models)
    for i = 1, #models do
        RequestModel(GetHashKey(models[i]))
    end
    while not HasModelLoaded(GetHashKey(models[1])) do
        Wait(0)
    end
end

-- requires that you have a container made already, can swap code out to just make one
-- /makemeacontainer is provided

function animseq1()
    local models = {
        "tr_prop_tr_grinder_01a",
        "tr_prop_tr_container_01a",
        "tr_prop_tr_lock_01a",
        "hei_p_m_bag_var22_arm_s", -- guessed prop
        "tr_prop_tr_cont_coll_01a" -- collision
    }
    
    local dict = "anim@scripted@player@mission@tunf_train_ig1_container_p1@male@"
    RequestNamedPtfxAsset("scr_tn_tr")
    RequestAnimDict(dict)
    RequestScriptAudioBank("dlc_tuner/dlc_tuner_generic")
    LoadModels(models)
    repeat Wait(0) until HasAnimDictLoaded(dict)
    repeat Wait(0) until HasNamedPtfxAssetLoaded("scr_tn_tr")
    repeat Wait(0) until RequestScriptAudioBank("dlc_tuner/dlc_tuner_generic")

    local player = PlayerPedId()
    --local container = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 10.0, GetHashKey(models[2]), false, false, false)

    local playerPos = GetEntityCoords(player)
    local heading = GetEntityHeading(player)

    local grinder = CreateObject(GetHashKey(models[1]), playerPos.x, playerPos.y, playerPos.z, true, true, false)
    --local container = CreateObject(GetHashKey(models[2]), playerPos.x, playerPos.y, playerPos.z, true, true, false)

    local container = GetClosestObjectOfType(playerPos, 10.0, GetHashKey(models[2]), false, false, false)
    RemoveDecalsFromObject(container)
    local containerPos = GetEntityCoords(container)
    local containerHeading = GetEntityHeading(container)
    local containerRotation = GetEntityRotation(container)
    --local lock = CreateObject(GetHashKey(models[3]), playerPos.x, playerPos.y, playerPos.z, true, true, false)
    
    local lock = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 5.0, GetHashKey(models[3]), false, false, false)

    NetworkRequestControlOfEntity(container)
    NetworkRequestControlOfEntity(lock)
    local starttime = GetGameTimer()
    -- yes yes, network ownership, onesync, bad.
    while not NetworkHasControlOfEntity(container) or not NetworkHasControlOfEntity(lock) do
        DrawSimpleText("Waiting for network ownership...", 0.5, 0.95)
        Wait(0)
        if GetGameTimer() - starttime > 7500 then
            print("Timed out waiting for control of container")
            break
        end
    end

    local bag = CreateObject(GetHashKey(models[4]), playerPos.x, playerPos.y, playerPos.z, true, true, false)

    FreezeEntityPosition(container, true)
    local scene = NetworkCreateSynchronisedScene(containerPos.x, containerPos.y, containerPos.z, containerRotation.x, containerRotation.y, containerRotation.z, 2, true, false, 1.0, 0.0, 1.0)
    
    
    NetworkAddPedToSynchronisedScene(player, scene, dict, "action", 8.0, 8.0, 0, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(grinder, scene, dict, "action_angle_grinder", 8.0, 8.0, 0)
    NetworkAddEntityToSynchronisedScene(lock, scene, dict, "action_lock", 8.0, 8.0, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene, dict, "action_bag", 8.0, 8.0, 0)
    --NetworkAddEntityToSynchronisedScene(container, scene, dict, "action_container", 8.0, -8.0, 0)
    AttachSynchronizedSceneToEntity(scene, container, -1)
    NetworkStartSynchronisedScene(scene)
    -- container has to be done the old fashioned way
    -- because i can't seem to figure out a good way to make it lock on the last frame
    -- this isn't much of an issue courtesy of the fact that the container is the basis of the animation
    PlayEntityAnim(container, "action_container", dict, -8.0, false, true, false, 0, 0)
    while NetworkGetLocalSceneFromNetworkId(scene) == -1 do Wait(0) end
    local localscene = NetworkGetLocalSceneFromNetworkId(scene)

    local particle = nil

    while GetSynchronizedScenePhase(localscene) < 0.99 and IsSynchronizedSceneRunning(localscene) do
        if HasAnimEventFired(player, -1953940906) then
            UseParticleFxAsset("scr_tn_tr")
            particle = StartNetworkedParticleFxLoopedOnEntity("scr_tn_tr_angle_grinder_sparks", grinder, 0.0, 0.25, 0.0, 0.0, 0.0, 0.0, 1.0, false, false, false, 1065353216, 1065353216, 1065353216, 1)
        end
        if HasAnimEventFired(player, -258875766) then
            StopParticleFxLooped(particle, 0)
        end

        DisableCamCollisionForEntity(grinder, true)
        DisableCamCollisionForEntity(container, true)
        DisableCamCollisionForEntity(lock, true)
        DisableCamCollisionForEntity(bag, true)

        Wait(0)
    end
    print("Synchronized scene finished")
    print("Setting final collision")

    -- transition to complete collision
    SetEntityCollision(container, false, false)
    FreezeEntityPosition(container, true)
    local collisionBlocker = CreateObject(GetHashKey(models[5]), containerPos.x, containerPos.y, containerPos.z, true, true, false)
    SetEntityCoordsNoOffset(collisionBlocker, containerPos.x, containerPos.y, containerPos.z, true, false, false)
    SetEntityRotation(collisionBlocker, containerRotation.x, containerRotation.y, containerRotation.z, 2, true)
    FreezeEntityPosition(collisionBlocker, true)
    DeleteEntity(grinder)
    DeleteEntity(bag)
    DeleteEntity(lock)

    -- clean up memory
    for k,v in models do SetModelAsNoLongerNeeded(GetHashKey(v)) end
    RemoveAnimDict(dict)
    ReleaseNamedScriptAudioBank("dlc_tuner/dlc_tuner_generic")
    DisposeSynchronizedScene(scene)
end

function animseq2()
    local models = {
        "tr_prop_tr_grinder_01a",
        "tr_prop_tr_container_01a",
        "tr_prop_tr_lock_01a",
        "hei_p_m_bag_var22_arm_s", -- guessed prop
        "tr_prop_tr_cont_coll_01a" -- collision
    }
    
    local dict = "anim@scripted@player@mission@tunf_train_ig1_container_p1@male@"
    RequestNamedPtfxAsset("scr_tn_tr")
    RequestAnimDict(dict)
    RequestScriptAudioBank("dlc_tuner/dlc_tuner_generic")
    LoadModels(models)
    repeat Wait(0) until HasAnimDictLoaded(dict)
    repeat Wait(0) until HasNamedPtfxAssetLoaded("scr_tn_tr")
    repeat Wait(0) until RequestScriptAudioBank("dlc_tuner/dlc_tuner_generic")

    local player = PlayerPedId()
    --local container = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 10.0, GetHashKey(models[2]), false, false, false)

    local playerPos = GetEntityCoords(player)
    local heading = GetEntityHeading(player)

    local grinder = CreateObject(GetHashKey(models[1]), playerPos.x, playerPos.y, playerPos.z, true, true, false)
    --local container = CreateObject(GetHashKey(models[2]), playerPos.x, playerPos.y, playerPos.z, true, true, false)

    local container2 = GetClosestObjectOfType(playerPos, 10.0, GetHashKey(models[2]), false, false, false)
    RemoveDecalsFromObject(container2)
    local containerPos = GetEntityCoords(container2)
    local containerHeading = GetEntityHeading(container2)
    local containerRotation = GetEntityRotation(container2)
    --local lock = CreateObject(GetHashKey(models[3]), playerPos.x, playerPos.y, playerPos.z, true, true, false)
    
    local lock = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 5.0, GetHashKey(models[3]), false, false, false)

    NetworkRequestControlOfEntity(container2)
    NetworkRequestControlOfEntity(lock)
    local starttime = GetGameTimer()
    -- yes yes, network ownership, onesync, bad.
    while not NetworkHasControlOfEntity(container2) or not NetworkHasControlOfEntity(lock) do
        DrawSimpleText("Waiting for network ownership...", 0.5, 0.95)
        Wait(0)
        if GetGameTimer() - starttime > 7500 then
            print("Timed out waiting for control of container")
            break
        end
    end

    local bag = CreateObject(GetHashKey(models[4]), playerPos.x, playerPos.y, playerPos.z, true, true, false)

    FreezeEntityPosition(container2, true)
    local scene = NetworkCreateSynchronisedScene(container2Pos.x, container2Pos.y, container2Pos.z, container2Rotation.x, container2Rotation.y, container2Rotation.z, 2, true, false, 1.0, 0.0, 1.0)
    
    
    NetworkAddPedToSynchronisedScene(player, scene, dict, "action", 8.0, 8.0, 0, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(grinder, scene, dict, "action_angle_grinder", 8.0, 8.0, 0)
    NetworkAddEntityToSynchronisedScene(lock, scene, dict, "action_lock", 8.0, 8.0, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene, dict, "action_bag", 8.0, 8.0, 0)
    --NetworkAddEntityToSynchronisedScene(container, scene, dict, "action_container", 8.0, -8.0, 0)
    AttachSynchronizedSceneToEntity(scene, container2, -1)
    NetworkStartSynchronisedScene(scene)
    -- container has to be done the old fashioned way
    -- because i can't seem to figure out a good way to make it lock on the last frame
    -- this isn't much of an issue courtesy of the fact that the container is the basis of the animation
    PlayEntityAnim(container2, "action_container", dict, -8.0, false, true, false, 0, 0)
    while NetworkGetLocalSceneFromNetworkId(scene) == -1 do Wait(0) end
    local localscene = NetworkGetLocalSceneFromNetworkId(scene)

    local particle = nil

    while GetSynchronizedScenePhase(localscene) < 0.99 and IsSynchronizedSceneRunning(localscene) do
        if HasAnimEventFired(player, -1953940906) then
            UseParticleFxAsset("scr_tn_tr")
            particle = StartNetworkedParticleFxLoopedOnEntity("scr_tn_tr_angle_grinder_sparks", grinder, 0.0, 0.25, 0.0, 0.0, 0.0, 0.0, 1.0, false, false, false, 1065353216, 1065353216, 1065353216, 1)
        end
        if HasAnimEventFired(player, -258875766) then
            StopParticleFxLooped(particle, 0)
        end

        DisableCamCollisionForEntity(grinder, true)
        DisableCamCollisionForEntity(container2, true)
        DisableCamCollisionForEntity(lock, true)
        DisableCamCollisionForEntity(bag, true)

        Wait(0)
    end
    print("Synchronized scene finished")
    print("Setting final collision")

    -- transition to complete collision
    SetEntityCollision(container2, false, false)
    FreezeEntityPosition(container2, true)
    local collisionBlocker = CreateObject(GetHashKey(models[5]), container2Pos.x, container2Pos.y, container2Pos.z, true, true, false)
    SetEntityCoordsNoOffset(collisionBlocker, container2Pos.x, container2Pos.y, container2Pos.z, true, false, false)
    SetEntityRotation(collisionBlocker, container2Rotation.x, container2Rotation.y, container2Rotation.z, 2, true)
    FreezeEntityPosition(collisionBlocker, true)
    DeleteEntity(grinder)
    DeleteEntity(bag)
    DeleteEntity(lock)

    -- clean up memory
    for k,v in models do SetModelAsNoLongerNeeded(GetHashKey(v)) end
    RemoveAnimDict(dict)
    ReleaseNamedScriptAudioBank("dlc_tuner/dlc_tuner_generic")
    DisposeSynchronizedScene(scene)
end

function container1()
    local dict = "anim@scripted@player@mission@tunf_train_ig1_container_p1@male@"
    RequestAnimDict(dict)

    local model = GetHashKey("tr_prop_tr_container_01a")
    local lockmodel = GetHashKey("tr_prop_tr_lock_01a")
    RequestModel(model)
    RequestModel(lockmodel)
    while not HasModelLoaded(model) do Wait(0) end
    while not HasModelLoaded(lockmodel) do Wait(0) end
    while not HasAnimDictLoaded(dict) do Wait(0) end

    local container = CreateObject(model, 4909.2, -5226.6, 2.32, true, false, true)
    SetEntityHeading(container, 135.1)
    SetModelAsNoLongerNeeded(model)
    SetEntityDynamic(container, true)

    print("Waiting for container to settle")
    Wait(2500)

    local lockoffset = GetAnimInitialOffsetPosition(dict, "action_lock", GetEntityCoords(container), GetEntityRotation(container), 0.0, 0)
    local lockrot = GetAnimInitialOffsetRotation(dict, "action_lock", GetEntityCoords(container), GetEntityRotation(container), 0.0, 0)
    local lock = CreateObject(lockmodel, lockoffset, true, false, true)
    SetEntityRotation(lock, lockrot.x, lockrot.y, lockrot.z, 2, true)
end

function container2()
    local dict = "anim@scripted@player@mission@tunf_train_ig1_container_p1@male@"
    RequestAnimDict(dict)

    local model = GetHashKey("tr_prop_tr_container_01a")
    local lockmodel = GetHashKey("tr_prop_tr_lock_01a")
    RequestModel(model)
    RequestModel(lockmodel)
    while not HasModelLoaded(model) do Wait(0) end
    while not HasModelLoaded(lockmodel) do Wait(0) end
    while not HasAnimDictLoaded(dict) do Wait(0) end

    local container2 = CreateObject(model, 4973.38, -5111.8, 2.92, true, false, true)
    SetEntityHeading(container2, 336.1)
    SetModelAsNoLongerNeeded(model)
    SetEntityDynamic(container2, true)

    print("Waiting for container to settle")
    Wait(2500)

    local lockoffset = GetAnimInitialOffsetPosition(dict, "action_lock", GetEntityCoords(container2), GetEntityRotation(container2), 0.0, 0)
    local lockrot = GetAnimInitialOffsetRotation(dict, "action_lock", GetEntityCoords(container2), GetEntityRotation(container2), 0.0, 0)
    local lock = CreateObject(lockmodel, lockoffset, true, false, true)
    SetEntityRotation(lock, lockrot.x, lockrot.y, lockrot.z, 2, true)
end

function opencon1()
    local ped = PlayerPedId()
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(4972.24, -5114.6, 3.05))
        if dist < 1 then
            inArea = true
            print("done")
            opencontainer()
            
        end
    end
end

function opencon1()
    print("awaiting player input")
    local e_key = 38
    while true do
        Citizen.Wait(1)
        alert("∑ Press ~INPUT_PICKUP~ to cut open the ~b~Container")
        if IsControlJustReleased(38,  e_key --[[ H key ]]) then
            animseq1()
            break
            
        end
    end
end

function Lerp(a, b, t)
    return a + (b - a) * t
end

--local blip = AddBlipForCoord(-1037.75, -2736.93, 20.17)
--SetBlipSprite(blip, 1)
--SetBlipColour(blip, 5)
--SetBlipRoute(blip, true)