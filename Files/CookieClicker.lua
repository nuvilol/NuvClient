-- NuvClient [COOKIE CLICKER]

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
Title.Text = "NuvClient [COOKIE CLICKER]"
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

local MainFrame = Instance.new("Frame")
MainFrame.Parent = SGUI
MainFrame.AnchorPoint = Vector2.new(0.5,0.5)
MainFrame.Position = UDim2.new(0.5,0,0.5,0)
MainFrame.BackgroundColor3 = Color3.fromRGB(4,4,4)
MainFrame.BackgroundTransparency = .4

local UIScale = Instance.new("UIScale")
UIScale.Scale = 1
UIScale.Parent = MainFrame

local Background = Instance.new("Frame")

EnterButton.MouseButton1Click:Connect(function()
	if game.Workspace:FindFirstChild(LoginText.Text) then
		task.wait(1.5)
		MainFrame:TweenPosition(UDim2.new(.5,0,.5,0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, .25)
	end
end)

local UISCale2 = UIScale:Clone()
UISCale2.Parent = MainFrame

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
MainBG.Size = UDim2.new(0, 400,0, 257)

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
MainTitle.Text = "NuvClient [COOKIE CLICKER]"
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
ButtonTemplate.Size = UDim2.new(0, 299,0, 35)
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