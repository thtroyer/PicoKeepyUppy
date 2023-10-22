---
-- File for collisions
--  (LDoc)

---
-- @tparam entity e1
-- @tparam entity e2
-- @treturn boolean
function do_entities_collide(e1, e2)
    if entity_right_sprite(e1) > entity_left_sprite(e2)
            and entity_right_sprite(e2) > entity_left_sprite(e1)
            and entity_bottom_sprite(e1) > entity_top_sprite(e2)
            and entity_bottom_sprite(e2) > entity_top_sprite(e1) then
        return true
    end

    return false
end

function does_entity_collide_with_square(e1, x1, x2, y1, y2)
    -- log("x1 " .. x1)
    -- log("x2 " .. x2)
    -- log("y1 " .. y1)
    -- log("y2 " .. y2)
    if entity_right_sprite(e1) > x1 and x2 > entity_left_sprite(e1) then
        log("x hit")
    end

    if entity_bottom_sprite(e1) > y1 then
        log("y1 hit")
    end

    log("y2  > entity top " .. y2 .. ", " .. entity_top_sprite(e1))

    if y2 > entity_top_sprite(e1) then
        log("y2 hit")
    end

    if entity_right_sprite(e1) > x1
            and x2 > entity_left_sprite(e1)
            and entity_bottom_sprite(e1) > y1
            and y2 > entity_top_sprite(e1) then
        return true
    end

    return false
end