ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('buybmx')
AddEventHandler('buybmx', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceBmx
    xPlayer.removeMoney(price)
end)

RegisterNetEvent('buycruiser')
AddEventHandler('buycruiser', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceCruiser
    xPlayer.removeMoney(price)
end)

RegisterNetEvent('buyfixter')
AddEventHandler('buyfixter', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceFixter
    xPlayer.removeMoney(price)
end)

RegisterNetEvent('buyscorcher')
AddEventHandler('buyscorcher', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceScorcher
    xPlayer.removeMoney(price)
end)

RegisterNetEvent('buytribike')
AddEventHandler('buytribike', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceTribike
    xPlayer.removeMoney(price)
end)