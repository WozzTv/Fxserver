print("^0======================================================================^7")
print("^0[^4Author^0] ^7:^0 ^5Dinero - WoozTV - Kaneki^7")
print("^0[^3Version^0] ^7:^0 ^01.0^7")
print("^0======================================================================^7")



local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


ESX = nil 

local latestPoint



Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)


_menuPool = NativeUI.CreatePool()
locationMenu = NativeUI.CreateMenu("Location","", nil, nil, "shopui_title_ie_modgarage", "shopui_title_ie_modgarage")
_menuPool:Add(locationMenu)



spawnCar = function(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end
    if latestPoint == 1 then

    local vehicle = CreateVehicle(car, -503.97, -668.34, 31.95, 270.02, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleNumberPlateText(vehicle, "LOCATION")
    elseif latestPoint == 2 then
        local vehicle = CreateVehicle(car, 1701.11, 4939.01, 41.07, 325.02, true, false)
        SetEntityAsMissionEntity(vehicle, true, true)
        SetVehicleNumberPlateText(vehicle, "LOCATION")
        SetVehicleColours(vehicle, 255, 255, 255)
    end
   
end


function AddLocationMenu(menu)

    local velomenu = _menuPool:AddSubMenu(menu, "Vélo", nil, nil, "shopui_title_ie_modgarage", "shopui_title_ie_modgarage")


    local bmx = NativeUI.CreateItem("BMX", "Appuyer sur ENTRER pour louer ce Véhicule")
    velomenu.SubMenu:AddItem(bmx)
    bmx:RightLabel("20$")

    local cruiser = NativeUI.CreateItem("Cruiser", "Appuyer sur ENTRER pour louer ce Véhicule")
    velomenu.SubMenu:AddItem(cruiser)
    cruiser:RightLabel("25$")

    local fixter = NativeUI.CreateItem("Fixter", "Appuyer sur ENTRER pour louer ce Véhicule")
    velomenu.SubMenu:AddItem(fixter)
    fixter:RightLabel("30$")

    local scorcher = NativeUI.CreateItem("Scorcher", "Appuyer sur ENTRER pour louer ce Véhicule")
    velomenu.SubMenu:AddItem(scorcher)
    scorcher:RightLabel("35$")

    local tribike = NativeUI.CreateItem("Tribike", "Appuyer sur ENTRER pour louer ce Véhicule")
    velomenu.SubMenu:AddItem(tribike)
    tribike:RightLabel("40$")

    
    velomenu.SubMenu.OnItemSelect = function(menu, item)
        if item == bmx then 
            TriggerServerEvent('buybmx')
            ESX.ShowNotification('Vous avez payé 20$')
            TriggerServerEvent('buybmx')
            Citizen.Wait(1)
            spawnCar("bmx")
            ESX.ShowAdvancedNotification("Location", "Actions Effectué", "", "CHAR_CARSITE", 1)
            _menuPool:CloseAllMenus(true)
        elseif item == cruiser then
            ESX.ShowNotification('Vous avez payé 25$')
            TriggerServerEvent('buycruiser')
            ESX.ShowAdvancedNotification("Location", "Actions Effectué", "", "CHAR_CARSITE", 1)
            Citizen.Wait(1)
            spawnCar("cruiser")
            _menuPool:CloseAllMenus(true)
        elseif item == fixter then
            ESX.ShowNotification('Vous avez payé 30$')
            TriggerServerEvent('buyfixter')
            ESX.ShowAdvancedNotification("Location", "Actions Effectué", "", "CHAR_CARSITE", 1)
            Citizen.Wait(1)
            spawnCar("fixter")
            _menuPool:CloseAllMenus(true)
        elseif item == scorcher then
            ESX.ShowNotification('Vous avez payé 35$')
            TriggerServerEvent('buyscorcher')
            ESX.ShowAdvancedNotification("Location", "Actions Effectué", "", "CHAR_CARSITE", 1)
            Citizen.Wait(1)
            spawnCar("scorcher")
            _menuPool:CloseAllMenus(true)
        elseif item == tribike then
            ESX.ShowNotification('Vous avez payé 40$')
            TriggerServerEvent('buytribike')
            ESX.ShowAdvancedNotification("Location", "Actions Effectué", "", "CHAR_CARSITE", 1)
            Citizen.Wait(1)
            spawnCar("tribike")
            _menuPool:CloseAllMenus(true)
        end
    end

end

AddLocationMenu(locationMenu)
_menuPool:RefreshIndex()


local blips = {
    {title="Location de Vélo", colour=50, id = 480, x = -503.84, y = -671.28, z = 32.08,},
    {title="Location de Vélo", colour=50, id = 480, x = 1703.99, y = 4937.08, z = 41.07,},
}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.8)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)


local location = {
    {x = -503.83, y = -670.27, z = 32.08, type = 1},
    {x = 1703.19, y = 4937.60, z = 41.07, type = 2},
}



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        _menuPool:MouseEdgeEnabled (false);

        for k in pairs(location) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, location[k].x, location[k].y, location[k].z)

            if dist <= 1.2 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour intéragir avec le ~g~Loueur")
                if IsControlJustPressed(1,51) then 
                    latestPoint = location[k].type 
                    locationMenu:Visible(not locationMenu:Visible())
				end
            end
        end
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_y_winclean_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Citizen.Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVMALE", "s_m_y_winclean_01", -503.84, -671.28, 32.08, 0.02, false, true) --Emplacement du PEDS
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_MOBILE_FACILITY")
    ped = CreatePed("PED_TYPE_CIVMALE", "s_m_y_winclean_01", 1703.99, 4937.08, 41.07, 57.02, false, true) --Emplacement du PEDS
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_MOBILE_FACILITY")
end)



