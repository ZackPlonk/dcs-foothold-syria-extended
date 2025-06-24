BASE:I("CTLD : is loading.")

Foothold_ctld = CTLD:New(coalition.side.BLUE,{"CH.47", "UH.1H", "Hercules", "8MT", "Bronco.OV", "UH.60L", "Mi.24P", "OH58D"},"Lufttransportbrigade I")
local herccargo = CTLD_HERCULES:New("blue", "Hercules Test", Foothold_ctld)
Foothold_ctld.useprefix = true
Foothold_ctld.dropcratesanywhere = true
Foothold_ctld.forcehoverload = false
Foothold_ctld.CrateDistance = 65
Foothold_ctld.PackDistance = 65
Foothold_ctld.maximumHoverHeight = 20
Foothold_ctld.minimumHoverHeight = 3
Foothold_ctld.smokedistance = 5000
Foothold_ctld.enableFixedWing = true
Foothold_ctld.FixedMinAngels = 100 -- for troop/cargo drop via chute in meters, ca 470 ft
Foothold_ctld.FixedMaxAngels = 2000 -- for troop/cargo drop via chute in meters, ca 6000 ft
Foothold_ctld.FixedMaxSpeed = 180 -- 77mps or 270kph or 150kn
Foothold_ctld.dropAsCargoCrate = true
Foothold_ctld.allowcratepickupagain = true
Foothold_ctld.nobuildinloadzones = true
Foothold_ctld.movecratesbeforebuild = false
Foothold_ctld.movetroopstowpzone = true
Foothold_ctld.enableChinhookGCLoading = true
Foothold_ctld.hoverautoloading = false
Foothold_ctld.enableslingload = true
Foothold_ctld.ChinookTroopCircleRadius = 5
Foothold_ctld.usesubcats = true
Foothold_ctld.pilotmustopendoors = true
Foothold_ctld.TroopUnloadDistGroundHook = 15
Foothold_ctld.enableChinookGCLoading = true
Foothold_ctld.buildtime = 30
Foothold_ctld.showstockinmenuitems = false
Foothold_ctld.onestepmenu = true -- enable get and load, drop and build etc additon to moose by lekaa
Foothold_ctld.basetype = "uh1h_cargo"
Foothold_ctld.RadioSoundFC3 = "beaconsilent.ogg"
Foothold_ctld:__Start(5)


Foothold_ctld:AddTroopsCargo("technician Solider",{"CTLD_TROOPS_Engineers"},CTLD_CARGO.Enum.ENGINEERS,1,80,5)
Foothold_ctld:AddCratesCargo("ATGM Mephisto(2 cr)",{"CTLD_CARGO_Mephisto"}, CTLD_CARGO.Enum.VEHICLE, 2, 1500,5, "ANTI TANK")
Foothold_ctld:AddCratesCargo("ATGM Humvee(2 cr)",{"CTLD_CARGO_HMMWV"},CTLD_CARGO.Enum.VEHICLE,2,1000,5, "ANTI TANK")
Foothold_ctld:AddCratesCargo("ATGM Bradly(2 cr)",{"CTLD_CARGO_Bradly"},CTLD_CARGO.Enum.VEHICLE,2,1500,5, "ANTI TANK")
Foothold_ctld:AddCratesCargo("L118 (1 cr)",{"CTLD_CARGO_L118"},CTLD_CARGO.Enum.VEHICLE,1,700,5, "Support")
Foothold_ctld:AddCratesCargo("Ammo Truck(2 cr)",{"CTLD_CARGO_AmmoTruck"},CTLD_CARGO.Enum.VEHICLE,2,800,5, "Support")
Foothold_ctld:AddTroopsCargo("Squad 8",{"CTLD_TROOPS_ATS"},CTLD_CARGO.Enum.TROOPS,8,80,5)
Foothold_ctld:AddTroopsCargo("Platoon 16",{"CTLD_TROOPS_Platon16"},CTLD_CARGO.Enum.TROOPS,16,80,5)
Foothold_ctld:AddTroopsCargo("Platoon 32",{"CTLD_TROOPS_Platon1"},CTLD_CARGO.Enum.TROOPS,32,80,5)
Foothold_ctld:AddTroopsCargo("Anti-Air Soldiers",{"CTLD_TROOPS_AA"},CTLD_CARGO.Enum.TROOPS,5,80,5)
Foothold_ctld:AddTroopsCargo("Mortar Squad",{"CTLD_TROOPS_MRS"},CTLD_CARGO.Enum.TROOPS,6,80,5)
Foothold_ctld:AddCratesCargo("Linebacker(2 cr)",{"CTLD_CARGO_Linebacker"},CTLD_CARGO.Enum.VEHICLE,2,1500,5, "SAM/AAA")
--Foothold_ctld:AddCratesCargo("Tank Abrahams(5 cr)",{"CTLD_CARGO_TANK"},CTLD_CARGO.Enum.VEHICLE,5,1600,1, "ANTI TANK")
Foothold_ctld:AddCratesCargo("Vulcan (2 cr)",{"CTLD_CARGO_Vulcan"}, CTLD_CARGO.Enum.VEHICLE, 2, 1500,5, "SAM/AAA")
Foothold_ctld:AddCratesCargo("HAWK Site (4 cr)",{"CTLD_CARGO_HAWKSite"},CTLD_CARGO.Enum.FOB,4,1900,5, "SAM/AAA")
Foothold_ctld:AddCratesCargo("Nasam Site(4 cr)",{"CTLD_CARGO_NasamsSite"},CTLD_CARGO.Enum.FOB,4,1900,5, "SAM/AAA")
Foothold_ctld:AddCratesCargo("FARP (3 cr)",{"CTLD_TROOP_FOB"},CTLD_CARGO.Enum.FOB,3,1500,9)


Group.getByName('CTLD_TROOPS_Engineers'):destroy()
Group.getByName('CTLD_CARGO_Mephisto'):destroy()
Group.getByName('CTLD_CARGO_HMMWV'):destroy()
Group.getByName('CTLD_CARGO_Bradly'):destroy()
Group.getByName('CTLD_CARGO_L118'):destroy()
Group.getByName('CTLD_CARGO_AmmoTruck'):destroy()
Group.getByName('CTLD_TROOPS_ATS'):destroy()
Group.getByName('CTLD_TROOPS_Platon16'):destroy()
Group.getByName('CTLD_TROOPS_Platon1'):destroy()
Group.getByName('CTLD_TROOPS_AA'):destroy()
Group.getByName('CTLD_TROOPS_MRS'):destroy()
Group.getByName('CTLD_CARGO_Linebacker'):destroy()
Group.getByName('CTLD_CARGO_Vulcan'):destroy()
Group.getByName('CTLD_CARGO_HAWKSite'):destroy()
Group.getByName('CTLD_CARGO_NasamsSite'):destroy()
Group.getByName('CTLD_TROOP_FOB'):destroy()

-- How many of the units loaded from the save file should be spawned next time?
-- Oldest will be deleted first.
local MAX_AT_SPAWN = {

    ["Squad 8"] = 0,
    ["Platoon 16"] = 0,
    ["Platoon 32"] = 0,
    ["Anti-Air Soldiers"] = 1,
    ["Mortar Squad"] = 1,
    ["Ammo Truck(2 cr)"] = 2,
    ["Linebacker(2 cr)"] = 1,
    ["Vulcan (2 cr)"] = 1,
    ["HAWK Site (4 cr)"] = 1,
    ["Nasam Site(4 cr)"] = 1,
    ["technician Solider"] = 1,
    ["ATGM Mephisto(2 cr)"] = 1,
    ["ATGM Humvee(2 cr)"] = 1,
    ["ATGM Bradly(2 cr)"] = 1,
    ["Tank Abrahams(5 cr)"] = 0,
    ["L118 (1 cr)"] = 3,
}
-- How many farps do you want to load? 
-- Oldest will not be spawned if the number is exceded.
local MAX_SAVED_FARPS      = 2

Foothold_ctld:AddCTLDZone("Tarawa",CTLD.CargoZoneType.SHIP,SMOKECOLOR.Blue,true,false,240,20)
Foothold_ctld:AddCTLDZone("FOB ALPHA",CTLD.CargoZoneType.SHIP,SMOKECOLOR.Blue,true,false,240,20)
Foothold_ctld:AddCTLDZone("CVN-72",CTLD.CargoZoneType.SHIP,SMOKECOLOR.Blue,true,false,240,20)
Foothold_ctld:AddCTLDZone("CVN-73",CTLD.CargoZoneType.SHIP,SMOKECOLOR.Blue,true,false,240,20)


for _, zoneObj in ipairs(bc:getZones()) do
    local zoneName = zoneObj.zone
    if not zoneName:lower():find("hidden") then
        Foothold_ctld:AddCTLDZone(zoneName, CTLD.CargoZoneType.LOAD, SMOKECOLOR.Green, false, false)
        Foothold_ctld:AddCTLDZone(zoneName, CTLD.CargoZoneType.MOVE, SMOKECOLOR.Green, true, false)
    end
end

function addCTLDZonesForBlueControlled(zoneName)
    if zoneName then
        local zoneObj = bc:getZoneByName(zoneName)
        if zoneObj and not zoneName:lower():find("hidden") and not zoneName:lower():find("dropzone") then
            if zoneObj.wasBlue then
                --env.info("Activating LOAD for zone: " .. tostring(zoneName))
                Foothold_ctld:ActivateZone(zoneName, CTLD.CargoZoneType.LOAD)
                Foothold_ctld:DeactivateZone(zoneName, CTLD.CargoZoneType.MOVE)
            else
                --env.info("Activating MOVE for zone: " .. tostring(zoneName))
                Foothold_ctld:DeactivateZone(zoneName, CTLD.CargoZoneType.LOAD)
                Foothold_ctld:ActivateZone(zoneName, CTLD.CargoZoneType.MOVE)
            end
        end
    else
        for _, zoneObj in ipairs(bc:getZones()) do
            local zName = zoneObj.zone
            if not zName:lower():find("hidden") and not zName:lower():find("dropzone") then
                if zoneObj.wasBlue then
                    --BASE:I("Activating LOAD for zone: " .. tostring(zName))
                    Foothold_ctld:ActivateZone(zName, CTLD.CargoZoneType.LOAD)
                    Foothold_ctld:DeactivateZone(zName, CTLD.CargoZoneType.MOVE)
                else
                    --BASE:I("Activating MOVE for zone: " .. tostring(zName))
                    Foothold_ctld:DeactivateZone(zName, CTLD.CargoZoneType.LOAD)
                    Foothold_ctld:ActivateZone(zName, CTLD.CargoZoneType.MOVE)
                end
            end
        end
    end
end

local scheduler = SCHEDULER:New(nil, function()
    addCTLDZonesForBlueControlled()
end, {}, 5)

Foothold_ctld:SetUnitCapabilities("SA342Mistral", false, true, 0, 2, 10, 400)
Foothold_ctld:SetUnitCapabilities("SA342L", false, true, 0, 2, 10, 400)
Foothold_ctld:SetUnitCapabilities("SA342M", false, true, 0, 2, 10, 400)
Foothold_ctld:SetUnitCapabilities("SA342Minigun", false, true, 0, 2, 10, 400)
Foothold_ctld:SetUnitCapabilities("UH-1H", true, true, 1, 8, 15, 800)
Foothold_ctld:SetUnitCapabilities("Mi-8MT", true, true, 2, 16, 15, 6000)
Foothold_ctld:SetUnitCapabilities("Mi-8MTV2", true, true, 2, 18, 15, 6000)
Foothold_ctld:SetUnitCapabilities("Ka-50", false, false, 0, 0, 15, 400)
Foothold_ctld:SetUnitCapabilities("Mi-24P", true, true, 2, 8, 15, 1000)
Foothold_ctld:SetUnitCapabilities("Mi-24V", true, true, 2, 8, 15, 1000)
Foothold_ctld:SetUnitCapabilities("Hercules", true, true, 8, 20, 15, 20000)
Foothold_ctld:SetUnitCapabilities("UH-60L", true, true, 2, 20, 16, 3500)
Foothold_ctld:SetUnitCapabilities("AH-64D_BLK_II", false, false, 0, 0, 15, 400)
Foothold_ctld:SetUnitCapabilities("CH-47Fbl1", true, true, 5, 32, 20, 10800)
Foothold_ctld:SetUnitCapabilities("OH58D", false, false, 0, 0, 14, 400)

local TroopUnits = {}
local GroundUnits = {}
deployedTroopsSet = SET_GROUP:New()
zoneCaptureInfo = {}
deployedTroops = {}

     local FARPFreq = 129
     local FARPName = 1

     local FARPClearnames = {
       [1]="London",
       [2]="Dallas",
       [3]="Paris",
       [4]="Moscow",
       [5]="Berlin",
       [6]="Rome",
       [7]="Madrid",
       [8]="Warsaw",
       [9]="Dublin",
       [10]="Perth",
       }
local BuiltFARPCoordinates = {}
local SpawnedFARPsFromSave = 0


function BuildAFARP(Coordinate, stamp)
  if bc:getZoneOfPoint(Coordinate:GetVec3()) then return end
  local isFromSave = (stamp ~= nil)
  if isFromSave then
    if SpawnedFARPsFromSave >= MAX_SAVED_FARPS then
      return
    else
      SpawnedFARPsFromSave = SpawnedFARPsFromSave + 1
    end
  end

  local coord          = Coordinate
  local FarpNameNumber = ((FARPName - 1) % 10) + 1
  local FName          = FARPClearnames[FarpNameNumber]

  FARPFreq = FARPFreq + 1
  FARPName = FARPName + 1
  FName    = "CTLD FARP " .. FName

  ZONE_RADIUS:New(FName, coord:GetVec2(), 150, false)

  
  if supplyZones then
    supplyZones[#supplyZones + 1] = FName
  end  
  if allZones then
    allZones[#allZones + 1] = FName
  end

  UTILS.SpawnFARPAndFunctionalStatics(FName, coord, ENUMS.FARPType.INVISIBLE, Foothold_ctld.coalition, country.id.USA, FarpNameNumber, FARPFreq, radio.modulation.AM, nil, nil, nil, 6000, 6000)
  
  Foothold_ctld:AddCTLDZone(FName, CTLD.CargoZoneType.LOAD, SMOKECOLOR.Blue, true, false)
  MESSAGE:New(string.format("%s in operation!", FName), 15):ToBlue()
  Foothold_ctld:RemoveStockCrates("CTLD_TROOP_FOB", 1)

  table.insert(BuiltFARPCoordinates,{name=FName,coord=Coordinate,timestamp=stamp or timer.getTime()})
  

  local function CopyWarehouse()
    local srcStore=nil
    if zones then
      for _,zone in pairs(zones) do
        local n=zone.airbaseName
        if n then
          srcStore=STORAGE:FindByName(n)
          if srcStore then break end
        end
      end
    end
    if srcStore then
      local dstStore=STORAGE:FindByName(FName)
      if dstStore then
        for item,qty in pairs(srcStore:GetInventory()) do
          if qty>0 then
            dstStore:SetItem(item,qty)
          end
        end
      end
    end
  end

  if Era=='Coldwar' then
    SCHEDULER:New(nil,CopyWarehouse,{},10)
  else
    CopyWarehouse()
  end

  local markId     = 95000 + FARPFreq
  trigger.action.circleToAll(-1, markId, coord:GetVec3(), 150,{0,0,1,1}, {0,0,1,0.25}, 1)
  trigger.action.setMarkupTypeLine(markId, 2)
  trigger.action.setMarkupColor(markId, {0,1,0,1})

  local textId     = markId + 1
  local textPoint  = { x = coord.x, y = coord.y, z = coord.z + 150 }
  trigger.action.textToAll(-1, textId, textPoint,{0,0,0.7,0.8},{0.7,0.7,0.7,0.8},18,true, FName)
  trigger.action.setMarkupText(textId, FName)

end

Foothold_ctld.buildRunning = 0

function Foothold_ctld:OnBeforeCratesBuild()
  self.buildRunning = self.buildRunning + 1
end

function Foothold_ctld:OnAfterCratesBuild(From, Event, To, Group, Unit, Vehicle)
      if self.buildRunning > 0 then
    self.buildRunning = self.buildRunning - 1
end

    local currentTime = timer.getTime()
    local groupName   = Vehicle:GetName() or "unknown"

    if string.find(groupName,"CTLD_TROOP_FOB",1,true) then
        local Coord = Vehicle:GetCoordinate()
        Vehicle:Destroy(false)
        BuildAFARP(Coord)
        return
    end

    if not Group then return end

    local cargoName, stock = "unknown", 0

    for _, cargoData in pairs(self.Cargo_Crates) do
        if cargoData.Templates then
            local templateName = type(cargoData.Templates) == "table" and cargoData.Templates[1] or cargoData.Templates
            if string.find(groupName, templateName, 1, true) then
                if cargoData.CargoType == CTLD_CARGO.Enum.VEHICLE then
                    cargoName = cargoData:GetName()
                    stock     = cargoData:GetStock()
                end
                break
            end
        end
    end

    local maxTimestamp = 0
    for _, group in ipairs(GroundUnits) do
        if group.CargoName == cargoName and group.Timestamp > maxTimestamp then
            maxTimestamp = group.Timestamp
        end
    end

    local cargoObject      = self:_FindCratesCargoObject(cargoName)
    local currentStock     = cargoObject and cargoObject:GetStock() or 0
    local newTimestamp     = (maxTimestamp > 0) and (maxTimestamp + currentTime) or currentTime
    local configuredMax    = cargoObject and cargoObject:GetStock0() or 999
    self:I(string.format("OnAfterCratesBuild: cargoName=%s, stock0=%d, currentStock=%d", cargoName, configuredMax, currentStock))

    local groupExists = false
    for _, group in ipairs(GroundUnits) do
        if group.groupName == groupName then
            group.Timestamp = newTimestamp
            group.Stock     = currentStock
            groupExists     = true
            break
        end
    end

    if not groupExists then
        table.insert(GroundUnits, {
            groupName  = groupName,
            Timestamp  = newTimestamp,
            CargoName  = cargoName,
            Stock      = currentStock
        })
    end

    for _, g in ipairs(GroundUnits) do
        if g.CargoName == cargoName then
            g.Stock = currentStock
        end
    end

    if configuredMax > 1 then
        local oldestUnitIndex = nil
        local oldestTimestamp = math.huge
        for i, group in ipairs(GroundUnits) do
            if group.CargoName == cargoName
               and group.Timestamp < newTimestamp
               and group.Stock <= 1
            then
                if group.Timestamp < oldestTimestamp then
                    oldestTimestamp = group.Timestamp
                    oldestUnitIndex = i
                end
            end
        end

        if oldestUnitIndex then
            local oldestUnit = GroundUnits[oldestUnitIndex]
            Foothold_ctld:AddStockCrates(oldestUnit.CargoName, 1)
            local dcsGroup = GROUP:FindByName(oldestUnit.groupName)
            if dcsGroup and dcsGroup:IsAlive() then
                dcsGroup:Destroy()
            end
            table.remove(GroundUnits, oldestUnitIndex)
        end
    end
end

if lfs then

if Era == 'Coldwar' then  
FarpFileName = "Foothold_SY_Extended_CTLD_FARPS_Coldwar.csv"
else
FarpFileName = "Foothold_SY_Extended_CTLD_FARPS_Modern.csv"
end

function SaveFARPS()
  local path = Foothold_ctld.filepath
  local filename = FarpFileName
  local data = "FARP COORDINATES\n"

  local function sortingfunction(d1,d2)
   return d1.timestamp > d2.timestamp
  end
    
  table.sort(BuiltFARPCoordinates,sortingfunction)

  local counter = 0
  
  for _,_coord in pairs(BuiltFARPCoordinates) do
    local FName = _coord.name
    local coord = _coord.coord -- Core.Point#COORDINATE
    local AFB = STATIC:FindByName(FName,false)
    if AFB and AFB:IsAlive() then
      counter = counter + 1 -- increase counter
      local vec2 = coord:GetVec2() -- { x = self.x, y = self.z }
      data = data .. string.format("%f;%f;\n",vec2.x,vec2.y)
      if counter == FARPStock then break end -- stop creating data when we reached the ceiling
    end
  end
  
  if UTILS.SaveToFile(path,filename,data) then
    --BASE:I("***** FARP Positions saved successfully!")
  else
    BASE:E("***** ERROR Saving FARP Positions!")
  end
  
end
 
function LoadFARPS()
  local path = Foothold_ctld.filepath
  local filename = FarpFileName
  local okay,data = UTILS.LoadFromFile(path,filename)
  local stamp = 0
  if okay then
    BASE:I("***** FARP Positions loaded successfully!")
    -- remove header
    table.remove(data, 1)
    for _,_entry in pairs(data) do
      local dataset = UTILS.Split(_entry,";")
      local x = tonumber(dataset[1])
      local y = tonumber(dataset[2])
      
      local coord = COORDINATE:NewFromVec2({x=x,y=y})
      stamp = stamp + 1
      BuildAFARP(coord,stamp)
    end
  else
    BASE:E("***** ERROR Loading FARP Positions!")
  end
end

local LoadFARPTimer = TIMER:New(LoadFARPS)
LoadFARPTimer:Start(5)

local SaveFARPTimer = TIMER:New(SaveFARPS)
SaveFARPTimer:Start(30,300)

Foothold_ctld.enableLoadSave = true -- allow auto-saving and loading of files
Foothold_ctld.saveinterval = 300 -- save every 10 minutes
if Era=='Coldwar' then
Foothold_ctld.filename = "FootHold_SY_Extended_CTLD_Coldwar.csv" -- example filename
else
Foothold_ctld.filename = "FootHold_SY_Extended_CTLD_Modern.csv" -- example filename
end
Foothold_ctld.filepath = lfs.writedir() .. "Missions\\Saves" -- example path
Foothold_ctld.eventoninject = true -- fire OnAfterCratesBuild and OnAfterTroopsDeployed events when loading (uses Inject functions)
Foothold_ctld.useprecisecoordloads = true -- Instead if slightly varyiing the group position, try to maintain it as is


function resetSaveFileAndFarp()
  -- 1) Overwrite the CTLD save file with empty data:
  local path     = Foothold_ctld.filepath
  local fileName = Foothold_ctld.filename
  if lfs and path then
    fileName = path .. "\\" .. fileName
  end
  local f = assert(io.open(fileName, "wb"))
  f:write("")
  f:close()
  
  -- 2) Overwrite the FARPs file with empty data too:
  local farpFile = FarpFileName
  if lfs and path then
    farpFile = path .. "\\" .. farpFile
  end
  local f2 = assert(io.open(farpFile, "wb"))
  f2:write("")
  f2:close()

  BuiltFARPCoordinates = {}
end

else
    MESSAGE:New("CTLD will not Save/load. Please, De-Sanitize DCS missionscripting.lua.\n\nfunctionality disabled.", 300):ToAll()
end

Foothold_ctld:__Load(10)

function Foothold_ctld:OnAfterLoaded(From, Event, To, LoadedGroups)
  self:I("***** Groups Loaded! *****")
  for i,_t in ipairs(LoadedGroups) do
    local gName=_t.Group:GetName() or "unknown"
    local ts=_t.TimeStamp or timer.getTime()
    local cName=tostring(_t.CargoName)
    local cr=self:_FindCratesCargoObject(cName)
    if cr then
      table.insert(GroundUnits,{groupName=gName,Timestamp=ts,Group=_t.Group,CargoName=cName,Stock=cr:GetStock() or 0})
    end
    local tr=self:_FindTroopsCargoObject(cName)
    if tr then
      table.insert(TroopUnits,{groupName=gName,Timestamp=ts,Group=_t.Group,CargoName=cName,Stock=tr:GetStock() or 0})
    end
  end

  local cratesByName={}
  for _,d in ipairs(GroundUnits) do
    local k=d.CargoName
    cratesByName[k]=cratesByName[k] or {}
    table.insert(cratesByName[k],d)
  end
  for cName,list in pairs(cratesByName) do
    table.sort(list,function(a,b)return a.Timestamp<b.Timestamp end)
    local maxAllowed=MAX_AT_SPAWN[cName] or 0
    local total=#list
    local excess=total-maxAllowed
    for idx,entry in ipairs(list) do
      local act=idx<=maxAllowed and "KEEP" or "DELETE"
    end
    for i=total,maxAllowed+1,-1 do
      local old=list[i]
      local g=GROUP:FindByName(old.groupName)
      if g and g:IsAlive() then g:Destroy() end
      Foothold_ctld:AddStockCrates(old.CargoName,1)
      for idx,gu in ipairs(GroundUnits) do
        if gu.groupName==old.groupName then table.remove(GroundUnits,idx) break end
      end
    end
  end

  local troopsByName={}
  for _,d in ipairs(TroopUnits) do
    local k=d.CargoName
    troopsByName[k]=troopsByName[k] or {}
    table.insert(troopsByName[k],d)
  end
  for cName,list in pairs(troopsByName) do
    table.sort(list,function(a,b)return a.Timestamp<b.Timestamp end)
    local maxAllowed=MAX_AT_SPAWN[cName] or 0
    local total=#list
    local excess=total-maxAllowed
    for idx,entry in ipairs(list) do
      local act=idx<=maxAllowed and "KEEP" or "DELETE"
    end
    for i=total,maxAllowed+1,-1 do
      local old=list[i]
      local g=GROUP:FindByName(old.groupName)
      if g and g:IsAlive() then g:Destroy() end
      Foothold_ctld:AddStockTroops(old.CargoName,1)
      for idx,tu in ipairs(TroopUnits) do
        if tu.groupName==old.groupName then table.remove(TroopUnits,idx) break end
      end
    end
  end

  if self.Spawned_Cargo then
    for i=#self.Spawned_Cargo,1,-1 do
      local c=self.Spawned_Cargo[i]
      local s=c:GetPositionable()
      if s and s:IsAlive() then s:Destroy(false) end
      table.remove(self.Spawned_Cargo,i)
    end
  end
  for uName,ld in pairs(self.Loaded_Cargo) do
    if ld and ld.Cargo then
      local newC={}
      local cNum=0
      for _,cg in ipairs(ld.Cargo) do
        local tp=cg:GetType()
        if tp==CTLD_CARGO.Enum.TROOPS or tp==CTLD_CARGO.Enum.ENGINEERS then
          table.insert(newC,cg)
        end
      end
      ld.Cargo=newC
      ld.Cratesloaded=cNum
      self.Loaded_Cargo[uName]=ld
    end
  end
end

zoneSet = SET_ZONE:New()
for _, zoneObj in ipairs(bc:getZones()) do
  local mooseZone = ZONE:New(zoneObj.zone)
  zoneSet:AddZone(mooseZone)
end

function playRandomSound(Group, soundCategory)
    local sounds = {
        unload = {
            "troops_unload_everybody_off.ogg",
            "troops_unload_get_off.ogg",
            "troops_unload_here_we_go.ogg",
            "troops_unload_moving_out.ogg",
            "troops_unload_thanks.ogg"
        },
        loading = {
            "troops_load_to_action.ogg",
            "troops_load_ready.ogg",
            "troops_load_ao.ogg",
        }
    }
    local selectedSounds = sounds[soundCategory]
    if selectedSounds then
        local randomIndex = math.random(1, #selectedSounds)
        local selectedSound = selectedSounds[randomIndex]
        local sound = USERSOUND:New(selectedSound)
        sound:ToGroup(Group)
    end
end

function Foothold_ctld:OnAfterTroopsPickedUp(From, Event, To, Group, Unit, Cargo)
    if Group and Group:IsAlive() then
        playRandomSound(Group, "loading")
        else
        return
    end
end
function Foothold_ctld:OnAfterTroopsExtracted(From, Event, To, Group, Unit, Troops, Troopname)
     if Group and Group:IsAlive() then
        playRandomSound(Group, "loading")
        else
        return
    end
end
function Foothold_ctld:OnAfterTroopsDeployed(From, Event, To, Group, Unit, Troops)
    if not Group then return end

    local troopGroup = Troops
    if troopGroup and troopGroup:IsAlive() then
        local troopGroupName = troopGroup:GetName()
        local currentTime = timer.getTime()
        
        deployedTroops[troopGroupName] = troopGroup
        deployedTroopsSet:AddGroup(troopGroup)
        zoneSet:Trigger(deployedTroopsSet)

        if Group and Group:IsAlive() then
            playRandomSound(Group, "unload")
        else
            return
        end

        local cargoName, stock = "unknown", 0
        
        for _, cargoData in pairs(self.Cargo_Troops) do
            if cargoData.Templates then
                local templateName = type(cargoData.Templates) == "table" 
                                     and cargoData.Templates[1] 
                                     or cargoData.Templates
                if string.find(troopGroupName, templateName, 1, true) then
                    if cargoData.CargoType == CTLD_CARGO.Enum.TROOPS then
                        cargoName = cargoData:GetName()
                        stock = cargoData:GetStock()
                    end
                    break
                end
            end
        end
        local maxTimestamp = 0
        for _, group in ipairs(TroopUnits) do
            if group.CargoName == cargoName then
                if group.Timestamp > maxTimestamp then
                    maxTimestamp = group.Timestamp
                end
            end
        end
        local newTimestamp = maxTimestamp > 0 and (maxTimestamp + currentTime) or currentTime

        local groupExists = false
        for _, group in ipairs(TroopUnits) do
            if group.groupName == troopGroupName then
                group.Timestamp = newTimestamp
                group.Stock = stock
                groupExists = true
                break
            end
        end
        if not groupExists then
            table.insert(TroopUnits, {
                groupName = troopGroupName,
                Timestamp = newTimestamp,
                CargoName = cargoName,
                Stock = stock
            })
        end
        for _, g in ipairs(TroopUnits) do
            if g.CargoName == cargoName then
                g.Stock = stock
            end
        end

        local oldestUnit = nil
        local oldestTimestamp = math.huge
        for _, group in ipairs(TroopUnits) do
            if group.CargoName == cargoName
               and group.Timestamp < newTimestamp
               and group.Stock <= 1
            then
                if group.Timestamp < oldestTimestamp then
                    oldestTimestamp = group.Timestamp
                    oldestUnit = group
                end
            end
        end
        if oldestUnit then
            Foothold_ctld:AddStockTroops(oldestUnit.CargoName, 1)
            local dcsGroup = GROUP:FindByName(oldestUnit.groupName)
            if dcsGroup and dcsGroup:IsAlive() then
                dcsGroup:Destroy()
            end
            for i, group in ipairs(TroopUnits) do
                if group.groupName == oldestUnit.groupName then
                    table.remove(TroopUnits, i)
                    break
                end
            end
        end
        local currentZones = {}
        for _, zC in ipairs(bc:getZones()) do
            local missionZoneName = zC.zone
            local zone = ZONE:FindByName(missionZoneName)
            if troopGroup:IsPartlyOrCompletelyInZone(zone) then
                local zoneName = zone:GetName()
                table.insert(currentZones, {zoneName = zoneName, zoneObject = zC})
            end
        end

        for _, zoneData in ipairs(currentZones) do
            local currentZone = zoneData.zoneObject
            local zoneName = zoneData.zoneName

            if not currentZone then
                zoneCaptureInfo[troopGroupName] = { troopGroup = troopGroup, zoneName = zoneName }
                return
            end
            if currentZone.side == 2 then
                zoneCaptureInfo[troopGroupName] = { troopGroup = troopGroup, zoneName = zoneName }
                timer.scheduleFunction(function()
                    CaptureZoneIfNeutral()
                end, {}, timer.getTime() + 2)
                return
            end

            if currentZone.side == 1 then
                zoneCaptureInfo[troopGroupName] = { troopGroup = troopGroup, zoneName = zoneName }
                return
            end

            if currentZone.side == 0 then
                zoneCaptureInfo[troopGroupName] = { troopGroup = troopGroup, zoneName = zoneName }
                timer.scheduleFunction(function()
                    CaptureZoneIfNeutral()
                end, {}, timer.getTime() + 2)
            end
        end
    end
end
function zoneSet:OnAfterEnteredZone(From, Event, To, EnteredGroup, Zone)
    local troopGroup = EnteredGroup
    if troopGroup and troopGroup:IsAlive() then
        local troopGroupName = troopGroup:GetName()
        local zoneName = Zone:GetName()

        local currentZone = bc:getZoneByName(zoneName)

        if currentZone and currentZone.side == 2 then
            zoneCaptureInfo[troopGroupName] = { troopGroup = troopGroup, zoneName = zoneName }
            timer.scheduleFunction(function()
                CaptureZoneIfNeutral()
            end, {}, timer.getTime() + 10)
            return
        end
        if currentZone and currentZone.side == 1 then
            zoneCaptureInfo[troopGroupName] = { troopGroup = troopGroup, zoneName = zoneName }
            return
        end
        if currentZone and currentZone.side == 0 then
            zoneCaptureInfo[troopGroupName] = { troopGroup = troopGroup, zoneName = zoneName }
            timer.scheduleFunction(function()
                CaptureZoneIfNeutral()
            end, {}, timer.getTime() + 10)
        end
    end
end

local captureRunning=false

function CaptureZoneIfNeutral()
    if captureRunning then return end
    if next(zoneCaptureInfo)==nil then return end
    captureRunning=true

    local troopGroupNames={}
    for name in pairs(zoneCaptureInfo) do
        troopGroupNames[#troopGroupNames+1]=name
    end

    local function processNextGroup(index)
        if index>#troopGroupNames then
            captureRunning=false
            if next(zoneCaptureInfo) then CaptureZoneIfNeutral() end
            return
        end

        local troopGroupName=troopGroupNames[index]
        local data=zoneCaptureInfo[troopGroupName]

        if data then
            local zoneName   = data.zoneName
            local troopGroup = data.troopGroup
            local currentZone= bc:getZoneByName(zoneName)

            if currentZone and troopGroup and troopGroup:IsAlive() then
                if currentZone.side==0 then
                    currentZone:capture(2)
                    troopGroup:Destroy()
                elseif currentZone.wasBlue then
                    currentZone:upgrade()
                    troopGroup:Destroy()
                elseif not currentZone.active then
                    troopGroup:Destroy()
                end
                deployedTroops[troopGroupName]=nil
                deployedTroopsSet:RemoveGroupsByName(troopGroupName)
                
            end
        end

        zoneCaptureInfo[troopGroupName]=nil

        timer.scheduleFunction(function()
            processNextGroup(index+1)
        end,{},timer.getTime()+10)
    end

    processNextGroup(1)
end

local function RefillMissingWithCountTable()
    if Foothold_ctld.buildRunning > 0 then return end
  local countTable = Foothold_ctld:_CountStockPlusInHeloPlusAliveGroups()
  --BASE:I("**** CountStockPlusAliveGroups ****")
  --UTILS.PrintTableToLog(countTable,1)
  --BASE:I("**** CountStockPlusAliveGroups ****")
  for cargoName, info in pairs(countTable) do
    local stock0 = info.Stock0 or 0
    local sum    = info.Sum or 0
    local needed = stock0 - sum

    if needed > 0 then
      local isTroop  = Foothold_ctld:_FindTroopsCargoObject(cargoName)  ~= nil
      local isCrates = Foothold_ctld:_FindCratesCargoObject(cargoName) ~= nil

      if isTroop then
        Foothold_ctld:AddStockTroops(cargoName, needed)
        env.info(string.format("[Refill] TROOPS '%s': sum=%d < stock0=%d => +%d stock added.",
          cargoName, sum, stock0, needed))
      elseif isCrates then
        Foothold_ctld:AddStockCrates(cargoName, needed)
        env.info(string.format("[Refill] CRATES '%s': sum=%d < stock0=%d => +%d stock added.",
          cargoName, sum, stock0, needed))
      else
        env.info(string.format("[Refill] Cargo '%s' not found in Troops or Crates, cannot refill automatically.", cargoName))
      end
    end

    if sum > stock0 then
      local cargoObj = Foothold_ctld:_FindCratesCargoObject(cargoName)
      if cargoObj then
        local oldStock = cargoObj.Stock or 0
        if oldStock > 0 then
          local difference = sum - stock0
          local newStock   = oldStock - difference
          if newStock < 0 then
            newStock = 0
          end
          cargoObj.Stock = newStock
        end
      end
    end
  end
end

TIMER:New(RefillMissingWithCountTable):Start(15, 30)

BASE:I("CTLD script initialized")