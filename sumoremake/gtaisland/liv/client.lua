local loaded = false
local currentVehicle = nil
local duiObj = nil

function loadTxd()
    local txd = CreateRuntimeTxd('duiTxd')
    duiObj = CreateDui('https://i.pinimg.com/originals/c9/7b/14/c97b14d7e3e825cdb563bd4219299ed8.gif', 376, 212)
    _G.duiObj = duiObj
    local dui = GetDuiHandle(duiObj)
    local tx = CreateRuntimeTextureFromDuiHandle(txd, 'duiTex', dui)
    AddReplaceTexture(currentVehicle, 'blank', 'duiTxd', 'duiTex')
end

function loadTxdd()
    local txd = CreateRuntimeTxd('duiTxd')
    duiObj = CreateDui('https://google.com', 376, 212)
    _G.duiObj = duiObj
    local dui = GetDuiHandle(duiObj)
    local tx = CreateRuntimeTextureFromDuiHandle(txd, 'duiTex', dui)
    AddReplaceTexture(currentVehicle, 'blank', 'duiTxd', 'duiTex')
end

function unloadTxd()
    RemoveReplaceTexture(currentVehicle, 'blank', 'duiTxd', 'duiTex')
	DestroyDui(duiObj)
	duiObj = nil
end

function terminateLivonEffect()
	unloadTxd()
	loaded = false
	currentVehicle = nil
	RemoveRuntimeTexture('duiTxd', 'duiTex')
	DestroyRuntimeTxd('duiTxd')
end

RegisterCommand('livon', function(source, args)
    local vehicleName = args[1]
    if not loaded then
        local playerCar = GetVehiclePedIsIn(GetPlayerPed(-1))
        if playerCar ~= 0 then
            if GetEntityModel(playerCar) == GetHashKey(vehicleName) then
                currentVehicle = vehicleName
                loadTxd()
                loaded = true
                TriggerEvent('chat:addMessage', {args = {'[Livon]', 'Livon effect has been enabled.'}})
            else
                TriggerEvent('chat:addMessage', {args = {'[Livon]', 'You are not in a ' .. vehicleName .. ' vehicle.'}})
            end
        else
            TriggerEvent('chat:addMessage', {args = {'[Livon]', 'You are not in a vehicle.'}})
        end
    end
end)

RegisterCommand('livonn', function(source, args)
    local vehicleName = args[1]
    if not loaded then
        local playerCar = GetVehiclePedIsIn(GetPlayerPed(-1))
        if playerCar ~= 0 then
            if GetEntityModel(playerCar) == GetHashKey(vehicleName) then
                currentVehicle = vehicleName
                loadTxdd()
                loaded = true
                TriggerEvent('chat:addMessage', {args = {'[Livon]', 'Livon effect has been enabled.'}})
            else
                TriggerEvent('chat:addMessage', {args = {'[Livon]', 'You are not in a ' .. vehicleName .. ' vehicle.'}})
            end
        else
            TriggerEvent('chat:addMessage', {args = {'[Livon]', 'You are not in a vehicle.'}})
        end
    end
end)

RegisterCommand('livoff', function()
    if loaded then
		terminateLivonEffect()
        unloadTxd()
        loaded = false
        currentVehicle = nil
        TriggerEvent('chat:addMessage', {args = {'[Livon]', 'Livon effect has been disabled.'}})
    else
        TriggerEvent('chat:addMessage', {args = {'[Livon]', 'Livon effect is not enabled.'}})
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- wait for 1 second before checking if Livon effect is enabled
        if loaded then
            local playerCar = GetVehiclePedIsIn(GetPlayerPed(-1))
            if playerCar ~= 0 and currentVehicle == 'nero2' then
                if GetEntityModel(playerCar) ~= GetHashKey(currentVehicle) then
					terminateLivonEffect()
                    unloadTxd()
                    loaded = false
                    currentVehicle = nil
                    TriggerEvent('chat:addMessage', {args = {'[Livon]', 'Livon effect has been disabled because you are not in a ' .. currentVehicle .. ' vehicle.'}})
                end
            end
        end
    end
end)