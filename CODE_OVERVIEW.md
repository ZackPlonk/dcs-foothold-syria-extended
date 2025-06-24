# Code Overview - Foothold Syria Extended

## Architecture Overview

The mission uses a modular architecture with several key systems working together:

1. **Battle Commander** - Central mission management
2. **Zone Commander** - Individual zone control and AI management
3. **CTLD System** - Logistics and cargo transport
4. **Player Interface** - Communication and information systems
5. **EWRS** - Early Warning Radar System
6. **Support Scripts** - Various utility and enhancement systems

## File-by-File Feature Mapping

### Core Mission Files

#### `footholdSyriaSetup.lua` (4,305 lines)
**Primary Purpose**: Mission initialization and core configuration

**Key Features**:
- Zone type definitions and upgrade paths
- Era-specific equipment swapping
- Battle Commander initialization
- Zone creation and configuration
- AI group mission definitions

**Important Data Structures**:

```lua
-- Zone upgrade definitions
upgrades = {
    airfield = {
        blue = {'blueInfantry','bluePD2', 'bluePD1'},
        red = {'redInfantry', 'Red SAM SHORAD SA-8', ...}
    },
    -- ... other zone types
}

-- Era-specific equipment swapping
local cwSwap = {
    ['Red Armor Group2'] = 'Red Armor Group6',
    ['bluePD2'] = 'bluePD2 Coldwar',
    -- ... other swaps
}

-- Zone flavor text and descriptions
flavor = {
    akrotiri = 'WPT 1\nStart zone',
    incirlik = 'WPT 10\n',
    -- ... zone descriptions
}

-- Zone definitions with properties
zones = {
    akrotiri = ZoneCommander:new({
        zone='Akrotiri', 
        side=2, -- 2=blue, 1=red, 0=neutral
        level=5, 
        upgrades=upgrades.airfield,
        crates={}, 
        flavorText=flavor.akrotiri
    }),
    -- ... other zones
}
```

**Key Parameters**:
- `Era` - Controls Modern/Cold War equipment
- `NoSA10AndSA11` - Disables advanced SAM systems
- `Hunt` - Enables aggressive AI behavior
- `bc` - Battle Commander instance

**Design Patterns**:
- **Factory Pattern**: Zone types defined as templates
- **Strategy Pattern**: Era-specific equipment swapping
- **Observer Pattern**: Zone state changes trigger events

---

#### `zoneCommander_moose.lua` (8,518 lines)
**Primary Purpose**: Zone management, AI spawning, and dynamic mission generation

**Key Features**:
- Zone capture mechanics
- AI group spawning and management
- Supply line management
- Dynamic mission generation
- Zone boundary detection
- Spawn zone management

**Important Data Structures**:

```lua
-- Custom zone implementation
CustomZone = {}
function CustomZone:getByName(name)
    -- Zone boundary detection
    -- Spawn zone management
    -- Building detection
end

-- Spawn counter for unique group names
spawnCounter = {}

-- Used spawn zones tracking
USED_SUB_ZONES = {}

-- Zone Commander class
ZoneCommander = {
    zone = "ZoneName",
    side = 0, -- 0=neutral, 1=red, 2=blue
    level = 5,
    upgrades = upgrades.airfield,
    groups = {},
    -- ... other properties
}
```

**Key Functions**:
- `CustomZone:spawnGroup()` - Spawns AI groups in zones
- `CustomZone:getRandomUnusedSpawnZone()` - Manages spawn locations
- `Respawn.Group()` - Respawns destroyed groups
- `CustomZone:isInside()` - Zone boundary checking

**Design Patterns**:
- **Object Pool Pattern**: Spawn zone reuse
- **State Machine**: Zone ownership states
- **Command Pattern**: AI mission definitions

---

#### `WelcomeMessage_Syria_EXTENDED.lua` (1,374 lines)
**Primary Purpose**: Player interface, communication, and information systems

**Key Features**:
- ATIS (Automatic Terminal Information Service)
- Callsign management and assignment
- Radio menus and communication
- Static object management for FOBs
- Weather and environmental information
- Carrier operations support

**Important Data Structures**:

```lua
-- ATIS zone definitions
local atisZones = {
    ["Incirlik"] = {airbaseName = AIRBASE.Syria.Incirlik},
    ["Hatay"] = {airbaseName = AIRBASE.Syria.Hatay},
    -- ... other airbases
}

-- Aircraft assignments by type
local aircraftAssignments = {
    ["F.16C"] = {
        ["Viper1"] = {
            IFFs = {1000, 1001, 1002, 1003},
            assignments = {}
        },
        -- ... other callsigns
    },
    -- ... other aircraft types
}

-- FOB static object definitions
airbaseStatics = {
    ["FOB HOTEL"] = {
        "FarpHotelammo", "Farphotelfuel", "Farphoteltent1",
        -- ... other static objects
    },
    -- ... other FOBs
}

-- Zone and player tracking
local zoneAssignments = {}
local playerZoneVisits = {}
local globalCallsignAssignments = {}
```

**Key Functions**:
- `GatherStaticDetails()` - Collects static object information
- `RespawnStaticsForAirbase()` - Manages FOB static objects
- `findOrAssignSlot()` - Player slot assignment
- `sendATISInformation()` - Provides airfield information
- `getCarrierInfo()` - Carrier operations support

**Design Patterns**:
- **Observer Pattern**: Player slot changes
- **Factory Pattern**: Static object creation
- **Singleton Pattern**: Global assignment tracking

---

#### `MA_CTLD_SY_Extended.lua` (879 lines)
**Primary Purpose**: Cargo Transport Logistics and Deployment system

**Key Features**:
- Helicopter cargo transport
- FARP (Forward Arming and Refueling Point) construction
- Troop deployment and management
- Vehicle and equipment transport
- Dynamic zone activation
- Cargo stock management

**Important Data Structures**:

```lua
-- CTLD configuration
Foothold_ctld = CTLD:New(coalition.side.BLUE, {
    "CH.47", "UH.1H", "Hercules", "8MT", "Bronco.OV", 
    "UH.60L", "Mi.24P", "OH58D"
}, "Lufttransportbrigade I")

-- Cargo definitions
Foothold_ctld:AddTroopsCargo("technician Solider", {
    "CTLD_TROOPS_Engineers"
}, CTLD_CARGO.Enum.ENGINEERS, 1, 80, 5)

Foothold_ctld:AddCratesCargo("ATGM Mephisto(2 cr)", {
    "CTLD_CARGO_Mephisto"
}, CTLD_CARGO.Enum.VEHICLE, 2, 1500, 5, "ANTI TANK")

-- Unit capabilities
Foothold_ctld:SetUnitCapabilities("UH-1H", true, true, 1, 8, 15, 800)
-- Parameters: aircraft, canTransport, canLoad, minCrates, maxCrates, maxDistance, maxWeight

-- Spawn limits
local MAX_AT_SPAWN = {
    ["Squad 8"] = 0,
    ["Platoon 16"] = 0,
    ["Anti-Air Soldiers"] = 1,
    -- ... other limits
}

-- FARP tracking
local BuiltFARPCoordinates = {}
local SpawnedFARPsFromSave = 0
```

**Key Functions**:
- `BuildAFARP()` - Constructs forward bases
- `addCTLDZonesForBlueControlled()` - Dynamic zone activation
- `Foothold_ctld:OnAfterCratesBuild()` - Cargo deployment handling
- `SaveFARPS()` - Persistence system

**Design Patterns**:
- **Builder Pattern**: FARP construction
- **Observer Pattern**: Zone ownership changes
- **Factory Pattern**: Cargo type creation

---

### Support and Enhancement Scripts

#### `EWRS.lua` (621 lines)
**Primary Purpose**: Early Warning Radar System

**Key Features**:
- Real-time threat detection and reporting
- Bearing/Range/Altitude (BRA) information
- Dynamic radar network
- F10 radio menu integration
- Imperial/metric unit support
- Bogey dope functionality

**Important Data Structures**:

```lua
-- EWRS configuration
ewrs = {
    messageUpdateInterval = 60,
    messageDisplayTime = 15,
    defaultReference = "self", -- "self" or "bulls"
    defaultMeasurements = "imperial", -- "imperial" or "metric"
    enableBlueTeam = true,
    enableRedTeam = false,
    maxThreatDisplay = 5,
    allowBogeyDope = true,
    allowFriendlyPicture = true
}

-- Aircraft categories
ewrs.HELO = 1
ewrs.ATTACK = 2
ewrs.FIGHTER = 3

-- Range options
ewrs.rangeOptions = { 
    km = {10,20,40,60,80,100,150}, 
    nm = {5,10,20,40,60,80,100} 
}
```

**Key Functions**:
- `ewrs.buildThreatTable()` - Threat analysis
- `ewrs.outText()` - Message formatting
- `ewrs.getAspect()` - Aspect angle calculation
- `ewrs.buildF10Menu()` - Radio menu generation

---

#### `Foothold_SY_MANTIS.lua`
**Primary Purpose**: MANTIS air defense system integration

**Features**:
- Automated air defense coordination
- Threat prioritization
- Engagement management

---

#### `Hercules_Cargo.lua`
**Primary Purpose**: Fixed-wing cargo transport system

**Features**:
- Hercules aircraft cargo operations
- Parachute drop capabilities
- Large cargo transport

---

#### `Destroy STATIC SYRIA EXTENDED.lua`
**Primary Purpose**: Static object destruction and management

**Features**:
- Dynamic static object removal
- Building destruction effects
- Environmental damage

---

#### `Zeus.lua`
**Primary Purpose**: Zeus mission editor integration

**Features**:
- Mission editor connectivity
- Dynamic mission modification
- Real-time mission control

---

#### `noFlyZone.lua`
**Primary Purpose**: Restricted airspace management

**Features**:
- No-fly zone enforcement
- Airspace violation detection
- Automatic warnings and penalties

---

#### `weaponslist.lua`
**Primary Purpose**: Weapon system management

**Features**:
- Weapon availability tracking
- Loadout management
- Ammunition logistics

---

## High-Level Design Patterns

### 1. **Modular Architecture**
Each major system is contained in its own file with clear interfaces:
- Core mission logic (`footholdSyriaSetup.lua`)
- Zone management (`zoneCommander_moose.lua`)
- Player interface (`WelcomeMessage_Syria_EXTENDED.lua`)
- Logistics (`MA_CTLD_SY_Extended.lua`)

### 2. **Event-Driven Design**
Systems communicate through events and callbacks:
- Zone capture triggers AI responses
- Player actions trigger interface updates
- Cargo deployment triggers FARP construction
- Threat detection triggers EWRS analysis

### 3. **State Management**
Persistent state across mission sessions:
- Zone ownership and levels
- Built FARP locations
- Player assignments and preferences
- Cargo stock levels

### 4. **Configuration-Driven**
Mission behavior controlled through data structures:
- Zone types and upgrades
- Era-specific equipment
- AI mission definitions
- Cargo types and capabilities

## Key Parameters and Configuration

### Mission Parameters
```lua
-- Era selection
Era = 'Modern' -- or 'Coldwar'

-- Difficulty settings
NoSA10AndSA11 = true -- Disables advanced SAMs
Hunt = true -- Aggressive AI behavior

-- Save system
local filepath = (Era == 'Coldwar') and 
    'footholdSyria_Extended_0.1_coldwar.lua' or 
    'footholdSyria_Extended_0.1.lua'
```

### Zone Configuration
```lua
-- Zone properties
{
    zone = "ZoneName",
    side = 0, -- 0=neutral, 1=red, 2=blue
    level = 5, -- Upgrade level
    upgrades = upgrades.airfield, -- Unit types
    crates = {}, -- Cargo storage
    flavorText = "Description",
    income = 0.5, -- Credits per hour
    NeutralAtStart = true -- Initial state
}
```

### AI Mission Configuration
```lua
-- Group mission definition
{
    name = 'zone-mission-target',
    mission = 'supply', -- supply, attack, patrol
    targetzone = 'Target Zone',
    condition = function() return someCondition end,
    urgent = function() return isUrgent end,
    ForceUrgent = true,
    spawnDelayFactor = 2
}
```

### CTLD Configuration
```lua
-- Cargo definition
{
    name = "Cargo Name",
    templates = {"Template1", "Template2"},
    cargoType = CTLD_CARGO.Enum.VEHICLE,
    crates = 2,
    weight = 1500,
    time = 5,
    category = "Category"
}

-- Unit capabilities
{
    aircraft = "AircraftType",
    canTransport = true,
    canLoad = true,
    minCrates = 1,
    maxCrates = 8,
    maxDistance = 15,
    maxWeight = 800
}
```

## Data Flow and Dependencies

### 1. **Initialization Flow**
```
footholdSyriaSetup.lua
    ↓ (creates zones)
zoneCommander_moose.lua
    ↓ (manages AI)
WelcomeMessage_Syria_EXTENDED.lua
    ↓ (handles players)
MA_CTLD_SY_Extended.lua
    ↓ (manages logistics)
Support Scripts
```

### 2. **Runtime Interactions**
- **Zone Capture** → AI Response → CTLD Zone Activation
- **Player Join** → Callsign Assignment → ATIS Integration
- **Cargo Deployment** → FARP Construction → Static Object Spawning
- **Threat Detection** → EWRS Analysis → Player Notifications

### 3. **Persistence System**
- Mission state saved to CSV files
- FARP locations preserved across sessions
- Player preferences maintained
- Cargo stock levels tracked

## Extension Points

### Adding New Features
1. **New Zone Types**: Add to `upgrades` table in `footholdSyriaSetup.lua`
2. **New Cargo Types**: Add to CTLD system in `MA_CTLD_SY_Extended.lua`
3. **New AI Missions**: Extend mission types in `zoneCommander_moose.lua`
4. **New Player Features**: Add to interface in `WelcomeMessage_Syria_EXTENDED.lua`

### Configuration Changes
1. **Era Support**: Modify equipment swapping tables
2. **Difficulty**: Adjust AI behavior parameters
3. **Balance**: Modify zone levels and upgrade paths
4. **Performance**: Optimize spawn and update intervals

This architecture provides a solid foundation for extending the mission while maintaining the core dynamic territory control gameplay that makes it engaging for multiplayer sessions. 