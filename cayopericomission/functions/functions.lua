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

function fadeshortlong()
    DoScreenFadeOut(200)
    Citizen.Wait(6000)
    DoScreenFadeIn(200)
end
