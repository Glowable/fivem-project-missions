RegisterCommand("testingbigmessage", function()
    TriggerEvent('cS.banner', "~o~SUMO X POWERPLAY~s~", "Map 1", 5, true)
end)

RegisterCommand("testingbigmessagee", function()
    TriggerEvent("cS.GameFeed", "_title", "_subtitle", "_textblock", "v_73_fib01_txd", "xj_v_fibscreen", false, 7, true)
end)


RegisterNetEvent("sumo:scaleformstart")
AddEventHandler("sumo:scaleformstart", function()
    local scaleforms = {
      bg = Scaleform.Request("MP_CELEBRATION_BG"),
      fg = Scaleform.Request("MP_CELEBRATION_FG"),
      main = Scaleform.Request("MP_CELEBRATION"),
    }
  
    function callAll(...)
      for index, sf in pairs(scaleforms) do
        sf:CallFunction(...)
      end
    end
  
    callAll("CREATE_STAT_WALL", "intro", "HUD_COLOUR_BLACK", -1)
    callAll("ADD_INTRO_TO_WALL", "intro", "type_mission", "Map 1", "", "", "", "", "", false, "HUD_COLOUR_REDLIGHT")
    AddTextEntry("type_mission", "SUMO X POWERPLAY")
    callAll("ADD_BACKGROUND_TO_WALL", "intro", 70, 18)
    callAll("SHOW_STAT_WALL", "intro")
    local startTime = GetGameTimer()
    local endTime = GetGameTimer() + 5000
    local running = true
  
    BeginScaleformMovieMethod(scaleforms.main.handle, "GET_TOTAL_WALL_DURATION")
    local retHandle = EndScaleformMovieMethodReturnValue()
  
    if retHandle ~= 0 then 
      while not IsScaleformMovieMethodReturnValueReady(retHandle) do Wait(0) end
      local time = GetScaleformMovieFunctionReturnInt(retHandle)
      endTime = startTime + time
    end
  
    while running do
      Wait(0)
      scaleforms.bg:Draw2D()
      scaleforms.fg:Draw2D()
      scaleforms.main:Draw2D()
  
      if GetGameTimer() > endTime then
        running = false
      end
    end
  
    scaleforms.bg:Dispose()
    scaleforms.fg:Dispose()
    scaleforms.main:Dispose()
  end)

  Scaleform = {}

  local scaleform = {}
  scaleform.__index = scaleform
  
  function Scaleform.Request(Name)
      local ScaleformHandle = RequestScaleformMovie(Name)
      local StartTime = GetGameTimer()
      while not HasScaleformMovieLoaded(ScaleformHandle) do Citizen.Wait(0) 
          if GetGameTimer() - StartTime >= 5000 then
              print("loading failed")
              return false
          end 
      end
  
      local data = {name = Name, handle = ScaleformHandle, isHud = false}
      return setmetatable(data, scaleform)
  end
  
  function Scaleform.RequestHud(id)
      RequestScaleformScriptHudMovie(id)
      local StartTime = GetGameTimer()
      while not HasScaleformScriptHudMovieLoaded(id) do 
          Citizen.Wait(0) 
          if GetGameTimer() - StartTime >= 5000 then
              print("loading failed")
              return false
          end
      end
  
      local data = {Name = id, handle = id, isHud = true}
      return setmetatable(data, scaleform)
  end
  
  function scaleform:CallFunction(theFunction, ...)
      if self.isHud then
          BeginScaleformMovieMethodHudComponent(self.handle, theFunction)
      else
          BeginScaleformMovieMethod(self.handle, theFunction)
      end
  
      local arg = {...}
      if arg ~= nil then
          for i=1,#arg do
              local sType = type(arg[i])
              if sType == "boolean" then
                  PushScaleformMovieMethodParameterBool(arg[i])
              elseif sType == "number" then
                  if math.type(arg[i]) == "integer" then
                      PushScaleformMovieMethodParameterInt(arg[i])
                  else
                      PushScaleformMovieMethodParameterFloat(arg[i])
                  end
              elseif sType == "string" then
                  PushScaleformMovieMethodParameterString(arg[i])
              else
                  PushScaleformMovieMethodParameterInt()
              end
          end
      end
      return EndScaleformMovieMethod()
  end
  
  function scaleform:Draw2D()
      DrawScaleformMovieFullscreen(self.handle, 255, 255, 255, 255)
  end
  
  function scaleform:Draw2DNormal(x, y, width, height)
      DrawScaleformMovie(self.handle, x, y, width, height, 255, 255, 255, 255)
  end
  
  function scaleform:Draw2DScreenSpace(locx, locy, sizex, sizey)
      local Width, Height = GetScreenResolution()
      local x = locy / Width
      local y = locx / Height
      local width = sizex / Width
      local height = sizey / Height
      DrawScaleformMovie(self.handle, x + (width / 2.0), y + (height / 2.0), width, height, 255, 255, 255, 255)
  end
  
  function scaleform:Render3D(x, y, z, rx, ry, rz, scalex, scaley, scalez)
      DrawScaleformMovie_3dNonAdditive(self.handle, x, y, z, rx, ry, rz, 2.0, 2.0, 1.0, scalex, scaley, scalez, 2)
  end
  
  function scaleform:Render3DAdditive(x, y, z, rx, ry, rz, scalex, scaley, scalez)
      DrawScaleformMovie_3d(self.handle, x, y, z, rx, ry, rz, 2.0, 2.0, 1.0, scalex, scaley, scalez, 2)
  end
  
  function scaleform:Dispose()
      if self.isHud then
          RemoveScaleformScriptHudMovie(self.handle)
      else
          SetScaleformMovieAsNoLongerNeeded(self.handle)
      end
      self = nil
  end
  
  function scaleform:DisposeAndWait()
      if self.isHud then
          RemoveScaleformScriptHudMovie(self.handle)
  
          while HasScaleformScriptHudMovieLoaded(self.handle) do
              Wait(0)
          end
      else
          SetScaleformMovieAsNoLongerNeeded(self.handle)
  
          while HasScaleformMovieLoaded(self.handle) do
              Wait(0)
          end
      end
  
      self = nil
  end
  
  function scaleform:IsValid()
      return self and true or false
  end


  local powerPlay = RequestScaleformMovie('POWER_PLAY')

  -- Define the initial data for the Scaleform
  local t1_ic1 = 60 -- example timer values
  local t1_ic2 = 45
  local t1_ic3 = 30
  local t1_ic4 = 15
  local t1_ic5 = 10
  local t1_ic6 = 5
  local t2_ic1 = 60
  local t2_ic2 = 45
  local t2_ic3 = 30
  local t2_ic4 = 15
  local t2_ic5 = 10
  local t2_ic6 = 5
  
  function InitPowerPlay()
      BeginScaleformMovieMethod(powerPlay, 'POWER_PLAY')
      EndScaleformMovieMethod()
  
      BeginScaleformMovieMethod(powerPlay, 'initScreenLayout')
      EndScaleformMovieMethod()
  
      BeginScaleformMovieMethod(powerPlay, 'SETUP_TEAM_COLOURS')
      PushScaleformMovieFunctionParameterInt(0)
      PushScaleformMovieFunctionParameterInt(1)
      EndScaleformMovieMethod()
  
      EndScaleformMovieMethod()
  end
  
  -- Activate an icon with a timer
  function ActivateIcon(iconID, titleText, strapText, greyOtherIcons, teamColourID)
      BeginScaleformMovieMethod(powerPlay, 'ACTIVATE_ICON')
      PushScaleformMovieFunctionParameterInt(iconID)
      PushScaleformMovieFunctionParameterString(titleText)
      PushScaleformMovieFunctionParameterString(strapText)
      PushScaleformMovieFunctionParameterBool(greyOtherIcons)
      PushScaleformMovieFunctionParameterInt(teamColourID)
      EndScaleformMovieMethod()
  
      Citizen.Wait(500)
  
      -- Set icon color to orange
      BeginScaleformMovieMethod(powerPlay, "SET_ICON_COLOUR")
      PushScaleformMovieFunctionParameterInt(iconID)
      PushScaleformMovieFunctionParameterInt(2) -- 2 represents the orange color in Power Play scaleform
      EndScaleformMovieMethod()
  end
  
  -- Display the Scaleform on the screen
  Citizen.CreateThread(function()
      while true do
          Citizen.Wait(0)
          DrawScaleformMovieFullscreen(powerPlay, 255, 255, 255, 255, 0)
      end
  end)