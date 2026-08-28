local Stamina = require(game:GetService("ReplicatedStorage")["Systems"]["Character"]["Game"]["Sprinting"])

game:GetService("RunService")["Heartbeat"]:Connect(function()
local Survivors = workspace["Players"]["Survivors"]
if not Survivors then return end
local Killers = workspace["Players"]["Killers"]
if not Killers then return end
local Lighting = game.Lighting
if not Lighting then return end
local Camera = workspace.Camera
if not Camera then return end
local LocalPlayer = game.Players.LocalPlayer
if not LocalPlayer then return end
local Character = LocalPlayer.Character
if not Character then return end
local PlayerGui = LocalPlayer.PlayerGui
if not PlayerGui then return end
local Puzzle = PlayerGui:FindFirstChild("PuzzleUI")
if not Puzzle then return end
local fov = Character:FindFirstChild("FOVMultipliers")
if not fov then return end
for _,v in ipairs(Survivors:GetChildren()) do
if v.Parent.Name == "Survivors" and v:GetAttribute("Username") == game.Players.LocalPlayer.Name then
StaminaScript.StaminaGain = _G.StaminaGainS or 22
StaminaScript.StaminaLoss = _G.StaminaLossS or 19
StaminaScript.SprintSpeed = 26.5
end
end
for _,v in ipairs(Killers:GetChildren()) do
if v.Parent.Name == "Killers" and v:GetAttribute("Username") == game.Players.LocalPlayer.Name then
StaminaScript.StaminaGain = _G.StaminaGainS or 22
StaminaScript.StaminaLoss = _G.StaminaLossS or 19
StaminaScript.SprintSpeed = 28.2
end
end
Camera.FieldOfView = 95
Lighting.OutdoorAmbient = Color3.fromRGB(150,150,150)
Lighting.Brightness = 0
Lighting.GlobalShadows = false
if not Lighting:GetAttribute("FogStart") then Lighting:SetAttribute("FogStart", Lighting.FogStart) end
if not Lighting:GetAttribute("FogEnd") then Lighting:SetAttribute("FogEnd", Lighting.FogEnd) end
Lighting.FogStart = 0
Lighting.FogEnd = math.huge
local fog = Lighting:FindFirstChildOfClass("Atmosphere")
if fog then
if not fog:GetAttribute("Density") then fog:SetAttribute("Density", fog.Density) end
fog.Density = 0
end
Puzzle.Enabled = false
end)
task.spawn(function()
while true do
local MF = workspace.Map
if not MF then return end
local Ingame = MF:FindFirstChild("Ingame")
if not Ingame then return end
local Map = Ingame:FindFirstChild("Map")
if not Map then return end
wait(math.random(4,6))
for _,v in ipairs(Ingame["Map"]:GetChildren()) do
if v.Name == "Generator" then
v.Remotes.RE:FireServer()
end
end
wait()
end
end)









