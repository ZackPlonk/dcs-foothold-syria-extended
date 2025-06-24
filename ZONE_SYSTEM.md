# Zone System - Foothold Syria Extended

## Overview

The Zone System is the fundamental architecture of the Foothold Syria Extended mission, managing territory control, unit deployment, and strategic gameplay. Each zone represents a geographic area that can be captured, defended, and upgraded by players, creating a dynamic battlefield across the Syria theater.

## Architecture

### Zone Hierarchy
```
Zone
├── Properties (side, level, active, etc.)
├── Units (built groups and static objects)
├── Missions (GroupCommander instances)
├── Upgrades (unit type definitions)
└── Relationships (strategic connections)
```

### Core Zone Properties
```lua
zone = {
    side = 0,           -- 0=neutral, 1=red, 2=blue
    level = 0,          -- Zone upgrade level
    active = true,      -- Zone is operational
    built = {},         -- Currently spawned units
    groups = {},        -- GroupCommander missions
    wasBlue = false,    -- Historical ownership
    wasRed = false,     -- Historical ownership
    zone = "zoneName"   -- Zone identifier
}
```

## Zone Types and Upgrades

### Zone Type Definitions
Zones are categorized by their strategic function and upgrade capabilities:

#### Airfield Zones
```lua
-- Major airbases with full facilities
incirlik = {
    blue = {'blueInfantry', 'blueArmor', 'bluePD1', 'blueMERAD', 'blueLORAD'},
    red = {'redInfantry', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 2', 'Red SAM AAA', 'Red Armor Group3', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15','Red Armor Group5','Red Arty 2'}
}
```

#### Military Base Zones
```lua
-- Strategic military installations
milbase = {
    blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
    red = {'redInfantry','Red Armor Group2', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 2' ,'Red Armor Group3','Red Armor Group3'}
}
```

#### EWR (Early Warning Radar) Zones
```lua
-- Radar and detection sites
ewrcharlie = {
    blue = {'blueInfantry'},
    red = {'Red EWR','Red SAM SHORAD SA-8 Fixed Charlie','Red SAM SHORAD SA-15 Fixed Charlie'}
}
```

#### Strategic Defense Zones
```lua
-- Long-range air defense sites
bigSAM = {
    blue = {'blueAmmo', 'blueAmmo', 'blueAmmo', 'blueLORAD'},
    red = {'redAmmo','redAmmo', 'Red SAM SA-11'}
}
```

### Upgrade System

#### Zone Levels
Zones progress through upgrade levels that unlock additional capabilities:

```lua
-- Level 0: Basic capture
-- Level 1: Infantry and light units
-- Level 2: Armor and medium units  
-- Level 3: Air defense and heavy units
-- Level 4: Full military complex
```

#### Upgrade Paths
```lua
upgrades = {
    minimal = {
        blue = {'blueInfantry'},
        red = {'redInfantry'}
    },
    insMinimum = {
        blue = {'blueInfantry','bluePD2'},
        red = {'insInfantry','Red SAM AAA', 'Red SAM AAA 2','Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 2' }
    },
    insSAM = {
        blue = {'bluePD2', 'blueMERAD', 'bluePD1'},
        red = {'Red SAM AAA', 'Red SAM AAA 2', 'Red Armor Group2', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 2' ,'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 2'}
    }
}
```

## Zone Lifecycle

### 1. Zone Initialization
```lua
function Zone:initialize()
    self.side = 0          -- Start neutral
    self.level = 0         -- Start at level 0
    self.active = true     -- Zone is active
    self.built = {}        -- No units yet
    self.groups = {}       -- No missions yet
end
```

### 2. Zone Capture Process
```lua
function Zone:capture(newSide)
    -- Remove existing units
    self:killAll()
    
    -- Change ownership
    self.side = newSide
    
    -- Reset level
    self.level = 0
    
    -- Spawn initial units
    self:spawnUnits()
    
    -- Update strategic relationships
    self:updateStrategicConnections()
end
```

### 3. Zone Upgrade Process
```lua
function Zone:upgrade()
    if self.level < 4 then
        self.level = self.level + 1
        self:spawnUnits()
        self:updateMissions()
    end
end
```

### 4. Zone Defense
```lua
function Zone:defend()
    -- Spawn defensive units
    self:spawnDefensiveUnits()
    
    -- Activate defensive missions
    self:activateDefensiveMissions()
    
    -- Update threat assessment
    self:assessThreats()
end
```

## Zone Relationships

### Strategic Connections
Zones support each other through supply chains and mutual defense:

```lua
-- Supply relationships
zones.minakh:addGroups({
    GroupCommander:new({
        name='minakh-supply-Hatay-blue', 
        mission='supply', 
        targetzone='Hatay',
        condition = function() return zones.hatay.side == 0
    })
})
```

### Zone Dependencies
Some zones require control of other zones to function:

```lua
-- Zone capture conditions
condition = function() 
    return zones.incirlik.wasBlue  -- Requires Incirlik control
end
```

### Zone Priorities
Zones have different strategic values:

```lua
-- High-value strategic zones
flavor = {
    charlie = 'WPT 14\nEWR Site, can not be captured, destroy for 500 credits and reduced enemy patrols',
    powerplant = 'WPT 21\n+180 credits/hour',
    hotel = 'WPT 22\nSAM site'
}
```

## Unit Management

### Unit Spawning
```lua
function Zone:spawnUnits()
    local unitTypes = self:getUnitTypesForLevel()
    
    for _, unitType in ipairs(unitTypes) do
        local group = self:spawnGroup(unitType)
        if group then
            table.insert(self.built, group:getName())
        end
    end
end
```

### Unit Types by Level
```lua
function Zone:getUnitTypesForLevel()
    local upgradeType = self:getUpgradeType()
    local side = self.side == 1 and "red" or "blue"
    
    return upgrades[upgradeType][side]
end
```

### Unit Cleanup
```lua
function Zone:killAll()
    for _, unitName in ipairs(self.built) do
        local group = Group.getByName(unitName)
        if group then
            group:destroy()
        end
        
        local static = StaticObject.getByName(unitName)
        if static then
            static:destroy()
        end
    end
    
    self.built = {}
end
```

## Mission Integration

### Mission Assignment
```lua
function Zone:addGroups(groupCommanders)
    for _, gc in ipairs(groupCommanders) do
        table.insert(self.groups, gc)
    end
end
```

### Mission Execution
```lua
function Zone:executeMissions()
    for _, mission in ipairs(self.groups) do
        if mission:canExecute() then
            mission:execute()
        end
    end
end
```

## Zone Configuration

### Zone Definitions
```lua
zones = {
    incirlik = Zone:new("incirlik"),
    hatay = Zone:new("hatay"),
    aleppo = Zone:new("aleppo"),
    -- ... 71+ zones total
}
```

### Zone Properties
```lua
-- Zone-specific properties
flavor = {
    akrotiri = 'WPT 1\nStart zone',
    paphos = 'WPT 2\n',
    polis = 'WPT 3\n',
    -- ... waypoint descriptions
}
```

## Era-Specific Configuration

### Modern Era
```lua
-- Modern equipment and capabilities
if Era == 'Modern' then
    -- Use modern SAM systems, advanced units
end
```

### Cold War Era
```lua
-- Cold War equipment swapping
local cwSwap = {
    ['Red Armor Group2'] = 'Red Armor Group6',
    ['Red Armor Group3'] = 'Red Armor Group7',
    ['bluePD2'] = 'bluePD2 Coldwar'
}
```

## Performance Considerations

### Zone Optimization
- **Conditional Spawning**: Units only spawn when needed
- **Level-Based Loading**: Progressive unit complexity
- **Strategic Relationships**: Efficient dependency management
- **Memory Management**: Proper cleanup of destroyed units

### Scalability Features
- **Zone Pooling**: Reuse zone objects
- **Lazy Loading**: Load zone data on demand
- **Update Batching**: Group zone updates for efficiency
- **Event-Driven Updates**: Only update when necessary

## Extension Points

### Adding New Zone Types
```lua
-- Define new zone type
upgrades.newZoneType = {
    blue = {'blueNewUnit1', 'blueNewUnit2'},
    red = {'redNewUnit1', 'redNewUnit2'}
}

-- Add to zone configuration
zones.newZone = Zone:new("newZone")
zones.newZone:setUpgradeType("newZoneType")
```

### Custom Zone Behaviors
```lua
-- Extend Zone class
function Zone:customBehavior()
    -- Add custom logic
end

-- Override standard methods
function Zone:spawnUnits()
    -- Custom spawning logic
    self:customBehavior()
    -- Call parent method
    Zone.super.spawnUnits(self)
end
```

### Zone Events
```lua
-- Add custom zone events
function Zone:onCapture(newSide)
    -- Custom capture logic
    self:triggerEvent("zoneCaptured", {zone=self, side=newSide})
end
```

## Troubleshooting

### Common Issues
1. **Zone not spawning units**: Check upgrade type and level
2. **Zone capture not working**: Verify capture conditions
3. **Units not appearing**: Check unit template availability
4. **Performance issues**: Review zone update frequency

### Debug Commands
```lua
-- Debug zone status
if event.text=='debug' then
    local z = bc:getZoneOfPoint(event.pos)
    if z then
        -- Display zone information
    end
end
```

### Logging
```lua
-- Zone activity logging
env.info(string.format("Zone %s captured by side %d", zone.zone, newSide))
```

## Future Enhancements

### Potential Improvements
1. **Dynamic Zone Creation**: Runtime zone generation
2. **Zone Specialization**: Unique zone capabilities
3. **Advanced Relationships**: Complex strategic networks
4. **Zone Events**: Dynamic zone-based missions
5. **Zone Customization**: Player-configurable zones

### Extension Ideas
- **Resource Zones**: Zones that generate specific resources
- **Specialized Zones**: Zones with unique unit types
- **Dynamic Zones**: Zones that change based on events
- **Zone Alliances**: Multi-zone cooperative systems 