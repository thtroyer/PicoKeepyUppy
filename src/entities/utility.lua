
---
-- @tparam entity entity
-- @treturn number calculate sprite height in pixels
function entity_calc_top_offset(entity)
    return entity.sprite_size_y * 8 - entity.height
end

function entity_calc_bottom_offset(entity)
    return entity.sprite_size_y * 8 - 1
end

function entity_calc_right_offset(entity)
    local offset = entity.coll_x_offset
    if offset == nil then offset = 0 end
    return entity.sprite_size_x * 8 - 1 + offset
end

function entity_calc_left_offset(entity)
    local offset = entity.coll_x_offset
    if offset == nil then offset = 0 end
    return entity.sprite_size_x * 8 - entity.width + offset
end

--- 
-- This function provides the y coordinate of the top of the sprite
-- @tparam entity entity
-- @treturn number y coordinate
function entity_top_sprite(entity)
	-- return entity.y + entity.sprite_top_offset
	return entity.y + entity_calc_top_offset(entity)
end


--- 
-- This function provides the y coordinate of the bottom of the sprite
-- @tparam entity entity
-- @treturn number y coordinate
function entity_bottom_sprite(entity)
	return entity.y + entity_calc_bottom_offset(entity)
end

--- 
-- This function provides the y coordinate of the bottom of the sprite
-- @tparam entity entity
-- @treturn number y coordinate
function entity_left_sprite(entity)
	return entity.x + entity_calc_left_offset(entity)
end

--- 
-- This function provides the y coordinate of the bottom of the sprite
-- @tparam entity entity
-- @treturn number y coordinate
function entity_right_sprite(entity)
	return entity.x + entity_calc_right_offset(entity)
end