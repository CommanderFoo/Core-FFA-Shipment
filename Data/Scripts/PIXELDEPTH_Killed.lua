function on_player_died(player, damage)
	if damage.sourceAbility then
		local evt_data = {
			
			["by"] = damage.sourcePlayer.name,
			["who"] = player.name,
			["ks"] = 0
		}

		if(player.id ~= damage.sourcePlayer.id) then
			local ks = damage.sourcePlayer:GetResource("ks")
			local xp = damage.sourcePlayer:GetResource("xp")

			local new_ks = ks + 1;

			damage.sourcePlayer:SetResource("ks", new_ks)
			damage.sourcePlayer:SetResource("xp", xp + 100)
			
			local on_kill_streak = false

			if(new_ks % 5 == 0) then
				on_kill_streak = true
			end

			if(on_kill_streak) then
				evt_data.ks = new_ks
			end
			
			player:SetResource("ks", 0)
		end

		Events.BroadcastToAllPlayers("on_player_killed", evt_data)
	end
end

function on_player_joined(player)
	player.diedEvent:Connect(on_player_died)
end

Game.playerJoinedEvent:Connect(on_player_joined)
