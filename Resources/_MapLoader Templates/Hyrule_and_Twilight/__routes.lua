p = {}

function p.target_group_HikarikoVillage(route)
  if atlyss.inGameUI._reigonTitle == "Elden Springs" then
    route.targetGroup = "Elden_Springs"
  else
    route.targetGroup = "Hikariko_Village"
  end
end

function p.target_group_FaronProvidence(route)
  if atlyss.inGameUI._reigonTitle == "Hikari Temple" then
    route.targetGroup = "Hikari_Temple"
  elseif atlyss.inGameUI._reigonTitle == "Temple of Amork" then
    route.targetGroup = "Temple_of_Amork"
  else
    route.targetGroup = "Faron_Providence"
  end
end

function p.target_group_TwilightVeil(route)
  if atlyss.inGameUI._reigonTitle == "Twilight Islands" then
    route.targetGroup = "Twilight_Islands"
  elseif atlyss.inGameUI._reigonTitle == "Twilight Wastelands" then
    route.targetGroup = "Twilight_Wastelands"
  else
    route.targetGroup = "Twilight_Veil"
  end
end

function p.target_group_HikariKingdom(route)
  if atlyss.inGameUI._reigonTitle == "North Elden Pass" then
    route.targetGroup = "North_Elden_Pass"
  elseif atlyss.inGameUI._reigonTitle == "Elden Bridge" then
    route.targetGroup = "Elden_Bridge"
  elseif atlyss.inGameUI._reigonTitle == "Elden Bridge Pass" then
    route.targetGroup = "Elden_Bridge_Pass"
  elseif atlyss.inGameUI._reigonTitle == "James Village" then
    route.targetGroup = "James_Village"
  elseif atlyss.inGameUI._reigonTitle == "Valkyrian Mountain Pass" then
    route.targetGroup = "Valkyrian_Mountain_Pass"
  elseif atlyss.inGameUI._reigonTitle == "Valkyrian_Mountain" then
    route.targetGroup = "Valkyrian_Mountain"
  elseif atlyss.inGameUI._reigonTitle == "Lake Lorelei" then
    route.targetGroup = "Lake_Lorelei"
  elseif atlyss.inGameUI._reigonTitle == "Lorelei Springs" then
    route.targetGroup = "Lorelei_Springs"
  elseif atlyss.inGameUI._reigonTitle == "IronClaw Village" then
    route.targetGroup = "IronClaw_Village"
  elseif atlyss.inGameUI._reigonTitle == "Kami Fields" then
    route.targetGroup = "Kami_Fields"
  elseif atlyss.inGameUI._reigonTitle == "Twilight Town" then
    route.targetGroup = "Twilight_Town"
  elseif atlyss.inGameUI._reigonTitle == "Anmir Desert" then
    route.targetGroup = "Anmir_Desert"
  elseif atlyss.inGameUI._reigonTitle == "Arbiter's Grounds" then
    route.targetGroup = "Arbiters_Grounds"
  elseif atlyss.inGameUI._reigonTitle == "Mirror Chamber" then
    route.targetGroup = "Mirror Chamber"
  else
    route.targetGroup = "Hikari_Kingdom"
  end
end

function p.target_group_ButchersCircus(route)
  if atlyss.inGameUI._reigonTitle == "Battle!" then
    route.targetGroup = "Battle"
  else
    route.targetGroup = "Butchers_Circus"
  end
end

function p.target_group_HikariCastle(route)
  if atlyss.inGameUI._reigonTitle == "Hikari Castle Entrance" then
    route.targetGroup = "Hikari_Castle_Entrance"
  elseif atlyss.inGameUI._reigonTitle == "Inside Hikari Castle" then
    route.targetGroup = "Inside_Hikari_Castle"
  elseif atlyss.inGameUI._reigonTitle == "Hikari Castle" then
    route.targetGroup = "Hikari_Castle"
  elseif atlyss.inGameUI._reigonTitle == "Throne Room" then
    route.targetGroup = "Throne_Room"
  elseif atlyss.inGameUI._reigonTitle == "West Hikari Courtyard" then
    route.targetGroup = "West_Hikari_Courtyard"
  elseif atlyss.inGameUI._reigonTitle == "Hikari Royal Graveyard" then
    route.targetGroup = "Hikari_Royal_Graveyard"
  elseif atlyss.inGameUI._reigonTitle == "East Hikari Courtyard" then
    route.targetGroup = "East_Hikari_Courtyard"
  else
    route.targetGroup = "Hikari_Castle"
  end
end

return p