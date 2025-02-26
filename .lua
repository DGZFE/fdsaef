local bannedPlayers = {}

-- Function to ban a player
function banPlayer(player)
    local playerName = player.Name
    bannedPlayers[playerName] = true
    player:Kick("You have been banned from this game.")
    print(playerName .. " has been banned.")
end

-- Function to check if a player is banned
function isPlayerBanned(player)
    return bannedPlayers[player.Name] or false
end

-- Event listener for when a player joins the game
game.Players.PlayerAdded:Connect(function(player)
    if isPlayerBanned(player) then
        player:Kick("You are banned from this game.")
    end
end)

-- Function to display a menu of players and ask which player to ban
function showBanMenu()
    print("Select a player to ban:")
    for i, player in ipairs(game.Players:GetPlayers()) do
        print(i .. ": " .. player.Name)
    end
    
    local playerIndex = tonumber(io.read())
    local selectedPlayer = game.Players:GetPlayers()[playerIndex]
    
    if selectedPlayer then
        banPlayer(selectedPlayer)
    else
        print("Invalid selection. No player was banned.")
    end
end

-- Call the ban menu function when needed
showBanMenu()
