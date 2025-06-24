# Communication System - Foothold Syria Extended

## Overview

The Communication System manages all forms of player and AI communication, including radio transmissions, chat commands, F10 menus, and status messages. It provides a comprehensive framework for information sharing and coordination.

## Architecture

### Communication Hierarchy
```
Communication System
├── Radio System (frequency management, transmissions)
├── Chat Commands (player input processing)
├── F10 Menus (user interface menus)
├── Status Messages (information display)
└── Notification System (alerts and updates)
```

### Core Communication Properties
```lua
communication = {
    radioFrequencies = {},     -- Active radio frequencies
    chatCommands = {},         -- Available chat commands
    menuStructure = {},        -- F10 menu hierarchy
    messageQueue = {},         -- Pending messages
    notificationSettings = {}  -- Notification preferences
}
```

## Radio System

### Frequency Management
```lua
-- Radio frequency structure
radioFrequency = {
    frequency = 251.0,         -- Frequency in MHz
    coalition = 2,             -- Coalition (1=red, 2=blue)
    type = "AM",               -- Modulation type
    power = 1000,              -- Transmission power
    range = 50,                -- Transmission range (km)
    active = true              -- Frequency status
}
```

### Radio Operations
```lua
-- Transmit radio message
function CommunicationSystem:transmitRadio(frequency, message, coalition)
    local radio = self:getRadioFrequency(frequency)
    if radio and radio.active then
        trigger.action.radioTransmission(
            radio.frequency,
            radio.modulation,
            radio.power,
            radio.range,
            message,
            coalition
        )
        return true
    end
    return false
end
```

## Chat Commands

### Command Processing
```lua
-- Process chat command
function CommunicationSystem:processChatCommand(event)
    local command = event.text:lower()
    local playerName = event.initiator:getPlayerName()
    local coalition = event.coalition
    
    if command == "help" then
        self:displayHelp(event)
    elseif command == "status" then
        self:displayZoneStatus(event)
    elseif command == "stats" then
        self:displayLeaderboard(event.initiator:getGroup():getID())
    elseif command == "mystats" then
        self:displayPlayerStats(playerName, event.initiator:getGroup():getID())
    elseif command == "top" then
        self:displayTopPlayers(event.initiator:getGroup():getID())
    elseif command == "missions" then
        self:displayActiveMissions(event.initiator:getGroup():getID())
    end
end
```

### Help System
```lua
-- Display help information
function CommunicationSystem:displayHelp(event)
    local toprint = 'Available Commands:\n'
    toprint = toprint..'buy - display available support items\n'
    toprint = toprint..'buy:item - buy support item\n'
    toprint = toprint..'status - display zone status for 60 seconds\n'
    toprint = toprint..'stats - display complete leaderboard\n'
    toprint = toprint..'top - display top 5 players from leaderboard\n'
    toprint = toprint..'mystats - display your personal statistics (only in MP)\n'
    toprint = toprint..'missions display all the active missions'
    
    if event.initiator then
        trigger.action.outTextForGroup(event.initiator:getGroup():getID(), toprint, 20)
    else
        trigger.action.outTextForCoalition(event.coalition, toprint, 20)
    end
end
```

## F10 Menu System

### Menu Structure
```lua
-- Build F10 menu for player
function CommunicationSystem:buildPlayerMenu(playerName, groupID)
    local mainMenu = missionCommands.addSubMenuForGroup(groupID, "Foothold Syria", nil)
    
    -- Status submenu
    local statusMenu = missionCommands.addSubMenuForGroup(groupID, "Status", mainMenu)
    missionCommands.addCommandForGroup(groupID, "My Stats", statusMenu, function()
        self:displayPlayerStats(playerName, groupID)
    end)
    missionCommands.addCommandForGroup(groupID, "Leaderboard", statusMenu, function()
        self:displayLeaderboard(groupID)
    end)
    
    -- Shop submenu
    local shopMenu = missionCommands.addSubMenuForGroup(groupID, "Shop", mainMenu)
    self:buildShopMenu(shopMenu, groupID)
    
    -- Commands submenu
    local commandsMenu = missionCommands.addSubMenuForGroup(groupID, "Commands", mainMenu)
    self:buildCommandsMenu(commandsMenu, groupID)
end
```

### Shop Menu
```lua
-- Build shop menu
function CommunicationSystem:buildShopMenu(parentMenu, groupID)
    for itemName, item in pairs(self.shops[coalition]) do
        local command = string.format("%s (%d credits)", item.name, item.cost)
        missionCommands.addCommandForGroup(groupID, command, parentMenu, function()
            self:buyShopItem(coalition, itemName)
        end)
    end
end
```

## Status Messages

### Zone Status Display
```lua
-- Display zone status
function CommunicationSystem:displayZoneStatus(event)
    local message = "Zone Status:\n"
    
    for zoneName, zone in pairs(self.zones) do
        local sideText = zone.side == 0 and "Neutral" or 
                        zone.side == 1 and "Red" or "Blue"
        message = message .. string.format("%s: %s (Level %d)\n", 
            zoneName, sideText, zone.level)
    end
    
    if event.initiator then
        trigger.action.outTextForGroup(event.initiator:getGroup():getID(), message, 60)
    else
        trigger.action.outTextForCoalition(event.coalition, message, 60)
    end
end
```

### Player Statistics Display
```lua
-- Display player statistics
function CommunicationSystem:displayPlayerStats(playerName, groupID)
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

## Notification System

### Message Types
```lua
-- Message type definitions
local MESSAGE_TYPES = {
    INFO = "info",           -- General information
    WARNING = "warning",     -- Warning messages
    ERROR = "error",         -- Error messages
    SUCCESS = "success",     -- Success messages
    ALERT = "alert"          -- Alert messages
}
```

### Notification Operations
```lua
-- Send notification
function CommunicationSystem:sendNotification(message, type, coalition, duration)
    duration = duration or 10
    
    if coalition then
        trigger.action.outTextForCoalition(coalition, message, duration)
    else
        trigger.action.outText(message, duration)
    end
end

-- Send coalition notification
function CommunicationSystem:sendCoalitionNotification(message, coalition, duration)
    trigger.action.outTextForCoalition(coalition, message, duration or 10)
end

-- Send group notification
function CommunicationSystem:sendGroupNotification(message, groupID, duration)
    trigger.action.outTextForGroup(groupID, message, duration or 10)
end
```

## Performance Considerations

### Communication Optimization
- **Message Queuing**: Efficient message processing
- **Frequency Management**: Optimized radio operations
- **Menu Caching**: Pre-computed menu structures
- **Update Batching**: Group communication updates

### Scalability Features
- **Message Pooling**: Efficient message management
- **Command Caching**: Cache command processing
- **Menu Optimization**: Efficient menu generation
- **Event-Driven Updates**: Communication events trigger updates

## Extension Points

### Adding New Chat Commands
```lua
-- Add new chat command
function CommunicationSystem:addChatCommand(command, handler)
    self.chatCommands[command] = handler
end
```

### Custom Notifications
```lua
-- Add custom notification type
function CommunicationSystem:sendCustomNotification(message, data)
    -- Custom notification logic
    self:sendNotification(message, "custom", data.coalition, data.duration)
end
```

### Communication Events
```lua
-- Add communication event
function CommunicationSystem:onCommunicationEvent(eventType, data)
    if eventType == "messageSent" then
        self:logMessage(data)
    end
end
```

## Troubleshooting

### Common Issues
1. **Chat commands not working**: Check command registration
2. **Menus not appearing**: Verify group ID and coalition
3. **Radio not transmitting**: Check frequency configuration
4. **Messages not displaying**: Verify coalition and group settings

### Debug Commands
```lua
-- Debug communication status
if event.text=='commdebug' then
    env.info(string.format("Active frequencies: %d", #self.radioFrequencies))
    env.info(string.format("Chat commands: %d", #self.chatCommands))
end
```

### Logging
```lua
-- Communication activity logging
env.info(string.format("Message sent to coalition %d: %s", coalition, message))
```

## Future Enhancements

### Potential Improvements
1. **Advanced Radio**: Digital radio systems
2. **Voice Integration**: Voice communication support
3. **Message Encryption**: Secure communication
4. **Communication Analytics**: Detailed communication reporting
5. **Multi-language Support**: Internationalization

### Extension Ideas
- **Radio Networks**: Complex radio networks
- **Message Encryption**: Secure messaging
- **Communication Missions**: Communication-based missions
- **Social Features**: Enhanced player interaction 