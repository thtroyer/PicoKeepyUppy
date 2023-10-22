
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
    return entity.sprite_size_x * 8 - 1
end

function entity_calc_left_offset(entity)
    return entity.sprite_size_x * 8 - entity.width
end

--- 
-- This function provides the y coordinate of the top of the sprite
-- @tparam entity entity
-- @treturn number y coordinate
function entity_top_sprite(entity)
	return entity.y + entity.sprite_top_offset
end


--- 
-- This function provides the y coordinate of the bottom of the sprite
-- @tparam entity entity
-- @treturn number y coordinate
function entity_bottom_sprite(entity)
	return entity.y + entity.sprite_bottom_offset
end

--- 
-- This function provides the y coordinate of the bottom of the sprite
-- @tparam entity entity
-- @treturn number y coordinate
function entity_left_sprite(entity)
	return entity.x + entity.sprite_left_offset
end

--- 
-- This function provides the y coordinate of the bottom of the sprite
-- @tparam entity entity
-- @treturn number y coordinate
function entity_right_sprite(entity)
	return entity.x + entity.sprite_right_offset
end