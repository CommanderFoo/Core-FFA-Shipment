local ffa_data = script:GetCustomProperty("ffa_data")

-- DEBUGS

local DEBUG_RESET = true

function on_player_joined(player)
	local data = Storage.GetSharedPlayerData(ffa_data, player)

	if(data.ll) then
		player:SetResource("level", data.ll or 1)
	end

	if(data.xp) then
		player:SetResource("xp", data.xp)
	end

	Events.BroadcastToAllPlayers("on_player_joined", player.name)
end

function on_player_left(player)
	local xp = player:GetResource("xp")
	local level = player:GetResource("level") or 1

	-- TODO:  don't hardcode this
	-- we set the xp that is stored in the shared key to a max 
	-- value to prevent it getting blown up too big and
	-- using too much key space
	
	if(xp > 120280) then
		xp = 120280
	end

	if(DEBUG_RESET) then
		xp = 0
		level = 1
	end

	Storage.SetSharedPlayerData(ffa_data, player, {

		["ll"] = level,
		["xp"] = xp

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