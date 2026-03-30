local p = {}

local modName = "ZeinaKC-Zeinas_Quests_Pack"

local function makeWeaponName(itemFolder, itemName)
  return "#HB#" .. itemName:gsub("`", "") .. "`" .. modName .. "-Weapon-" .. itemFolder .. "#HB#"
end

local weaponData =
{
  [makeWeaponName("WolfKann_FryingPanPort", "Frying Pan")] = {
    group="FryingPan",
    originalHitSound="weaponHit_Normal(average)",
  },
}

local lastEquippedWeaponName = ""

function p.pack_update()
  local currentWeaponName = accessPath(atlyss, 'mainPlayer', '_pCombat', '_equippedWeapon', '_itemName')

  if currentWeapon ~= nil then
    lastEquippedWeaponName = currentWeaponName
  end
end

function p.target_group_WeaponSheathe(route)
  -- Skip route if no weapon is available, or it's not part of our audio pack's weapons
  if lastEquippedWeaponName == nil or weaponData[lastEquippedWeaponName] == nil then
    route.skipRoute = true
    return
  end

  route.targetGroup = weaponData[lastEquippedWeaponName].group
end

function p.target_group_WeaponCharge(route)
  local weaponName = accessPath(atlyss, 'mainPlayer', '_pCombat', '_equippedWeapon', '_itemName')
  local selectedGroup = nil
  
  -- Skip route if no weapon is equipped, or it's not part of our audio pack's weapons
  if weaponName == nil or weaponData[weaponName] == nil then
    route.skipRoute = true
    return
  end

  route.targetGroup = weaponData[weaponName].group
end

function p.target_group_WeaponHit(route)
  local weaponName = accessPath(atlyss, 'mainPlayer', '_pCombat', '_equippedWeapon', '_itemName')

  -- Skip route if no weapon is equipped, or it's not part of our audio pack's weapons
  if weaponName == nil or weaponData[weaponName] == nil then
    route.skipRoute = true
    return
  end

  -- Skip route if the clip that's playing is not related to this weapon's original hit sound
  if weaponData[weaponName].originalHitSound ~= route.clipName then
    route.skipRoute = true
    return
  end

  route.targetGroup = weaponData[weaponName].group
end

return p