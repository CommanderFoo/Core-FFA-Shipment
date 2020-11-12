local ffa_data = script:GetCustomProperty("ffa_data")
local PIXELDEPTH = require(script:GetCustomProperty("PIXELDEPTH_API"))

PIXELDEPTH.Utils = PIXELDEPTH.require("Utils")

local players = {}

function on_player_damaged(player, damage)
    if(damage.sourcePlayer) then
		Events.BroadcastToPlayer(player, "on_damaged", damage.sourcePlayer, player.hitPoints)
		Events.BroadcastToPlayer(damage.sourcePlayer, "on_damage_hit", player)
	end
	
	if(players[player.id]) then
		players[player.id].damage_timestamp = time()
	end
end

function on_player_joined(player)
	if(not players[player.id]) then
		players[player.id] = {

			damage_timestamp = 0

		}
	end

	local data = Storage.GetSharedPlayerData(ffa_data, player)

	player:SetResource("xp", data.xp or 0)
	player:SetResource("level", data.l or 1)
	player:SetResource("total_kills", data.k or 0)
	player:SetResource("total_deaths", data.d or 0)
	player:SetResource("high_kill_streak", data.ks or 0)

	Events.BroadcastToAllPlayers("on_player_joined", player.name)

	player.damagedEvent:Connect(on_player_damaged)
end

function on_player_left(player)
	local data = Storage.GetSharedPlayerData(ffa_data, player)

	local xp = player:GetResource("xp")
	local level = player:GetResource("level") or 1
	local total_deaths = player:GetResource("total_deaths")
	local total_kills = player:GetResource("total_kills")
	local high_kill_streak = player:GetResource("high_kill_streak")

	if(xp > 120280) then
		xp = 120280
	end

	--xp = 0
	--level = 1

	if(level < 15) then
		data.c3 = 1

		if(data.dc == 3) then
			data.dc = 1
		end
	end

	if(level < 10) then
		data.c2 = 1

		if(data.dc == 2) then
			data.dc = 1
		end
	end

	if(level < 5) then
		data.c1 = 1
		data.dc = 1
	end

	Storage.SetSharedPlayerData(ffa_data, player, {

		["xp"] = xp,
		["l"] = level,
		["d"] = total_deaths,
		["k"] = total_kills,
		["ks"] = high_kill_streak,
		["c1"] = data.c1 or 1,
		["c2"] = data.c2 or 1,
		["c3"] = data.c3 or 1,
		["dc"] = data.dc or 1

	})

	Events.BroadcastToAllPlayers("on_player_left", player.name)

	if(players[player.id]) then
		players[player.id] = nil
	end
end

function disable_player(player)
	local abilities = player:GetAbilities()

	for i = 1, #abilities do
		abilities[i].isEnabled = false
	end

	player.movementControlMode = MovementControlMode.NONE
	player.lookControlMode = LookControlMode.NONE
	player.maxJumpCount = 0
	player.isCrouchEnabled = false
end

function enable_player(player)
	local abilities = player:GetAbilities()

	for i = 1, #abilities do
		abilities[i].isEnabled = true
	end

	player.movementControlMode = MovementControlMode.VIEW_RELATIVE
	player.lookControlMode = LookControlMode.RELATIVE
	player.maxJumpCount = 1
	player.isCrouchEnabled = true
end

function player_levelled(player, level)
	player:SetResource("level", level)
end

local regen_time_after_damage = 5
local regen_amount = 10

function regen()
	for k, player in pairs(Game.GetPlayers()) do
		if(players[player.id] and player.hitPoints < player.maxHitPoints and players[player.id].damage_timestamp > 0) then
			if(time() > (players[player.id].damage_timestamp + regen_time_after_damage)) then
				player.hitPoints = math.min(player.hitPoints + regen_amount, player.maxHitPoints) 
			end
		end
	end
end

local regen_task = Task.Spawn(function()
	regen()
end)

regen_task.repeatCount = -1
regen_task.repeatInterval = 1

Game.playerJoinedEvent:Connect(on_player_joined)
Game.playerLeftEvent:Connect(on_player_left)

Events.ConnectForPlayer("on_ui_open", disable_player)
Events.ConnectForPlayer("on_ui_close", enable_player)
Events.ConnectForPlayer("on_player_levelled", player_levelled)