# Mission System - Foothold Syria Extended

## Overview

The Mission System manages AI behavior, mission generation, and tactical decision-making across the Foothold Syria Extended mission. It uses the GroupCommander framework to create dynamic, responsive AI that adapts to battlefield conditions and player actions.

## Architecture

### Mission Hierarchy
```
GroupCommander
├── Mission Type (attack, supply, patrol)
├── Target Zone (destination or patrol area)
├── Conditions (execution requirements)
├── Parameters (timing, urgency, equipment)
└── Execution Logic (AI behavior)
```

### Core Mission Properties
```lua
mission = {
    name = "mission-name",           -- Unique identifier
    mission = "attack",              -- Mission type
    targetzone = "TargetZone",       -- Target zone
    condition = function() end,      -- Execution condition
    urgent = false,                  -- High priority flag
    spawnDelayFactor = 1.0,         -- Spawn timing multiplier
    diceChance = 100,               -- Execution probability
    type = "surface",               -- Unit type (air/surface)
    MissionType = "CAP"             -- Specific mission subtype
}
```

## Mission Types

### Attack Missions
**Purpose**: Offensive operations against enemy zones

#### Air Attack Missions
```lua
-- Combat Air Patrol (CAP)
GroupCommander:new({
    name='aleppo-patrol-Taftanaz', 
    mission='patrol', 
    MissionType='CAP', 
    targetzone='Taftanaz'
})

-- SEAD (Suppression of Enemy Air Defense)
GroupCommander:new({
    name='sead-mission', 
    mission='attack', 
    targetzone='EnemyZone',
    type='air'
})
```

#### Surface Attack Missions
```lua
-- Ground assault
GroupCommander:new({
    name='aleppo-attack-bravo', 
    mission='attack', 
    targetzone='Bravo',
    type='surface'
})

-- Armored assault
GroupCommander:new({
    name='armor-attack', 
    mission='attack', 
    targetzone='TargetZone',
    type='surface',
    spawnDelayFactor = 1.5
})
```

### Supply Missions
**Purpose**: Logistics and reinforcement operations

#### Standard Supply
```lua
-- Basic supply mission
GroupCommander:new({
    name='minakh-supply-Hatay-blue', 
    mission='supply', 
    targetzone='Hatay'
})
```

#### Conditional Supply
```lua
-- Supply with conditions
GroupCommander:new({
    name='minakh-supply-Gaziantep', 
    mission='supply', 
    targetzone='Gaziantep', 
    condition = function() return zones.incirlik.wasBlue end, 
    urgent = zones.gaziantep.side == 0
})
```

#### Emergency Supply
```lua
-- High-priority supply
GroupCommander:new({
    name='emergency-supply', 
    mission='supply', 
    targetzone='CriticalZone',
    urgent = true,
    spawnDelayFactor = 0.5
})
```

### Patrol Missions
**Purpose**: Area security and reconnaissance

#### Air Patrol
```lua
-- Combat Air Patrol
GroupCommander:new({
    name='patrol-mission', 
    mission='patrol', 
    MissionType='CAP', 
    targetzone='PatrolZone'
})
```

#### Ground Patrol
```lua
-- Area security
GroupCommander:new({
    name='ground-patrol', 
    mission='patrol', 
    targetzone='SecurityZone'
})
```

## Mission Parameters

### Execution Conditions
```lua
-- Zone control requirement
condition = function() 
    return zones.incirlik.wasBlue  -- Requires Incirlik control
end

-- Multiple zone requirements
condition = function() 
    return zones.minakh.wasBlue or zones.taftanaz.wasBlue
end

-- Complex conditions
condition = function() 
    return zones.incirlik.wasBlue and zones.hatay.side == 0
end
```

### Priority Settings
```lua
-- High priority mission
urgent = true

-- Zone-specific urgency
urgent = zones.target.side == 0

-- Dynamic urgency
urgent = function() 
    return zones.target.side == 0 
end
```

### Timing Parameters
```lua
-- Spawn delay multiplier
spawnDelayFactor = 1.5  -- 50% slower spawning

-- Execution probability
diceChance = 50  -- 50% chance of execution

-- Era-specific timing
Era = 'Modern'  -- Modern era equipment
```

## Mission Execution

### Mission Lifecycle
```lua
function GroupCommander:execute()
    -- 1. Check conditions
    if not self:canExecute() then
        return false
    end
    
    -- 2. Check probability
    if math.random(100) > self.diceChance then
        return false
    end
    
    -- 3. Spawn units
    local group = self:spawnGroup()
    if not group then
        return false
    end
    
    -- 4. Assign mission
    self:assignMission(group)
    
    -- 5. Start execution
    self:startExecution(group)
    
    return true
end
```

### Condition Checking
```lua
function GroupCommander:canExecute()
    -- Check basic conditions
    if not self.condition then
        return true
    end
    
    -- Execute condition function
    local result = self.condition()
    return result == true
end
```

### Unit Spawning
```lua
function GroupCommander:spawnGroup()
    -- Get spawn template
    local template = self:getTemplate()
    
    -- Calculate spawn position
    local position = self:getSpawnPosition()
    
    -- Spawn the group
    local group = SPAWN:New(template)
    group:SpawnFromPoint(position)
    
    return group
end
```

### Mission Assignment
```lua
function GroupCommander:assignMission(group)
    local controller = group:getController()
    
    if self.mission == "attack" then
        self:assignAttackMission(controller)
    elseif self.mission == "supply" then
        self:assignSupplyMission(controller)
    elseif self.mission == "patrol" then
        self:assignPatrolMission(controller)
    end
end
```

## Mission Targeting

### Target Selection
```lua
function GroupCommander:selectTarget()
    local targetZone = self:getTargetZone()
    
    if self.mission == "attack" then
        return self:selectAttackTarget(targetZone)
    elseif self.mission == "supply" then
        return self:selectSupplyTarget(targetZone)
    end
end
```

### Attack Targeting
```lua
function GroupCommander:selectAttackTarget(zone)
    -- Get enemy units in zone
    local enemies = zone:getEnemyUnits()
    
    -- Prioritize targets
    local priority = self:prioritizeTargets(enemies)
    
    -- Select best target
    return priority[1]
end
```

### Supply Targeting
```lua
function GroupCommander:selectSupplyTarget(zone)
    -- Get friendly units in zone
    local friendlies = zone:getFriendlyUnits()
    
    -- Find units needing supply
    local needy = self:findNeedyUnits(friendlies)
    
    -- Select supply target
    return needy[1]
end
```

## Mission Coordination

### Zone Mission Management
```lua
function Zone:addGroups(groupCommanders)
    for _, gc in ipairs(groupCommanders) do
        table.insert(self.groups, gc)
    end
end

function Zone:executeMissions()
    for _, mission in ipairs(self.groups) do
        if mission:canExecute() then
            mission:execute()
        end
    end
end
```

### Mission Scheduling
```lua
function BattleCommander:scheduleMissions()
    timer.scheduleFunction(function()
        for _, zone in ipairs(self.zones) do
            zone:executeMissions()
        end
        return timer.getTime() + 60  -- Check every minute
    end, {}, timer.getTime() + 60)
end
```

## Era-Specific Missions

### Modern Era Missions
```lua
-- Modern equipment missions
GroupCommander:new({
    name='modern-attack', 
    mission='attack', 
    targetzone='TargetZone',
    Era='Modern'
})
```

### Cold War Era Missions
```lua
-- Cold War equipment missions
GroupCommander:new({
    name='coldwar-attack', 
    mission='attack', 
    targetzone='TargetZone',
    Era='Coldwar'
})
```

## Mission Examples

### Complex Supply Chain
```lua
zones.minakh:addGroups({
    -- Supply to Hatay
    GroupCommander:new({
        name='minakh-supply-Hatay-blue', 
        mission='supply', 
        targetzone='Hatay'
    }),
    
    -- Supply to Aleppo
    GroupCommander:new({
        name='minakh-supply-Aleppo-blue', 
        mission='supply', 
        targetzone='Aleppo'
    }),
    
    -- Attack Taftanaz
    GroupCommander:new({
        name='minakh-attack-Taftanaz', 
        mission='attack', 
        targetzone='Taftanaz'
    }),
    
    -- Emergency supply to Gaziantep
    GroupCommander:new({
        name='minakh-supply-Gaziantep', 
        mission='supply', 
        targetzone='Gaziantep', 
        condition = function() return zones.incirlik.wasBlue end, 
        urgent = zones.gaziantep.side == 0
    })
})
```

### Multi-Zone Coordination
```lua
zones.aleppo:addGroups({
    -- Supply to multiple zones
    GroupCommander:new({
        name='aleppo-supply-Minakh-blue', 
        mission='supply', 
        targetzone='Minakh'
    }),
    GroupCommander:new({
        name='aleppo-supply-Taftanaz-blue', 
        mission='supply', 
        targetzone='Taftanaz'
    }),
    
    -- Patrol missions
    GroupCommander:new({
        name='aleppo-patrol-Taftanaz', 
        mission='patrol', 
        MissionType='CAP', 
        targetzone='Taftanaz'
    }),
    
    -- Attack missions
    GroupCommander:new({
        name='aleppo-attack-bravo', 
        mission='attack', 
        targetzone='Bravo'
    })
})
```

## Performance Considerations

### Mission Optimization
- **Conditional Execution**: Missions only run when conditions are met
- **Probability Control**: DiceChance prevents mission spam
- **Spawn Timing**: SpawnDelayFactor controls mission frequency
- **Resource Management**: Efficient unit spawning and cleanup

### Scalability Features
- **Mission Pooling**: Reuse mission objects
- **Batch Processing**: Group mission updates
- **Priority Queuing**: Urgent missions get priority
- **Dynamic Loading**: Missions loaded based on need

## Extension Points

### Adding New Mission Types
```lua
-- Define new mission type
function GroupCommander:assignReconMission(controller)
    local task = {
        id = "Reconnaissance",
        params = {
            targetZone = self.targetzone,
            duration = 1800,  -- 30 minutes
            altitude = 5000
        }
    }
    controller:setTask(task)
end

-- Add to mission assignment
function GroupCommander:assignMission(group)
    local controller = group:getController()
    
    if self.mission == "recon" then
        self:assignReconMission(controller)
    end
end
```

### Custom Mission Parameters
```lua
-- Add new parameters
GroupCommander:new({
    name='custom-mission', 
    mission='attack', 
    targetzone='TargetZone',
    customParam = "value",
    customFunction = function() return true end
})
```

### Mission Events
```lua
-- Add mission event handlers
function GroupCommander:onMissionComplete()
    -- Custom completion logic
    self:triggerEvent("missionComplete", {mission=self})
end
```

## Troubleshooting

### Common Issues
1. **Missions not executing**: Check conditions and probability
2. **Units not spawning**: Verify template availability
3. **Wrong targets**: Check target zone configuration
4. **Performance issues**: Review mission frequency

### Debug Commands
```lua
-- Debug mission status
if event.text=='missions' then
    for _, zone in ipairs(bc.zones) do
        for _, mission in ipairs(zone.groups) do
            env.info(string.format("Mission %s: %s", mission.name, mission.mission))
        end
    end
end
```

### Logging
```lua
-- Mission execution logging
env.info(string.format("Mission %s executing to %s", mission.name, mission.targetzone))
```

## Future Enhancements

### Potential Improvements
1. **Advanced AI**: More sophisticated decision making
2. **Mission Chaining**: Sequential mission execution
3. **Dynamic Objectives**: Adaptive mission goals
4. **Coordination AI**: Multi-mission coordination
5. **Player Interaction**: Player-directed missions

### Extension Ideas
- **Specialized Missions**: Unique mission types
- **Mission Templates**: Predefined mission sets
- **Dynamic Missions**: Event-driven mission generation
- **Mission Scoring**: Mission success tracking 