-- GUI elemanlarını alma
local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EnlargementGui"
screenGui.Parent = gui

-- Büyüme butonu oluşturma
local enlargeButton = Instance.new("TextButton")
enlargeButton.Name = "EnlargeButton"
enlargeButton.Size = UDim2.new(0, 200, 0, 50)
enlargeButton.Position = UDim2.new(0.5, -100, 0.2, -25)
enlargeButton.Text = "Büyüt"
enlargeButton.Parent = screenGui

-- Kapatma butonu oluşturma
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(0.95, -15, 0.05, 0)
closeButton.Text = "X"
closeButton.Parent = screenGui

-- Büyüme butonuna tıklama olayı
enlargeButton.MouseButton1Click:Connect(function()
    -- Büyüme mesafesi
    local growthAmount = 80

    -- Karakterin büyütülmesi
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:Move(Vector3.new(0, growthAmount, 0))
        end
    end
end)

-- Kapatma butonuna tıklama olayı
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
