local feed_container = script:GetCustomProperty("feed_container"):WaitForObject()
local feed_line = script:GetCustomProperty("feed_line")
local feed_line_color = script:GetCustomProperty("feed_line_color")

local local_player = Game.GetLocalPlayer()

local feed = {}

local duration = 3;
local fade_duration = 1

function player_joined(name)
	add_feed_msg(string.format("%s has joined", name))
end

function player_left(name)
	add_feed_msg(string.format("%s has left", name))
end

function player_killed(data)
	add_feed_msg(string.format("%s killed %s", data.by, data.who))

	if(data.ks > 0) then
		player_killstreak(data.by, data.ks)
	end
end

function player_killstreak(name, killstreak)
	add_feed_msg(string.format("%s is on a %u killstreak", name, killstreak))
end

function Tick(delta_time)
	fade_out_feed_lines()
end

function fade_out_feed_lines()
	for i = 1, #feed do
		if(feed[i] and feed[i].asset) then
			local age = time() - feed[i].time_added

			feed_line_color.a = CoreMath.Clamp(1.0 - (age - duration) / fade_duration, 0, 1.0)
			feed[i].asset:SetColor(feed_line_color)

			if(feed[i].asset:GetColor().a <= 0) then
				refresh_feed()
			end
		end
	end
end

function refresh_feed()
	local counter = 0
	local total = #feed
	local to_show = 6
	local to_remove = total - to_show

	for index = 1, #feed do
		if(not feed[index].asset) then
			feed[index].asset = World.SpawnAsset(feed_line, {parent = feed_container})
			feed[index].asset.text = tostring(feed[index].text)
		end

		if(to_remove > 0 or feed[index].asset:GetColor().a <= 0) then
			feed[index].kill = true
		else	
			feed[index].asset.y = counter * 50
			counter = counter + 1
		end
			
		to_remove = to_remove - 1
	end

	for kdex = #feed, 1, -1 do
		if(feed[kdex] and feed[kdex].kill) then
			feed[kdex].asset:Destroy()
			table.remove(feed, kdex)
		end
	end
end

function add_feed_msg(msg)
	table.insert(feed, {

		["time_added"] = time(),
		["text"] = tostring(msg)

	})

	refresh_feed()
end

Events.Connect("on_player_joined", player_joined)
Events.Connect("on_player_left", player_left)
Events.Connect("on_player_killed", player_killed)