-- main_game_functions.lua

function draw_players()
	foreach(players, function(o) o:draw() end)
end

function draw_balloons()
	foreach(balloons, function(o) o:draw() end)
end

function update()
	for _, p in pairs(players) do
		p:update()
	end

	for _, b in pairs(balloons) do
		b:update()
	end


end


function get_player1()
	for _, player in pairs(players) do
		return player
	end
end

function handle_controllers()
	for i, player in pairs(players) do
		local mov_x = 0

		player:press_left(btn(⬅️, i - 1))
		player:press_right(btn(➡️, i - 1))

		-- local mov_y = 0
		-- if(btn(⬆️,i-1)) then mov_y = -1
		-- elseif(btn(⬇️,i-1)) then mov_y = 1 end

		-- player:move(mov_x, mov_y)

		player:press_x(btn(❎, i - 1),(btnp(❎, i - 1)))
		
		player:press_o(btn(🅾️, i - 1))
	end
end

function check_player_position()
	local player1 = get_player1()
	if (player1 == nil) return
	if player1.x + 4 > screen * 128 then
		screen += 1
	end

	if player1.x + 4 < (screen - 1) * 128 then
		screen -= 1
	end
end

function respawn_player()
	for _, player in pairs(players) do

		if players.death_timer == nil then
			log("player y" .. player.y)

			-- temp hack for testing
			if player.y > 1000 then
				_init()
			end
		end
		if (player.death_timer == nil) return

		-- log("death_timer: " .. player.death_timer)

		if (player.death_timer <= 0) then
			enemies = {}
			player.death_timer = nil
			player.x = 10
			player.y = 10
			player.dx = 0
			player.dy = 0
			player.ddx = 0
			player.ddy = 0
		end
	end
end

function spawn_new_enemies()
	r = rnd(100)
	log("r " .. r)
	if r < 1.5 then
		e = enemy.new(220, 10, drumstick_type, ai_patrol.new(drumstick_type, true))
		add(enemies, e)
	end

	-- temp hack to remove old ones falling through the world
	for _, e in pairs(enemies) do
		if (e.y > 5000) then
			del(enemies, e)
		end
	end


end