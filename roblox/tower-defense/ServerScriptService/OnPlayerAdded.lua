-- Get the Players service from the game
local Players = game:GetService("Players")

-- Get the PhysicsService from the game
local PhysicsService = game:GetService("PhysicsService")

-- Connect a function to the PlayerAdded event, which fires when a player joins the game
Players.PlayerAdded:Connect(function(player)
	
	-- Create a new IntValue instance named "Gold" and set its initial value to 200
	local gold = Instance.new("IntValue")
	gold.Name = "Gold"
	gold.Value = 200
	gold.Parent = player
	
	-- Create a new IntValue instance named "Kills" and add it as a child of the player
	local kills = Instance.new("IntValue")
	kills.Name = "Kills"
	kills.Parent = player
	
	-- Create a new IntValue instance named "PlacedTowers" with an initial value of 0
	-- and add it as a child of the player
	local placedTowers = Instance.new("IntValue")
	placedTowers.Name = "PlacedTowers"
	placedTowers.Value = 0
	placedTowers.Parent = player
	
	-- Connect a function to the CharacterAppearanceLoaded event of the player, 
	-- which fires when a player's character appearance is loaded
	player.CharacterAppearanceLoaded:Connect(function(character)
		-- Iterate through all descendants (parts and objects) of the character
		for i, object in ipairs(character:GetDescendants()) do
			-- Check if the object is a BasePart (a part of the character's model)
			if object:IsA("BasePart") then
				-- Set the collision group of the BasePart to "Player" using the PhysicsService
				PhysicsService:SetPartCollisionGroup(object, "Player")
			end
		end
	end)
end)
