-- Get references to game services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Sound = game:GetService("SoundService")

-- Wait for the "Events" object in ReplicatedStorage to load
local events = ReplicatedStorage:WaitForChild("Events")

-- Load the Mob module from the parent script
local mob = require(script.Parent.Mob)

-- Get a reference to the "Info" object in the workspace
local info = workspace.Info

-- Create two empty tables to store round data
local round = {}
local votes = {}

-- Function to start the game
function round.StartGame()
	-- Check if the game is already running, if so, return
	if info.GameRunning.Value == true then return end

	-- Load the game map
	local map = round.LoadMap()

	-- Set the game as running
	info.GameRunning.Value = true

	-- Countdown before the game starts
	for i = 3, 0, -1 do
		info.Message.Value = "Game starting in..." .. i
		Sound.CountDown:Play()
		task.wait(1)
	end

	-- Main game loop for 10 waves
	for wave = 1, 10 do
		info.Wave.Value = wave
		info.Message.Value = ""

		-- Spawn mobs for the current wave
		round.GetWave(wave, map)

		-- Wait until all mobs are defeated or the game ends
		repeat
			task.wait(1)
		until #workspace.Mobs:GetChildren() == 0 or not info.GameRunning.Value

		-- Handle wave completion
		if info.GameRunning.Value and wave == 10 then
			info.Message.Value = "VICTORY"
		elseif info.GameRunning.Value then
			local reward = 50 * math.round(wave / 2)
			-- Reward players with gold
			for i, player in ipairs(Players:GetPlayers()) do
				player.Gold.Value += reward
			end
			info.Message.Value = "Wave Reward: $" .. reward
			Sound.WaveReward:Play()
			task.wait(2)

			-- Countdown to the next wave
			for i = 5, 0, -1 do
				info.Message.Value = "Next wave starting in..." .. i
				Sound.CountDown:Play()
				task.wait(1)
			end
		else
			break
		end
	end
end

-- Function to load the game map
function round.LoadMap()
	-- Determine the map to load based on voting or default
	local votedMap = round.ToggleVoting()
	local mapFolder = ServerStorage.Maps:FindFirstChild(votedMap)
	if not mapFolder then
		mapFolder = ServerStorage.Maps.Grassland
	end

	-- Clone and set the new map
	local newMap = mapFolder:Clone()
	newMap.Parent = workspace.Map

	-- Remove the floor in the spawn box
	workspace.SpawnBox.Floor:Destroy()

	-- Monitor the map's health and end the game if it reaches zero
	newMap.Base.Humanoid.HealthChanged:Connect(function(health)
		if health <= 0 then
			info.GameRunning.Value = false
			info.Message.Value = "GAME OVER"
		end
	end)

	return newMap
end

-- Function to handle map voting
function round.ToggleVoting()
	-- Get a list of available maps and initialize votes
	local maps = ServerStorage.Maps:GetChildren()
	votes = {}
	for i, map in ipairs(maps) do
		votes[map.Name] = {}
	end

	-- Enable voting and count down for voting time
	info.Voting.Value = true
	for i = 10, 1, -1 do
		info.Message.Value = "Map voting (" .. i .. ")"
		task.wait(1)
	end

	-- Determine the winning map based on votes or choose randomly
	local winVote = nil
	local winScore = 0
	for name, map in pairs(votes) do
		if #map > winScore then
			winScore = #map
			winVote = name
		end
	end

	if not winVote then
		local n = math.random(#maps)
		winVote = maps[n].Name
	end

	-- Disable voting and return the winning map
	info.Voting.Value = false

	return winVote
end

-- Function to process player votes
function round.ProcessVote(player, vote)
	-- Remove a player's previous vote, if any
	for name, mapVotes in pairs(votes) do
		local oldVote = table.find(mapVotes, player.UserId)
		if oldVote then
			table.remove(mapVotes, oldVote)
			print("Old vote found", oldVote)
			break
		end
	end

	-- Record the player's new vote
	print("Processed vote for", vote)
	table.insert(votes[vote], player.UserId)

	-- Notify clients of updated vote counts
	events:WaitForChild("UpdateVoteCount"):FireAllClients(votes)
end

-- Connect the vote processing function to the server event
events:WaitForChild("VoteForMap").OnServerEvent:Connect(round.ProcessVote)

-- Function to spawn mobs for a wave
function round.GetWave(wave, map)
	-- Different mob spawning logic for each wave
	if wave <= 2 then
		mob.Spawn("Zombie", 3 * wave, map)
	elseif wave <= 4 then
		for i = 1, 5 do
			mob.Spawn("Zombie", wave, map)
			mob.Spawn("Noob", wave, map)
		end
	elseif wave <= 7 then
		for i = 1, 5 do
			mob.Spawn("Zombie", wave, map)
			mob.Spawn("Noob", wave, map)
			mob.Spawn("Mech", 2 * (wave * 0.5), map)
		end
	elseif wave <= 9 then
		mob.Spawn("Mech", 2 * wave, map)
		mob.Spawn("Noob", wave, map)
		for i = 1, 5 do
			mob.Spawn("Zombie", (wave * 0.5), map)
			mob.Spawn("Mech", (wave * 0.5), map)
		end
		mob.Spawn("Teddy", 1, map)
	elseif wave == 10 then
		mob.Spawn("Zombie", 100, map)
		for i = 1, 5 do
			mob.Spawn("Mech", 5, map)
			mob.Spawn("Teddy", 1, map)
			mob.Spawn("Zombie", 2, map)
		end
		mob.Spawn("Teddy", 10, map)
	end
end

-- Return the 'round' module
return round
