-- Clicker Game Client Script

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Get the RemoteEvent and RemoteFunction
local clickEvent = ReplicatedStorage:WaitForChild("ClickEvent")
local getScoreFunction = ReplicatedStorage:WaitForChild("GetScoreFunction")

-- Create a GUI for the clicker game
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ClickerGameGUI"
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 0.5, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.Text = "Score: 0"
textLabel.TextScaled = true
textLabel.Parent = frame

local clickButton = Instance.new("TextButton")
clickButton.Size = UDim2.new(1, 0, 0.5, 0)
clickButton.Position = UDim2.new(0, 0, 0.5, 0)
clickButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
clickButton.TextColor3 = Color3.new(1, 1, 1)
clickButton.Text = "Click Me!"
clickButton.TextScaled = true
clickButton.Parent = frame

-- Function to update the score display
local function updateScore()
    local score = getScoreFunction:InvokeServer()
    textLabel.Text = "Score: " .. score
end

-- Connect the button click to the RemoteEvent
clickButton.MouseButton1Click:Connect(function()
    clickEvent:FireServer()
    updateScore()
end)

-- Initial score update
updateScore()