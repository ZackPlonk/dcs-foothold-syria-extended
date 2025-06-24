# Event System - Foothold Syria Extended

## Overview

The Event System manages all mission events, triggers, and callbacks throughout the Foothold Syria Extended mission. It provides a comprehensive framework for handling player actions, AI responses, and mission state changes.

## Architecture

### Event System Hierarchy
```
Event System
├── Event Types (kill, capture, spawn, death)
├── Event Handlers (callback functions)
├── Event Triggers (condition checking)
├── Event Processing (event execution)
└── Event Logging (activity tracking)
```

### Core Event Properties
```lua
eventSystem = {
    eventTypes = {},          -- Registered event types
    eventHandlers = {},       -- Event handler functions
    eventQueue = {},          -- Pending events
    eventHistory = {},        -- Event history log
    triggerConditions = {}    -- Event trigger conditions
}
```

## Event Types

### Kill Events
```lua
-- Kill event structure
killEvent = {
    type = "kill",
    initiator = unit,         -- Unit that caused the kill
    target = unit,            -- Unit that was killed
    weapon = "weapon",        -- Weapon used
    position = vector3,       -- Kill location
    time = timestamp          -- Event timestamp
}
```

### Capture Events
```lua
-- Capture event structure
captureEvent = {
    type = "capture",
    zone = zone,              -- Zone being captured
    capturingSide = 1,        -- Side capturing (1=red, 2=blue)
    previousSide = 0,         -- Previous zone owner
    position = vector3,       -- Capture location
    time = timestamp          -- Event timestamp
}
```

### Spawn Events
```lua
-- Spawn event structure
spawnEvent = {
    type = "spawn",
    unit = unit,              -- Spawned unit
    template = "template",    -- Unit template
    position = vector3,       -- Spawn location
    coalition = 2,            -- Unit coalition
    time = timestamp          -- Event timestamp
}
```

## Event Handlers

### Kill Event Handler
```lua
-- Handle kill event
function EventSystem:handleKillEvent(event)
    local initiatorUnit = event.initiator
    local targetUnit = event.target
    
    -- Get player information
    local playerName = initiatorUnit:getPlayerName()
    local side = initiatorUnit:getCoalition()
    
    if playerName and side then
        -- Update player statistics
        self:addStat(playerName, "Kills", 1)
        
        -- Determine kill type
        local targetCategory = targetUnit:getCategory()
        if targetCategory == Unit.Category.AIRPLANE then
            self:addStat(playerName, "Aircraft_Kills", 1)
        elseif targetCategory == Unit.Category.GROUND_UNIT then
            self:addStat(playerName, "Ground_Kills", 1)
        elseif targetCategory == Unit.Category.SHIP then
            self:addStat(playerName, "Ship_Kills", 1)
        end
        
        -- Check for SAM kills
        if targetUnit:hasAttribute("SAM SR") or targetUnit:hasAttribute("SAM TR") then
            self:addStat(playerName, "SAM_Kills", 1)
        end
        
        -- Process rewards
        self:processKillReward(initiatorUnit, targetUnit)
        
        -- Check achievements and milestones
        self:checkAchievements(playerName)
        self:checkProgressionMilestones(playerName)
    end
end
```

### Capture Event Handler
```lua
-- Handle capture event
function EventSystem:handleCaptureEvent(event)
    local zone = event.zone
    local capturingSide = event.capturingSide
    
    -- Update zone ownership
    zone.side = capturingSide
    zone.level = 0  -- Reset level on capture
    
    -- Process capture rewards
    self:processZoneCapture(zone, capturingSide)
    
    -- Update zone missions
    self:updateZoneMissions(zone)
    
    -- Notify coalition
    trigger.action.outTextForCoalition(capturingSide, 
        string.format("Zone %s captured!", zone.zone), 10)
end
```

### Spawn Event Handler
```lua
-- Handle spawn event
function EventSystem:handleSpawnEvent(event)
    local unit = event.unit
    local template = event.template
    local coalition = event.coalition
    
    -- Track spawned unit
    self:trackSpawnedUnit(unit, template, coalition)
    
    -- Update zone units
    local zone = self:getZoneAtPosition(event.position)
    if zone then
        table.insert(zone.built, unit:getName())
    end
    
    -- Log spawn event
    env.info(string.format("Unit %s spawned at %s", template, event.position))
end
```

## Event Triggers

### Trigger Conditions
```lua
-- Trigger condition structure
triggerCondition = {
    type = "condition",       -- Condition type
    parameters = {},          -- Condition parameters
    active = true,            -- Condition status
    lastCheck = 0             -- Last check time
}
```

### Condition Checking
```lua
-- Check trigger conditions
function EventSystem:checkTriggerConditions()
    local currentTime = timer.getTime()
    
    for _, condition in ipairs(self.triggerConditions) do
        if condition.active and currentTime - condition.lastCheck >= condition.checkInterval then
            if self:evaluateCondition(condition) then
                self:triggerEvent(condition.eventType, condition.eventData)
            end
            condition.lastCheck = currentTime
        end
    end
end
```

### Event Triggering
```lua
-- Trigger event
function EventSystem:triggerEvent(eventType, eventData)
    local event = {
        type = eventType,
        data = eventData,
        time = timer.getTime()
    }
    
    -- Add to event queue
    table.insert(self.eventQueue, event)
    
    -- Process event
    self:processEvent(event)
    
    -- Log event
    self:logEvent(event)
end
```

## Event Processing

### Event Queue Management
```lua
-- Process event queue
function EventSystem:processEventQueue()
    for i = #self.eventQueue, 1, -1 do
        local event = self.eventQueue[i]
        
        if self:processEvent(event) then
            table.remove(self.eventQueue, i)
        end
    end
end
```

### Event Handler Registration
```lua
-- Register event handler
function EventSystem:registerEventHandler(eventType, handler)
    self.eventHandlers[eventType] = self.eventHandlers[eventType] or {}
    table.insert(self.eventHandlers[eventType], handler)
end

-- Process event
function EventSystem:processEvent(event)
    local handlers = self.eventHandlers[event.type]
    if handlers then
        for _, handler in ipairs(handlers) do
            local success, result = pcall(handler, event)
            if not success then
                env.error(string.format("Event handler error: %s", result))
            end
        end
    end
    
    return true
end
```

## Event Logging

### Event History
```lua
-- Log event
function EventSystem:logEvent(event)
    table.insert(self.eventHistory, {
        type = event.type,
        data = event.data,
        time = event.time,
        timestamp = os.date("%Y-%m-%d %H:%M:%S")
    })
    
    -- Limit history size
    if #self.eventHistory > 1000 then
        table.remove(self.eventHistory, 1)
    end
end
```

### Event Analytics
```lua
-- Get event statistics
function EventSystem:getEventStatistics()
    local stats = {}
    
    for _, event in ipairs(self.eventHistory) do
        stats[event.type] = (stats[event.type] or 0) + 1
    end
    
    return stats
end
```

## Performance Considerations

### Event System Optimization
- **Event Queuing**: Efficient event processing
- **Handler Caching**: Cache event handlers
- **Condition Optimization**: Efficient condition checking
- **Memory Management**: Limit event history size

### Scalability Features
- **Event Pooling**: Efficient event object management
- **Batch Processing**: Group event processing
- **Priority Queuing**: Priority-based event handling
- **Event Filtering**: Filter unnecessary events

## Extension Points

### Adding New Event Types
```lua
-- Add new event type
function EventSystem:addEventType(eventType, handler)
    self.eventTypes[eventType] = {
        handler = handler,
        active = true
    }
end
```

### Custom Event Handlers
```lua
-- Add custom event handler
function EventSystem:addCustomHandler(eventType, handler)
    self:registerEventHandler(eventType, handler)
end
```

### Event Modifiers
```lua
-- Add event modifier
function EventSystem:addEventModifier(eventType, modifier)
    self.eventModifiers[eventType] = self.eventModifiers[eventType] or {}
    table.insert(self.eventModifiers[eventType], modifier)
end
```

## Troubleshooting

### Common Issues
1. **Events not triggering**: Check trigger conditions
2. **Handlers not executing**: Verify handler registration
3. **Performance issues**: Review event frequency
4. **Memory leaks**: Check event history size

### Debug Commands
```lua
-- Debug event system
if event.text=='eventdebug' then
    env.info(string.format("Event queue size: %d", #self.eventQueue))
    env.info(string.format("Event history size: %d", #self.eventHistory))
end
```

### Logging
```lua
-- Event system logging
env.info(string.format("Event triggered: %s", event.type))
```

## Future Enhancements

### Potential Improvements
1. **Advanced Triggers**: Complex trigger conditions
2. **Event Chaining**: Sequential event execution
3. **Event Replay**: Event replay system
4. **Event Analytics**: Detailed event reporting
5. **Event Visualization**: Event timeline visualization

### Extension Ideas
- **Event Scripting**: Scriptable event system
- **Event Templates**: Predefined event templates
- **Event Broadcasting**: Multi-system event broadcasting
- **Event Persistence**: Persistent event storage 