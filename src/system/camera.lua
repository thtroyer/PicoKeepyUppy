
camera_prop = {
    x = 0,
    dx = 0,
    target_x = 0,
    min_x = 0,
    max_x = 999,
}

function camera_update(players, balloon)
    local x,c = 0,0
	for i, p in pairs(players) do
        x += p.x - 64
        c += 1
	end

	for _, b in pairs(balloon) do
        x += b.x - 64
        c += 1
	end

    camera_prop.target_x = clamp(camera_prop.min_x, x/c, camera_prop.max_x)

    log(camera_prop.target_x)

    camera_prop.x = camera_prop.target_x

    -- camera_prop.dx += camera_ddx(camera_prop.x, camera_prop.target_x, camera_prop.dx)
    -- camera_prop.x += camera_prop.dx
    camera(camera_prop.x,0)
end

function camera_ddx(x, target_x, dx)
    -- if abs(target_x - x) < 5 then return 0 end
    dx += 0.01

    local time_to_target = (x - target_x) / dx
    log("distance to move" .. x - target_x)
    log("ttt: " .. time_to_target)
    log("dx: " .. dx)
    log("ddx: " .. time_to_target/32)
    return time_to_target/32
end
