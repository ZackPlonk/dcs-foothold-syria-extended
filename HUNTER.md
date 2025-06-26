# Hunter Feature System

## Overview

The Hunter feature is a dynamic AI response system that spawns enemy interceptors to hunt down players who have achieved a certain number of kills. It's designed to add challenge and escalation to the gameplay, creating a responsive difficulty system that scales with player performance.

## Core Components

### 1. Initialization

The hunter system is initialized during mission setup with a random kill threshold:

```lua
local HuntNumber = math.random(4,7)  -- Random threshold between 4-7 kills
bc:initHunter(HuntNumber)
```

**Configuration:**
- **Threshold Range**: 4-7 kills (randomized per mission)
- **Default Fallback**: 9999 kills (if threshold not specified)
- **Data Structures**: 
  - `huntKills` - Tracks kills per player
  - `huntDone` - Prevents multiple spawns per player
  - `huntBases` - Available enemy airbases

### 2. Kill Tracking System

The system tracks player kills through the `registerHuntKill()` function with specific restrictions:

```lua
function BattleCommander:registerHuntKill(pname, initiatorUnit)
    -- Only counts kills from certain unit types
    if d and (d.category == Unit.Category.HELICOPTER or d.attributes.Helicopters) then return end
    if t=="A-10C_2" or t=="A-10A" or t=="AV8BNA" then return end
    
    self.huntKills[pname] = (self.huntKills[pname] or 0) + 1
```

**Kill Restrictions:**
- ❌ **Helicopter kills** - Don't count toward threshold
- ❌ **A-10C_2 kills** - Don't count toward threshold  
- ❌ **A-10A kills** - Don't count toward threshold
- ❌ **AV8BNA kills** - Don't count toward threshold
- ✅ **Ground unit kills** - Count toward threshold
- ✅ **SAM kills** - Count toward threshold
- ✅ **Infantry kills** - Count toward threshold

### 3. Hunter Trigger Logic

When a player reaches the kill threshold, the system evaluates whether to spawn hunters:

```lua
if self.huntKills[pname] >= self.huntThreshold and not self.huntDone[pname] then
    local roll = math.random(100)
    if roll < 10 then  -- 10% chance to spawn hunters
        self.huntDone[pname] = true
        self:_spawnHunterForPlayer(pname, initiatorUnit)
    end
end
```

**Trigger Conditions:**
- Player kill count ≥ threshold
- Player hasn't already triggered hunters (`huntDone[pname]` is false)
- 10% random chance to spawn (prevents predictable timing)

### 4. Base Selection Algorithm

The system intelligently selects an appropriate enemy airbase:

```lua
function BattleCommander:_pickHunterBase(coord, termType, need)
    local min = 40*1852  -- Minimum 40nm distance from player
    -- Sorts bases by distance, prioritizes bases within range
    -- Ensures 2 adjacent parking spots are available
end
```

**Base Selection Criteria:**
- **Distance**: Minimum 40nm from player location
- **Coalition**: Must be enemy-controlled (side == 1)
- **Type**: Must be an airdrome (not helipad)
- **Parking**: Requires 2 adjacent parking spots
- **Priority**: Closest suitable base first

### 5. Aircraft Spawning

The system spawns era-appropriate interceptors:

```lua
local template = Era=='Coldwar' and 'RED_MIG23_TEMPLATE' or 'RED_MIG29_TEMPLATE'
local hunter = SPAWN:NewWithAlias(template, 'HUNTER_'..pname)
```

**Era-Specific Aircraft:**
- **Cold War Era**: MiG-23 interceptors
- **Modern Era**: MiG-29 interceptors
- **Spawn Count**: 2 aircraft per hunter group
- **Naming**: `HUNTER_[PlayerName]` format

### 6. Mission Assignment

Hunters are assigned specific intercept missions:

```lua
Hunt = FLIGHTGROUP:New(g)
Hunt:SetHomebase(home)
Intercept = AUFTRAG:NewINTERCEPT(unit:GetGroup())
Hunt:AddMission(Intercept)
Intercept:SetMissionAltitude(25000)  -- 25,000 feet
Intercept:SetMissionSpeed(500)       -- 500 knots
Hunt:MissionStart(Intercept)
```

**Mission Parameters:**
- **Type**: Intercept mission targeting player
- **Altitude**: 25,000 feet
- **Speed**: 500 knots
- **Takeoff**: Hot takeoff from parking spots
- **Behavior**: Direct engagement with player

### 7. Player Notification System

When hunters are spawned, players receive comprehensive warnings:

```lua
trigger.action.outTextForCoalition(2, pname..', Enemy is scrambling 2 jets to hunt you down!', 30)
local BlueVictory = USERSOUND:New("Watch your six.ogg")
local PlayerUnit = CLIENT:FindByPlayerName(pname)
if PlayerUnit then
    BlueVictory:ToClient(PlayerUnit)
end
```

**Notification Elements:**
- **Text Message**: 30-second coalition-wide alert
- **Audio Warning**: "Watch your six.ogg" sound file
- **Targeted Delivery**: Sent directly to the hunted player
- **Message Content**: Clear indication of threat escalation

## Reset Conditions

The hunter system resets under various conditions:

### Player Events
```lua
-- Player ejects
if Hunt then
    bc.huntDone[pname] = nil
end

-- Player dies
if Hunt then 
    bc.huntDone[pname] = nil
end

-- Player lands successfully
if Hunt then
    bc.huntDone[pname] = nil
end
```

### Hunter Events
```lua
-- Hunters are destroyed
function Hunt:OnAfterDead(from,event,to)
    bc.huntDone[pname] = nil
    bc.huntKills[pname] = 0
end

-- Hunters land (auto-cleanup)
function Hunt:OnAfterLanded(From, Event, To)
    self:ScheduleOnce(5, function() self:Destroy() end)
end
```

**Reset Triggers:**
- Player ejects from aircraft
- Player aircraft is destroyed
- Player successfully lands at friendly base
- Hunter aircraft are destroyed
- Hunter aircraft land (5-second delay then cleanup)

## Strategic Impact

### Difficulty Escalation
- **Dynamic Scaling**: Challenge increases with player success
- **Unpredictable Timing**: 10% chance prevents predictable patterns
- **Skill-Based**: Only affects high-performing players
- **Balanced Response**: Maintains game balance without overwhelming

### Tactical Considerations
- **Awareness**: Players must monitor their kill count
- **Risk Assessment**: Forces strategic decisions about engagement
- **Mission Planning**: Affects route selection and timing
- **Resource Management**: May require escort or support

### Historical Accuracy
- **Era-Appropriate**: Uses period-correct aircraft
- **Realistic Behavior**: Simulates actual air defense responses
- **Coalition Balance**: Maintains Red vs Blue force balance
- **Geographic Logic**: Uses nearby enemy airbases

## Technical Implementation

### Performance Optimization
- **Conditional Execution**: Only active for relevant players
- **Efficient Tracking**: Minimal overhead for kill counting
- **Smart Cleanup**: Automatic removal of destroyed hunters
- **Resource Management**: Limits concurrent hunter groups

### Error Handling
- **Base Validation**: Checks for available parking spots
- **Unit Validation**: Verifies player unit still exists
- **Distance Checks**: Ensures minimum separation requirements
- **Fallback Logic**: Graceful handling of edge cases

### Integration Points
- **Event System**: Integrates with DCS world events
- **Player System**: Tracks individual player statistics
- **Zone System**: Uses zone-based base selection
- **Era System**: Adapts to mission time period

## Configuration Options

### Threshold Settings
```lua
-- Mission startup
local HuntNumber = math.random(4,7)  -- Adjustable range
bc:initHunter(HuntNumber)

-- Per-player override (if needed)
self.huntThreshold = customThreshold
```

### Spawn Probability
```lua
-- Current: 10% chance
if roll < 10 then
    -- Spawn hunters
end

-- Adjustable: Change 10 to desired percentage
if roll < spawnChance then
    -- Spawn hunters
end
```

### Distance Parameters
```lua
-- Minimum distance from player (40nm)
local min = 40*1852

-- Maximum search attempts
if tried == 3 then return nil end
```

### Mission Parameters
```lua
-- Altitude (25,000 feet)
Intercept:SetMissionAltitude(25000)

-- Speed (500 knots)
Intercept:SetMissionSpeed(500)

-- Cleanup delay (5 seconds)
self:ScheduleOnce(5, function() self:Destroy() end)
```

## Future Enhancements

### Potential Improvements
1. **Variable Thresholds**: Different thresholds for different player skill levels
2. **Escalating Response**: Multiple hunter waves for persistent threats
3. **Coordination**: Multiple bases launching coordinated attacks
4. **Intelligence**: Hunters that learn from player tactics
5. **Weather Integration**: Hunters affected by weather conditions
6. **Fuel Management**: Hunters with realistic fuel limitations

### Advanced Features
1. **Player Reputation**: System that tracks player threat level over time
2. **Dynamic Aircraft Selection**: More sophisticated aircraft choice based on threat
3. **Mission Variety**: Different mission types beyond simple intercept
4. **Alliance Coordination**: Hunters that work with other AI systems
5. **Player Feedback**: More detailed notifications about hunter status

## Troubleshooting

### Common Issues
1. **Hunters Not Spawning**: Check kill threshold and spawn probability
2. **No Suitable Bases**: Verify enemy airbases are active and have parking
3. **Performance Issues**: Monitor number of concurrent hunter groups
4. **Audio Not Playing**: Ensure "Watch your six.ogg" file is present

### Debug Information
```lua
-- Enable debug logging
env.info(string.format("HUNT-DBG: roll=%d for %s", roll, pname))
env.info(string.format('HUNT-DBG: only %s free spots @%s', spots and #spots or 0, home:GetName()))
```

## Conclusion

The Hunter feature creates a dynamic, responsive AI system that escalates challenge based on player performance while maintaining historical accuracy and game balance. It adds strategic depth to missions and ensures that skilled players face appropriate opposition without overwhelming newer players. 