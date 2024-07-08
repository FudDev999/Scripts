-- GUI elemanları oluşturma
local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 200, 0, 50) -- Butonun boyutu
flyButton.Position = UDim2.new(0.5, -100, 0.5, -25) -- Butonun konumu (ekranın ortasında, biraz yukarıda)
flyButton.AnchorPoint = Vector2.new(0.5, 0.5) -- Butonun orta noktası
flyButton.Text = "Uçur"
flyButton.Parent = gui

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30) -- Butonun boyutu
closeButton.Position = UDim2.new(0.95, -15, 0.05, 0) -- Butonun konumu (ekranın sağ üst köşesinde)
closeButton.Text = "X"
closeButton.Parent = gui

-- Karakterin uçup uçmadığını takip eden değişken
local isFlying = false

-- Uçur butonuna tıklama olayını bağlama
flyButton.MouseButton1Click:Connect(function()
    isFlying = not isFlying -- Durumu tersine çevir

    if isFlying then
        -- Uçuyorsa
        flyButton.Text = "Durdur"
        -- Karakterin yüksekliğini ayarla
        player.Character.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position + Vector3.new(0, 50, 0))
    else
        -- Uçmüyorsa
        flyButton.Text = "Uçur"
    end
end)

-- Kapatma butonuna tıklama olayını bağlama
closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
