RegisterNetEvent('dom_teleporter:goto', function(targetId)
    local playerId = source
    local player Ped = GetPlayerPed(playerId)
    local targetPed = GetPlayerPed(targetId)

    if targetPed <= 0 then
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'Sorry, ' .. targetId .. ' doesn\'t seem to exist.', },
        })

        return
    end

    local targetPos = GetEntityCoords(targetPed)

    SetEntityCoords(playerPed, targetPos)
end)

RegisterNetEvent('dom_teleporter:summon', function(targetId)
    local playerId = source
    local playerPed = GetPlayerPed(playerId)
    local playerPos = GetEntityCoords(playerPed)
    local targetPed = GetPlayerPed(targetId)

if targetPed <= 0 then
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'Sorry, ' .. targetId .. ' doesn\'t seem to exist.', },
        })

        return
    end

    SetEntityCoords(targetPed, playerPos)
end)