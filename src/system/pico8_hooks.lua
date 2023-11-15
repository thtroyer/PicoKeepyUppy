-- pico-8 hooks
balloons = {}
players = {}

function _init()
    log("game init")
	--	title_screen = true
	--	draw_title_screen()
	add(players, player.new(20, 30, 1))
	add(players, player.new(5, 30, 2))
	-- add(snowmen, snowman:new())
	-- add(snowmen, snowman:new())
    add(balloons, balloon:new(rand_i(45,60), rand_i(40,80), 0, rand_i(-3,3), rand_i(0,-3), 0))

end

function _update()
	handle_controllers()
	-- update_players()
	-- update_snowballs()
	-- update_snowmen()
	-- detect_collisions()
	update()
end

function _draw()
	cls()
	map()
	draw_balloons()
	draw_players()
end

