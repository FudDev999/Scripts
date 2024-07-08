-- RemoteEvent tanımlaması
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local killAllPlayersEvent = Instance.new("RemoteEvent")
killAllPlayersEvent.Name = "KillAllPlayersEvent"
killAllPlayersEvent.Parent = ReplicatedStorage

-- Buton tıklama olayını dinleme
killAllPlayersEvent.OnServerEvent:Connect(function(player)
    -- Güvenlik kontrolü (isteğe bağlı): Yalnızca yönetici yetkisine sahip oyunculara izin verin
    -- if not player:IsInGroup(YöneticiGrupIDsi) then
    --     return
    -- end

    -- Tüm oyuncuları öldürme işlemi
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            otherPlayer.Character:BreakJoints()
        end
    end
end)
