local p = {}

local modName = "ZeinaKC-Zeinas_Quests_Pack"

local function makeWeaponName(itemFolder, itemName)
  return "#HB#" .. itemName:gsub("`", "") .. "`" .. modName .. "-Weapon-" .. itemFolder .. "#HB#"
end

local weaponData =
{
  [makeWeaponName("Enok_Axe", "Enok's Axe")] = {
    group="EnokAxe",
    originalHitSound="weaponHit_Normal(heavy)",
  },
  [makeWeaponName("Sally_Broom", "Sally's Broom")] = {
    group="SallyBroom",
    originalHitSound="weaponHit_Air(average)",
  },
  [makeWeaponName("Ammagon_Sword", "Ammagon's Broom")] = {
    group="AmmagonSword",
    originalHitSound="weaponHit_Normal(average)",
  },
  [makeWeaponName("Fishing_Rod", "Torta's Fishing Rod")] = {
    group="FishingRod",
    originalHitSound="weaponHit_Water(average)",
  },
  [makeWeaponName("Pickaxe", "Ruka's Pickaxe")] = {
    group="Pickaxe",
    originalHitSound="weaponHit_Earth(average)",
  },
  [makeWeaponName("The_Purifier", "The Purifier")] = {
    group="Purifier",
    originalHitSound="weaponHit_Holy(average)",
  },
  [makeWeaponName("Fishing_Rod_Golden", "Golden Fishing Rod")] = {
    group="FishingRodElite",
    originalHitSound="weaponHit_Water(average)",
  },
  [makeWeaponName("Pickaxe_Golden", "Golden Pickaxe")] = {
    group="PickaxeElite",
    originalHitSound="weaponHit_Earth(average)",
  },
  [makeWeaponName("The_Purifier_Elite", "The Purifier Elite")] = {
    group="PurifierElite",
    originalHitSound="weaponHit_Holy(average)",
  },
  [makeWeaponName("Blade_of_Injustice_Geistlord", "Geistlord Blade of Injustice")] = {
    group="Geistlord_Injustice",
    originalHitSound="weaponHit_Shadow(average)",
  },
  [makeWeaponName("Blade_of_Injustice_Colossi", "Colossi Blade of Injustice")] = {
    group="Colossal_Injustice",
    originalHitSound="weaponHit_Shadow(average)",
  },
  [makeWeaponName("Blade_of_Injustice_Boarus", "Boarus Blade of Injustice")] = {
    group="Boarus_Injustice",
    originalHitSound="weaponHit_Shadow(average)",
  },
}

local lastEquippedWeaponName = ""

function p.update_pack()
  local currentWeaponName = accessPath(atlyss, 'mainPlayer', '_pCombat', '_equippedWeapon', '_itemName')

  if currentWeapon ~= nil then
    lastEquippedWeaponName = currentWeaponName
  end
end

function p.target_group_WeaponSheathe(route)
  -- Skip route if no weapon is available, or it's not part of our audio pack's weapons
  if lastEquippedWeaponName == nil or weaponGroups[lastEquippedWeaponName] == nil then
    route.skipRoute = true
    return
  end

  route.targetGroup = weaponGroups[weaponName].group
end

function p.target_group_WeaponCharge(route)
  local weaponName = accessPath(atlyss, 'mainPlayer', '_pCombat', '_equippedWeapon', '_itemName')
  local selectedGroup = nil
  
  -- Skip route if no weapon is equipped, or it's not part of our audio pack's weapons
  if weaponName == nil or weaponGroups[weaponName] == nil then
    route.skipRoute = true
    return
  end

  route.targetGroup = weaponGroups[weaponName].group
end

function p.target_group_WeaponHit(route)
  local weaponName = accessPath(atlyss, 'mainPlayer', '_pCombat', '_equippedWeapon', '_itemName')

  -- Skip route if no weapon is equipped, or it's not part of our audio pack's weapons
  if weaponName == nil or weaponGroups[weaponName] == nil then
    route.skipRoute = true
    return
  end

  -- Skip route if the clip that's playing is not related to this weapon's original hit sound
  if weaponGroups[weaponName].originalHitSound ~= route.clipName then
    route.skipRoute = true
    return
  end

  route.targetGroup = weaponGroups[weaponName].group
end

return p