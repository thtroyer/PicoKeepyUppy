
function ground_sprite_collision(entity, event)
	if entity.is_airborne then
		if entity.dy > 0 then
			if map_v_collide(entity.x, entity_bottom_sprite(entity) + entity.dy + 0, entity.width, 1, 0)
					or map_v_collide(entity.x, entity_bottom_sprite(entity), entity.width, 1, 0) then
				event()
			end
		end
	end
end

function ground_collision(entity, event)
	if entity.is_airborne then
		local x, y = entity:lowest_point()
		if entity.dy > 0 then
			if map_v_collide(x, y + entity.dy + 0, entity.width, 1, 0)
					or map_v_collide(x, y, entity.width, 1, 0) then
				event(entity)
			end
		end
	end
end

function wall_collision(entity, event)
	if map_v_collide(entity_left_sprite(entity) + entity.dx, entity_top_sprite(entity), entity.width, entity.height - 1, 1) then
		event(entity)
	end
end
