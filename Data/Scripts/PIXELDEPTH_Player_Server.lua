local ffa_data = script:GetCustomProperty("ffa_data")

function on_player_joined(player)
	local data = Storage.GetSharedPlayerData(ffa_data, player)

	print(player.name, "XP: " .. data.xp, "Level: " .. data.l, "Total Kills: " .. data.k, "Total Deaths: " .. data.d, "Kill Streak: " .. data.ks)

	player:SetResource("xp", data.xp or 0)
	player:SetResource("level", data.l or 1)
	player:SetResource("total_kills", data.k or 0)
	player:SetResource("total_deaths", data.d or 0)
	player:SetResource("high_kill_streak", data.ks or 0)

	Events.BroadcastToAllPlayers("on_player_joined", player.name)
end

function on_player_left(player)
	local xp = player:GetResource("xp")
	local level = player:GetResource("level") or 1
	local total_deaths = player:GetResource("total_deaths")
	local total_kills = player:GetResource("total_kills")
	local high_kill_streak = player:GetResource("high_kill_streak")

	if(xp > 120280) then
		xp = 120280
	end

	Storage.SetSharedPlayerData(ffa_data, player, {

		["xp"] = xp,
		["l"] = level,
		["d"] = total_deaths,
		["k"] = total_kills,
		["ks"] = high_kill_streak

	})

	Events.BroadcastToAllPlayers("on_player_left", player.name)
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

Game.playerJoinedEvent:Connect(on_player_joined)
Game.playerLeftEvent:Connect(on_player_left)

Events.ConnectForPlayer("on_ui_open", disable_player)
Events.ConnectForPlayer("on_ui_close", enable_player)
Events.ConnectForPlayer("on_player_levelled", player_levelled)