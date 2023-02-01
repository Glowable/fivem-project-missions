function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end

function showmessagelol(msg, time)
	ShowMpMessageLarge(msg, time)
end



--https://runtime.fivem.net/doc/natives/#_0xBF0FD6E56C964FCB
--Ped ped, Hash weaponHash, int ammoCount, BOOL isHidden, BOOL equipNow
function giveWeapon(weaponHash)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weaponHash), 999, false, false --[[equips when gotten]])
end

function Initialize(scaleform, msg)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
	PushScaleformMovieFunctionParameterString("~y~Announce to the Players!!")
    PushScaleformMovieFunctionParameterString(msg)
    PopScaleformMovieFunctionVoid()
    return scaleform
end

function announce(msg)
	i = 0
	repeat
		Wait(0)
		i = i + 1
		scaleform = Initialize("mp_big_message_freemode", msg)
		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
	until i == 400
	SetScaleformMovieAsNoLongerNeeded(scaleform)
end

RegisterNetEvent("glow:fle1")
AddEventHandler("glow:fle1", function()
    local generalPed
    local generalLoaded = false
    local pos = GetEntityCoords(generalPed)
    local PlayingAnim = false
    local general_peds = {
        {x=-2977.16, y=487.44, z=15.29, a=254.84},
    }
    while true do
      Citizen.Wait(0)
      
      if (not generalLoaded) then
        
        for k,v in ipairs(general_peds) do
          RequestModel(GetHashKey("s_m_y_swat_01"))
          while not HasModelLoaded(GetHashKey("s_m_y_swat_01")) do
            Wait(1)
          end
          
          generalPed = CreatePed(2, "s_m_y_swat_01", v.x, v.y, v.z, v.a, false, false)
          GiveWeaponToPed(generalPed, GetHashKey("WEAPON_PISTOL"), 1, false, false)
          SetPedAsEnemy(generalPed, true)
          

          local blip = AddBlipForEntity(generalPed)
          SetBlipSprite(blip, 270)
          SetBlipColour(blip, 23)
          
          while not IsEntityDead(generalPed) do
            Citizen.Wait(2)
          end

          if IsEntityDead(generalPed) then
            RemoveBlip(blip)
          end
          
        end
        generalLoaded = true
          
      end
      
    end
  end)

  RegisterNetEvent("glow:fle2")
  AddEventHandler("glow:fle2", function()
      local generalPed
      local generalLoaded = false
      local pos = GetEntityCoords(generalPed)
      local PlayingAnim = false
      local general_peds = {
          {x=-2977.96, y=483.19, z=15.26, a=270.0},
      }
      while true do
        Citizen.Wait(0)
        
        if (not generalLoaded) then
          
          for k,v in ipairs(general_peds) do
            RequestModel(GetHashKey("s_m_y_swat_01"))
            while not HasModelLoaded(GetHashKey("s_m_y_swat_01")) do
              Wait(1)
            end
            
            generalPed = CreatePed(2, "s_m_y_swat_01", v.x, v.y, v.z, v.a, false, false)
            GiveWeaponToPed(generalPed, GetHashKey("WEAPON_PISTOL"), 1, false, false)
            SetPedAsEnemy(generalPed, true)
            
  
            local blip = AddBlipForEntity(generalPed)
            SetBlipSprite(blip, 270)
            SetBlipColour(blip, 23)
            
            while not IsEntityDead(generalPed) do
              Citizen.Wait(2)
            end
  
            if IsEntityDead(generalPed) then
              RemoveBlip(blip)
            end
            
          end
          generalLoaded = true
            
        end
        
      end
    end)
