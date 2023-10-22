-- function handle_controllers()
    -- if (btn(⬅️)) then
    --     add(balloons, balloon:new(rand_i(45,60), rand_i(40,80), 0, rand_i(-3,3), rand_i(-5,0), 0))
    -- end
-- end

function handle_controllers()
	for i, player in pairs(players) do
		local mov_x = 0
		if (btn(⬅️, i - 1)) then
			mov_x = -1
		elseif (btn(➡️, i - 1)) then
			mov_x = 1
		end

		local mov_y = 0
		if (btn(⬆️, i - 1)) then
			mov_y = -1
		elseif (btn(⬇️, i - 1)) then
			mov_y = 1
		end

		player:move(mov_x, mov_y)

	end
end
