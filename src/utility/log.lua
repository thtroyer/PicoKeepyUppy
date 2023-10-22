-- prints to log.txt
function log(msg)
	printh(msg, "log.txt", false)
end

--- prints to screen
function debug(msg)
	print(msg, 20, 20, 7)
end
