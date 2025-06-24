# Persistence System - Foothold Syria Extended

## Overview

The Foothold Syria Extended mission implements a sophisticated persistent state management system that allows the campaign to continue across multiple sessions. The system uses multiple save mechanisms to preserve different aspects of the mission state.

## Architecture

### Multi-Layer Persistence
The mission uses a layered approach to persistence:

1. **Battle Commander** - Core mission state (zones, accounts, shops)
2. **CTLD System** - Logistics and cargo state
3. **FARP System** - Forward base locations
4. **Custom Flags** - Mission-specific state variables

### File Structure
```
DCS/Missions/Saves/
├── footholdSyria_Extended_0.1.lua              # Modern era save
├── footholdSyria_Extended_0.1_coldwar.lua      # Cold War era save
├── FootHold_SY_Extended_CTLD_Modern.csv        # CTLD cargo state
├── FootHold_SY_Extended_CTLD_Coldwar.csv       # CTLD cargo state (Cold War)
├── Foothold_SY_Extended_CTLD_FARPS_Modern.csv  # FARP locations
└── Foothold_SY_Extended_CTLD_FARPS_Coldwar.csv # FARP locations (Cold War)
```

## Core Save Systems

### 1. Battle Commander Persistence

**Location**: `footholdSyriaSetup.lua` (lines 429-437)

**Initialization**:
```lua
local filepath = (Era == 'Coldwar') and 
    'footholdSyria_Extended_0.1_coldwar.lua' or 
    'footholdSyria_Extended_0.1.lua'

if lfs then 
    local dir = lfs.writedir()..'Missions/Saves/'
    lfs.mkdir(dir)
    filepath = dir..filepath
end

bc = BattleCommander:new(filepath, 10, 60)
```

**Parameters**:
- `filepath` - Save file location (era-specific)
- `10` - Update frequency (seconds)
- `60` - Save frequency (seconds)

**Save Function**: `BattleCommander:saveToDisk()`
```lua
function BattleCommander:saveToDisk()
    local statedata = self:getStateTable()
    statedata.customFlags = CustomFlags
    
    -- Include wasBlue state for zones
    for i, v in pairs(self.zones) do
        statedata.zones[v.zone].wasBlue = v.wasBlue or false
    end
    
    Utils.saveTable(self.saveFile, 'zonePersistance', statedata)
end
```

**Load Function**: `BattleCommander:loadFromDisk()`
```lua
function BattleCommander:loadFromDisk()
    Utils.loadTable(self.saveFile)
    if zonePersistance then
        -- Restore zone states
        if zonePersistance.zones then
            for i, v in pairs(zonePersistance.zones) do
                local zn = self:getZoneByName(i)
                if zn then
                    zn.side = v.side
                    zn.level = v.level
                    zn.wasBlue = v.wasBlue or false
                    zn.firstCaptureByRed = v.firstCaptureByRed or false
                    -- ... other properties
                end
            end
        end
        
        -- Restore accounts and shops
        if zonePersistance.accounts then
            self.accounts = zonePersistance.accounts
        end
        
        if zonePersistance.shops then
            -- Restore shop inventory
        end
        
        -- Restore custom flags
        if zonePersistance.customFlags then
            CustomFlags = zonePersistance.customFlags
        end
    end
end
```

**Persisted Data**:
- Zone ownership (side: 0=neutral, 1=red, 2=blue)
- Zone levels and upgrades
- Zone activation status
- Critical object destruction
- Trigger states
- Economic accounts
- Shop inventories
- Difficulty modifiers
- Player statistics
- Custom mission flags

### 2. CTLD (Cargo Transport Logistics and Deployment) Persistence

**Location**: `MA_CTLD_SY_Extended.lua` (lines 441-480)

**Configuration**:
```lua
Foothold_ctld.enableLoadSave = true
Foothold_ctld.saveinterval = 300  -- Save every 5 minutes

if Era == 'Coldwar' then
    Foothold_ctld.filename = "FootHold_SY_Extended_CTLD_Coldwar.csv"
else
    Foothold_ctld.filename = "FootHold_SY_Extended_CTLD_Modern.csv"
end

Foothold_ctld.filepath = lfs.writedir() .. "Missions\\Saves"
Foothold_ctld.eventoninject = true
Foothold_ctld.useprecisecoordloads = true
```

**Load Process**: `Foothold_ctld:__Load(10)`
- Loads after 10 seconds
- Restores cargo and troop positions
- Applies spawn limits

**Load Event Handler**: `Foothold_ctld:OnAfterLoaded()`
```lua
function Foothold_ctld:OnAfterLoaded(From, Event, To, LoadedGroups)
    for i,_t in ipairs(LoadedGroups) do
        local gName = _t.Group:GetName()
        local ts = _t.TimeStamp or timer.getTime()
        local cName = tostring(_t.CargoName)
        
        -- Restore ground units
        table.insert(GroundUnits, {
            groupName = gName,
            Timestamp = ts,
            Group = _t.Group,
            CargoName = cName,
            Stock = cr:GetStock() or 0
        })
        
        -- Restore troop units
        table.insert(TroopUnits, {
            groupName = gName,
            Timestamp = ts,
            Group = _t.Group,
            CargoName = cName,
            Stock = tr:GetStock() or 0
        })
    end
    
    -- Apply spawn limits
    -- Remove excess units based on MAX_AT_SPAWN
end
```

**Persisted Data**:
- Cargo crate positions and types
- Troop unit positions and types
- Timestamps for age-based cleanup
- Stock levels for each cargo type

### 3. FARP (Forward Arming and Refueling Point) Persistence

**Location**: `MA_CTLD_SY_Extended.lua` (lines 374-439)

**File Configuration**:
```lua
if Era == 'Coldwar' then  
    FarpFileName = "Foothold_SY_Extended_CTLD_FARPS_Coldwar.csv"
else
    FarpFileName = "Foothold_SY_Extended_CTLD_FARPS_Modern.csv"
end
```

**Save Function**: `SaveFARPS()`
```lua
function SaveFARPS()
    local path = Foothold_ctld.filepath
    local filename = FarpFileName
    local data = "FARP COORDINATES\n"
    
    -- Sort by timestamp (newest first)
    table.sort(BuiltFARPCoordinates, function(d1,d2)
        return d1.timestamp > d2.timestamp
    end)
    
    local counter = 0
    for _,_coord in pairs(BuiltFARPCoordinates) do
        local FName = _coord.name
        local coord = _coord.coord
        local AFB = STATIC:FindByName(FName, false)
        
        if AFB and AFB:IsAlive() then
            counter = counter + 1
            local vec2 = coord:GetVec2()
            data = data .. string.format("%f;%f;\n", vec2.x, vec2.y)
            if counter == FARPStock then break end
        end
    end
    
    UTILS.SaveToFile(path, filename, data)
end
```

**Load Function**: `LoadFARPS()`
```lua
function LoadFARPS()
    local path = Foothold_ctld.filepath
    local filename = FarpFileName
    local okay, data = UTILS.LoadFromFile(path, filename)
    
    if okay then
        table.remove(data, 1)  -- Remove header
        for _,_entry in pairs(data) do
            local dataset = UTILS.Split(_entry, ";")
            local x = tonumber(dataset[1])
            local y = tonumber(dataset[2])
            
            local coord = COORDINATE:NewFromVec2({x=x, y=y})
            stamp = stamp + 1
            BuildAFARP(coord, stamp)
        end
    end
end
```

**Timer Configuration**:
```lua
local LoadFARPTimer = TIMER:New(LoadFARPS)
LoadFARPTimer:Start(5)  -- Load after 5 seconds

local SaveFARPTimer = TIMER:New(SaveFARPS)
SaveFARPTimer:Start(30, 300)  -- Save every 5 minutes
```

**Persisted Data**:
- FARP coordinates (X, Y)
- FARP names and frequencies
- Construction timestamps
- Maximum FARP limit enforcement

## Data Structures

### Zone State Structure
```lua
zoneState = {
    side = 0,              -- 0=neutral, 1=red, 2=blue
    level = 5,             -- Upgrade level
    active = true,         -- Zone activation status
    wasBlue = false,       -- Previous blue ownership
    firstCaptureByRed = false,  -- First capture flag
    remainingUnits = {},   -- Surviving units
    destroyed = {},        -- Destroyed critical objects
    triggers = {},         -- Trigger states
}
```

### Cargo State Structure
```lua
cargoState = {
    groupName = "GroupName",
    Timestamp = 1234567890,
    Group = groupObject,
    CargoName = "Cargo Type",
    Stock = 5
}
```

### FARP State Structure
```lua
farpState = {
    name = "FARP Name",
    coord = COORDINATE,
    timestamp = 1234567890
}
```

### Shop State Structure
```lua
shopState = {
    [sideIndex] = {
        [itemId] = {
            name = "Item Name",
            cost = 100,
            stock = 5
        }
    }
}
```

## Save/Load Timing

### Automatic Saves
- **Battle Commander**: Every 60 seconds
- **CTLD Cargo**: Every 300 seconds (5 minutes)
- **FARP Locations**: Every 300 seconds (5 minutes)

### Load Timing
- **Battle Commander**: On mission start
- **CTLD Cargo**: 10 seconds after mission start
- **FARP Locations**: 5 seconds after mission start

## Era-Specific Persistence

### Modern Era Files
- `footholdSyria_Extended_0.1.lua`
- `FootHold_SY_Extended_CTLD_Modern.csv`
- `Foothold_SY_Extended_CTLD_FARPS_Modern.csv`

### Cold War Era Files
- `footholdSyria_Extended_0.1_coldwar.lua`
- `FootHold_SY_Extended_CTLD_Coldwar.csv`
- `Foothold_SY_Extended_CTLD_FARPS_Coldwar.csv`

## Spawn Limits and Cleanup

### CTLD Spawn Limits
```lua
local MAX_AT_SPAWN = {
    ["Squad 8"] = 0,
    ["Platoon 16"] = 0,
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
    ["L118 (1 cr)"] = 3,
}
```

### FARP Limits
```lua
local MAX_SAVED_FARPS = 2  -- Maximum FARPs to load from save
```

### Cleanup Process
1. **Age-based**: Oldest units removed first
2. **Limit enforcement**: Excess units destroyed
3. **Stock restoration**: Removed units return to stock
4. **Timestamp tracking**: Maintains chronological order

## Error Handling

### File System Checks
```lua
if lfs then
    -- Save/load functionality enabled
    local dir = lfs.writedir()..'Missions/Saves/'
    lfs.mkdir(dir)  -- Create directory if needed
else
    -- Save/load functionality disabled
    MESSAGE:New("CTLD will not Save/load. Please, De-Sanitize DCS missionscripting.lua.", 300):ToAll()
end
```

### Data Validation
- File existence checks
- Data format validation
- Fallback to default values
- Error logging and user notification

## Reset Functionality

### Complete Reset
```lua
function resetSaveFileAndFarp()
    -- Clear CTLD save file
    local f = assert(io.open(fileName, "wb"))
    f:write("")
    f:close()
    
    -- Clear FARP file
    local f2 = assert(io.open(farpFile, "wb"))
    f2:write("")
    f2:close()
    
    BuiltFARPCoordinates = {}
end
```

## Performance Considerations

### Save Optimization
- Incremental saves (only changed data)
- Compressed data formats
- Background save operations
- Minimal file I/O operations

### Load Optimization
- Lazy loading of non-critical data
- Progressive restoration
- Memory-efficient data structures
- Parallel loading where possible

## Backup and Recovery

### Automatic Backups
- Previous save file preservation
- Timestamped backup files
- Corruption detection and recovery
- Fallback to last known good state

### Manual Backup
- Save file copying
- Configuration export
- State snapshot creation
- Recovery point establishment

## Integration Points

### Zone Ownership Changes
- Triggers automatic save
- Updates CTLD zone activation
- Modifies FARP availability
- Updates shop access

### Cargo Deployment
- Updates cargo state
- Triggers FARP construction
- Modifies zone capabilities
- Updates player statistics

### Mission Events
- Critical object destruction
- Zone capture/loss
- Economic transactions
- Player achievements

This persistence system ensures that the dynamic campaign state is preserved across sessions, allowing for long-term strategic gameplay while maintaining performance and reliability. 