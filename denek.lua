-- GUI elemanları oluşturma
local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 200, 0, 50) -- Butonun boyutu
flyButton.Position = UDim2.new(0.5, -100, 0, -75) -- Butonun konumu (ekranın ortasında, biraz yukarıda)
flyButton.AnchorPoint = Vector2.new(0.5, 0.5) -- Butonun orta noktası
flyButton.Text = "Uçur"
flyButton.Parent = gui

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30) -- Butonun boyutu
closeButton.Position = UDim2.new(0.95, -15, 0.05, 0) -- Butonun konumu (ekranın sağ üst köşesinde)
closeButton.Text = "X"
closeButton.Parent = gui

-- Uçma işlevselliği için değişkenler
local isFlying = false
local humanoidRootPart = nil
local initialPosition = nil

-- Uçma butonuna tıklama olayını bağlama
flyButton.MouseButton1Click:Connect(function()
    if not isFlying then
        -- Uçmeye başla
        isFlying = true
        flyButton.Text = "Durdur"
        humanoidRootPart = player.Character.HumanoidRootPart
        initialPosition = humanoidRootPart.Position

        -- Uçma döngüsü
        while isFlying do
            humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position + Vector3.new(0, 5, 0)) -- Yükseklik artışı
            wait(0.1)
        end
    else
        -- Uçmayı durdur
        isFlying = false
        flyButton.Text = "Uçur"
        humanoidRootPart.CFrame = CFrame.new(initialPosition)
        humanoidRootPart = nil
        initialPosition = nil
    end
end)

-- Kapatma butonuna tıklama olayını bağlama
closeButton.MouseButton1Click:Connect(function()
    flyButton:Destroy()
    closeButton:Destroy()
end)
