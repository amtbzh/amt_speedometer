-- Choose for km/h or MPH
-- Default km/h
local speedUnit = "km/h"

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(50)

        if IsPedSittingInAnyVehicle(PlayerPedId()) then
            --DisplayRadar(true)
            local veh = GetVehiclePedIsUsing(PlayerPedId(), false)
            if speedUnit == "km/h" then 
                speed = math.ceil(GetEntitySpeed(veh) * 3.6);
            elseif speedUnit == "MPH" then
                speed = math.ceil(GetEntitySpeed(veh) * 2.236936);
            else 
                speed = math.ceil(GetEntitySpeed(veh) * 3.6);
            end
            if IsPedInAnyHeli(PlayerPedId()) then
                SendNUIMessage({
                    showGearbox = false;
                })
            elseif IsPedInAnyPlane(PlayerPedId()) then
                SendNUIMessage({
                    showGearbox = false;
                })
            end
            SendNUIMessage({
                showSpeedometer = true;
                gear = GetVehicleCurrentGear(veh);
                speed = speed;
                speedUnit = speedUnit
            })
        else
            --DisplayRadar(false)
            SendNUIMessage({
                showSpeedometer = false;
            })
        end

        if IsPauseMenuActive() then 
            SendNUIMessage({
                showSpeedometer = false;
            })
        end
        --[[
        if IsPedInAnyHeli(PlayerPedId()) then
            SendNUIMessage({
                showGearbox = false;
            })
        elseif IsPedInAnyPlane(PlayerPedId()) then
            SendNUIMessage({
                showGearbox = false;
            })
        end
        ]]--
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('[AMT] ' .. resourceName .. ' has been started.')
  end)