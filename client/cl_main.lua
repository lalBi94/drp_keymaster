ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
RegisterNetEvent("Zod#8682::checkVehOwnerReceive")

Citizen.CreateThread(function() 
    print("^6Zod#8682 ^0:: for :: ^5Dream^0Role^1Play")
    while(true) do
        Citizen.Wait(1)
        if(IsControlJustPressed(1,Config.useKey)) then
            local coordsP = GetEntityCoords(PlayerPedId(-1)) 
            local veh = ESX.Game.GetClosestVehicle(coordsP)
            TriggerServerEvent("Zod#8682::checkVehOwnerSend", veh)
            local isOwnedVeh = check
            
            AddEventHandler("Zod#8682::checkVehOwnerReceive", function(check)
                if(check) then
                    print("[Zod#8682] :: C'est mon veh")
                else
                    print("[Zod#8682] :: C'est pas mon veh")
                end
            end)
            
        end
    end
end)