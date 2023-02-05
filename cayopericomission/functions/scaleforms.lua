RegisterCommand("startraceintro", function()
    startRaceIntro()
end)

function startRaceIntro()
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
    callAll("ADD_INTRO_TO_WALL", "intro", "type_mission", "UNKNOWN NAME IDK", "", "", "", "", "", false, "HUD_COLOUR_GREYLIGHT")
    AddTextEntry("type_mission", "Mission")
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
      HideHudAndRadarThisFrame()
  
      if GetGameTimer() > endTime then
        running = false
      end
    end
  
    scaleforms.bg:Dispose()
    scaleforms.fg:Dispose()
    scaleforms.main:Dispose()
  end

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

seconds = 5

function DrawTeamlives()

    AddTextEntry("time", "TIME REMAINING")

    CreateThread(function() 
        while true do 
            Wait(0)

            if seconds < 1 then 
                SetTextColour(170, 40, 40, 255)
            end

            SetTextScale(0.28, 0.28)
            BeginTextCommandDisplayText("time")
            EndTextCommandDisplayText(0.853, 0.954)
            
            if seconds < 1 then 
                SetTextColour(170, 40, 40, 255)
                DrawSprite("seconds", "all_red_bg", 0.8455, 0.962, 0.29, 0.035, 0.0, 79, 12, 12, 300)
            else 
                DrawSprite("seconds", "all_black_bg", 0.915, 0.962, 0.15, 0.035, 0.0, 100, 100, 100, 150)
            end

            SetTextScale(0.47, 0.47)
            BeginTextCommandDisplayText("NUMBER")
            AddTextComponentInteger(seconds)
            EndTextCommandDisplayText(0.977, 0.945)
        end
    end)

    gametime = GetGameTimer()
    printtime = seconds
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if printtime > 0 then
                diftime = GetGameTimer() - gametime
                printtime = math.floor(seconds - (diftime/1000))
                print("testlol")
            else
                Citizen.Wait(1000)
            end
        end
    end)    
end


