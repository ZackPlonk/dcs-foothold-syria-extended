# Logistics System - Foothold Syria Extended

## Overview

The Logistics System manages cargo transport, FARP (Forward Arming and Refueling Point) operations, and supply chain mechanics. It uses the CTLD (Cargo Transport Logistics and Deployment) framework to enable dynamic logistics operations across the battlefield.

## Architecture

### Logistics Hierarchy
```
Logistics System
├── CTLD Configuration (cargo types, weights, deployment)
├── FARP System (forward base creation and management)
├── Supply Chains (resource movement between zones)
├── Cargo Transport (helicopter and ground transport)
└── Deployable Units (player-added units to zones)
```

### Core Logistics Properties
```lua
logistics = {
    cargoTypes = {},           -- Available cargo definitions
    farpLocations = {},        -- Active FARP sites
    supplyRoutes = {},         -- Supply chain connections
    transportUnits = {},       -- Available transport units
    deployableUnits = {}       -- Player-deployable units
}
```

## CTLD Configuration

### Cargo Type Definitions
```lua
-- Cargo type structure
cargoType = {
    name = "Cargo Name",       -- Display name
    weight = 5000,            -- Weight in pounds
    container = true,          -- Containerized cargo
    template = "CargoTemplate", -- Spawn template
    category = "Vehicle"       -- Cargo category
}
```

### Cargo Configuration
```lua
-- Blue coalition cargo
Foothold_ctld:AddCratesCargo("Linebacker(2 cr)", {"CTLD_CARGO_Linebacker"}, 
    CTLD_CARGO.Enum.VEHICLE, 2, 1500, 5, "SAM/AAA")

Foothold_ctld:AddCratesCargo("Vulcan (2 cr)", {"CTLD_CARGO_Vulcan"}, 
    CTLD_CARGO.Enum.VEHICLE, 2, 1500, 5, "SAM/AAA")

Foothold_ctld:AddCratesCargo("HAWK Site (4 cr)", {"CTLD_CARGO_HAWKSite"}, 
    CTLD_CARGO.Enum.FOB, 4, 1900, 5, "SAM/AAA")

Foothold_ctld:AddCratesCargo("Nasam Site(4 cr)", {"CTLD_CARGO_NasamsSite"}, 
    CTLD_CARGO.Enum.FOB, 4, 1900, 5, "SAM/AAA")
```

### Cargo Categories
```lua
-- Cargo category definitions
CTLD_CARGO.Enum = {
    VEHICLE = 1,      -- Ground vehicles
    FOB = 2,          -- Forward operating bases
    CRATE = 3,        -- Supply crates
    FUEL = 4,         -- Fuel containers
    AMMO = 5          -- Ammunition containers
}
```

## FARP System

### FARP Creation
```lua
-- Create FARP at location
function LogisticsSystem:createFARP(position, coalition)
    local farp = {
        position = position,
        coalition = coalition,
        status = "active",
        units = {},
        supplies = {
            fuel = 1000,
            ammo = 1000,
            repair = 1000
        }
    }
    
    table.insert(self.farpLocations, farp)
    return farp
end
```

### FARP Operations
```lua
-- FARP refueling
function LogisticsSystem:refuelAtFARP(unit, farp)
    if farp.supplies.fuel > 0 then
        local fuelNeeded = unit:getFuel() - unit:getFuelMax()
        local fuelGiven = math.min(fuelNeeded, farp.supplies.fuel)
        
        unit:setFuel(unit:getFuel() + fuelGiven)
        farp.supplies.fuel = farp.supplies.fuel - fuelGiven
        
        return fuelGiven
    end
    return 0
end

-- FARP rearming
function LogisticsSystem:rearmAtFARP(unit, farp)
    if farp.supplies.ammo > 0 then
        -- Replenish unit ammunition
        unit:rearm()
        farp.supplies.ammo = farp.supplies.ammo - 100
        
        return true
    end
    return false
end
```

## Supply Chains

### Supply Route Definition
```lua
-- Supply route structure
supplyRoute = {
    source = "SourceZone",     -- Source zone
    destination = "DestZone",  -- Destination zone
    type = "ground",           -- Transport type
    capacity = 1000,           -- Transport capacity
    frequency = 300,           -- Supply frequency (seconds)
    status = "active"          -- Route status
}
```

### Supply Chain Management
```lua
-- Create supply route
function LogisticsSystem:createSupplyRoute(source, destination, type)
    local route = {
        source = source,
        destination = destination,
        type = type,
        capacity = 1000,
        frequency = 300,
        status = "active",
        lastSupply = 0
    }
    
    table.insert(self.supplyRoutes, route)
    return route
end

-- Process supply routes
function LogisticsSystem:processSupplyRoutes()
    local currentTime = timer.getTime()
    
    for _, route in ipairs(self.supplyRoutes) do
        if route.status == "active" and 
           currentTime - route.lastSupply >= route.frequency then
            
            self:executeSupplyRun(route)
            route.lastSupply = currentTime
        end
    end
end
```

## Cargo Transport

### Transport Unit Types
```lua
-- Helicopter transport
helicopterTransport = {
    type = "helicopter",
    capacity = 5000,           -- Cargo capacity
    speed = 150,               -- Transport speed
    range = 200,               -- Operational range
    units = {"UH-1H", "Mi-8MTV2"}
}

-- Ground transport
groundTransport = {
    type = "ground",
    capacity = 2000,           -- Cargo capacity
    speed = 50,                -- Transport speed
    range = 100,               -- Operational range
    units = {"M818", "Ural-375"}
}
```

### Transport Operations
```lua
-- Load cargo onto transport
function LogisticsSystem:loadCargo(transport, cargo)
    if transport.currentWeight + cargo.weight <= transport.capacity then
        table.insert(transport.cargo, cargo)
        transport.currentWeight = transport.currentWeight + cargo.weight
        return true
    end
    return false
end

-- Unload cargo from transport
function LogisticsSystem:unloadCargo(transport, destination)
    for _, cargo in ipairs(transport.cargo) do
        self:deployCargo(cargo, destination)
    end
    
    transport.cargo = {}
    transport.currentWeight = 0
end
```

## Deployable Units

### Unit Deployment
```lua
-- Deploy unit at location
function LogisticsSystem:deployUnit(unitType, position, coalition)
    local unit = self:spawnUnit(unitType, position, coalition)
    
    if unit then
        -- Add to zone inventory
        local zone = self:getZoneAtPosition(position)
        if zone then
            table.insert(zone.deployedUnits, unit)
        end
        
        return unit
    end
    return nil
end
```

### Unit Management
```lua
-- Track deployed units
function LogisticsSystem:trackDeployedUnit(unit, zone)
    unit.zone = zone
    unit.deploymentTime = timer.getTime()
    unit.status = "active"
    
    table.insert(self.deployedUnits, unit)
end

-- Remove deployed unit
function LogisticsSystem:removeDeployedUnit(unit)
    for i, deployedUnit in ipairs(self.deployedUnits) do
        if deployedUnit == unit then
            table.remove(self.deployedUnits, i)
            break
        end
    end
    
    if unit.zone then
        for i, zoneUnit in ipairs(unit.zone.deployedUnits) do
            if zoneUnit == unit then
                table.remove(unit.zone.deployedUnits, i)
                break
            end
        end
    end
end
```

## Performance Considerations

### Logistics Optimization
- **Route Optimization**: Efficient supply route planning
- **Capacity Management**: Optimal cargo loading
- **Resource Pooling**: Efficient resource allocation
- **Update Scheduling**: Timed logistics operations

### Scalability Features
- **Dynamic Routes**: Adaptive supply chain management
- **Resource Tracking**: Efficient resource monitoring
- **Unit Pooling**: Efficient unit management
- **Event-Driven Updates**: Logistics events trigger updates

## Extension Points

### Adding New Cargo Types
```lua
-- Add new cargo type
Foothold_ctld:AddCratesCargo("NewCargo(3 cr)", {"CTLD_CARGO_NewCargo"}, 
    CTLD_CARGO.Enum.VEHICLE, 3, 2000, 5, "New Category")
```

### Custom Transport Systems
```lua
-- Add custom transport type
function LogisticsSystem:addCustomTransport(transportType, config)
    self.transportTypes[transportType] = config
end
```

### Logistics Events
```lua
-- Add logistics event
function LogisticsSystem:onLogisticsEvent(eventType, data)
    if eventType == "supplyDelivered" then
        self:processSupplyDelivery(data)
    end
end
```

## Troubleshooting

### Common Issues
1. **Cargo not loading**: Check weight limits and capacity
2. **FARP not working**: Verify FARP supplies and status
3. **Supply routes not active**: Check route configuration
4. **Units not deploying**: Verify deployment permissions

### Debug Commands
```lua
-- Debug logistics status
if event.text=='logistics' then
    env.info(string.format("Active FARPs: %d", #self.farpLocations))
    env.info(string.format("Supply routes: %d", #self.supplyRoutes))
end
```

### Logging
```lua
-- Logistics activity logging
env.info(string.format("Cargo %s deployed at %s", cargoType, position))
```

## Future Enhancements

### Potential Improvements
1. **Advanced Routing**: AI-powered route optimization
2. **Supply Forecasting**: Predictive supply management
3. **Resource Management**: Advanced resource allocation
4. **Transport Coordination**: Multi-transport coordination
5. **Logistics Analytics**: Detailed logistics reporting

### Extension Ideas
- **Air Transport**: Aircraft-based logistics
- **Naval Logistics**: Ship-based supply chains
- **Automated Logistics**: AI-driven logistics management
- **Logistics Missions**: Player logistics missions 