ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local canPay = false

-- Lifeinvader Advertisement
RegisterServerEvent('esx_ads:globalad')
AddEventHandler('esx_ads:globalad', function(args)
    local xPlayers = ESX.GetPlayers()
    local xPlayer = ESX.GetPlayerFromId(_source)
    local _source = source

        PayForAdvertisement(source, amount)
        Wait(Config.Delay)

        if canPay then

        for i=1, #xPlayers, 1 do
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Lifeinvader', _U('ad_name'), table.concat(args, " "), 'CHAR_LIFEINVADER', 1)
        end    
    end
end)

-- DarkWeb Advertisement
--[[RegisterServerEvent('esx_ads:darkad')
AddEventHandler('esx_ads:darkad', function(args)
    local xPlayers = ESX.GetPlayers()
    local xPlayer = ESX.GetPlayerFromId(_source)
    local _source = source

        PayForDarkWebAdvertisement(source, amount)
        Wait(Config.Delay)

        if canPay then

        for i=1, #xPlayers, 1 do
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Dark Web', _U('ad_name'), table.concat(args, " "), 'CHAR_LESTER_DEATHWISH', 1)
        end    
    end
end)]]--

-- Concess Moto Advertisement
RegisterServerEvent('esx_ads:motorcyclead')
AddEventHandler('esx_ads:motorcyclead', function(args)
    local xPlayers = ESX.GetPlayers()
    local xPlayer = ESX.GetPlayerFromId(_source)
    local _source = source

        PayForJobAdvertisement(source, amount)
        Wait(Config.Delay)

        if canPay then

        for i=1, #xPlayers, 1 do
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Concessionaire Moto', _U('ad_name'), table.concat(args, " "), 'CHAR_PROPERTY_CAR_MOD_SHOP', 1)
        end    
    end
end)

-- Cardealer Advertisement
RegisterServerEvent('esx_ads:cardealerad')
AddEventHandler('esx_ads:cardealerad', function(args)
    local xPlayers = ESX.GetPlayers()
    local xPlayer = ESX.GetPlayerFromId(_source)
    local _source = source

        PayForJobAdvertisement(source, amount)
        Wait(Config.Delay)

        if canPay then

        for i=1, #xPlayers, 1 do
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Concessionaire Voiture', _U('ad_name'), table.concat(args, " "), 'CHAR_CARSITE', 1)
        end    
    end
end)

-- Mechanic Advertisement
RegisterServerEvent('esx_ads:mechanicad')
AddEventHandler('esx_ads:mechanicad', function(args)
    local xPlayers = ESX.GetPlayers()
    local xPlayer = ESX.GetPlayerFromId(_source)
    local _source = source

        PayForJobAdvertisement(source, amount)
        Wait(Config.Delay)

        if canPay then

        for i=1, #xPlayers, 1 do
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Los Santos Customs', _U('ad_name'), table.concat(args, " "), 'CHAR_LS_CUSTOMS', 1)
        end    
    end
end)

-- Burgershot Advertisement
RegisterServerEvent('esx_ads:burgershotad')
AddEventHandler('esx_ads:burgershotad', function(args)
    local xPlayers = ESX.GetPlayers()
    local xPlayer = ESX.GetPlayerFromId(_source)
    local _source = source

        PayForJobAdvertisement(source, amount)
        Wait(Config.Delay)

        if canPay then

        for i=1, #xPlayers, 1 do
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'BurgerShot', _U('ad_name'), table.concat(args, " "), 'CHAR_PROPERTY_BAR_HI_MEN', 1)
        end    
    end
end)

-- Real Estate Advertisement
RegisterServerEvent('esx_ads:realestatead')
AddEventHandler('esx_ads:realestatead', function(args)
    local xPlayers = ESX.GetPlayers()
    local xPlayer = ESX.GetPlayerFromId(_source)
    local _source = source

        PayForJobAdvertisement(source, amount)
        Wait(Config.Delay)

        if canPay then

        for i=1, #xPlayers, 1 do
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Real Estate', _U('ad_name'), table.concat(args, " "), 'CHAR_PROPERTY_BAR_AIRPORT', 1)
        end    
    end
end)




function PayForAdvertisement (source, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local getbankmoney = xPlayer.getBank()
    local getmoney = xPlayer.getMoney()
    local price = Config.AdPrice

    if Config.Usebank and getbankmoney >= price then
        xPlayer.removeAccountMoney('bank', price)
        TriggerClientEvent('esx:showNotification', _source, _U('you_paid', price))
        canPay = true
    elseif getmoney >= price then
        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', _source, _U('you_paid', price))
        canPay = true
    else
        canPay = false
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
    end
end

function PayForJobAdvertisement (source, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local getbankmoney = xPlayer.getBank()
    local getmoney = xPlayer.getMoney()
    local price = Config.JobAdPrice

    if Config.Usebank and getbankmoney >= price then
        xPlayer.removeAccountMoney('bank', price)
        TriggerClientEvent('esx:showNotification', _source, _U('you_paid', price))
        canPay = true
    elseif getmoney >= price then
        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', _source, _U('you_paid', price))
        canPay = true
    else
        canPay = false
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
    end
end

function PayForDarkWebAdvertisement (source, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local getbankmoney = xPlayer.getBank()
    local getblackmoney = xPlayer.getAccount('black_money').money
    local price = Config.DarkWebAdPrice

    if Config.UseBlack and getblackmoney >= price then
        xPlayer.removeAccountMoney('black_money', price)
        TriggerClientEvent('esx:showNotification', _source, _U('you_paid_black', price))
        canPay = true
    elseif getbankmoney >= price then
        xPlayer.removeAccountMoney('bank', price)
        TriggerClientEvent('esx:showNotification', _source, _U('you_paid', price))
        canPay = true
    else
        canPay = false
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
    end
end