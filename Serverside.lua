-- RemoteEvent tanımlaması ve bağlama
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local killAllPlayersEvent = Instance.new("RemoteEvent")
killAllPlayersEvent.Name = "KillAllPlayersEvent"
killAllPlayersEvent.Parent = ReplicatedStorage

-- Bir kere tetiklendiğinde çalışacak fonksiyon
local function onKillAllPlayersRequested(player)
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

    -- Bağlılığı kaldır
    killAllPlayersEvent.OnServerEvent:Disconnect()
end

-- RemoteEvent'e bağlama
killAllPlayersEvent.OnServerEvent:Connect(onKillAllPlayersRequested)
