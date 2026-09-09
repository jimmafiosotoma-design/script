-- =====================================================
-- 🎓 PC DA NAVA 🥶
-- Com aba PRESETS (GTA V, Cinemático, Realista, Competitivo, Noite)
-- Catnap5957 & testscript373
-- =====================================================

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

pcall(function()
	if PlayerGui:FindFirstChild("PCDA_NAVA_HUB") then
		PlayerGui.PCDA_NAVA_HUB:Destroy()
	end
end)

local IsMobile = UserInputService.TouchEnabled

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PCDA_NAVA_HUB"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = PlayerGui

-------------------------------------------------
-- AVISO DE PREÇO
-------------------------------------------------
local PriceLabel = Instance.new("TextLabel")
PriceLabel.Size = UDim2.new(0, 380, 0, 38)
PriceLabel.Position = UDim2.new(0, 10, 1, -46)
PriceLabel.BackgroundTransparency = 1
PriceLabel.Text = "Esse script custa 1 real • se alguém vender mais caro não aceite e avise o dono!"
PriceLabel.TextColor3 = Color3.fromRGB(190, 195, 210)
PriceLabel.TextTransparency = 0.52
PriceLabel.Font = Enum.Font.Gotham
PriceLabel.TextSize = 11
PriceLabel.TextXAlignment = Enum.TextXAlignment.Left
PriceLabel.TextWrapped = true
PriceLabel.Parent = ScreenGui

-------------------------------------------------
-- NOTIFICAÇÃO
-------------------------------------------------
local function Notify(title, text, duration)
	duration = duration or 2.5
	local gui = Instance.new("ScreenGui")
	gui.Name = "NotifyTemp"
	gui.IgnoreGuiInset = true
	gui.Parent = PlayerGui

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 290, 0, 64)
	frame.Position = UDim2.new(1, 30, 0, 85)
	frame.BackgroundColor3 = Color3.fromRGB(14, 16, 26)
	frame.BorderSizePixel = 0
	frame.Parent = gui

	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

	local stroke = Instance.new("UIStroke", frame)
	stroke.Color = Color3.fromRGB(0, 170, 255)
	stroke.Thickness = 1.3
	stroke.Transparency = 0.4

	local t = Instance.new("TextLabel")
	t.Size = UDim2.new(1, -18, 0, 22)
	t.Position = UDim2.new(0, 12, 0, 8)
	t.BackgroundTransparency = 1
	t.Text = title
	t.TextColor3 = Color3.fromRGB(255, 255, 255)
	t.Font = Enum.Font.GothamBold
	t.TextSize = 14
	t.TextXAlignment = Enum.TextXAlignment.Left
	t.Parent = frame

	local d = Instance.new("TextLabel")
	d.Size = UDim2.new(1, -18, 0, 22)
	d.Position = UDim2.new(0, 12, 0, 32)
	d.BackgroundTransparency = 1
	d.Text = text
	d.TextColor3 = Color3.fromRGB(155, 170, 195)
	d.Font = Enum.Font.Gotham
	d.TextSize = 12
	d.TextXAlignment = Enum.TextXAlignment.Left
	d.Parent = frame

	TweenService:Create(frame, TweenInfo.new(0.35), {Position = UDim2.new(1, -310, 0, 85)}):Play()
	task.delay(duration, function()
		pcall(function()
			TweenService:Create(frame, TweenInfo.new(0.25), {Position = UDim2.new(1, 30, 0, 85)}):Play()
			task.wait(0.3)
			gui:Destroy()
		end)
	end)
end

-------------------------------------------------
-- LIMPAR
-------------------------------------------------
local function ClearEffects()
	for _, v in pairs(Lighting:GetChildren()) do
		if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect")
		or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("Atmosphere") then
			v:Destroy()
		end
	end
end

-------------------------------------------------
-- PRESETS
-------------------------------------------------
local function Preset_GTAV()
	ClearEffects()
	Lighting.Technology = Enum.Technology.Future
	Lighting.Brightness = 3.6
	Lighting.Ambient = Color3.fromRGB(55, 60, 75)
	Lighting.OutdoorAmbient = Color3.fromRGB(90, 95, 110)
	Lighting.ClockTime = 15.5
	Lighting.GlobalShadows = true
	Lighting.ShadowSoftness = 0.08
	Lighting.EnvironmentDiffuseScale = 0.5
	Lighting.EnvironmentSpecularScale = 1.2

	local Bloom = Instance.new("BloomEffect")
	Bloom.Intensity = 0.7
	Bloom.Size = 40
	Bloom.Threshold = 0.85
	Bloom.Parent = Lighting

	local CC = Instance.new("ColorCorrectionEffect")
	CC.Brightness = 0.05
	CC.Contrast = 0.35
	CC.Saturation = 0.2
	CC.TintColor = Color3.fromRGB(255, 245, 230)
	CC.Parent = Lighting

	local SunRays = Instance.new("SunRaysEffect")
	SunRays.Intensity = 0.18
	SunRays.Spread = 0.7
	SunRays.Parent = Lighting

	local Atm = Instance.new("Atmosphere")
	Atm.Density = 0.3
	Atm.Offset = 0.15
	Atm.Color = Color3.fromRGB(180, 195, 220)
	Atm.Decay = Color3.fromRGB(90, 100, 130)
	Atm.Glare = 0.2
	Atm.Haze = 1.4
	Atm.Parent = Lighting

	pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level21 end)
	Notify("Preset", "GTA V ativado", 2.5)
end

local function Preset_Cinematico()
	ClearEffects()
	Lighting.Technology = Enum.Technology.Future
	Lighting.Brightness = 3.2
	Lighting.Ambient = Color3.fromRGB(40, 45, 60)
	Lighting.OutdoorAmbient = Color3.fromRGB(65, 70, 90)
	Lighting.ClockTime = 17.2
	Lighting.GlobalShadows = true
	Lighting.ShadowSoftness = 0.05

	local Bloom = Instance.new("BloomEffect")
	Bloom.Intensity = 0.55
	Bloom.Size = 45
	Bloom.Threshold = 0.8
	Bloom.Parent = Lighting

	local CC = Instance.new("ColorCorrectionEffect")
	CC.Brightness = 0.02
	CC.Contrast = 0.4
	CC.Saturation = 0.05
	CC.TintColor = Color3.fromRGB(255, 240, 225)
	CC.Parent = Lighting

	local DoF = Instance.new("DepthOfFieldEffect")
	DoF.FarIntensity = 0.35
	DoF.FocusDistance = 22
	DoF.InFocusRadius = 14
	DoF.NearIntensity = 0.12
	DoF.Parent = Lighting

	local SunRays = Instance.new("SunRaysEffect")
	SunRays.Intensity = 0.1
	SunRays.Spread = 0.5
	SunRays.Parent = Lighting

	local Atm = Instance.new("Atmosphere")
	Atm.Density = 0.35
	Atm.Offset = 0.2
	Atm.Color = Color3.fromRGB(160, 175, 210)
	Atm.Decay = Color3.fromRGB(70, 80, 115)
	Atm.Glare = 0.15
	Atm.Haze = 1.6
	Atm.Parent = Lighting

	pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level21 end)
	Notify("Preset", "Cinemático ativado", 2.5)
end

local function Preset_Realista()
	ClearEffects()
	Lighting.Technology = Enum.Technology.Future
	Lighting.Brightness = 3.4
	Lighting.Ambient = Color3.fromRGB(50, 55, 70)
	Lighting.OutdoorAmbient = Color3.fromRGB(80, 85, 105)
	Lighting.ClockTime = 14.5
	Lighting.GlobalShadows = true
	Lighting.ShadowSoftness = 0.06
	Lighting.EnvironmentDiffuseScale = 0.55
	Lighting.EnvironmentSpecularScale = 1.3

	local Bloom = Instance.new("BloomEffect")
	Bloom.Intensity = 0.45
	Bloom.Size = 30
	Bloom.Threshold = 1.0
	Bloom.Parent = Lighting

	local CC = Instance.new("ColorCorrectionEffect")
	CC.Brightness = 0.03
	CC.Contrast = 0.22
	CC.Saturation = 0.08
	CC.Parent = Lighting

	local SunRays = Instance.new("SunRaysEffect")
	SunRays.Intensity = 0.08
	SunRays.Spread = 0.55
	SunRays.Parent = Lighting

	local Atm = Instance.new("Atmosphere")
	Atm.Density = 0.26
	Atm.Offset = 0.12
	Atm.Color = Color3.fromRGB(185, 200, 225)
	Atm.Decay = Color3.fromRGB(95, 105, 135)
	Atm.Glare = 0.1
	Atm.Haze = 1.1
	Atm.Parent = Lighting

	pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level21 end)
	Notify("Preset", "Realista ativado", 2.5)
end

local function Preset_Competitivo()
	ClearEffects()
	Lighting.Technology = Enum.Technology.ShadowMap
	Lighting.Brightness = 2.8
	Lighting.Ambient = Color3.fromRGB(120, 120, 130)
	Lighting.OutdoorAmbient = Color3.fromRGB(130, 130, 140)
	Lighting.ClockTime = 12
	Lighting.GlobalShadows = true
	Lighting.ShadowSoftness = 0.25

	-- Sem bloom pesado, sem névoa forte = mais FPS e visão limpa
	local CC = Instance.new("ColorCorrectionEffect")
	CC.Contrast = 0.15
	CC.Saturation = 0.05
	CC.Parent = Lighting

	pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level18 end)
	Notify("Preset", "Competitivo ativado (mais FPS)", 2.5)
end

local function Preset_Noite()
	ClearEffects()
	Lighting.Technology = Enum.Technology.Future
	Lighting.Brightness = 1.8
	Lighting.Ambient = Color3.fromRGB(25, 30, 50)
	Lighting.OutdoorAmbient = Color3.fromRGB(35, 40, 65)
	Lighting.ClockTime = 22.5
	Lighting.GlobalShadows = true
	Lighting.ShadowSoftness = 0.1

	local Bloom = Instance.new("BloomEffect")
	Bloom.Intensity = 0.4
	Bloom.Size = 28
	Bloom.Threshold = 1.1
	Bloom.Parent = Lighting

	local CC = Instance.new("ColorCorrectionEffect")
	CC.Brightness = -0.05
	CC.Contrast = 0.25
	CC.Saturation = -0.05
	CC.TintColor = Color3.fromRGB(200, 210, 255)
	CC.Parent = Lighting

	local Atm = Instance.new("Atmosphere")
	Atm.Density = 0.4
	Atm.Offset = 0.25
	Atm.Color = Color3.fromRGB(40, 50, 90)
	Atm.Decay = Color3.fromRGB(20, 25, 50)
	Atm.Glare = 0.05
	Atm.Haze = 1.8
	Atm.Parent = Lighting

	pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level20 end)
	Notify("Preset", "Noite ativada", 2.5)
end

-------------------------------------------------
-- GRÁFICOS NORMAIS
-------------------------------------------------
local function SetBatata()
	ClearEffects()
	Lighting.Technology = Enum.Technology.Compatibility
	Lighting.Brightness = 1.2
	Lighting.Ambient = Color3.fromRGB(145, 145, 145)
	Lighting.OutdoorAmbient = Color3.fromRGB(145, 145, 145)
	Lighting.GlobalShadows = false
	pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
	Notify("Batata", "Gráficos mínimos", 2)
end

local function SetNormal()
	ClearEffects()
	Lighting.Technology = Enum.Technology.ShadowMap
	Lighting.Brightness = 2.2
	Lighting.Ambient = Color3.fromRGB(100, 105, 120)
	Lighting.OutdoorAmbient = Color3.fromRGB(115, 120, 130)
	Lighting.GlobalShadows = true
	Lighting.ShadowSoftness = 0.3
	pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level12 end)
	Notify("Normal", "Gráficos padrão", 2)
end

local function SetMedio()
	ClearEffects()
	Lighting.Technology = Enum.Technology.ShadowMap
	Lighting.Brightness = 2.7
	Lighting.Ambient = Color3.fromRGB(85, 90, 105)
	Lighting.OutdoorAmbient = Color3.fromRGB(100, 105, 120)
	Lighting.GlobalShadows = true
	Lighting.ShadowSoftness = 0.2
	local Bloom = Instance.new("BloomEffect")
	Bloom.Intensity = 0.4
	Bloom.Size = 24
	Bloom.Parent = Lighting
	pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level17 end)
	Notify("Médio", "Bom equilíbrio", 2)
end

local function SetAlto()
	ClearEffects()
	Lighting.Technology = Enum.Technology.ShadowMap
	Lighting.Brightness = 3.1
	Lighting.Ambient = Color3.fromRGB(70, 75, 95)
	Lighting.OutdoorAmbient = Color3.fromRGB(90, 95, 115)
	Lighting.GlobalShadows = true
	Lighting.ShadowSoftness = 0.12
	local Bloom = Instance.new("BloomEffect")
	Bloom.Intensity = 0.55
	Bloom.Size = 32
	Bloom.Parent = Lighting
	local CC = Instance.new("ColorCorrectionEffect")
	CC.Contrast = 0.22
	CC.Saturation = 0.12
	CC.Parent = Lighting
	pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level20 end)
	Notify("Alto", "Gráficos altos", 2)
end

local function SetUltra()
	ClearEffects()
	Lighting.Technology = Enum.Technology.ShadowMap
	Lighting.Brightness = 3.4
	Lighting.Ambient = Color3.fromRGB(55, 60, 80)
	Lighting.OutdoorAmbient = Color3.fromRGB(80, 85, 105)
	Lighting.GlobalShadows = true
	Lighting.ShadowSoftness = 0.08
	local Bloom = Instance.new("BloomEffect")
	Bloom.Intensity = 0.7
	Bloom.Size = 38
	Bloom.Parent = Lighting
	local CC = Instance.new("ColorCorrectionEffect")
	CC.Contrast = 0.3
	CC.Saturation = 0.12
	CC.Parent = Lighting
	local Atm = Instance.new("Atmosphere")
	Atm.Density = 0.34
	Atm.Haze = 1.5
	Atm.Parent = Lighting
	pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level21 end)
	Notify("Ultra", "Gráficos muito altos", 2)
end

local function ApplyDLSS(q)
	ClearEffects()
	Lighting.Technology = Enum.Technology.Future
	Lighting.GlobalShadows = true
	if q == "Performance" then
		Lighting.Brightness = 3.1
		Lighting.Ambient = Color3.fromRGB(65, 70, 88)
		Lighting.OutdoorAmbient = Color3.fromRGB(88, 94, 110)
		Lighting.ShadowSoftness = 0.12
		local Bloom = Instance.new("BloomEffect")
		Bloom.Intensity = 0.4
		Bloom.Size = 24
		Bloom.Parent = Lighting
	elseif q == "Balanced" then
		Lighting.Brightness = 3.35
		Lighting.Ambient = Color3.fromRGB(55, 62, 80)
		Lighting.OutdoorAmbient = Color3.fromRGB(80, 86, 105)
		Lighting.ShadowSoftness = 0.08
		local Bloom = Instance.new("BloomEffect")
		Bloom.Intensity = 0.52
		Bloom.Size = 32
		Bloom.Parent = Lighting
		local CC = Instance.new("ColorCorrectionEffect")
		CC.Contrast = 0.26
		CC.Parent = Lighting
	else
		Lighting.Brightness = 3.55
		Lighting.Ambient = Color3.fromRGB(45, 52, 72)
		Lighting.OutdoorAmbient = Color3.fromRGB(72, 80, 98)
		Lighting.ShadowSoftness = 0.05
		local Bloom = Instance.new("BloomEffect")
		Bloom.Intensity = 0.65
		Bloom.Size = 38
		Bloom.Parent = Lighting
		local CC = Instance.new("ColorCorrectionEffect")
		CC.Contrast = 0.32
		CC.Parent = Lighting
	end
	Notify("DLSS", q .. " ativado", 2)
end

local function ApplyFSR(q)
	ClearEffects()
	Lighting.Technology = Enum.Technology.Future
	Lighting.GlobalShadows = true
	if q == "Performance" then
		Lighting.Brightness = 3.0
		Lighting.Ambient = Color3.fromRGB(70, 75, 92)
		Lighting.OutdoorAmbient = Color3.fromRGB(92, 98, 112)
		Lighting.ShadowSoftness = 0.14
		local Bloom = Instance.new("BloomEffect")
		Bloom.Intensity = 0.35
		Bloom.Size = 22
		Bloom.Parent = Lighting
	elseif q == "Balanced" then
		Lighting.Brightness = 3.25
		Lighting.Ambient = Color3.fromRGB(60, 66, 84)
		Lighting.OutdoorAmbient = Color3.fromRGB(84, 90, 108)
		Lighting.ShadowSoftness = 0.1
		local Bloom = Instance.new("BloomEffect")
		Bloom.Intensity = 0.48
		Bloom.Size = 28
		Bloom.Parent = Lighting
	else
		Lighting.Brightness = 3.5
		Lighting.Ambient = Color3.fromRGB(48, 55, 75)
		Lighting.OutdoorAmbient = Color3.fromRGB(76, 82, 100)
		Lighting.ShadowSoftness = 0.06
		local Bloom = Instance.new("BloomEffect")
		Bloom.Intensity = 0.58
		Bloom.Size = 34
		Bloom.Parent = Lighting
		local CC = Instance.new("ColorCorrectionEffect")
		CC.Contrast = 0.3
		CC.Parent = Lighting
	end
	Notify("FSR", q .. " ativado", 2)
end

local function ClearSky()
	for _, v in pairs(Lighting:GetChildren()) do
		if v:IsA("Sky") then v:Destroy() end
	end
end

local function ApplySkybox(id)
	ClearSky()
	local sky = Instance.new("Sky")
	local asset = "rbxassetid://" .. tostring(id)
	sky.SkyboxBk = asset
	sky.SkyboxDn = asset
	sky.SkyboxFt = asset
	sky.SkyboxLf = asset
	sky.SkyboxRt = asset
	sky.SkyboxUp = asset
	sky.StarCount = 0
	sky.Parent = Lighting
	Notify("Skybox", "Céu aplicado!", 2)
end

-------------------------------------------------
-- BOTÃO Op
-------------------------------------------------
local OpButton = Instance.new("TextButton")
OpButton.Size = UDim2.new(0, IsMobile and 60 or 54, 0, IsMobile and 60 or 54)
OpButton.Position = UDim2.new(0, 14, 0.42, 0)
OpButton.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
OpButton.Text = "Op"
OpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpButton.Font = Enum.Font.GothamBold
OpButton.TextSize = 18
OpButton.AutoButtonColor = false
OpButton.Parent = ScreenGui

Instance.new("UICorner", OpButton).CornerRadius = UDim.new(1, 0)
local opStroke = Instance.new("UIStroke", OpButton)
opStroke.Color = Color3.fromRGB(255, 255, 255)
opStroke.Thickness = 2.2
opStroke.Transparency = 0.3

local dragOp, dragStart, startPos = false, nil, nil
OpButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragOp = true
		dragStart = input.Position
		startPos = OpButton.Position
	end
end)
OpButton.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragOp = false
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if dragOp and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		OpButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

-------------------------------------------------
-- GUI
-------------------------------------------------
local GW = IsMobile and 330 or 420
local GH = IsMobile and 490 or 550

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, GW, 0, GH)
Main.Position = UDim2.new(0.5, -GW/2, 0.5, -GH/2)
Main.BackgroundColor3 = Color3.fromRGB(11, 13, 22)
Main.BorderSizePixel = 0
Main.Visible = false
Main.Parent = ScreenGui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 16)
local mainStroke = Instance.new("UIStroke", Main)
mainStroke.Color = Color3.fromRGB(0, 150, 255)
mainStroke.Thickness = 1.5
mainStroke.Transparency = 0.5

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundColor3 = Color3.fromRGB(16, 18, 30)
TopBar.BorderSizePixel = 0
TopBar.Parent = Main
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 16)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -50, 1, 0)
Title.Position = UDim2.new(0, 14, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🎓  PC DA NAVA  🥶"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0.5, -15)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 45, 60)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.Parent = TopBar
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 8)

local TabBar = Instance.new("ScrollingFrame")
TabBar.Size = UDim2.new(1, -10, 0, 34)
TabBar.Position = UDim2.new(0, 5, 0, 56)
TabBar.BackgroundTransparency = 1
TabBar.ScrollBarThickness = 0
TabBar.ScrollingDirection = Enum.ScrollingDirection.X
TabBar.CanvasSize = UDim2.new(0, 580, 0, 0)
TabBar.Parent = Main

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -10, 1, -100)
Content.Position = UDim2.new(0, 5, 0, 96)
Content.BackgroundTransparency = 1
Content.Parent = Main

local Tabs, CurrentTab, tabPos = {}, nil, 0

local function CreateTab(name, color, w)
	w = w or 70
	local Btn = Instance.new("TextButton")
	Btn.Size = UDim2.new(0, w, 1, 0)
	Btn.Position = UDim2.new(0, tabPos, 0, 0)
	Btn.BackgroundColor3 = Color3.fromRGB(24, 26, 38)
	Btn.Text = name
	Btn.TextColor3 = Color3.fromRGB(150, 160, 180)
	Btn.Font = Enum.Font.GothamBold
	Btn.TextSize = 11
	Btn.Parent = TabBar
	Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)
	tabPos = tabPos + w + 4

	local Page = Instance.new("ScrollingFrame")
	Page.Size = UDim2.new(1, 0, 1, 0)
	Page.BackgroundTransparency = 1
	Page.BorderSizePixel = 0
	Page.ScrollBarThickness = 3
	Page.Visible = false
	Page.AutomaticCanvasSize = Enum.AutomaticSize.Y
	Page.Parent = Content

	local list = Instance.new("UIListLayout")
	list.Padding = UDim.new(0, 8)
	list.Parent = Page

	Tabs[name] = {Btn = Btn, Page = Page, Color = color}

	Btn.MouseButton1Click:Connect(function()
		if CurrentTab and Tabs[CurrentTab] then
			Tabs[CurrentTab].Btn.BackgroundColor3 = Color3.fromRGB(24, 26, 38)
			Tabs[CurrentTab].Btn.TextColor3 = Color3.fromRGB(150, 160, 180)
			Tabs[CurrentTab].Page.Visible = false
		end
		CurrentTab = name
		Btn.BackgroundColor3 = color
		Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
		Page.Visible = true
	end)
	return Page
end

local PresetsPage   = CreateTab("Presets", Color3.fromRGB(255, 140, 40), 72)
local GraphicsPage  = CreateTab("Gráficos", Color3.fromRGB(0, 145, 255), 75)
local SkyboxPage    = CreateTab("Skybox", Color3.fromRGB(0, 175, 125), 68)
local DLSSPage      = CreateTab("DLSS", Color3.fromRGB(0, 165, 220), 58)
local FSRPage       = CreateTab("FSR", Color3.fromRGB(215, 115, 35), 52)
local XtraPage      = CreateTab("Xtra", Color3.fromRGB(145, 65, 255), 52)

TabBar.CanvasSize = UDim2.new(0, tabPos + 10, 0, 0)

local function MakeBtn(parent, text, color, func)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1, -4, 0, 44)
	b.BackgroundColor3 = color
	b.Text = text
	b.TextColor3 = Color3.fromRGB(255, 255, 255)
	b.Font = Enum.Font.GothamBold
	b.TextSize = 13
	b.Parent = parent
	Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
	b.MouseButton1Click:Connect(func)
	return b
end

local function MakeHeader(parent, text, color)
	local h = Instance.new("TextLabel")
	h.Size = UDim2.new(1, -4, 0, 24)
	h.BackgroundTransparency = 1
	h.Text = text
	h.TextColor3 = color
	h.Font = Enum.Font.GothamBold
	h.TextSize = 13
	h.TextXAlignment = Enum.TextXAlignment.Left
	h.Parent = parent
end

local function MakeInfo(parent, text)
	local i = Instance.new("TextLabel")
	i.Size = UDim2.new(1, -4, 0, 0)
	i.AutomaticSize = Enum.AutomaticSize.Y
	i.BackgroundTransparency = 1
	i.Text = text
	i.TextColor3 = Color3.fromRGB(140, 155, 175)
	i.Font = Enum.Font.Gotham
	i.TextSize = 12
	i.TextXAlignment = Enum.TextXAlignment.Left
	i.TextWrapped = true
	i.Parent = parent
end

-- ===== PRESETS =====
MakeHeader(PresetsPage, "⚡  Presets Prontos", Color3.fromRGB(255, 160, 50))
MakeBtn(PresetsPage, "GTA V", Color3.fromRGB(50, 180, 80), Preset_GTAV)
MakeBtn(PresetsPage, "Cinemático", Color3.fromRGB(140, 60, 200), Preset_Cinematico)
MakeBtn(PresetsPage, "Realista", Color3.fromRGB(40, 140, 200), Preset_Realista)
MakeBtn(PresetsPage, "Competitivo", Color3.fromRGB(200, 80, 50), Preset_Competitivo)
MakeBtn(PresetsPage, "Noite", Color3.fromRGB(40, 50, 120), Preset_Noite)
MakeInfo(PresetsPage, "Um clique aplica o visual completo do preset.")

-- ===== GRÁFICOS =====
MakeBtn(GraphicsPage, "Batata", Color3.fromRGB(55, 58, 70), SetBatata)
MakeBtn(GraphicsPage, "Normal", Color3.fromRGB(35, 110, 190), SetNormal)
MakeBtn(GraphicsPage, "Médio", Color3.fromRGB(30, 150, 105), SetMedio)
MakeBtn(GraphicsPage, "Alto", Color3.fromRGB(40, 170, 75), SetAlto)
MakeBtn(GraphicsPage, "Ultra", Color3.fromRGB(200, 105, 30), SetUltra)

-- ===== SKYBOX =====
MakeHeader(SkyboxPage, "☁  Skybox", Color3.fromRGB(0, 200, 140))
local IdBox = Instance.new("TextBox")
IdBox.Size = UDim2.new(1, -4, 0, 40)
IdBox.BackgroundColor3 = Color3.fromRGB(22, 24, 36)
IdBox.PlaceholderText = "ID da Skybox"
IdBox.Text = ""
IdBox.TextColor3 = Color3.fromRGB(255, 255, 255)
IdBox.Font = Enum.Font.Gotham
IdBox.TextSize = 13
IdBox.Parent = SkyboxPage
Instance.new("UICorner", IdBox).CornerRadius = UDim.new(0, 9)

MakeBtn(SkyboxPage, "Aplicar Skybox", Color3.fromRGB(0, 160, 110), function()
	local id = tonumber(IdBox.Text)
	if id then ApplySkybox(id) else Notify("Erro", "ID inválido", 2) end
end)
MakeBtn(SkyboxPage, "Resetar Céu", Color3.fromRGB(180, 50, 55), function()
	ClearSky()
	Notify("Skybox", "Céu resetado", 2)
end)

-- ===== DLSS =====
MakeHeader(DLSSPage, "NVIDIA DLSS", Color3.fromRGB(0, 200, 255))
MakeBtn(DLSSPage, "Performance", Color3.fromRGB(0, 100, 165), function() ApplyDLSS("Performance") end)
MakeBtn(DLSSPage, "Balanced", Color3.fromRGB(0, 130, 195), function() ApplyDLSS("Balanced") end)
MakeBtn(DLSSPage, "Quality", Color3.fromRGB(0, 160, 225), function() ApplyDLSS("Quality") end)

-- ===== FSR =====
MakeHeader(FSRPage, "AMD FSR", Color3.fromRGB(255, 160, 50))
MakeBtn(FSRPage, "Performance", Color3.fromRGB(160, 80, 25), function() ApplyFSR("Performance") end)
MakeBtn(FSRPage, "Balanced", Color3.fromRGB(185, 100, 35), function() ApplyFSR("Balanced") end)
MakeBtn(FSRPage, "Quality", Color3.fromRGB(210, 120, 45), function() ApplyFSR("Quality") end)

-- ===== XTRA =====
MakeHeader(XtraPage, "👨‍💻 Criadores", Color3.fromRGB(175, 115, 255))
MakeInfo(XtraPage, "Catnap5957  &  testscript373")
MakeHeader(XtraPage, "📦 Versão", Color3.fromRGB(0, 195, 255))
MakeInfo(XtraPage, "3.7 com Presets")
MakeHeader(XtraPage, "💰 Preço", Color3.fromRGB(255, 175, 55))
MakeInfo(XtraPage, "Este script custa 1 real.\nSe venderem mais caro, não aceite.")

-------------------------------------------------
-- TOGGLE + ARRASTAR
-------------------------------------------------
local open = false
local function Toggle()
	open = not open
	Main.Visible = open
	if open then
		Main.Size = UDim2.new(0, 0, 0, 0)
		TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
			Size = UDim2.new(0, GW, 0, GH)
		}):Play()
	end
end

OpButton.MouseButton1Click:Connect(Toggle)
CloseBtn.MouseButton1Click:Connect(function()
	open = false
	Main.Visible = false
end)

local dragMain, dragMainStart, mainStartPos = false, nil, nil
TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragMain = true
		dragMainStart = input.Position
		mainStartPos = Main.Position
	end
end)
TopBar.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragMain = false
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if dragMain and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragMainStart
		Main.Position = UDim2.new(mainStartPos.X.Scale, mainStartPos.X.Offset + delta.X, mainStartPos.Y.Scale, mainStartPos.Y.Offset + delta.Y)
	end
end)

-- Aba inicial = Presets
Tabs["Presets"].Btn.BackgroundColor3 = Color3.fromRGB(255, 140, 40)
Tabs["Presets"].Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Tabs["Presets"].Page.Visible = true
CurrentTab = "Presets"

Notify("PC DA NAVA", "Presets carregados!", 3)
print("✅ PC DA NAVA 3.7 | Presets | Catnap5957 & testscript373")
