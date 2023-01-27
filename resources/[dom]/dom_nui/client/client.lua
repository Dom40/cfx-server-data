CreateThread(function()
while true do
    Wait(10)

    local playerId = PlayerPedId()
    local playerCoords = GetEntityCoords(playerId)
    local playerHeading = GetEntityHeading(playerId)

    SendNUIMessage({
        type = 'position',
        x = playerCoords.x,
        y = playerCoords.y,
        z = playerCoords.z,
        heading = playerHeading,
    })
    end
end)

CreateThread(function()
    while true do
        Wait(100000)

        SendNUIMessage({
            type = 'ping'
        })
    end
end)

-- NUI Callbacks

RegisterNUICallback('releaseFocus', function(data, cb)
    cb({})

    SetNuiFocus(false, false)
end)

RegisterNUICallback('teleport', function(data, cb)
    cb({})

    SetEntityCoords(PlayerPedId(), tonumber(data.x), tonumber(data.y), tonumber(data.z))

    SetNuiFocus(false, false)
end)

-- Key Bindings

RegisterCommand('+openteleporter', function()
    SetNuiFocus(true, true)
end)

RegisterKeyMapping('+openteleporter', 'Open Teleporter', 'keyboard', 'F5')