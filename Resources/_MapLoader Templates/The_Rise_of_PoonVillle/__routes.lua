p = {}

function p.target_group_PoonVillle(route)
  if atlyss.inGameUI._reigonTitle == "Reminesecence" then
    route.targetGroup = "Reminesecence"
  elseif atlyss.inGameUI._reigonTitle == "Aurum" then
    route.targetGroup = "Aurum"
  elseif atlyss.inGameUI._reigonTitle == "Glastonbury" then
    route.targetGroup = "Glastonbury"
  elseif atlyss.inGameUI._reigonTitle == "Northsire Abbey" then
    route.targetGroup = "Northsire_Abbey"
  else
    route.targetGroup = "PoonVillle"
  end
end

function p.target_group_OakFields(route)
  if atlyss.inGameUI._reigonTitle == "Ordel Village" then
    route.targetGroup = "Ordel_Village"
  elseif atlyss.inGameUI._reigonTitle == "Terrace_Mountain" then
    route.targetGroup = "Terrace_Mountain"
  elseif atlyss.inGameUI._reigonTitle == "Bahi_Side" then
    route.targetGroup = "Bahi_Side"
  elseif atlyss.inGameUI._reigonTitle == "Crescent_Path" then
    route.targetGroup = "Crescent_Path"
  else
    route.targetGroup = "Oak_Fields"
  end
end

function p.target_group_CelesteTerrace(route)
  if atlyss.inGameUI._reigonTitle == "Arenè Opalia" then
    route.targetGroup = "Arene_Opalia"
  else
    route.targetGroup = "Celeste_Terrace"
  end
end

return p