local EventModule = {}
local PlatformTypeModule = require(script.Parent.PlatformTypeModule)

function EventModule.Touched(part)
	part.Touched:Connect(function(otherPart)
		local character = otherPart.Parent
		if character and character:IsA("Model") and character:FindFirstChild("Humanoid") then
			local player = game.Players:GetPlayerFromCharacter(character)
			if player then
				print(player.Name .. " touched the part!")
				PlatformTypeModule.Fade(part)
			end
		end
	end)
end

function EventModule.GetChildren(data)
	for key, value in pairs(data) do
		print(value)
	end
end

function EventModule.Dictionary(data)
	for key, value in pairs(data) do
		print(key,": ", value)
	end
end

return EventModule
