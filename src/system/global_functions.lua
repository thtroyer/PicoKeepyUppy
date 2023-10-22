-- global_functions.lua

function map_v_collide(x, y, w, h, flag)
	collide = fget(mget(x / 8, y / 8), flag)
			or fget(mget((x + w) / 8, y / 8), flag)
			or fget(mget((x + w) / 8, (y + h) / 8), flag)
			or fget(mget(x / 8, (y + h) / 8), flag)
	return collide
end


---
-- converts boolean to a 1 or 0
-- @tparam boolean b
-- @treturn number
function bool_to_num(b)
	return b and 1 or 0
end