local pcoords = nil
local pdead = nil

local EnterPrompt
local InteriorPrompts = GetRandomIntInRange(0, 0xffffff)

local ExitPrompt
local InteriorExitPrompts = GetRandomIntInRange(0, 0xffffff)

function InteriorExitPromptset()
    local str = 'Exit'
    ExitPrompt = PromptRegisterBegin()
    PromptSetControlAction(ExitPrompt, 0xD9D0E1C0)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(ExitPrompt, str)
    PromptSetEnabled(ExitPrompt, 1)
    PromptSetVisible(ExitPrompt, 1)
	PromptSetStandardMode(ExitPrompt,1)
	PromptSetGroup(ExitPrompt, InteriorExitPrompts)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,ExitPrompt,true)
	PromptRegisterEnd(ExitPrompt)

    local str2 = 'Enter'
    EnterPrompt = PromptRegisterBegin()
    PromptSetControlAction(EnterPrompt, 0xD9D0E1C0)
    str2 = CreateVarString(10, 'LITERAL_STRING', str2)
    PromptSetText(EnterPrompt, str2)
    PromptSetEnabled(EnterPrompt, 1)
    PromptSetVisible(EnterPrompt, 1)
	PromptSetStandardMode(EnterPrompt,1)
	PromptSetGroup(EnterPrompt, InteriorPrompts)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,EnterPrompt,true)
	PromptRegisterEnd(EnterPrompt)
end
Citizen.CreateThread(function() --
    InteriorExitPromptset()
	while true do
		Citizen.Wait(500)
        pcoords = GetEntityCoords(PlayerPedId())
        pdead = IsEntityDead(PlayerPedId())
    end
end)

Citizen.CreateThread(function() --
	while true do
		local t = 4
        if pcoords ~= nil and (pdead ~= nil and pdead ~= 1) then 
            for i,v in pairs(Config.InsideOptions) do 
                local dist = GetDistanceBetweenCoords(pcoords, v.enterPos, 1)
                local dist2 = nil
                if v.exitPos ~= false then 
                    dist2 = GetDistanceBetweenCoords(pcoords, v.exitPos, 1)
                end
                if dist < 4.0 then
                    Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, v.enterPos.x, v.enterPos.y, v.enterPos.z-0.9 , 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.3, 126, 0, 0, 200, 0, 0, 2, 0, 0, 0, 0)
                end
                if dist2 ~= nil and dist2 < 4.0 and v.exitPos ~= false then 
                    Citizen.InvokeNative(0x2A32FAA57B937173, 0x6903B113, v.exitPos.x, v.exitPos.y, v.exitPos.z-0.9 , 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.3, 126, 0, 0, 200, 0, 0, 2, 0, 0, 0, 0)
                end
                if dist < 1.6 then 
                    local label  = CreateVarString(10, 'LITERAL_STRING', "Enter: "..v.name)
                    PromptSetActiveGroupThisFrame(InteriorPrompts, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,EnterPrompt) then
                        TriggerServerEvent("ricx_inside:setcoords_enter", v.enterSpawn.x, v.enterSpawn.y, v.enterSpawn.z, i)
                        Citizen.Wait(2000)
                    end
                end
                if dist2 ~= nil and dist2 < 1.6 and v.exitSpawn ~= false then 
                    local label  = CreateVarString(10, 'LITERAL_STRING', "Exit: "..v.name)
                    PromptSetActiveGroupThisFrame(InteriorExitPrompts, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,ExitPrompt) then
                        TriggerServerEvent("ricx_inside:setcoords_exit", v.exitSpawn.x, v.exitSpawn.y, v.exitSpawn.z)
                        Citizen.Wait(2000)
                    end
                end
            end
        else
            t = 2000
        end
        Citizen.Wait(t)
    end
end)

RegisterNetEvent("ricx_inside:error")
AddEventHandler("ricx_inside:error", function(text)
    print(text)
end)

function RemoveInteriorExitPrompts()
    PromptDelete(EnterPrompt)
    PromptDelete(ExitPrompt)
end

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
    RemoveInteriorExitPrompts()
end)