RegisterCommand('ped', function(rawCommand)
    exports.spawnmanager:spawnPlayer({
            model = rawCommand
    })
end)