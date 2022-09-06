--[[
                 _                   _ _ _       
                | |                 | (_) |      
      __ _ _ __ | |__  _ __ ___   __| |_| |_ ___ 
     / _` | '_ \| '_ \| '__/ _ \ / _` | | __/ _ \
    | (_| | |_) | | | | | | (_) | (_| | | ||  __/
     \__,_| .__/|_| |_|_|  \___/ \__,_|_|\__\___|
          | |                                    
          |_|                                    

              steal my source code, idrc
                i suck at lua anyways
]] 


local library = loadstring(game.HttpGet(game,
                                           "https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/0x"))()

local General = library:Window("General") -- Walkspeed, Jumppower, etc.
local Teleports = library:Window("Teleports") -- Quick teleports
local Teams = library:Window("Teams") -- Switch teams easily

-- General: Walkspeed
General:Slider("WalkSpeed", "WS", 16, 300, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

-- General: JumpPower
General:Slider("JumpPower", "JP", 50, 300, function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end, 100)

-- General: Invisible
General:Toggle("Invisible", "invis", false, function(toggled)
    if toggled == true then
        char = game:GetService("Players").LocalPlayer.Character

        for i, v in pairs(char:GetDescendants()) do -- loop through everything in the character
            if v:IsA("BasePart") or v:IsA("Decal") then -- if it is a part
                v.Transparency = 1 -- make it invisible
            end
        end

        char.Humanoid.DisplayDistanceType =
            Enum.HumanoidDisplayDistanceType.None
    elseif toggled == false then
        char = game:GetService("Players").LocalPlayer.Character

        for i, v in pairs(char:GetDescendants()) do -- loop through everything in the character
            if v:IsA("BasePart") or v:IsA("Decal") then -- if it is a part
                v.Transparency = 0 -- make it invisible
            end
        end

        char.HumanoidRootPart.Transparency = 1
    end
end)

-- General: Fly
General:Toggle("Fly", "fly", false, function(toggled)
    if toggled == true then
        local Player = game.Players.LocalPlayer
        local Char = Player.Character
        while not Char do
            wait()
            Char = Player.Character
        end
        local Humanoid = Char:WaitForChild("Humanoid")
        local Root = Char:FindFirstChild("HumanoidRootPart")
        while not Root do
            wait()
            Root = Char:FindFirstChild("HumanoidRootPart")
        end
        local Mouse = Player:GetMouse()
        local Cam = game.Workspace.CurrentCamera

        local dir = {w = 0, s = 0, a = 0, d = 0}
        local spd = 2
        Mouse.KeyDown:connect(function(key)
            if key:lower() == "w" then
                dir.w = 1
            elseif key:lower() == "s" then
                dir.s = 1
            elseif key:lower() == "a" then
                dir.a = 1
            elseif key:lower() == "d" then
                dir.d = 1
            elseif key:lower() == "q" then
                spd = spd + 1
            elseif key:lower() == "e" then
                spd = spd - 1
            end
        end)
        Mouse.KeyUp:connect(function(key)
            if key:lower() == "w" then
                dir.w = 0
            elseif key:lower() == "s" then
                dir.s = 0
            elseif key:lower() == "a" then
                dir.a = 0
            elseif key:lower() == "d" then
                dir.d = 0
            end
        end)
        Root.Anchored = true
        Humanoid.PlatformStand = true
        Humanoid.Changed:connect(function() Humanoid.PlatformStand = true end)
        repeat
            wait(1 / 44)
            Root.CFrame = CFrame.new(Root.Position, Cam.CoordinateFrame.p) *
                              CFrame.Angles(0, math.rad(180), 0) *
                              CFrame.new((dir.d - dir.a) * spd, 0,
                                         (dir.s - dir.w) * spd)
        until nil
    elseif toggled == false then
        player = game:GetService("Players").LocalPlayer
        playercurrentpositiongeneral = player.Character.HumanoidRootPart
                                           .Position

        player.Character.Humanoid.Health = 0
        wait(game:GetService("Players").RespawnTime + 2)
        player.Character:MoveTo(playercurrentpositiongeneral)
    end
end)

-- General: Freeze
General:Toggle("Freeze", "frz", false, function(toggled)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = toggled
end)

-- General: Btools
General:Button('Btools', function()
    backpack = game:GetService("Players").LocalPlayer.Backpack

    hammer = Instance.new("HopperBin")
    hammer.Name = "Hammer"
    hammer.BinType = 4
    hammer.Parent = backpack

    cloneTool = Instance.new("HopperBin")
    cloneTool.Name = "Clone"
    cloneTool.BinType = 3
    cloneTool.Parent = backpack

    grabTool = Instance.new("HopperBin")
    grabTool.Name = "Grab"
    grabTool.BinType = 2
    grabTool.Parent = backpack
end)

-- General: Destroy
General:Button("Destroy GUI", function()
    for i, v in pairs(game.CoreGui:GetChildren()) do
        if v:FindFirstChild("Top") then v:Destroy() end
    end
end)

-- Teleports: ALL
Teleports:Button("Campsite", function()
    pos = "-305.706, 40.2968, -62.0767"
    game:GetService("Players").LocalPlayer.Character:MoveTo(pos)
end)

Teleports:Button("School", function()
    pos = "-277.612, 38.7978, 241.121"
    game:GetService("Players").LocalPlayer.Character:MoveTo(pos)
end)

Teleports:Button("Cinema", function()
    pos = "-427.331, 44.6627, 373.63"
    game:GetService("Players").LocalPlayer.Character:MoveTo(pos)
end)

Teleports:Button("Mountain", function()
    pos = "679.87, 325.165, -7.71623"
    game:GetService("Players").LocalPlayer.Character:MoveTo(pos)
end)

Teleports:Button("Cars", function()
    pos = "-696.51, 38.9656, 313.779"
    game:GetService("Players").LocalPlayer.Character:MoveTo(pos)
end)

-- Teams: ALL
Teams:Button("Switch to Kids Team", function()
    player = game:GetService("Players").LocalPlayer
    player.TeamColor = game:GetService("Teams")["Kids"].TeamColor
    player:LoadCharacter()
end)

Teams:Button("Switch to Parents Team", function()
    player = game:GetService("Players").LocalPlayer
    player.TeamColor = game:GetService("Teams")["Parents"].TeamColor
    player:LoadCharacter()
end)

Teams:Button("Switch to Teens Team", function()
    player = game:GetService("Players").LocalPlayer
    player.TeamColor = game:GetService("Teams")["Teens"].TeamColor
    player:LoadCharacter()
end)

Teams:Button("Switch to Pets Team", function()
    player = game:GetService("Players").LocalPlayer
    player.TeamColor = game:GetService("Teams")["Pets"].TeamColor
    player:LoadCharacter()
end)
