-- Get various game services
local Players = game:GetService("Players")
local PhysicsService = game:GetService("PhysicsService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Get modules and functions from ReplicatedStorage
local modules = ReplicatedStorage:WaitForChild("Modules")
local health = require(modules:WaitForChild("Health"))

-- Get player-specific objects
local gold = Players.LocalPlayer:WaitForChild("Gold")
local towers = ReplicatedStorage:WaitForChild("Towers")

-- Get various functions from ReplicatedStorage
local functions = ReplicatedStorage:WaitForChild("Functions")
local requestTowerFunction = functions:WaitForChild("RequestTower")
local spawnTowerFunction = functions:WaitForChild("SpawnTower")
local sellTowerFunction = functions:WaitForChild("SellTower")
local changeModeFunction = functions:WaitForChild("ChangeTowerMode")
local getDataFunction = functions:WaitForChild("GetData")

-- Get camera, GUI, and info objects
local camera = workspace.CurrentCamera
local gui = script.Parent
local info = workspace:WaitForChild("Info")

-- Initialize variables
local hoveredInstance = nil
local selectedTower = nil
local towerToSpawn = nil
local canPlace = false
local rotation = 0
local placedTowers = 0
local maxTowers = 8
local lastTouch = tick()

-- Function to perform a mouse raycast
local function MouseRaycast(model)
	local mousePosition = UserInputService:GetMouseLocation()
	local mouseRay = camera:ViewportPointToRay(mousePosition.X, mousePosition.Y)
	local raycastParams = RaycastParams.new()

	-- Create a blacklist to avoid raycasting to certain objects
	local blacklist = camera:GetChildren()
	table.insert(blacklist, model)
	raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
	raycastParams.FilterDescendantsInstances = blacklist

	-- Perform the raycast
	local raycastResult = workspace:Raycast(mouseRay.Origin, mouseRay.Direction * 1000, raycastParams)

	return raycastResult
end

-- Function to create a range circle for a tower
local function CreateRangeCircle(tower, placeholder)
	-- Get range, height, and offset information
	local range = tower.Config.Range.Value
	local height = (tower.PrimaryPart.Size.Y / 2) + tower.Humanoid.HipHeight
	local offset = CFrame.new(0, -height, 0)

	-- Create a part representing the range circle
	local p = Instance.new("Part")
	p.Name = "Range"
	p.Shape = Enum.PartType.Cylinder
	p.Material = Enum.Material.Neon
	p.Transparency = 0.9
	p.Size = Vector3.new(2, range * 2, range * 2)
	p.TopSurface = Enum.SurfaceType.Smooth
	p.BottomSurface = Enum.SurfaceType.Smooth
	p.CFrame = tower.PrimaryPart.CFrame * offset * CFrame.Angles(0, 0, math.rad(90))
	p.CanCollide = false

	-- Attach the range circle to the tower or the camera
	if placeholder then
		p.Anchored = false
		local weld = Instance.new("WeldConstraint")
		weld.Part0 = p
		weld.Part1 = tower.PrimaryPart
		weld.Parent = p
		p.Parent = tower
	else
		p.Anchored = true
		p.Parent = workspace.Camera
	end
end

-- Function to remove a placeholder tower
local function RemovePlaceholderTower()
	if towerToSpawn then
		towerToSpawn:Destroy()
		towerToSpawn = nil
		rotation = 0
		gui.Controls.Visible = false
	end
end

-- Function to add a placeholder tower
local function AddPlaceholderTower(name)
	local towerExists = towers:FindFirstChild(name)
	if towerExists then
		RemovePlaceholderTower()
		towerToSpawn = towerExists:Clone()
		towerToSpawn.Parent = workspace
		CreateRangeCircle(towerToSpawn, true)

		-- Modify the appearance of the placeholder tower
		for i, object in ipairs(towerToSpawn:GetDescendants()) do
			if object:IsA("BasePart") then
				PhysicsService:SetPartCollisionGroup(object, "Tower")
				if object.Name ~= "Range" then
					object.Material = Enum.Material.ForceField
					object.Transparency = 0.3
				end
			end
		end

		gui.Controls.Visible = true
	end
end

-- Function to set the color of a placeholder tower
local function ColorPlaceholderTower(color)
	for i, object in ipairs(towerToSpawn:GetDescendants()) do
		if object:IsA("BasePart") then
			object.Color = color
		end
	end
end

-- Function to toggle tower information display
local function toggleTowerInfo()
	workspace.Camera:ClearAllChildren()
	gui.Towers.Title.Text = "Towers: " .. placedTowers .. "/" .. maxTowers

	if selectedTower then
		CreateRangeCircle(selectedTower)
		gui.Selection.Visible = true
		local config = selectedTower.Config
		gui.Selection.Stats.Damage.Value.Text = config.Damage.Value
		gui.Selection.Stats.Range.Value.Text = config.Range.Value
		gui.Selection.Stats.Cooldown.Value.Text = config.Cooldown.Value
		gui.Selection.Title.TowerName.Text = selectedTower.Name
		gui.Selection.Title.TowerImage.Image = config.Image.Texture
		gui.Selection.Title.OwnerName.Text = config.Owner.Value .. "'s"

		local modes = {
			["First"] = "rgb(150, 150, 150)",
			["Last"] = "rgb(50, 50, 50)", 
			["Near"] = "rgb(50, 150, 0)", 
			["Strong"] = "rgb(200, 50, 50)", 
			["Weak"] = "rgb(50, 100, 200)"
		}
		local color = modes[config.TargetMode.Value]
		gui.Selection.Action.Target.Title.Text = "Target: <font color=\"" .. color .. "\">" .. config.TargetMode.Value .. "</font>"

		if config.Owner.Value == Players.LocalPlayer.Name then
			gui.Selection.Action.Visible = true

			local upgradeTower = config:FindFirstChild("Upgrade")
			if upgradeTower then
				gui.Selection.Action.Upgrade.Visible = true
				gui.Selection.Action.Upgrade.Title.Text = "Upgrade (" .. upgradeTower.Value.Config.Price.Value .. ")"
			else
				gui.Selection.Action.Upgrade.Visible = false
			end
		else
			gui.Selection.Action.Visible = false
		end

	else
		gui.Selection.Visible = false
	end
end

-- Function to spawn a new tower
local function SpawnNewTower()
	if canPlace then
		local placedTower = spawnTowerFunction:InvokeServer(towerToSpawn.Name, towerToSpawn.PrimaryPart.CFrame)
		if placedTower then
			placedTowers += 1
			selectedTower = placedTower
			RemovePlaceholderTower()
			toggleTowerInfo()
		end
	end
end

-- Connect events for cancelling, changing target mode, upgrading, and selling a tower
gui.Controls.Cancel.Activated:Connect(RemovePlaceholderTower)

gui.Selection.Action.Target.Activated:Connect(function()
	if selectedTower then
		local modeChangeSuccess = changeModeFunction:InvokeServer(selectedTower)
		if modeChangeSuccess then
			toggleTowerInfo()
		end
	end
end)

gui.Selection.Action.Upgrade.Activated:Connect(function()
	if selectedTower then
		local upgradeTower = selectedTower.Config.Upgrade.Value
		local upgradeSuccess = spawnTowerFunction:InvokeServer(upgradeTower.Name, selectedTower.PrimaryPart.CFrame, selectedTower)

		if upgradeSuccess then
			selectedTower = upgradeSuccess
			toggleTowerInfo()
		end
	end
end)

gui.Selection.Action.Sell.Activated:Connect(function()
	if selectedTower then
		local soldTower = sellTowerFunction:InvokeServer(selectedTower)

		if soldTower then
			selectedTower = nil
			placedTowers -= 1
			toggleTowerInfo()
		end
	end
end)

-- Connect input events for mouse and touch interactions
UserInputService.InputBegan:Connect(function(input, processed)
	if processed then
		return
	end

	if towerToSpawn then
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			SpawnNewTower()
		elseif input.UserInputType == Enum.UserInputType.Touch then
			local timeSinceLastTouch = tick() - lastTouch
			if timeSinceLastTouch <= 0.25 then
				SpawnNewTower()
			end
			lastTouch = tick()
		elseif input.KeyCode == Enum.KeyCode.R then
			rotation += 90
		elseif input.KeyCode == Enum.KeyCode.X or input.KeyCode == Enum.KeyCode.C then
			RemovePlaceholderTower()
		end
	elseif hoveredInstance and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
		local model = hoveredInstance:FindFirstAncestorOfClass("Model")

		if model and model.Parent == workspace.Towers then
			selectedTower = model
		else
			selectedTower = nil
		end

		toggleTowerInfo()
	end
end)

-- Connect a render step event to handle mouse raycasting and placement
RunService.RenderStepped:Connect(function()
	local result = MouseRaycast(towerToSpawn)
	if result and result.Instance then
		if towerToSpawn then
			hoveredInstance = nil

			if result.Instance.Parent.Name == "TowerArea" then
				canPlace = true
				ColorPlaceholderTower(Color3.new(0,1,0))
			else
				canPlace = false
				ColorPlaceholderTower(Color3.new(1,0,0))
			end
			local x = result.Position.X
			local y = result.Position.Y + towerToSpawn.Humanoid.HipHeight + (towerToSpawn.PrimaryPart.Size.Y / 2)
			local z = result.Position.Z

			local cframe = CFrame.new(x,y,z) * CFrame.Angles(0, math.rad(rotation), 0)
			towerToSpawn:SetPrimaryPartCFrame(cframe)
		else
			hoveredInstance = result.Instance
		end
	else
		hoveredInstance = nil
	end
end)

-- Function to display the end screen (victory or game over)
local function DisplayEndScreen(status)
	local screen = gui.EndScreen

	if status == "GAME OVER" then
		screen.Failure:Play()
		screen.Content.Title.TextColor3 = Color3.new(1, 0, 0)
		screen.ImageColor3 = Color3.new(0, 0, 0)
		screen.Content.Subtitle.Text = "Better luck next time"

	elseif status == "VICTORY" then
		screen.Victory:Play()
		screen.Content.Title.TextColor3 = Color3.new(0, 1, 0)
		screen.ImageColor3 = Color3.new(0.6, 1, 0.4)
		screen.Content.Subtitle.Text = "The garden lives to grow another day!"

	end

	local info = workspace.Info
	local stars = math.round(info.Wave.Value / 2)
	if info.Message.Value == "VICTORY" then
		stars = 12
	end

	screen.Content.Title.Text = status
	screen.Stats.Wave.Text = "Wave: " .. workspace.Info.Wave.Value
	screen.Stats.Stars.Text = "Stars: " .. stars
	screen.Stats.Kills.Text = "Kills: " .. Players.LocalPlayer.Kills.Value

	screen.Size = UDim2.new(0,0,0,0)
	screen.Visible = true

	-- Create a tween animation to display the end screen
	local tweenStyle = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0)
	local zoomTween = TweenService:Create(screen, tweenStyle, {Size = UDim2.new(1,0,1,0)})
	zoomTween:Play()

	local events = ReplicatedStorage:WaitForChild("Events")
	local exitEvent = events:WaitForChild("ExitGame")
	local clicked
	clicked = screen.Exit.Activated:Connect(function()
		clicked:Disconnect()
		exitEvent:FireServer()
		screen.Visible = false
	end)
end

-- Function to set up the game GUI
local function SetupGameGui()
	if not info.GameRunning.Value then
		return
	end

	gui.Voting.Visible = false
	gui.Info.Health.Visible = true
	gui.Info.Stats.Visible = true
	gui.Towers.Visible = true

	local map = workspace.Map:FindFirstChildOfClass("Folder")
	if map then
		health.Setup(map:WaitForChild("Base"), gui.Info.Health)
	else
		workspace.Map.ChildAdded:Connect(function(newMap)
			health.Setup(newMap:WaitForChild("Base"), gui.Info.Health)
		end)
	end

	workspace.Mobs.ChildAdded:Connect(function(mob)
		health.Setup(mob)
	end)

	info.Wave.Changed:Connect(function(change)
		gui.Info.Stats.Wave.Text = "Wave:" .. change
	end)

	gold.Changed:Connect(function(change)
		gui.Info.Stats.Gold.Text = "$" .. gold.Value
	end)
	gui.Info.Stats.Gold.Text = "$" .. gold.Value

	gui.Towers.Title.Text = "Towers: " .. placedTowers .. "/" .. maxTowers
	local playerData = getDataFunction:InvokeServer()
	for i, tower in pairs(playerData.SelectedTowers) do
		local tower = towers:FindFirstChild(tower)
		if tower then
			local button = gui.Towers.Template:Clone()
			local config = tower:WaitForChild("Config")
			button.Name = tower.Name
			button.Image = config.Image.Texture
			button.Visible = true
			button.LayoutOrder = config.Price.Value
			button.Price.Text = config.Price.Value

			button.Parent = gui.Towers

			button.Activated:Connect(function()
				local allowedToSpawn = requestTowerFunction:InvokeServer(tower.Name)
				if allowedToSpawn then
					AddPlaceholderTower(tower.Name)
				end
			end)
		end
	end
end

-- Function to set up the vote GUI
local function SetupVoteGui()
	if not info.Voting.Value then
		return
	end

	gui.Voting.Visible = true

	local events = ReplicatedStorage:WaitForChild("Events")
	local voteEvent = events:WaitForChild("VoteForMap")
	local voteCountUpdate = events:WaitForChild("UpdateVoteCount")
	local maps = gui.Voting.Maps:GetChildren()

	for i, button in ipairs(maps) do
		if button:IsA("ImageButton") then
			button.Activated:Connect(function()
				voteEvent:FireServer(button.Name)
			end)
		end
	end

	voteCountUpdate.OnClientEvent:Connect(function(mapScores)
		for name, voteInfo in pairs(mapScores) do
			local button = gui.Voting.Maps:FindFirstChild(name)
			if button then
				button.Vote.Text = #voteInfo
			end
		end
	end)
end

-- Function to load the GUI components
local function LoadGui()
	gui.Info.Message.Text = info.Message.Value

	info.Message.Changed:Connect(function(change)
		gui.Info.Message.Text = change
		if change == "" then
			gui.Info.Message.Visible = false
		else
			gui.Info.Message.Visible = true

			if change == "VICTORY" or change == "GAME OVER" then
				DisplayEndScreen(change)
			end
		end
	end)

	SetupVoteGui()
	SetupGameGui()

	info.GameRunning.Changed:Connect(SetupGameGui)
	info.Voting.Changed:Connect(SetupVoteGui)
end

LoadGui()
