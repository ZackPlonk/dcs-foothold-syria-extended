# SAM (Surface-to-Air Missile) System - Foothold Syria Extended

## Overview

The Foothold Syria Extended mission implements a sophisticated air defense system featuring multiple SAM types, radar networks, and dynamic threat response capabilities. The system includes both static and mobile SAM sites, early warning radar networks, and integrated air defense coordination.

## Architecture

### Multi-Layer Air Defense System

1. **Strategic SAM Sites** - Long-range air defense (SA-2, SA-3, SA-5, SA-10, SA-11)
2. **Tactical SAM Sites** - Medium-range air defense (SA-6, SA-8, SA-15)
3. **SHORAD Systems** - Short-range air defense (SA-13, SA-19, AAA)
4. **Early Warning Radar Network** - Detection and tracking systems
5. **MANTIS Integration** - Advanced SAM coordination system

## SAM Systems Implemented

### Strategic SAM Systems

#### SA-2 Guideline (S-75)
**Purpose**: Long-range strategic air defense
**Range**: 45-75 km
**Altitude**: Up to 30,000m
**Implementation**:
```lua
-- Fixed strategic sites
'Red SAM SA-2 Fixed Jordandefence'
'Red SAM SA-2 Fixed Jordandefence-1'
'Red SAM SA-2 Fixed Jordandefence-2'
'Red SAM SA-2 Fixed juliett'
'Red SAM SA-2 Fixed Hotel'
'Red SAM SA-2 Fixed India'
```

#### SA-3 Goa (S-125)
**Purpose**: Medium-range air defense
**Range**: 15-25 km
**Altitude**: Up to 18,000m
**Implementation**:
```lua
-- Fixed and mobile sites
'Red SAM SA-3 Fixed Bravo'
'Red SAM SA-3 HiddenGroup Fixed'
'Red SAM SA-3 Papa Fixed'
'Red SAM SA-3 Fixed Incirlikdefence'
```

#### SA-5 Gammon (S-200)
**Purpose**: Very long-range strategic air defense
**Range**: 150-300 km
**Altitude**: Up to 40,000m
**Implementation**:
```lua
-- Strategic defense sites
'Red SAM SA-5 Fixed'
```

#### SA-10 Grumble (S-300)
**Purpose**: Advanced long-range air defense
**Range**: 75-150 km
**Altitude**: Up to 30,000m
**Implementation**:
```lua
-- Modern strategic defense
'Red SAM SA-10 Fixed Benguriondefence'
'Red SAM SA-10 Fixed haifadefence'
```

#### SA-11 Gadfly (9K37 Buk)
**Purpose**: Mobile medium-range air defense
**Range**: 30-70 km
**Altitude**: Up to 25,000m
**Implementation**:
```lua
-- Mobile and fixed sites
'Red SAM SA-11'
'Red SAM SA-11 Fixed Papa'
'Red SAM SA-11 Fixed ramatdaviddefence'
'Red SAM SA-11 Fixed Incirlikdefence'
```

### Tactical SAM Systems

#### SA-6 Gainful (2K12 Kub)
**Purpose**: Mobile medium-range air defense
**Range**: 24-30 km
**Altitude**: Up to 14,000m
**Implementation**:
```lua
-- Mobile tactical defense
'Red SAM SA-6 Fixed Delta'
'Red SAM SA-6 Fixed ramatdaviddefence'
'Red SAM SA-6 Papa Fixed'
```

#### SA-8 Gecko (9K33 Osa)
**Purpose**: Mobile short-range air defense
**Range**: 10-15 km
**Altitude**: Up to 5,000m
**Implementation**:
```lua
-- Mobile tactical defense
'Red SAM SHORAD SA-8'
'Red SAM SHORAD SA-8 2'
'Red SAM SHORAD SA-8 Fixed Charlie'
'Red SAM SHORAD SA-8 Fixed delta-2'
'Red SAM SHORAD SA-8 Fixed juliett-2'
'Red SAM SHORAD SA-8 Fixed-juliett'
'Red SAM SHORAD SA-8 Fixed Papa-2'
'Red SAM SHORAD SA-8 Fixed Papa-3'
'Red SAM SHORAD SA-8 Fixed'
'Red SAM SHORAD SA-8 Fixed ramatdaviddefence'
'Red SAM SHORAD SA-8 jordandefence Fixed'
'Red SAM SHORAD SA-8 Fixed HiddenGroup South'
'Red SAM SHORAD SA-8 EWR Group Fixed'
'Red SAM SHORAD SA-8 Fixed BenGurion'
'Red SAM SHORAD Fixed SA-8 Bravo'
```

### SHORAD (Short-Range Air Defense) Systems

#### SA-13 Gopher (9K35 Strela-10)
**Purpose**: Mobile short-range air defense
**Range**: 5-8 km
**Altitude**: Up to 3,500m
**Implementation**:
```lua
-- Mobile SHORAD
'Red SAM SHORAD SA-13'
'Red SAM SA-13 STRELA'
```

#### SA-15 Gauntlet (9K331 Tor)
**Purpose**: Mobile short-range air defense
**Range**: 12-15 km
**Altitude**: Up to 6,000m
**Implementation**:
```lua
-- Mobile SHORAD
'Red SAM SHORAD SA-15'
'Red SAM SHORAD SA-15 2'
'Red SAM SHORAD SA-15 Fixed delta'
'Red SAM SHORAD SA-15 Fixed Bravo'
'Red SAM SHORAD SA-15 Fixed juliett-2'
'Red SAM SHORAD SA-15 Fixed-juliett'
'Red SAM SHORAD SA-15 Fixed india-2'
'Red SAM SHORAD SA-15 Fixed india-3'
'Red SAM SHORAD SA-15 Fixed Hotel'
'Red SAM SHORAD SA-15 SAITE Fixed'
'Red SAM SHORAD SA-15 Fixed SAITE'
'Red SAM SHORAD SA-15 Fixed Charlie'
'Red SAM SHORAD SA-15 Fixed Papa-2'
'Red SAM SHORAD SA-15 Fixed Papa-3'
'Red SAM SHORAD SA-15 Fixed'
'Red SAM SHORAD SA-15 Fixed ramatdaviddefence'
'Red SAM SHORAD SA-15 jordandefence Fixed'
'Red SAM SHORAD SA-15 Fixed HiddenGroup South'
'Red SAM SHORAD SA-15 EWR Group Fixed'
'Red SAM SHORAD SA-15 Fixed BenGurion'
```

#### SA-19 Grison (2K22 Tunguska)
**Purpose**: Mobile short-range air defense with gun system
**Range**: 8-10 km (missiles), 4 km (guns)
**Altitude**: Up to 3,500m
**Implementation**:
```lua
-- Mobile SHORAD with gun system
'Red SAM SHORAD SA-19'
'Red SAM SHORAD SA-19 2'
'Red SAM SHORAD SA-19 Fixed delta'
'Red SAM SHORAD SA-19 Fixed Bravo-3'
'Red SAM SHORAD SA-19 Fixed Hotel'
'Red SAM SHORAD SA-19 Fixed india-3'
'Red SAM SHORAD SA-19 Fixed Benguriondefence'
'Red SAM SHORAD SA-19 Fixed ramatdaviddefence'
'Red SAM SHORAD SA-19 jordandefence Fixed'
'Red SAM SHORAD SA-19 Fixed'
```

### AAA (Anti-Aircraft Artillery) Systems

#### Mobile AAA
**Purpose**: Close-range air defense
**Range**: 2-4 km
**Implementation**:
```lua
-- Mobile AAA systems
'Red SAM AAA'
'Red SAM AAA 2'
'Red SAM AAA 3'
'Red SAM AAA 4'
```

#### Fixed AAA Sites
**Purpose**: Static close-range air defense
**Implementation**:
```lua
-- Fixed AAA positions
'Red SAM AAA Fixed juliett-1'
'Red SAM AAA Fixed juliett-2'
'Red SAM AAA Fixed india-1'
'Red SAM AAA Fixed india-3'
'Red SAM AAA Fixed Hotel'
'Red SAM AAA Fixed SAITE'
'Red SAM AAA Fixed Papa'
'Red SAM AAA Fixed ramatdaviddefence'
'Red SAM AAA jordandefence Fixed'
'Red SAM AAA Fixed incirlikdefence'
'Red SAM AAA Silk Fixed'
```

## MANTIS Integration

### MANTIS SAM System
The mission uses the MANTIS (Modular Air Defense System) for advanced SAM coordination:

```lua
-- MANTIS configuration
mysamSyria = MANTIS:New("Syria", "Red SAM", "Red EWR", "HQ Fixed", "red", true, "Red EWR Awacs")
mysamSyria:SetSAMRange(110)
mysamSyria:SetDetectInterval(10)

-- Scoot zones for mobile SAM systems
ZoneTable_Mantis = SET_ZONE:New():FilterPrefixes("Scoot"):FilterStart()
mysamSyria:AddScootZones(ZoneTable_Mantis, 3, true, "Cone")
mysamSyria:Start()
```

**Key Features**:
- **SAM Range**: 110km detection and engagement range
- **Detection Interval**: 10-second update cycle
- **Scoot Zones**: Mobile SAM repositioning areas
- **Cone Pattern**: Engagement zone configuration

## Early Warning Radar Network

### EWR Systems
**Purpose**: Long-range detection and tracking
**Implementation**:
```lua
-- Fixed EWR sites
'Red EWR'
'Red EWR north Fixed'
'Red EWR Cyprus Fixed'
'Red EWR-southeast Fixed'
'Red EWR-south Fixed'
'Red EWR north Fixed Coldwar'
'Red EWR Cyprus Fixed Coldwar'
'Red EWR-southeast Fixed Coldwar'
'Red EWR-south Fixed Coldwar'
```

### EWRS (Early Warning Radar Script)
Advanced radar coordination system providing:
- **Bearing Range Altitude (BRA)** information
- **Real-time threat assessment**
- **Dynamic radar network management**
- **Player communication systems**

```lua
-- EWRS configuration
ewrs.messageUpdateInterval = 60  -- Update frequency
ewrs.messageDisplayTime = 15     -- Message display duration
ewrs.maxThreatDisplay = 5        -- Max threats shown
ewrs.enableBlueTeam = true       -- Blue team access
ewrs.enableRedTeam = false       -- Red team access
```

## Zone-Based SAM Deployment

### Strategic Defense Zones

#### Major Airbases
```lua
-- Incirlik Defense
incirlikdefence = {
    red = {
        'Red Armor Group5',
        'Red SAM SA-11 Fixed Incirlikdefence',
        'Red SAM SHORAD SA-19 Fixed',
        'Red SAM SHORAD Fixed incirlikdefence'
    }
}
```

#### Strategic Sites
```lua
-- SA-5 Strategic Site
sa5 = {
    red = {
        'Red SAM SA-5 Fixed'
    }
}
```

### Tactical Defense Zones

#### Airfield Defense
```lua
-- Charlie EWR Site
ewrcharlie = {
    red = {
        'Red EWR',
        'Red SAM SHORAD SA-8 Fixed Charlie',
        'Red SAM SHORAD SA-15 Fixed Charlie'
    }
}
```

#### Military Base Defense
```lua
-- Military Base
milbase = {
    red = {
        'redInfantry',
        'Red Armor Group2',
        'Red SAM SHORAD SA-8',
        'Red SAM SHORAD SA-8 2',
        'Red Armor Group3'
    }
}
```

## Era-Specific SAM Configuration

### Modern Era
- **SA-10/SA-11**: Advanced long-range systems
- **SA-15**: Modern SHORAD systems
- **SA-19**: Advanced gun-missile systems

### Cold War Era
- **SA-2/SA-3**: Classic strategic systems
- **SA-6/SA-8**: Tactical systems
- **SA-13**: Basic SHORAD

```lua
-- Era-specific SAM swapping
local SamSwap = {
    ['Red SAM SA-11 Fixed Papa'] = 'Red SAM SA-3 Papa Fixed',
    ['Red SAM SA-10 Fixed Benguriondefence'] = 'Red SAM SA-2 Fixed Benguriondefence',
    ['Red SAM SHORAD SA-15 Fixed delta'] = 'Red SAM SHORAD SA-8 Fixed delta-2'
}
```

## SAM Behavior and AI

### Threat Prioritization
SAM systems prioritize targets based on:
1. **Threat Level**: Aircraft type and capability
2. **Range**: Engagement envelope optimization
3. **Altitude**: Effective engagement zones
4. **Speed**: Target maneuverability

### SEAD (Suppression of Enemy Air Defense) Response
```lua
function BattleCommander:engageSead(tgtzone, groupname, expendAmmount, weapon)
    -- Target SAM radar and launcher units specifically
    if u:hasAttribute('SAM SR') or u:hasAttribute('SAM TR') or u:hasAttribute('IR Guided SAM') then
        -- Direct attack on SAM components
    end
end
```

### Radar Jamming Response
```lua
function BattleCommander:jamRadarsAtZone(groupname, zonename)
    -- Disable SAM radar systems
    if v2:hasAttribute('SAM SR') or v2:hasAttribute('SAM TR') then
        v2:getController():setOption(0,2)  -- Disable radar
        v2:getController():setOption(9,2)  -- Disable tracking
    end
end
```

## CTLD Integration

### Deployable SAM Systems
Players can deploy SAM systems via CTLD:
```lua
-- Deployable SAM systems
Foothold_ctld:AddCratesCargo("Linebacker(2 cr)", {"CTLD_CARGO_Linebacker"}, CTLD_CARGO.Enum.VEHICLE, 2, 1500, 5, "SAM/AAA")
Foothold_ctld:AddCratesCargo("Vulcan (2 cr)", {"CTLD_CARGO_Vulcan"}, CTLD_CARGO.Enum.VEHICLE, 2, 1500, 5, "SAM/AAA")
Foothold_ctld:AddCratesCargo("HAWK Site (4 cr)", {"CTLD_CARGO_HAWKSite"}, CTLD_CARGO.Enum.FOB, 4, 1900, 5, "SAM/AAA")
Foothold_ctld:AddCratesCargo("Nasam Site(4 cr)", {"CTLD_CARGO_NasamsSite"}, CTLD_CARGO.Enum.FOB, 4, 1900, 5, "SAM/AAA")
```

## Performance Considerations

### SAM System Optimization
- **Detection Intervals**: Balanced for performance vs. realism
- **Engagement Limits**: Prevents overwhelming CPU usage
- **Zone-Based Processing**: Localized threat assessment
- **Dynamic Spawning**: SAM systems spawned based on need

### Scalability Features
- **Conditional Deployment**: SAM systems based on zone control
- **Era-Specific Loading**: Different SAM types per era
- **Mobile Systems**: Dynamic repositioning capabilities
- **Network Coordination**: Integrated radar and SAM coordination

## Future Enhancements

### Potential Improvements
1. **Advanced AI**: More sophisticated threat assessment
2. **Electronic Warfare**: Enhanced ECM/ECCM systems
3. **Network Integration**: Improved SAM coordination
4. **Weather Effects**: SAM performance in different conditions
5. **Maintenance Simulation**: SAM system reliability modeling

### Extension Points
- **New SAM Types**: Additional air defense systems
- **Advanced Tactics**: Complex engagement strategies
- **Player Control**: Direct SAM system control
- **Intelligence Systems**: Enhanced threat analysis 