p = {}

function choice(val, a, b)
  if val then return a else return b end
end

local toggleCombatMusic = false
local combatTime = 0

local combatType = "Normal"
local inPvp = false

function p.pack_update()
  local lastCombatState = toggleCombatMusic
  local lastCombatType = combatType
  local lastPvp = inPvp

  local aggroedEnemies = modaudio.context.aggroedEnemies
  local mainPlayer = atlyss.mainPlayer

  toggleCombatMusic = false
  combatType = "Normal"
  combatTime = math.max(0, combatTime - modaudio.context.deltaTime)

  local secondsSinceGameStart = modaudio.context.secondsSinceGameStart
  local mainPlayerLastPvpEventAt = modaudio.context.mainPlayerLastPvpEventAt

  local timeSinceLastPvp = secondsSinceGameStart - mainPlayerLastPvpEventAt

  if timeSinceLastPvp <= 3 then
    inPvp = true
  end

  if mainPlayer ~= nil and mainPlayer._currentPlayerCondition == 3 then
    -- Remind yourself that overconfidence is a slow and insidious killer
    combatTime = 0
    inPvp = false
  end
  
  if inPvp then
    -- Conditions to break PVP:
    -- - You die (handled by death condtion)
    -- - 20 seconds have passed since last PVP event
    -- - 5 seconds have passed since last PVP event and the player involved in it is dead
    -- - Players have different map instances (such as from teleporting)

    if timeSinceLastPvp >= 20 then
      inPvp = false
    end

    if timeSinceLastPvp >= 5 and context.lastPlayerPvp and context.lastPlayerPvp._currentPlayerCondition == 3 then
      inPvp = false
    end

    if context.lastPlayerPvp and context.lastPlayerPvp._playerMapInstance._mapName ~= mainPlayer._playerMapInstance._mapName then
      inPvp = false
    end
  end

  if #aggroedEnemies >= 1 then
    if combatTime > 0 then
      combatTime = math.max(3, combatTime)
    end

    local threat = 0

    for i, enemy in ipairs(aggroedEnemies) do
      local creepThreat = 1

      local levelDiff = enemy._creepLevel - mainPlayer._pStats._currentLevel

      if levelDiff >= 0 then
        creepThreat = creepThreat + 1.0
      end

      if levelDiff >= 5 then
        creepThreat = creepThreat + 1.0
      end

      if enemy._scriptCreep._isElite then
        creepThreat = creepThreat + 1.0
      end

      threat = threat + creepThreat

      if enemy._scriptCreep._isElite then
        combatType = "Elite"
      end

      if enemy._scriptCreep._playMapInstanceActionMusic then
        combatType = "Miniboss"
      end
    end

    if threat >= 1 then
      combatTime = math.max(5, combatTime)
    end
  end

  if inPvp or combatTime > 0 then
    toggleCombatMusic = true
  end

  if lastCombatState ~= toggleCombatMusic then
    print("Toggling combat music " .. (choice(toggleCombatMusic, "on", "off")))
  end

  if lastCombatType ~= combatType then
    print("Toggling combat type to " .. tostring(combatType))
  end

  if lastPvp ~= inPvp then
    print("Toggling PvP mode to " .. (choice(inPvp, "on", "off")))
  end

  modaudio.engine.forceCombatMusic(toggleCombatMusic)
end

function p.target_group_ActionMusic1(route)
  if combatType == "Normal" then
    route.targetGroup = "Regular_Combat"
  else
    route.targetGroup = "Elite_Combat"
  end
end

function p.target_group_ActionMusic2(route)
  if combatType == "Normal" then
    route.targetGroup = "Regular_Combat"
  elseif combatType == "miniboss" then
    route.targetGroup = "Miniboss_Combat"
  else
    route.targetGroup = "Elite_Combat"
  end
end

return p