ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('buybuzzard2')
AddEventHandler('buybuzzard2', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.Pricebuzzard2
    xPlayer.removeMoney(price)
end)

RegisterNetEvent('buyvolatus')
AddEventHandler('buyvolatus', function()
    local _source = source 
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.Pricevolatus
    xPlayer.removeMoney(price)
end)
