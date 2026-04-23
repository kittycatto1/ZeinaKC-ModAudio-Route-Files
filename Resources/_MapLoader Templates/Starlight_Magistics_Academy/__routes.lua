p = {}

function p.target_group_FrayValley(route)
  if atlyss.inGameUI._reigonTitle == "Valley Gate" then
    route.targetGroup = "Valley_Gate"
  elseif atlyss.inGameUI._reigonTitle == "Solarium Gate" then
    route.targetGroup = "Solarium_Gate"
  else
    route.targetGroup = "FrayValley"
  end
end

function p.target_group_StarlightAether(route)
  if atlyss.inGameUI._reigonTitle == "Aether Ridge" then
    route.targetGroup = "Aether_Ridge"
  elseif atlyss.inGameUI._reigonTitle == "Stradwood" then
    route.targetGroup = "Stradwood"
  elseif atlyss.inGameUI._reigonTitle == "Celestial Canyon" then
    route.targetGroup = "Celestial_Canyon"
  else
    route.targetGroup = "Starlight_Aether"
  end
end

return p