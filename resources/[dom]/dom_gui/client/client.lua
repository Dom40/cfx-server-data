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