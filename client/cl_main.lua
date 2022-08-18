-- Key Master by Zod#8682
-- Serrurier par Zod#8682

RegisterNetEvent("Zod#8682::vehListReceive")
RegisterNetEvent("Zod#8682::vehCopyListReceive")

function notif(msg)
    if Notification then 
      RemoveNotification(Notification)
    end 

    SetNotificationTextEntry("STRING") 
    AddTextComponentSubstringPlayerName(msg)
    Notification = DrawNotification(true, true)
end

function action() 
    local KeyHomeMenu = RageUI.CreateMenu(Config.title, Config.blanksubandtitle)
    KeyHomeMenu.Rectangle = { R = 3, G = 1, B = 32, A = 255 }

    RageUI.Visible(KeyHomeMenu, not RageUI.Visible(KeyHomeMenu))

    while KeyHomeMenu do
        Citizen.Wait(0)

        RageUI.IsVisible(KeyHomeMenu, function()
            RageUI.Separator("~g~Création")
            RageUI.Button(Config.KeyHomeMenu, Config.desc1, {RightLabel = "🔑"}, true, {onSelected = function()
                createCopy()
            end, onActive = function() end})

            RageUI.Separator("~r~Supression")
            RageUI.Button(Config.DestroyKey, Config.desc2, {RightLabel = "🗑️"}, true, {onSelected = function()
                destroyKey()
            end, onActive = function() end})

            RageUI.Button(Config.KeyChange, Config.desc3, {RightLabel = "🚘"}, true, {onSelected = function()
                destroyAllKey()
            end, onActive = function() end})
        end)

        if(not RageUI.Visible(KeyHomeMenu)) then
            KeyHomeMenu = RMenu:DeleteType(Config.title, true)
        end
    end
end

function createCopy()
    TriggerServerEvent("Zod#8682::vehListSend")
    AddEventHandler("Zod#8682::vehListReceive", function(data)
        local keyCreateMenu = RageUI.CreateMenu(Config.title, Config.KeyHomeMenuSub)
        keyCreateMenu.Rectangle = { R = 3, G = 1, B = 32, A = 255 }

        RageUI.Visible(keyCreateMenu, not RageUI.Visible(keyCreateMenu))

        while keyCreateMenu do
            Citizen.Wait(0)

            RageUI.IsVisible(keyCreateMenu, function()
                for k, v in pairs(data) do
                    RageUI.Button(v.plate, nil, {RightLabel = "🚘"}, true, {onSelected = function() 
                        confirm(v.plate)
                    end, onActive = function() end})
                end
            end)

            if(not RageUI.Visible(keyCreateMenu)) then
                keyCreateMenu = RMenu:DeleteType(Config.title, true)
            end
        end
    end)
end

function confirm(plate)
    local confirm = RageUI.CreateMenu(Config.title, plate)
    confirm.Rectangle = { R = 3, G = 1, B = 32, A = 255 }

    RageUI.Visible(confirm, not RageUI.Visible(confirm))

    while(confirm) do
        Citizen.Wait(0)

        RageUI.IsVisible(confirm, function()
            RageUI.Button(Config.confirmmoney, nil, {RightLabel = "💸"}, true, {onSelected = function()
                TriggerServerEvent("Zod#8682::makeCashSend", "money", plate)
                RageUI.CloseAll()
            end, onActive = function() end})

            RageUI.Button(Config.confirmbank, nil, {RightLabel = "💳"}, true, {onSelected = function() 
                TriggerServerEvent("Zod#8682::makeCashSend", "bank", plate)
                RageUI.CloseAll()
            end, onActive = function() end})

            RageUI.Button(Config.cancel, nil, {RightLabel = "❌"}, true, {onSelected = function()
                RageUI.CloseAll()
            end, onActive = function() end})
        end)
        
        if(not RageUI.Visible(confirm)) then
            confirm = RMenu:DeleteType(Config.title, true)
        end
    end
end

function destroyKey() 
    TriggerServerEvent("Zod#8682::vehCopyListSend")
    AddEventHandler("Zod#8682::vehCopyListReceive", function(data)
        local keyDestroy = RageUI.CreateMenu(Config.title, Config.DestroyKeySub)
        keyDestroy.Rectangle = { R = 3, G = 1, B = 32, A = 255 }

        RageUI.Visible(keyDestroy, not RageUI.Visible(keyDestroy))

        if(data[1].plaque ~= nil) then
            while keyDestroy do
                Citizen.Wait(0)

                RageUI.IsVisible(keyDestroy, function()
                    for k, v in pairs(data) do
                        RageUI.Button("[n°"..v.record.."] "..v.plaque, nil, {RightLabel = "🚘"}, true, {onSelected = function()
                            confirmdestroy(v.record, v.plaque)
                        end, onActive = function() end})
                    end
                end)

                if(not RageUI.Visible(keyDestroy)) then
                    keyDestroy = RMenu:DeleteType(Config.title, true)
                end
            end
        else
            notif(Config.noVehCopy)
        end
    end)
end

function confirmdestroy(record, plate)
    local confirmdes = RageUI.CreateMenu(Config.title, Config.sure..plate.."] ?")
    confirmdes.Rectangle = { R = 3, G = 1, B = 32, A = 255 }

    RageUI.Visible(confirmdes, not RageUI.Visible(confirmdes))

    while(confirmdes) do
        Citizen.Wait(0)

        RageUI.IsVisible(confirmdes, function()
            RageUI.Button(Config.oui, nil, {RightLabel = "✅"}, true, {onSelected = function()
                TriggerServerEvent("Zod#8682::destroyVeh", record, plate)
                RageUI.CloseAll()
            end, onActive = function() end})

            RageUI.Button(Config.non, nil, {RightLabel = "❌"}, true, {onSelected = function()
                RageUI.CloseAll()
            end, onActive = function() end})
        end)
        
        if(not RageUI.Visible(confirmdes)) then
            confirmdes = RMenu:DeleteType(Config.title, true)
        end
    end
end

function destroyAllKey() 
    TriggerServerEvent("Zod#8682::vehListSend")
    AddEventHandler("Zod#8682::vehListReceive", function(data)
        local keyAllDestroy = RageUI.CreateMenu(Config.title, Config.KeyChangeSub)
        keyAllDestroy.Rectangle = { R = 3, G = 1, B = 32, A = 255 }

        RageUI.Visible(keyAllDestroy, not RageUI.Visible(keyAllDestroy))

        while keyAllDestroy do
            Citizen.Wait(0)

            RageUI.IsVisible(keyAllDestroy, function()
                for k, v in pairs(data) do
                    RageUI.Button(v.plate, nil, {RightLabel = "🚘"}, true, {onSelected = function()
                        confirmAlldestroy(v.plate)
                    end, onActive = function() end})
                end
            end)

            if(not RageUI.Visible(keyAllDestroy)) then
                keyAllDestroy = RMenu:DeleteType(Config.title, true)
            end
        end
    end)
end

function confirmAlldestroy(plate)
    local confirmalldes = RageUI.CreateMenu(Config.title, Config.sureChange..plate.."] ?")
    confirmalldes.Rectangle = { R = 3, G = 1, B = 32, A = 255 }

    RageUI.Visible(confirmalldes, not RageUI.Visible(confirmalldes))

    while(confirmalldes) do
        Citizen.Wait(0)

        RageUI.IsVisible(confirmalldes, function()
            RageUI.Button(Config.oui, nil, {RightLabel = "✅"}, true, {onSelected = function()
                TriggerServerEvent("Zod#8682::destroyAllVeh", plate)
                RageUI.CloseAll()
            end, onActive = function() end})

            RageUI.Button(Config.non, nil, {RightLabel = "❌"}, true, {onSelected = function()
                RageUI.CloseAll()
            end, onActive = function() end})
        end)
        
        if(not RageUI.Visible(confirmalldes)) then
            confirmalldes = RMenu:DeleteType(Config.title, true)
        end
    end
end

-- To interact
Citizen.CreateThread(function()
    print("^6Zod#8682 ^0:: for :: ^5Dream^0Role^1Play")

    while(true) do
        Citizen.Wait(1)
        if(#(GetEntityCoords(PlayerPedId(-1)) - Config.keymastercoords) < Config.rangeToInteract) then
            DrawMarker(Config.Marker, Config.keymastercoords.x, Config.keymastercoords.y, Config.keymastercoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, Config.color.r, Config.color.g, Config.color.b, 170, 0, 1, 2, 0, nil, nil, 0)
            AddTextEntry("keymasterinput", Config.beforeInteract)
            DisplayHelpTextThisFrame("keymasterinput", false)

            if(IsControlJustPressed(1, Config.Key)) then
                action()
            end
        end    
    end
end)

-- Blips
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(Config.blips.x, Config.blips.y, Config.blips.z)
    SetBlipSprite(blip, Config.blips.id)
    SetBlipDisplay(blip, 4)
    SetBlipColour(blip, Config.blips.color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.blips.title)
    EndTextCommandSetBlipName(blip)
    SetBlipAsShortRange(blip, true)
end)