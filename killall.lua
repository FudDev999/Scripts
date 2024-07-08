-- GUI elemanları oluşturma
local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

local killAllButton = Instance.new("TextButton")
killAllButton.Size = UDim2.new(0, 200, 0, 50) -- Butonun boyutu
killAllButton.Position = UDim2.new(0.5, -100, 0.5, -25) -- Butonun konumu (ekranın tam ortasında)
killAllButton.AnchorPoint = Vector2.new(0.5, 0.5) -- Butonun orta noktası
killAllButton.Text = "Tüm Oyuncuları Öldür"
killAllButton.Parent = gui

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30) -- Butonun boyutu
closeButton.Position = UDim2.new(0.95, -15, 0.05, 0) -- Butonun konumu (ekranın sağ üst köşesinde)
closeButton.Text = "X"
closeButton.Parent = gui

-- Butona tıklama olayını bağlama
killAllButton.MouseButton1Click:Connect(function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local killAllPlayersEvent = ReplicatedStorage:WaitForChild("KillAllPlayersEvent")

    -- Sunucuya tüm oyuncuları öldürme isteği gönderme
    killAllPlayersEvent:FireServer()
end)

-- Kapatma butonuna tıklama olayını bağlama
closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
