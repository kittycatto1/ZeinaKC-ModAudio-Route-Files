p = {}

function p.target_group_DistantMemory(route)
  if atlyss.inGameUI._reigonTitle == "Bonfire" then
    route.targetGroup = "Bonfire"
  else
    route.targetGroup = "Distant_Memory"
  end
end

return p