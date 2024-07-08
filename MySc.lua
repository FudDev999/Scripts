-- Script başlangıcı
local Players = game:GetService("Players")

-- Düğme oluşturulması
local button = Instance.new("TextButton")
button.Parent = game.Players.LocalPlayer.PlayerGui -- Düğmeyi lokal oyuncunun GUI'sine ekler, isteğe göre değiştirilebilir
button.Position = UDim2.new(0, 10, 0, 10) -- Düğmenin konumu (x, y)
button.Size = UDim2.new(0, 100, 0, 50) -- Düğmenin boyutu (genişlik, yükseklik)
button.Text = "Kafamı Büyüt!" -- Düğmenin metni

-- Kapatma düğmesi oluşturulması
local closeButton = Instance.new("TextButton")
closeButton.Parent = button -- Kapatma düğmesini ana düğmeye ekler
closeButton.Position = UDim2.new(1, 5, 0, 0) -- Sağ üst köşeye yerleştirir
closeButton.Size = UDim2.new(0, 20, 0, 20) -- Boyutu ayarlar
closeButton.Text = "X" -- Kapatma düğmesinin metni

-- Kapatma düğmesi fonksiyonu
closeButton.MouseButton1Click:Connect(function()
    button.Visible = false -- Ana düğmeyi gizler
end)

-- Ana düğme fonksiyonu
button.MouseButton1Click:Connect(function()
    -- Karakterin kafasını büyütme işlemi
    local character = Players.LocalPlayer.Character
    if character then
        local head = character:FindFirstChild("Head")
        if head then
            head.Size = Vector3.new(2, 2, 2) -- Kafa boyutunu 2 katına çıkarır
        end
    end
end)
