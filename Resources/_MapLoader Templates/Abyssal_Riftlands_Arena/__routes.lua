p = {}

function p.target_group_RiftlandsArena(route)
  if atlyss.inGameUI._reigonTitle == "Pit of Heresy" then
    route.targetGroup = "Pit_of_Heresy"
  elseif atlyss.inGameUI._reigonTitle == "Piece of Fray" then
    route.targetGroup = "Piece_of_Fray"
  else
    route.targetGroup = "Riftlands_Arena"
  end
end

return p