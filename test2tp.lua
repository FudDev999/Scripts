-- LocalPlayer ve Character tanımlaması
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- GUI elemanları oluşturma
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(0, 200, 0, 50) -- Butonun boyutu
teleportButton.Position = UDim2.new(0.5, -100, 0, -75) -- Butonun konumu (ekranın üst ortasında)
teleportButton.Text = "Işınlan"
teleportButton.Parent = screenGui

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30) -- Butonun boyutu
closeButton.Position = UDim2.new(0.95, -15, 0.05, 0) -- Butonun konumu (ekranın sağ üst köşesinde)
closeButton.Text = "X"
closeButton.Parent = screenGui

-- Işınlanma mesafesi (5 santim = 0.05 metre)
local teleportDistance = 300

-- Butona tıklama olayını bağlama
teleportButton.MouseButton1Click:Connect(function()
    local currentPosition = character.HumanoidRootPart.Position
    local forwardDirection = character.HumanoidRootPart.CFrame.lookVector
    local newPosition = currentPosition + forwardDirection * teleportDistance

    -- Yeni pozisyona ışınlanma
    character:SetPrimaryPartCFrame(CFrame.new(newPosition))
end)

-- Kapatma butonuna tıklama olayını bağlama
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
