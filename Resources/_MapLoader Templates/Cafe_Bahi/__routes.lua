p = {}

function p.target_group_MedievalSprings(route)
  if atlyss.inGameUI._reigonTitle == "Beach Baholah" then
    route.targetGroup = "Beach_Baholah"
  elseif atlyss.inGameUI._reigonTitle == "Training_Barracks" then
    route.targetGroup = "Training_Barracks"
  elseif atlyss.inGameUI._reigonTitle == "Colosseum_Arena" then
    route.targetGroup = "Colosseum_Arena"
  else
    route.targetGroup = "Cafe_Bahi"
  end
end

return p