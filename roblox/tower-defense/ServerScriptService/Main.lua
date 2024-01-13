-- Get the Players service from the game
local Players = game:GetService("Players")

-- Import the Mob, Tower, and Round modules
local mob = require(script.Mob)
local tower = require(script.Tower)
local round = require(script.Round)

-- Set the minimum number of players required to start the game
local minPlayers = 1

-- Initialize a variable to control game start readiness
local readyToStart = true

-- Connect a function to the PlayerAdded event
Players.PlayerAdded:Connect(function(player)
	-- Get the current number of players in the game
	local currentPlayers = #Players:GetPlayers()
	
	-- Check if there are enough players to start the game and it's ready to start
	if currentPlayers >= minPlayers and readyToStart then
		-- Mark the game as not ready to start to prevent multiple game starts
		readyToStart = false
		
		-- Start the game round
		round.StartGame()
		
		-- Mark the game as ready to start again for future rounds
		readyToStart = true
	else
		-- Update the game message to indicate waiting for more players
		workspace.Info.Message.Value = "Waiting for " .. (minPlayers - currentPlayers) .. " more player(s)"
	end
end)
