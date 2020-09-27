
local HaveBagOnHead = false


local function RequestControlAndDelete(entity)    
	NetworkRequestControlOfEntity(entity)
	
	local timeout = 2000
	while timeout > 0 and not NetworkHasControlOfEntity(entity) do
		Wait(10)
		timeout = timeout - 100
	end

	SetEntityAsMissionEntity(entity, true, true)
	
	local timeout = 2000
	while timeout > 0 and not IsEntityAMissionEntity(entity) do
		Wait(10)
		timeout = timeout - 100
	end

	DeleteEntity(entity)
	
	if (DoesEntityExist(entity)) then 
		DeleteEntity(entity)
		if (DoesEntityExist(entity)) then        
			return false
		else 
			return true
		end
	else 
		return true
	end 
end

RegisterNetEvent('es_worek:start') --This event delete head bag from player head
AddEventHandler('es_worek:start', function() --This function send to server closestplayer

local playerDataName = "pseudo"

local closestPlayer, closestDistance = GetClosestPlayer()
local player = GetPlayerPed(-1)

if closestPlayer == -1 or closestDistance > 2.0 then 
	TriggerEvent("es_freeroam:notify", "CHAR_DEFAULT", 1, "Moi", false, "Il n'y a pas de joueur à proximité !")
else
if not HaveBagOnHead then
    TriggerServerEvent('es_worek:sendclosest', playerDataName, GetPlayerServerId(closestPlayer))
	TriggerEvent("es_freeroam:notify", "CHAR_DEFAULT", 1, "Moi", false, "Vous mettez le sac sur la tête de ".. GetPlayerName(closestPlayer))
    TriggerServerEvent('es_worek:closest', playerDataName)
	elseif HaveBagOnHead then
	TriggerServerEvent('es_worek:sendclosest', playerDataName, GetPlayerServerId(closestPlayer))
	TriggerEvent("es_freeroam:notify", "CHAR_DEFAULT", 1, "Moi", false, "Vous enlevez le sac de la tête de ".. GetPlayerName(closestPlayer))
    TriggerServerEvent('es_worek:closest', playerDataName)
	end
end
end)






function GetClosestPlayer()
	local players = GetActivePlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	
	return closestPlayer, closestDistance
end

--RegisterNetEvent('esx_worek:naloz') --This event open menu
--AddEventHandler('esx_worek:naloz', function()
--    OpenBagMenu()
--end)

local sac_net = nil

RegisterNetEvent('es_worek:nalozNa') --This event put head bag on nearest player
AddEventHandler('es_worek:nalozNa', function(gracz)
if not HaveBagOnHead then
        local playerPed = GetPlayerPed(-1)
        local Worek = CreateMiniFruit(GetHashKey("prop_money_bag_01"), 0, 0, 0, true, true, true)
		DecorRegister("Arcadia", 2)
		DecorSetBool(Worek, "Arcadia", true)
        local netid = ObjToNet(Worek)
        SetNetworkIdExistsOnAllMachines(netid, true)
        NetworkSetNetworkIdDynamic(netid, true)
        SetNetworkIdCanMigrate(netid, false)
        AttachEntityToEntity(Worek, playerPed, GetPedBoneIndex(playerPed, 12844), 0.2, 0.04, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
        sac_net = netid
        SetNuiFocus(false,false)
        SendNUIMessage({type = 'openGeneral'})
        HaveBagOnHead = true
	else
	    SendNUIMessage({type = 'closeAll'})
        ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
        DetachEntity(NetToObj(sac_net), 1, 1)
        RequestControlAndDelete(NetToObj(sac_net))
		RequestControlAndDelete(Worek)
        SetEntityAsNoLongerNeeded(Worek)
        sac_net = nil
        HaveBagOnHead = false
	end
end)    

AddEventHandler('playerSpawned', function() --This event delete head bag when player is spawn again
Worek = CreateMiniFruit(GetHashKey("prop_money_bag_01"), 0, 0, 0, true, true, true)
DecorRegister("Arcadia", 2)
DecorSetBool(Worek, "Arcadia", true)
RequestControlAndDelete(Worek)
SetEntityAsNoLongerNeeded(Worek)
SendNUIMessage({type = 'closeAll'})
HaveBagOnHead = false
end)
local worek

local worek_net = nil
RegisterNetEvent('es_worek:zdejmijc') --This event delete head bag from player head
AddEventHandler('es_worek:zdejmijc', function(gracz)
HaveBagOnHead = false
--TriggerServerEvent("clothing_shop:SpawnPlayer_server")
--local Worek = CreateMiniFruit(GetHashKey("prop_money_bag_01"), 0, 0, 0, true, true, true)
--local netid = ObjToNet(Worek)
--SetEntityAsNoLongerNeeded(Worek)
--DetachEntity(NetToObj(worek_net), 1, 1)
--DeleteEntity(NetToObj(worek_net))
SendNUIMessage({type = 'closeAll'})

end)

--function OpenBagMenu() --This function is menu function
--
--    local elements = {
--          {label = 'Put bag on head', value = 'puton'},
--          {label = 'Remove bag from head', value = 'putoff'},
--          
--        }
--  
--    ESX.UI.Menu.CloseAll()
--  
--    ESX.UI.Menu.Open(
--      'default', GetCurrentResourceName(), 'headbagging',
--      {
--        title    = 'HEAD BAG MENU',
--        align    = 'top-left',
--        elements = elements
--        },
--  
--            function(data2, menu2)
--  
--  
--              local player, distance = ESX.Game.GetClosestPlayer()
--  
--              if distance ~= -1 and distance <= 2.0 then
--  
--                if data2.current.value == 'puton' then
--                    NajblizszyGracz()
--                end
--  
--                if data2.current.value == 'putoff' then
--                  TriggerServerEvent('esx_worek:zdejmij')
--                end
--              else
--                ESX.ShowNotification('~r~There is no player nearby.')
--              end
--            end,
--      function(data2, menu2)
--        menu2.close()
--      end
--    )
--  
--  end

