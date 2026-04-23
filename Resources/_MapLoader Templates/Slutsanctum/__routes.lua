p = {}

function p.target_group_Slutsanctum(route)
  if atlyss.inGameUI._reigonTitle == "Slime Park" then
    route.targetGroup = "Slime_Park"
  else
    route.targetGroup = "Slutsanctum"
  end
end

return p