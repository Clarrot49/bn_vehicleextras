RegisterCommand("ex", function(source, args, rawCommand)
    local player = PlayerPedId()
    
    if not IsPedInAnyVehicle(player, true) then
        lib.notify({
            title = 'Error:',
            description = 'You must be in a vehicle to change extras.',
            type = 'error'
        })
        return
    end

    if not args[1] then
        lib.notify({
            title = 'Error:',
            description = 'You must specify an extra to change.',
            type = 'error'
        })
        return
    end

    local vehicle = GetVehiclePedIsIn(player, false)
    local extra = tonumber(args[1])

    if not DoesExtraExist(vehicle, extra) then
        lib.notify({
            title = 'Error:',
            description = 'This extra does not exist.',
            type = 'error'
        })
        return
    end
    
    local isExtraOn = IsVehicleExtraTurnedOn(vehicle, extra)
  
        if isExtraOn then
            SetVehicleExtra(vehicle, extra, 1)
        else
            SetVehicleExtra(vehicle, extra, 0)
        end
end, false)


RegisterCommand("livery", function(source, args, rawCommand)
    local player = PlayerPedId()

    if not IsPedInAnyVehicle(player, true) then
        lib.notify({
            title = 'Error:',
            description = 'You must be in a vehicle to change liveries.',
            type = 'error'
        })
        return
    end

    if not args[1] then
        lib.notify({
            title = 'Error:',
            description = 'You must specify a livery number',
            type = 'error'
        })
        return
    end

    local liveryNumber = tonumber(args[1])
    local vehicle = GetVehiclePedIsIn(player, true)

    if liveryNumber and liveryNumber >= 0 then
        if liveryNumber < GetVehicleLiveryCount(vehicle) then
            SetVehicleLivery(vehicle, liveryNumber)
        else
            lib.notify({
                title = 'Error:',
                description = 'Invalid livery number.',
                type = 'error'
            })
        end
    end
end, false)