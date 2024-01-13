local replicatedStorage = game:GetService("ReplicatedStorage")
local clickDetector = script.Parent

-- Function to create a mining effect and destroy the block
local function onClicked(player)
	local block = workspace.RedBlock
	local reference = replicatedStorage:FindFirstChild("RedBlock")

	if block and reference then
		local offsets = {
			Vector3.new(3, 0, 0),
			Vector3.new(-3, 0, 0),
			Vector3.new(0, -3, 0),
			Vector3.new(0, 0, 3),
			Vector3.new(0, 0, -3)
		}

		-- Calculate the offsets for cloning and clone in all directions
		for _, offset in pairs(offsets) do
			local clone = reference:Clone()
			clone.CFrame = block.CFrame * CFrame.new(offset)
			clone.Parent = block.Parent
			print("cloned: " .. offset.x .. ", " .. offset.y .. ", " .. offset.z)
		end

		-- Destroy the original block
		block:Destroy()
	else
		warn("Block or reference not found.")
	end
end

-- Connect the function to the MouseClick event
clickDetector.MouseClick:Connect(onClicked)