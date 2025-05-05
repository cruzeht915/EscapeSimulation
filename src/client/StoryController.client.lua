local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui"):WaitForChild("StoryScreenGui")
local framesFolder = gui:WaitForChild("FramesFolder")
local continueButton = gui:WaitForChild("ContinueButton")
local skipButton = gui:WaitForChild("SkipButton")

local frameList = framesFolder:GetChildren()
table.sort(frameList, function(a, b) return a.Name < b.Name end)

local currentIndex = 1

local function showFrame(index)
	for i, frame in ipairs(frameList) do
		frame.Visible = (i == index)
	end
end

continueButton.MouseButton1Click:Connect(function()
	currentIndex += 1
	if currentIndex > #frameList then
		gui.Enabled = false
		ReplicatedStorage:WaitForChild("Shared"):WaitForChild("StoryRemoteEvent"):FireServer()
	else
		showFrame(currentIndex)
	end
end)

skipButton.MouseButton1Click:Connect(function()
	gui.Enabled = false
	ReplicatedStorage:WaitForChild("Shared"):WaitForChild("StoryRemoteEvent"):FireServer()
end)

showFrame(currentIndex)