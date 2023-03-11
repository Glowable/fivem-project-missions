local prop = nil
local rotating = false
local rotationComplete = true

RegisterCommand("spawncube", function()
    TriggerEvent("qub3d:spawncube")
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
    prop = CreateObject(model, 3312.19, 1406.16, 173.8 + 1.0, true, true, true)
    if not DoesEntityExist(prop) then
        print("Failed to create prop")
        return
    end

    SetEntityRotation(prop, 0.0, 0.0, 0.0, 2, true)
    print("Prop spawned")
end)

Citizen.CreateThread(function()
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
end)

RegisterCommand("rotateprop", function()
    if prop ~= nil and not rotating and rotationComplete then
        SetEntityRotation(prop, 0.0, 0.0, 0.0, 2, true)
        rotating = true
        rotationComplete = false
    end
end)
