RegisterCommand("weapon", function(source, args, rawCommand)
	local playerPed = PlayerPedId()
	local weaponName = GetHashKey(args[1])
	local ammoCount = 9999

    if not IsModelInCdimage(weaponName) then
        TriggerEvent('chat:addMessage', {
            args = { 'Uh oh, ' .. weaponName .. ' is not a weapon.', }
        })

        return    
    end

    RequestModel(weaponName)

    while not HasModelLoaded(weaponName) do 
        Wait(10)
    end

    SetPlayerModel(PlayerId(), weaponName)

	GiveWeaponToPed(playerPed, weaponName, ammoCount, false)

    SetModelAsNoLongerNeeded(weaponName)
end)