

local ServerFramework_inside = "redemrp" -- "redemrp" or "vorp"

local VorpCore

if ServerFramework == "vorp" then
    TriggerEvent("getCore",function(core)
        VorpCore = core
    end)
end

RegisterServerEvent("ricx_inside:setcoords_enter")
AddEventHandler("ricx_inside:setcoords_enter", function(x,y,z, id)
    local _source = source
    local _x, _y, _z = x,y,z
    local _id = tonumber(id)
    if Config.InsideOptions[_id].job ~= false then 
        local job = nil
        if ServerFramework_inside == "vorp" then
            local Character = VorpCore.getUser(_source).getUsedCharacter
            job = Character.job
        elseif ServerFramework_inside == "redemrp" then
            TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
                job = user.getJob()
            end)
        end
        while job == nil do 
            Citizen.Wait(200)
        end
        local hasjob = false
        for i,v in pairs(Config.InsideOptions[_id].job) do 
            if v == job then 
                hasjob = true
                break
            end
        end
        if hasjob == false then 
            return TriggerClientEvent("ricx_inside:error", _source, "requires job to use")
        end
    end
    SetEntityCoords(GetPlayerPed(_source), x, y, z-0.5)
end)

RegisterServerEvent("ricx_inside:setcoords_exit")
AddEventHandler("ricx_inside:setcoords_exit", function(x,y,z)
    local _source = source
    local _x, _y, _z = x,y,z
    SetEntityCoords(GetPlayerPed(_source), x, y, z-0.5)
end)
