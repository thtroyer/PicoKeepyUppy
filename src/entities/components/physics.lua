--------------
-- Physics system for various entities
--  (LDoc)
-- @module physics

physics = {}
physics.__index = physics

--- Creates new physics engine
function physics.new()
	local self = setmetatable({}, physics)

	return self
end

--- Updates all items for passed entity
-- @tparam entity entity
function physics:update_all(entity)
	self:ground_collision(entity)
	self:wall_collision(entity)
	self:update(entity)
end

function physics:ground_collision(entity)
	if entity.is_airborne then
		if entity.dy > 0 then
			if map_v_collide(entity.x, entity_bottom_sprite(entity) + entity.dy + 0, entity.width, 1, 0)
					or map_v_collide(entity.x, entity_bottom_sprite(entity), entity.width, 1, 0) then
			-- if map_v_collide(entity.x, entity_bottom_sprite(entity) + entity.dy + 0, entity.width, 1, 0)
			-- 		and not map_v_collide(entity.x, entity_bottom_sprite(entity), entity.width, 1, 0) then
				entity.is_airborne = false
				entity.is_jumping = false
				entity.y = flr((entity.y - 4) / 8) * 8 + 8
				entity.dy = 0
			end
		end
	else
		if not map_v_collide(entity.x, entity_bottom_sprite(entity) + entity.dy, entity.width, 1, 0) then
			entity.is_airborne = true
		end
	end
end

function physics:wall_collision(entity)
	if entity.type.name == "player" then
		-- log("debug")
		-- log(entity:left_sprite() + entity.dx)
		-- log(entity:top_sprite())
		-- log(entity.width)
		-- log(entity.height)
	end
	if map_v_collide(entity_left_sprite(entity) + entity.dx, entity_top_sprite(entity), entity.width, entity.height - 1, 1) then
		entity.dx = 0
		entity.x = flr((entity.x - 4) / 8) * 8 + 8
	end
end

function physics:update(entity)
	entity.dx += entity.ddx

	if entity.is_airborne then
		entity.dy += entity.ddy + entity.gravity_c
	end

	if abs(entity.dx) >= entity.dx_max then
		entity.dx = (entity.dx > 0 and 1 or -1) * entity.dx_max
	end

	entity.x += entity.dx
	entity.y += entity.dy

	entity.is_walking = true
	if abs(entity.dx) < entity.dx_dampen then
		entity.dx = 0
		entity.is_walking = false
	elseif entity.dx > 0 then
		entity.dx -= entity.dx_dampen
	elseif entity.dx < 0 then
		entity.dx += entity.dx_dampen
	end
end