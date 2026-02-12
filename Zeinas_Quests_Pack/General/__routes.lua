local p = {}

local modName = "ZeinaKC-Zeinas_Quests_Pack"

local function makeWeaponName(itemFolder, itemName)
  return "#HB#" .. itemName:gsub("`", "") .. "`" .. modName .. "-Weapon-" .. itemFolder .. "#HB#"
end

local weaponGroups =
{
  [makeWeaponName("Enok_Axe", "Enok's Axe")] = "EnokAxe",
  [makeWeaponName("Sally_Broom", "Sally's Broom")] = "SallyBroom",
  [makeWeaponName("Ammagon_Sword", "Ammagon's Broom")] = "AmmagonSword",
  [makeWeaponName("Fishing_Rod", "Torta's Fishing Rod")] = "FishingRod",
  [makeWeaponName("Pickaxe", "Ruka's Pickaxe")] = "Pickaxe",
  [makeWeaponName("The_Purifier", "The Purifier")] = "Purifier",
  [makeWeaponName("Fishing_Rod_Golden", "Golden Fishing Rod")] = "FishingRodElite",
  [makeWeaponName("Pickaxe_Golden", "Golden Pickaxe")] = "PickaxeElite",
  [makeWeaponName("The_Purifier_Elite", "The Purifier Elite")] = "PurifierElite",
  [makeWeaponName("Blade_of_Injustice_Geistlord", "Geistlord Blade of Injustice")] = "Geistlord_Injustice",
  [makeWeaponName("Blade_of_Injustice_Colossi", "Colossi Blade of Injustice")] = "Colossal_Injustice",
  [makeWeaponName("Blade_of_Injustice_Boarus", "Boarus Blade of Injustice")] = "Boarus_Injustice",
}

local hitEffects =
{
  [makeWeaponName("Enok_Axe", "Enok's Axe")] = "weaponHit_Normal(heavy)",
  [makeWeaponName("Sally_Broom", "Sally's Broom")] = "weaponHit_Air(average)",
  [makeWeaponName("Ammagon_Sword", "Ammagon's Sword")] = "weaponHit_Normal(average)",
  [makeWeaponName("Fishing_Rod", "Torta's Fishing Rod")] = "weaponHit_Water(average)",
  [makeWeaponName("Pickaxe", "Ruka's Pickaxe")] = "weaponHit_Earth(average)",
  [makeWeaponName("The_Purifier", "The Purifier")] = "weaponHit_Holy(average)",
  [makeWeaponName("Fishing_Rod_Golden", "Golden Fishing Rod")] = "weaponHit_Water(average)",
  [makeWeaponName("Pickaxe_Golden", "Golden Pickaxe")] = "weaponHit_Earth(average)",
  [makeWeaponName("The_Purifier_Elite", "The Purifier Elite")] = "weaponHit_Holy(average)",
  [makeWeaponName("Blade_of_Injustice_Geistlord", "Geistlord Blade of Injustice")] = "weaponHit_Shadow(average)",
  [makeWeaponName("Blade_of_Injustice_Colossi", "Colossi Blade of Injustice")] = "weaponHit_Shadow(average)",
  [makeWeaponName("Blade_of_Injustice_Boarus", "Boarus Blade of Injustice")] = "weaponHit_Shadow(average)",
}

print("Weapon groups created: ")

for key, value in pairs(weaponGroups) do
  print("  " .. key .. " - " .. value )
end

function p.target_group_weapon(route)
  local weaponName = accessPath(atlyss, 'mainPlayer', '_pCombat', '_equippedWeapon', '_itemName')
  local selectedGroup = nil
  
  if weaponName ~= nil then
    selectedGroup = weaponGroups[weaponName]
  end
  
  if selectedGroup ~= nil then
    route.targetGroup = selectedGroup
  else
    route.skipRoute = true
  end

  if weaponName ~= nil and hitEffects[weaponName] ~= route.clipName then
    route.skipRoute = true
  end
end

return p