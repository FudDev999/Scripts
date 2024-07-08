-- Script başlangıcı
local Players = game:GetService("Players")

-- Düğme oluşturulması
local button = Instance.new("TextButton")
button.Parent = game.Players.LocalPlayer.PlayerGui -- Düğmeyi lokal oyuncunun GUI'sine ekler, isteğe göre değiştirilebilir
button.Position = UDim2.new(0, 10, 0, 10) -- Düğmenin konumu (x, y)
button.Size = UDim2.new(0, 150, 0, 50) -- Düğmenin boyutu (genişlik, yükseklik)
button.Text = "Işınlama Butonu!" -- Düğmenin metni

-- Carpı butonu oluşturulması
local closeButton = Instance.new("TextButton")
closeButton.Parent = game.Players.LocalPlayer.PlayerGui -- Carpı butonunu lokal oyuncunun GUI'sine ekler
closeButton.Position = UDim2.new(0, 10, 0, 70) -- Konumunu ayarlar
closeButton.Size = UDim2.new(0, 150, 0, 30) -- Boyutunu ayarlar
closeButton.Text = "X" -- Carpı butonunun metni

-- Düğme fonksiyonu
button.MouseButton1Click:Connect(function()
    local character = Players.LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            humanoidRootPart.CFrame = CFrame.new(0, 100, 0) -- Karakteri yüksekliği 100 birim ışınlar
        end
    end
end)

-- Carpı butonu fonksiyonu
closeButton.MouseButton1Click:Connect(function()
    button.Visible = false -- Düğmeyi gizler
    closeButton.Visible = false -- Carpı butonunu gizler
end)
