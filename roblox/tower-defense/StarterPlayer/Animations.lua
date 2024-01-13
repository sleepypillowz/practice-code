-- Get the Debris service to handle object cleanup
local Debris = game:GetService("Debris")
-- Get the ReplicatedStorage service to access shared data
local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- Get the TweenService to create animations
local TweenService = game:GetService("TweenService")

-- Locate the "Events" folder within ReplicatedStorage
local events = ReplicatedStorage:WaitForChild("Events")
-- Wait for the "AnimateTower" event within the "Events" folder
local animateTowerEvent = events:WaitForChild("AnimateTower")

-- Define a function to create and fire a projectile from a tower to a target
local function fireProjectile(tower, target)
	-- Create a new Part object to represent the projectile
	local projectile = Instance.new("Part")
	-- Set its size
	projectile.Size = Vector3.new(1,1,1)
	-- Set its initial position to match the tower's head
	projectile.CFrame = tower.Head.CFrame
	-- Make the projectile anchored (won't move due to physics)
	projectile.Anchored = true
	-- Set it to not collide with other objects
	projectile.CanCollide = false
	-- Make it transparent
	projectile.Transparency = 1
	-- Parent it to the Camera in the workspace
	projectile.Parent = workspace.Camera

	-- Create a fire effect for the projectile
	local fire = Instance.new("Fire")
	fire.Size = 2
	fire.Heat = 0.1
	fire.Color = tower.Config.Trail.Value
	fire.Parent = projectile

	-- Create a Tween to animate the projectile's movement to the target
	local projectileTween = TweenService:Create(projectile, TweenInfo.new(0.5), {Position = target.HumanoidRootPart.Position})
	projectileTween:Play()
	-- Add the projectile to the Debris service to clean it up after 0.5 seconds
	Debris:AddItem(projectile, 0.5)
end

-- Define a function to set an animation for an object
local function setAnimation(object, animName)
	-- Find the Humanoid and Animations folders within the object
	local humanoid = object:WaitForChild("Humanoid")
	local animationsFolder = object:WaitForChild("Animations")

	-- Check if both humanoid and animationsFolder exist
	if humanoid and animationsFolder then
		-- Locate the animation object within animationsFolder
		local animationObject = animationsFolder:WaitForChild(animName)

		-- Check if the animationObject exists
		if animationObject then
			-- Find or create an Animator for the humanoid
			local animator = humanoid:FindFirstChild("Animator") or Instance.new("Animator", humanoid)

			-- Check if the animation is already playing and return the track if found
			local playingTracks = animator:GetPlayingAnimationTracks()
			for i, track in pairs(playingTracks) do
				if track.Name == animName then
					return track
				end
			end

			-- If the animation is not playing, load it and return the animation track
			local animationTrack = animator:LoadAnimation(animationObject)		
			return animationTrack		
		end
	end
end

-- Define a function to play an animation on an object
local function playAnimation(object, animName)
	-- Set the animation track for the object
	local animationTrack = setAnimation(object, animName)

	-- Check if the animation track exists and play it
	if animationTrack then
		animationTrack:Play()
	else
		-- Print a warning if the animation track does not exist
		warn("Animation track does not exist")
		return
	end
end

-- Connect a function to execute when a child is added to the "Mobs" folder in workspace
workspace.Mobs.ChildAdded:Connect(function(object)
	-- Play the "Walk" animation on the added object
	playAnimation(object, "Walk")
end)

-- Connect a function to execute when a child is added to the "Towers" folder in workspace
workspace.Towers.ChildAdded:Connect(function(object)
	-- Play the "Idle" animation on the added object
	playAnimation(object, "Idle")
end)

-- Connect a function to execute when the "AnimateTower" client event is triggered
animateTowerEvent.OnClientEvent:Connect(function(tower, animName, target)
	-- Play the specified animation on the tower
	playAnimation(tower, animName)

	-- Check if a target exists
	if target then
		-- Check if the tower has a "Trail" in its "Config"
		if tower.Config:FindFirstChild("Trail") then
			-- Fire a projectile from the tower to the target
			fireProjectile(tower, target)
		end
		-- Play the "Attack" sound on the tower's HumanoidRootPart
		tower.HumanoidRootPart.Attack:Play()
	end
end)
