p = {}

function p.target_group_MedievalSprings(route)
  if atlyss.inGameUI._reigonTitle == "Medieval Arena" then
    route.targetGroup = "Medieval_Arena"
  else
    route.targetGroup = "Medieval_Springs"
  end
end

return p