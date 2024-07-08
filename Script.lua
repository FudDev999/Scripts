-- Script başlangıcı
local Players = game:GetService("Players")

-- Düğme oluşturulması
local button = Instance.new("TextButton")
button.Parent = game.Players.LocalPlayer.PlayerGui -- Düğmeyi lokal oyuncunun GUI'sine ekler, isteğe göre değiştirilebilir
button.Position = UDim2.new(0, 10, 0, 10) -- Düğmenin konumu (x, y)
button.Size = UDim2.new(0, 150, 0, 50) -- Düğmenin boyutu (genişlik, yükseklik)
button.Text = "Oyuncuyu Öldür!" -- Düğmenin metni

-- İsim giriş alanı oluşturulması
local nameInput = Instance.new("TextBox")
nameInput.Parent = game.Players.LocalPlayer.PlayerGui -- İsim giriş alanını lokal oyuncunun GUI'sine ekler
nameInput.Position = UDim2.new(0, 10, 0, 70) -- Konumunu ayarlar
nameInput.Size = UDim2.new(0, 200, 0, 30) -- Boyutunu ayarlar
nameInput.PlaceholderText = "Oyuncu adını girin..." -- Placeholder metni

-- Düğme fonksiyonu
button.MouseButton1Click:Connect(function()
    local playerName = nameInput.Text -- İsim giriş alanından oyuncu adını al

    -- Oyuncu adı boş değilse ve bu isimde bir oyuncu bulunuyorsa
    local targetPlayer = Players:FindFirstChild(playerName)
    if targetPlayer then
        -- Oyuncuyu öldürme işlemi
        local targetCharacter = targetPlayer.Character
        if targetCharacter then
            targetCharacter:BreakJoints() -- Oyuncunun eklem bağlantılarını kırarak öldürür
        end
    else
        -- Hata durumu: Belirtilen isimde bir oyuncu bulunamadı
        print("Belirtilen isimde bir oyuncu bulunamadı.")
    end
end)
