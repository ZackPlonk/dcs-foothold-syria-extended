# Player System - Foothold Syria Extended

## Overview

The Player System manages all aspects of player interaction, including statistics tracking, communication, permissions, and progression. It provides a comprehensive framework for multiplayer coordination and individual player development.

## Architecture

### Player System Hierarchy
```
Player System
├── Player Statistics (kills, deaths, points, credits)
├── Player Communication (F10 menus, chat commands, status)
├── Player Permissions (coalition-based access control)
├── Player Progression (unlocks, achievements, advancement)
└── Player Groups (multiplayer coordination)
```

### Core Player Properties
```lua
player = {
    name = "PlayerName",           -- Player identifier
    side = 2,                      -- Coalition (1=red, 2=blue)
    groupID = 12345,               -- Group identifier
    stats = {                      -- Player statistics
        Points = 0,
        Kills = 0,
        Deaths = 0,
        Captures = 0,
        Credits = 0
    },
    contributions = 0,             -- Current session credits
    permissions = {}               -- Access permissions
}
```

## Player Statistics

### Statistics Structure
```lua
-- Player statistics tracking
self.playerStats = {
    [playerName] = {
        Points = 0,        -- Total points earned
        Kills = 0,         -- Total kills
        Deaths = 0,        -- Total deaths
        Captures = 0,      -- Zone captures
        Credits = 0,       -- Total credits earned
        Rescues = 0,       -- Rescue missions
        SAM_Kills = 0,     -- SAM system kills
        Aircraft_Kills = 0, -- Aircraft kills
        Ground_Kills = 0,  -- Ground unit kills
        Ship_Kills = 0     -- Ship kills
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

-- Reset player statistics
function BattleCommander:resetPlayerStats(playerName)
    self.playerStats[playerName] = {
        Points = 0,
        Kills = 0,
        Deaths = 0,
        Captures = 0,
        Credits = 0
    }
end
```

### Statistics Display
```lua
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

-- Display leaderboard
function BattleCommander:displayLeaderboard(groupID)
    local sorted = {}
    for playerName, stats in pairs(self.playerStats) do
        table.insert(sorted, {name = playerName, points = stats.Points or 0})
    end
    
    table.sort(sorted, function(a, b) return a.points > b.points end)
    
    local message = "Leaderboard:\n"
    for i = 1, math.min(10, #sorted) do
        message = message .. string.format("%d. %s: %d points\n", 
            i, sorted[i].name, sorted[i].points)
    end
    
    trigger.action.outTextForGroup(groupID, message, 30)
end
```

## Player Communication

### F10 Menu System
```lua
-- Build F10 menu for player
function BattleCommander:buildPlayerMenu(playerName, groupID)
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

### Chat Commands
```lua
-- Process chat commands
function BattleCommander:processChatCommand(event)
    local command = event.text:lower()
    
    if command == "help" then
        self:displayHelp(event)
    elseif command == "status" then
        self:displayZoneStatus(event)
    elseif command == "stats" then
        self:displayLeaderboard(event.initiator:getGroup():getID())
    elseif command == "mystats" then
        self:displayPlayerStats(event.initiator:getPlayerName(), 
                               event.initiator:getGroup():getID())
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
function BattleCommander:displayHelp(event)
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

## Player Permissions

### Coalition-Based Access
```lua
-- Check player permissions
function BattleCommander:checkPlayerPermission(playerName, permission)
    local player = self:getPlayer(playerName)
    if not player then
        return false
    end
    
    return player.permissions[permission] == true
end

-- Grant permission to player
function BattleCommander:grantPermission(playerName, permission)
    local player = self:getPlayer(playerName)
    if player then
        player.permissions[permission] = true
    end
end

-- Revoke permission from player
function BattleCommander:revokePermission(playerName, permission)
    local player = self:getPlayer(playerName)
    if player then
        player.permissions[permission] = false
    end
end
```

### Permission Levels
```lua
-- Permission types
local PERMISSIONS = {
    SHOP_ACCESS = "shop_access",
    ADMIN_COMMANDS = "admin_commands",
    DEBUG_ACCESS = "debug_access",
    MISSION_CONTROL = "mission_control",
    ECONOMY_CONTROL = "economy_control"
}

-- Default permissions by coalition
local DEFAULT_PERMISSIONS = {
    [1] = {  -- Red coalition
        SHOP_ACCESS = true,
        ADMIN_COMMANDS = false,
        DEBUG_ACCESS = false
    },
    [2] = {  -- Blue coalition
        SHOP_ACCESS = true,
        ADMIN_COMMANDS = false,
        DEBUG_ACCESS = false
    }
}
```

## Player Progression

### Achievement System
```lua
-- Achievement definitions
local ACHIEVEMENTS = {
    FIRST_KILL = {
        name = "First Blood",
        description = "Score your first kill",
        condition = function(player) return player.stats.Kills >= 1 end
    },
    ACE_PILOT = {
        name = "Ace Pilot",
        description = "Score 5 aircraft kills",
        condition = function(player) return player.stats.Aircraft_Kills >= 5 end
    },
    SAM_HUNTER = {
        name = "SAM Hunter",
        description = "Destroy 10 SAM systems",
        condition = function(player) return player.stats.SAM_Kills >= 10 end
    },
    ZONE_CAPTURER = {
        name = "Zone Capturer",
        description = "Capture 5 zones",
        condition = function(player) return player.stats.Captures >= 5 end
    }
}

-- Check achievements
function BattleCommander:checkAchievements(playerName)
    local player = self:getPlayer(playerName)
    if not player then return end
    
    for achievementId, achievement in pairs(ACHIEVEMENTS) do
        if not player.achievements[achievementId] and achievement.condition(player) then
            self:grantAchievement(playerName, achievementId)
        end
    end
end

-- Grant achievement
function BattleCommander:grantAchievement(playerName, achievementId)
    local player = self:getPlayer(playerName)
    local achievement = ACHIEVEMENTS[achievementId]
    
    if player and achievement then
        player.achievements[achievementId] = true
        
        -- Notify player
        trigger.action.outTextForCoalition(player.side, 
            string.format("[%s] Achievement Unlocked: %s - %s", 
                playerName, achievement.name, achievement.description), 10)
    end
end
```

### Progression Rewards
```lua
-- Progression milestones
local MILESTONES = {
    [10] = {credits = 500, title = "Rookie"},
    [50] = {credits = 1000, title = "Veteran"},
    [100] = {credits = 2000, title = "Ace"},
    [250] = {credits = 5000, title = "Legend"},
    [500] = {credits = 10000, title = "Hero"}
}

-- Check progression milestones
function BattleCommander:checkProgressionMilestones(playerName)
    local player = self:getPlayer(playerName)
    if not player then return end
    
    local totalKills = player.stats.Kills or 0
    
    for milestone, reward in pairs(MILESTONES) do
        if totalKills >= milestone and not player.milestones[milestone] then
            self:grantMilestone(playerName, milestone, reward)
        end
    end
end

-- Grant milestone reward
function BattleCommander:grantMilestone(playerName, milestone, reward)
    local player = self:getPlayer(playerName)
    
    if player then
        player.milestones[milestone] = true
        self:addFunds(player.side, reward.credits)
        
        -- Notify player
        trigger.action.outTextForCoalition(player.side, 
            string.format("[%s] Milestone Reached: %s kills - %s title, +%d credits", 
                playerName, milestone, reward.title, reward.credits), 15)
    end
end
```

## Player Groups

### Group Management
```lua
-- Track player groups
self.playerGroups = {
    [groupID] = {
        players = {},
        side = 2,
        leader = nil,
        formation = "line",
        status = "active"
    }
}

-- Add player to group
function BattleCommander:addPlayerToGroup(playerName, groupID)
    local group = self.playerGroups[groupID]
    if not group then
        group = {
            players = {},
            side = 2,
            leader = nil,
            formation = "line",
            status = "active"
        }
        self.playerGroups[groupID] = group
    end
    
    table.insert(group.players, playerName)
    
    if not group.leader then
        group.leader = playerName
    end
end

-- Remove player from group
function BattleCommander:removePlayerFromGroup(playerName, groupID)
    local group = self.playerGroups[groupID]
    if group then
        for i, player in ipairs(group.players) do
            if player == playerName then
                table.remove(group.players, i)
                break
            end
        end
        
        if group.leader == playerName and #group.players > 0 then
            group.leader = group.players[1]
        end
    end
end
```

### Group Coordination
```lua
-- Group formation management
function BattleCommander:setGroupFormation(groupID, formation)
    local group = self.playerGroups[groupID]
    if group then
        group.formation = formation
        self:updateGroupFormation(groupID)
    end
end

-- Update group formation
function BattleCommander:updateGroupFormation(groupID)
    local group = self.playerGroups[groupID]
    if not group then return end
    
    -- Apply formation to group members
    for _, playerName in ipairs(group.players) do
        local player = self:getPlayer(playerName)
        if player then
            self:applyFormationToPlayer(player, group.formation)
        end
    end
end
```

## Player Events

### Player Join/Leave
```lua
-- Handle player join
function BattleCommander:onPlayerJoin(playerName, groupID, side)
    -- Initialize player data
    self:initializePlayer(playerName, side)
    
    -- Add to group
    self:addPlayerToGroup(playerName, groupID)
    
    -- Build player menu
    self:buildPlayerMenu(playerName, groupID)
    
    -- Welcome message
    trigger.action.outTextForCoalition(side, 
        string.format("Welcome %s to the %s coalition!", playerName, 
            side == 1 and "Red" or "Blue"), 10)
end

-- Handle player leave
function BattleCommander:onPlayerLeave(playerName, groupID)
    -- Save player data
    self:savePlayerData(playerName)
    
    -- Remove from group
    self:removePlayerFromGroup(playerName, groupID)
    
    -- Cleanup player data
    self:cleanupPlayerData(playerName)
end
```

### Player Actions
```lua
-- Handle player kill
function BattleCommander:onPlayerKill(initiatorUnit, targetUnit)
    local playerName = initiatorUnit:getPlayerName()
    local side = initiatorUnit:getCoalition()
    
    if playerName and side then
        -- Update statistics
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

-- Handle player death
function BattleCommander:onPlayerDeath(unit, side)
    local playerName = unit:getPlayerName()
    
    if playerName then
        -- Update statistics
        self:addStat(playerName, "Deaths", 1)
        
        -- Handle ejection
        self:handlePilotEjection(unit, side)
    end
end
```

## Performance Considerations

### Player System Optimization
- **Data Caching**: Cache frequently accessed player data
- **Batch Updates**: Group player updates for efficiency
- **Memory Management**: Clean up inactive player data
- **Event-Driven Updates**: Only update when necessary

### Scalability Features
- **Player Pooling**: Efficient player object management
- **Statistics Aggregation**: Efficient stat tracking
- **Group Optimization**: Efficient group management
- **Permission Caching**: Cache permission checks

## Extension Points

### Adding New Statistics
```lua
-- Add new statistic type
function BattleCommander:addCustomStat(playerName, statType, value)
    self:addStat(playerName, statType, value)
    
    -- Custom stat processing
    if statType == "CustomKill" then
        self:processCustomKill(playerName, value)
    end
end
```

### Custom Achievements
```lua
-- Add custom achievement
ACHIEVEMENTS.CUSTOM_ACHIEVEMENT = {
    name = "Custom Achievement",
    description = "Custom achievement description",
    condition = function(player) 
        return player.stats.CustomStat >= 10 
    end
}
```

### Player Events
```lua
-- Add custom player event
function BattleCommander:onCustomPlayerEvent(playerName, eventType, data)
    if eventType == "customAction" then
        -- Process custom action
        self:processCustomAction(playerName, data)
    end
end
```

## Troubleshooting

### Common Issues
1. **Statistics not updating**: Check player name and coalition
2. **Permissions not working**: Verify permission configuration
3. **Menu not appearing**: Check group ID and coalition
4. **Achievements not triggering**: Verify achievement conditions

### Debug Commands
```lua
-- Debug player status
if event.text=='playerdebug' then
    local playerName = event.initiator:getPlayerName()
    local stats = self:getPlayerStats(playerName)
    env.info(string.format("Player %s stats: %s", playerName, 
        require("json").encode(stats)))
end
```

### Logging
```lua
-- Player activity logging
env.info(string.format("Player %s joined coalition %d", playerName, side))
```

## Future Enhancements

### Potential Improvements
1. **Advanced Statistics**: Detailed performance metrics
2. **Player Rankings**: Sophisticated ranking system
3. **Custom Achievements**: Player-created achievements
4. **Social Features**: Player interaction systems
5. **Progression Trees**: Skill trees and specializations

### Extension Ideas
- **Player Clans**: Group-based progression
- **Tournament System**: Competitive events
- **Player Trading**: Inter-player economy
- **Reputation System**: Player reputation tracking 