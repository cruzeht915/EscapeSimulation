--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("Shared"):WaitForChild("StoryRemoteEvent")

local LavaBlockModule = require(ReplicatedStorage.Shared.parts.LavaPart)
local LavaPart = LavaBlockModule :: BlockClass

local SpeedPart = require(ReplicatedStorage.Shared.parts.SpeedPart)
type BlockInstance = {
	Init: (self: BlockInstance) -> nil
}

type BlockClass = {
	new: (part: BasePart) -> BlockInstance
}


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

-- Helper: attach behavior to all parts in a folder
local function attachBlockBehaviors(folder: Folder, classModule: BlockClass)
	for _, part in folder:GetChildren() do
		if part:IsA("BasePart") then
			local block = classModule.new(part)
			block:Init()
		end
	end
end

-- Locate block folders in obby
local obby = workspace:WaitForChild("ObstacleCourse")
local lavaFolder = obby:WaitForChild("LavaBlocks")
local speedBlock = obby:WaitForChild("Walls"):WaitForChild("Level3Walls"):WaitForChild("StartPlatform")
local slowBlock = obby:WaitForChild("Walls"):WaitForChild("Level3Walls"):WaitForChild("EndPlatform")
local winSpeedBlock = obby:WaitForChild("Walls"):WaitForChild("EndWalls"):WaitForChild("EndWall")

-- Set up interactive blocks
attachBlockBehaviors(lavaFolder, LavaPart)
if speedBlock:IsA("BasePart") then
    local block = SpeedPart.new(speedBlock, 32)
    block:Init()
end
if slowBlock:IsA("BasePart") then
    local block = SpeedPart.new(slowBlock, 10)
    block:Init()
end
if winSpeedBlock:IsA("BasePart") then
    local block = SpeedPart.new(winSpeedBlock, 50)
    block:Init()
end