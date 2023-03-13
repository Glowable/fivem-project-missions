local prop = nil
local rotating = false
local rotationComplete = true

RegisterCommand("spawncube", function()
    TriggerEvent("qub3d:spawncube")
end)

RegisterCommand("spawncube2", function()
    TriggerEvent("qub3d:spawncube2")
end)

RegisterNetEvent("qub3d:spawncube")
AddEventHandler("qub3d:spawncube", function()
    local model = GetHashKey("qube")
    if not IsModelValid(model) then
        print("Invalid model hash")
        return
    end

    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(100)
    end

    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    prop = CreateObject(model, 3312.19, 1406.16, 173.8 + 1.0, false, true, true)
    SetEntityLodDist(prop, 100)
    if not DoesEntityExist(prop) then
        print("Failed to create prop")
        return
    end

    SetEntityRotation(prop, 0.0, 0.0, 0.0, 2, true)
    SetEntityLodDist(prop, 1000)
    print("Prop spawned")
end)

RegisterNetEvent("qub3d:spawncube2")
AddEventHandler("qub3d:spawncube2", function()
    local model = GetHashKey("atw_qube")
    if not IsModelValid(model) then
        print("Invalid model hash")
        return
    end

    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(100)
    end

    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    prop = CreateObject(model, 3312.19, 1406.16, 173.8 + 1.0, false, true, true)
    if not DoesEntityExist(prop) then
        print("Failed to create prop")
        return
    end

    SetEntityRotation(prop, 0.0, 0.0, 0.0, 2, true)
    SetEntityLodDist(prop, 10000)
    print("Prop spawned")
end)


--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if prop ~= nil and rotating then
            local rotation = GetEntityRotation(prop)
            if rotation.x < 90.0 then
                SetEntityRotation(prop, rotation.x + 0.1, rotation.y, rotation.z, 2, true)
            else
                rotating = false
                rotationComplete = true
            end
        end
    end
end)]]


local count = 0

RegisterCommand("level1rotate", function()
    TriggerEvent("qub3d:rotatelevel1")
end)

RegisterNetEvent("qub3d:rotatelevel1")
AddEventHandler("qub3d:rotatelevel1", function()
    if not DoesEntityExist(prop) then return end 

    a = math.random(1, 3)

    rotX = GetEntityRotation(prop).x + 90

    if rotX > 100 then 
        rotX = -180
    end


    while true do 
        Wait(0)
        rot = GetEntityRotation(prop)

        --if rot.x < rotX --or (rotX < -160 and rot.x > rotX)]] then ]
        if a == 1 then
            SetEntityRotation(prop, rot.x + 0.05, rot.y, rot.z, 2, true)
        elseif a == 2 then
            SetEntityRotation(prop, rot.x, rot.y + 0.05, rot.z, 2, true)
        elseif a == 3 then
            SetEntityRotation(prop, rot.x - 0.05, rot.y, rot.z, 2, true)
        end
        

        count = count + 1

        if count >= 1800 then 
            count = 0 
            break
        end
    end
    print("rotation finished")
end)

RegisterNetEvent("qub3d:randomrotate")
AddEventHandler("qub3d:randomrotate", function()
    a = math.random(1, 2)
    if a == 1 then
        TriggerEvent("qub3d:rotatex")
        print("rotatingx")
    elseif a == 2 then
        TriggerEvent("qub3d:rotatey")
        print("rotatingy")

    end
end)


RegisterCommand("rotatex", function()
    TriggerEvent("qub3d:rotatex")
end)

RegisterNetEvent("qub3d:rotatex")
AddEventHandler("qub3d:rotatex", function()
    if not DoesEntityExist(prop) then return end 

    rotX = GetEntityRotation(prop).x + 90

    if rotX > 100 then 
        rotX = -180
    end


    while true do 
        Wait(0)
        rot = GetEntityRotation(prop)


        SetEntityRotation(prop, rot.x + 0.05, rot.y, rot.z, 2, true)

        

        count = count + 1

        if count >= 1800 then 
            count = 0 
            break
        end
    end
    print("rotation finished")
end)

RegisterNetEvent("qub3d:rotatexback")
AddEventHandler("qub3d:rotatexback", function()
    if not DoesEntityExist(prop) then return end 

    rotX = GetEntityRotation(prop).x - 90

    if rotX > 100 then 
        rotX = -180
    end


    while true do 
        Wait(0)
        rot = GetEntityRotation(prop)


        SetEntityRotation(prop, rot.x - 0.05, rot.y, rot.z, 2, true)

        

        count = count + 1

        if count >= 1800 then 
            count = 0 
            break
        end
    end
    print("rotation finished")
end)

RegisterCommand("rotatey", function()
    TriggerEvent("qub3d:rotatey")
end)

--[[RegisterNetEvent("qub3d:rotatey")
AddEventHandler("qub3d:rotatey", function()
    if not DoesEntityExist(prop) then return end 

    rotY = GetEntityRotation(prop).y + 90

    if rotY > 100 then 
        rotY = -180
    end


    while true do 
        Wait(0)
        rot = GetEntityRotation(prop)


        SetEntityRotation(prop, rot.x, rot.y + 0.05, rot.z, 2, true)

        

        count = count + 1

        if count >= 1800 then 
            count = 0 
            break
        end
    end
    print("rotation finished")
end)]]

RegisterNetEvent("qub3d:rotateyback")
AddEventHandler("qub3d:rotateyback", function()
    if not DoesEntityExist(prop) then return end 

    rotX = GetEntityRotation(prop).y - 90

    if rotX > 100 then 
        rotX = -180
    end


    while true do 
        Wait(0)
        rot = GetEntityRotation(prop)


        SetEntityRotation(prop, rot.x, rot.y - 0.05, rot.z, 2, true)

        

        count = count + 1

        if count >= 1800 then 
            count = 0 
            break
        end
    end
    print("rotation finished")
end)
