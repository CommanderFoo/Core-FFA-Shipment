local Tween = {}

Tween.Easings = require(script:GetCustomProperty("PIXELDEPTH_API_Tween_Easings"))

Tween.ease = function(from, to, original, time, duration, ease)
	for k, v in pairs(to) do
		local t = time
		local b = original[k]
		local c = v - original[k]
		local d = duration

		from[k] = Tween.Easings[ease](t, b, c, d)
	end

	return from
end

Tween.copy_table = function(t)
	local tmp = {}

	for k, v in pairs(t) do
		tmp[k] = v
	end

	return tmp
end

 function Tween:start(delta)
	if(self.tween_finished == true) then
		return
	end

	self.time = self.time + delta

	if(self.time < self.delay_tween) then
		return
	end

	self.original = self.original or Tween.copy_table(self.from)
	
	if((self.time - self.delay_tween) >= self.duration) then
		self.from = Tween.copy_table(self.to)

		if(type(self.change_evt) == "function") then
			self.change_evt(self.to)
		end
		
		if(type(self.complete_evt) == "function") then
			self.complete_evt()
		end

		self.tween_finished = true
	else
		if(self.start_evt) then
			self.start_evt()
			self.start_evt = nil
		end

		self.from = Tween.ease(self.from, self.to, self.original, self.time - self.delay_tween, self.duration, self.easing or "linear")

		if(type(self.change_evt) == "function") then
			self.change_evt(self.from)
		end
	end

	return self
end

function Tween:on_change(fn)
	if(fn and type(fn) == "function") then
		self.change_evt = fn
	end

	return self
end

function Tween:set_easing(ease)
	if(self.easing == nil and ease and Tween.Easings[ease]) then
		self.easing = ease
	end

	return self
end

function Tween:on_complete(fn)
	if(fn and type(fn) == "function") then
		self.complete_evt = fn
	end
	
	return self
end

function Tween:on_start(fn)
	if(fn and type(fn) == "function") then
		self.start_evt = fn
	end

	return self
end

function Tween:delay(delay_time)
	if(delay_time and delay_time > 0) then
		self.delay_tween = delay_time
	end

	return self
end

function Tween:active()
	return not self.tween_finished
end

 function Tween:new(duration, from, to)
	self.__index = self

	self.tween_finished = false
	self.change_evt = nil
	self.complete_evt = nil
	self.start_evt = nil
	self.easing = nil
	self.delay_tween = 0
	self.time_started = 0

	return setmetatable({
 
		 duration = duration,
		 from = from,
		 to = to,
		 time = 0
 
	 }, self)
 end

 return Tween