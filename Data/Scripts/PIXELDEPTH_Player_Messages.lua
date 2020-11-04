local PIXELDEPTH = require(script:GetCustomProperty("PIXELDEPTH_API"))

PIXELDEPTH.Utils = PIXELDEPTH.require("Utils")
PIXELDEPTH.Tween = PIXELDEPTH.require("Tween")
PIXELDEPTH.Tween.Easings = PIXELDEPTH.require("Tween_Easings")

local promo_txt = script:GetCustomProperty("promo_txt")
local msgs_container = script:GetCustomProperty("msgs_container"):WaitForObject()

local queue = PIXELDEPTH.Utils.Queue.new()
local current_item = nil
local fade_in_tween = nil
local fade_out_tween = nil
local sound_played = false

function Tick(dt)
	if(queue:length() > 0 and current_item == nil) then
		current_item =  World.SpawnAsset(promo_txt, {parent = msgs_container})
		current_item.text = queue:pop()
		sound_played = false
		fade_in_tween = PIXELDEPTH.Tween:new(3, {a=0}, {a=1})
		fade_out_tween = PIXELDEPTH.Tween:new(1, {a=1}, {a=0})
	end

	if(current_item) then
		if(fade_in_tween and fade_in_tween:active()) then
			fade_in_tween:on_complete(function()
				fade_in_tween = nil
				fade_out_tween:start(dt)
			end)
			
			fade_in_tween:on_change(function(changed)
				local col = current_item:GetColor()
	
				if(not sound_played and changed.a > 0.5) then
					current_item:GetChildren()[1]:Play()
					sound_played = true
				end

				col.a = changed.a
				current_item:SetColor(col)
			end)
	
			fade_in_tween:set_easing("outExpo")
			fade_in_tween:delay(.5)
			fade_in_tween:start(dt)
		elseif(fade_out_tween and fade_out_tween:active()) then
			fade_out_tween:on_complete(function()
				current_item:Destroy()
				current_item = nil
				fade_out_tween = nil
			end)
			
			fade_out_tween:on_change(function(changed)
				local col = current_item:GetColor()
	
				col.a = changed.a
				current_item:SetColor(col)
			end)

			fade_out_tween:delay(1)	
			fade_out_tween:start(dt)
		end
	end
end

function add_to_queue(rank)
	queue:push("You have been promoted to " .. rank)
end

Events.Connect("player_promoted", add_to_queue)