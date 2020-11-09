local PIXELDEPTH = require(script:GetCustomProperty("PIXELDEPTH_API"))

PIXELDEPTH.Utils = PIXELDEPTH.require("Utils")
PIXELDEPTH.Tween = PIXELDEPTH.require("Tween")
PIXELDEPTH.Tween.Easings = PIXELDEPTH.require("Tween_Easings")

local class_ui = script:GetCustomProperty("class_ui"):WaitForObject()
local class_btns = script:GetCustomProperty("class_btns"):WaitForObject()
local active_class_color = script:GetCustomProperty("active_class_color")
local notice = script:GetCustomProperty("notice"):WaitForObject()

local local_player = Game.GetLocalPlayer()
local is_active = false;
local current_class = 1

local buttons = class_btns:GetChildren()

local DATA = {}
local can_open_ui = false

local buttons_data = {}
local button_events_setup = false

local notice_active = false
local notice_tween = nil

function on_binding_pressed(player, binding)
	if(not can_open_ui) then
		return
	end

	-- Bound to F

	if binding == "ability_extra_33" then
		if(not is_active) then
			is_active = true
			class_ui.visibility = Visibility.FORCE_ON

			UI.SetCanCursorInteractWithUI(true)
			UI.SetCursorVisible(true)
			UI.SetReticleVisible(false)

			Events.BroadcastToServer("on_ui_open")
		else
			is_active = false
			class_ui.visibility = Visibility.FORCE_OFF

			notice_tween = nil
			notice_active = false
			notice:SetColor(Color.New(255, 255, 255, 0))
			
			UI.SetCanCursorInteractWithUI(false)
			UI.SetCursorVisible(false)
			UI.SetReticleVisible(true)

			Events.BroadcastToServer("on_ui_close")
		end
	end
end

function get_data(player)
	if(player.id == local_player.id) then
		Events.BroadcastToServer("on_ready_for_data", player)
	end
end

function Tick(dt)
	if(notice_tween ~= nil and notice_tween:active()) then
		notice_tween:on_change(function(v)
			local col = notice:GetColor()

			col.a = v.a
			notice:SetColor(col)
		end)

		notice_tween:on_complete(function()
			notice_tween = nil
		end)

		notice_tween:start(dt)
	end
end

function button_click(index)
	if(DATA.dc and DATA.dc == index) then
		return
	end

	if(notice_tween == nil and not notice_active) then
		notice_active = true
		notice_tween = PIXELDEPTH.Tween:new(.8, {a = 0}, {a = 1})
	end

	Events.BroadcastToServer("on_change_class", index)

	if(buttons_data[index].enabled) then
		DATA.dc = index
	end

	update_buttons(index)

	buttons_data[1].button.isInteractable = false
	buttons_data[3].button.isInteractable = false
	buttons_data[2].button.isInteractable = false

	Task.Spawn(function()
		Task.Wait(.5)

		if(index == 1 or buttons_data[1].enabled) then
			buttons_data[1].button.isInteractable = true
		end

		if(index == 2 or buttons_data[2].enabled) then
			buttons_data[2].button.isInteractable = true
		end

		if(index == 3 or buttons_data[3].enabled) then
			buttons_data[3].button.isInteractable = true
		end
	end)
end

function data_received(data)
	can_open_ui = true
	DATA = data

	buttons_data[1] = {

		button = buttons[1],
		enabled = (DATA.l >= 5) and true or false,
		event = button_click
	
	}

	buttons_data[2] = {

		button = buttons[2],
		enabled = (DATA.l >= 10) and true or false,
		event = button_click
	
	}

	buttons_data[3] = {

		button = buttons[3],
		enabled = (DATA.l >= 15) and true or false,
		event = button_click
	
	}

	update_buttons()
end

function update_buttons()
	for b = 1, #buttons do
		if(buttons_data[b]) then
			if(buttons_data[b].enabled) then
				buttons_data[b].button.isInteractable = true
				
				if(DATA.dc == b) then
					buttons_data[b].button:SetButtonColor(active_class_color)
				else
					buttons_data[b].button:SetButtonColor(Color.BLACK)
				end
			else
				buttons_data[b].button.isInteractable = false
				buttons_data[b].button:SetButtonColor(Color.BLACK)
			end

			if(not button_events_setup) then
				buttons_data[b].button.clickedEvent:Connect(function()
					buttons_data[b].event(b)
				end)
			end
		end
	end

	button_events_setup = true
end

Game.playerJoinedEvent:Connect(get_data)
local_player.bindingPressedEvent:Connect(on_binding_pressed)
Events.Connect("on_data", data_received)