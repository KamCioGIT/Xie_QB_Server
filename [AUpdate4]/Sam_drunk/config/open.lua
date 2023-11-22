
CodeStudio.ServerType = 'QB'  ---Your Server Type QB/ESX/false

CodeStudio.OpenUI = {
    useCommand = true,
    Command_Name = 'atest',

    useItem = true, 
    Item_Name = 'alcohol_tester'
}


---EDIT THIS AS PER YOUR SERVER NEEDS---


if CodeStudio.OpenUI.useItem then 
    if CodeStudio.ServerType == 'ESX' then
        ------ESX CODE------
        
        ESX = exports['es_extended']:getSharedObject()

        ESX.RegisterUsableItem(CodeStudio.OpenUI.Item_Name, function(source)
            TriggerClientEvent('cs:drunk:openUI', source)
        end)

    elseif CodeStudio.ServerType == 'QB' then
        ------QB CODE------

        QBCore = exports['qb-core']:GetCoreObject()

        QBCore.Functions.CreateUseableItem(CodeStudio.OpenUI.Item_Name, function(source)
            TriggerClientEvent('cs:drunk:openUI', source)
        end)

    else

        --YOU CAN ADD YOUR CUSTOM EVENTS HERE

    end
end




if CodeStudio.OpenUI.useCommand then
    if CodeStudio.ServerType == "ESX" then 

        ESX.RegisterCommand(CodeStudio.OpenUI.Command_Name, 'user', function(xPlayer, args, showError)
            TriggerClientEvent('cs:drunk:openUI', source)
        end, false, {help = "开启酒精测试仪"})

    elseif CodeStudio.ServerType == "QB" then

        QBCore.Commands.Add(CodeStudio.OpenUI.Command_Name, "开启酒精测试仪", {}, false, function(source, args)
            TriggerClientEvent('cs:drunk:openUI', source)
        end)

    else
        RegisterCommand(CodeStudio.OpenUI.Command_Name, function(source)
            if source > 0 then
                TriggerClientEvent('cs:drunk:openUI', source)
            end
        end, false)
    end
end