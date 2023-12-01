Citizen.CreateThread(function()


  RequestIpl("int_showroom_milo_")
  
      interiorID = GetInteriorAtCoords(-37.64443000, -1054.39700000, -40.00031000)
      if IsValidInterior(interiorID) then      
              -- EnableInteriorProp(interiorID, "premium")
              EnableInteriorProp(interiorID, "standart")
              RefreshInterior(interiorID)
  
            end
        
        end)
  local emitters = {
    
    "se_dlc_apt_yacht_bedroom",

  }
  
  CreateThread(function()

      RegisterCommand('ep', function(src,args) --Enable Prop
        local type = (args[1])
        EnableInteriorProp(interiorID, type)
        RefreshInterior(interiorID)
      end)
      RegisterCommand('dp', function(src,args) --Disable Prop
        local type = (args[1])
        DisableInteriorProp(interiorID, type)
        RefreshInterior(interiorID)
      end)
    end)


  Citizen.CreateThread(function()
    for i = 1, #emitters do
      SetStaticEmitterEnabled(emitters[i], false)
    end
  end)

local autoexbbmin, autoexbbmax = vec3(-97.64443000, -1114.39700000, -100.00030000), vec3(22.35557000, -994.39650000, 19.99970000)
if not DoesScenarioBlockingAreaExist(autoexbbmin, autoexbbmax) then
  AddScenarioBlockingArea(autoexbbmin, autoexbbmax, 0, 1, 1, 1)
end