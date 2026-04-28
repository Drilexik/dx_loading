local debug = GetResourceMetadata(GetCurrentResourceName(), 'is_debug', 0) == 'yes'
local resourceName = GetCurrentResourceName()
local loaded = false

Citizen.CreateThread(function()
    Citizen.Wait(500) -- DO NOT TOUCH!!!
    SendNUIMessage({
        type = "SET_DEBUG",
        value = debug
    })
end)

local function shutdown()
    if not loaded then
        loaded = true
        if debug then print("^2["..resourceName.."] Shutting down loading screen^0") end
        SendNUIMessage({ type = "SHUTDOWN_LOADING" })
        ShutdownLoadingScreen()
        ShutdownLoadingScreenNui()
    end
end

Citizen.CreateThread(function()
    local eventName = nil

    if GetResourceState('es_extended') == 'started' then
        eventName = 'esx:playerLoaded'
    elseif GetResourceState('qb-core') == 'started' then
        eventName = 'QBCore:Client:OnPlayerLoaded'
    end

    if eventName then
        RegisterNetEvent(eventName)
        AddEventHandler(eventName, function()
            shutdown()
        end)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(30000)
    if not loaded then
        if debug then print("^1["..resourceName.."] Timeout reached - forcing shutdown^0") end
        shutdown()
    end
end)