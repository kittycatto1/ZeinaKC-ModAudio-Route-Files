local p = {}

local modName = "ZeinaKC-Zeinas_Quests_Pack"

local function makeWeaponName(itemFolder, itemName)
  return "#HB#" .. itemName:gsub("`", "") .. "`" .. modName .. "-Weapon-" .. itemFolder .. "#HB#"
end

local weaponGroups =
{
  [makeWeaponName("Loosened_Follycannon", "Loosened Follycannon")] = "LF",
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
end

return p