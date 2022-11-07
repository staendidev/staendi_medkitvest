--site.staendi.dev
print('^1>>>>>--------------------<<<<<')
print('')
print('^4' .. GetCurrentResourceName() .. ' ^2loaded')
print('')
print('^1>>>>>--------------------<<<<<^0')

local useEnglish = true

if Config.locale == 'en' then
    useEnglish = true
else
    useEnglish = false
end

RegisterNetEvent('staendi:commandexecutevest')
AddEventHandler('staendi:commandexecutevest', function ()

    local xPlayer = ESX.GetPlayerFromId(source)
    
    if Config.itemRequiredVest then
        if xPlayer.hasItem(Config.vestItem) then
            xPlayer.removeInventoryItem(Config.vestItem, 1)
            TriggerClientEvent('staendi:equipvest', source)
        else
            if useEnglish then
                xPlayer.showNotification(Config.noVestMessageEN)
            else
                xPlayer.showNotification(Config.noVestMessageDE)
            end
            
        end
    else
        TriggerClientEvent('staendi:equipvest', source)
    end
    
end)

RegisterNetEvent('staendi:commandexecutemedikit')
AddEventHandler('staendi:commandexecutemedikit', function ()

    local xPlayer = ESX.GetPlayerFromId(source)

    if Config.itemRequiredMedikit then
        if xPlayer.hasItem(Config.medkitItem) then
            xPlayer.removeInventoryItem(Config.medkitItem, 1)
            TriggerClientEvent('staendi:equipmedikit', source)
        else
            if useEnglish then
                xPlayer.showNotification(Config.noMedikitMessageEN)
            else
                xPlayer.showNotification(Config.noMedikitMessageDE)
            end
        end
    else
        TriggerClientEvent('staendi:equipmedikit', source)
    end
    
end)

ESX.RegisterUsableItem(Config.vestItem, function(playerId)
   local xPlayer = ESX.GetPlayerFromId(playerId)
   xPlayer.removeInventoryItem(Config.vestItem, 1)
   TriggerClientEvent('staendi:equipvest', playerId)
end)

ESX.RegisterUsableItem(Config.medkitItem, function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeInventoryItem(Config.medkitItem, 1)
    TriggerClientEvent('staendi:equipmedikit', playerId)
 end)

