-- Markers

    RegisterCommand('testMarker', function()
        CreateThread(function()
        local start = GetGameTimer()
    
    while GetGameTimer() < (start + 10000) do)
        Wait(0)
        local playerCoordinates = GetEntityCoords(PlayerPedId())

        DrawMarker(
            6 , 
	        playerCoordinates.x , 
	        playerCoordinates.y , 
	        playerCoordinates.z , 
	        0.0 , 
	        0.0 , 
	        0.0 , 
	        0.0 , 
	        0.0 , 
	        0.0 , 
	        1.0 , 
	        1.0 , 
	        1.0 , 
	        0 , 
	        0 , 
	        220 , 
	        180 , 
	        true , 
	        true , 
	        2
        end      
    end)
end)

-- Alerts

function showAlert(message, beep, duration)
    AddTextEntry('DOM_ALERT', message)

    BeginTextCommandDisplayHelp('DOM_HELP')
    EndTextCommandDisplayHelp(0, false, beep, duration)
end

RegisterCommand('testAlert', function(_, _, rawCommand)
    showAlert(
        rawCommand,
        true,
        -1
    )
end)

-- Advanced Notifications
function showAdvancedNotification(message, sender, Subject, textureDict, iconType, saveToBrief, color)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    ThefeedNextPostBackgroundColor(color)
    EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
    EndTextCommandThefeedPostTicker(false, saveToBrief)
end

RegisterCommand('testAdvancedNotification', function(_, _, rawCommand)
    showAdvancedNotification(
        rawCommand,
        'This is Sender',
        'This is Subject',
        'CHAR_TAXI',
        2,
        true,
        150
    )
end)

-- Notifications

function showNotification(message, color, flash, saveToBrief)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    ThefeedNextPostBackgroundColor(color)
    EndTextCommandThefeedPostTicker(flash, saveToBrief)
end

RegisterCommand('testNotification', function(_, _, rawCommand)
    showNotification(
        rawCommand,
        150,
        true,
        true
    )
end)