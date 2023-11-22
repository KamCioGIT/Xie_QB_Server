
# REQUIRED SCRIPT
- You need to be utilizing the following grouping system
https://github.com/Project-Sloth/ps-playergroups 
I do not offer support on how to install this.
### Add the following items to you QBCore Shared
```
-- Oxy Item, needed if you dont already have the QBCore Oxy
   ['oxy'] = {['name'] = 'oxy',	['label'] = 'Prescription Oxy',	['weight'] = 100, ['type'] = 'item', ['image'] = 'oxy.png',	['unique'] = false,	['useable'] = true,	['shouldClose'] = true,	['combinable'] = nil,   ['description'] = 'The Label Has Been Ripped Off', ["created"] = nil, ["decay"] = 4.0},

-- Suspiscious Package Item that you hand off
   ["suspicious-package"] = {["name"] = "suspicious-package", ["label"] = "Suspicious Package", ["weight"] = 15000, ["type"] = "item", ["image"] = "suspicious-package.png", ["unique"] = true, ["useable"] = false, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = "Package covered in tape and milk stickers.\nMarked for Police Seizure",	["created"] = nil, ["decay"] = 0.0},

-- Stack of Cash item used (Bands/Rolls type of item, just a new name)
   ['stackofcash'] = {['name'] = 'stackofcash', ['label'] = 'Stack of Cash', ['weight'] = 150, ['type'] = 'item', ['image'] = 'stackofcash.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = true,	['combinable'] = nil, ['description'] = 'A stack of various bills.', ["created"] = nil, ["decay"] = 0.0},

```
### REQUIRED EVENT FOR PACKAGE ANIMATION
This will need to be placed in multiple spots in your inventory client main.lua
```
TriggerEvent("oxyrun:checkPackage")
```
The following events are what you need for LJ Inventory and QB Inventory, it is needed approximately 6 times.
- inventory:client:DropItemAnim -- Something similar to this
```
RegisterNetEvent('inventory:client:DropItemAnim', function()
    local ped = PlayerPedId()
    SendNUIMessage({
        action = "close",
    })
    RequestAnimDict("pickup_object")
    while not HasAnimDictLoaded("pickup_object") do
        Wait(7)
    end
    TaskPlayAnim(ped, "pickup_object" ,"pickup_low" ,8.0, -8.0, -1, 1, 0, false, false, false )
    Wait(2000)
    ClearPedTasks(ped)
    TriggerEvent("oxyrun:checkPackage")
end)
```
- inventory -- After setting the maxweights for trunks, it will look something like this
```
        local other = {
            maxweight = maxweight,
            slots = slots,
        }
        TriggerServerEvent("inventory:server:OpenInventory", "trunk", CurrentVehicle, other)
        TriggerEvent("oxyrun:checkPackage")
        OpenTrunk()
    elseif CurrentGlovebox then
        TriggerServerEvent("inventory:server:OpenInventory", "glovebox", CurrentGlovebox)
        TriggerEvent("oxyrun:checkPackage")
    elseif CurrentDrop then
        TriggerServerEvent("inventory:server:OpenInventory", "drop", CurrentDrop)
        TriggerEvent("oxyrun:checkPackage")
    elseif VendingMachine then
        local ShopItems = {}
        ShopItems.label = "Vending Machine"
        ShopItems.items = Config.VendingItem
        ShopItems.slots = #Config.VendingItem
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_"..math.random(1, 99), ShopItems)
    else
        openAnim()
        TriggerServerEvent("inventory:server:OpenInventory")
        TriggerEvent("oxyrun:checkPackage")
    end
```
- CloseInventory -- (NUI Callback) Multiple times something similar to this
```
RegisterNUICallback("CloseInventory", function()
    if currentOtherInventory == "none-inv" then
        CurrentDrop = nil
        CurrentVehicle = nil
        CurrentGlovebox = nil
        CurrentStash = nil
        SetNuiFocus(false, false)
        inInventory = false
        TriggerScreenblurFadeOut(1000)
        ClearPedTasks(PlayerPedId())
        return
    end
    if CurrentVehicle ~= nil then
        CloseTrunk()
        TriggerServerEvent("inventory:server:SaveInventory", "trunk", CurrentVehicle)
        CurrentVehicle = nil
    elseif CurrentGlovebox ~= nil then
        TriggerServerEvent("inventory:server:SaveInventory", "glovebox", CurrentGlovebox)
        CurrentGlovebox = nil
    elseif CurrentStash ~= nil then
        TriggerServerEvent("inventory:server:SaveInventory", "stash", CurrentStash)
        CurrentStash = nil
    else
        TriggerServerEvent("inventory:server:SaveInventory", "drop", CurrentDrop)
        CurrentDrop = nil
    end
    Wait(50)
    TriggerEvent("oxyrun:checkPackage")
    TriggerScreenblurFadeOut(1000)
    SetNuiFocus(false, false)
    inInventory = false
end)
