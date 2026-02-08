p = {}

function p.target_group_ArcwoodPass(route)
  if atlyss.inGameUI._reigonTitle == "Chapel Of The Elders" then
    route.targetGroup = "Church"
  elseif atlyss.inGameUI._reigonTitle == "Sanctum Catacombs" then
    route.targetGroup = "Sanctum_Catacombs"
  else
    route.targetGroup = "Arcwood_Pass"
  end
end

function p.target_group_Crescent(route)
  if atlyss.inGameUI._reigonTitle == "Crescent Grove" then
    route.targetGroup = "Crescent_Grove"
  elseif atlyss.inGameUI._reigonTitle == "Crescent Cove" then
    route.targetGroup = "Crescent_Cove"
  elseif atlyss.inGameUI._reigonTitle == "Crescent Keep" then
    route.targetGroup = "Crescent_Keep"
  else
    route.targetGroup = "Crescent_Road"
  end
end

function p.target_group_BularrFortress(route)
  if atlyss.inGameUI._reigonTitle == "Ammagon's Hut" then
    route.targetGroup = "Ammagon_Hut"
  else
    route.targetGroup = "Bularr_Fortress"
  end
end

return p