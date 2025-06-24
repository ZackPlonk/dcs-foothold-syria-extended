# AI Commander System - Foothold Syria Extended

## Overview

The Foothold Syria Extended mission implements a sophisticated AI commander system that manages dynamic unit behavior, mission generation, and strategic decision-making across the entire theater. The AI operates at multiple levels from individual unit behavior to coalition-wide strategic planning.

## Architecture

### Multi-Layer AI System

1. **Battle Commander** - Strategic AI for coalition management
2. **Zone Commander** - Tactical AI for individual zone control
3. **Group Commander** - Unit-level AI for mission execution
4. **JTAC System** - Target acquisition and designation AI
5. **Hunter System** - Player-specific threat response AI

## Core AI Components

### 1. Battle Commander AI (`zoneCommander_moose.lua`)

**Primary Functions:**
- Strategic mission planning and execution
- Coalition resource management
- Dynamic threat assessment
- Player interaction and reward systems

**Key AI Behaviors:**

#### Mission Planning AI
```lua
-- Mission selection based on strategic priorities
function BattleCommander:getBestMission(zone, missionType)
    local best = nil
    local bestScore = 0
    
    for _, mission in ipairs(zone.missions) do
        if mission.type == missionType and mission:canExecute() then
            local score = mission:calculatePriority()
            if score > bestScore then
                best = mission
                bestScore = score
            end
        end
    end
    
    return best
end
```

#### Threat Assessment AI
```lua
-- Dynamic threat evaluation
function BattleCommander:assessThreatLevel(zone)
    local threatLevel = 0
    
    -- Evaluate enemy presence
    for _, group in ipairs(zone.groups) do
        if group.side ~= zone.side then
            threatLevel = threatLevel + group:getCombatValue()
        end
    end
    
    -- Evaluate strategic importance
    threatLevel = threatLevel * zone.strategicValue
    
    return threatLevel
end
```

### 2. Zone Commander AI

**Primary Functions:**
- Zone-specific unit management
- Local tactical decisions
- Resource allocation within zones
- Defensive and offensive coordination

**Key AI Behaviors:**

#### Supply Chain AI
```lua
-- Intelligent supply routing
zones.minakh:addGroups({
    GroupCommander:new({
        name='minakh-supply-Hatay-blue', 
        mission='supply', 
        targetzone='Hatay',
        condition = function() return zones.incirlik.wasBlue end,
        urgent = zones.hatay.side == 0
    })
})
```

#### Attack Mission AI
```lua
-- Dynamic attack mission generation
zones.aleppo:addGroups({
    GroupCommander:new({
        name='aleppo-attack-bravo', 
        mission='attack', 
        targetzone='Bravo',
        spawnDelayFactor = 1.5,
        diceChance = 50
    })
})
```

### 3. Group Commander AI

**Mission Types Implemented:**

#### Attack Missions
- **Air Attack**: CAP, SEAD, ground attack
- **Surface Attack**: Armored assaults, infantry attacks
- **Strategic Attack**: Infrastructure targeting

```lua
-- Attack mission parameters
{
    mission = 'attack',
    targetzone = 'TargetZone',
    MissionType = 'CAP',  -- Combat Air Patrol
    type = 'surface',     -- Surface attack
    spawnDelayFactor = 1.5,
    diceChance = 50,      -- Probability of execution
    urgent = true         -- High priority
}
```

#### Supply Missions
- **Logistics**: Transport of troops and equipment
- **Reinforcement**: Unit replacement and upgrades
- **Emergency Supply**: Critical resource delivery

```lua
-- Supply mission parameters
{
    mission = 'supply',
    targetzone = 'TargetZone',
    condition = function() return zones.source.wasBlue end,
    urgent = zones.target.side == 0
}
```

#### Patrol Missions
- **CAP**: Combat Air Patrol
- **Ground Patrol**: Area security
- **Naval Patrol**: Maritime security

```lua
-- Patrol mission parameters
{
    mission = 'patrol',
    MissionType = 'CAP',
    targetzone = 'PatrolZone',
    Era = 'Modern'  -- Era-specific equipment
}
```

### 4. JTAC (Joint Terminal Attack Controller) AI

**Primary Functions:**
- Target acquisition and designation
- Threat prioritization
- Laser designation for precision strikes
- Real-time battlefield intelligence

**AI Behavior Implementation:**

#### Target Prioritization AI
```lua
function JTAC:sortByThreat(targets)
    local threatRank = {
        ['SAM TR']          = 1,  -- Highest priority
        ['IR Guided SAM']   = 2,
        ['SAM SR']          = 3,
        ['Tanks']           = 4,
        ['IFV']             = 5,
        ['APC']             = 6,
        ['Artillery']       = 7,
        ['SAM LL']          = 8,
        ['SAM CC']          = 9,
        ['Unarmed vehicles']= 10,
        ['Infantry']        = 11,
        ['Structures']      = 12  -- Lowest priority
    }
    
    -- Sort targets by threat level
    table.sort(targets, function(a,b) 
        return getScore(a) < getScore(b) 
    end)
end
```

#### Dynamic Target Selection
```lua
function JTAC:searchIfNoTarget()
    if not self.target then
        self:searchTarget()
        return
    end
    
    local target = Unit.getByName(self.target)
    if target and target:isExist() and target:getLife() >= 1 then
        self:setTarget(target)
    else
        self:searchTarget()
    end
end
```

### 5. Hunter AI System

**Primary Functions:**
- Player-specific threat response
- Dynamic interceptor spawning
- Kill threshold monitoring
- Escalating response system

**AI Behavior Implementation:**

#### Kill Threshold Monitoring
```lua
function BattleCommander:registerHuntKill(pname, initiatorUnit)
    self.huntKills[pname] = (self.huntKills[pname] or 0) + 1
    
    if self.huntKills[pname] >= self.huntThreshold 
       and not self.huntDone[pname] then
        local roll = math.random(100)
        if roll < 10 then  -- 10% chance to spawn hunters
            self.huntDone[pname] = true
            self:_spawnHunterForPlayer(pname, initiatorUnit)
        end
    end
end
```

#### Dynamic Interceptor Spawning
```lua
function BattleCommander:_spawnHunterForPlayer(pname, unit)
    local home, spots = self:_pickHunterBase(unit:GetCoordinate(), 
                                            AIRBASE.TerminalType.OpenMedOrBig, 2)
    
    local template = Era=='Coldwar' and 'RED_MIG23_TEMPLATE' or 'RED_MIG29_TEMPLATE'
    local hunter = SPAWN:NewWithAlias(template, 'HUNTER_'..pname)
    
    hunter:OnSpawnGroup(function(g)
        Hunt = FLIGHTGROUP:New(g)
        Hunt:SetHomebase(home)
        Intercept = AUFTRAG:NewINTERCEPT(unit:GetGroup())
        Hunt:AddMission(Intercept)
        Hunt:MissionStart(Intercept)
    end)
end
```

## AI Decision Making Parameters

### Strategic Parameters

#### Zone Control Logic
```lua
-- Zone capture conditions
condition = function() 
    return zones.incirlik.wasBlue  -- Requires control of Incirlik
end

-- Urgent mission triggers
urgent = zones.target.side == 0   -- Zone is neutral/contested
```

#### Mission Priority System
```lua
-- Priority factors
{
    spawnDelayFactor = 1.5,    -- Spawn timing multiplier
    diceChance = 50,           -- Execution probability (%)
    urgent = true,             -- High priority flag
    condition = function()     -- Conditional execution
}
```

### Tactical Parameters

#### Combat Behavior
```lua
-- Weapon expenditure
expendAmmount = AI.Task.WeaponExpend.ALL
weaponType = Weapon.flag.AnyWeapon

-- Attack patterns
groupAttack = false  -- Individual unit attacks
```

#### Movement Behavior
```lua
-- Patrol patterns
{
    id = 'Orbit',
    params = {
        pattern = 'Circle',
        point = {x = point.x, y = point.z},
        altitude = 6000
    }
}
```

## AI Response Systems

### 1. Dynamic Threat Response
- **Escalating Force**: AI responds to player success with increased opposition
- **Adaptive Tactics**: Changes strategies based on player behavior
- **Resource Allocation**: Prioritizes threats based on strategic value

### 2. Coalition Coordination
- **Supply Chain Management**: Intelligent logistics routing
- **Mutual Support**: Zones support each other based on strategic relationships
- **Resource Sharing**: Coordinated use of coalition assets

### 3. Player Interaction
- **Reward System**: Credits and statistics tracking
- **Hunter System**: Dynamic threat response to successful players
- **Communication**: Real-time battlefield updates and warnings

## AI Configuration

### Era-Specific Behavior
```lua
-- Modern era equipment
Era = 'Modern'
template = 'RED_MIG29_TEMPLATE'

-- Cold War era equipment  
Era = 'Coldwar'
template = 'RED_MIG23_TEMPLATE'
```

### Difficulty Scaling
```lua
-- Spawn timing adjustments
spawnDelayFactor = 1.5  -- Slower spawns for easier gameplay

-- Mission probability
diceChance = 50  -- 50% chance of mission execution
```

## Performance Considerations

### AI Optimization
- **Scheduled Updates**: AI decisions made on timers to reduce CPU load
- **Conditional Execution**: Missions only run when conditions are met
- **Resource Management**: Efficient use of DCS engine resources

### Scalability
- **Dynamic Group Management**: Groups spawned/despawned based on need
- **Zone-Based Processing**: AI calculations limited to active zones
- **Player-Specific Systems**: Hunter AI only active for relevant players

## Future AI Enhancements

### Potential Improvements
1. **Machine Learning Integration**: Adaptive AI based on player patterns
2. **Advanced Pathfinding**: More sophisticated route planning
3. **Coalition AI**: Inter-coalition cooperation and competition
4. **Weather Integration**: AI adaptation to weather conditions
5. **Economic AI**: More sophisticated resource management

### Extension Points
- **Custom Mission Types**: New AI behavior patterns
- **Advanced Targeting**: More sophisticated threat assessment
- **Strategic Planning**: Long-term campaign planning AI
- **Player Profiling**: Personalized AI responses 