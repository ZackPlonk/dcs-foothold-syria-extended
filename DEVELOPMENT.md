# Development Guide - Foothold Syria Extended

## Overview

This guide provides information for developers who want to extend or modify the Foothold Syria Extended mission.

## Project Structure

### Core Scripts

#### `footholdSyriaSetup.lua`
**Purpose**: Main mission configuration and initialization
**Key Components**:
- Zone definitions and upgrades
- Era-specific equipment swapping
- Battle Commander initialization
- Zone Commander setup

**Key Functions**:
- `upgrades` table: Defines unit types for each zone type
- `zones` table: Zone definitions with properties
- `flavor` table: Zone descriptions and waypoint information

**Modification Points**:
- Add new zone types in `upgrades` table
- Create new zones in `zones` table
- Modify era-specific equipment in `cwSwap` and `SamSwap` tables

#### `zoneCommander_moose.lua`
**Purpose**: Zone management and AI behavior
**Key Components**:
- Zone capture mechanics
- AI group spawning and management
- Supply line management
- Dynamic mission generation

**Key Functions**:
- `ZoneCommander:new()`: Create new zones
- `GroupCommander:new()`: Define AI groups
- `Respawn.Group()`: Spawn AI groups
- `CustomZone:isInside()`: Zone boundary checking

**Modification Points**:
- Add new AI mission types
- Modify zone capture logic
- Enhance AI behavior patterns

#### `WelcomeMessage_Syria_EXTENDED.lua`
**Purpose**: Player interface and communication systems
**Key Components**:
- ATIS integration
- Callsign management
- Radio menus
- Static object management

**Key Functions**:
- `GatherStaticDetails()`: Collect static object information
- `RespawnStaticsForAirbase()`: Manage FOB static objects
- `findOrAssignSlot()`: Player slot assignment

**Modification Points**:
- Add new airfields to ATIS system
- Modify callsign assignment logic
- Add new radio menu options

#### `MA_CTLD_SY_Extended.lua`
**Purpose**: Logistics and cargo transport system
**Key Components**:
- Helicopter cargo transport
- FARP construction
- Troop deployment
- Vehicle transport

**Key Functions**:
- `Foothold_ctld:AddTroopsCargo()`: Define troop types
- `Foothold_ctld:AddCratesCargo()`: Define cargo types
- `BuildAFARP()`: FARP construction logic
- `addCTLDZonesForBlueControlled()`: Dynamic zone activation

**Modification Points**:
- Add new cargo types
- Modify transport capabilities
- Add new FARP types

## Adding New Features

### Adding a New Zone

1. **Define Zone Type** (in `footholdSyriaSetup.lua`):
```lua
upgrades.newZoneType = {
    blue = {'blueInfantry', 'blueArmor', 'bluePD2'},
    red = {'redInfantry', 'Red Armor Group2', 'Red SAM SHORAD SA-8'}
}
```

2. **Create Zone Instance**:
```lua
newzone = ZoneCommander:new({
    zone='New Zone Name', 
    side=0, -- 0=neutral, 1=red, 2=blue
    level=5, 
    upgrades=upgrades.newZoneType, 
    crates={}, 
    flavorText='Zone description',
    NeutralAtStart=true
})
```

3. **Add AI Groups** (optional):
```lua
newzone:addGroups({
    GroupCommander:new({
        name='newzone-supply-target-blue', 
        mission='supply', 
        targetzone='Target Zone'
    })
})
```

### Adding New Cargo Types

1. **Define Cargo** (in `MA_CTLD_SY_Extended.lua`):
```lua
Foothold_ctld:AddCratesCargo("New Vehicle(2 cr)", {"CTLD_CARGO_NewVehicle"}, CTLD_CARGO.Enum.VEHICLE, 2, 1500, 5, "Category")
```

2. **Set Unit Capabilities**:
```lua
Foothold_ctld:SetUnitCapabilities("NewAircraft", true, true, 2, 8, 15, 1000)
```

3. **Add to Spawn Limits**:
```lua
local MAX_AT_SPAWN = {
    ["New Vehicle(2 cr)"] = 1,
    -- ... other entries
}
```

### Adding New AI Mission Types

1. **Define Mission** (in `footholdSyriaSetup.lua`):
```lua
GroupCommander:new({
    name='zone-mission-target', 
    mission='newMissionType', 
    targetzone='Target Zone',
    condition = function() return someCondition end,
    urgent = function() return isUrgent end
})
```

2. **Implement Mission Logic** (in `zoneCommander_moose.lua`):
```lua
-- Add mission type handling in the appropriate function
if mission == 'newMissionType' then
    -- Mission-specific logic
end
```

## Era Support

### Modern Era
- Uses advanced SAM systems (SA-10, SA-11, SA-15, SA-19)
- Modern aircraft and equipment
- Full capabilities enabled

### Cold War Era
- Uses period-appropriate equipment (SA-2, SA-3, SA-6, SA-8)
- Limited aircraft types
- Historical accuracy considerations

### Adding Era-Specific Content

1. **Equipment Swapping**:
```lua
local eraSwap = {
    ['ModernUnit'] = 'ColdWarUnit',
    ['ModernSAM'] = 'ColdWarSAM'
}
```

2. **Conditional Loading**:
```lua
if Era == 'Coldwar' then
    -- Load Cold War specific content
else
    -- Load Modern content
end
```

## Testing and Debugging

### Debug Output
- Use `env.info()` for general logging
- Use `BASE:I()` for MOOSE framework logging
- Check DCS logs for errors

### Common Issues
1. **Zone Not Capturing**: Check zone boundaries and unit presence
2. **AI Not Spawning**: Verify group templates exist in mission
3. **CTLD Not Working**: Check helicopter capabilities and zone activation
4. **Save/Load Issues**: Verify file paths and permissions

### Testing Checklist
- [ ] Zone capture mechanics work
- [ ] AI groups spawn correctly
- [ ] CTLD logistics function properly
- [ ] Era switching works as expected
- [ ] Save/load system functions
- [ ] Multiplayer compatibility verified

## Best Practices

### Code Organization
- Keep related functionality in the same file
- Use descriptive variable and function names
- Add comments for complex logic
- Follow existing code style

### Performance Considerations
- Minimize frequent function calls
- Use efficient data structures
- Avoid unnecessary object creation
- Cache frequently accessed data

### Compatibility
- Test with different DCS versions
- Verify MOOSE framework compatibility
- Check CTLD script version requirements
- Test multiplayer functionality

## Resources

### DCS Documentation
- [DCS Scripting Engine](https://wiki.hoggitworld.com/view/DCS_scripting_engine)
- [MOOSE Framework](https://github.com/FlightControl-Master/MOOSE)
- [CTLD Script](https://github.com/ciribob/DCS-CTLD)

### Community Resources
- DCS Forums
- Hoggit Discord
- Mission Development Communities

## Contributing

When contributing to this project:
1. Follow the existing code style
2. Test thoroughly before submitting
3. Document new features
4. Update this guide as needed
5. Consider backward compatibility

---

For questions or support, refer to the main README.md or community resources. 