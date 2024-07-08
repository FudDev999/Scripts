-- LocalPlayer ve Character tanımlaması
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- GUI elemanları oluşturma
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50) -- Butonun boyutu
button.Position = UDim2.new(0.5, -100, 0.5, -25) -- Butonun konumu (ekranın ortasında)
button.Text = "Işınlan"
button.Parent = screenGui

-- Işınlanma mesafesi (5 santim = 0.05 metre)
local teleportDistance = 300

-- Butona tıklama olayını bağlama
button.MouseButton1Click:Connect(function()
    local currentPosition = character.HumanoidRootPart.Position
    local forwardDirection = character.HumanoidRootPart.CFrame.lookVector
    local newPosition = currentPosition + forwardDirection * teleportDistance

    -- Yeni pozisyona ışınlanma
    character:SetPrimaryPartCFrame(CFrame.new(newPosition))
end)
