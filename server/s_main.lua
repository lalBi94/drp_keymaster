RegisterNetEvent("Zod#8682::vehListSend")
RegisterNetEvent("Zod#8682::makeCashSend")
RegisterNetEvent("Zod#8682::destroyVeh")
RegisterNetEvent("Zod#8682::vehCopyListSend")
RegisterNetEvent("Zod#8682::destroyAllVeh")

Config = {}
Config.err = {}

Config.price = 2000

Config.ok = "~g~Le doublon pour : "
Config.ok2 = "~g~ a bien été crée.\n~r~(-"..Config.price.." $)"

Config.ok3 = "~r~Votre doublon ~b~["
Config.ok4 = "]~r~ a bien été supprimé !"

Config.ok5 = "~r~Les doublons pour ~b~["
Config.ok6 = "]~r~ ont bien été supprimés !"

Config.noVeh = "~r~Vous n'avez pas de vehicule !"
Config.noCopy = "~r~Vous n'avez pas de copie de vehicule !"

Config.err.gen = "~r~ERROR"
Config.err.mcs = "~r~ERROR :: Zod#8682::makeCashSend"
Config.err.vls = "~r~ERREUR :: Zod#8682::vehListSend"
Config.err.vcls = "~r~ERREUR :: Zod#8682::vehCopyListSend"

ESX = nil
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

-- Sache que tu es un gros ksos enefsjbfkesf

AddEventHandler("Zod#8682::vehListSend", function() 
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local steam = xPlayer.identifier

    if(xPlayer ~= nil) then
        MySQL.Async.fetchAll("SELECT plate FROM owned_vehicles WHERE owner=@o ORDER BY plate ASC", {["o"] = steam}, function(data) 
            if(#data > 0) then
                TriggerClientEvent("Zod#8682::vehListReceive", _src, data)
            else
                TriggerClientEvent("Zod#8682::vehListReceive", _src, {Config.noVeh})
            end
        end)
    else
        TriggerClientEvent('esx:showNotification', _src, Config.err.vls)
    end
end)

AddEventHandler("Zod#8682::vehCopyListSend", function() 
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local steam = xPlayer.identifier

    if(xPlayer ~= nil) then
        MySQL.Async.fetchAll("SELECT plaque, record FROM drp_keycopy WHERE identifier=@o ORDER BY plaque ASC", {["o"] = steam}, function(data) 
            if(#data > 0) then
                TriggerClientEvent("Zod#8682::vehCopyListReceive", _src, data)
            else
                TriggerClientEvent("Zod#8682::vehCopyListReceive", _src, {Config.noCopy})
            end
        end)
    else
        TriggerClientEvent('esx:showNotification', _src, Config.err.vcls)
    end
end)

AddEventHandler("Zod#8682::makeCashSend", function(typeaccount, plate)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local steam = xPlayer.identifier

    if(typeaccount ~= "money" and typeaccount ~= "bank") then
        TriggerClientEvent('esx:showNotification', _src, Config.err.gen)
        return
    end
    
    if(xPlayer ~= nul) then
        if(typeaccount == "money") then
            xPlayer.removeMoney(Config.price)
            MySQL.Async.execute("INSERT INTO drp_keycopy(identifier, plaque) VALUES(@o, @p)", {["o"] = steam, ["p"] = plate}, function() 
                TriggerClientEvent('esx:showNotification', _src, Config.ok.."~b~["..plate.."]"..Config.ok2.." ~r~: Liquide")
                return
            end)
            return
        end

        if(typeaccount == "bank") then
            xPlayer.removeAccountMoney("bank", Config.price)
            MySQL.Async.execute("INSERT INTO drp_keycopy(identifier, plaque) VALUES(@o, @p)", {["o"] = steam, ["p"] = plate}, function() 
                TriggerClientEvent('esx:showNotification', _src, Config.ok.."~b~["..plate.."]"..Config.ok2.." ~r~: Banque")
                return
            end)
            return
        end
    else
        TriggerClientEvent('esx:showNotification', _src, Config.err.mcs)
        return
    end
end)

AddEventHandler("Zod#8682::destroyVeh", function(record, plate)
    local _src = source

    MySQL.Async.execute("DELETE FROM drp_keycopy WHERE record=@r", {["r"] = record}, function()
        TriggerClientEvent('esx:showNotification', _src, Config.ok3..plate..Config.ok4)
        return
    end)
end)

AddEventHandler("Zod#8682::destroyAllVeh", function(plate) 
    local _src = source

    MySQL.Async.execute("DELETE FROM drp_keycopy WHERE plaque=@p", {["p"] = plate}, function()
        TriggerClientEvent('esx:showNotification', _src, Config.ok5..plate..Config.ok6)
        return
    end)
end)