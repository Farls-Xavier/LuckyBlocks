local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Farls-Xavier/UiLibrary/main/Library.lua"))()

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
