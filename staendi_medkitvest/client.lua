--site.staendi.dev
print('^1>>>>>--------------------<<<<<')
print('')
print('^4' .. GetCurrentResourceName() .. ' ^2loaded')
print('')
print('^1>>>>>--------------------<<<<<^0')

local cooldownActive = false

local useEnglish = true

if Config.locale == 'en' then
    useEnglish = true
else
    useEnglish = false
end


function playAnimation(lib, anim)
    ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, 5000, 0, 0.0, false, false, false)
		RemoveAnimDict(lib)
	end)
end


RegisterNetEvent('staendi:equipvest')
AddEventHandler('staendi:equipvest', function ()

    local playerPed = PlayerPedId()

    playAnimation('anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01')

    AddArmourToPed(playerPed, 100)
    SetPedArmour(playerPed, 100)

    if useEnglish then
        TriggerEvent('esx:showNotification', Config.usedVestMessageEN)
    else
        TriggerEvent('esx:showNotification', Config.usedVestMessageDE)
    end

end)

RegisterNetEvent('staendi:equipmedikit')
AddEventHandler('staendi:equipmedikit', function ()

    local playerPed = PlayerPedId()

    playAnimation('anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01')

    SetEntityHealth(playerPed, 200)

    if useEnglish then
        TriggerEvent('esx:showNotification', Config.usedMedikitMessageEN)
    else
        TriggerEvent('esx:showNotification', Config.usedMedikitMessageDE)
    end

end)

RegisterCommand('sendtoequipvest', function ()

    if not cooldownActive then
        TriggerServerEvent('staendi:commandexecutevest', source)
        cooldownActive = true
        Wait(Config.cooldown * 1000)
        cooldownActive = false
    else
        if useEnglish then
            TriggerEvent('esx:showNotification', Config.cooldownActiveEN)
        else
            TriggerEvent('esx:showNotification', Config.cooldownActiveDE)
        end
    end
    
end)

RegisterCommand('sendtoequipmedikit', function ()

    if not cooldownActive then
        TriggerServerEvent('staendi:commandexecutemedikit', source)
        cooldownActive = true
        Wait(Config.cooldown * 1000)
        cooldownActive = false
    else
        if useEnglish then
            TriggerEvent('esx:showNotification', Config.cooldownActiveEN)
        else
            TriggerEvent('esx:showNotification', Config.cooldownActiveDE)
        end
    end

end)

if useEnglish then
    RegisterKeyMapping('sendtoequipvest', Config.keybindDescriptionVestEN, 'keyboard', Config.defaultKeybindingVest)

    RegisterKeyMapping('sendtoequipmedikit', Config.keybindDescriptionMedikitEN, 'keyboard', Config.defaultKeybindingMedkit)
else
    RegisterKeyMapping('sendtoequipvest', Config.keybindDescriptionVestDE, 'keyboard', Config.defaultKeybindingVest)

    RegisterKeyMapping('sendtoequipmedikit', Config.keybindDescriptionMedikitDE, 'keyboard', Config.defaultKeybindingMedkit)
end
