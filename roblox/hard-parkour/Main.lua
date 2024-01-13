local EventModule = require(script.EventModule)
local PlatformTypeModule = require(script.PlatformTypeModule)

local vanish = game.Workspace.Level1.VanishFolder:GetChildren()
local fade = game.Workspace.Level1.FadeFolder:GetChildren()

for _, value in pairs(fade) do
	if value.Name == "Fade" then
		print("It's a Fade")
		EventModule.Touched(value)
	end
end

for _, value in pairs(vanish) do
	if value.Name == "Vanish" then
		PlatformTypeModule.Vanish(value)
	end
end