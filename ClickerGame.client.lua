-- Clicker Game Client Script

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ClickerGameGui"
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
frame.Parent = screenGui

local clickButton = Instance.new("TextButton")
clickButton.Size = UDim2.new(0, 100, 0, 50)
clickButton.Position = UDim2.new(0.5, -50, 0.5, -25)
clickButton.AnchorPoint = Vector2.new(0.5, 0.5)
clickButton.Text = "Click Me!"
clickButton.TextColor3 = Color3.new(1, 1, 1)
clickButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
clickButton.Parent = frame

local scoreLabel = Instance.new("TextLabel")
scoreLabel.Size = UDim2.new(0, 200, 0, 30)
scoreLabel.Position = UDim2.new(0.5, 0, 0.5, 30)
scoreLabel.AnchorPoint = Vector2.new(0.5, 0.5)
scoreLabel.Text = "Score: 0"
scoreLabel.TextColor3 = Color3.new(1, 1, 1)
scoreLabel.BackgroundTransparency = 1
scoreLabel.Parent = frame

local clickEvent = ReplicatedStorage:WaitForChild("ClickEvent")

clickButton.MouseButton1Click:Connect(function()
    clickEvent:FireServer()
end)

local scoreUpdateEvent = ReplicatedStorage:WaitForChild("ScoreUpdateEvent")

scoreUpdateEvent.OnClientEvent:Connect(function(score)
    scoreLabel.Text = "Score: " .. score
end)