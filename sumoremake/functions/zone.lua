function startZone()
    disableKeys()
    setSpawn()
    print("done")
    local ped = PlayerPedId()
    local blip = AddBlipForRadius(200.89, 7396.32, 14.08, 110.0) -- need to have .0
    SetBlipColour(blip, 3)
    SetBlipAlpha(blip, 128)
    local inArea = false
    local coords
    local dist
    while not inArea do
        Wait(0)
        coords = GetEntityCoords(ped)
        dist = #(coords - vector3(187.89, 7396.52, -188.08))
        if dist < 200.6 then
            inArea = true
            print("reached explosion height")
            NetworkExplodeVehicle(GetVehiclePedIsIn(PlayerPedId(), false), true, true)
        end
    end
end

function disableKeys()
    DisableControlAction(2, 75, true)
end

RegisterCommand("powerplayform", function()
    InitPowerPlay()
end)

RegisterCommand("poweractivate", function()
    ActivateIcon(1, "Title text", "Strap text", true, 0)
end)

RegisterCommand("poweractivate2", function()
    ActivateIcon(2, "doped", "Strapline 2", true, 1)
end)

RegisterCommand("poweractivate3", function()
    ActivateIcon(3, "DOPED", "Strapline 2", true, 1)
end)


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
