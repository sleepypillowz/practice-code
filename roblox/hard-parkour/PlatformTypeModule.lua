local PlatformTypeModule = {}

function PlatformTypeModule.Fade(part)
	local isTouched = false

	if not isTouched then
		isTouched = true
		for count = 1, 10 do
			part.Transparency = count / 10
			wait(0.1)
		end
		part.CanCollide = false
		wait(3)
		part.CanCollide = true
		part.Transparency = 0
		isTouched = false
	end
end

function PlatformTypeModule.Vanish(part)
	while true do
		wait(3)
		part.CanCollide = false
		part.Transparency = 1
		wait(3)
		part.CanCollide = true
		part.Transparency = 0
	end
end

return PlatformTypeModule