local plrs = game:GetService("Players"):GetPlayers()
local plr = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

script.Parent = plr.PlayerScripts
script.Name = "PlayerEsp"

print("Starting ESP...")

local Highlight = Instance.new("Highlight")
Highlight.FillColor = Color3.fromRGB(255,0,0)
Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
Highlight.FillTransparency = .5
Highlight.OutlineTransparency = 0
Highlight.OutlineColor = Color3.fromRGB(255,255,255)
Highlight.Name = "HighlightESP"
Highlight.Enabled = false

local function addESP(plr)
	repeat wait() until plr.Character
	local character = plr.Character

	if character:FindFirstChild("Highlight") then
		character:FindFirstChild("Hightlight"):Destroy()
	end

	local HLClone = Highlight:Clone()
	if not plr.Team then
		HLClone.FillColor = Color3.fromRGB(255,0,0)
	else
		HLClone.FillColor = plr.Team.TeamColor.Color
	end
	HLClone.Enabled = true
	HLClone.Parent = character
	HLClone.Name = "HighlightESP"

	print(plr.Name.."  -  Added ESP")

end

local function PlrReset(plr)
	plr.CharacterAdded:Connect(function()
		addESP(plr)
	end)
end

for _, v in ipairs(plrs) do
	addESP(v)

	PlrReset(v)
end

game.Players.PlayerAdded:Connect(function(plr)
	PlrReset(plr)
	addESP(plr)
end)

RunService.Heartbeat:Connect(function()
	for _, v in ipairs(plrs) do
		if v.Character and not v.Character:FindFirstChild("HighlightESP") then
			addESP(v)
		end
	end
end)