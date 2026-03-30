--[[

Some notes:

The Lua implementation of ModAudio exports a global method "accessPath(obj, ...)".
This can be used to access nested properties on objects without having to check for nil (null) at every step.
If an intermediary property turns out to be nil, then the method exits early and returns nil instead of crashing.

For example:

local difficulty = accessPath(atlyss, 'mainPlayer', '_playerMapInstance', '_patternInstance', '_setDungeonDifficulty')

if difficulty == nil then
  -- Set a base difficulty
  difficulty = 0
end

]]

-- Package exports table
-- Add methods to be used by ModAudio with the "p.your_method_name()" syntax
local p = {}

local modName = "Catman-Homebrewery"

local function makeWeaponName(itemFolder, itemName)
  return "#HB#" .. itemName:gsub("`", "") .. "`" .. modName .. "-Weapon-" .. itemFolder .. "#HB#"
end

local weaponGroups =
{
  [makeWeaponName("WolfKann_FryingPanPort", "Frying Pan")] = "FryingPan",
}

local hitEffects =
{
  [makeWeaponName("WolfKann_FryingPanPort", "Frying Pan")] = "weaponHit_Normal(average)",
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

-- Returns the export table, keep this intact
return p