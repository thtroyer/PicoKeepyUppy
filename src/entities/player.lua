-- player.lua
player = {}
player.__index = player

function player.new(x, y, player_id)
	local self = setmetatable({}, player)

	log("creating new player")
	log("x: " ..x)
	self.physics = physics.new()
	self.type = {
		name = "player"
	}

	-- x is position, dx is velocity, ddx is accel
	self.x = x or 10
	self.y = y or 10
	self.dx = 0
	self.dy = 0
	self.ddx = 0
	self.ddy = 0

	-- todo: set
	self.height = 28 
	self.spr_y = 15

	self.width = 8
	self.sprite_size_x = 3
	self.sprite_size_y = 4
	self.sprite_top_offset = entity_calc_top_offset(self)
	self.sprite_bottom_offset = entity_calc_bottom_offset(self)
	self.sprite_right_offset = entity_calc_right_offset(self)
	self.sprite_left_offset = entity_calc_left_offset(self)

	self.ddx_c = 0.18
	self.dx_max = 1.5
	self.jump_v1 = -4.5
	self.jump_v2 = -1.8

	self.gravity_c = 0.3
	self.dy_max = 2
	-- not used yet

	self.dx_dampen = 0.08

	self.looking_left = false
	self.walk_timer = nil
	self.walk_state = 0
	self.is_walking = false
	self.is_airborne = false
	self.is_jumping = false

	self.press_l = false
	self.press_r = false
	self.press_jump = false
	self.press_jump_release = true
	self.press_action = false
	self.press_u = false
	self.press_d = false

	self.coll_x_offset = -8

	self.death_timer = nil

	self.sprite_id = 202 
	if (player_id == 1) then
		self.sprite_id = 199 
	end

	return self
end

function player:draw()
		--todo:
	--if self.is_airborne then

		--spr(4 + sprite_offset, self.x, self.y, 1, 2, self.looking_left, false)
	--else
	--end
	spr(self.sprite_id, self.x, self.y, 3, 4, self.looking_left, false)

	-- if debug then
	-- 	-- by sprite limits, magenta
	-- 	pset(self.x, self.y, 2)
	-- 	pset(self.x + 8*self.sprite_size_x, self.y, 2)
	-- 	pset(self.x, self.y + 8*self.sprite_size_y, 2)
	-- 	pset(self.x + 8*self.sprite_size_x, self.y + 8*self.sprite_size_y, 2)

	-- 	-- player area, green
	-- 	pset(entity_left_sprite(self), entity_top_sprite(self), 3)
	-- 	pset(entity_right_sprite(self), entity_top_sprite(self), 3)
	-- 	pset(entity_left_sprite(self), entity_bottom_sprite(self), 3)
	-- 	pset(entity_right_sprite(self), entity_bottom_sprite(self), 3)
	-- end
end

function player:press_left(state)
	self.press_l = state
end

function player:press_right(state)
	self.press_r = state
end

function player:press_x(state)
	self.press_jump = state
end

function player:press_o(state)
	if (state) then
		log("press o")
		self:hit()
	end
end

function player:control()
	if self.press_l then
		self.looking_left = true
		self.ddx = -1 * self.ddx_c
	elseif self.press_r then
		self.looking_left = false
		self.ddx = self.ddx_c
	else
		self.ddx = 0
	end

	if not self.press_jump and not self.is_airborne and not self.is_jumping then
		self.press_jump_release = true
	end

	if self.press_jump and not self.is_airborne and not self.is_jumping and self.press_jump_release then
		self.dy = self.jump_v1
		self.is_jumping = true
		self.is_airborne = true
		self.press_jump_release = false
	elseif self.is_jumping
			and not self.press_jump
			and self.dy < -1 then
		self.dy = self.jump_v2
		self.is_jumping = false
	end

	if self.press_attack and self.attack_timer == 0 then
		self.is_attacking = true
		self.attack_timer = self.attack_time + self.attack_reset
	end
end

function player:update()
	self:control()
	self.physics:update_all(self)
	-- self:walk_animation()
end


function player:hit()
	for i,b in pairs(balloons) do
		x1,y1 = b:top_left()
		x2,y2 = b:bottom_right()
		if does_entity_collide_with_square(self, x1,x2, y1,y2) then
			b:hit()
		end
	end

end