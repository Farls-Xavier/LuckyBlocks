local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Farls-Xavier/UiLibrary/main/Library.lua"))()

local Player = game.Players.LocalPlayer

local Window = Library:Window({
	Title = "Lucky Blocks"
})

local Tabs = {
    ["Main"] = Window:Tab({
        Text = "Main",
        Icon = ""
    }),
    ["Player"] = Window:Tab({
        Text = "Player",
        Icon = ""
    })
}

local MainStuff = {
    ["Kill all"] = Tabs.Main:Button({
        Text = "Attempt to kill all",
        Callback = function()
            if Player.Backpack:FindFirstChild("HexSpitter") then
                Player.Backpack.HexSpitter.Parent = Player.Character
            else
                if game.Players.LocalPlayer.Character:FindFirstChild("HexSpitter") then
                    local HexSpitter = game.Players.LocalPlayer.Character.HexSpitter
                    local ServerControl = HexSpitter.Remotes.ServerControl
                    for _ = 1,20 do
                        for _, Child in next, game.Players:GetPlayers() do
                            if Child ~= game.Players.LocalPlayer then
                                ServerControl:InvokeServer('RayHit', {['Position'] = Child.Character.Head.Position, ["Hit"] = Child.Character.Head})
                            end
                        end
                    end
                end
            end
            local HexSpitter = game.Players.LocalPlayer.Character.HexSpitter
            local ServerControl = HexSpitter.Remotes.ServerControl
            for _ = 1,20 do
                for _, Child in next, game.Players:GetPlayers() do
                    if Child ~= game.Players.LocalPlayer then
                        ServerControl:InvokeServer('RayHit', {['Position'] = Child.Character.Head.Position, ["Hit"] = Child.Character.Head})
                    end
                end
            end
        end
    }),

    ["Seperator"] = Tabs.Main:Label({
        Text = "",
        Weight = Enum.FontWeight.Medium
    }),

    ["Give 1 Block"] = Tabs.Main:Button({
        Text = "Give 1 Block",
        Callback = function()
            game.ReplicatedStorage.SpawnGalaxyBlock:FireServer()
        end
    }),

    ["Give 10 Blocks"] = Tabs.Main:Button({
        Text = "Give 10 Blocks",
        Callback = function()
            for i = 1, 10 do
                game.ReplicatedStorage.SpawnGalaxyBlock:FireServer()
            end
        end
    }),

    ["Give 50 Blocks"] = Tabs.Main:Button({
        Text = "Give 50 Blocks",
        Callback = function()
            for i = 1, 50 do
                game.ReplicatedStorage.SpawnGalaxyBlock:FireServer()
            end
        end
    })
}

local PlayerStuff = {
    ["WalkSpeed Slider"] = Tabs.Player:Slider({
        Text = "WalkSpeed",
        Min = 0,
        Max = 500,
        Default = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,
        Callback = function(v)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
        end
    }),
    
    ["JumpPower Slider"] = Tabs.Player:Slider({
        Text = "JumpPower",
        Min = 0,
        Max = 500,
        Default = game.Players.LocalPlayer.Character.Humanoid.JumpPower or game.Players.LocalPlayer.Character.Humanoid.JumpHeight,
        Callback = function(v)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid.JumpHeight = v
            end)
        end
    })
}
