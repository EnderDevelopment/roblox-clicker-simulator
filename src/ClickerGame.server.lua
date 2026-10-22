-- Clicker Game Script

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create a RemoteEvent for communication
local clickEvent = Instance.new("RemoteEvent")
clickEvent.Name = "ClickEvent"
clickEvent.Parent = ReplicatedStorage

-- Create a RemoteFunction to get the current score
local getScoreFunction = Instance.new("RemoteFunction")
getScoreFunction.Name = "GetScoreFunction"
getScoreFunction.Parent = ReplicatedStorage

-- Initialize player scores
local playerScores = {}

-- Function to handle player clicks
local function onPlayerClick(player)
    if not playerScores[player] then
        playerScores[player] = 0
    end
    playerScores[player] = playerScores[player] + 1
end

-- Function to get the current score for a player
local function getPlayerScore(player)
    return playerScores[player] or 0
end

-- Connect the RemoteEvent to the click handler
clickEvent.OnServerEvent:Connect(onPlayerClick)

-- Connect the RemoteFunction to the score getter
getScoreFunction.OnServerInvoke = getPlayerScore

-- Clean up when a player leaves
game.Players.PlayerRemoving:Connect(function(player)
    playerScores[player] = nil
end)