local Stamina = require(game:GetService("ReplicatedStorage")["Systems"]["Character"]["Game"]["Sprinting"])

game:GetService("RunService").Heartbeat:Connect(function()
    local Survivors = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Survivors")
    if not Survivors then return end

    local Killers = workspace.Players:FindFirstChild("Killers")
    if not Killers then return end

    local Lighting = game:GetService("Lighting")
    if not Lighting then return end

    local Camera = workspace.CurrentCamera
    if not Camera then return end

    local LocalPlayer = game.Players.LocalPlayer
    if not LocalPlayer then return end

    local Character = LocalPlayer.Character
    if not Character then return end

    local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if not PlayerGui then return end

    local Puzzle = PlayerGui:FindFirstChild("PuzzleUI")
    if not Puzzle then return end

    -- Survivors
    for _, v in ipairs(Survivors:GetChildren()) do
        if v:GetAttribute("Username") == LocalPlayer.Name then
            Stamina.StaminaGain = _G.StaminaGainS or 22
            Stamina.StaminaLoss = _G.StaminaLossS or 19
            Stamina.SprintSpeed = 26.5
        end
    end

    -- Killers
    for _, v in ipairs(Killers:GetChildren()) do
        if v:GetAttribute("Username") == LocalPlayer.Name then
            Stamina.StaminaGain = _G.StaminaGainS or 22
            Stamina.StaminaLoss = _G.StaminaLossS or 19
            Stamina.SprintSpeed = 28.2
        end
    end

    -- FOV + Lighting
    Camera.FieldOfView = 95
    Lighting.OutdoorAmbient = Color3.fromRGB(150, 150, 150)
    Lighting.Brightness = 0
    Lighting.GlobalShadows = false

    if not Lighting:GetAttribute("FogStart") then
        Lighting:SetAttribute("FogStart", Lighting.FogStart)
    end
    if not Lighting:GetAttribute("FogEnd") then
        Lighting:SetAttribute("FogEnd", Lighting.FogEnd)
    end
    Lighting.FogStart = 0
    Lighting.FogEnd = math.huge

    local fog = Lighting:FindFirstChildOfClass("Atmosphere")
    if fog then
        if not fog:GetAttribute("Density") then
            fog:SetAttribute("Density", fog.Density)
        end
        fog.Density = 0
    end

    Puzzle.Enabled = false
end)

-- Auto Generator
task.spawn(function()
    while true do
        local MF = workspace:FindFirstChild("Map")
        if not MF then
            task.wait(1)
            continue
        end

        local Ingame = MF:FindFirstChild("Ingame")
        if not Ingame then
            task.wait(1)
            continue
        end

        local Map = Ingame:FindFirstChild("Map")
        if not Map then
            task.wait(1)
            continue
        end

        task.wait(math.random(4, 6))

        for _, v in ipairs(Map:GetChildren()) do
            if v.Name == "Generator" and v:FindFirstChild("Remotes") and v.Remotes:FindFirstChild("RE") then
                v.Remotes.RE:FireServer()
            end
        end

        task.wait()
    end
end)





