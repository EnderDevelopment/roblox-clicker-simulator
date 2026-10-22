-- Clicker Game Server Script

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local clickEvent = Instance.new("RemoteEvent")
clickEvent.Name = "ClickEvent"
clickEvent.Parent = ReplicatedStorage

local scoreUpdateEvent = Instance.new("RemoteEvent")
scoreUpdateEvent.Name = "ScoreUpdateEvent"
scoreUpdateEvent.Parent = ReplicatedStorage

local scores = {}

Players.PlayerAdded:Connect(function(player)
    scores[player] = 0

    clickEvent.OnServerEvent:Connect(function(plr)
        if plr == player then
            scores[player] = scores[player] + 1
            scoreUpdateEvent:FireClient(player, scores[player])
        end
    end)
end)