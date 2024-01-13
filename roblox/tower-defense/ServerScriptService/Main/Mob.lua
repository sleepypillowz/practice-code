-- Get a reference to the ServerStorage and PhysicsService services in Roblox
local ServerStorage = game:GetService("ServerStorage")
local PhysicsService = game:GetService("PhysicsService")

-- Create a table named 'mob' to store functions and data related to mobs
local mob = {}

-- Define a function to make a mob move along waypoints on the map
function mob.Move(mob, map)
    -- Get the 'Humanoid' object from the mob
    local humanoid = mob:WaitForChild("Humanoid")
    -- Get the waypoints from the map
    local waypoints = map.Waypoints

    -- Loop through each waypoint in the list
    for waypoint = 1, #waypoints:GetChildren() do
        -- Set the 'MovingTo' value in the mob to the current waypoint
        mob.MovingTo.Value = waypoint
        -- Make the mob's humanoid move to the position of the current waypoint
        humanoid:MoveTo(waypoints[waypoint].Position)
        -- Wait for the humanoid to finish moving to the waypoint
        humanoid.MoveToFinished:Wait()
    end

    -- Destroy the mob after it reaches all waypoints
    mob:Destroy()

    -- Damage the 'Humanoid' object of the map's base
    map.Base.Humanoid:TakeDamage(humanoid.Health)
end

-- Define a function to spawn mobs
function mob.Spawn(name, quantity, map)
    -- Check if a mob with the specified name exists in ServerStorage
    local mobExists = ServerStorage.Mobs:FindFirstChild(name)

    if mobExists then
        -- Spawn the specified quantity of mobs
        for i = 1, quantity do
            -- Wait for a short time before spawning each mob
            task.wait(0.5)
            -- Clone the mob from ServerStorage
            local newMob = mobExists:Clone()
            -- Set the position of the mob to the starting position on the map
            newMob.HumanoidRootPart.CFrame = map.Start.CFrame
            -- Parent the mob to the workspace
            newMob.Parent = workspace.Mobs
            -- Remove network ownership from the mob
            newMob.HumanoidRootPart:SetNetworkOwner(nil)

            -- Create an 'IntValue' named 'MovingTo' and attach it to the mob
            local movingTo = Instance.new("IntValue")
            movingTo.Name = "MovingTo"
            movingTo.Parent = newMob

            -- Set the collision group of all BaseParts in the mob to "Mob"
            for i, object in ipairs(newMob:GetDescendants()) do
                if object:IsA("BasePart") then
                    PhysicsService:SetPartCollisionGroup(object, "Mob")
                end
            end

            -- Attach a function to be called when the mob's humanoid dies
            newMob.Humanoid.Died:Connect(function()
                -- Wait for a short time before destroying the mob's instance
                task.wait(0.5)
                newMob:Destroy()
            end)

            -- Start a coroutine to make the mob move along waypoints
            coroutine.wrap(mob.Move)(newMob, map)
        end
    else
        -- Print a warning message if the requested mob does not exist
        warn("Requested mob does not exist:", name)
    end
end

-- Return the 'mob' table with its functions and data
return mob
