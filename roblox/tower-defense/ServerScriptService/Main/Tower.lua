-- Get references to the necessary services and objects in the game
local PhysicsService = game:GetService("PhysicsService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Get references to events and functions from ReplicatedStorage
local events = ReplicatedStorage:WaitForChild("Events")
local animateTowerEvent = events:WaitForChild("AnimateTower")
local functions = ReplicatedStorage:WaitForChild("Functions")
local spawnTowerFunction = functions:WaitForChild("SpawnTower")
local requestTowerFunction = functions:WaitForChild("RequestTower")
local sellTowerFunction = functions:WaitForChild("SellTower")
local changeModeFunction = functions:WaitForChild("ChangeTowerMode")

-- Define a maximum number of towers and initialize a table to store tower data
local maxTowers = 8
local tower = {}

-- Function to find the best target for a tower
function tower.FindTarget(newTower, range, mode)
	local bestTarget = nil
	local bestWaypoint = nil
	local bestDistance = nil
	local bestHealth = nil
	local map = workspace.Map:FindFirstChildOfClass("Folder")
	
	for i, mob in ipairs(workspace.Mobs:GetChildren()) do
		local distanceToMob = (mob.HumanoidRootPart.Position - newTower.HumanoidRootPart.Position).Magnitude
		local distanceToWaypoint = (mob.HumanoidRootPart.Position - map.Waypoints[mob.MovingTo.Value].Position).Magnitude
		
		if distanceToMob <= range then
			if mode == "Near" then
				range = distanceToMob
				bestTarget = mob
			elseif mode == "First" then
				if not bestWaypoint or mob.MovingTo.Value >= bestWaypoint then
					bestWaypoint = mob.MovingTo.Value
					
					if not bestDistance or distanceToWaypoint < bestDistance then
						bestDistance = distanceToWaypoint
						bestTarget = mob
					end
				end
			elseif mode == "Last" then
				if not bestWaypoint or mob.MovingTo.Value <= bestWaypoint then
					bestWaypoint = mob.MovingTo.Value

					if not bestDistance or distanceToWaypoint > bestDistance then
						bestDistance = distanceToWaypoint
						bestTarget = mob
					end
				end
			elseif mode == "Strong" then
				if not bestHealth or mob.Humanoid.Health > bestHealth then
					bestHealth = mob.Humanoid.Health
					bestTarget = mob
				end
			elseif mode == "Weak" then
				if not bestHealth or mob.Humanoid.Health < bestHealth then
					bestHealth = mob.Humanoid.Health
					bestTarget = mob
				end
			end
		end
	end
	
	return bestTarget
end

-- Function to make a tower attack a target
function tower.Attack(newTower, player)
	local config = newTower.Config
	local target = tower.FindTarget(newTower, config.Range.Value, config.TargetMode.Value)
	
	if target and target:FindFirstChild("Humanoid") and target.Humanoid.Health > 0 then
		
		local targetCFrame = CFrame.lookAt(newTower.HumanoidRootPart.Position, target.HumanoidRootPart.Position)
		newTower.HumanoidRootPart.BodyGyro.CFrame = targetCFrame
		
		animateTowerEvent:FireAllClients(newTower, "Attack", target)
		
		target.Humanoid:TakeDamage(config.Damage.Value)
		
		if target.Humanoid.Health <= 0 then
			player.Gold.Value += target.Humanoid.MaxHealth
			player.Kills.Value += 1
		end
		
		task.wait(config.Cooldown.Value)
	end

	task.wait(0.1)
	
	if newTower and newTower.Parent then
		tower.Attack(newTower, player)
	end
end

-- Function to change the targeting mode of a tower
function tower.ChangeMode(player, model)
	if model and model:FindFirstChild("Config") then
		local targetMode = model.Config.TargetMode
		local modes = {"First", "Last", "Near", "Strong", "Weak"}
		local modeIndex = table.find(modes, targetMode.Value)
		
		if modeIndex < #modes then
			targetMode.Value = modes[modeIndex + 1]
		else
			targetMode.Value = modes[1]
		end
		
		return true
	else
		warn("Unable to change tower mode")
		return false
	end
end
changeModeFunction.OnServerInvoke = tower.ChangeMode

-- Function to sell a tower
function tower.Sell(player, model)
	if model and model:FindFirstChild("Config") then
		if model.Config.Owner.Value == player.Name then
			player.PlacedTowers.Value -= 1
			player.Gold.Value += model.Config.Price.Value
			model:Destroy()
			return true
		end
	end
	
	warn("Unable to sell this tower")
	return false
end
sellTowerFunction.OnServerInvoke = tower.Sell

-- Function to spawn a tower
function tower.Spawn(player, name, cframe, previous)
	local allowedToSpawn = tower.CheckSpawn(player, name, previous)
	
	if allowedToSpawn then
		
		local newTower
		local oldMode = nil
		if previous then
			oldMode = previous.Config.TargetMode.Value 
			previous:Destroy()
			newTower = ReplicatedStorage.Towers.Upgrades[name]:Clone()
		else
			newTower = ReplicatedStorage.Towers[name]:Clone()
			player.PlacedTowers.Value += 1
		end
		
		local ownerValue = Instance.new("StringValue")
		ownerValue.Name = "Owner"
		ownerValue.Value = player.Name
		ownerValue.Parent = newTower.Config
		
		local targetMode = Instance.new("StringValue")
		targetMode.Name = "TargetMode"
		targetMode.Value = oldMode or "First"
		targetMode.Parent = newTower.Config
		
		newTower.HumanoidRootPart.CFrame = cframe
		newTower.Parent = workspace.Towers
		newTower.HumanoidRootPart:SetNetworkOwner(nil)
		
		local bodyGyro = Instance.new("BodyGyro")
		bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
		bodyGyro.D = 0
		bodyGyro.CFrame = newTower.HumanoidRootPart.CFrame
		bodyGyro.Parent = newTower.HumanoidRootPart

		for i, object in ipairs(newTower:GetDescendants()) do
			if object:IsA("BasePart") then
				PhysicsService:SetPartCollisionGroup(object, "Tower")
			end
		end
		
		player.Gold.Value -= newTower.Config.Price.Value
		
		coroutine.wrap(tower.Attack)(newTower, player)
		
		return newTower
	else
		warn("Requested tower does not exist:", name)
		return false
	end
end
spawnTowerFunction.OnServerInvoke = tower.Spawn

-- Function to check if a tower can be spawned
function tower.CheckSpawn(player, name, previous)
	local towerExists = ReplicatedStorage.Towers:FindFirstChild(name, true)

	if towerExists then
		if towerExists.Config.Price.Value <= player.Gold.Value then
			if previous or player.PlacedTowers.Value < maxTowers then
				return true
			else
				warn("Player has reached max limit")
			end
		else
			warn("Player cannot afford")
		end
	else
		warn("That tower does not exist")
	end
	
	return false
end
requestTowerFunction.OnServerInvoke = tower.CheckSpawn

-- Return the tower module
return tower
