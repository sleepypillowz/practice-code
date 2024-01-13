-- Import the TeleportService from the Roblox game service
local TeleportService = game:GetService("TeleportService")

-- Define constants for teleport retries and delays
local ATTEMPT_LIMIT = 5  -- Maximum number of teleport attempts
local RETRY_DELAY = 1    -- Delay in seconds before retrying a failed teleport
local FLOOD_DELAY = 15   -- Delay in seconds before retrying after a "Flooded" result

-- Define a function for safe teleportation with retries
local function SafeTeleport(placeId, players, options)
	-- Initialize variables for tracking teleport attempts and results
	local attemptIndex = 0
	local success, result

	-- Start a repeat loop to attempt teleportation
	repeat
		-- Use pcall to protect the teleportation call from errors
		success, result = pcall(function()
			return TeleportService:TeleportAsync(placeId, players, options)
		end)

		-- Increment the attempt index
		attemptIndex += 1

		-- If teleportation was unsuccessful, wait for a retry before trying again
		if not success then
			task.wait(RETRY_DELAY)
		end

		-- Continue looping until teleportation succeeds or the maximum attempt limit is reached
	until success or attemptIndex == ATTEMPT_LIMIT

	-- If teleportation is still unsuccessful after all attempts, log a warning
	if not success then
		warn(result)
	end

	-- Return the success status and the teleport result
	return success, result
end

-- Define a function to handle failed teleportation attempts
local function handleFailedTeleport(player, teleportResult, errorMessage, targetPlaceId, teleportOptions)
	-- Check the reason for the failed teleport and wait accordingly
	if teleportResult == Enum.TeleportResult.Flooded then
		task.wait(FLOOD_DELAY)
	elseif teleportResult == Enum.TeleportResult.Failure then
		task.wait(RETRY_DELAY)
	else
		-- If the teleport is invalid, raise an error with a message
		error(("Invalid teleport [%s]: %s"):format(teleportResult.Name, errorMessage))
	end

	-- Attempt to teleport the player again using the SafeTeleport function
	SafeTeleport(targetPlaceId, {player}, teleportOptions)
end

-- Connect the handleFailedTeleport function to the TeleportInitFailed event
TeleportService.TeleportInitFailed:Connect(handleFailedTeleport)

-- Return the SafeTeleport function for external use
return SafeTeleport
