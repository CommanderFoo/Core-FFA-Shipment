function on_player_died(player, damage)
	if(damage.sourceAbility or damage.reason == DamageReason.FRIENDLY_FIRE) then
		local evt_data = {
			
			["by"] = damage.sourcePlayer.name,
			["who"] = player.name,
			["ks"] = 0,
			["s"] = false

		}

		local total_deaths = player:GetResource("total_deaths")
		local deaths = player:GetResource("deaths")

		if(player.id ~= damage.sourcePlayer.id) then
			local kill_streak = damage.sourcePlayer:GetResource("kill_streak")
			local xp = damage.sourcePlayer:GetResource("xp")
			local total_kills = damage.sourcePlayer:GetResource("total_kills")
			local high_kill_streak = damage.sourcePlayer:GetResource("high_kill_streak")
			local kills = damage.sourcePlayer:GetResource("kills")

			local new_kill_streak = kill_streak + 1;

			damage.sourcePlayer:SetResource("kill_streak", new_kill_streak)
			damage.sourcePlayer:SetResource("xp", xp + 100)
			damage.sourcePlayer:SetResource("total_kills", total_kills + 1)
			damage.sourcePlayer:SetResource("kills", kills + 1)

			if(new_kill_streak > high_kill_streak) then
				damage.sourcePlayer:SetResource("high_kill_streak", new_kill_streak)
			end

			local on_kill_streak = false

			if(new_kill_streak % 5 == 0) then
				on_kill_streak = true
			end

			if(on_kill_streak) then
				evt_data.ks = new_kill_streak
			end
			
			player:SetResource("kill_streak", 0)
			player:SetResource("total_deaths", total_deaths + 1)
			player:SetResource("deaths", deaths + 1)
		elseif(player.id == damage.sourcePlayer.id and damage.reason == DamageReason.FRIENDLY_FIRE) then
			player:SetResource("kill_streak", 0)
			player:SetResource("total_deaths", total_deaths + 1)
			player:SetResource("deaths", deaths + 1)

			evt_data.s = true
		end

		Events.BroadcastToAllPlayers("on_player_killed", evt_data)
	end
end

function on_player_joined(player)
	player.diedEvent:Connect(on_player_died)
end

Game.playerJoinedEvent:Connect(on_player_joined)
