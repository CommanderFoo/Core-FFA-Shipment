local kills_for_win = 10

function player_died(player, damage)
	--if(damage.sourceAbility and player.id ~= damage.sourcePlayer.id
end

Game.playerJoinedEvent:Connect(function(player)
	player.diedEvent(player_died)
end)