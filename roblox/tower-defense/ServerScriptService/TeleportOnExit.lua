-- Get references to various game services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local TeleportService = game:GetService("TeleportService")

-- Require a custom module named "SafeTeleport" from ServerScriptService
local SafeTeleport = require(ServerScriptService.SafeTeleport)

-- Find the "Events" folder inside ReplicatedStorage
local events = ReplicatedStorage:WaitForChild("Events")

-- Wait for a child named "ExitGame" inside the "Events" folder
local exitEvent = events:WaitForChild("ExitGame")

-- Define a function named "Teleport" that takes a player as an argument
local function Teleport(player)
	-- Specify the target place's ID where the player will be teleported
	local placeId = 9647396248

	-- Create a new TeleportOptions instance
	local options = Instance.new("TeleportOptions")

	-- Set custom teleport data with a key "Gold" and the player's Gold value
	options:SetTeleportData({
		["Gold"] = player.Gold.Value
	})

	-- Use the custom SafeTeleport function to teleport the player to the specified place with the provided options
	SafeTeleport(placeId, {player}, options)

	-- Print a message indicating that the teleport has finished
	print("Finished teleport")
end

-- Connect the "Teleport" function to the "OnServerEvent" event of "exitEvent"
exitEvent.OnServerEvent:Connect(Teleport)
