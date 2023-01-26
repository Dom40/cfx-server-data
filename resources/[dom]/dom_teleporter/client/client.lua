RegisterCommand('goto', function(_, args)
    local targetId = args[1]

    if not targetId then
        TriggerEvent('chat:addMessage', {
            args = { 'Please provide a target ID', },
        })

        return
    end

    TriggerServerEvent('dom_teleporter:goto', targetId)
end)

RegisterCommand('summon', function(_, args)
    local targetId = args[1]

    if not targetId then
        TriggerEvent('chat:addMessage', {
            args = { 'Please provide a target ID.', },
        })
    
        return
    end

    TriggerServerEvent('dom_teleporter:summon', targetId)
end)