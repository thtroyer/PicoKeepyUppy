function update_balloons()
    foreach(balloons, function(b) b:update() end)
end

balloon = {}
function balloon:new(x, y, z, dx, dy, dz)
	local o = {}
	setmetatable(o, self)
	self.__index = self

	o.x = x
	o.y = y
	-- o.z = z
	o.grav = 0.05

	o.dx = dx
	o.dy = dy o.dz = dz

    o.angle = rand(0,1)
    o.da = 0
    o.da_dampen = 0.97

    o.dampen = 0.80

	o.is_touching_object = false
	o.is_airborne = true
	

	return o
end

function balloon:update()
	ground_collision(self, self.just_hit_ground)
	if (not self.is_airborne) then 
		self.dx = 0
		self.dy = 0
		self.da = 0
		return
	end

	self.x += self.dx
    self.x += cos(self.angle) * 0.2
    self.dx += cos(self.angle) * 0.05
	self.y += self.dy

    self.dx *= self.dampen
    self.dy *= self.dampen

    self.dy += self.grav

	self.width = 5

	self.angle += self.da;
	self.da += cos(self.angle) * -0.002
    self.da *= self.da_dampen

	if (self.y <= 0) then
		self.z = 0
		self.dx = 0
		self.dy = 0
	end
end

function balloon:just_hit_object(entity)
end

function balloon:just_hit_ground()
	log("coll: " .. self.dy)
	if self.dy > 0.2 then
		self.dy *= -0.9
		self.y -= .25 
	else
		self.is_airborne = false
		self.dy=0
	end
end


function balloon:draw()
	local s = 4.5
	-- if (self.frames_left <= 0) return
	-- pset(self.x+4, self.y+4 - (self.z/2), 7)
    -- spr(8, self.x, self.y)
	circfill(self.x, self.y, 5,8)
	circfill(self.x + cos(self.angle) * s, self.y + sin(self.angle)*s, 3,8)
end

function balloon:lowest_point()
	return self.x, self.y +7 
end

function balloon:top_point()
	return self.x, self.y -7 
end

function balloon:left_point()
	return self.x-4, self.y
end

function balloon:right_point()
	return self.x+4, self.y
end

function balloon:top_left()
	return self.x-4, self.y-7
end

function balloon:bottom_right()
	return self.x+4, self.y+7
end

function balloon:hit()
	self.dy = rand(-5,-10)
	self.da = rand(-.25,.25)
	self.dx = rand(-3,3)
	if self.is_airborne == false then
		self.y = 120 
		self.is_airborne = true
	end
end

-- function move_towards(arg, towards, speed)
	
-- 	if (arg < towards) then
-- 		return arg + abs(speed)
-- 	end
-- 	return arg -
-- end