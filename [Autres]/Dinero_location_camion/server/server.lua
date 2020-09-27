ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('buymule')
AddEventHandler('buymule', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceMule
    xPlayer.removeMoney(price)
end)

RegisterNetEvent('buybenson')
AddEventHandler('buybenson', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceBenson
    xPlayer.removeMoney(price)
end)


