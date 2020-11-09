local ffa_data = script:GetCustomProperty("ffa_data")
local PIXELDEPTH = require(script:GetCustomProperty("PIXELDEPTH_API"))
local weapon_assets = script:GetCustomProperty("weapon_assets"):WaitForObject()

PIXELDEPTH.Utils = PIXELDEPTH.require("Utils")

local WEAPONS = PIXELDEPTH.require("Weapons", false, script)
local PERKS = PIXELDEPTH.require("Perks", false, script)

function on_player_joined(player)
	local data = Storage.GetSharedPlayerData(ffa_data, player)

	PIXELDEPTH.Utils.dumpp(data)

	give_weapon(player, data)
	player.diedEvent:Connect(on_player_died)
end

function change_class(player, class_index)
	local data = Storage.GetSharedPlayerData(ffa_data, player)

	data.dc = class_index

	Storage.SetSharedPlayerData(ffa_data, player, data)
end

function give_weapon(player, data, disabled)
	local the_weapon = 1
	local default_class = "c1"

	if(data.dc) then
		default_class = "c" .. data.dc
	end

	if(data[default_class]) then
		the_weapon = data[default_class]
	end

	local weapon = weapon_assets.context.get(the_weapon)
	local equipment = World.SpawnAsset(weapon)

	equipment:Equip(player)

	if(disabled) then
		local abilities = player:GetAbilities()

		for i = 1, #abilities do
			abilities[i].isEnabled = false
		end
	end
end

function on_player_died(player)
	local e = player:GetEquipment()

	for k, v in pairs(e) do
		v:Destroy()
	end

	give_weapon(player, Storage.GetSharedPlayerData(ffa_data, player))
end

function send_player_data(player)
	local data = Storage.GetSharedPlayerData(ffa_data, player)

	Events.BroadcastToPlayer(player, "on_data", data)
end

Game.playerJoinedEvent:Connect(on_player_joined)

Events.ConnectForPlayer("on_change_class", change_class)
Events.ConnectForPlayer("on_ready_for_data", send_player_data)