local ammo_count = script:GetCustomProperty("ammo_count"):WaitForObject()
local ammo_panel = script:GetCustomProperty("ammo_panel"):WaitForObject()

local local_player = Game.GetLocalPlayer()

function get_weapon()
	local equipment = local_player:GetEquipment()

	for k, v in pairs(equipment) do
		if(v:IsA("Weapon")) then
			return v
		end
	end
end

function Tick()
	local weapon = get_weapon()

	if(weapon) then
		ammo_count.text = tostring(weapon.currentAmmo) .. " / " .. tostring(weapon.maxAmmo)
		ammo_panel.visibility = Visibility.FORCE_ON
	else
		ammo_panel.visibility = Visibility.FORCE_OFF
	end
end
