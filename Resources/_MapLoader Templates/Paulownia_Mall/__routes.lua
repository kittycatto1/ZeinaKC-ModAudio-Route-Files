p = {}

function p.target_group_PaulowniaMall(route)
  elseif atlyss.inGameUI._reigonTitle == "Club Escapade" then
    route.targetGroup = "Club_Escapade"
  elseif atlyss.inGameUI._reigonTitle == "Chagall Cafe" then
    route.targetGroup = "Chagall_Cafe"
  elseif atlyss.inGameUI._reigonTitle == "Be_Blue_V" then
    route.targetGroup = "Be_Blue_V"
  elseif atlyss.inGameUI._reigonTitle == "East Tatsumi Kōban" then
    route.targetGroup = "East_Tatsumi_Koban"
  elseif atlyss.inGameUI._reigonTitle == "Mayoido Antiques" then
    route.targetGroup = "Mayoido_Antiques"
  elseif atlyss.inGameUI._reigonTitle == "Aohige Pharmancy" then
    route.targetGroup = "Aohige_Pharmancy"
  elseif atlyss.inGameUI._reigonTitle == "Arcade" then
    route.targetGroup = "Arcade"
  else
    route.targetGroup = "Paulownia_Mall"
  end
end

return p