-- NuvClient [PRISON LIFE]

script.Name = "NuvClient"

local SGUI = Instance.new("ScreenGui")
SGUI.Parent = game:GetService("CoreGui")
SGUI.Name = "NuvClientUI"

local isSignedIn = false

local plr = game.Players.LocalPlayer

-- Frames / Main

local LoginFrame = Instance.new("Frame")
LoginFrame.Size = UDim2.new(0, 352, 0, 35)
LoginFrame.BackgroundColor3 = Color3.fromRGB(4, 4, 4) 
LoginFrame.Parent = SGUI
LoginFrame.BackgroundTransparency = .4
LoginFrame.AnchorPoint = Vector2.new(.5,.5)
LoginFrame.Position = UDim2.new(.5,0,.5,0)

local UIScale = Instance.new("UIScale")
UIScale.Scale = 1
UIScale.Parent = LoginFrame

local UICorner12 = Instance.new("UICorner")
UICorner12.CornerRadius = UDim.new(0,12)
UICorner12.Parent = LoginFrame

local UIStroke35 = Instance.new("UIStroke")
UIStroke35.Thickness = 3.5
UIStroke35.Color = Color3.fromRGB(255,255,255)
UIStroke35.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke35.Transparency = 0
UIStroke35.Parent = LoginFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 289,0, 45)
Title.TextSize = 35
Title.Text = "NuvClient [PRISON LIFE]"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.LuckiestGuy
Title.AnchorPoint = Vector2.new(0.5,0.5)
Title.Position = UDim2.new(0.5, 0,-0.643, 0)
Title.BackgroundTransparency = 1
Title.Parent = LoginFrame

local UIStrokeTitle = UIStroke35:Clone()
UIStrokeTitle.Parent = Title
UIStrokeTitle.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
UIStrokeTitle.Color = Color3.fromRGB(0,0,0)

local EnterButton = Instance.new("TextButton")
EnterButton.Parent = LoginFrame
EnterButton.BackgroundTransparency = 1
EnterButton.AnchorPoint = Vector2.new(0.5,0.5)
EnterButton.Position = UDim2.new(0.793, 0,0.485, 0)
EnterButton.Size = UDim2.new(0, 123,0, 20)
EnterButton.Font = Enum.Font.SourceSansBold
EnterButton.FontFace.Bold = true
EnterButton.FontFace.Weight = Enum.FontWeight.ExtraBold
EnterButton.Text = "ENTER"
EnterButton.TextSize = 32
EnterButton.TextColor3 = Color3.fromRGB(255,255,255)

local LoginText = Instance.new("TextBox")
LoginText.AnchorPoint = Vector2.new(0.5,0.5)
LoginText.BackgroundColor3 = Color3.fromRGB(32,32,32)
LoginText.BackgroundTransparency = .4
LoginText.Position = UDim2.new(0.295, 0,0.5, 0)
LoginText.Size = UDim2.new(0, 209,0, 35)
LoginText.Font = Enum.Font.SourceSansBold
LoginText.FontFace.Weight = Enum.FontWeight.ExtraBold
LoginText.PlaceholderColor3 = Color3.fromRGB(178,178,178)
LoginText.PlaceholderText = "Username"
LoginText.Text = ""
LoginText.TextColor3 = Color3.fromRGB(255,255,255)
LoginText.TextSize = 32
LoginText.Parent = LoginFrame

local LoginTextCorner = UICorner12:Clone()
LoginTextCorner.Parent = LoginText

local LoginTextCornerStroke = UIStroke35:Clone()
LoginTextCornerStroke.Parent = LoginText

local LoginTextStroke = UIStroke35:Clone()
LoginTextStroke.Parent = LoginText
LoginTextStroke.Thickness = 2.5
LoginTextStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
LoginTextStroke.Color = Color3.fromRGB(0,0,0)


-- Login Function

local Keys = {
--[[
	"Ab1#Cd2Ef3", "Gh4&Ij5Kk6", "Lm7*No8Pq9", "Rs0!Tu1Vw2", "Xy3$Za4Bb5", "Cc6(Dd7Ee8", "Ff9$Gg0Hh1", "Ii2*Jj3Kk4", "Ll5@Mm6Nn7", "Oo8!Pp9Qq0", 
	"Rr1^Ss2Tt3", "Uu4@Vv5Ww6", "Xx7&Yy8Zz9", "Aa0#Bb1Cc2", "Dd3*Ee4Ff5", "Gg6^Hh7Ii8", "Jj9!Kk0Ll1", "Mm2@Nn3Oo4", "Pp5*Qq6Rr7", "Ss8^Tt9Uu0", 
	"Vv1!Ww2Xx3", "Yy4*Zz5Aa6", "Bb7^Cc8Dd9", "Ee0!Ff1Gg2", "Hh3@Ii4Jj5", "Kk6*Ll7Mm8", "Nn9!Oo0Pp1", "Qq2^Rr3Ss4", "Tt5*Uu6Vv7", "Ww8!Xx9Yy0", 
	"Zz1@Aa2Bb3", "Cc4*Dd5Ee6", "Ff7^Gg8Hh9", "Ii0!Jj1Kk2", "Ll3@Mm4Nn5", "Oo6*Pp7Qq8", "Rr9^Ss0Tt1", "Uu2!Vv3Ww4", "Xx5*Yy6Zz7", "Aa8@Bb9Cc0", 
	"Dd1^Ee2Ff3", "Gg4!Hh5Ii6", "Jj7*Kk8Ll9", "Mm0^Nn1Oo2", "Pp3@Qq4Rr5", "Ss6*Tt7Uu8", "Vv9!Ww0Xx1", "Yy2^Zz3Aa4", "Bb5*Cc6Dd7", "Ee8!Ff9Gg0"
--]]
}

-- Keys used by lon (first 25): "Ab1#Cd2Ef3", "Gh4&Ij5Kk6", "Lm7*No8Pq9", "Rs0!Tu1Vw2", "Xy3$Za4Bb5", "Cc6(Dd7Ee8", "Ff9$Gg0Hh1", "Ii2*Jj3Kk4", "Ll5@Mm6Nn7", "Oo8!Pp9Qq0", "Rr1^Ss2Tt3", "Uu4@Vv5Ww6", "Xx7&Yy8Zz9", "Aa0#Bb1Cc2", "Dd3*Ee4Ff5", "Gg6^Hh7Ii8", "Jj9!Kk0Ll1", "Mm2@Nn3Oo4", "Pp5*Qq6Rr7", "Ss8^Tt9Uu0", "Vv1!Ww2Xx3", "Yy4*Zz5Aa6", "Bb7^Cc8Dd9", "Ee0!Ff1Gg2", "Hh3@Ii4Jj5"

-- If your reading this im just saving keys here for the hub once I make it, after that It will be removed from here

local XYZSfasw1 = false

EnterButton.MouseButton1Click:Connect(function()
	
	local input = LoginText.Text

	if game.Workspace:FindFirstChild(input) then
		print("Key found")
		LoginText.PlaceholderText = "Unlocked!"
		LoginText.Text = ""
		
		task.wait(.5)
		
		LoginFrame:TweenPosition(UDim2.new(0.499, 0,0.444, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, .35)
		task.wait(.4)
		LoginFrame:TweenPosition(UDim2.new(0.499, 0,2.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, .65)
		task.wait(.9)
		LoginFrame.Visible = false
		isSignedIn = true
		LoginText.PlaceholderText = "Username"

		XYZSfasw1 = true
	else
		print("key not found")
		LoginText.PlaceholderText = "User Not Found"
		LoginText.Text = ""
		LoginText.PlaceholderColor3 = Color3.fromRGB(255, 0, 0)
		task.wait(1.5)
		LoginText.PlaceholderText = "Username"
		LoginText.Text = ""
		LoginText.PlaceholderColor3 = Color3.fromRGB(178,178,178)
	end
end)


-- Main Frame


local MainFrame = Instance.new("Frame")
MainFrame.Parent = SGUI
MainFrame.AnchorPoint = Vector2.new(0.5,0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(4,4,4)
MainFrame.BackgroundTransparency = .4
MainFrame.Position = UDim2.new(0.5, 0,-0.5, 0)
MainFrame.Size = UDim2.new(0, 352,0, 593)

local UISCale2 = UIScale:Clone()
UISCale2.Parent = MainFrame

EnterButton.MouseButton1Click:Connect(function()
	if game.Workspace:FindFirstChild(LoginText.Text) then
		task.wait(1.5)
		MainFrame:TweenPosition(UDim2.new(.5,0,.5,0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, .25)
	end
end)

local asdwasdw = Instance.new("UIListLayout")
asdwasdw.Parent = MainFrame
asdwasdw.HorizontalAlignment = Enum.HorizontalAlignment.Center
asdwasdw.VerticalAlignment = Enum.VerticalAlignment.Center

local MainCorner = UICorner12:Clone()
MainCorner.Parent = MainFrame

local MainStroke = UIStroke35:Clone()
MainStroke.Parent = MainFrame

local MainBG = Instance.new("Frame")
MainBG.Parent = MainFrame
MainBG.BackgroundTransparency = 1
MainBG.Size = UDim2.new(0, 400,0, 705)

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0.035,0)
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
UIListLayout.Parent = MainBG

local MainTitle = Instance.new("TextLabel")
MainTitle.Size = UDim2.new(0, 289,0, 45)
MainTitle.TextSize = 42
MainTitle.Text = "NuvClient [PRISON LIFE]"
MainTitle.TextColor3 = Color3.fromRGB(255,255,255)
MainTitle.Font = Enum.Font.LuckiestGuy
MainTitle.BackgroundTransparency = 1
MainTitle.Parent = MainBG
MainTitle.TextXAlignment = Enum.TextXAlignment.Center
MainTitle.LayoutOrder = 1

local MainTitleStroke = UIStroke35:Clone()
MainTitleStroke.Parent = MainTitle
MainTitleStroke.Color = Color3.fromRGB(4,4,44)
MainTitleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual

local ButtonTemplate = Instance.new("TextButton")
ButtonTemplate.BackgroundTransparency = .4
ButtonTemplate.BackgroundColor3 = Color3.fromRGB(4,4,4)
ButtonTemplate.Size = UDim2.new(0, 321,0, 35)
ButtonTemplate.Font = Enum.Font.SourceSansBold
ButtonTemplate.FontFace.Weight = Enum.FontWeight.ExtraBold
ButtonTemplate.Visible = false
ButtonTemplate.Parent = MainBG
ButtonTemplate.TextSize = 32
ButtonTemplate.TextColor3 = Color3.fromRGB(255,255,255)

local BTempStroke = UIStroke35:Clone()
BTempStroke.Parent = ButtonTemplate

local BTempCorner = UICorner12:Clone()
BTempCorner.Parent = ButtonTemplate

local RS = game:GetService("ReplicatedStorage")

local toCrimBase = ButtonTemplate:Clone()
toCrimBase.LayoutOrder = 2
toCrimBase.Text = "Teleport To Criminal Base"
toCrimBase.Visible = true
toCrimBase.Parent = MainBG

local function toGuardRoom()
	if isSignedIn then
		plr.Character:MoveTo(game.Workspace["Prison_guardspawn"].spawn.Position)
	end
end

local function toCriminalBase()
	if isSignedIn then
		plr.Character:MoveTo(game.Workspace["Criminals Spawn"]:FindFirstChild("SpawnLocation").Position)
	end
end

local function toPrisonBase()
	if isSignedIn then
		plr.Character:MoveTo(game.Workspace.Prison_Cafeteria.floor.Position)
	end
end

local function toCafe()
	if isSignedIn then
		plr.Character:MoveTo(game.Workspace.Prison_Cafeteria.floor.Position)
	end
end

toCrimBase.MouseButton1Click:Connect(function()
	toCriminalBase()

	print("toCrimBase Clicked")
end)

local TPToGurardRoom = ButtonTemplate:Clone()
TPToGurardRoom.LayoutOrder = 3
TPToGurardRoom.Text = "Teleport To Guard Room"
TPToGurardRoom.Visible = true
TPToGurardRoom.Parent = MainBG

TPToGurardRoom.MouseButton1Click:Connect(function()
	toGuardRoom()
	print("TPToGurardRoom Clicked")
end)

local TPInsidePrison = ButtonTemplate:Clone()
TPInsidePrison.LayoutOrder = 4
TPInsidePrison.Text = "Teleport Inside Prison"
TPInsidePrison.Visible = true
TPInsidePrison.Parent = MainBG

TPInsidePrison.MouseButton1Click:Connect(function()
	toCafe()

	print("TPInsidePrison Clicked")
end)

local InfYield = ButtonTemplate:Clone()
InfYield.LayoutOrder = 5
InfYield.Text = "Infinite Yield"
InfYield.Visible = true
InfYield.Parent = MainBG

InfYield.MouseButton1Click:Connect(function()
	print("InfYield Clicked")
	
	loadstring(game:HttpGet("https://raw.githubusercontent.com/edgeiy/infiniteyield/master/source"))()
end)

local Category = Instance.new("TextLabel")
Category.Font = Enum.Font.SourceSansBold
Category.FontFace.Weight = Enum.FontWeight.ExtraBold
Category.Parent = MainBG
Category.TextSize = 48
Category.Text = "Menu Settings"
Category.LayoutOrder = 6
Category.TextColor3 = Color3.fromRGB(255,255,255)
Category.Size = UDim2.new(0, 553,0, 45)
Category.BackgroundTransparency = 1

local CatStroke = UIStrokeTitle:Clone()
CatStroke.Parent = Category

local RGBMenu = ButtonTemplate:Clone()
RGBMenu.Parent = MainBG
RGBMenu.Text = "Change Theme [SOON]"
RGBMenu.Visible = true
RGBMenu.LayoutOrder = 7

RGBMenu.MouseButton1Click:Connect(function()
	
end)

local DeleteScript = ButtonTemplate:Clone()
DeleteScript.Parent = MainBG
DeleteScript.Text = "Delete Script"
DeleteScript.Visible = true
DeleteScript.LayoutOrder = 8

DeleteScript.MouseButton1Click:Connect(function()
	game:GetService("CoreGui"):FindFirstChild("NuvClientUI"):Destroy()
	game:GetService("CoreGui"):FindFirstChild("NuvClient"):Destroy()
end)

local info = Category:Clone()
info.LayoutOrder = 9
info.TextSize = 32
info.Parent = MainBG
info.Size = UDim2.new(0, 553,0, 152)
info.Text = [[
	
INFO:

- Panic Key: Backspace
- L: Hide/Show
	
]]

local UserInputService = game:GetService("UserInputService")

local ExitKey = Enum.KeyCode.L

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == ExitKey and not gameProcessed then
		if not MainFrame.Visible then
			MainFrame.Visible = true
		else
			MainFrame.Visible = false
		end
	end
end)


local PanicKey = Enum.KeyCode.Backspace

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == PanicKey and not gameProcessed then
		game:GetService("CoreGui"):FindFirstChild("NuvClientUI"):Destroy()
		game:GetService("CoreGui"):FindFirstChild("NuvClient"):Destroy()
	end
end)