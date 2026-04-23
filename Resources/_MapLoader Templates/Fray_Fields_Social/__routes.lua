p = {}

function p.target_group_FrayFieldsSocial(route)
  if atlyss.inGameUI._reigonTitle == "Arch Valley" then
    route.targetGroup = "Arch_Valleey"
  elseif atlyss.inGameUI._reigonTitle == "Fern Isles" then
    route.targetGroup = "Fern_Isles"
  elseif atlyss.inGameUI._reigonTitle == "Picnic Area" then
    route.targetGroup = "Picnic_Area"
  elseif atlyss.inGameUI._reigonTitle == "Camp Site" then
    route.targetGroup = "Camp_Site"
  elseif atlyss.inGameUI._reigonTitle == "BrawlZBoy Tree" then
    route.targetGroup = "BrawlZBoy_Tree"
  elseif atlyss.inGameUI._reigonTitle == "Fray_Tree" then
    route.targetGroup = "Fray_Tree"
  elseif atlyss.inGameUI._reigonTitle == "Silverwood" then
    route.targetGroup = "Silverwood"
  elseif atlyss.inGameUI._reigonTitle == "Abyssal Riftlands" then
    route.targetGroup = "Abyssal_Riftlands"
  elseif atlyss.inGameUI._reigonTitle == "Howiling Mountain" then
    route.targetGroup = "Howiling_Mountain"
  elseif atlyss.inGameUI._reigonTitle == "Sacred Reach" then
    route.targetGroup = "Sacred_Reach"
  else
    route.targetGroup = "Fray_Outskirts"
  end
end

return p