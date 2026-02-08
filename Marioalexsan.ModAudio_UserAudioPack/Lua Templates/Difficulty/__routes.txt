p = {}

function p.target_group_Difficulty(route)
  local ZoneDifficulty =
  {
    EASY = 0,
    NORMAL = 1,
    HARD = 2
  }
  local DungeonDifficulty = accessPath(atlyss, "mainPlayer", "_playerMapInstance", "_patternInstance", "_setDungeonDifficulty")
  
  if DungeonDifficulty == ZoneDifficulty.EASY then
    route.targetGroup = "Easy"
  elseif DungeonDifficulty == ZoneDifficulty.NORMAL then
    route.targetGroup = "Normal"
  elseif DungeonDifficulty == ZoneDifficulty.HARD then
    route.targetGroup = "Hard"
  else
    route.targetGroup = "Normal"
  end
end

return p