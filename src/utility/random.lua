
function rand(minimum, maximum)
    if (minimum > maximum) then
        minimum,maximum = maximum,minimum
    end
	return rnd(maximum - minimum) + minimum
end

function rand_i(low, high)
    if (low > high) then
        low,high = high,low
    end
	return flr(rnd(high + 1 - low)) + low
end