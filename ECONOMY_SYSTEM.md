# Economy System - Foothold Syria Extended

## Overview

The Economy System manages the in-game economy, including credits, shops, player rewards, and resource allocation. It provides a dynamic economic framework that rewards player actions and enables strategic purchasing decisions.

## Architecture

### Economy Hierarchy
```
Economy System
├── Credit Management (earnings, spending, caps)
├── Shop System (items, costs, availability)
├── Player Rewards (kills, captures, bonuses)
├── Resource Allocation (zone income, expenses)
└── Economic Balance (inflation control)
```

### Core Economic Properties
```lua
economy = {
    accounts = {[1] = 1000, [2] = 1000},     -- Coalition credit accounts
    creditsCap = 10000,                       -- Maximum credits per coalition
    shops = {[1] = {}, [2] = {}},             -- Coalition-specific shops
    playerContributions = {[1] = {}, [2] = {}}, -- Player credit tracking
    rewards = {                               -- Reward configuration
        airplane = 100,
        helicopter = 50,
        ground = 25,
        ship = 200,
        structure = 75,
        infantry = 10,
        sam = 150,
        crate = 25,
        rescue = 500
    }
}
```

## Credit Management

### Credit Accounts
```lua
-- Coalition credit accounts
self.accounts = {
    [1] = 1000,  -- Red coalition starting credits
    [2] = 1000   -- Blue coalition starting credits
}
```

### Credit Operations
```lua
-- Add credits to coalition
function BattleCommander:addFunds(side, amount)
    self.accounts[side] = self.accounts[side] + amount
    
    -- Apply credit cap
    if self.creditsCap and self.accounts[side] > self.creditsCap then
        self.accounts[side] = self.creditsCap
    end
end

-- Remove credits from coalition
function BattleCommander:spendFunds(side, amount)
    if self.accounts[side] >= amount then
        self.accounts[side] = self.accounts[side] - amount
        return true
    end
    return false
end

-- Get coalition credit balance
function BattleCommander:getFunds(side)
    return self.accounts[side] or 0
end
```

### Credit Caps
```lua
-- Credit cap configuration
self.creditsCap = 10000  -- Maximum credits per coalition

-- Credit cap enforcement
if self.creditsCap and self.accounts[side] > self.creditsCap then
    self.accounts[side] = self.creditsCap
end
```

## Shop System

### Shop Structure
```lua
-- Shop item definition
shopItem = {
    name = "Item Name",           -- Display name
    cost = 500,                   -- Credit cost
    stock = -1,                   -- Available quantity (-1 = unlimited)
    category = "SAM/AAA",         -- Item category
    template = "ItemTemplate"     -- Spawn template
}
```

### Shop Configuration
```lua
-- Blue coalition shop
self.shops[2] = {
    ["linebacker"] = {
        name = "Linebacker",
        cost = 1500,
        stock = -1,
        category = "SAM/AAA"
    },
    ["vulcan"] = {
        name = "Vulcan",
        cost = 1500,
        stock = -1,
        category = "SAM/AAA"
    },
    ["hawksite"] = {
        name = "HAWK Site",
        cost = 1900,
        stock = -1,
        category = "SAM/AAA"
    }
}
```

### Shop Operations
```lua
-- Purchase item from shop
function BattleCommander:buyShopItem(side, itemName, purchaseData)
    local shop = self.shops[side]
    local item = shop[itemName]
    
    if not item then
        return "Item not found"
    end
    
    if item.stock ~= -1 and item.stock <= 0 then
        return "Item out of stock"
    end
    
    if self.accounts[side] < item.cost then
        return "Insufficient funds"
    end
    
    -- Process purchase
    self:spendFunds(side, item.cost)
    
    if item.stock ~= -1 then
        item.stock = item.stock - 1
    end
    
    -- Spawn purchased item
    self:spawnPurchasedItem(item, purchaseData)
    
    return "Purchase successful"
end
```

### Shop Menu Generation
```lua
-- Generate shop menu for coalition
function BattleCommander:refreshShopMenuForCoalition(side)
    local menu = missionCommands.addSubMenuForCoalition(side, "Shop", nil)
    
    for itemName, item in pairs(self.shops[side]) do
        local command = string.format("%s (%d credits)", item.name, item.cost)
        missionCommands.addCommandForCoalition(side, command, menu, function()
            self:buyShopItem(side, itemName)
        end)
    end
end
```

## Player Rewards

### Reward Configuration
```lua
-- Default reward values
self.rewards = {
    airplane = 100,      -- Aircraft kills
    helicopter = 50,     -- Helicopter kills
    ground = 25,         -- Ground unit kills
    ship = 200,          -- Ship kills
    structure = 75,      -- Structure destruction
    infantry = 10,       -- Infantry kills
    sam = 150,           -- SAM system kills
    crate = 25,          -- Cargo crate destruction
    rescue = 500         -- Rescue missions
}
```

### Kill Rewards
```lua
-- Process kill reward
function BattleCommander:processKillReward(initiatorUnit, targetUnit)
    local playerName = initiatorUnit:getPlayerName()
    local side = initiatorUnit:getCoalition()
    
    if not playerName or not side then
        return
    end
    
    -- Determine reward amount
    local reward = self:calculateKillReward(targetUnit)
    
    -- Add to player contribution
    self:addPlayerContribution(side, playerName, reward)
    
    -- Notify player
    trigger.action.outTextForCoalition(side, 
        string.format("[%s] +%d credits for %s kill", playerName, reward, targetUnit:getTypeName()), 5)
end
```

### Zone Capture Rewards
```lua
-- Zone capture bonus
function BattleCommander:processZoneCapture(zone, capturingSide)
    local reward = 500  -- Base capture reward
    
    -- Additional rewards for strategic zones
    if zone.zone == "powerplant" then
        reward = reward + 180  -- Power plant bonus
    elseif zone.zone == "charlie" then
        reward = reward + 500  -- EWR site bonus
    end
    
    -- Distribute reward to coalition
    self:addFunds(capturingSide, reward)
    
    -- Notify coalition
    trigger.action.outTextForCoalition(capturingSide, 
        string.format("Zone %s captured! +%d credits", zone.zone, reward), 10)
end
```

### Player Contribution Tracking
```lua
-- Track player contributions
function BattleCommander:addPlayerContribution(side, playerName, amount)
    self.playerContributions[side] = self.playerContributions[side] or {}
    self.playerContributions[side][playerName] = 
        (self.playerContributions[side][playerName] or 0) + amount
end

-- Get player contribution
function BattleCommander:getPlayerContribution(side, playerName)
    self.playerContributions[side] = self.playerContributions[side] or {}
    return self.playerContributions[side][playerName] or 0
end
```

## Resource Allocation

### Zone Income
```lua
-- Zone income generation
function BattleCommander:generateZoneIncome()
    timer.scheduleFunction(function()
        for _, zone in ipairs(self.zones) do
            if zone.side > 0 and zone.active then
                local income = self:calculateZoneIncome(zone)
                if income > 0 then
                    self:addFunds(zone.side, income)
                end
            end
        end
        return timer.getTime() + 3600  -- Generate income every hour
    end, {}, timer.getTime() + 3600)
end

-- Calculate zone income
function BattleCommander:calculateZoneIncome(zone)
    local baseIncome = 50  -- Base income per zone
    
    -- Special zone bonuses
    if zone.zone == "powerplant" then
        baseIncome = baseIncome + 180  -- Power plant bonus
    elseif zone.zone == "refinery" then
        baseIncome = baseIncome + 150  -- Refinery bonus
    end
    
    -- Level-based income
    baseIncome = baseIncome * (zone.level + 1)
    
    return baseIncome
end
```

### Economic Balance
```lua
-- Economic balance monitoring
function BattleCommander:monitorEconomicBalance()
    timer.scheduleFunction(function()
        for side = 1, 2 do
            local balance = self.accounts[side]
            
            -- Adjust income based on balance
            if balance > 8000 then
                self:reduceIncome(side, 0.5)  -- Reduce income when rich
            elseif balance < 1000 then
                self:increaseIncome(side, 1.5)  -- Increase income when poor
            end
        end
        return timer.getTime() + 1800  -- Check every 30 minutes
    end, {}, timer.getTime() + 1800)
end
```

## Player Statistics

### Statistics Tracking
```lua
-- Player statistics
self.playerStats = {
    [playerName] = {
        Points = 0,
        Kills = 0,
        Deaths = 0,
        Captures = 0,
        Credits = 0
    }
}
```

### Statistics Operations
```lua
-- Add statistic to player
function BattleCommander:addStat(playerName, statType, value)
    self.playerStats[playerName] = self.playerStats[playerName] or {}
    self.playerStats[playerName][statType] = 
        (self.playerStats[playerName][statType] or 0) + value
end

-- Get player statistics
function BattleCommander:getPlayerStats(playerName)
    return self.playerStats[playerName] or {}
end

-- Display player statistics
function BattleCommander:displayPlayerStats(playerName, groupID)
    local stats = self:getPlayerStats(playerName)
    local message = string.format("Statistics for %s:\n", playerName)
    message = message .. string.format("Points: %d\n", stats.Points or 0)
    message = message .. string.format("Kills: %d\n", stats.Kills or 0)
    message = message .. string.format("Deaths: %d\n", stats.Deaths or 0)
    message = message .. string.format("Captures: %d\n", stats.Captures or 0)
    message = message .. string.format("Credits Earned: %d", stats.Credits or 0)
    
    trigger.action.outTextForGroup(groupID, message, 20)
end
```

## Economic Events

### Ejection Handling
```lua
-- Handle pilot ejection
function BattleCommander:handlePilotEjection(unit, side)
    local playerName = unit:getPlayerName()
    
    if playerName then
        local contribution = self:getPlayerContribution(side, playerName)
        local refund = math.floor(contribution * 0.25)  -- 25% refund
        
        self:addFunds(side, refund)
        self:addStat(playerName, "Deaths", 1)
        
        -- Reset player contribution
        self.playerContributions[side][playerName] = 0
        
        -- Notify coalition
        trigger.action.outTextForCoalition(side, 
            string.format("[%s] ejected. +%d credits (25%% of earnings). Kill statistics lost.", 
                playerName, refund), 5)
    end
end
```

### Economic Resets
```lua
-- Reset economy
function BattleCommander:resetEconomy()
    self.accounts = {[1] = 1000, [2] = 1000}
    self.playerContributions = {[1] = {}, [2] = {}}
    self.playerStats = {}
    
    trigger.action.outText("Economy reset to starting values", 10)
end
```

## Performance Considerations

### Economic Optimization
- **Batch Processing**: Group economic updates
- **Conditional Updates**: Only update when necessary
- **Memory Management**: Efficient data structures
- **Update Scheduling**: Timed economic events

### Scalability Features
- **Player Pooling**: Efficient player data management
- **Shop Caching**: Pre-computed shop menus
- **Statistics Aggregation**: Efficient stat tracking
- **Event-Driven Updates**: Economic events trigger updates

## Extension Points

### Adding New Shop Items
```lua
-- Add new shop item
self.shops[2]["newitem"] = {
    name = "New Item",
    cost = 1000,
    stock = 5,
    category = "New Category",
    template = "NewItemTemplate"
}
```

### Custom Reward Systems
```lua
-- Custom reward calculation
function BattleCommander:calculateCustomReward(targetUnit, context)
    local baseReward = self.rewards[targetUnit:getCategory()] or 25
    
    -- Apply context modifiers
    if context.isStrategic then
        baseReward = baseReward * 2
    end
    
    return baseReward
end
```

### Economic Events
```lua
-- Add economic event
function BattleCommander:triggerEconomicEvent(eventType, data)
    if eventType == "marketCrash" then
        -- Reduce all prices by 50%
        for side = 1, 2 do
            for itemName, item in pairs(self.shops[side]) do
                item.cost = math.floor(item.cost * 0.5)
            end
        end
    end
end
```

## Troubleshooting

### Common Issues
1. **Credits not adding**: Check credit cap and account validity
2. **Shop items not appearing**: Verify shop configuration
3. **Rewards not processing**: Check player name and coalition
4. **Economic imbalance**: Review income generation rates

### Debug Commands
```lua
-- Debug economy status
if event.text=='economy' then
    for side = 1, 2 do
        env.info(string.format("Side %d credits: %d", side, self.accounts[side]))
    end
end
```

### Logging
```lua
-- Economic activity logging
env.info(string.format("Player %s earned %d credits", playerName, amount))
```

## Future Enhancements

### Potential Improvements
1. **Dynamic Pricing**: Market-based price fluctuations
2. **Economic Alliances**: Inter-coalition trade
3. **Investment System**: Long-term economic planning
4. **Economic Warfare**: Sabotage and disruption
5. **Player Markets**: Player-to-player trading

### Extension Ideas
- **Resource Types**: Multiple currency types
- **Economic Missions**: Credit-earning missions
- **Economic Balance**: Advanced inflation control
- **Economic Analytics**: Detailed economic reporting 