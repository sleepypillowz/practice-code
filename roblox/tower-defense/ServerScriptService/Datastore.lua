-- Import necessary services and objects from Roblox
local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- Create a DataStore instance called "database" for player data storage
local database = DataStoreService:GetDataStore("database")

-- Get references to objects in ReplicatedStorage
local functions = ReplicatedStorage:WaitForChild("Functions")
local events = ReplicatedStorage:WaitForChild("Events")
local getDataFunc = functions:WaitForChild("GetData")
local exitEvent = events:WaitForChild("ExitGame")

-- Define a constant for the maximum number of towers a player can select
local MAX_SELECTED_TOWERS = 3

-- Create an empty table to store player data
local data = {}

-- Function to load a player's data when they join the game
local function LoadData(player)
	local success = nil
	local playerData = nil
	local attempt = 1
	
	-- Retry getting player data up to 3 times in case of errors
	repeat
		success, playerData = pcall(function()
			return database:GetAsync(player.UserId)
		end)
		
		attempt += 1
		if not success then
			warn(playerData)
			task.wait()
		end
		
	until success or attempt == 3
	
	if success then
		print("Connection success")
		if not playerData then
			print("New player, giving default data")
			-- Initialize default data for a new player
			playerData = {
				["Stars"] = 400,
				["SelectedTowers"] = {"Slinger"},
				["OwnedTowers"] = {"Slinger", "Brute"}
			}
		end
		data[player.UserId] = playerData
	else
		warn("Unable to get data for player", player.UserId)
		-- Kick the player if there's a data retrieval problem
		player:Kick("There was a problem getting your data")
	end
end

-- Connect the LoadData function to the PlayerAdded event
Players.PlayerAdded:Connect(LoadData)

-- Function to save a player's data
local function SaveData(player)
	if data[player.UserId] then
		local success = nil
		local playerData = nil
		local attempt = 1

		local info = workspace.Info
		local stars = math.round(info.Wave.Value / 2)
		if info.Message.Value == "VICTORY" then
			stars = 12
		end
		-- Update the player's stars based on game progress
		data[player.UserId].Stars += stars

		-- Retry saving player data up to 3 times in case of errors
		repeat
			success, playerData = pcall(function()
				return database:UpdateAsync(player.UserId, function()
					return data[player.UserId]
				end)
			end)

			attempt += 1
			if not success then
				warn(playerData)
				task.wait()
			end

		until success or attempt == 3

		if success then
			print("Data saved successfully")
		else
			warn("Unable to save data for", player.UserId)
		end
	else
		warn("No session data for", player.UserId)
	end
end

-- Connect the SaveData function to the exitEvent
exitEvent.OnServerEvent:Connect(function(player)
	SaveData(player)
	data[player.UserId] = nil
end)

-- Handle data saving when the game is closing
game:BindToClose(function()
	if not RunService:IsStudio() then
		for index, player in pairs(Players:GetPlayers()) do
			task.spawn(function()
				SaveData(player)
			end)
		end
	else
		print("Shutting down inside studio")
	end
end)

-- Define the behavior of the getDataFunc when invoked by the client
getDataFunc.OnServerInvoke = function(player)
	return data[player.UserId]
end
