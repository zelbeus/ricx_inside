

local ServerFramework_inside = "redemrp" -- "redemrp" or "vorp" or "qbr" or "redemrp-reboot"

local VorpCore

if ServerFramework_inside == "vorp" then
    TriggerEvent("getCore",function(core)
        VorpCore = core
    end)
elseif ServerFramework_inside == "redemrp" then
    TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
    end)
elseif ServerFramework_inside == "redemrp-reboot" then
    TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
    end)
    RedEM = exports["redem_roleplay"]:RedEM()
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
        elseif ServerFramework_inside == "redemrp-reboot" then
            local Player = RedEM.GetPlayer(_source)
            job = Player.job
        elseif ServerFramework_inside == "qbr" then
            local User = exports['qbr-core']:GetPlayer(_source)
            job = User.PlayerData.job.name
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
    if Config.InsideOptions[_id].item then 
        local item = nil 
        if ServerFramework_inside == "vorp" then
            for i,v in pairs(Config.InsideOptions[_id].item) do 
                if not item then 
                    local itemD = VorpInv.getItemCount(_source, v)
                    if itemD and itemD > 0 then 
                        item = true 
                    end
                end
            end
        elseif ServerFramework_inside == "redemrp" or ServerFramework_inside == "redemrp-reboot" then
            for i,v in pairs(Config.InsideOptions[_id].item) do 
                if not item then 
                    local itemD = data.getItem(_source, v)
                    if itemD and itemD.ItemAmount > 0 then 
                        item = true 
                    end
                end
            end
        elseif ServerFramework_inside == "qbr" then
            local User = exports['qbr-core']:GetPlayer(_source)
            for i,v in pairs(Config.InsideOptions[_id].item) do 
                if not item then 
                    local hasItem = User.Functions.GetItemByName(v)
                    if hasItem and hasItem.amount > 0 then 
                        item = true 
                    end
                end
            end
        end
        if not item then 
           return TriggerClientEvent("ricx_inside:error", _source, "No item!")
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
