-- Text Input

function getTextInput(title, inputLength)
    AddTextEntry('DOM_INPUT', title)
    DisplayOnscreenKeyboard(1, 'DOM_INPUT', '', '', '', '', '', inputLength)

    while UpdateOnscreenKeyboard() == 0 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()

        Citizen.Wait(0)

        return result
    else
        Citizen.Wait(0)

        return nil
    end
end

RegisterCommand('testInput', function(_, _, rawCommand)
    local result = getTextInput(rawCommand, 33)
    
    showNotification(result, 180, false, false)
end)

-- Busy Spinner

function showBusySpinner(message)
    BeginTextCommandBusyspinnerOn('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandBusyspinnerOn(4)
end

function hideBusySpinner()
    BusyspinnerOff()
end

RegisterCommand('testSpinner', function(_, _, rawCommand)
    if rawCommand == 'testSpinner' then
        hideBusySpinner()
    else 
        showBusySpinner(rawCommand)
    end
end)

RegisterCommand('hideSpinner', function(_, _, rawCommand)
    hideBusySpinner()
end)

-- Subitles
function showSubtitle(message, duration)
    BeginTextCommandPrint('STRING')
    AddTextComponentString(message)
    EndTextCommandPrint(duration, true)
end

RegisterCommand('testSubtitle', function(_, _, rawCommand)
    showSubtitle(
        rawCommand,
        10000
    )
end)

-- Markers

    RegisterCommand('testMarker', function()
        CreateThread(function()
        local start = GetGameTimer()
    
    while GetGameTimer() < (start + 10000) do
        Wait(0)
        local playerCoordinates = GetEntityCoords(PlayerPedId())

        DrawMarker(
            36 , 
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
	        100 , 
	        0 , 
	        220 , 
	        180 , 
	        true , 
	        true , 
	        2)
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
        -1)
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