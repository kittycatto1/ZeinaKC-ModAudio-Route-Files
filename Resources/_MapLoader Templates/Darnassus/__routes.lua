p = {}

function p.target_group_Darnassus(route)
  if atlyss.inGameUI._reigonTitle == "Dolaraar" then
    route.targetGroup = "Dolaraar"
  elseif atlyss.inGameUI._reigonTitle == "Teldrassil" then
    route.targetGroup = "Teldrassil"
  elseif atlyss.inGameUI._reigonTitle == "Starbreeze Village" then
    route.targetGroup = "Starbreeze_Village"
  elseif atlyss.inGameUI._reigonTitle == "Pools of Arlithrien" then
    route.targetGroup = "Pools_of_Arlithrien"
  elseif atlyss.inGameUI._reigonTitle == "Lake Al'Ameth" then
    route.targetGroup = "Lake AlAmeth"
  elseif atlyss.inGameUI._reigonTitle == "Gnarlpine" then
    route.targetGroup = "Gnarlpine"
  elseif atlyss.inGameUI._reigonTitle == "Hidden Lake" then
    route.targetGroup = "Hidden Lake"
  else
    route.targetGroup = "Darnassus"
  end
end

return p