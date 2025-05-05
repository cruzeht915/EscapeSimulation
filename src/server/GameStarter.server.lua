local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("Shared"):WaitForChild("StoryRemoteEvent")

remote.OnServerEvent:Connect(function(player)
	local spawn = workspace:WaitForChild("PlayerSpawnAfterStory")

	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		player.Character:MoveTo(spawn.Position)
	end

	-- Optional: Make obby visible or activate traps
	local obby = workspace:FindFirstChild("ObstacleCourse")
	if obby then
		obby.Parent = workspace
	end
end)