local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Farls-Xavier/UiLibrary/main/Library.lua"))()

game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Sorry!",
    Text = "This wont be getting any updates sorry :sob: maybe it will?? kidding... :sob:",
})

local Player = game.Players.LocalPlayer

local Window = Library:Window({
	Title = "Lucky Blocks - 662417684"
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
            if Player.Backpack:FindFirstChild("HexSpitter") or Player.Character:FindFirstChild("HexSpitter") then
                if Player.Backpack:FindFirstChild("HexSpitter") then
                    Player.Backpack:FindFirstChild("HexSpitter").Parent = Player.Character

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

                local HexSpitter = game.Players.LocalPlayer.Character.HexSpitter
                local ServerControl = HexSpitter.Remotes.ServerControl
                for _ = 1,20 do
                    for _, Child in next, game.Players:GetPlayers() do
                        if Child ~= game.Players.LocalPlayer then
                            ServerControl:InvokeServer('RayHit', {['Position'] = Child.Character.Head.Position, ["Hit"] = Child.Character.Head})
                        end
                    end
                end
            else
                Window:Notification("Notification", "HexSpitter not found", 5)
            end
        end
    }),

    ["info"] = Tabs.Main:Label({
        Text = "For kill all you need a hex spitter."
    }),

    ["Earrape"] = Tabs.Main:Button({
        Text = "Earrape children(Don't spam)",
        Callback = function()
            for _, sound in next, workspace:GetDescendants() do
                if sound:IsA("Sound") then
                    sound:Play()
                end
             end
             
             for _, sound in next, game.ReplicatedStorage:GetDescendants() do
                if sound:IsA("Sound") then
                    sound:Play()
                end
             end
        end
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
