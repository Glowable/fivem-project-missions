local loaded = false

function loadTxd()
	local txd = CreateRuntimeTxd('duiTxd')
	local duiObj = CreateDui('https://google.com', 4000, 4000)
	_G.duiObj = duiObj
	local dui = GetDuiHandle(duiObj)
	local tx = CreateRuntimeTextureFromDuiHandle(txd, 'duiTex', dui)
	AddReplaceTexture('nero2', 'blank', 'duiTxd', 'duiTex')
	
end

Citizen.CreateThread(function()
	while loaded == false do
		Wait(0)
		local playerCar = GetVehiclePedIsIn(GetPlayerPed(-1))
		if playerCar ~= 0 then
			if GetEntityModel(playerCar) == GetHashKey('nero2') then
				loadTxd()
				loaded = true
			end
		end
		if not loaded then
			local veh = nil
			for veh in EnumerateVehicles() do
				if GetEntityModel(playerCar) == GetHashKey('nero2') then
					loadTxd()
					loaded = true
					break
				end
			end
		end
	end
end)