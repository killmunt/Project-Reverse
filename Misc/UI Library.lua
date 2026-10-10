-- discord.gg/syncrypt

if type(setclipboard) == "function" then
	pcall(setclipboard, "discord.gg/project-reverse")
end

local cloneref_ = typeof(cloneref) == "function" and cloneref or function(p1)
	return p1
end
local gethui_ = typeof(gethui) == "function" and gethui or nil
local protectgui_ = typeof(protectgui) == "function" and protectgui or typeof(syn) == "table" and typeof(syn.protect_gui) == "function" and syn.protect_gui or function()
end
local v4 = cloneref_(game:GetService("Players"))
local v5 = cloneref_(game:GetService("UserInputService"))
local v6 = cloneref_(game:GetService("TweenService"))
local v7 = cloneref_(game:GetService("RunService"))
local v8 = cloneref_(game:GetService("HttpService"))
local v9 = cloneref_(game:GetService("CoreGui"))
local v10 = cloneref_(game:GetService("TextService"))
local v11 = cloneref_(game:GetService("GuiService"))
local LocalPlayer = v4.LocalPlayer
local TouchEnabled = v5.TouchEnabled
local MouseEnabled = v5.MouseEnabled
local isMobile = TouchEnabled and not MouseEnabled
local v16 = TouchEnabled and MouseEnabled
local themes = {
	Dark = {
		WindowBackground = Color3.fromRGB(15, 16, 20),
		HeaderBackground = Color3.fromRGB(20, 21, 26),
		ContentBackground = Color3.fromRGB(24, 25, 31),
		SurfaceRaised = Color3.fromRGB(28, 30, 37),
		CardBackground = Color3.fromRGB(34, 36, 45),
		CardBackgroundHover = Color3.fromRGB(48, 51, 62),
		CardBackgroundActive = Color3.fromRGB(64, 68, 82),
		FooterBackground = Color3.fromRGB(20, 21, 26),
		Border = Color3.fromRGB(45, 47, 56),
		BorderStrong = Color3.fromRGB(60, 62, 74),
		Divider = Color3.fromRGB(35, 37, 44),
		TextPrimary = Color3.fromRGB(248, 248, 252),
		TextSecondary = Color3.fromRGB(168, 170, 184),
		TextDisabled = Color3.fromRGB(95, 97, 110),
		TextPlaceholder = Color3.fromRGB(115, 117, 130),
		AccentGradientFrom = Color3.fromRGB(232, 71, 176),
		AccentGradientTo = Color3.fromRGB(155, 55, 170),
		AccentSolid = Color3.fromRGB(215, 70, 190),
		AccentMuted = Color3.fromRGB(140, 50, 130),
		Primary = Color3.fromRGB(64, 130, 255),
		PrimaryHover = Color3.fromRGB(96, 156, 255),
		PrimaryPressed = Color3.fromRGB(48, 108, 224),
		PrimaryText = Color3.fromRGB(255, 255, 255),
		Success = Color3.fromRGB(72, 187, 120),
		Warning = Color3.fromRGB(237, 175, 79),
		Danger = Color3.fromRGB(239, 83, 80),
		Info = Color3.fromRGB(64, 156, 255),
		ScrollbarBg = Color3.fromRGB(28, 29, 36),
		ScrollbarThumb = Color3.fromRGB(80, 82, 96),
		ScrollbarThumbHover = Color3.fromRGB(110, 112, 130),
		ShadowColor = Color3.fromRGB(0, 0, 0),
		ShadowOpacity = 0.42,
		OverlayDim = Color3.fromRGB(0, 0, 0),
		OverlayDimAlpha = 0.55
	},
	Light = {
		WindowBackground = Color3.fromRGB(245, 247, 251),
		HeaderBackground = Color3.fromRGB(252, 253, 255),
		ContentBackground = Color3.fromRGB(248, 250, 253),
		SurfaceRaised = Color3.fromRGB(238, 241, 247),
		CardBackground = Color3.fromRGB(220, 224, 235),
		CardBackgroundHover = Color3.fromRGB(200, 206, 222),
		CardBackgroundActive = Color3.fromRGB(178, 186, 205),
		FooterBackground = Color3.fromRGB(252, 253, 255),
		Border = Color3.fromRGB(218, 222, 232),
		BorderStrong = Color3.fromRGB(195, 200, 215),
		Divider = Color3.fromRGB(228, 232, 240),
		TextPrimary = Color3.fromRGB(20, 22, 32),
		TextSecondary = Color3.fromRGB(85, 90, 105),
		TextDisabled = Color3.fromRGB(160, 165, 175),
		TextPlaceholder = Color3.fromRGB(170, 175, 188),
		AccentGradientFrom = Color3.fromRGB(190, 70, 200),
		AccentGradientTo = Color3.fromRGB(232, 71, 176),
		AccentSolid = Color3.fromRGB(215, 70, 190),
		AccentMuted = Color3.fromRGB(180, 90, 170),
		Primary = Color3.fromRGB(99, 102, 241),
		PrimaryHover = Color3.fromRGB(118, 121, 255),
		PrimaryPressed = Color3.fromRGB(82, 85, 220),
		PrimaryText = Color3.fromRGB(255, 255, 255),
		Success = Color3.fromRGB(56, 161, 105),
		Warning = Color3.fromRGB(214, 158, 58),
		Danger = Color3.fromRGB(220, 70, 68),
		Info = Color3.fromRGB(48, 130, 230),
		ScrollbarBg = Color3.fromRGB(228, 231, 240),
		ScrollbarThumb = Color3.fromRGB(170, 175, 190),
		ScrollbarThumbHover = Color3.fromRGB(140, 145, 160),
		ShadowColor = Color3.fromRGB(50, 60, 90),
		ShadowOpacity = 0.16,
		OverlayDim = Color3.fromRGB(20, 25, 40),
		OverlayDimAlpha = 0.4
	},
	Midnight = {
		WindowBackground = Color3.fromRGB(8, 9, 14),
		HeaderBackground = Color3.fromRGB(12, 14, 20),
		ContentBackground = Color3.fromRGB(14, 16, 23),
		SurfaceRaised = Color3.fromRGB(18, 20, 28),
		CardBackground = Color3.fromRGB(26, 28, 38),
		CardBackgroundHover = Color3.fromRGB(42, 46, 60),
		CardBackgroundActive = Color3.fromRGB(60, 65, 84),
		FooterBackground = Color3.fromRGB(12, 14, 20),
		Border = Color3.fromRGB(34, 37, 50),
		BorderStrong = Color3.fromRGB(50, 54, 70),
		Divider = Color3.fromRGB(26, 29, 39),
		TextPrimary = Color3.fromRGB(240, 242, 250),
		TextSecondary = Color3.fromRGB(150, 155, 175),
		TextDisabled = Color3.fromRGB(80, 84, 98),
		TextPlaceholder = Color3.fromRGB(95, 100, 115),
		AccentGradientFrom = Color3.fromRGB(120, 80, 240),
		AccentGradientTo = Color3.fromRGB(80, 120, 255),
		AccentSolid = Color3.fromRGB(110, 110, 250),
		AccentMuted = Color3.fromRGB(80, 80, 200),
		Primary = Color3.fromRGB(99, 102, 241),
		PrimaryHover = Color3.fromRGB(118, 121, 255),
		PrimaryPressed = Color3.fromRGB(82, 85, 220),
		PrimaryText = Color3.fromRGB(255, 255, 255),
		Success = Color3.fromRGB(72, 187, 120),
		Warning = Color3.fromRGB(237, 175, 79),
		Danger = Color3.fromRGB(239, 83, 80),
		Info = Color3.fromRGB(64, 156, 255),
		ScrollbarBg = Color3.fromRGB(20, 22, 30),
		ScrollbarThumb = Color3.fromRGB(60, 64, 82),
		ScrollbarThumbHover = Color3.fromRGB(95, 100, 118),
		ShadowColor = Color3.fromRGB(0, 0, 0),
		ShadowOpacity = 0.45,
		OverlayDim = Color3.fromRGB(0, 0, 0),
		OverlayDimAlpha = 0.65
	},
	Catppuccin = {
		WindowBackground = Color3.fromRGB(30, 30, 46),
		HeaderBackground = Color3.fromRGB(24, 24, 37),
		ContentBackground = Color3.fromRGB(30, 30, 46),
		SurfaceRaised = Color3.fromRGB(40, 41, 58),
		CardBackground = Color3.fromRGB(53, 54, 73),
		CardBackgroundHover = Color3.fromRGB(78, 80, 102),
		CardBackgroundActive = Color3.fromRGB(102, 105, 128),
		FooterBackground = Color3.fromRGB(24, 24, 37),
		Border = Color3.fromRGB(69, 71, 90),
		BorderStrong = Color3.fromRGB(108, 112, 134),
		Divider = Color3.fromRGB(49, 50, 68),
		TextPrimary = Color3.fromRGB(205, 214, 244),
		TextSecondary = Color3.fromRGB(166, 173, 200),
		TextDisabled = Color3.fromRGB(108, 112, 134),
		TextPlaceholder = Color3.fromRGB(127, 132, 156),
		AccentGradientFrom = Color3.fromRGB(203, 166, 247),
		AccentGradientTo = Color3.fromRGB(245, 194, 231),
		AccentSolid = Color3.fromRGB(203, 166, 247),
		AccentMuted = Color3.fromRGB(180, 140, 220),
		Primary = Color3.fromRGB(137, 180, 250),
		PrimaryHover = Color3.fromRGB(160, 200, 255),
		PrimaryPressed = Color3.fromRGB(115, 160, 230),
		PrimaryText = Color3.fromRGB(30, 30, 46),
		Success = Color3.fromRGB(166, 227, 161),
		Warning = Color3.fromRGB(249, 226, 175),
		Danger = Color3.fromRGB(243, 139, 168),
		Info = Color3.fromRGB(137, 220, 235),
		ScrollbarBg = Color3.fromRGB(30, 30, 46),
		ScrollbarThumb = Color3.fromRGB(108, 112, 134),
		ScrollbarThumbHover = Color3.fromRGB(147, 153, 178),
		ShadowColor = Color3.fromRGB(0, 0, 0),
		ShadowOpacity = 0.38,
		OverlayDim = Color3.fromRGB(0, 0, 0),
		OverlayDimAlpha = 0.55
	},
	AMOLED = {
		WindowBackground = Color3.fromRGB(0, 0, 0),
		HeaderBackground = Color3.fromRGB(0, 0, 0),
		ContentBackground = Color3.fromRGB(0, 0, 0),
		SurfaceRaised = Color3.fromRGB(8, 8, 11),
		CardBackground = Color3.fromRGB(18, 18, 22),
		CardBackgroundHover = Color3.fromRGB(34, 34, 42),
		CardBackgroundActive = Color3.fromRGB(56, 56, 68),
		FooterBackground = Color3.fromRGB(0, 0, 0),
		Border = Color3.fromRGB(30, 30, 38),
		BorderStrong = Color3.fromRGB(55, 55, 68),
		Divider = Color3.fromRGB(20, 20, 26),
		TextPrimary = Color3.fromRGB(245, 245, 250),
		TextSecondary = Color3.fromRGB(160, 162, 175),
		TextDisabled = Color3.fromRGB(85, 87, 100),
		TextPlaceholder = Color3.fromRGB(105, 107, 120),
		AccentGradientFrom = Color3.fromRGB(190, 70, 200),
		AccentGradientTo = Color3.fromRGB(232, 71, 176),
		AccentSolid = Color3.fromRGB(215, 70, 190),
		AccentMuted = Color3.fromRGB(140, 50, 130),
		Primary = Color3.fromRGB(99, 102, 241),
		PrimaryHover = Color3.fromRGB(118, 121, 255),
		PrimaryPressed = Color3.fromRGB(82, 85, 220),
		PrimaryText = Color3.fromRGB(255, 255, 255),
		Success = Color3.fromRGB(72, 187, 120),
		Warning = Color3.fromRGB(237, 175, 79),
		Danger = Color3.fromRGB(239, 83, 80),
		Info = Color3.fromRGB(64, 156, 255),
		ScrollbarBg = Color3.fromRGB(15, 15, 18),
		ScrollbarThumb = Color3.fromRGB(70, 72, 85),
		ScrollbarThumbHover = Color3.fromRGB(95, 97, 115),
		ShadowColor = Color3.fromRGB(0, 0, 0),
		ShadowOpacity = 0.55,
		OverlayDim = Color3.fromRGB(0, 0, 0),
		OverlayDimAlpha = 0.75
	}
}
local densities = {
	compact = {
		HeaderHeight = 38,
		TabBarHeight = 32,
		FooterHeight = 50,
		ButtonHeight = 32,
		InputHeight = 32,
		ToggleHeight = 28,
		BodyFont = 14,
		CaptionFont = 12,
		TitleFont = 16,
		ButtonFont = 14,
		WindowPadding = 12,
		ElementSpacing = 6,
		SectionSpacing = 10,
		GridItemSize = Vector2.new(105, 124),
		GridItemPadding = 6,
		ScrollbarThickness = 6
	},
	normal = {
		HeaderHeight = 46,
		TabBarHeight = 38,
		FooterHeight = 58,
		ButtonHeight = 38,
		InputHeight = 38,
		ToggleHeight = 32,
		BodyFont = 15,
		CaptionFont = 13,
		TitleFont = 18,
		ButtonFont = 15,
		WindowPadding = 16,
		ElementSpacing = 9,
		SectionSpacing = 14,
		GridItemSize = Vector2.new(120, 142),
		GridItemPadding = 8,
		ScrollbarThickness = 8
	},
	comfortable = {
		HeaderHeight = 58,
		TabBarHeight = 48,
		FooterHeight = 70,
		ButtonHeight = 48,
		InputHeight = 48,
		ToggleHeight = 40,
		BodyFont = 17,
		CaptionFont = 14,
		TitleFont = 22,
		ButtonFont = 16,
		WindowPadding = 24,
		ElementSpacing = 13,
		SectionSpacing = 20,
		GridItemSize = Vector2.new(146, 174),
		GridItemPadding = 12,
		ScrollbarThickness = 12
	}
}
local sizing = {
	HeaderHeight = 46,
	TabBarHeight = 38,
	FooterHeight = 58,
	ButtonHeight = 38,
	InputHeight = 38,
	ToggleHeight = 32,
	SliderHeight = 38,
	BodyFont = 15,
	CaptionFont = 13,
	TitleFont = 18,
	ButtonFont = 15,
	SectionFont = 13,
	WindowPadding = 16,
	ElementSpacing = 9,
	SectionSpacing = 14,
	GridItemSize = Vector2.new(120, 142),
	GridItemPadding = 8,
	GridItemImageRatio = 0.74,
	ScrollbarThickness = 8,
	CornerRadius = UDim.new(0, 10),
	CornerRadiusSmall = UDim.new(0, 6),
	CornerRadiusLarge = UDim.new(0, 14),
	DefaultWindowSize = Vector2.new(720, 540),
	MinWindowSize = Vector2.new(420, 320),
	MaxWindowSize = Vector2.new(1500, 1000),
	DragThreshold = 12,
	ResizeHandleSize = 26,
	LongPressDelay = 0.55,
	SwipeThreshold = 80
}

local function v20()
	return workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(390, 800)
end
local function v21()
	if not isMobile then
		return 1
	end

	local v22 = v20()
	local v23 = math.min(math.min(v22.X, v22.Y) / 820, math.max(v22.X, v22.Y) / 1450)

	return math.max(0.32, math.min(0.46, math.max(0.78, math.min(0.96, v23)) * 0.43478260869565222))
end
local function v24(p2, p3)
	if type(p2) == "number" then
		return math.max(1, math.floor(p2 * p3 + 0.5))
	end

	if typeof(p2) == "Vector2" then
		return Vector2.new(math.max(1, math.floor(p2.X * p3 + 0.5)), math.max(1, math.floor(p2.Y * p3 + 0.5)))
	end

	return p2
end

local s1 = "normal"

local function v26(p4)
	local normal = densities[p4] or densities.normal

	s1 = densities[p4] and p4 or "normal"

	local v28 = v21()

	sizing.MobileScale = v28

	for k, v in pairs(normal) do
		sizing[k] = v24(v, v28)
	end

	sizing.SliderHeight = sizing.ButtonHeight
	sizing.SectionFont = sizing.CaptionFont

	if isMobile then
		sizing.HeaderHeight = math.max(sizing.HeaderHeight, 20)
		sizing.FooterHeight = math.max(sizing.FooterHeight, 28)
		sizing.ButtonHeight = math.max(sizing.ButtonHeight, 14)
		sizing.InputHeight = math.max(sizing.InputHeight, 14)
		sizing.SliderHeight = sizing.ButtonHeight
		sizing.ToggleHeight = math.max(sizing.ToggleHeight, 12)
		sizing.BodyFont = math.max(sizing.BodyFont, 7)
		sizing.CaptionFont = math.max(sizing.CaptionFont, 6)
		sizing.TitleFont = math.max(sizing.TitleFont, 8)
		sizing.ButtonFont = math.max(sizing.ButtonFont, 7)
		sizing.WindowPadding = math.max(sizing.WindowPadding, 5)
		sizing.ElementSpacing = math.max(sizing.ElementSpacing, 3)
		sizing.SectionSpacing = math.max(sizing.SectionSpacing, 4)
		sizing.ScrollbarThickness = math.max(sizing.ScrollbarThickness, 2)
		sizing.GridItemSize = Vector2.new(math.max(sizing.GridItemSize.X, 40), math.max(sizing.GridItemSize.Y, 48))
		sizing.GridItemImageRatio = math.min(sizing.GridItemImageRatio, 0.62)
		sizing.GridItemPadding = math.max(sizing.GridItemPadding, 2)
	end
end
local function v31()
	if not isMobile then
		return
	end

	local MobileScale = sizing.MobileScale or v21()

	sizing.DefaultWindowSize = Vector2.new(math.floor(720 * MobileScale), math.floor(540 * MobileScale))
	sizing.MinWindowSize = Vector2.new(160, 120)
	sizing.ResizeHandleSize = math.max(12, math.floor(32 * MobileScale + 0.5))
	sizing.ScrollbarThickness = math.max(2, sizing.ScrollbarThickness)
	sizing.CornerRadius = UDim.new(0, math.max(3, math.floor(10 * MobileScale + 0.5)))
	sizing.CornerRadiusSmall = UDim.new(0, math.max(2, math.floor(6 * MobileScale + 0.5)))
	sizing.CornerRadiusLarge = UDim.new(0, math.max(4, math.floor(14 * MobileScale + 0.5)))
end
local function v33(p5, p6)
	if isMobile then
		return math.max(p6 or 1, math.floor(p5 * (sizing.MobileScale or v21()) + 0.5))
	end

	return p5
end

if isMobile then
	v26("normal")
	v31()
else
	v26("normal")
end

local u34 = false
local ok2, result = pcall(function()
	return v5:GetLastInputType()
end)

if ok2 and result == Enum.UserInputType.Touch then
	u34 = true
end

v5.LastInputTypeChanged:Connect(function(p7)
	u34 = p7 == Enum.UserInputType.Touch
end)

local function v37(p8, p9, p10, ...)
	return TweenInfo.new(p8, p9 or Enum.EasingStyle.Quart, p10 or Enum.EasingDirection.Out, ...)
end

local t1 = {
	Default = v37(0.18),
	Fast = v37(0.1),
	Slow = v37(0.32),
	Smooth = v37(0.4, Enum.EasingStyle.Quint),
	Open = v37(0.36, Enum.EasingStyle.Quint),
	Spring = v37(0.36, Enum.EasingStyle.Back),
	SoftSpring = v37(0.22, Enum.EasingStyle.Back),
	MicroSpring = v37(0.18, Enum.EasingStyle.Back),
	Bounce = v37(0.5, Enum.EasingStyle.Elastic),
	TabIndicator = v37(0.32, Enum.EasingStyle.Quint),
	Notif = v37(0.4, Enum.EasingStyle.Back),
	Ripple = v37(0.45, Enum.EasingStyle.Quart),
	Stagger = v37(0.32, Enum.EasingStyle.Back),
	FocusRing = v37(0.22),
	Chevron = v37(0.18, Enum.EasingStyle.Quart),
	Glow = v37(0.5, Enum.EasingStyle.Sine)
}

local function v39()
	return v8:GenerateGUID(false):gsub("-", ""):sub(1, 12)
end
local function v40(p11, p12, p13)
	local instance = Instance.new(p11)

	if p12 then
		for k, v in pairs(p12) do
			if k ~= "Parent" then
				instance[k] = v
			end
		end

		if p12.Parent then
			instance.Parent = p12.Parent
		end
	end

	if not p12 or not p12.Name then
		instance.Name = v39()
	end

	if p13 then
		for _, v in ipairs(p13) do
			v.Parent = instance
		end
	end

	return instance
end
local function v46(p14, p15, p16)
	local tween = v6:Create(p14, p15 or t1.Default, p16)

	tween:Play()

	return tween
end
local function v48(p17, ...)
	if typeof(p17) ~= "function" then
		return
	end

	local v49 = table.pack(...)

	task.spawn(function()
		local ok, result2 = pcall(function()
			p17(table.unpack(v49, 1, v49.n))
		end)

		if not ok then
			warn("[UI] callback error:", result2)
		end
	end)
end
local function v52(p18, p19)
	local v53 = p19 or 1

	return math.floor(p18 / v53 + 0.5) * v53
end
local function v54(p20, p21, p22)
	return math.max(p21, math.min(p22, p20))
end

local u55

local function v56()
	if u55 then
		return u55
	end

	local LocalPlayer2 = v4 and v4.LocalPlayer

	if not LocalPlayer2 then
		return nil
	end

	local ok, result2 = pcall(function()
		return LocalPlayer2:GetMouse()
	end)

	if ok then
		u55 = result2
	end

	return u55
end
local function v60(p23, p24)
	local icon = p24 or "rbxasset://textures/Cursors/PointingHand.png"
	local u62 = false

	local function v63()
		u62 = true

		local v64 = v56()

		if v64 then
			v64.Icon = icon
		end
	end

	p23.MouseEnter:Connect(v63)
	p23.MouseLeave:Connect(function()
		u62 = false

		local v65 = v56()

		if v65 then
			v65.Icon = ""
		end
	end)
	p23.AncestryChanged:Connect(function(child, parent)
		if not parent then
			if u62 then
				local v66 = v56()

				if v66 then
					v66.Icon = ""
				end

				return
			end
		end
	end)
end
local function v67(p25)
	v60(p25, "rbxasset://textures/Cursors/PointingHand.png")
end
local function v68(p26, p27, p28)
	return p26 + (p27 - p26) * p28
end
local function v69(p29, p30, p31)
	return Color3.new(v68(p29.R, p30.R, p31), v68(p29.G, p30.G, p31), v68(p29.B, p30.B, p31))
end
local function v70(p32)
	if type(p32) ~= "table" then
		return p32
	end

	local t2 = {}

	for k, v in pairs(p32) do
		t2[k] = v70(v)
	end

	return t2
end
local function v74(p33, p34)
	local v75 = v70(p33)

	for k, v in pairs(p34) do
		v75[k] = v
	end

	return v75
end
local function v78(p35)
	return 0.299 * p35.R + 0.587 * p35.G + 0.114 * p35.B > 0.55 and Color3.fromRGB(20, 20, 28) or Color3.fromRGB(248, 248, 252)
end
local function v79(p36, p37)
	local v80 = p37 or {}
	local Spread = v80.Spread or 32
	local Opacity = v80.Opacity or 0.55
	local Color = v80.Color or Color3.new(0, 0, 0)
	local YOffset = v80.YOffset or 12

	if p36.AutomaticSize ~= nil and p36.AutomaticSize ~= Enum.AutomaticSize.None then
		warn("[MM2 UI] CreateShadow called on AutomaticSize parent (" .. p36:GetFullName() .. ") — ignored. Use UIStroke for depth.")

		return nil
	end

	local v85 = v40
	local s2 = "ImageLabel"
	local v87 = v85(s2, {
		Parent = p36,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, YOffset),
		Size = UDim2.new(1, Spread * 2, 1, Spread * 2),
		BackgroundTransparency = 1,
		Image = "rbxassetid://6014261993",
		ImageColor3 = Color,
		ImageTransparency = 1 - Opacity,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(49, 49, 450, 450),
		ZIndex = (p36.ZIndex or 1) - 10
	})

	v87:SetAttribute("MM2_Shadow", true)

	return v87
end
local function v88(p38, p39, p40)
	local Frame = v40("Frame", {
		Parent = p38,
		BackgroundColor3 = p39,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5)
	})

	v40("UICorner", {
		Parent = Frame,
		CornerRadius = UDim.new(1, 0)
	})

	for k, v in pairs(p40) do
		Frame[k] = v
	end

	return Frame
end
local function v92(p41, p42, p43, p44, p45, p46)
	local Frame = v40("Frame", {
		Parent = p41,
		AnchorPoint = p43 or Vector2.new(0.5, 0.5),
		Position = p44,
		Size = p45,
		BackgroundTransparency = 1
	})

	v40("UICorner", {
		Parent = Frame,
		CornerRadius = UDim.new(1, 0)
	})
	v40("UIStroke", {
		Parent = Frame,
		Color = p42,
		Thickness = p46
	})

	return Frame
end

local Icons

local function v95(p47, p48, p49, p50)
	local color3 = p50 or Color3.fromRGB(220, 222, 235)
	local v97 = Icons and Icons[p48]

	if v97 then
		local Frame = v40("Frame", {
			Parent = p47,
			Size = UDim2.fromOffset(p49, p49),
			BackgroundTransparency = 1
		})

		v40("ImageLabel", {
			Parent = Frame,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Image = v97,
			ImageColor3 = color3,
			ScaleType = Enum.ScaleType.Fit
		})

		return Frame
	end

	local Frame = v40("Frame", {
		Parent = p47,
		Size = UDim2.fromOffset(p49, p49),
		BackgroundTransparency = 1
	})
	local v100 = isMobile and math.max(1, p49 * 0.1) or math.max(1.5, p49 * 0.1)

	if p48 == "close" then
		v88(Frame, color3, {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0.55, 0.5),
			Size = UDim2.new(0.3, 0, 0, v100),
			Rotation = 45
		})
		v88(Frame, color3, {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.fromScale(0.45, 0.5),
			Size = UDim2.new(0.3, 0, 0, v100),
			Rotation = 45
		})
		v88(Frame, color3, {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0.55, 0.5),
			Size = UDim2.new(0.3, 0, 0, v100),
			Rotation = -45
		})
		v88(Frame, color3, {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.fromScale(0.45, 0.5),
			Size = UDim2.new(0.3, 0, 0, v100),
			Rotation = -45
		})
	elseif p48 == "minimize" then
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.5, 0.62),
			Size = UDim2.new(0.55, 0, 0, v100)
		})
	elseif p48 == "maximize" then
		local Frame2 = v40("Frame", {
			Parent = Frame,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(0.6, 0, 0.6, 0),
			BackgroundTransparency = 1
		})

		v40("UICorner", {
			Parent = Frame2,
			CornerRadius = UDim.new(0, 2)
		})
		v40("UIStroke", {
			Parent = Frame2,
			Color = color3,
			Thickness = v100
		})
	elseif p48 == "chevron-down" then
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.34, 0.45),
			Size = UDim2.new(0.38, 0, 0, v100),
			Rotation = 45
		})
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.66, 0.45),
			Size = UDim2.new(0.38, 0, 0, v100),
			Rotation = -45
		})
	elseif p48 == "chevron-up" then
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.34, 0.55),
			Size = UDim2.new(0.38, 0, 0, v100),
			Rotation = -45
		})
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.66, 0.55),
			Size = UDim2.new(0.38, 0, 0, v100),
			Rotation = 45
		})
	elseif p48 == "chevron-right" then
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.45, 0.34),
			Size = UDim2.new(0, v100, 0.38, 0),
			Rotation = -45
		})
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.45, 0.66),
			Size = UDim2.new(0, v100, 0.38, 0),
			Rotation = 45
		})
	elseif p48 == "chevron-left" then
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.55, 0.34),
			Size = UDim2.new(0, v100, 0.38, 0),
			Rotation = 45
		})
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.55, 0.66),
			Size = UDim2.new(0, v100, 0.38, 0),
			Rotation = -45
		})
	elseif p48 == "search" then
		v92(Frame, color3, nil, UDim2.fromScale(0.42, 0.42), UDim2.new(0.55, 0, 0.55, 0), v100)
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.78, 0.78),
			Size = UDim2.new(0.32, 0, 0, v100),
			Rotation = 45
		})
	elseif p48 == "check" then
		v88(Frame, color3, {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.fromScale(0.42, 0.68),
			Size = UDim2.new(0.28, 0, 0, v100),
			Rotation = 45
		})
		v88(Frame, color3, {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0.42, 0.68),
			Size = UDim2.new(0.5, 0, 0, v100),
			Rotation = -45
		})
	elseif p48 == "plus" then
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(0.65, 0, 0, v100)
		})
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(0.65, 0, 0, v100),
			Rotation = 90
		})
	elseif p48 == "minus" then
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(0.65, 0, 0, v100)
		})
	elseif p48 == "trash" then
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.5, 0.25),
			Size = UDim2.new(0.7, 0, 0, v100)
		})
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.5, 0.18),
			Size = UDim2.new(0.32, 0, 0, v100)
		})

		local Frame2 = v40("Frame", {
			Parent = Frame,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0.32),
			Size = UDim2.new(0.5, 0, 0.55, 0),
			BackgroundTransparency = 1
		})

		v40("UICorner", {
			Parent = Frame2,
			CornerRadius = UDim.new(0, 2)
		})
		v40("UIStroke", {
			Parent = Frame2,
			Color = color3,
			Thickness = v100
		})
	elseif p48 == "save" then
		local Frame2 = v40("Frame", {
			Parent = Frame,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(0.7, 0, 0.7, 0),
			BackgroundTransparency = 1
		})

		v40("UICorner", {
			Parent = Frame2,
			CornerRadius = UDim.new(0, 2)
		})
		v40("UIStroke", {
			Parent = Frame2,
			Color = color3,
			Thickness = v100
		})
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(0, v100, 0.4, 0)
		})
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.42, 0.62),
			Size = UDim2.new(0.18, 0, 0, v100),
			Rotation = -45
		})
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.58, 0.62),
			Size = UDim2.new(0.18, 0, 0, v100),
			Rotation = 45
		})
	elseif p48 == "refresh" then
		v92(Frame, color3, nil, UDim2.fromScale(0.5, 0.5), UDim2.new(0.62, 0, 0.62, 0), v100)
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.78, 0.3),
			Size = UDim2.new(0.2, 0, 0, v100),
			Rotation = 45
		})
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.86, 0.18),
			Size = UDim2.new(0, v100, 0.2, 0)
		})
	elseif p48 == "copy" then
		local Frame2 = v40("Frame", {
			Parent = Frame,
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.fromScale(0.16, 0.16),
			Size = UDim2.new(0.55, 0, 0.55, 0),
			BackgroundTransparency = 1
		})

		v40("UICorner", {
			Parent = Frame2,
			CornerRadius = UDim.new(0, 2)
		})
		v40("UIStroke", {
			Parent = Frame2,
			Color = color3,
			Thickness = v100
		})

		local Frame3 = v40("Frame", {
			Parent = Frame,
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.fromScale(0.32, 0.32),
			Size = UDim2.new(0.55, 0, 0.55, 0),
			BackgroundTransparency = 1
		})

		v40("UICorner", {
			Parent = Frame3,
			CornerRadius = UDim.new(0, 2)
		})
		v40("UIStroke", {
			Parent = Frame3,
			Color = color3,
			Thickness = v100
		})
	elseif p48 == "eye" then
		v92(Frame, color3, nil, UDim2.fromScale(0.5, 0.5), UDim2.new(0.85, 0, 0.55, 0), v100)
		v92(Frame, color3, nil, UDim2.fromScale(0.5, 0.5), UDim2.new(0.25, 0, 0.4, 0), v100)
	elseif p48 == "settings" then
		local v106 = math.max(1, math.floor(v100 * 0.7))

		local function v107(p51, p52)
			v88(Frame, color3, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, p51),
				Size = UDim2.new(0.85, 0, 0, v106)
			})

			local v108 = v40
			local s3 = "Frame"
			local t3 = {
				Parent = Frame,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(p52, p51)
			}
			local n1 = 0
			local v112 = math.max(isMobile and 2 or 4, math.floor(v100 * 2.4))
			local n2 = 0
			local v114 = isMobile and 2

			t3.Size = UDim2.new(n1, v112, n2, math.max(v114 or 4, math.floor(v100 * 2.4)))
			t3.BackgroundColor3 = color3
			t3.BorderSizePixel = 0
			v40("UICorner", {
				Parent = v108(s3, t3),
				CornerRadius = UDim.new(1, 0)
			})
		end

		v107(0.22, 0.3)
		v107(0.5, 0.65)
		v107(0.78, 0.4)
	elseif p48 == "drag" or p48 == "drag-handle" then
		local v115 = isMobile and math.max(1, math.floor(p49 * 0.12 + 0.5)) or 2
		local v116 = isMobile and math.max(2, math.floor(p49 * 0.22 + 0.5)) or 4

		for i = 1, 3 do
			v88(Frame, color3, {
				AnchorPoint = Vector2.new(1, 1),
				Position = UDim2.new(1, -v115 - (i - 1) * v116, 1, -v115),
				Size = UDim2.new(0, math.max(3, p49 * 0.66 - (i - 1) * p49 * 0.16), 0, v100),
				Rotation = -45
			})
		end
	elseif p48 == "info" then
		v92(Frame, color3, nil, UDim2.fromScale(0.5, 0.5), UDim2.new(0.85, 0, 0.85, 0), v100)
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.5, 0.3),
			Size = UDim2.new(0, v100, 0, v100)
		})
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.5, 0.55),
			Size = UDim2.new(0, v100, 0.3, 0)
		})
	elseif p48 == "warning" then
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.5, 0.45),
			Size = UDim2.new(0, v100, 0.4, 0)
		})
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.5, 0.78),
			Size = UDim2.new(0, v100, 0, v100)
		})

		local Frame2 = v40("Frame", {
			Parent = Frame,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.55),
			Size = UDim2.new(0.85, 0, 0.85, 0),
			BackgroundTransparency = 1
		})

		v40("UICorner", {
			Parent = Frame2,
			CornerRadius = UDim.new(0, v33(4, 1))
		})
		v40("UIStroke", {
			Parent = Frame2,
			Color = color3,
			Thickness = v100
		})
	elseif p48 == "error" or p48 == "x-circle" then
		v92(Frame, color3, nil, UDim2.fromScale(0.5, 0.5), UDim2.new(0.85, 0, 0.85, 0), v100)
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(0.45, 0, 0, v100),
			Rotation = 45
		})
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(0.45, 0, 0, v100),
			Rotation = -45
		})
	elseif p48 == "check-circle" then
		v92(Frame, color3, nil, UDim2.fromScale(0.5, 0.5), UDim2.new(0.85, 0, 0.85, 0), v100)
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.42, 0.58),
			Size = UDim2.new(0.2, 0, 0, v100),
			Rotation = 45
		})
		v88(Frame, color3, {
			Position = UDim2.fromScale(0.62, 0.45),
			Size = UDim2.new(0.34, 0, 0, v100),
			Rotation = -45
		})
	end

	return Frame
end
local function v119(p53, p54)
	for _, descendant in ipairs(p53:GetDescendants()) do
		if descendant:IsA("Frame") and descendant.BackgroundTransparency < 1 then
			descendant.BackgroundColor3 = p54
		elseif descendant:IsA("UIStroke") then
			descendant.Color = p54
		end
	end
end
local function v122(p55, p56, p57, p58)
	local color3 = p58 or Color3.fromRGB(255, 255, 255)
	local AbsoluteSize = p55.AbsoluteSize
	local AbsolutePosition = p55.AbsolutePosition
	local v126 = (p56 or AbsolutePosition.X + AbsoluteSize.X / 2) - AbsolutePosition.X
	local v127 = (p57 or AbsolutePosition.Y + AbsoluteSize.Y / 2) - AbsolutePosition.Y
	local v128 = math.max(AbsoluteSize.X, AbsoluteSize.Y) * 2.4
	local Frame = v40("Frame", {
		Parent = p55,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromOffset(v126, v127),
		Size = UDim2.fromOffset(0, 0),
		BackgroundColor3 = color3,
		BackgroundTransparency = 0.65,
		BorderSizePixel = 0,
		ZIndex = (p55.ZIndex or 1) + 1
	})

	v40("UICorner", {
		Parent = Frame,
		CornerRadius = UDim.new(1, 0)
	})
	v46(Frame, t1.Ripple, {
		Size = UDim2.fromOffset(v128, v128),
		BackgroundTransparency = 1
	})
	task.delay(0.5, function()
		if Frame.Parent then
			Frame:Destroy()
		end
	end)
end
local function v130(p59, p60)
	local v131 = p60 or {}
	local Size = v131.Size or 18
	local Color = v131.Color

	if not Color then
		Color = Library and Library._Theme and Library._Theme.AccentSolid
	end

	Color = Color or Color3.fromRGB(215, 70, 190)

	local Thickness = v131.Thickness or isMobile and math.max(1, Size * 0.13) or math.max(2, Size * 0.13)
	local Frame = v40("Frame", {
		Parent = p59,
		Size = UDim2.fromOffset(Size, Size),
		BackgroundTransparency = 1
	})

	if v131.Position then
		Frame.Position = v131.Position
	end

	if v131.AnchorPoint then
		Frame.AnchorPoint = v131.AnchorPoint
	end

	local Frame2 = v40("Frame", {
		Parent = Frame,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1
	})

	v40("UICorner", {
		Parent = Frame2,
		CornerRadius = UDim.new(1, 0)
	})
	v40("UIStroke", {
		Parent = Frame2,
		Color = Color,
		Thickness = Thickness,
		Transparency = 0.85
	})

	local Frame3 = v40("Frame", {
		Parent = Frame,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1
	})

	v40("UICorner", {
		Parent = Frame3,
		CornerRadius = UDim.new(1, 0)
	})

	local UIStroke = v40("UIStroke", {
		Parent = Frame3,
		Color = Color,
		Thickness = Thickness
	})

	v40("UIGradient", {
		Parent = Frame3,
		Rotation = 0,
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(0.25, 0.4),
			NumberSequenceKeypoint.new(0.5, 1),
			NumberSequenceKeypoint.new(1, 1)
		})
	})

	local connection

	connection = v7.Heartbeat:Connect(function(dt)
		if Frame3.Parent then
			Frame3.Rotation = (Frame3.Rotation + dt * 360) % 360

			return
		end

		if connection then
			connection:Disconnect()
			connection = nil
		end
	end)

	return {
		Instance = Frame,
		Stop = function()
			if connection then
				connection:Disconnect()
				connection = nil
			end

			if Frame.Parent then
				Frame:Destroy()
			end
		end,
		SetColor = function(p61)
			UIStroke.Color = p61
		end
	}
end
local function v140(p62, p63, p64)
	local LongPressDelay = p63 or sizing.LongPressDelay
	local thread
	local Position

	p62.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end

		Position = input.Position

		if thread then
			task.cancel(thread)
		end

		thread = task.delay(LongPressDelay, function()
			if Position then
				v48(p64, Position)
			end

			thread = nil
		end)
	end)

	local function v144()
		Position = nil

		if thread then
			pcall(task.cancel, thread)
			thread = nil
		end
	end

	p62.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch then
			v144()
		end
	end)
	p62.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch and Position then
			local v145 = input.Position - Position

			if sizing.DragThreshold < math.abs(v145.X) or sizing.DragThreshold < math.abs(v145.Y) then
				v144()
			end
		end
	end)
end
local function v146(p65, p66, p67)
	local SwipeThreshold = p67 or sizing.SwipeThreshold
	local Position
	local u149 = false

	local function v150(p68)
		local PlayerGui = v4.LocalPlayer and v4.LocalPlayer:FindFirstChildOfClass("PlayerGui")

		if not PlayerGui or not PlayerGui.GetGuiObjectsAtPosition then
			return false
		end

		local ok, result2 = pcall(function()
			return PlayerGui:GetGuiObjectsAtPosition(p68.X, p68.Y)
		end)

		if not ok or not result2 then
			return false
		end

		for _, v in ipairs(result2) do
			local Parent = v

			while Parent do
				if Parent:GetAttribute("NoWindowSwipe") then
					return true
				end

				if Parent:IsA("TextBox") or Parent:IsA("ScrollingFrame") then
					return true
				end

				Parent = Parent.Parent
			end
		end

		return false
	end

	p65.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch then
			u149 = v150(input.Position)

			if u149 then
			end

			Position = input.Position
		end
	end)
	p65.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch then
			if Position and not u149 then
				local v157 = input.Position - Position
				local ok = not (SwipeThreshold < math.abs(v157.X))

				if not ok then
					local v159 = math.abs(v157.X)

					ok = not (math.abs(v157.Y) * 1.5 < v159)
				end

				if ok then
					if SwipeThreshold < math.abs(v157.Y) then
						local v160 = math.abs(v157.Y)

						if math.abs(v157.X) * 1.5 < v160 then
							v48(p66, v157.Y > 0 and "down" or "up", v157)
						end
					end
				else
					v48(p66, v157.X > 0 and "right" or "left", v157)
				end
			end

			Position = nil
			u149 = false
		end
	end)
end
local function v161(p69, p70, p71)
	local _Theme = Library and Library._Theme or themes.Dark
	local v163 = v33(180, 82)
	local v164 = v33(28, 12)
	local v165 = v33(4, 2)
	local v166 = v33(2, 1)
	local v167 = v165 * 2 + #p71 * (v164 + v166)
	local AbsoluteSize = PopupGui and PopupGui.AbsoluteSize or Vector2.new(1920, 1080)

	if AbsoluteSize.X < p69 + v163 then
		p69 = AbsoluteSize.X - v163 - v165
	end

	if AbsoluteSize.Y < p70 + v167 then
		p70 -= v167
	end

	local v169 = math.max(v165, p69)
	local v170 = math.max(v165, p70)
	local Frame = v40("Frame", {
		Parent = PopupGui or RootGui,
		Position = UDim2.fromOffset(v169, v170),
		Size = UDim2.fromOffset(v163, 0),
		BackgroundColor3 = _Theme.HeaderBackground,
		BorderSizePixel = 0,
		ZIndex = 70,
		ClipsDescendants = true
	})

	v40("UICorner", {
		Parent = Frame,
		CornerRadius = sizing.CornerRadius
	})
	v40("UIStroke", {
		Parent = Frame,
		Color = _Theme.Border,
		Thickness = 1,
		Transparency = 0.4
	})
	v79(Frame, {
		Spread = v33(16, 6),
		Opacity = 0.5
	})
	v40("UIPadding", {
		Parent = Frame,
		PaddingTop = UDim.new(0, v165),
		PaddingBottom = UDim.new(0, v165),
		PaddingLeft = UDim.new(0, v165),
		PaddingRight = UDim.new(0, v165)
	})
	v40("UIListLayout", {
		Parent = Frame,
		Padding = UDim.new(0, v166),
		SortOrder = Enum.SortOrder.LayoutOrder
	})

	local u172 = false
	local connection
	local connection2

	local function v175()
		if u172 then
			return
		end

		u172 = true

		if connection then
			connection:Disconnect()
			connection = nil
		end

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		v46(Frame, t1.SoftSpring, {
			Size = UDim2.fromOffset(v163, 0)
		})
		task.delay(0.22, function()
			if Frame.Parent then
				Frame:Destroy()
			end
		end)
	end

	for i, v in ipairs(p71) do
		local TextButton = v40("TextButton", {
			Parent = Frame,
			Size = UDim2.new(1, 0, 0, v164),
			BackgroundColor3 = _Theme.HeaderBackground,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Font = Enum.Font.Gotham,
			TextSize = sizing.CaptionFont,
			TextColor3 = v.Danger and _Theme.Danger or _Theme.TextPrimary,
			Text = "    " .. (v.Label or ""),
			TextXAlignment = Enum.TextXAlignment.Left,
			AutoButtonColor = false,
			LayoutOrder = i,
			ZIndex = 71
		})

		v40("UICorner", {
			Parent = TextButton,
			CornerRadius = sizing.CornerRadiusSmall
		})
		v40("UIPadding", {
			Parent = TextButton,
			PaddingLeft = UDim.new(0, v33(6, 2)),
			PaddingRight = UDim.new(0, v33(6, 2))
		})

		if v.Icon then
			local v179 = v33(14, 6)
			local v180 = v33(6, 2)

			v95(v40("Frame", {
				Parent = TextButton,
				Size = UDim2.fromOffset(v179, v179),
				Position = UDim2.new(0, v180, 0.5, -math.floor(v179 / 2)),
				BackgroundTransparency = 1,
				ZIndex = 72
			}), v.Icon, v179, v.Danger and _Theme.Danger or _Theme.TextSecondary)
		end

		TextButton.MouseEnter:Connect(function()
			v46(TextButton, t1.Fast, {
				BackgroundTransparency = 0,
				BackgroundColor3 = _Theme.CardBackgroundHover
			})
		end)
		TextButton.MouseLeave:Connect(function()
			v46(TextButton, t1.Fast, {
				BackgroundTransparency = 1
			})
		end)
		TextButton.MouseButton1Click:Connect(function()
			v175()
			v48(v.Callback)
		end)
	end

	v46(Frame, t1.SoftSpring, {
		Size = UDim2.fromOffset(v163, v167)
	})
	connection = v5.InputBegan:Connect(function(input)
		if u172 then
			return
		end

		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton2 then
			local Position = input.Position
			local AbsolutePosition = Frame.AbsolutePosition
			local AbsoluteSize2 = Frame.AbsoluteSize

			if not (AbsolutePosition.X <= Position.X) or not (Position.X <= AbsolutePosition.X + AbsoluteSize2.X) or not (AbsolutePosition.Y <= Position.Y) or not (Position.Y <= AbsolutePosition.Y + AbsoluteSize2.Y) then
				v175()
			end
		end
	end)
	connection2 = v5.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and not (input.KeyCode ~= Enum.KeyCode.Escape or u172) then
			v175()
		end
	end)
end
local function v184(p72, p73, p74)
	local v185 = p73 or 0.025
	local Stagger = p74 or t1.Stagger

	for i, v in ipairs(p72) do
		if v.Parent then
			local Position = v.Position
			local BackgroundTransparency = v.BackgroundTransparency

			v.Position = Position + UDim2.fromOffset(0, v33(16, 6))
			v.BackgroundTransparency = 1
			task.delay((i - 1) * v185, function()
				if v.Parent then
					v46(v, Stagger, {
						Position = Position,
						BackgroundTransparency = BackgroundTransparency
					})
				end
			end)
		end
	end
end

pcall(function()
	local Lighting = game:GetService("Lighting")

	for _, child in ipairs(Lighting:GetChildren()) do
		if child:IsA("BlurEffect") and child:GetAttribute("MM2_UI_Blur") then
			child:Destroy()
		end
	end
end)

local t4 = {}

t4.__index = t4
t4._Connections = {}
t4._ThemeListeners = {}
t4._ThemeListenerSeq = 0
t4._Flags = {}
t4._Windows = {}
t4._Theme = v70(themes.Dark)
t4._OpenPopups = {}
t4.Themes = themes
t4.Sizing = sizing
t4.Densities = densities
t4.Icons = {
	check = "rbxassetid://10709790948",
	close = "rbxasset://textures/loading/cancelButton.png",
	info = "rbxassetid://10709792800",
	warning = "rbxassetid://10709795067",
	error = "rbxasset://textures/loading/cancelButton.png",
	["check-circle"] = "rbxassetid://10709790948",
	refresh = "rbxassetid://10734895698",
	copy = "rbxassetid://10709795926",
	eye = "rbxassetid://10709792896",
	trash = "rbxassetid://10734896206",
	save = "rbxassetid://10734899054",
	search = "rbxassetid://10734897418",
	settings = "rbxassetid://10734898355"
}
Icons = t4.Icons
t4.Version = "4.18.29"
t4._Destroyed = false
t4.IS_TOUCH = TouchEnabled
t4.IS_MOBILE = isMobile
t4.IS_TABLET = v16
setmetatable(t4, {
	__index = function(p75, p76)
		if p76 == "Theme" then
			return rawget(p75, "_Theme")
		end
	end
})

local function v195(p77)
	table.insert(t4._Connections, p77)

	return p77
end
local function v196(p78)
	t4._ThemeListenerSeq += 1

	local _ThemeListenerSeq = t4._ThemeListenerSeq

	t4._ThemeListeners[_ThemeListenerSeq] = p78
	pcall(p78, t4._Theme)

	return function()
		t4._ThemeListeners[_ThemeListenerSeq] = nil
	end
end
local function v198()
	for _, themeListener in pairs(t4._ThemeListeners) do
		local ok, result2 = pcall(themeListener, t4._Theme)

		if not ok then
			warn("[UI] theme listener error:", result2)
		end
	end
end

t4._SizingListeners = t4._SizingListeners or {}
t4._SizingListenerSeq = t4._SizingListenerSeq or 0

local function v203(p79)
	t4._SizingListenerSeq += 1

	local _SizingListenerSeq = t4._SizingListenerSeq

	t4._SizingListeners[_SizingListenerSeq] = p79

	return function()
		t4._SizingListeners[_SizingListenerSeq] = nil
	end
end
local function v205()
	for _, sizingListener in pairs(t4._SizingListeners) do
		local ok, result2 = pcall(sizingListener, sizing)

		if not ok then
			warn("[UI] sizing listener error:", result2)
		end
	end
end

t4.SetTheme = function(p80, p81)
	if type(p81) == "string" then
		local v210 = themes[p81]

		if not v210 then
			warn("[UI] unknown theme:", p81)

			return
		end

		t4._Theme = v70(v210)
	elseif type(p81) == "table" then
		t4._Theme = v74(t4._Theme, p81)
	end

	v198()
end
t4.GetTheme = function()
	return v70(t4._Theme)
end
t4.RegisterIcon = function(p82, p83, p84)
	if type(p83) == "string" and type(p84) == "string" then
		t4.Icons[p83] = p84
	end
end
t4.RegisterIcons = function(p85, p86)
	if type(p86) ~= "table" then
		return
	end

	for k, v in pairs(p86) do
		t4:RegisterIcon(k, v)
	end
end
t4.WasLastTouch = function()
	return u34
end

local function v213()
	local t5 = {}

	for _, openPopup in ipairs(t4._OpenPopups) do
		table.insert(t5, openPopup)
	end

	table.clear(t4._OpenPopups)

	for _, v in ipairs(t5) do
		pcall(v)
	end
end

t4.SetDensity = function(p87, p88)
	if not densities[p88] then
		warn("[UI] unknown density:", p88)

		return
	end

	v26(p88)
	v31()
	v205()
	v198()
end

local function v219()
	local function v220()
		if not gethui_ then
			return nil
		end

		local ok, result2 = pcall(gethui_)

		if ok and typeof(result2) == "Instance" then
			return result2
		end

		return nil
	end
	local function v223(p89)
		if typeof(p89) ~= "Instance" then
			return
		end

		local ok, result2 = pcall(function()
			return p89:GetChildren()
		end)

		if not ok or typeof(result2) ~= "table" then
			return
		end

		for _, v in ipairs(result2) do
			if v:IsA("ScreenGui") and v:GetAttribute("MM2_UI") then
				pcall(function()
					v:Destroy()
				end)
			end
		end

		local ok3, result3 = pcall(function()
			return p89:GetDescendants()
		end)

		if not ok3 or typeof(result3) ~= "table" then
			return
		end

		for _, v in ipairs(result3) do
			if v:IsA("ImageLabel") and v:GetAttribute("MM2_Shadow") then
				pcall(function()
					v:Destroy()
				end)
			end
		end
	end

	pcall(function()
		v223(v220())
	end)
	pcall(function()
		v223(v9)
	end)
	pcall(function()
		v223(LocalPlayer:FindFirstChild("PlayerGui"))
	end)
end

v219()

local function createScreenGui(p90)
	local ScreenGui = Instance.new("ScreenGui")

	ScreenGui.Name = v39()
	ScreenGui.IgnoreGuiInset = true
	ScreenGui.ResetOnSpawn = false
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.DisplayOrder = p90
	ScreenGui:SetAttribute("MM2_UI", true)

	local u234 = false

	pcall(function()
		if gethui_ then
			local ok, parent = pcall(gethui_)

			if ok and typeof(parent) == "Instance" then
				ScreenGui.Parent = parent
				u234 = true
			end
		end
	end)

	if not u234 then
		pcall(function()
			ScreenGui.Parent = v9
			u234 = true
		end)
	end

	if not u234 then
		ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
	end

	if typeof(protectgui_) == "function" then
		pcall(protectgui_, ScreenGui)
	end

	return ScreenGui
end

local v237 = createScreenGui(900)
local v238 = createScreenGui(940)
local v239 = createScreenGui(960)
local v240 = createScreenGui(980)
local v241 = createScreenGui(995)

t4._Root = v237
t4._PopupGui = v238
t4._NotifyGui = v239
t4._ModalGui = v240
t4._TooltipGui = v241

local function v242(p91, p92, p93, p94)
	local u243 = false
	local Position
	local Position2

	p91.Active = true

	local function v246(p95)
		if p94 then
			table.insert(p94, p95)
		else
			v195(p95)
		end
	end

	v246(p91.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			if p93 and p93(input) then
				return
			end

			u243 = true
			Position = input.Position
			Position2 = p92.Position
		end
	end))
	v246(v5.InputChanged:Connect(function(input)
		if u243 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			if not p92.Parent then
				u243 = false

				return
			end

			local v247 = input.Position - Position

			p92.Position = UDim2.new(Position2.X.Scale, Position2.X.Offset + v247.X, Position2.Y.Scale, Position2.Y.Offset + v247.Y)
		end
	end))
	v246(v5.InputEnded:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
			if input.UserInputType == Enum.UserInputType.Touch and u243 then
				u243 = false
			end
		elseif u243 then
			u243 = false
		end
	end))
	v246(v5.WindowFocusReleased:Connect(function()
		if u243 then
			u243 = false
		end
	end))
end
local function v248(p96, p97, p98, p99, p100, p101, p102)
	local u249 = false
	local Position
	local AbsoluteSize
	local Position2

	p97.Active = true

	local function v253(p103)
		if p102 then
			table.insert(p102, p103)
		else
			v195(p103)
		end
	end
	local function v254(p104)
		local n3 = 0
		local n4 = 0

		if p98:find("r") then
			n3 = p104.X
		end

		if p98:find("l") then
			n3 = -p104.X
		end

		if p98:find("b") then
			n4 = p104.Y
		end

		if p98:find("t") then
			n4 = -p104.Y
		end

		return n3, n4
	end
	local function v257(p105)
		local n5 = 0
		local n6 = 0

		if p98:find("[rl]") then
			n5 = p105.X * 0.5
		end

		if p98:find("[bt]") then
			n6 = p105.Y * 0.5
		end

		return n5, n6
	end
	local function v260(p106)
		Position = p106.Position
		AbsoluteSize = p96.AbsoluteSize
		Position2 = p96.Position
		p96.Size = UDim2.fromOffset(AbsoluteSize.X, AbsoluteSize.Y)
		p96.Position = UDim2.new(Position2.X.Scale, Position2.X.Offset, Position2.Y.Scale, Position2.Y.Offset)
	end

	v253(p97.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			u249 = true
			v260(input)
		end
	end))
	v253(v5.InputChanged:Connect(function(input)
		if u249 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			if not p96.Parent then
				u249 = false

				return
			end

			local v261, v262 = v254(input.Position - Position)
			local v263 = AbsoluteSize.Y + v262
			local v264 = v54(AbsoluteSize.X + v261, p99.X, p100.X)
			local v265 = v54(v263, p99.Y, p100.Y)
			local v266 = v264 - AbsoluteSize.X
			local v267 = v265 - AbsoluteSize.Y

			p96.Position = UDim2.new(Position2.X.Scale, Position2.X.Offset + (p98:find("r") and 1 or p98:find("l") and -1 or 0) * v266 * 0.5, Position2.Y.Scale, Position2.Y.Offset + (p98:find("b") and 1 or p98:find("t") and -1 or 0) * v267 * 0.5)
			p96.Size = UDim2.fromOffset(v264, v265)

			if p101 then
				p101(v264, v265)
			end
		end
	end))
	v253(v5.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			u249 = false

			return
		elseif input.UserInputType == Enum.UserInputType.Touch then
			u249 = false
		end
	end))
end

local Frame = v40("Frame", {
	Parent = v241,
	Size = UDim2.fromOffset(0, 0),
	AutomaticSize = Enum.AutomaticSize.XY,
	BackgroundColor3 = themes.Dark.HeaderBackground,
	BorderSizePixel = 0,
	Visible = false,
	ZIndex = 1000
})

v40("UICorner", {
	Parent = Frame,
	CornerRadius = sizing.CornerRadiusSmall
})

local UIStroke = v40("UIStroke", {
	Parent = Frame,
	Color = themes.Dark.Border,
	Thickness = 1
})

v40("UIPadding", {
	Parent = Frame,
	PaddingLeft = UDim.new(0, v33(10, 4)),
	PaddingRight = UDim.new(0, v33(10, 4)),
	PaddingTop = UDim.new(0, v33(7, 3)),
	PaddingBottom = UDim.new(0, v33(7, 3))
})

local TextLabel = v40("TextLabel", {
	Parent = Frame,
	BackgroundTransparency = 1,
	Size = UDim2.fromOffset(0, 0),
	AutomaticSize = Enum.AutomaticSize.XY,
	Font = Enum.Font.Gotham,
	TextSize = sizing.CaptionFont,
	TextColor3 = themes.Dark.TextPrimary,
	Text = "",
	TextXAlignment = Enum.TextXAlignment.Left
})

v196(function(p107)
	Frame.BackgroundColor3 = p107.HeaderBackground
	UIStroke.Color = p107.Border
	TextLabel.TextColor3 = p107.TextPrimary
end)
v203(function(p108)
	TextLabel.TextSize = p108.CaptionFont
end)

local thread
local vector2 = Vector2.new(v33(18, 7), v33(22, 8))
local v273 = v33(8, 3)
local u274

local function v275()
	local mouseLocation = u274 or v5:GetMouseLocation()
	local guiInset = v11:GetGuiInset()
	local v278 = mouseLocation.X + (guiInset and guiInset.X or 0)
	local v279 = mouseLocation.Y + (guiInset and guiInset.Y or 36)
	local AbsoluteSize = Frame.AbsoluteSize
	local ViewportSize = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1280, 720)
	local v282 = v279 + vector2.Y
	local v283 = v54(v278 + vector2.X, v273, math.max(v273, ViewportSize.X - AbsoluteSize.X - v273))
	local v284 = v54(v282, v273, math.max(v273, ViewportSize.Y - AbsoluteSize.Y - v273))

	Frame.Position = UDim2.fromOffset(v283, v284)
end

local connection

local function v286(p109, p110, p111)
	if thread then
		task.cancel(thread)
		thread = nil
	end

	u274 = p111
	thread = task.delay(0.45, function()
		if not p109 or not p109.Parent then
			return
		end

		TextLabel.Text = p110
		Frame.Visible = true
		Frame.BackgroundTransparency = 1
		TextLabel.TextTransparency = 1
		UIStroke.Transparency = 1
		v275()

		if connection then
			connection:Disconnect()
		end

		connection = v7.Heartbeat:Connect(v275)
		v46(Frame, t1.Fast, {
			BackgroundTransparency = 0
		})
		v46(TextLabel, t1.Fast, {
			TextTransparency = 0
		})
		v46(UIStroke, t1.Fast, {
			Transparency = 0
		})
	end)
end
local function v287()
	if thread then
		task.cancel(thread)
		thread = nil
	end

	if connection then
		connection:Disconnect()
		connection = nil
	end

	u274 = nil
	Frame.Visible = false
end
local function v288(p112, p113)
	v195(p112.MouseEnter:Connect(function()
		local v289 = type(p113) == "function" and p113() or p113

		if v289 then
			if v289 ~= "" then
				v286(p112, v289)
			end
		end
	end))
	v195(p112.MouseLeave:Connect(v287))

	if TouchEnabled then
		v140(p112, sizing.LongPressDelay, function(p114)
			local v290 = type(p113) == "function" and p113() or p113

			if v290 then
				if v290 ~= "" then
					v286(p112, v290, p114)
					task.delay(2, function()
						if p112.Parent then
							v287()
						end
					end)
				end
			end
		end)
	end
end

local t6 = {}

t6.__index = t6
t6.AddButton = function(p115, p116)
	local v292 = p116 or {}
	local Variant = v292.Variant or "Default"

	local function v294(p117)
		if Variant == "Primary" then
			return p117.Primary, p117.PrimaryHover, p117.PrimaryPressed, p117.PrimaryText
		end

		if Variant == "Danger" then
			return p117.Danger, v69(p117.Danger, Color3.new(1, 1, 1), 0.1), v69(p117.Danger, Color3.new(0, 0, 0), 0.1), p117.PrimaryText
		end

		if Variant == "Success" then
			return p117.Success, v69(p117.Success, Color3.new(1, 1, 1), 0.1), v69(p117.Success, Color3.new(0, 0, 0), 0.1), p117.PrimaryText
		end

		if Variant == "Ghost" then
			return Color3.fromRGB(0, 0, 0), p117.CardBackgroundHover, p117.CardBackgroundActive, p117.TextPrimary
		end

		return p117.CardBackground, p117.CardBackgroundHover, p117.CardBackgroundActive, p117.TextPrimary
	end

	local _Theme = t4._Theme
	local u296, u297, u298, u299 = v294(_Theme)
	local Disabled = v292.Disabled or false
	local v301 = v40
	local s4 = "TextButton"
	local v303 = v301(s4, {
		Parent = p115._Container,
		Size = UDim2.new(1, 0, 0, sizing.ButtonHeight),
		BackgroundColor3 = u296,
		BackgroundTransparency = Variant == "Ghost" and 1 or 0,
		BorderSizePixel = 0,
		Font = Enum.Font.GothamMedium,
		TextSize = sizing.ButtonFont,
		TextColor3 = u299,
		Text = v292.Text or "Button",
		AutoButtonColor = false,
		ClipsDescendants = true
	})

	v40("UICorner", {
		Parent = v303,
		CornerRadius = sizing.CornerRadius
	})
	v67(v303)

	if Variant == "Primary" or Variant == "Danger" or Variant == "Success" then
		local Frame2 = v40("Frame", {
			Parent = v303,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderSizePixel = 0,
			ZIndex = (v303.ZIndex or 1) + 1
		})

		v40("UICorner", {
			Parent = Frame2,
			CornerRadius = sizing.CornerRadius
		})
		v40("UIGradient", {
			Parent = Frame2,
			Rotation = 90,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0.78),
				NumberSequenceKeypoint.new(0.5, 0.92),
				NumberSequenceKeypoint.new(1, 1)
			})
		})
		v40("UIStroke", {
			Parent = v303,
			Color = Color3.fromRGB(255, 255, 255),
			Thickness = 1,
			Transparency = 0.7,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		})
		v40("UIGradient", {
			Parent = v303,
			Rotation = 90,
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
				ColorSequenceKeypoint.new(1, Color3.new(0.92, 0.92, 0.92))
			})
		})
	end

	local Frame2

	if v292.Icon then
		local MobileScale = isMobile and (sizing.MobileScale or 1) or 1
		local v307 = isMobile and math.max(8, math.floor(18 * MobileScale + 0.5)) or 18
		local v308 = isMobile and math.max(5, math.floor(14 * MobileScale + 0.5)) or 14

		Frame2 = v40("Frame", {
			Parent = v303,
			Size = UDim2.fromOffset(v307, v307),
			Position = UDim2.new(0, v308, 0.5, -math.floor(v307 / 2)),
			BackgroundTransparency = 1
		})

		if string.sub(v292.Icon, 1, 12) == "rbxassetid:/" or string.sub(v292.Icon, 1, 9) == "rbxasset:" then
			v40("ImageLabel", {
				Parent = Frame2,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Image = v292.Icon,
				ImageColor3 = u299
			})
		else
			v95(Frame2, v292.Icon, v307, u299)
		end

		v303.TextXAlignment = Enum.TextXAlignment.Center
		v40("UIPadding", {
			Parent = v303,
			PaddingLeft = UDim.new(0, v308 + v307 + math.max(5, math.floor(4 * MobileScale + 0.5)))
		})
	end

	local UIStroke2 = v40("UIStroke", {
		Parent = v303,
		Color = _Theme.AccentSolid,
		Thickness = 0,
		Transparency = 0.5,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	})

	v303.MouseEnter:Connect(function()
		if Disabled then
			return
		end

		v46(v303, t1.Default, {
			BackgroundColor3 = u297,
			BackgroundTransparency = Variant == "Ghost" and 0.85 or 0
		})
	end)
	v303.MouseLeave:Connect(function()
		if Disabled then
			return
		end

		v46(v303, t1.Default, {
			BackgroundColor3 = u296,
			BackgroundTransparency = Variant == "Ghost" and 1 or 0
		})
	end)
	v303.MouseButton1Down:Connect(function(x, y)
		if Disabled then
			return
		end

		v46(v303, t1.Fast, {
			BackgroundColor3 = u298
		})

		local color3 = Variant ~= "Default" and Variant ~= "Ghost" and Color3.fromRGB(255, 255, 255)

		v122(v303, x, y, color3 or t4._Theme.AccentSolid)
	end)
	v303.MouseButton1Up:Connect(function()
		if Disabled then
			return
		end

		v46(v303, t1.Fast, {
			BackgroundColor3 = u297
		})
	end)
	v303.SelectionGained:Connect(function()
		v46(UIStroke2, t1.FocusRing, {
			Thickness = v33(2, 1)
		})
	end)
	v303.SelectionLost:Connect(function()
		v46(UIStroke2, t1.FocusRing, {
			Thickness = 0
		})
	end)
	v303.MouseButton1Click:Connect(function()
		if not Disabled then
			v48(v292.Callback)
		end
	end)

	if v292.Tooltip then
		v288(v303, v292.Tooltip)
	end

	local function v311()
		v303.AutoButtonColor = false

		if Disabled then
			v303.TextColor3 = t4._Theme.TextDisabled
			v303.BackgroundTransparency = 0.5
		else
			v303.TextColor3 = u299
			v303.BackgroundTransparency = Variant == "Ghost" and 1 or 0
		end
	end

	v311()

	local v312 = v196(function(p118)
		local v313, v314, v315, v316 = v294(p118)

		u296 = v313
		u297 = v314
		u298 = v315
		u299 = v316

		if not Disabled then
			v303.BackgroundColor3 = u296
			v303.TextColor3 = u299
		end

		UIStroke2.Color = p118.AccentSolid

		if Frame2 then
			for _, child in ipairs(Frame2:GetChildren()) do
				if child:IsA("ImageLabel") then
					child.ImageColor3 = u299
				else
					v119(child, u299)
				end
			end
		end
	end)
	local v319 = v203(function(p119)
		v303.Size = UDim2.new(1, 0, 0, p119.ButtonHeight)
		v303.TextSize = p119.ButtonFont
	end)
	local u320 = false
	local u321
	local Text

	return {
		SetLoading = function(p120, p121)
			if p121 == u320 then
				return
			end

			u320 = p121

			if p121 then
				Disabled = true
				Text = v303.Text
				v303.Text = ""
				u321 = v130(v303, {
					Size = isMobile and math.max(7, math.floor(sizing.ButtonHeight * 0.58 + 0.5)) or math.max(14, sizing.ButtonHeight - 16),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Color = u299
				})
				v311()
			else
				if u321 then
					u321.Stop()
					u321 = nil
				end

				if Text then
					v303.Text = Text
					Text = nil
				end

				Disabled = v292.Disabled or false
				v311()
			end
		end,
		SetText = function(p122, p123)
			if not u320 then
				v303.Text = p123
			end

			Text = p123
		end,
		SetCallback = function(p124, p125)
			v292.Callback = p125
		end,
		SetDisabled = function(p126, p127)
			Disabled = p127
			v311()
		end,
		GetState = function()
			return nil
		end,
		SetState = function()
		end,
		Destroy = function()
			if u321 then
				u321.Stop()
			end

			v312()
			v319()
			v303:Destroy()
		end
	}
end

local function addToggle(p128, p129)
	local v324 = p129 or {}
	local _Theme = t4._Theme
	local u326 = v324.Default and true or false
	local Disabled = v324.Disabled or false
	local u328
	local u329
	local u330
	local u331
	local u332
	local u333
	local u334
	local u335
	local u336

	local function v337(p130)
		local MobileScale = isMobile

		if MobileScale then
			MobileScale = p130 and p130.MobileScale or sizing.MobileScale
			MobileScale = MobileScale or 1
		end

		MobileScale = MobileScale or 1

		local v339 = isMobile and math.max(1, math.floor(2 * MobileScale + 0.5)) or 2
		local v340 = isMobile and math.max(2, math.floor(6 * MobileScale + 0.5)) or 6

		u328 = isMobile and math.max(22, math.floor(p130.ToggleHeight * 1.78 + 0.5)) or math.max(52, math.floor(p130.ToggleHeight * 1.78))

		local v341 = isMobile and math.max(10, p130.ToggleHeight - v340)

		u329 = v341 or math.max(22, p130.ToggleHeight - 6)
		u330 = isMobile and math.max(8, u329 - v339 * 2) or math.max(18, u329 - 4)
		u332 = v339
		u331 = u328 - u330 - v339
		u333 = v339
		u334 = isMobile and 1 or 2
		u335 = isMobile and 2 or 4
		u336 = isMobile and 1 or 2
	end

	v337(sizing)

	local Frame2 = v40("Frame", {
		Parent = p128._Container,
		Size = UDim2.new(1, 0, 0, sizing.ToggleHeight),
		BackgroundTransparency = 1
	})
	local u343 = u328 + v33(14, 4)
	local TextLabel2 = v40("TextLabel", {
		Parent = Frame2,
		Size = UDim2.new(1, -u343, 1, 0),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamMedium,
		TextSize = sizing.BodyFont,
		TextColor3 = _Theme.TextPrimary,
		Text = v324.Text or "Toggle",
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd
	})
	local TextButton = v40("TextButton", {
		Parent = Frame2,
		Size = UDim2.fromOffset(u328, u329),
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -v33(2, 1), 0.5, 0),
		BackgroundColor3 = _Theme.CardBackground,
		BorderSizePixel = 0,
		ClipsDescendants = false,
		AutoButtonColor = false,
		Text = ""
	})

	v40("UICorner", {
		Parent = TextButton,
		CornerRadius = UDim.new(1, 0)
	})
	v67(TextButton)

	local UIStroke2 = v40("UIStroke", {
		Parent = TextButton,
		Color = _Theme.Border,
		Thickness = 1,
		Transparency = 0.3
	})
	local UIGradient = v40("UIGradient", {
		Parent = TextButton,
		Color = ColorSequence.new(_Theme.AccentGradientFrom, _Theme.AccentGradientTo),
		Rotation = 35,
		Enabled = false
	})
	local UIStroke3 = v40("UIStroke", {
		Parent = TextButton,
		Color = _Theme.AccentSolid,
		Thickness = 0,
		Transparency = 0.5,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	})
	local Frame3 = v40("Frame", {
		Parent = TextButton,
		Size = UDim2.fromOffset(u330, u330),
		Position = UDim2.fromOffset(u332, u333),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0,
		ZIndex = 3
	})

	v40("UICorner", {
		Parent = Frame3,
		CornerRadius = UDim.new(1, 0)
	})

	local Frame4 = v40("Frame", {
		Parent = Frame3,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		ZIndex = 4
	})
	local v351 = u326 and 1 or 0
	local v352 = u326 and 0 or 1
	local Frame5 = v40("Frame", {
		Parent = Frame4,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		ZIndex = 5
	})

	local function v354(p131)
		local Frame6 = v40("Frame", {
			Parent = Frame5,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0.42, 0.1),
			BackgroundColor3 = _Theme.TextDisabled,
			BackgroundTransparency = v351,
			BorderSizePixel = 0,
			Rotation = p131
		})

		v40("UICorner", {
			Parent = Frame6,
			CornerRadius = UDim.new(1, 0)
		})

		return Frame6
	end

	local v356 = v354(45)
	local v357 = v354(-45)
	local ImageLabel = v40("ImageLabel", {
		Parent = v40("Frame", {
			Parent = Frame4,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ZIndex = 5
		}),
		Size = UDim2.fromScale(0.85, 0.85),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = t4.Icons and t4.Icons.check or "",
		ImageColor3 = _Theme.AccentSolid,
		ImageTransparency = v352,
		ScaleType = Enum.ScaleType.Fit,
		ZIndex = 5
	})

	local function v359(p132)
		local tweenInfo = p132 and TweenInfo.new(0) or t1.SoftSpring
		local tweenInfo2 = p132 and TweenInfo.new(0) or t1.Fast

		if u326 then
			UIGradient.Enabled = true
			v46(Frame3, tweenInfo, {
				Position = UDim2.fromOffset(u331, u333)
			})
			v46(UIStroke3, t1.Glow, {
				Thickness = u334,
				Transparency = 0.6
			})
			v46(UIStroke2, t1.Default, {
				Transparency = 1
			})
			v46(TextButton, t1.Default, {
				BackgroundColor3 = t4._Theme.AccentSolid
			})
			v46(ImageLabel, tweenInfo2, {
				ImageTransparency = 0
			})
			v46(v356, tweenInfo2, {
				BackgroundTransparency = 1
			})
			v46(v357, tweenInfo2, {
				BackgroundTransparency = 1
			})
		else
			UIGradient.Enabled = false
			v46(Frame3, tweenInfo, {
				Position = UDim2.fromOffset(u332, u333)
			})
			v46(UIStroke3, t1.Glow, {
				Thickness = 0,
				Transparency = 1
			})
			v46(UIStroke2, t1.Default, {
				Transparency = 0.3
			})
			v46(TextButton, t1.Default, {
				BackgroundColor3 = t4._Theme.CardBackground
			})
			v46(v356, tweenInfo2, {
				BackgroundTransparency = 0
			})
			v46(v357, tweenInfo2, {
				BackgroundTransparency = 0
			})
			v46(ImageLabel, tweenInfo2, {
				ImageTransparency = 1
			})
		end
	end

	v359(true)
	TextButton.MouseButton1Click:Connect(function()
		if Disabled then
			return
		end

		u326 = not u326
		v46(Frame3, t1.Fast, {
			Size = UDim2.fromOffset(u330 + u336, math.max(1, u330 - u336))
		})
		task.delay(0.07, function()
			if Frame3.Parent then
				v46(Frame3, t1.Spring, {
					Size = UDim2.fromOffset(u330, u330)
				})
			end
		end)
		v46(UIStroke3, t1.Fast, {
			Thickness = u335,
			Transparency = 0.3
		})
		task.delay(0.12, function()
			if not UIStroke3.Parent then
				return
			end

			v46(UIStroke3, t1.Default, {
				Thickness = u326 and u334 or 0,
				Transparency = u326 and 0.6 or 1
			})
		end)
		v359()
		v48(v324.Callback, u326)
	end)
	TextButton.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			if not Disabled then
				local v362 = v324.Default and true or false

				v161(input.Position.X, input.Position.Y, {
					{
						Label = "Reset to default (" .. (v362 and "ON" or "OFF") .. ")",
						Icon = "refresh",
						Callback = function()
							if u326 ~= v362 then
								u326 = v362
								v359()
								v48(v324.Callback, u326)
							end
						end
					},
					{
						Label = "Copy value",
						Icon = "copy",
						Callback = function()
							if typeof(setclipboard) == "function" then
								pcall(setclipboard, tostring(u326))
							end
						end
					}
				})
			end
		end
	end)

	if v324.Tooltip then
		v288(Frame2, v324.Tooltip)
	end

	local v363 = v196(function(p133)
		TextLabel2.TextColor3 = Disabled and p133.TextDisabled or p133.TextPrimary
		TextButton.BackgroundColor3 = u326 and p133.AccentSolid or p133.CardBackground
		UIGradient.Color = ColorSequence.new(p133.AccentGradientFrom, p133.AccentGradientTo)
		UIStroke3.Color = p133.AccentSolid
		UIStroke2.Color = p133.Border
		v356.BackgroundColor3 = p133.TextDisabled
		v357.BackgroundColor3 = p133.TextDisabled
		ImageLabel.ImageColor3 = p133.AccentSolid
	end)
	local v364 = v203(function(p134)
		v337(p134)
		Frame2.Size = UDim2.new(1, 0, 0, p134.ToggleHeight)
		u343 = u328 + v33(14, 4)
		TextLabel2.Size = UDim2.new(1, -u343, 1, 0)
		TextLabel2.TextSize = p134.BodyFont
		TextButton.Position = UDim2.new(1, -v33(2, 1), 0.5, 0)
		TextButton.Size = UDim2.fromOffset(u328, u329)
		Frame3.Size = UDim2.fromOffset(u330, u330)
		Frame3.Position = UDim2.fromOffset(u326 and u331 or u332, u333)
	end)
	local t7 = {
		Set = function(p135, p136)
			u326 = p136 and true or false
			v359()
			v48(v324.Callback, u326)
		end,
		Get = function()
			return u326
		end,
		GetState = function()
			return u326
		end,
		SetState = function(p137, p138)
			u326 = p138 and true or false
			v359()
		end,
		SetText = function(p139, p140)
			TextLabel2.Text = p140
		end,
		SetDisabled = function(p141, p142)
			Disabled = p142
			TextLabel2.TextColor3 = p142 and t4._Theme.TextDisabled or t4._Theme.TextPrimary
			v46(TextButton, t1.Default, {
				BackgroundTransparency = p142 and 0.5 or 0
			})
			v46(Frame3, t1.Default, {
				BackgroundTransparency = p142 and 0.5 or 0
			})
		end,
		Destroy = function()
			if v324.Flag then
				t4._Flags[v324.Flag] = nil
			end

			v363()
			v364()
			Frame2:Destroy()
		end
	}

	if v324.Flag then
		t4._Flags[v324.Flag] = t7
	end

	if v324.Default then
		v48(v324.Callback, u326)
	end

	return t7
end

t6.AddToggle = addToggle
t6.AddSlider = function(p143, p144)
	local v366 = p144 or {}
	local _Theme = t4._Theme
	local Min = v366.Min or 0
	local Max = v366.Max or 100
	local Increment = v366.Increment or 1

	if Increment <= 0 then
		Increment = 1
	end

	local u371 = v54(v366.Default or Min, Min, Max)
	local Suffix = v366.Suffix or ""
	local Disabled = v366.Disabled or Min == Max
	local u374
	local u375
	local u376
	local u377
	local u378
	local u379
	local u380
	local u381
	local u382
	local u383
	local u384
	local u385
	local u386
	local u387
	local u388

	local function v389(p145)
		u375 = p145.BodyFont + v33(4, 2)
		u376 = v33(96, 34)
		u377 = v33(22, 9)
		u374 = math.floor(p145.BodyFont * 1.5 + v33(30, 10) + 0.5)
		u378 = isMobile and math.max(3, math.floor(p145.SliderHeight * 0.22 + 0.5)) or math.max(10, math.floor(p145.SliderHeight * 0.22))

		local v390 = isMobile and math.max(9, math.floor(u378 * 2.4 + 0.5))

		u379 = v390 or math.max(24, math.floor(u378 * 2.4))

		local v391 = v33(54, 24)
		local v392 = v33(22, 10)
		local v393 = -v33(10, 4)

		u380 = v391
		u381 = v392
		u382 = v393
		u383 = v33(4, 1)
		u384 = v33(2, 1)
		u385 = v33(16, 4)

		local v394 = v33(96, 34)
		local v395 = v33(26, 12)
		local v396 = v33(8, 3)

		u386 = v394
		u387 = v395
		u388 = v396
	end

	v389(sizing)

	local Frame2 = v40("Frame", {
		Parent = p143._Container,
		Size = UDim2.new(1, 0, 0, u374),
		BackgroundTransparency = 1
	})

	Frame2:SetAttribute("NoWindowSwipe", true)

	local TextLabel2 = v40("TextLabel", {
		Parent = Frame2,
		Size = UDim2.new(1, -(u376 + v33(4, 2)), 0, u375),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamMedium,
		TextSize = sizing.BodyFont,
		TextColor3 = _Theme.TextPrimary,
		Text = v366.Text or "Slider",
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd
	})
	local v399 = v40
	local s5 = "TextLabel"
	local v401 = v399(s5, {
		Parent = Frame2,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -v33(2, 1), 0, 0),
		Size = UDim2.fromOffset(u376, u375),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamMedium,
		TextSize = sizing.CaptionFont,
		TextColor3 = _Theme.TextSecondary,
		TextXAlignment = Enum.TextXAlignment.Right,
		Text = ("%s%s"):format(tostring(u371), Suffix ~= "" and " " .. Suffix or "")
	})
	local Frame3 = v40("Frame", {
		Parent = Frame2,
		Position = UDim2.new(0, 0, 1, -u377),
		Size = UDim2.new(1, 0, 0, u377),
		BackgroundTransparency = 1,
		ZIndex = 1
	})

	Frame3:SetAttribute("NoWindowSwipe", true)

	local Frame4 = v40("Frame", {
		Parent = Frame3,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 0, u378),
		BackgroundColor3 = _Theme.CardBackground,
		BorderSizePixel = 0
	})

	Frame4:SetAttribute("NoWindowSwipe", true)
	v40("UICorner", {
		Parent = Frame4,
		CornerRadius = UDim.new(1, 0)
	})

	local function v404()
		local v405 = Max - Min

		return v405 > 0 and (u371 - Min) / v405 or 1
	end

	local Frame5 = v40("Frame", {
		Parent = Frame4,
		Size = UDim2.fromScale(v404(), 1),
		BackgroundColor3 = _Theme.AccentSolid,
		BorderSizePixel = 0
	})

	v40("UICorner", {
		Parent = Frame5,
		CornerRadius = UDim.new(1, 0)
	})

	local UIGradient = v40("UIGradient", {
		Parent = Frame5,
		Color = ColorSequence.new(_Theme.AccentGradientFrom, _Theme.AccentGradientTo)
	})
	local v408 = isMobile and 1 or 2
	local u409 = u379 * 0.5
	local u410 = u409 + v408

	local function v411(p146)
		return UDim2.new(p146, u410 * (1 - 2 * p146), 0.5, 0)
	end

	local Frame6 = v40("Frame", {
		Parent = Frame4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = v411(v404()),
		Size = UDim2.fromOffset(u379, u379),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0,
		ZIndex = 3
	})

	Frame6:SetAttribute("NoWindowSwipe", true)
	v40("UICorner", {
		Parent = Frame6,
		CornerRadius = UDim.new(1, 0)
	})
	v40("UIGradient", {
		Parent = Frame6,
		Rotation = 90,
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(232, 232, 240))
		})
	})

	local UIStroke2 = v40("UIStroke", {
		Parent = Frame6,
		Color = _Theme.AccentSolid,
		Thickness = v408,
		Transparency = 0,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	})
	local Frame7 = v40("Frame", {
		Parent = Frame6,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(u379, u379),
		BackgroundColor3 = _Theme.AccentSolid,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ZIndex = 2
	})

	v40("UICorner", {
		Parent = Frame7,
		CornerRadius = UDim.new(1, 0)
	})

	local Frame8 = v40("Frame", {
		Parent = Frame6,
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.new(0.5, 0, 0, u382),
		Size = UDim2.fromOffset(u380, u381),
		BackgroundColor3 = _Theme.HeaderBackground,
		BorderSizePixel = 0,
		Visible = false,
		ZIndex = 5
	})

	v40("UICorner", {
		Parent = Frame8,
		CornerRadius = sizing.CornerRadiusSmall
	})
	v40("UIStroke", {
		Parent = Frame8,
		Color = _Theme.Border,
		Thickness = 1
	})

	local TextLabel3 = v40("TextLabel", {
		Parent = Frame8,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamMedium,
		TextSize = sizing.CaptionFont,
		TextColor3 = _Theme.TextPrimary,
		Text = tostring(u371),
		ZIndex = 6
	})

	local function v417(p147)
		if Disabled then
			return
		end

		local v418 = Max - Min

		u371 = v54(v52(Min + v54((p147 - Frame4.AbsolutePosition.X - u410) / math.max(1, Frame4.AbsoluteSize.X - 2 * u410), 0, 1) * v418, Increment), Min, Max)

		local v419 = v404()

		Frame5.Size = UDim2.fromScale(v419, 1)
		Frame6.Position = v411(v419)

		local text = tostring(u371)
		local s6 = "%s%s"
		local format = ("%s%s").format
		local v423 = text
		local v424 = Suffix ~= "" and " " .. Suffix

		v401.Text = format(s6, v423, v424 or "")
		TextLabel3.Text = text
		v48(v366.Callback, u371)
	end

	local u425 = false

	Frame3.InputBegan:Connect(function(input)
		if Disabled then
			return
		end

		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			u425 = true
			Frame8.Visible = true
			v46(Frame6, t1.Smooth, {
				Size = UDim2.fromOffset(u379 + u383, u379 + u383)
			})
			v46(Frame7, t1.Smooth, {
				Size = UDim2.fromOffset(u379 + u385, u379 + u385),
				BackgroundTransparency = 0.55
			})
			v417(input.Position.X)
		elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
			local function v426()
				local TextBox = v40("TextBox", {
					Parent = Frame2,
					Size = UDim2.fromOffset(u386, u387),
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, 0, 0, 0),
					BackgroundColor3 = t4._Theme.CardBackground,
					BorderSizePixel = 0,
					Font = Enum.Font.Gotham,
					TextSize = sizing.CaptionFont,
					TextColor3 = t4._Theme.TextPrimary,
					Text = tostring(u371),
					ClearTextOnFocus = true
				})

				v40("UICorner", {
					Parent = TextBox,
					CornerRadius = sizing.CornerRadiusSmall
				})
				v40("UIStroke", {
					Parent = TextBox,
					Color = t4._Theme.AccentSolid,
					Thickness = v33(1.5, 1)
				})
				v40("UIPadding", {
					Parent = TextBox,
					PaddingLeft = UDim.new(0, u388),
					PaddingRight = UDim.new(0, u388)
				})
				TextBox:CaptureFocus()
				TextBox.FocusLost:Connect(function()
					local v428 = tonumber(TextBox.Text)

					if v428 then
						u371 = v54(v52(v428, Increment), Min, Max)

						local v429 = v404()

						Frame5.Size = UDim2.fromScale(v429, 1)
						Frame6.Position = v411(v429)
						v401.Text = ("%s%s"):format(tostring(u371), Suffix ~= "" and " " .. Suffix or "")
						v48(v366.Callback, u371)
					end

					TextBox:Destroy()
				end)
			end

			local Default = v366.Default or Min
			local v431 = v161
			local X = input.Position.X

			v431(X, input.Position.Y, {
				{
					Label = "Edit value…",
					Icon = "plus",
					Callback = v426
				},
				{
					Label = "Reset to default (" .. tostring(Default) .. ")",
					Icon = "refresh",
					Callback = function()
						u371 = v54(v52(Default, Increment), Min, Max)

						local v433 = v404()

						Frame5.Size = UDim2.fromScale(v433, 1)
						Frame6.Position = v411(v433)
						v401.Text = ("%s%s"):format(tostring(u371), Suffix ~= "" and " " .. Suffix or "")
						v48(v366.Callback, u371)
					end
				},
				{
					Label = "Copy value",
					Icon = "copy",
					Callback = function()
						if typeof(setclipboard) == "function" then
							pcall(setclipboard, tostring(u371))
						end
					end
				}
			})
		end
	end)
	Frame6.MouseEnter:Connect(function()
		if not u425 and not Disabled then
			v46(Frame6, t1.Default, {
				Size = UDim2.fromOffset(u379 + u384, u379 + u384)
			})
		end
	end)
	Frame6.MouseLeave:Connect(function()
		if not u425 then
			if not Disabled then
				v46(Frame6, t1.Default, {
					Size = UDim2.fromOffset(u379, u379)
				})
			end
		end
	end)
	Frame3.InputChanged:Connect(function(input)
		if not (input.UserInputType ~= Enum.UserInputType.MouseWheel or Disabled) then
			u371 = v54(v52(u371 + input.Position.Z * Increment, Increment), Min, Max)

			local v434 = v404()

			Frame5.Size = UDim2.fromScale(v434, 1)
			Frame6.Position = v411(v434)
			v401.Text = ("%s%s"):format(tostring(u371), Suffix ~= "" and " " .. Suffix or "")
			TextLabel3.Text = tostring(u371)
			v48(v366.Callback, u371)
		end
	end)
	v195(v5.InputChanged:Connect(function(input)
		if u425 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			v417(input.Position.X)
		end
	end))

	local function v435()
		if not u425 then
			return
		end

		u425 = false
		Frame8.Visible = false
		v46(Frame6, t1.SoftSpring, {
			Size = UDim2.fromOffset(u379, u379)
		})
		v46(Frame7, t1.Smooth, {
			Size = UDim2.fromOffset(u379, u379),
			BackgroundTransparency = 1
		})
	end

	v195(v5.InputEnded:Connect(function(input)
		if u425 and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			v435()
		end
	end))
	v195(v5.WindowFocusReleased:Connect(v435))

	if v366.Tooltip then
		v288(Frame2, v366.Tooltip)
	end

	local v436 = v196(function(p148)
		local TextDisabled = Disabled and p148.TextDisabled

		TextLabel2.TextColor3 = TextDisabled or p148.TextPrimary
		v401.TextColor3 = p148.TextSecondary
		Frame4.BackgroundColor3 = p148.CardBackground
		UIGradient.Color = ColorSequence.new(p148.AccentGradientFrom, p148.AccentGradientTo)
		UIStroke2.Color = p148.AccentSolid
		Frame7.BackgroundColor3 = p148.AccentSolid
		Frame8.BackgroundColor3 = p148.HeaderBackground
		TextLabel3.TextColor3 = p148.TextPrimary
	end)
	local v438 = v203(function(p149)
		v389(p149)
		u409 = u379 * 0.5
		u410 = u409 + v408
		Frame2.Size = UDim2.new(1, 0, 0, u374)
		TextLabel2.Size = UDim2.new(1, -(u376 + v33(4, 2)), 0, u375)
		TextLabel2.TextSize = p149.BodyFont
		v401.Size = UDim2.fromOffset(u376, u375)
		v401.TextSize = p149.CaptionFont
		Frame3.Position = UDim2.new(0, 0, 1, -u377)
		Frame3.Size = UDim2.new(1, 0, 0, u377)
		Frame4.Size = UDim2.new(1, 0, 0, u378)
		Frame6.Size = UDim2.fromOffset(u379, u379)
		Frame6.Position = v411(v404())
		Frame7.Size = UDim2.fromOffset(u379, u379)
		Frame8.Position = UDim2.new(0.5, 0, 0, u382)
		Frame8.Size = UDim2.fromOffset(u380, u381)
		TextLabel3.TextSize = p149.CaptionFont
	end)
	local t8

	t8 = {
		Set = function(p150, p151)
			u371 = v54(v52(p151, Increment), Min, Max)

			local v440 = v404()

			Frame5.Size = UDim2.fromScale(v440, 1)
			Frame6.Position = v411(v440)
			v401.Text = ("%s%s"):format(tostring(u371), Suffix ~= "" and " " .. Suffix or "")
			v48(v366.Callback, u371)
		end,
		Get = function()
			return u371
		end,
		GetState = function()
			return u371
		end,
		SetState = function(p152, p153)
			t8:Set(p153)
		end,
		SetMin = function(p154, p155)
			Min = p155
			t8:Set(u371)
		end,
		SetMax = function(p156, p157)
			Max = p157
			t8:Set(u371)
		end,
		SetDisabled = function(p158, p159)
			Disabled = p159
			v46(Frame4, t1.Default, {
				BackgroundTransparency = p159 and 0.5 or 0
			})
			v46(Frame5, t1.Default, {
				BackgroundTransparency = p159 and 0.5 or 0
			})
			v46(Frame6, t1.Default, {
				BackgroundTransparency = p159 and 0.5 or 0
			})
			TextLabel2.TextColor3 = p159 and t4._Theme.TextDisabled or t4._Theme.TextPrimary
			v401.TextColor3 = p159 and t4._Theme.TextDisabled or t4._Theme.TextSecondary
		end,
		Destroy = function()
			if v366.Flag then
				t4._Flags[v366.Flag] = nil
			end

			v436()
			v438()
			Frame2:Destroy()
		end
	}

	if v366.Flag then
		t4._Flags[v366.Flag] = t8
	end

	return t8
end
t6.AddLabel = function(p160, p161)
	local _Theme = t4._Theme
	local v442 = v40
	local s7 = "TextLabel"
	local v444 = v442(s7, {
		Parent = p160._Container,
		Size = UDim2.new(1, 0, 0, sizing.BodyFont + v33(6, 2)),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Font = Enum.Font.Gotham,
		TextSize = sizing.BodyFont,
		TextColor3 = _Theme.TextSecondary,
		Text = p161 or "",
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left
	})
	local v445 = v196(function(p162)
		v444.TextColor3 = p162.TextSecondary
	end)
	local v446 = v203(function(p163)
		v444.Size = UDim2.new(1, 0, 0, p163.BodyFont + v33(6, 2))
		v444.TextSize = p163.BodyFont
	end)

	return {
		SetText = function(p164, p165)
			v444.Text = p165
		end,
		Destroy = function()
			v445()
			v446()
			v444:Destroy()
		end
	}
end
t6.AddParagraph = function(p166, p167)
	local v447 = p167 or {}
	local _Theme = t4._Theme
	local Frame2 = v40("Frame", {
		Parent = p166._Container,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = _Theme.CardBackground,
		BorderSizePixel = 0
	})

	v40("UICorner", {
		Parent = Frame2,
		CornerRadius = sizing.CornerRadius
	})

	local UIStroke2 = v40("UIStroke", {
		Parent = Frame2,
		Color = _Theme.Border,
		Thickness = 1,
		Transparency = 0.4
	})

	v40("UIPadding", {
		Parent = Frame2,
		PaddingLeft = UDim.new(0, v33(12, 4)),
		PaddingRight = UDim.new(0, v33(12, 4)),
		PaddingTop = UDim.new(0, v33(10, 4)),
		PaddingBottom = UDim.new(0, v33(10, 4))
	})
	v40("UIListLayout", {
		Parent = Frame2,
		Padding = UDim.new(0, v33(4, 1)),
		SortOrder = Enum.SortOrder.LayoutOrder
	})

	local TextLabel2 = v40("TextLabel", {
		Parent = Frame2,
		Size = UDim2.new(1, 0, 0, sizing.BodyFont + v33(4, 2)),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamSemibold,
		TextSize = sizing.BodyFont,
		TextColor3 = _Theme.TextPrimary,
		Text = v447.Title or "",
		TextXAlignment = Enum.TextXAlignment.Left
	})
	local TextLabel3 = v40("TextLabel", {
		Parent = Frame2,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Font = Enum.Font.Gotham,
		TextSize = sizing.CaptionFont,
		TextColor3 = _Theme.TextSecondary,
		Text = v447.Content or "",
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left
	})
	local v453 = v196(function(p168)
		Frame2.BackgroundColor3 = p168.CardBackground
		UIStroke2.Color = p168.Border
		TextLabel2.TextColor3 = p168.TextPrimary
		TextLabel3.TextColor3 = p168.TextSecondary
	end)
	local v454 = v203(function(p169)
		TextLabel2.Size = UDim2.new(1, 0, 0, p169.BodyFont + v33(4, 2))
		TextLabel2.TextSize = p169.BodyFont
		TextLabel3.TextSize = p169.CaptionFont
	end)

	return {
		SetTitle = function(p170, p171)
			TextLabel2.Text = p171
		end,
		SetContent = function(p172, p173)
			TextLabel3.Text = p173
		end,
		Destroy = function()
			v453()
			v454()
			Frame2:Destroy()
		end
	}
end
t6.AddDivider = function(p174)
	local _Theme = t4._Theme
	local Frame2 = v40("Frame", {
		Parent = p174._Container,
		Size = UDim2.new(1, 0, 0, v33(18, 7)),
		BackgroundTransparency = 1
	})
	local Frame3 = v40("Frame", {
		Parent = Frame2,
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundColor3 = _Theme.Divider,
		BorderSizePixel = 0
	})

	v40("UIGradient", {
		Parent = Frame3,
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(0.2, 0),
			NumberSequenceKeypoint.new(0.8, 0),
			NumberSequenceKeypoint.new(1, 1)
		})
	})

	local v458 = v196(function(p175)
		Frame3.BackgroundColor3 = p175.Divider
	end)

	return {
		Destroy = function()
			v458()
			Frame2:Destroy()
		end
	}
end
t6.AddBanner = function(p176, p177)
	local v459 = p177 or {}
	local _Theme = t4._Theme
	local Type = v459.Type or "Info"
	local Info = _Theme[Type] or _Theme.Info
	local v463 = v33(14, 5)
	local v464 = v33(10, 4)
	local v465 = v33(3, 1)
	local v466 = v33(24, 10)
	local v467 = v33(16, 7)
	local v468 = v466 + v33(8, 3)
	local Frame2 = v40("Frame", {
		Parent = p176._Container,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = _Theme.CardBackground,
		BorderSizePixel = 0,
		ClipsDescendants = true
	})

	v40("UICorner", {
		Parent = Frame2,
		CornerRadius = sizing.CornerRadius
	})
	v40("UIPadding", {
		Parent = Frame2,
		PaddingLeft = UDim.new(0, v463),
		PaddingRight = UDim.new(0, v463),
		PaddingTop = UDim.new(0, v464),
		PaddingBottom = UDim.new(0, v464)
	})

	local Frame3 = v40("Frame", {
		Parent = Frame2,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, -v463, 0.5, 0),
		Size = UDim2.new(0, v465, 1, 0),
		BackgroundColor3 = Info,
		BorderSizePixel = 0
	})
	local Frame4 = v40("Frame", {
		Parent = Frame2,
		Size = UDim2.fromOffset(v466, v466),
		Position = UDim2.fromOffset(0, 0),
		BackgroundColor3 = Info,
		BackgroundTransparency = 0.78,
		BorderSizePixel = 0
	})

	v40("UICorner", {
		Parent = Frame4,
		CornerRadius = UDim.new(0, v33(6, 2))
	})

	local Frame5 = v40("Frame", {
		Parent = Frame4,
		Size = UDim2.fromOffset(v467, v467),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		BackgroundTransparency = 1
	})

	v95(Frame5, ({
		Info = "info",
		Success = "check-circle",
		Warning = "warning",
		Danger = "error"
	})[Type] or "info", v467, Info)

	local TextLabel2 = v40("TextLabel", {
		Parent = Frame2,
		Position = UDim2.fromOffset(v468, 0),
		Size = UDim2.new(1, -v468, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Font = Enum.Font.Gotham,
		TextSize = sizing.CaptionFont + 1,
		TextColor3 = _Theme.TextPrimary,
		Text = v459.Text or "",
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left
	})
	local v474 = v196(function(p178)
		Info = p178[Type] or p178.Info
		Frame2.BackgroundColor3 = p178.CardBackground
		Frame3.BackgroundColor3 = Info
		Frame4.BackgroundColor3 = Info
		TextLabel2.TextColor3 = p178.TextPrimary
		v119(Frame5, Info)
	end)

	return {
		SetText = function(p179, p180)
			TextLabel2.Text = p180
		end,
		Destroy = function()
			v474()
			Frame2:Destroy()
		end
	}
end
t6.SetTitle = function(p181, p182)
	if p181._Title then
		p181._Title.Text = string.upper(p182)
	end
end
t6.Destroy = function(p183)
	if p183._Unsubscribe then
		p183._Unsubscribe()
	end

	if p183._SizUnsub then
		p183._SizUnsub()
	end

	p183._Frame:Destroy()
end

local function v475(p184, p185, p186)
	local _Theme = t4._Theme
	local _LeftCol = p186 == "Left" and p184._LeftCol or p186 == "Right" and p184._RightCol or p184._FullCol
	local obj = setmetatable({}, t6)
	local Frame2 = v40("Frame", {
		Parent = _LeftCol,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1
	})
	local UIListLayout = v40("UIListLayout", {
		Parent = Frame2,
		Padding = UDim.new(0, sizing.ElementSpacing),
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	local Frame3 = v40("Frame", {
		Parent = Frame2,
		LayoutOrder = 0,
		Size = UDim2.new(1, 0, 0, sizing.SectionFont + v33(8, 3)),
		BackgroundTransparency = 1
	})
	local Frame4 = v40("Frame", {
		Parent = Frame3,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.fromOffset(v33(3, 1), sizing.SectionFont + v33(2, 1)),
		BackgroundColor3 = _Theme.AccentSolid,
		BorderSizePixel = 0
	})

	v40("UICorner", {
		Parent = Frame4,
		CornerRadius = UDim.new(1, 0)
	})

	local TextLabel2 = v40("TextLabel", {
		Parent = Frame3,
		Position = UDim2.fromOffset(v33(10, 4), 0),
		Size = UDim2.new(1, -v33(10, 4), 1, 0),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBold,
		TextSize = sizing.SectionFont + 1,
		TextColor3 = _Theme.TextPrimary,
		Text = string.upper(p185 or "Section"),
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd
	})
	local Frame5 = v40("Frame", {
		Parent = Frame2,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = 2
	})
	local UIListLayout2 = v40("UIListLayout", {
		Parent = Frame5,
		Padding = UDim.new(0, sizing.ElementSpacing),
		SortOrder = Enum.SortOrder.LayoutOrder
	})

	obj._Frame = Frame2
	obj._Title = TextLabel2
	obj._Container = Frame5
	obj._Unsubscribe = v196(function(p187)
		TextLabel2.TextColor3 = p187.TextPrimary
		Frame4.BackgroundColor3 = p187.AccentSolid
	end)
	obj._SizUnsub = v203(function(p188)
		Frame3.Size = UDim2.new(1, 0, 0, p188.SectionFont + v33(8, 3))
		Frame4.Size = UDim2.fromOffset(v33(3, 1), p188.SectionFont + v33(2, 1))
		TextLabel2.Position = UDim2.fromOffset(v33(10, 4), 0)
		TextLabel2.Size = UDim2.new(1, -v33(10, 4), 1, 0)
		TextLabel2.TextSize = p188.SectionFont + 1
		UIListLayout.Padding = UDim.new(0, p188.ElementSpacing)
		UIListLayout2.Padding = UDim.new(0, p188.ElementSpacing)
	end)

	return obj
end

t6.AddInput = function(p189, p190)
	local v486 = p190 or {}
	local _Theme = t4._Theme
	local Default = v486.Default or ""
	local Password = v486.Password or false
	local Frame2 = v40("Frame", {
		Parent = p189._Container,
		Size = UDim2.new(1, 0, 0, sizing.InputHeight + sizing.BodyFont + v33(10, 3)),
		BackgroundTransparency = 1
	})

	Frame2:SetAttribute("NoWindowSwipe", true)

	local TextLabel2 = v40("TextLabel", {
		Parent = Frame2,
		Size = UDim2.new(1, 0, 0, sizing.BodyFont + v33(4, 2)),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamMedium,
		TextSize = sizing.BodyFont,
		TextColor3 = _Theme.TextPrimary,
		Text = v486.Text or "Input",
		TextXAlignment = Enum.TextXAlignment.Left
	})
	local Frame3 = v40("Frame", {
		Parent = Frame2,
		Position = UDim2.new(0, 0, 0, sizing.BodyFont + v33(8, 3)),
		Size = UDim2.new(1, 0, 0, sizing.InputHeight),
		BackgroundColor3 = _Theme.CardBackground,
		BorderSizePixel = 0
	})

	v40("UICorner", {
		Parent = Frame3,
		CornerRadius = sizing.CornerRadius
	})

	local UIStroke2 = v40("UIStroke", {
		Parent = Frame3,
		Color = _Theme.Border,
		Thickness = 1
	})
	local UIStroke3 = v40("UIStroke", {
		Parent = Frame3,
		Color = _Theme.AccentSolid,
		Thickness = 0,
		Transparency = 0.5,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	})
	local v495 = v33(12, 4)

	if v486.IconLeft then
		local MobileScale = isMobile and (sizing.MobileScale or 1) or 1
		local v497 = isMobile and math.max(8, math.floor(18 * MobileScale + 0.5)) or 18
		local v498 = isMobile and math.max(5, math.floor(12 * MobileScale + 0.5)) or 12

		v95(v40("Frame", {
			Parent = Frame3,
			Size = UDim2.fromOffset(v497, v497),
			Position = UDim2.new(0, v498, 0.5, -math.floor(v497 / 2)),
			BackgroundTransparency = 1
		}), v486.IconLeft, v497, _Theme.TextSecondary)
		v495 = v498 + v497 + math.max(5, math.floor(8 * MobileScale + 0.5))
	end

	local MobileScale = isMobile and (sizing.MobileScale or 1) or 1
	local v500 = isMobile and math.max(9, math.floor(22 * MobileScale + 0.5)) or 22
	local v501 = math.max(6, math.floor(v500 * 0.64 + 0.5))
	local v502 = math.floor((v500 - v501) / 2)
	local v503 = isMobile and math.max(3, math.floor(8 * MobileScale + 0.5)) or 8
	local v504 = v503 + v500 + math.max(4, math.floor(6 * MobileScale + 0.5))
	local TextBox = v40("TextBox", {
		Parent = Frame3,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.fromOffset(v495, 0),
		Size = UDim2.new(1, -v495 - v504, 1, 0),
		Font = Enum.Font.Gotham,
		TextSize = sizing.BodyFont,
		TextColor3 = _Theme.TextPrimary,
		PlaceholderText = v486.Placeholder or "",
		PlaceholderColor3 = _Theme.TextPlaceholder,
		Text = Password and string.rep("•", #Default) or Default,
		ClearTextOnFocus = v486.ClearOnFocus or false,
		TextXAlignment = Enum.TextXAlignment.Left
	})
	local TextButton = v40("TextButton", {
		Parent = Frame3,
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -v503, 0.5, 0),
		Size = UDim2.fromOffset(v500, v500),
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Text = "",
		Visible = false
	})

	v40("UICorner", {
		Parent = TextButton,
		CornerRadius = UDim.new(1, 0)
	})

	local v507 = v95(TextButton, "close", v501, _Theme.TextSecondary)

	v507.Position = UDim2.fromOffset(v502, v502)
	TextButton.MouseButton1Click:Connect(function()
		TextBox.Text = ""
		Default = ""
		v48(v486.Callback, "")
	end)

	local TextLabel3

	if v486.ShowCounter and v486.MaxLength then
		TextLabel3 = v40("TextLabel", {
			Parent = Frame2,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 0, 0, 0),
			Size = UDim2.fromOffset(v33(60, 24), sizing.BodyFont + v33(4, 2)),
			BackgroundTransparency = 1,
			Font = Enum.Font.Gotham,
			TextSize = sizing.CaptionFont,
			TextColor3 = _Theme.TextSecondary,
			TextXAlignment = Enum.TextXAlignment.Right,
			Text = ("%d/%d"):format(#Default, v486.MaxLength)
		})
	end

	local function v509()
		if Password then
			TextBox.Text = string.rep("•", #Default)
		end

		TextButton.Visible = #TextBox.Text > 0 and not v486.HideClear

		if TextLabel3 then
			TextLabel3.Text = ("%d/%d"):format(#Default, v486.MaxLength)
		end
	end

	TextBox.Focused:Connect(function()
		v46(UIStroke2, t1.FocusRing, {
			Color = t4._Theme.AccentSolid,
			Thickness = v33(1.5, 1)
		})
		v46(UIStroke3, t1.FocusRing, {
			Thickness = v33(3, 1),
			Transparency = 0.65
		})
	end)
	TextBox.FocusLost:Connect(function(enterPressed)
		v46(UIStroke2, t1.FocusRing, {
			Color = t4._Theme.Border,
			Thickness = 1
		})
		v46(UIStroke3, t1.FocusRing, {
			Thickness = 0,
			Transparency = 1
		})

		if v486.MaxLength and v486.MaxLength < #TextBox.Text then
			TextBox.Text = TextBox.Text:sub(1, v486.MaxLength)
		end

		if v486.Numeric and not tonumber(TextBox.Text) then
			TextBox.Text = tostring(tonumber(Default) or 0)
		end

		if v486.Validator then
			local v510, v511 = v486.Validator(TextBox.Text)

			if not v510 then
				v46(UIStroke2, t1.FocusRing, {
					Color = t4._Theme.Danger,
					Thickness = v33(1.5, 1)
				})

				if v511 then
					v286(Frame3, v511)
					task.delay(2, function()
						if Frame3.Parent then
							v287()
						end
					end)
				end

				return
			end
		end

		Default = TextBox.Text

		if not v486.OnEnter then
			v48(v486.Callback, Default)
		elseif enterPressed then
			v48(v486.Callback, Default)
		end

		v509()
	end)
	TextBox:GetPropertyChangedSignal("Text"):Connect(function()
		if v486.MaxLength then
			if v486.MaxLength < #TextBox.Text then
				TextBox.Text = TextBox.Text:sub(1, v486.MaxLength)
			end
		end

		if not v486.OnEnter and not Password then
			Default = TextBox.Text
			v48(v486.Callback, Default)
		end

		v509()
	end)
	v509()

	if v486.Tooltip then
		v288(Frame2, v486.Tooltip)
	end

	local v512 = v196(function(p191)
		TextLabel2.TextColor3 = p191.TextPrimary
		Frame3.BackgroundColor3 = p191.CardBackground
		TextBox.TextColor3 = p191.TextPrimary
		TextBox.PlaceholderColor3 = p191.TextPlaceholder
		UIStroke2.Color = p191.Border
		UIStroke3.Color = p191.AccentSolid
		v119(v507, p191.TextSecondary)

		if TextLabel3 then
			TextLabel3.TextColor3 = p191.TextSecondary
		end
	end)
	local v513 = v203(function(p192)
		Frame2.Size = UDim2.new(1, 0, 0, p192.InputHeight + p192.BodyFont + v33(10, 3))
		TextLabel2.Size = UDim2.new(1, 0, 0, p192.BodyFont + v33(4, 2))
		TextLabel2.TextSize = p192.BodyFont
		Frame3.Position = UDim2.new(0, 0, 0, p192.BodyFont + v33(8, 3))
		Frame3.Size = UDim2.new(1, 0, 0, p192.InputHeight)
		TextBox.TextSize = p192.BodyFont
	end)
	local t9 = {
		Set = function(p193, p194)
			Default = tostring(p194)
			TextBox.Text = Default
			v509()
			v48(v486.Callback, Default)
		end,
		Get = function()
			return Default
		end,
		GetState = function()
			return Default
		end,
		SetState = function(p195, p196)
			TextBox.Text = tostring(p196 or "")
			Default = TextBox.Text
			v509()
		end,
		Destroy = function()
			if v486.Flag then
				t4._Flags[v486.Flag] = nil
			end

			v512()
			v513()
			Frame2:Destroy()
		end
	}

	if v486.Flag then
		t4._Flags[v486.Flag] = t9
	end

	return t9
end

local t10 = {
	LeftControl = "Ctrl",
	RightControl = "Ctrl",
	LeftShift = "Shift",
	RightShift = "Shift",
	LeftAlt = "Alt",
	RightAlt = "Alt",
	LeftMeta = "Cmd",
	RightMeta = "Cmd",
	Return = "Enter",
	KeypadEnter = "Enter",
	Escape = "Esc",
	Backspace = "←",
	Space = "Space",
	Tab = "Tab"
}

local function v516(p197)
	return t10[p197.Name] or p197.Name
end

t6.AddKeybind = function(p198, p199)
	local v517 = p199 or {}
	local _Theme = t4._Theme
	local Default = v517.Default
	local Mode = v517.Mode or "Toggle"
	local u521 = false
	local u522 = v33(96, 34)
	local u523 = v33(28, 12)
	local u524 = v33(14, 4)
	local Frame2 = v40("Frame", {
		Parent = p198._Container,
		Size = UDim2.new(1, 0, 0, sizing.ButtonHeight),
		BackgroundTransparency = 1
	})

	Frame2:SetAttribute("NoWindowSwipe", true)

	local v526 = v40
	local s8 = "TextLabel"
	local t11 = {
		Parent = Frame2,
		Size = UDim2.new(1, -(u522 + u524), 1, 0),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamMedium,
		TextSize = sizing.BodyFont,
		TextColor3 = _Theme.TextPrimary,
		Text = v517.Text or "Keybind"
	}

	t11.TextXAlignment = Enum.TextXAlignment.Left
	t11.TextTruncate = Enum.TextTruncate.AtEnd

	local v529 = v526(s8, t11)
	local TextButton = v40("TextButton", {
		Parent = Frame2,
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -v33(2, 1), 0.5, 0),
		Size = UDim2.fromOffset(u522, u523),
		BackgroundColor3 = _Theme.CardBackground,
		BorderSizePixel = 0,
		Font = Enum.Font.GothamMedium,
		TextSize = sizing.CaptionFont,
		TextColor3 = _Theme.TextPrimary,
		Text = Default and v516(Default) or "None",
		AutoButtonColor = false
	})

	v40("UICorner", {
		Parent = TextButton,
		CornerRadius = sizing.CornerRadiusSmall
	})

	local UIStroke2 = v40("UIStroke", {
		Parent = TextButton,
		Color = _Theme.Border,
		Thickness = 1
	})
	local u532

	local function v533()
		if u532 then
			return
		end

		local thread2

		thread2 = task.spawn(function()
			local n7 = 0

			while u521 and u532 == thread2 and UIStroke2.Parent do
				n7 += 0.05
				UIStroke2.Transparency = 0.4 + math.abs(math.sin(n7 * 4)) * 0.4
				task.wait(0.05)
			end

			if UIStroke2.Parent then
				UIStroke2.Transparency = 0
			end
		end)
		u532 = thread2
	end
	local function v536()
		u521 = false
		u532 = nil

		if UIStroke2.Parent then
			UIStroke2.Transparency = 0
		end
	end

	TextButton.MouseButton1Click:Connect(function()
		u521 = true
		TextButton.Text = "Press key…"
		v46(UIStroke2, t1.Default, {
			Color = t4._Theme.AccentSolid
		})
		v533()
		v286(TextButton, "Esc: cancel · Backspace: clear")
		task.delay(2, function()
			if u521 and TextButton.Parent then
				v287()
			end
		end)
	end)
	TextButton.MouseButton2Click:Connect(function()
		if not u521 then
			Default = nil
			TextButton.Text = "None"
		end
	end)
	v195(v5.InputBegan:Connect(function(input, gameProcessed)
		if not u521 then
			if not gameProcessed and Default and input.KeyCode == Default then
				if Mode == "Toggle" or Mode == "Always" then
					v48(v517.Callback)
				end

				if Mode == "Hold" then
					v48(v517.Callback, true)
				end
			end
		elseif input.UserInputType == Enum.UserInputType.Keyboard then
			if input.KeyCode == Enum.KeyCode.Escape then
				v536()
				TextButton.Text = Default and v516(Default) or "None"
				v46(UIStroke2, t1.Default, {
					Color = t4._Theme.Border
				})

				return
			end

			if input.KeyCode == Enum.KeyCode.Backspace then
				v536()
				Default = nil
				TextButton.Text = "None"
				v46(UIStroke2, t1.Default, {
					Color = t4._Theme.Border
				})

				return
			end

			Default = input.KeyCode
			v536()
			TextButton.Text = v516(Default)
			v46(UIStroke2, t1.Default, {
				Color = t4._Theme.Border
			})
			v48(v517.OnChange, Default)
		end
	end))
	v195(v5.InputEnded:Connect(function(input)
		if Mode == "Hold" and Default and input.KeyCode == Default then
			v48(v517.Callback, false)
		end
	end))

	if v517.Tooltip then
		v288(Frame2, v517.Tooltip)
	end

	local v537 = v196(function(p200)
		v529.TextColor3 = p200.TextPrimary
		TextButton.BackgroundColor3 = p200.CardBackground
		TextButton.TextColor3 = p200.TextPrimary

		if not u521 then
			UIStroke2.Color = p200.Border
		end
	end)
	local v538 = v203(function(p201)
		local v539 = v33(96, 34)
		local v540 = v33(28, 12)

		u522 = v539
		u523 = v540
		u524 = v33(14, 4)
		Frame2.Size = UDim2.new(1, 0, 0, p201.ButtonHeight)
		v529.Size = UDim2.new(1, -(u522 + u524), 1, 0)
		v529.TextSize = p201.BodyFont
		TextButton.Position = UDim2.new(1, -v33(2, 1), 0.5, 0)
		TextButton.Size = UDim2.fromOffset(u522, u523)
		TextButton.TextSize = p201.CaptionFont
	end)
	local t12

	t12 = {
		Set = function(p202, p203)
			if type(p203) == "string" then
				p203 = Enum.KeyCode[p203]
			end

			Default = p203
			TextButton.Text = Default and v516(Default) or "None"
		end,
		Get = function()
			return Default
		end,
		GetState = function()
			return Default and Default.Name or nil
		end,
		SetState = function(p204, p205)
			if p205 and Enum.KeyCode[p205] then
				t12:Set(Enum.KeyCode[p205])
			end
		end,
		Destroy = function()
			if v517.Flag then
				t4._Flags[v517.Flag] = nil
			end

			v537()
			v538()
			Frame2:Destroy()
		end
	}

	if v517.Flag then
		t4._Flags[v517.Flag] = t12
	end

	return t12
end

local function v542(p206, p207, p208)
	local v543 = p207 or {}
	local _Theme = t4._Theme
	local Options = v543.Options or {}
	local v546

	if v543.Searchable == nil then
		v546 = #Options >= 6
	else
		v546 = v543.Searchable and true or false
	end

	local Max = v543.Max
	local t13

	if p208 then
		t13 = {}

		if v543.Default then
			for _, v in ipairs(v543.Default) do
				t13[v] = true
			end
		end
	else
		t13 = v543.Default
	end

	local u551 = v33(12, 4)
	local u552 = v33(16, 7)
	local u553 = v33(10, 4)
	local u554 = v33(6, 2)
	local u555 = v33(2, 1)
	local u556 = v33(30, 12)
	local u557 = v33(30, 12)
	local Frame2 = v40("Frame", {
		Parent = p206._Container,
		Size = UDim2.new(1, 0, 0, sizing.InputHeight + sizing.BodyFont + v33(10, 3)),
		BackgroundTransparency = 1
	})

	Frame2:SetAttribute("NoWindowSwipe", true)

	local TextLabel2 = v40("TextLabel", {
		Parent = Frame2,
		Size = UDim2.new(1, 0, 0, sizing.BodyFont + v33(4, 2)),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamMedium,
		TextSize = sizing.BodyFont,
		TextColor3 = _Theme.TextPrimary,
		Text = v543.Text or "Dropdown",
		TextXAlignment = Enum.TextXAlignment.Left
	})
	local TextButton = v40("TextButton", {
		Parent = Frame2,
		Position = UDim2.new(0, 0, 0, sizing.BodyFont + v33(8, 3)),
		Size = UDim2.new(1, 0, 0, sizing.InputHeight),
		BackgroundColor3 = _Theme.CardBackground,
		BorderSizePixel = 0,
		Font = Enum.Font.Gotham,
		TextSize = sizing.BodyFont,
		TextColor3 = _Theme.TextPrimary,
		Text = "",
		AutoButtonColor = false
	})

	TextButton:SetAttribute("NoWindowSwipe", true)
	v40("UICorner", {
		Parent = TextButton,
		CornerRadius = sizing.CornerRadius
	})
	v67(TextButton)

	local UIStroke2 = v40("UIStroke", {
		Parent = TextButton,
		Color = _Theme.Border,
		Thickness = 1
	})
	local TextLabel3 = v40("TextLabel", {
		Parent = TextButton,
		Size = UDim2.new(1, -(u551 + u552 + u553 + v33(8, 2)), 1, 0),
		Position = UDim2.fromOffset(u551, 0),
		BackgroundTransparency = 1,
		Font = Enum.Font.Gotham,
		TextSize = sizing.BodyFont,
		TextColor3 = _Theme.TextPrimary,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd
	})
	local Frame3 = v40("Frame", {
		Parent = TextButton,
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -u553, 0.5, 0),
		Size = UDim2.fromOffset(u552, u552),
		BackgroundTransparency = 1
	})
	local v564 = v95(Frame3, "chevron-down", u552, _Theme.TextSecondary)
	local Frame4 = v40("Frame", {
		Parent = v238,
		BackgroundTransparency = 1,
		Visible = false,
		ZIndex = 50,
		Size = UDim2.fromOffset(v33(220, 90), v33(200, 80))
	})

	Frame4:SetAttribute("NoWindowSwipe", true)

	local ImageLabel = v40("ImageLabel", {
		Parent = Frame4,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, v33(8, 3)),
		Size = UDim2.new(1, v33(36, 12), 1, v33(36, 12)),
		BackgroundTransparency = 1,
		Image = "rbxassetid://6014261993",
		ImageColor3 = Color3.new(0, 0, 0),
		ImageTransparency = 0.45,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(49, 49, 450, 450),
		ZIndex = 49
	})
	local Frame5 = v40("Frame", {
		Parent = Frame4,
		BackgroundColor3 = _Theme.CardBackground,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ZIndex = 50,
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromScale(0, 0)
	})

	Frame5:SetAttribute("NoWindowSwipe", true)
	v40("UICorner", {
		Parent = Frame5,
		CornerRadius = sizing.CornerRadius
	})

	local UIStroke3 = v40("UIStroke", {
		Parent = Frame5,
		Color = _Theme.Border,
		Thickness = 1,
		Transparency = 0.3
	})
	local TextBox
	local Frame6
	local Frame7
	local UIStroke4

	if v546 then
		Frame7 = v40("Frame", {
			Parent = Frame5,
			Name = "SearchWrap",
			Position = UDim2.fromOffset(u554, u554),
			Size = UDim2.new(1, -u554 * 2, 0, u556),
			BackgroundColor3 = _Theme.WindowBackground,
			BorderSizePixel = 0,
			ZIndex = 51
		})
		v40("UICorner", {
			Parent = Frame7,
			CornerRadius = sizing.CornerRadiusSmall
		})
		UIStroke4 = v40("UIStroke", {
			Parent = Frame7,
			Color = _Theme.Border,
			Thickness = 1,
			Transparency = 0.5
		})
		Frame6 = v40("Frame", {
			Parent = Frame7,
			Size = UDim2.fromOffset(v33(14, 6), v33(14, 6)),
			Position = UDim2.new(0, v33(10, 3), 0.5, -math.floor(v33(14, 6) / 2)),
			BackgroundTransparency = 1,
			ZIndex = 52
		})
		v95(Frame6, "search", v33(14, 6), _Theme.TextSecondary)
		TextBox = v40("TextBox", {
			Parent = Frame7,
			Position = UDim2.fromOffset(v33(30, 12), 0),
			Size = UDim2.new(1, -v33(38, 16), 1, 0),
			BackgroundTransparency = 1,
			Font = Enum.Font.Gotham,
			TextSize = sizing.CaptionFont,
			TextColor3 = _Theme.TextPrimary,
			PlaceholderText = "Search…",
			PlaceholderColor3 = _Theme.TextPlaceholder,
			Text = "",
			ClearTextOnFocus = false,
			ZIndex = 52,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	end

	local u573 = v546 and u556 + v33(12, 4) or u554
	local ScrollingFrame = v40("ScrollingFrame", {
		Parent = Frame5,
		Position = UDim2.fromOffset(0, u573),
		Size = UDim2.new(1, 0, 1, -u573 - u554),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = math.max(isMobile and 2 or 4, sizing.ScrollbarThickness - (isMobile and 0 or 2)),
		ScrollBarImageColor3 = _Theme.ScrollbarThumb,
		CanvasSize = UDim2.fromOffset(0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ZIndex = 51
	})

	v40("UIListLayout", {
		Parent = ScrollingFrame,
		Padding = UDim.new(0, u555),
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	v40("UIPadding", {
		Parent = ScrollingFrame,
		PaddingLeft = UDim.new(0, v33(4, 2)),
		PaddingRight = UDim.new(0, v33(4, 2)),
		PaddingTop = UDim.new(0, u555),
		PaddingBottom = UDim.new(0, v33(4, 2))
	})

	local n8 = 24
	local TextLabel4 = v40("TextLabel", {
		Parent = Frame5,
		Position = UDim2.fromOffset(0, u573),
		Size = UDim2.new(1, 0, 0, v33(60, n8)),
		BackgroundTransparency = 1,
		Font = Enum.Font.Gotham,
		TextSize = sizing.CaptionFont,
		TextColor3 = _Theme.TextSecondary,
		Text = "No matching options",
		Visible = false,
		ZIndex = 51
	})
	local t14 = {}

	local function v578(p209)
		local v579

		if p208 then
			v579 = t13[p209.OptName]
		else
			v579 = t13 == p209.OptName
		end

		local Hovered = p209.Hovered

		if v579 then
			p209.Indicator.Visible = true
			v46(p209.Btn, t1.Fast, {
				BackgroundTransparency = 0.78,
				BackgroundColor3 = t4._Theme.AccentSolid
			})
			p209.Label.TextColor3 = t4._Theme.TextPrimary
			p209.Label.Font = Enum.Font.GothamMedium

			if p209.Check then
				p209.Check.Visible = true
			end
		elseif Hovered then
			p209.Indicator.Visible = false
			v46(p209.Btn, t1.Fast, {
				BackgroundTransparency = 0,
				BackgroundColor3 = t4._Theme.CardBackgroundHover
			})
			p209.Label.TextColor3 = t4._Theme.TextPrimary
			p209.Label.Font = Enum.Font.Gotham

			if p209.Check then
				p209.Check.Visible = false
			end
		else
			p209.Indicator.Visible = false
			v46(p209.Btn, t1.Fast, {
				BackgroundTransparency = 1
			})
			p209.Label.TextColor3 = t4._Theme.TextPrimary
			p209.Label.Font = Enum.Font.Gotham

			if p209.Check then
				p209.Check.Visible = false
			end
		end
	end
	local function v581()
		if p208 then
			local t15 = {}

			for k, v in pairs(t13) do
				if v then
					table.insert(t15, k)
				end
			end

			if #t15 == 0 then
				TextLabel3.Text = v543.Placeholder or "Select…"
				TextLabel3.TextColor3 = t4._Theme.TextPlaceholder
			elseif #t15 <= 2 then
				TextLabel3.Text = table.concat(t15, ", ")
				TextLabel3.TextColor3 = t4._Theme.TextPrimary
			else
				TextLabel3.Text = ("%s, %s (+%d)"):format(t15[1], t15[2], #t15 - 2)
				TextLabel3.TextColor3 = t4._Theme.TextPrimary
			end
		else
			TextLabel3.Text = t13 and tostring(t13) or v543.Placeholder or "Select…"
			TextLabel3.TextColor3 = t13 and t4._Theme.TextPrimary or t4._Theme.TextPlaceholder
		end

		for _, v in ipairs(t14) do
			v578(v)
		end
	end

	local v587

	local function v588(p210)
		local v589 = t14

		t14 = {}

		for _, v in ipairs(v589) do
			v.Btn:Destroy()
		end

		local n9 = 0

		for _, Option in ipairs(Options) do
			if not p210 or p210 == "" or string.find(string.lower(tostring(Option)), string.lower(p210), 1, true) then
				n9 += 1

				local TextButton2 = v40("TextButton", {
					Parent = ScrollingFrame,
					Size = UDim2.new(1, 0, 0, u557),
					BackgroundColor3 = t4._Theme.AccentSolid,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Text = "",
					AutoButtonColor = false,
					LayoutOrder = n9,
					ZIndex = 52,
					ClipsDescendants = true
				})

				v40("UICorner", {
					Parent = TextButton2,
					CornerRadius = sizing.CornerRadiusSmall
				})

				local Frame8 = v40("Frame", {
					Parent = TextButton2,
					Size = UDim2.fromOffset(v33(3, 1), math.max(3, u557 - v33(12, 4))),
					Position = UDim2.fromOffset(v33(4, 1), v33(6, 2)),
					BackgroundColor3 = t4._Theme.AccentSolid,
					BorderSizePixel = 0,
					Visible = false,
					ZIndex = 53
				})

				v40("UICorner", {
					Parent = Frame8,
					CornerRadius = UDim.new(1, 0)
				})

				local v597

				if p208 then
					local v598 = v33(16, 7)
					local v599 = v33(22, 8)
					local Frame9 = v40("Frame", {
						Parent = TextButton2,
						Size = UDim2.fromOffset(v598, v598),
						Position = UDim2.new(1, -v599, 0.5, -math.floor(v598 / 2)),
						BackgroundTransparency = 1,
						ZIndex = 53,
						Visible = false
					})

					v95(Frame9, "check", v598, t4._Theme.AccentSolid)
					v597 = Frame9
				end

				local v601 = v33(14, 4)
				local t16 = {
					Btn = TextButton2,
					OptName = Option,
					Label = v40("TextLabel", {
						Parent = TextButton2,
						Size = UDim2.new(1, -(p208 and v33(38, 16) or v33(18, 8)), 1, 0),
						Position = UDim2.fromOffset(v601, 0),
						BackgroundTransparency = 1,
						Font = Enum.Font.Gotham,
						TextSize = sizing.CaptionFont,
						TextColor3 = t4._Theme.TextPrimary,
						Text = tostring(Option),
						TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd,
						ZIndex = 53
					}),
					Indicator = Frame8,
					Check = v597,
					Hovered = false
				}

				table.insert(t14, t16)
				TextButton2.MouseEnter:Connect(function()
					t16.Hovered = true
					v578(t16)
				end)
				TextButton2.MouseLeave:Connect(function()
					t16.Hovered = false
					v578(t16)
				end)
				TextButton2.MouseButton1Down:Connect(function(x, y)
					v122(TextButton2, x, y, t4._Theme.AccentSolid)
				end)
				TextButton2.MouseButton1Click:Connect(function()
					if p208 then
						if t13[Option] then
							t13[Option] = nil
						else
							local n10 = 0

							for _, v in pairs(t13) do
								if v then
									n10 += 1
								end
							end

							if Max and Max <= n10 then
								return
							end

							t13[Option] = true
						end

						v581()

						local t17 = {}

						for k, v in pairs(t13) do
							if v then
								table.insert(t17, k)
							end
						end

						v48(v543.Callback, t17)
					else
						t13 = Option
						v581()
						v48(v543.Callback, t13)

						if v587 then
							v587()
						end
					end
				end)
			end
		end

		TextLabel4.Visible = #t14 == 0
	end

	local u609 = false

	local function v610()
		local v611 = math.min(8 * (u557 + u555), math.max(1, #t14) * (u557 + u555)) + u554

		if #t14 == 0 then
			v611 = v33(60, 24)
		end

		return u573 + v611 + u554
	end
	local function v612()
		local Parent = Frame4.Parent

		if not Parent then
			return
		end

		local AbsolutePosition = TextButton.AbsolutePosition
		local AbsoluteSize = TextButton.AbsoluteSize
		local Y = Frame2.AbsolutePosition.Y
		local v617 = Frame2.AbsolutePosition.Y + Frame2.AbsoluteSize.Y
		local AbsoluteSize2 = Parent.AbsoluteSize
		local v619 = v610()
		local v620 = v33(12, 4)
		local v621 = v33(8, 3)
		local v622 = AbsoluteSize2.Y - (v617 + v620)
		local v623 = Y - v620
		local v624 = math.max(AbsoluteSize.X, v33(180, 80))
		local v625 = math.min(AbsolutePosition.X, AbsoluteSize2.X - v624 - v621)
		local v626 = math.max(v621, v625)
		local v627

		if v33(80, 32) <= v622 or v623 <= v622 then
			v627 = math.min(v619, v622 - v620)

			if v627 < v33(60, 24) then
				v627 = math.min(v619, v33(60, 24))
			end

			Frame4.AnchorPoint = Vector2.new(0, 0)
			Frame4.Position = UDim2.fromOffset(v626, v617 + v620)
		else
			v627 = math.min(v619, v623 - v620)

			if v627 < v33(60, 24) then
				v627 = math.min(v619, v33(60, 24))
			end

			Frame4.AnchorPoint = Vector2.new(0, 1)
			Frame4.Position = UDim2.fromOffset(v626, Y - v620)
		end

		return v624, v627
	end
	local function v628()
		if not u609 then
			return
		end

		u609 = false
		v46(Frame5, t1.Default, {
			BackgroundTransparency = 1
		})
		v46(UIStroke3, t1.Default, {
			Transparency = 1
		})
		v46(ImageLabel, t1.Default, {
			ImageTransparency = 1
		})
		v46(Frame4, t1.Default, {
			Size = UDim2.fromOffset(Frame4.AbsoluteSize.X, 0)
		})
		v46(Frame3, t1.Chevron, {
			Rotation = 0
		})
		v46(UIStroke2, t1.Default, {
			Color = t4._Theme.Border,
			Thickness = 1
		})
		task.delay(0.2, function()
			if not u609 then
				Frame4.Visible = false
				Frame5.BackgroundTransparency = 0
				UIStroke3.Transparency = 0.3
				ImageLabel.ImageTransparency = 0.45
			end
		end)

		for i, openPopup in ipairs(t4._OpenPopups) do
			if openPopup == v628 then
				table.remove(t4._OpenPopups, i)

				break
			end
		end
	end

	v587 = v628
	v588()
	v581()

	local function v631()
		if u609 then
			v628()

			return
		end

		u609 = true
		Frame4.Visible = true
		Frame5.BackgroundTransparency = 0
		UIStroke3.Transparency = 0.3
		ImageLabel.ImageTransparency = 0.45
		Frame4.Size = UDim2.fromOffset(TextButton.AbsoluteSize.X, 0)

		local v632, v633 = v612()

		v46(Frame4, t1.SoftSpring, {
			Size = UDim2.fromOffset(v632, v633)
		})
		v46(Frame3, t1.Chevron, {
			Rotation = 180
		})
		v46(UIStroke2, t1.Default, {
			Color = t4._Theme.AccentSolid,
			Thickness = 1.5
		})
		table.insert(t4._OpenPopups, v628)
	end

	if not p208 and #Options == 1 then
		t13 = Options[1]
		Frame3.Visible = false
		v48(v543.Callback, t13)
	else
		TextButton.MouseButton1Click:Connect(v631)
	end

	v195(Frame2:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
		if u609 then
			v612()
		end
	end))
	TextButton.MouseEnter:Connect(function()
		if u609 then
			return
		end

		v46(TextButton, t1.Fast, {
			BackgroundColor3 = t4._Theme.CardBackgroundHover
		})
		v46(UIStroke2, t1.Fast, {
			Color = t4._Theme.BorderStrong
		})
	end)
	TextButton.MouseLeave:Connect(function()
		if u609 then
			return
		end

		v46(TextButton, t1.Fast, {
			BackgroundColor3 = t4._Theme.CardBackground
		})
		v46(UIStroke2, t1.Fast, {
			Color = t4._Theme.Border
		})
	end)

	if TextBox then
		TextBox:GetPropertyChangedSignal("Text"):Connect(function()
			v588(TextBox.Text)
			v581()

			if u609 then
				local v634 = v610()

				v46(Frame4, t1.Default, {
					Size = UDim2.fromOffset(Frame4.AbsoluteSize.X, v634)
				})
			end
		end)
	end

	v195(v5.InputBegan:Connect(function(input)
		if not u609 then
			return
		end

		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			local Position = input.Position

			local function v636(p211)
				local AbsolutePosition = p211.AbsolutePosition
				local AbsoluteSize = p211.AbsoluteSize

				return Position.X >= AbsolutePosition.X and Position.X <= AbsolutePosition.X + AbsoluteSize.X and Position.Y >= AbsolutePosition.Y and Position.Y <= AbsolutePosition.Y + AbsoluteSize.Y
			end

			if not v636(Frame4) and not v636(TextButton) then
				v628()
			end
		end
	end))

	if v543.Tooltip then
		v288(Frame2, v543.Tooltip)
	end

	local v639 = v196(function(p212)
		TextLabel2.TextColor3 = p212.TextPrimary
		TextButton.BackgroundColor3 = p212.CardBackground

		if not u609 then
			UIStroke2.Color = p212.Border
		end

		v119(v564, p212.TextSecondary)
		Frame5.BackgroundColor3 = p212.CardBackground
		UIStroke3.Color = p212.Border
		ScrollingFrame.ScrollBarImageColor3 = p212.ScrollbarThumb

		if TextBox then
			TextBox.TextColor3 = p212.TextPrimary
			TextBox.PlaceholderColor3 = p212.TextPlaceholder
		end

		if Frame7 then
			Frame7.BackgroundColor3 = p212.WindowBackground
		end

		if UIStroke4 then
			UIStroke4.Color = p212.Border
		end

		TextLabel4.TextColor3 = p212.TextSecondary

		if Frame6 then
			v119(Frame6, p212.TextSecondary)
		end

		for _, v in ipairs(t14) do
			v.Indicator.BackgroundColor3 = p212.AccentSolid
			v.Label.TextColor3 = p212.TextPrimary
		end

		v581()
	end)
	local t18 = {
		SetOptions = function(p213, p214)
			Options = p214

			if p208 then
				t13 = {}
			else
				t13 = nil
			end

			if TextBox then
				TextBox.Text = ""
			end

			v588()
			v581()
		end,
		Refresh = function(p215, p216, p217)
			Options = p216

			if not p217 then
				if p208 then
					t13 = {}
				else
					t13 = nil
				end
			end

			if TextBox then
				TextBox.Text = ""
			end

			v588()
			v581()
		end,
		Set = function(p218, p219)
			if p208 then
				t13 = {}

				if type(p219) == "table" then
					for _, v in ipairs(p219) do
						t13[v] = true
					end
				end
			else
				t13 = p219
			end

			v581()

			if p208 then
				local t19 = {}

				for k, v in pairs(t13) do
					if v then
						table.insert(t19, k)
					end
				end

				v48(v543.Callback, t19)
			else
				v48(v543.Callback, t13)
			end
		end,
		Get = function()
			if not p208 then
				return t13
			end

			local t20 = {}

			for k, v in pairs(t13) do
				if v then
					table.insert(t20, k)
				end
			end

			return t20
		end
	}
	local v651 = v203(function(p220)
		u551 = v33(12, 4)
		u552 = v33(16, 7)
		u553 = v33(10, 4)
		u554 = v33(6, 2)
		u555 = v33(2, 1)
		u556 = v33(30, 12)
		u557 = v33(30, 12)
		u573 = v546 and u556 + v33(12, 4) or u554
		Frame2.Size = UDim2.new(1, 0, 0, p220.InputHeight + p220.BodyFont + v33(10, 3))
		TextLabel2.Size = UDim2.new(1, 0, 0, p220.BodyFont + v33(4, 2))
		TextLabel2.TextSize = p220.BodyFont
		TextButton.Position = UDim2.new(0, 0, 0, p220.BodyFont + v33(8, 3))
		TextButton.Size = UDim2.new(1, 0, 0, p220.InputHeight)
		TextButton.TextSize = p220.BodyFont
		TextLabel3.Position = UDim2.fromOffset(u551, 0)
		TextLabel3.Size = UDim2.new(1, -(u551 + u552 + u553 + v33(8, 2)), 1, 0)
		TextLabel3.TextSize = p220.BodyFont
		Frame3.Position = UDim2.new(1, -u553, 0.5, 0)
		Frame3.Size = UDim2.fromOffset(u552, u552)

		if Frame7 then
			Frame7.Position = UDim2.fromOffset(u554, u554)
			Frame7.Size = UDim2.new(1, -u554 * 2, 0, u556)
		end

		if Frame6 then
			local v652 = v33(14, 6)

			Frame6.Size = UDim2.fromOffset(v652, v652)
			Frame6.Position = UDim2.new(0, v33(10, 3), 0.5, -math.floor(v652 / 2))
		end

		if TextBox then
			TextBox.Position = UDim2.fromOffset(v33(30, 12), 0)
			TextBox.Size = UDim2.new(1, -v33(38, 16), 1, 0)
			TextBox.TextSize = p220.CaptionFont
		end

		ScrollingFrame.Position = UDim2.fromOffset(0, u573)
		ScrollingFrame.Size = UDim2.new(1, 0, 1, -u573 - u554)
		ScrollingFrame.ScrollBarThickness = math.max(isMobile and 2 or 4, p220.ScrollbarThickness - (isMobile and 0 or 2))
		TextLabel4.Position = UDim2.fromOffset(0, u573)
		TextLabel4.Size = UDim2.new(1, 0, 0, v33(60, 24))
		TextLabel4.TextSize = p220.CaptionFont
		v588(TextBox and TextBox.Text or nil)
		v581()

		if u609 then
			local v653, v654 = v612()

			if v653 and v654 then
				Frame4.Size = UDim2.fromOffset(v653, v654)
			end
		end
	end)

	t18.GetState = function()
		return t18:Get()
	end
	t18.SetState = function(p221, p222)
		t18:Set(p222)
	end
	t18.Destroy = function()
		if v543.Flag then
			t4._Flags[v543.Flag] = nil
		end

		v639()
		v651()
		Frame4:Destroy()
		Frame2:Destroy()
	end

	if v543.Flag then
		t4._Flags[v543.Flag] = t18
	end

	return t18
end

t6.AddDropdown = function(p223, p224)
	return v542(p223, p224, false)
end
t6.AddMultiDropdown = function(p225, p226)
	return v542(p225, p226, true)
end

local t21 = {
	Color3.fromRGB(239, 83, 80),
	Color3.fromRGB(237, 175, 79),
	Color3.fromRGB(72, 187, 120),
	Color3.fromRGB(64, 156, 255),
	Color3.fromRGB(120, 80, 240),
	Color3.fromRGB(232, 71, 176),
	Color3.fromRGB(255, 255, 255),
	Color3.fromRGB(180, 180, 180),
	Color3.fromRGB(100, 100, 100),
	Color3.fromRGB(40, 40, 40),
	Color3.fromRGB(0, 0, 0),
	Color3.fromRGB(255, 200, 100)
}

t6.AddColorPicker = function(p227, p228)
	local v656 = p228 or {}
	local _Theme = t4._Theme
	local Default = typeof(v656.Default) == "Color3" and v656.Default or Color3.fromRGB(255, 255, 255)
	local Alpha = v656.Alpha or 1
	local color3, u661, u662 = Color3.toHSV(Default)
	local u663 = v33(34, 14)
	local u664 = v33(28, 12)
	local u665 = v33(8, 3)
	local Frame2 = v40("Frame", {
		Parent = p227._Container,
		Size = UDim2.new(1, 0, 0, sizing.ButtonHeight),
		BackgroundTransparency = 1
	})

	Frame2:SetAttribute("NoWindowSwipe", true)

	local v667 = v40
	local s9 = "TextLabel"
	local t22 = {
		Parent = Frame2,
		Size = UDim2.new(1, -(u663 + u665), 1, 0),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamMedium,
		TextSize = sizing.BodyFont,
		TextColor3 = _Theme.TextPrimary
	}

	t22.Text = v656.Text or "Color"
	t22.TextXAlignment = Enum.TextXAlignment.Left
	t22.TextTruncate = Enum.TextTruncate.AtEnd

	local v670 = v667(s9, t22)
	local TextButton = v40("TextButton", {
		Parent = Frame2,
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -v33(2, 1), 0.5, 0),
		Size = UDim2.fromOffset(u663, u664),
		BackgroundColor3 = Default,
		BorderSizePixel = 0,
		AutoButtonColor = false,
		Text = ""
	})

	TextButton:SetAttribute("NoWindowSwipe", true)

	local connection2

	v40("UICorner", {
		Parent = TextButton,
		CornerRadius = sizing.CornerRadiusSmall
	})
	v67(TextButton)

	local UIStroke2 = v40("UIStroke", {
		Parent = TextButton,
		Color = _Theme.Border,
		Thickness = 1
	})
	local Frame3
	local u675
	local v676

	local function v677()
		if Frame3 then
			Frame3:Destroy()
			Frame3 = nil
			u675 = nil
		end
	end
	local function v678()
		v677()

		local _Theme2 = t4._Theme
		local v680 = v33(296, 128)
		local v681 = v33(350, 152)
		local v682 = v33(12, 4)
		local v683 = v682 * 2
		local v684 = v33(8, 3)
		local v685 = v33(6, 2)
		local v686 = v33(26, 12)
		local v687 = v33(32, 14)

		Frame3 = v40("Frame", {
			Parent = v238,
			Size = UDim2.fromOffset(v680, v681),
			BackgroundTransparency = 1,
			ZIndex = 60,
			Visible = false
		})
		Frame3:SetAttribute("NoWindowSwipe", true)
		v40("ImageLabel", {
			Parent = Frame3,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, v33(8, 3)),
			Size = UDim2.new(1, v33(40, 12), 1, v33(40, 12)),
			BackgroundTransparency = 1,
			Image = "rbxassetid://6014261993",
			ImageColor3 = Color3.new(0, 0, 0),
			ImageTransparency = 0.42,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(49, 49, 450, 450),
			ZIndex = 59
		})

		local Frame4 = v40("Frame", {
			Parent = Frame3,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = _Theme2.WindowBackground,
			BorderSizePixel = 0,
			ZIndex = 60
		})

		v40("UICorner", {
			Parent = Frame4,
			CornerRadius = sizing.CornerRadius
		})
		v40("UIStroke", {
			Parent = Frame4,
			Color = _Theme2.Border,
			Thickness = 1,
			Transparency = 0.4
		})
		v40("UIPadding", {
			Parent = Frame4,
			PaddingLeft = UDim.new(0, v682),
			PaddingRight = UDim.new(0, v682),
			PaddingTop = UDim.new(0, v682),
			PaddingBottom = UDim.new(0, v682)
		})

		local v689 = v33(178, 58)
		local v690 = v33(132, 48)
		local v691 = v33(16, 7)
		local v692 = math.max(v33(56, 22), v680 - v683 - v689 - v691 - v684 * 2)
		local ImageButton = v40("ImageButton", {
			Parent = Frame4,
			Size = UDim2.fromOffset(v689, v690),
			Position = UDim2.fromOffset(0, 0),
			BackgroundColor3 = Color3.fromHSV(color3, 1, 1),
			BorderSizePixel = 0,
			AutoButtonColor = false,
			Image = "",
			ZIndex = 61
		})

		v40("UICorner", {
			Parent = ImageButton,
			CornerRadius = sizing.CornerRadiusSmall
		})

		local Frame5 = v40("Frame", {
			Parent = ImageButton,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderSizePixel = 0,
			ZIndex = 62
		})

		v40("UICorner", {
			Parent = Frame5,
			CornerRadius = sizing.CornerRadiusSmall
		})
		v40("UIGradient", {
			Parent = Frame5,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0),
				NumberSequenceKeypoint.new(1, 1)
			})
		})

		local Frame6 = v40("Frame", {
			Parent = ImageButton,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.new(0, 0, 0),
			BorderSizePixel = 0,
			ZIndex = 63
		})

		v40("UICorner", {
			Parent = Frame6,
			CornerRadius = sizing.CornerRadiusSmall
		})
		v40("UIGradient", {
			Parent = Frame6,
			Rotation = 90,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(1, 0)
			})
		})

		local Frame7 = v40("Frame", {
			Parent = ImageButton,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(v33(12, 5), v33(12, 5)),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderSizePixel = 0,
			ZIndex = 64
		})

		v40("UICorner", {
			Parent = Frame7,
			CornerRadius = UDim.new(1, 0)
		})
		v40("UIStroke", {
			Parent = Frame7,
			Color = Color3.new(0, 0, 0),
			Thickness = 1.5
		})
		Frame7.Position = UDim2.fromScale(u661, 1 - u662)

		local ImageButton2 = v40("ImageButton", {
			Parent = Frame4,
			Size = UDim2.fromOffset(v691, v690),
			Position = UDim2.fromOffset(v689 + v684, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderSizePixel = 0,
			AutoButtonColor = false,
			Image = "",
			ZIndex = 61
		})

		v40("UICorner", {
			Parent = ImageButton2,
			CornerRadius = sizing.CornerRadiusSmall
		})
		v40("UIGradient", {
			Parent = ImageButton2,
			Rotation = 90,
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 1, 1)),
				ColorSequenceKeypoint.new(0.166, Color3.fromHSV(0.166, 1, 1)),
				ColorSequenceKeypoint.new(0.333, Color3.fromHSV(0.333, 1, 1)),
				ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, 1, 1)),
				ColorSequenceKeypoint.new(0.666, Color3.fromHSV(0.666, 1, 1)),
				ColorSequenceKeypoint.new(0.833, Color3.fromHSV(0.833, 1, 1)),
				ColorSequenceKeypoint.new(1, Color3.fromHSV(1, 1, 1))
			})
		})

		local Frame8 = v40("Frame", {
			Parent = ImageButton2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, v33(4, 1), 0, v33(4, 2)),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderSizePixel = 0,
			ZIndex = 62
		})

		v40("UIStroke", {
			Parent = Frame8,
			Color = Color3.new(0, 0, 0),
			Thickness = 1.2
		})
		Frame8.Position = UDim2.fromScale(0.5, color3)

		local Frame9 = v40("Frame", {
			Parent = Frame4,
			Size = UDim2.fromOffset(v692, v690),
			Position = UDim2.fromOffset(v689 + v684 + v691 + v684, 0),
			BackgroundColor3 = Default,
			BorderSizePixel = 0,
			ZIndex = 61
		})

		v40("UICorner", {
			Parent = Frame9,
			CornerRadius = sizing.CornerRadiusSmall
		})
		v40("UIStroke", {
			Parent = Frame9,
			Color = _Theme2.Border,
			Thickness = 1,
			Transparency = 0.3
		})

		local TextLabel2 = v40("TextLabel", {
			Parent = Frame9,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, v33(8, 3)),
			Size = UDim2.new(1, -v33(10, 4), 0, v33(14, 7)),
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamBold,
			TextSize = math.max(isMobile and 6 or 10, sizing.CaptionFont - 2),
			TextColor3 = _Theme2.PrimaryText,
			Text = "PREVIEW",
			ZIndex = 62
		})
		local TextLabel3 = v40("TextLabel", {
			Parent = Frame9,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0.5, 0, 1, -v33(8, 3)),
			Size = UDim2.new(1, -v33(10, 4), 0, v33(14, 7)),
			BackgroundTransparency = 1,
			Font = Enum.Font.Gotham,
			TextSize = math.max(isMobile and 6 or 9, sizing.CaptionFont - 3),
			TextColor3 = _Theme2.PrimaryText,
			Text = "",
			ZIndex = 62
		})
		local v702 = v690 + v33(12, 4)

		v40("TextLabel", {
			Parent = Frame4,
			Position = UDim2.fromOffset(0, v702),
			Size = UDim2.fromOffset(v33(28, 12), v686),
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamMedium,
			TextSize = sizing.CaptionFont,
			TextColor3 = _Theme2.TextSecondary,
			Text = "HEX",
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 61
		})

		local TextBox = v40("TextBox", {
			Parent = Frame4,
			Position = UDim2.fromOffset(v33(32, 14), v702),
			Size = UDim2.fromOffset(v680 - v683 - v33(32, 14) - v33(32, 14), v686),
			BackgroundColor3 = _Theme2.CardBackground,
			BorderSizePixel = 0,
			Font = Enum.Font.Code,
			TextSize = sizing.CaptionFont,
			TextColor3 = _Theme2.TextPrimary,
			PlaceholderText = "#FFFFFF",
			Text = string.format("#%02X%02X%02X", Default.R * 255, Default.G * 255, Default.B * 255),
			ClearTextOnFocus = false,
			ZIndex = 61
		})

		v40("UICorner", {
			Parent = TextBox,
			CornerRadius = sizing.CornerRadiusSmall
		})
		v40("UIStroke", {
			Parent = TextBox,
			Color = _Theme2.Border,
			Thickness = 1,
			Transparency = 0.5
		})
		v40("UIPadding", {
			Parent = TextBox,
			PaddingLeft = UDim.new(0, v33(8, 3)),
			PaddingRight = UDim.new(0, v33(8, 3))
		})

		local TextButton2 = v40("TextButton", {
			Parent = Frame4,
			Position = UDim2.fromOffset(v680 - v683 - v686, v702),
			Size = UDim2.fromOffset(v686, v686),
			BackgroundColor3 = _Theme2.CardBackground,
			BorderSizePixel = 0,
			AutoButtonColor = false,
			Text = "",
			ZIndex = 61
		})

		v40("UICorner", {
			Parent = TextButton2,
			CornerRadius = sizing.CornerRadiusSmall
		})

		local v705 = v33(14, 6)
		local v706 = math.floor((v686 - v705) / 2)

		v95(TextButton2, "copy", v705, _Theme2.TextSecondary).Position = UDim2.fromOffset(v706, v706)
		TextButton2.MouseButton1Click:Connect(function()
			if typeof(setclipboard) == "function" then
				pcall(setclipboard, TextBox.Text)
			end

			v286(TextButton2, "Copied")
			task.delay(0.9, function()
				if TextButton2.Parent then
					v287()
				end
			end)
		end)

		local v707 = v702 + v686 + v685

		local function v708(p229, p230, p231)
			v40("TextLabel", {
				Parent = Frame4,
				Position = UDim2.fromOffset(p230, v707),
				Size = UDim2.fromOffset(v33(14, 6), v686),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamMedium,
				TextSize = sizing.CaptionFont,
				TextColor3 = _Theme2.TextSecondary,
				Text = p229,
				TextXAlignment = Enum.TextXAlignment.Left,
				ZIndex = 61
			})

			local TextBox2 = v40("TextBox", {
				Parent = Frame4,
				Position = UDim2.fromOffset(p230 + v33(16, 7), v707),
				Size = UDim2.fromOffset(v33(58, 22), v686),
				BackgroundColor3 = _Theme2.CardBackground,
				BorderSizePixel = 0,
				Font = Enum.Font.Code,
				TextSize = sizing.CaptionFont,
				TextColor3 = _Theme2.TextPrimary,
				Text = tostring(math.floor(p231() + 0.5)),
				ClearTextOnFocus = false,
				ZIndex = 61
			})

			v40("UICorner", {
				Parent = TextBox2,
				CornerRadius = sizing.CornerRadiusSmall
			})
			v40("UIStroke", {
				Parent = TextBox2,
				Color = _Theme2.Border,
				Thickness = 1,
				Transparency = 0.5
			})
			v40("UIPadding", {
				Parent = TextBox2,
				PaddingLeft = UDim.new(0, v33(6, 2)),
				PaddingRight = UDim.new(0, v33(6, 2))
			})

			return TextBox2
		end

		local v710 = v708("R", 0, function()
			return Default.R * 255
		end)
		local v711 = v708("G", (v680 - v683) / 3, function()
			return Default.G * 255
		end)
		local v712 = v708("B", 2 * ((v680 - v683) / 3), function()
			return Default.B * 255
		end)
		local v713 = v707 + v686 + v33(10, 4)

		v40("TextLabel", {
			Parent = Frame4,
			Position = UDim2.fromOffset(0, v713),
			Size = UDim2.fromOffset(v680 - v683, v33(14, 7)),
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamMedium,
			TextSize = sizing.CaptionFont,
			TextColor3 = _Theme2.TextSecondary,
			Text = "PRESETS",
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 61
		})

		local Frame10 = v40("Frame", {
			Parent = Frame4,
			Position = UDim2.fromOffset(0, v713 + v33(18, 8)),
			Size = UDim2.fromOffset(v680 - v683, v33(22, 10)),
			BackgroundTransparency = 1,
			ZIndex = 61
		})

		v40("UIListLayout", {
			Parent = Frame10,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, v33(4, 1)),
			SortOrder = Enum.SortOrder.LayoutOrder
		})

		for i, v in ipairs(t21) do
			local TextButton3 = v40("TextButton", {
				Parent = Frame10,
				Size = UDim2.fromOffset(v33(18, 8), v33(22, 10)),
				BackgroundColor3 = v,
				BorderSizePixel = 0,
				AutoButtonColor = false,
				Text = "",
				ZIndex = 62,
				LayoutOrder = i
			})

			v40("UICorner", {
				Parent = TextButton3,
				CornerRadius = sizing.CornerRadiusSmall
			})
			v40("UIStroke", {
				Parent = TextButton3,
				Color = Color3.new(1, 1, 1),
				Thickness = 1,
				Transparency = 0.85
			})
			TextButton3.MouseButton1Click:Connect(function()
				Default = v

				local color32, v719, v720 = Color3.toHSV(Default)

				color3 = color32
				u661 = v719
				u662 = v720

				if u675 then
					u675()
				end
			end)
		end

		local TextButton3 = v40("TextButton", {
			Parent = Frame4,
			Position = UDim2.fromOffset(0, v681 - v683 - v687),
			Size = UDim2.fromOffset(v680 - v683, v687),
			BackgroundColor3 = _Theme2.Primary,
			BorderSizePixel = 0,
			Font = Enum.Font.GothamSemibold,
			TextSize = sizing.BodyFont,
			TextColor3 = _Theme2.PrimaryText,
			Text = "Apply",
			AutoButtonColor = false,
			ZIndex = 61,
			ClipsDescendants = true
		})

		v40("UICorner", {
			Parent = TextButton3,
			CornerRadius = sizing.CornerRadius
		})

		local Frame11 = v40("Frame", {
			Parent = TextButton3,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderSizePixel = 0,
			ZIndex = 62
		})

		v40("UICorner", {
			Parent = Frame11,
			CornerRadius = sizing.CornerRadius
		})
		v40("UIGradient", {
			Parent = Frame11,
			Rotation = 90,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0.78),
				NumberSequenceKeypoint.new(1, 1)
			})
		})

		local function v723(p232)
			Default = Color3.fromHSV(color3, u661, u662)
			ImageButton.BackgroundColor3 = Color3.fromHSV(color3, 1, 1)
			Frame7.Position = UDim2.fromScale(u661, 1 - u662)
			Frame8.Position = UDim2.fromScale(0.5, color3)
			TextButton.BackgroundColor3 = Default
			Frame9.BackgroundColor3 = Default
			TextLabel2.TextColor3 = v78(Default)
			TextLabel3.TextColor3 = v78(Default)
			TextLabel3.TextTransparency = 0.4
			TextLabel3.Text = string.format("%d %d %d", math.floor(Default.R * 255 + 0.5), math.floor(Default.G * 255 + 0.5), math.floor(Default.B * 255 + 0.5))
			TextBox.Text = string.format("#%02X%02X%02X", Default.R * 255, Default.G * 255, Default.B * 255)

			if not v710:IsFocused() then
				v710.Text = tostring(math.floor(Default.R * 255 + 0.5))
			end

			if not v711:IsFocused() then
				v711.Text = tostring(math.floor(Default.G * 255 + 0.5))
			end

			if not v712:IsFocused() then
				v712.Text = tostring(math.floor(Default.B * 255 + 0.5))
			end

			if not p232 then
				v48(v656.Callback, Default, Alpha)
			end
		end

		u675 = v723

		local u724 = false
		local u725 = false

		ImageButton.InputBegan:Connect(function(input)
			local v726

			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				u724 = true
				v726 = (Vector2.new(input.Position.X, input.Position.Y) - ImageButton.AbsolutePosition) / ImageButton.AbsoluteSize
				u661 = v54(v726.X, 0, 1)
				u662 = 1 - v54(v726.Y, 0, 1)
				v723()

				return
			elseif input.UserInputType == Enum.UserInputType.Touch then
				u724 = true
				v726 = (Vector2.new(input.Position.X, input.Position.Y) - ImageButton.AbsolutePosition) / ImageButton.AbsoluteSize
				u661 = v54(v726.X, 0, 1)
				u662 = 1 - v54(v726.Y, 0, 1)
				v723()
			end
		end)
		ImageButton2.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				u725 = true
				color3 = v54((input.Position.Y - ImageButton2.AbsolutePosition.Y) / ImageButton2.AbsoluteSize.Y, 0, 1)
				v723()
			end
		end)
		v195(v5.InputChanged:Connect(function(input)
			local v727

			if input.UserInputType ~= Enum.UserInputType.MouseMovement then
				if input.UserInputType == Enum.UserInputType.Touch then
					if u724 then
						v727 = (Vector2.new(input.Position.X, input.Position.Y) - ImageButton.AbsolutePosition) / ImageButton.AbsoluteSize
						u661 = v54(v727.X, 0, 1)
						u662 = 1 - v54(v727.Y, 0, 1)
						v723()
					elseif u725 then
						color3 = v54((input.Position.Y - ImageButton2.AbsolutePosition.Y) / ImageButton2.AbsoluteSize.Y, 0, 1)
						v723()
					end
				end
			elseif u724 then
				v727 = (Vector2.new(input.Position.X, input.Position.Y) - ImageButton.AbsolutePosition) / ImageButton.AbsoluteSize
				u661 = v54(v727.X, 0, 1)
				u662 = 1 - v54(v727.Y, 0, 1)
				v723()
			elseif u725 then
				color3 = v54((input.Position.Y - ImageButton2.AbsolutePosition.Y) / ImageButton2.AbsoluteSize.Y, 0, 1)
				v723()
			end
		end))
		v195(v5.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				u724 = false
				u725 = false
			end
		end))
		TextBox.FocusLost:Connect(function()
			local v728 = TextBox.Text:gsub("#", "")

			if #v728 == 6 then
				local v729 = tonumber(v728:sub(1, 2), 16)
				local v730 = tonumber(v728:sub(3, 4), 16)
				local v731 = tonumber(v728:sub(5, 6), 16)

				if v729 and v730 and v731 then
					Default = Color3.fromRGB(v729, v730, v731)

					local color32, v733, v734 = Color3.toHSV(Default)

					color3 = color32
					u661 = v733
					u662 = v734
					v723()
				end
			end
		end)

		local function v735()
			local v736 = tonumber(v710.Text)
			local v737 = tonumber(v711.Text)
			local v738 = tonumber(v712.Text)

			if v736 and v737 and v738 then
				local v739 = v54(math.floor(v736), 0, 255)
				local v740 = v54(math.floor(v737), 0, 255)
				local v741 = v54(math.floor(v738), 0, 255)

				Default = Color3.fromRGB(v739, v740, v741)

				local color32, v743, v744 = Color3.toHSV(Default)

				color3 = color32
				u661 = v743
				u662 = v744
				v723()
			end
		end

		v710.FocusLost:Connect(v735)
		v711.FocusLost:Connect(v735)
		v712.FocusLost:Connect(v735)
		TextButton3.MouseButton1Click:Connect(function()
			if v676 then
				v676()
			else
				Frame3.Visible = false
			end

			v48(v656.Callback, Default, Alpha)
		end)
		TextButton3.MouseEnter:Connect(function()
			v46(TextButton3, t1.Default, {
				BackgroundColor3 = t4._Theme.PrimaryHover
			})
		end)
		TextButton3.MouseLeave:Connect(function()
			v46(TextButton3, t1.Default, {
				BackgroundColor3 = t4._Theme.Primary
			})
		end)
	end

	v676 = function()
		if Frame3 and Frame3.Visible then
			Frame3.Visible = false
		end

		for i, openPopup in ipairs(t4._OpenPopups) do
			if openPopup == v676 then
				table.remove(t4._OpenPopups, i)

				break
			end
		end
	end

	local connection3 = v5.InputBegan:Connect(function(input)
		if not Frame3 or not Frame3.Visible then
			return
		end

		local Position, v749

		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			Position = input.Position
			v749 = function(p233)
				local AbsolutePosition = p233.AbsolutePosition
				local AbsoluteSize = p233.AbsoluteSize

				return Position.X >= AbsolutePosition.X and Position.X <= AbsolutePosition.X + AbsoluteSize.X and Position.Y >= AbsolutePosition.Y and Position.Y <= AbsolutePosition.Y + AbsoluteSize.Y
			end

			if not v749(Frame3) and not v749(TextButton) then
				v676()
			end
		elseif input.UserInputType == Enum.UserInputType.Touch then
			Position = input.Position
			v749 = function(p234)
				local AbsolutePosition = p234.AbsolutePosition
				local AbsoluteSize = p234.AbsoluteSize

				return Position.X >= AbsolutePosition.X and Position.X <= AbsolutePosition.X + AbsoluteSize.X and Position.Y >= AbsolutePosition.Y and Position.Y <= AbsolutePosition.Y + AbsoluteSize.Y
			end

			if not v749(Frame3) and not v749(TextButton) then
				v676()
			end
		end
	end)

	TextButton.MouseButton1Click:Connect(function()
		if not Frame3 then
			v678()
		end

		if Frame3.Visible then
			v676()

			return
		end

		local function v754()
			local Parent = Frame3.Parent

			if not Parent then
				return
			end

			local X = Frame3.AbsoluteSize.X
			local Y = Frame3.AbsoluteSize.Y

			if X <= 0 then
				X = v33(296, 128)
			end

			if Y <= 0 then
				Y = v33(350, 152)
			end

			local AbsolutePosition = TextButton.AbsolutePosition
			local AbsoluteSize = TextButton.AbsoluteSize
			local AbsoluteSize2 = Parent.AbsoluteSize
			local v761 = AbsolutePosition.X + AbsoluteSize.X - X
			local v762 = v33(8, 3)
			local v763 = AbsolutePosition.Y + AbsoluteSize.Y + v762
			local v764 = math.max(v762, AbsoluteSize2.X - X - v762)
			local v765 = math.max(v762, AbsoluteSize2.Y - Y - v762)

			if AbsoluteSize2.Y - v762 < v763 + Y then
				v763 = AbsolutePosition.Y - Y - v762
			end

			local v766 = v54(v761, v762, v764)
			local v767 = v54(v763, v762, v765)

			Frame3.Position = UDim2.fromOffset(v766, v767)
		end

		v754()

		if not connection2 then
			connection2 = TextButton:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
				if Frame3 and Frame3.Visible then
					v754()
				end
			end)
		end

		Frame3.Visible = true

		if u675 then
			u675(true)
		end

		local Frame4 = Frame3:FindFirstChildWhichIsA("Frame")
		local UIStroke3 = Frame4 and Frame4:FindFirstChildOfClass("UIStroke")
		local ImageLabel = Frame3:FindFirstChildOfClass("ImageLabel")

		if Frame4 then
			Frame4.BackgroundTransparency = 1
		end

		if UIStroke3 then
			UIStroke3.Transparency = 1
		end

		if ImageLabel then
			ImageLabel.ImageTransparency = 1
		end

		if Frame4 then
			v46(Frame4, t1.Smooth, {
				BackgroundTransparency = 0
			})
		end

		if UIStroke3 then
			v46(UIStroke3, t1.Smooth, {
				Transparency = 0.4
			})
		end

		if ImageLabel then
			v46(ImageLabel, t1.Smooth, {
				ImageTransparency = 0.42
			})
		end

		table.insert(t4._OpenPopups, v676)
	end)

	if v656.Tooltip then
		v288(Frame2, v656.Tooltip)
	end

	local v771 = v196(function(p235)
		v670.TextColor3 = p235.TextPrimary
		UIStroke2.Color = p235.Border

		if Frame3 then
			local Visible = Frame3.Visible
			local Position = Frame3.Position

			v678()

			if Visible then
				Frame3.Position = Position
				Frame3.Visible = true

				if u675 then
					u675(true)
				end
			end
		end
	end)
	local t23 = {
		Set = function(p236, p237)
			Default = p237

			local color32, v776, v777 = Color3.toHSV(p237)

			color3 = color32
			u661 = v776
			u662 = v777
			TextButton.BackgroundColor3 = Default

			if u675 then
				u675(true)
			end

			v48(v656.Callback, Default, Alpha)
		end,
		Get = function()
			return Default
		end,
		GetState = function()
			return {
				__type = "Color3",
				r = Default.R,
				g = Default.G,
				b = Default.B
			}
		end,
		SetState = function(p238, p239)
			if type(p239) == "table" and p239.__type == "Color3" then
				Default = Color3.new(p239.r, p239.g, p239.b)

				local color32, v779, v780 = Color3.toHSV(Default)

				color3 = color32
				u661 = v779
				u662 = v780
				TextButton.BackgroundColor3 = Default

				if u675 then
					u675(true)
				end
			end
		end
	}
	local v781 = v203(function(p240)
		local v782 = v33(34, 14)
		local v783 = v33(28, 12)

		u663 = v782
		u664 = v783
		u665 = v33(8, 3)
		Frame2.Size = UDim2.new(1, 0, 0, p240.ButtonHeight)
		v670.Size = UDim2.new(1, -(u663 + u665), 1, 0)
		v670.TextSize = p240.BodyFont
		TextButton.Position = UDim2.new(1, -v33(2, 1), 0.5, 0)
		TextButton.Size = UDim2.fromOffset(u663, u664)

		if Frame3 then
			local Visible = Frame3.Visible
			local Position = Frame3.Position

			v678()

			if Visible then
				Frame3.Position = Position
				Frame3.Visible = true

				if u675 then
					u675(true)
				end
			end
		end
	end)

	t23.Destroy = function()
		if v656.Flag then
			t4._Flags[v656.Flag] = nil
		end

		v771()
		v781()
		pcall(function()
			connection3:Disconnect()
		end)

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		v677()
		Frame2:Destroy()
	end

	if v656.Flag then
		t4._Flags[v656.Flag] = t23
	end

	return t23
end
t4._NotifPosition = "bottom-right"
t4._NotifQueue = 5

local function v786()
	local v787 = v33(320, 140)
	local v788 = v33(20, 6)

	return {
		Width = v787,
		Margin = v788,
		Gap = v33(10, 3),
		SlideOffset = v787 + v788
	}
end

local v789 = v786()
local Frame2 = v40("Frame", {
	Parent = v239,
	Size = UDim2.new(0, v789.Width, 1, -v789.Margin * 2),
	Position = UDim2.new(1, -v789.SlideOffset, 0, v789.Margin),
	BackgroundTransparency = 1
})
local UIListLayout = v40("UIListLayout", {
	Parent = Frame2,
	Padding = UDim.new(0, v789.Gap),
	VerticalAlignment = Enum.VerticalAlignment.Bottom,
	SortOrder = Enum.SortOrder.LayoutOrder,
	HorizontalAlignment = Enum.HorizontalAlignment.Right
})

local function v792(p241)
	t4._NotifPosition = p241

	local v793 = v786()

	Frame2.Size = UDim2.new(0, v793.Width, 1, -v793.Margin * 2)
	UIListLayout.Padding = UDim.new(0, v793.Gap)

	if p241 == "top-right" then
		Frame2.AnchorPoint = Vector2.new(0, 0)
		Frame2.Position = UDim2.new(1, -v793.SlideOffset, 0, v793.Margin)
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
	elseif p241 == "top-center" then
		Frame2.AnchorPoint = Vector2.new(0, 0)
		Frame2.Position = UDim2.new(0.5, -math.floor(v793.Width / 2), 0, v793.Margin)
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
	elseif p241 == "bottom-center" then
		Frame2.AnchorPoint = Vector2.new(0, 1)
		Frame2.Position = UDim2.new(0.5, -math.floor(v793.Width / 2), 1, -v793.Margin)
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	else
		Frame2.AnchorPoint = Vector2.new(0, 1)
		Frame2.Position = UDim2.new(1, -v793.SlideOffset, 1, -v793.Margin)
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	end
end

v792("bottom-right")
t4.SetNotifPosition = function(p242, p243)
	v792(p243)
end
t4.Notify = function(p244, p245)
	local v794 = p245 or {}
	local Title = v794.Title or "Notification"
	local Content = v794.Content or ""
	local Type = v794.Type or "Info"
	local Duration = v794.Duration or 4
	local Buttons = v794.Buttons
	local _Theme = t4._Theme
	local v801 = v786()

	v792(t4._NotifPosition)

	local _NotifQueue = t4._NotifQueue or 5
	local children = Frame2:GetChildren()
	local t24 = {}

	for _, child in ipairs(children) do
		if child:IsA("Frame") then
			table.insert(t24, child)
		end
	end

	while _NotifQueue <= #t24 do
		local v807 = t24[1]

		if v807 and not v807:GetAttribute("Closing") then
			v807:SetAttribute("Closing", true)
			v46(v807, t1.Notif, {
				Position = UDim2.new(1, v801.SlideOffset, 0, 0)
			})
			task.delay(0.35, function()
				if v807.Parent then
					v807:Destroy()
				end
			end)
		end

		table.remove(t24, 1)
	end

	local Info = _Theme[Type] or _Theme.Info
	local v809 = ({
		Info = "info",
		Success = "check-circle",
		Warning = "warning",
		Danger = "error"
	})[Type] or "info"
	local Frame3 = v40("Frame", {
		Parent = Frame2,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = _Theme.CardBackground,
		BorderSizePixel = 0,
		Position = UDim2.new(1, v801.SlideOffset, 0, 0),
		ClipsDescendants = false
	})

	v40("UICorner", {
		Parent = Frame3,
		CornerRadius = sizing.CornerRadius
	})

	local UIStroke2 = v40("UIStroke", {
		Parent = Frame3,
		Color = _Theme.ShadowColor or Color3.new(0, 0, 0),
		Thickness = v33(2, 1),
		Transparency = 0.78,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	})
	local UIStroke3 = v40("UIStroke", {
		Parent = Frame3,
		Color = _Theme.Border,
		Thickness = 1,
		Transparency = 0.4
	})
	local v813 = v33(16, 5)
	local v814 = v33(14, 5)
	local v815 = v33(12, 4)
	local v816 = v33(12, 4)

	v40("UIPadding", {
		Parent = Frame3,
		PaddingLeft = UDim.new(0, v813),
		PaddingRight = UDim.new(0, v814),
		PaddingTop = UDim.new(0, v815),
		PaddingBottom = UDim.new(0, v816)
	})

	local Frame4 = v40("Frame", {
		Parent = Frame3,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, -v813, 0.5, 0),
		Size = UDim2.new(0, v33(3, 1), 1, -v33(10, 3)),
		BackgroundColor3 = Info,
		BorderSizePixel = 0
	})

	v40("UICorner", {
		Parent = Frame4,
		CornerRadius = UDim.new(0, v33(2, 1))
	})

	local v818 = v33(28, 12)
	local v819 = v33(18, 8)
	local v820 = v818 + v33(8, 3)
	local Frame5 = v40("Frame", {
		Parent = Frame3,
		Size = UDim2.fromOffset(v818, v818),
		Position = UDim2.fromOffset(0, 0),
		BackgroundColor3 = Info,
		BackgroundTransparency = 0.72,
		BorderSizePixel = 0
	})

	v40("UICorner", {
		Parent = Frame5,
		CornerRadius = UDim.new(0, v33(8, 3))
	})
	v95(v40("Frame", {
		Parent = Frame5,
		Size = UDim2.fromOffset(v819, v819),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		BackgroundTransparency = 1
	}), v809, v819, Info)

	local Frame6 = v40("Frame", {
		Parent = Frame3,
		Position = UDim2.fromOffset(v820, 0),
		Size = UDim2.new(1, -v820, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1
	})

	v40("UIListLayout", {
		Parent = Frame6,
		Padding = UDim.new(0, v33(4, 1)),
		SortOrder = Enum.SortOrder.LayoutOrder
	})

	if Title ~= "" then
		v40("TextLabel", {
			Parent = Frame6,
			Size = UDim2.new(1, 0, 0, v33(18, 8)),
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamSemibold,
			TextSize = sizing.BodyFont,
			TextColor3 = _Theme.TextPrimary,
			Text = Title,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	end

	if Content ~= "" then
		v40("TextLabel", {
			Parent = Frame6,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Font = Enum.Font.Gotham,
			TextSize = sizing.CaptionFont,
			TextColor3 = _Theme.TextSecondary,
			Text = Content,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	end

	if Buttons and #Buttons > 0 then
		local Frame7 = v40("Frame", {
			Parent = Frame6,
			Size = UDim2.new(1, 0, 0, v33(28, 12)),
			BackgroundTransparency = 1
		})

		v40("UIListLayout", {
			Parent = Frame7,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, v33(6, 2)),
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		})

		for _, Button in ipairs(Buttons) do
			local TextButton = v40("TextButton", {
				Parent = Frame7,
				Size = UDim2.fromOffset(v33(76, 34), v33(26, 12)),
				BackgroundColor3 = _Theme.CardBackground,
				BorderSizePixel = 0,
				Font = Enum.Font.GothamMedium,
				TextSize = sizing.CaptionFont,
				TextColor3 = _Theme.TextPrimary,
				Text = Button.Text or "OK",
				AutoButtonColor = false
			})

			v40("UICorner", {
				Parent = TextButton,
				CornerRadius = sizing.CornerRadiusSmall
			})
			TextButton.MouseEnter:Connect(function()
				v46(TextButton, t1.Fast, {
					BackgroundColor3 = t4._Theme.CardBackgroundHover
				})
			end)
			TextButton.MouseLeave:Connect(function()
				v46(TextButton, t1.Fast, {
					BackgroundColor3 = t4._Theme.CardBackground
				})
			end)
			TextButton.MouseButton1Down:Connect(function(x, y)
				v46(TextButton, t1.Fast, {
					BackgroundColor3 = t4._Theme.CardBackgroundActive
				})
				v122(TextButton, x, y, t4._Theme.AccentSolid)
			end)
			TextButton.MouseButton1Up:Connect(function()
				v46(TextButton, t1.Fast, {
					BackgroundColor3 = t4._Theme.CardBackgroundHover
				})
			end)
			TextButton.MouseButton1Click:Connect(function()
				v48(Button.Callback)
			end)
		end
	end

	local Frame7

	if Duration > 0 then
		Frame7 = v40("Frame", {
			Parent = Frame3,
			Size = UDim2.new(1, 0, 0, v33(2, 1)),
			Position = UDim2.new(0, 0, 1, v33(4, 1)),
			BackgroundColor3 = Info,
			BorderSizePixel = 0
		})
		v40("UICorner", {
			Parent = Frame7,
			CornerRadius = UDim.new(0, 1)
		})
	end

	local v828

	v46(Frame3, t1.Notif, {
		Position = UDim2.new(0, 0, 0, 0)
	})

	local UIScale = v40("UIScale", {
		Parent = Frame5,
		Scale = 0
	})

	task.delay(0.08, function()
		if UIScale.Parent then
			v46(UIScale, t1.Spring, {
				Scale = 1
			})
		end
	end)

	local Size = Frame4.Size

	Frame4.Size = UDim2.new(Size.X.Scale, Size.X.Offset, 0, 0)
	task.delay(0.06, function()
		if Frame4.Parent then
			local t25 = {
				Size = Size
			}

			v46(Frame4, TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), t25)
		end
	end)
	Frame3.BackgroundTransparency = 0.4
	v46(Frame3, t1.Smooth, {
		BackgroundTransparency = 0
	})

	local u832 = false

	Frame3.MouseEnter:Connect(function()
		u832 = true
	end)
	Frame3.MouseLeave:Connect(function()
		u832 = false
	end)

	if TouchEnabled then
		v146(Frame3, function(p246)
			if p246 == "right" then
				v46(Frame3, t1.Default, {
					Position = UDim2.new(1, v801.SlideOffset, 0, 0)
				})
				task.delay(0.2, function()
					if Frame3.Parent then
						Frame3:Destroy()
					end
				end)
			end
		end, v33(50, 20))
	end

	if Duration > 0 then
		task.delay(0.4, function()
			if Frame3.Parent then
				if not Frame3:GetAttribute("Closing") then
					if not Frame7 or not Frame7.Parent then
						return
					end

					local tween = v6:Create(Frame7, TweenInfo.new(Duration, Enum.EasingStyle.Linear), {
						Size = UDim2.new(0, 0, 0, v33(2, 1))
					})

					tween:Play()
					task.spawn(function()
						local v834 = u832

						while tween.PlaybackState ~= Enum.PlaybackState.Completed do
							if tween.PlaybackState == Enum.PlaybackState.Cancelled then
								break
							end

							if not Frame3.Parent then
								tween:Cancel()

								return
							end

							if Frame3:GetAttribute("Closing") then
								tween:Cancel()

								return
							end

							if u832 ~= v834 then
								if u832 then
									tween:Pause()
								else
									tween:Play()
								end

								v834 = u832
							end

							task.wait(0.1)
						end
					end)
					tween.Completed:Connect(function(playbackState)
						if playbackState ~= Enum.PlaybackState.Completed then
							return
						end

						if not Frame3.Parent or Frame3:GetAttribute("Closing") then
							return
						end

						Frame3:SetAttribute("Closing", true)
						v828()
					end)

					return
				end
			end
		end)
	end

	v828 = function()
		if not Frame3.Parent then
			return
		end

		local tweenInfo = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

		if Frame4 and Frame4.Parent then
			v46(Frame4, tweenInfo, {
				Size = UDim2.new(Size.X.Scale, Size.X.Offset, 0, 0)
			})
		end

		task.delay(0.04, function()
			if UIScale and UIScale.Parent then
				v46(UIScale, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
					Scale = 0.4
				})
			end

			if Frame5.Parent then
				v46(Frame5, tweenInfo, {
					BackgroundTransparency = 1
				})
			end
		end)
		task.delay(0.06, function()
			if not Frame3.Parent then
				return
			end

			v46(Frame3, t1.Notif, {
				Position = UDim2.new(1, v801.SlideOffset, 0, 0)
			})
			v46(Frame3, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				BackgroundTransparency = 1
			})

			if UIStroke3 and UIStroke3.Parent then
				v46(UIStroke3, tweenInfo, {
					Transparency = 1
				})
			end

			if UIStroke2 and UIStroke2.Parent then
				v46(UIStroke2, tweenInfo, {
					Transparency = 1
				})
			end
		end)
		task.delay(0.4, function()
			if Frame3.Parent then
				Frame3:Destroy()
			end
		end)
	end

	return {
		Close = function()
			if not Frame3:GetAttribute("Closing") then
				if Frame3.Parent then
					Frame3:SetAttribute("Closing", true)
					v828()

					return
				end
			end
		end
	}
end

local function v836()
	v213()

	local _Theme = t4._Theme
	local v838 = v20()
	local v839 = isMobile and math.max(150, math.min(v838.X - v33(24, 8), v33(340, 150))) or 400
	local v840 = v33(18, 6)
	local v841 = v33(16, 5)
	local BlurEffect = Instance.new("BlurEffect")

	BlurEffect.Size = 0
	BlurEffect:SetAttribute("MM2_UI_Blur", true)
	BlurEffect.Parent = game:GetService("Lighting")
	v46(BlurEffect, t1.Smooth, {
		Size = 14
	})

	local Frame3 = v40("Frame", {
		Parent = v240,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = _Theme.OverlayDim,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 500
	})

	v46(Frame3, t1.Smooth, {
		BackgroundTransparency = 1 - _Theme.OverlayDimAlpha * 0.78
	})
	Frame3:SetAttribute("_HasBlur", true)
	Frame3.AncestryChanged:Connect(function(child, parent)
		if not parent then
			if BlurEffect.Parent then
				v46(BlurEffect, t1.Default, {
					Size = 0
				})
				task.delay(0.18, function()
					if BlurEffect.Parent then
						BlurEffect:Destroy()
					end
				end)
			end
		end
	end)

	local Frame4 = v40("Frame", {
		Parent = Frame3,
		Size = UDim2.fromOffset(v839 * 0.92, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		BackgroundColor3 = _Theme.WindowBackground,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 501
	})

	v40("UICorner", {
		Parent = Frame4,
		CornerRadius = sizing.CornerRadiusLarge
	})

	local UIStroke2 = v40("UIStroke", {
		Parent = Frame4,
		Color = _Theme.Border,
		Thickness = 1,
		Transparency = 1
	})

	v46(Frame4, t1.Open, {
		Size = UDim2.fromOffset(v839, 0),
		BackgroundTransparency = 0
	})
	v46(UIStroke2, t1.Smooth, {
		Transparency = 0.3
	})
	v40("UIPadding", {
		Parent = Frame4,
		PaddingLeft = UDim.new(0, v840),
		PaddingRight = UDim.new(0, v840),
		PaddingTop = UDim.new(0, v841),
		PaddingBottom = UDim.new(0, v841)
	})
	v40("UIListLayout", {
		Parent = Frame4,
		Padding = UDim.new(0, v33(12, 4)),
		SortOrder = Enum.SortOrder.LayoutOrder
	})

	return Frame3, Frame4
end

t4.Confirm = function(p247, p248)
	local v846 = p248 or {}
	local _Theme = t4._Theme
	local v848, v849 = v836(v846)
	local connection2
	local u851 = false

	local function v852(p249)
		if u851 then
			return
		end

		u851 = true

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		v46(v848, t1.Default, {
			BackgroundTransparency = 1
		})
		task.delay(0.18, function()
			if v848.Parent then
				v848:Destroy()
			end
		end)

		if p249 then
			v48(p249)
		end
	end

	local v853 = v40
	local s10 = "TextLabel"

	v853(s10, {
		Parent = v849,
		Size = UDim2.new(1, 0, 0, v33(24, 10)),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamSemibold,
		TextSize = sizing.TitleFont,
		TextColor3 = _Theme.TextPrimary,
		Text = v846.Title or "Confirm",
		TextXAlignment = Enum.TextXAlignment.Left,
		LayoutOrder = 1
	})
	v40(s10, {
		Parent = v849,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Font = Enum.Font.Gotham,
		TextSize = sizing.BodyFont,
		TextColor3 = _Theme.TextSecondary,
		Text = v846.Content or "",
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		LayoutOrder = 2
	})

	local Frame3 = v40("Frame", {
		Parent = v849,
		Size = UDim2.new(1, 0, 0, v33(36, 14)),
		BackgroundTransparency = 1,
		LayoutOrder = 3
	})

	v40("UIListLayout", {
		Parent = Frame3,
		FillDirection = Enum.FillDirection.Horizontal,
		Padding = UDim.new(0, v33(8, 2)),
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		SortOrder = Enum.SortOrder.LayoutOrder
	})

	local v856 = v40
	local s11 = "TextButton"
	local v858 = v856(s11, {
		Parent = Frame3,
		Size = UDim2.fromOffset(v33(96, 36), v33(36, 14)),
		BackgroundColor3 = _Theme.CardBackground,
		BorderSizePixel = 0,
		Font = Enum.Font.GothamMedium,
		TextSize = sizing.BodyFont,
		TextColor3 = _Theme.TextPrimary,
		Text = v846.Cancel or "Cancel",
		AutoButtonColor = false
	})

	v40("UICorner", {
		Parent = v858,
		CornerRadius = sizing.CornerRadius
	})
	v858.MouseButton1Click:Connect(function()
		v852(v846.OnCancel)
	end)

	local Variant = v846.Variant or "Primary"
	local Danger = Variant == "Danger" and _Theme.Danger or Variant == "Success" and _Theme.Success or _Theme.Primary
	local TextButton = v40("TextButton", {
		Parent = Frame3,
		Size = UDim2.fromOffset(v33(110, 40), v33(36, 14)),
		BackgroundColor3 = Danger,
		BorderSizePixel = 0,
		Font = Enum.Font.GothamSemibold,
		TextSize = sizing.BodyFont,
		TextColor3 = _Theme.PrimaryText,
		Text = v846.Confirm or "Confirm",
		AutoButtonColor = false
	})

	v40("UICorner", {
		Parent = TextButton,
		CornerRadius = sizing.CornerRadius
	})
	TextButton.MouseButton1Click:Connect(function()
		v852(v846.OnConfirm)
	end)
	v848.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			local Position = input.Position
			local AbsolutePosition = v849.AbsolutePosition
			local AbsoluteSize = v849.AbsoluteSize

			if not (AbsolutePosition.X <= Position.X) or not (Position.X <= AbsolutePosition.X + AbsoluteSize.X) or not (AbsolutePosition.Y <= Position.Y) or not (Position.Y <= AbsolutePosition.Y + AbsoluteSize.Y) then
				v852(v846.OnCancel)
			end
		end
	end)
	connection2 = v5.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and input.KeyCode == Enum.KeyCode.Escape then
			v852(v846.OnCancel)
		end
	end)
end
t4.Prompt = function(p250, p251)
	local v865 = p251 or {}
	local _Theme = t4._Theme
	local v867, v868 = v836(v865)
	local connection2
	local u870 = false

	local function v871(p252, ...)
		if u870 then
			return
		end

		u870 = true

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		v46(v867, t1.Default, {
			BackgroundTransparency = 1
		})
		task.delay(0.18, function()
			if v867.Parent then
				v867:Destroy()
			end
		end)

		if p252 then
			v48(p252, ...)
		end
	end

	v40("TextLabel", {
		Parent = v868,
		Size = UDim2.new(1, 0, 0, v33(24, 10)),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamSemibold,
		TextSize = sizing.TitleFont,
		TextColor3 = _Theme.TextPrimary,
		Text = v865.Title or "Input",
		TextXAlignment = Enum.TextXAlignment.Left,
		LayoutOrder = 1
	})

	local TextBox = v40("TextBox", {
		Parent = v868,
		Size = UDim2.new(1, 0, 0, v33(36, 14)),
		BackgroundColor3 = _Theme.CardBackground,
		BorderSizePixel = 0,
		Font = Enum.Font.Gotham,
		TextSize = sizing.BodyFont,
		TextColor3 = _Theme.TextPrimary,
		PlaceholderText = v865.Placeholder or "",
		PlaceholderColor3 = _Theme.TextPlaceholder,
		Text = v865.Default or "",
		ClearTextOnFocus = false,
		LayoutOrder = 2
	})

	v40("UICorner", {
		Parent = TextBox,
		CornerRadius = sizing.CornerRadius
	})
	v40("UIStroke", {
		Parent = TextBox,
		Color = _Theme.Border,
		Thickness = 1
	})
	v40("UIPadding", {
		Parent = TextBox,
		PaddingLeft = UDim.new(0, v33(12, 4)),
		PaddingRight = UDim.new(0, v33(12, 4))
	})
	task.delay(0.1, function()
		if TextBox.Parent then
			TextBox:CaptureFocus()
		end
	end)

	local Frame3 = v40("Frame", {
		Parent = v868,
		Size = UDim2.new(1, 0, 0, v33(36, 14)),
		BackgroundTransparency = 1,
		LayoutOrder = 3
	})

	v40("UIListLayout", {
		Parent = Frame3,
		FillDirection = Enum.FillDirection.Horizontal,
		Padding = UDim.new(0, v33(8, 2)),
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		SortOrder = Enum.SortOrder.LayoutOrder
	})

	local TextButton = v40("TextButton", {
		Parent = Frame3,
		Size = UDim2.fromOffset(v33(96, 36), v33(36, 14)),
		BackgroundColor3 = _Theme.CardBackground,
		BorderSizePixel = 0,
		Font = Enum.Font.GothamMedium,
		TextSize = sizing.BodyFont,
		TextColor3 = _Theme.TextPrimary,
		Text = v865.Cancel or "Cancel",
		AutoButtonColor = false
	})

	v40("UICorner", {
		Parent = TextButton,
		CornerRadius = sizing.CornerRadius
	})
	TextButton.MouseButton1Click:Connect(function()
		v871(v865.OnCancel)
	end)

	local TextButton2 = v40("TextButton", {
		Parent = Frame3,
		Size = UDim2.fromOffset(v33(110, 40), v33(36, 14)),
		BackgroundColor3 = _Theme.Primary,
		BorderSizePixel = 0,
		Font = Enum.Font.GothamSemibold,
		TextSize = sizing.BodyFont,
		TextColor3 = _Theme.PrimaryText,
		Text = v865.Confirm or "Submit",
		AutoButtonColor = false
	})

	v40("UICorner", {
		Parent = TextButton2,
		CornerRadius = sizing.CornerRadius
	})
	TextButton2.MouseButton1Click:Connect(function()
		v871(v865.OnSubmit, TextBox.Text)
	end)
	TextBox.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			v871(v865.OnSubmit, TextBox.Text)
		end
	end)
	connection2 = v5.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and input.KeyCode == Enum.KeyCode.Escape then
			v871(v865.OnCancel)
		end
	end)
end

local t26 = {}

t26.__index = t26

local function v877(p253, p254)
	local v878 = p254 or {}
	local _Theme = t4._Theme
	local Items = v878.Items or {}
	local multi = v878.MultiSelect ~= false
	local ItemSize = v878.ItemSize or sizing.GridItemSize

	if isMobile and v878.ItemSize and not v878.MobileScaledItemSize then
		local MobileScale = sizing.MobileScale or 1

		ItemSize = Vector2.new(math.max(40, math.floor(ItemSize.X * MobileScale + 0.5)), math.max(48, math.floor(ItemSize.Y * MobileScale + 0.5)))
	end

	local X = ItemSize.X
	local Y = ItemSize.Y
	local GridItemPadding = sizing.GridItemPadding

	local function v887(p255)
		local t27 = {}
		local t28 = {}

		for i, v in ipairs(p255) do
			local t29 = {}

			for k, v2 in pairs(v) do
				t29[k] = v2
			end

			if t29.Id == nil then
				t29.Id = t29.Name and "name:" .. tostring(t29.Name) or "idx:" .. i
			end

			if t28[t29.Id] then
				local n11 = 2

				while t28[t29.Id .. "#" .. n11] do
					n11 += 1
				end

				t29.Id ..= "#" .. n11
			end

			t28[t29.Id] = true
			table.insert(t27, t29)
		end

		return t27
	end

	local v896 = v887(Items)
	local obj = setmetatable({}, t26)

	obj._Items = v896
	obj._Filtered = v896
	obj._Selected = {}
	obj._FilterFn = nil
	obj._Multi = multi
	obj._ModelCache = {}
	obj._CardsByItemId = {}

	local Frame3 = v40("Frame", {
		Parent = p253._GridArea or p253._FullCol,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1
	})
	local TextBox
	local TextLabel2
	local n12 = 0

	if v878.SearchBar then
		local MobileScale = isMobile and (sizing.MobileScale or 1) or 1
		local v903 = isMobile and math.max(16, math.floor(36 * MobileScale + 0.5)) or 36
		local v904 = isMobile and math.max(4, math.floor(8 * MobileScale + 0.5)) or 8
		local v905 = isMobile and math.max(36, math.floor(86 * MobileScale + 0.5)) or 86
		local v906 = isMobile and math.max(7, math.floor(16 * MobileScale + 0.5)) or 16
		local v907 = isMobile and math.max(5, math.floor(14 * MobileScale + 0.5)) or 14
		local v908 = v907 + v906 + math.max(4, math.floor(10 * MobileScale + 0.5))
		local Frame4 = v40("Frame", {
			Parent = Frame3,
			Size = UDim2.new(1, 0, 0, v903),
			BackgroundTransparency = 1
		})

		TextBox = v40("TextBox", {
			Parent = Frame4,
			Size = UDim2.new(1, -(v905 + v904), 1, 0),
			BackgroundColor3 = _Theme.CardBackground,
			BorderSizePixel = 0,
			Font = Enum.Font.Gotham,
			TextSize = sizing.BodyFont,
			TextColor3 = _Theme.TextPrimary,
			PlaceholderText = "Search items...",
			PlaceholderColor3 = _Theme.TextPlaceholder,
			Text = "",
			ClearTextOnFocus = false,
			TextXAlignment = Enum.TextXAlignment.Left
		})
		v40("UICorner", {
			Parent = TextBox,
			CornerRadius = sizing.CornerRadius
		})
		v40("UIStroke", {
			Parent = TextBox,
			Color = _Theme.Border,
			Thickness = 1
		})
		v40("UIPadding", {
			Parent = TextBox,
			PaddingLeft = UDim.new(0, v908),
			PaddingRight = UDim.new(0, isMobile and math.max(4, math.floor(12 * MobileScale + 0.5)) or 12)
		})
		v95(v40("Frame", {
			Parent = Frame4,
			Size = UDim2.fromOffset(v906, v906),
			Position = UDim2.new(0, v907, 0.5, -math.floor(v906 / 2)),
			BackgroundTransparency = 1,
			ZIndex = (TextBox.ZIndex or 1) + 1
		}), "search", v906, _Theme.TextSecondary)
		TextLabel2 = v40("TextLabel", {
			Parent = Frame4,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.fromOffset(v905, v903),
			BackgroundTransparency = 1,
			Font = Enum.Font.Gotham,
			TextSize = sizing.CaptionFont,
			TextColor3 = _Theme.TextSecondary,
			Text = "",
			TextXAlignment = Enum.TextXAlignment.Right
		})
		n12 = v903 + v904
	end

	local ScrollingFrame = v40("ScrollingFrame", {
		Parent = Frame3,
		Size = UDim2.new(1, 0, 1, -n12),
		Position = UDim2.fromOffset(0, n12),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = sizing.ScrollbarThickness,
		ScrollBarImageColor3 = _Theme.ScrollbarThumb,
		CanvasSize = UDim2.fromOffset(0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.None,
		ScrollingDirection = Enum.ScrollingDirection.Y
	})
	local v911 = 4 + v33(4, 1)

	obj._Container = Frame3
	obj._Scroll = ScrollingFrame

	local MobileScale = isMobile and (sizing.MobileScale or 1) or 1
	local v913 = isMobile and math.max(54, math.floor(140 * MobileScale + 0.5)) or 140
	local v914 = isMobile and math.max(12, math.floor(40 * MobileScale + 0.5)) or 40
	local v915 = isMobile and math.max(14, math.floor(40 * MobileScale + 0.5))

	v915 = v915 or 40

	local Frame4 = v40("Frame", {
		Parent = Frame3,
		Size = UDim2.new(1, 0, 0, v913),
		Position = UDim2.fromOffset(0, n12 + v914),
		BackgroundTransparency = 1,
		Visible = false,
		ZIndex = 2
	})

	v40("UIListLayout", {
		Parent = Frame4,
		FillDirection = Enum.FillDirection.Vertical,
		Padding = UDim.new(0, isMobile and math.max(2, math.floor(6 * MobileScale + 0.5)) or 6),
		VerticalAlignment = Enum.VerticalAlignment.Center,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder
	})

	local Frame5 = v40("Frame", {
		Parent = Frame4,
		Size = UDim2.fromOffset(v915, v915),
		BackgroundTransparency = 1,
		LayoutOrder = 1
	})

	v95(Frame5, "search", v915, _Theme.TextSecondary)

	local TextLabel3 = v40("TextLabel", {
		Parent = Frame4,
		Size = UDim2.fromOffset(isMobile and math.max(90, math.floor(220 * MobileScale + 0.5)) or 220, isMobile and math.max(10, math.floor(24 * MobileScale + 0.5)) or 24),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamSemibold,
		TextSize = sizing.BodyFont + 1,
		TextColor3 = _Theme.TextPrimary,
		Text = "No results found",
		LayoutOrder = 2
	})
	local TextLabel4 = v40("TextLabel", {
		Parent = Frame4,
		Size = UDim2.fromOffset(isMobile and math.max(110, math.floor(280 * MobileScale + 0.5)) or 280, isMobile and math.max(9, math.floor(18 * MobileScale + 0.5)) or 18),
		BackgroundTransparency = 1,
		Font = Enum.Font.Gotham,
		TextSize = sizing.CaptionFont,
		TextColor3 = _Theme.TextDisabled,
		Text = "Try a different search term",
		LayoutOrder = 3
	})

	local function v920()
		local t30 = {}

		for k in pairs(obj._Selected) do
			table.insert(t30, k)
		end

		v48(v878.OnSelectionChanged, t30)

		local _Window = p253._Window

		if _Window and _Window._UpdateStatus then
			_Window._UpdateStatus()
		end
	end
	local function v924(p256, p257)
		local v925 = (p257 - p256) % 6.2831853071795862

		if math.pi < v925 then
			v925 -= 6.2831853071795862
		end

		return v925
	end
	local function v926(p258, p259)
		if p258._RotDecay then
			p258._RotDecay:Disconnect()
			p258._RotDecay = nil
		end

		local v927 = v924(p259, p258._BaseTheta or 0)
		local n13 = 0

		local function v929(dt)
			if not p258.Frame or not p258.Frame.Parent then
				if p258._RotDecay then
					p258._RotDecay:Disconnect()
					p258._RotDecay = nil
				end

				return
			end

			n13 += dt

			local v930 = math.min(n13 / 0.42, 1)
			local currentTheta = p259 + v927 * (1 - (1 - v930) ^ 3)

			p258._CurrentTheta = currentTheta
			p258._SetCameraAtAngle(currentTheta, p258._ViewportLift or 0.45)

			if v930 >= 1 and p258._RotDecay then
				p258._RotDecay:Disconnect()
				p258._RotDecay = nil
			end
		end

		p258._RotDecay = v7.Heartbeat:Connect(v929)
	end
	local function v932(p260)
		if p260 then
			if p260._SetCameraAtAngle then
				local _RotReasons = p260._RotReasons
				local hover = _RotReasons and (_RotReasons.hover or _RotReasons.selected)

				if not hover or p260._RotConn then
					if not hover and p260._RotConn then
						p260._RotConn:Disconnect()
						p260._RotConn = nil

						if p260._BaseTheta and p260._SetCameraAtAngle then
							v926(p260, p260._CurrentTheta or p260._BaseTheta)
						end
					end
				else
					local v935 = p260._RotDecay ~= nil

					if p260._RotDecay then
						p260._RotDecay:Disconnect()
						p260._RotDecay = nil
					end

					local _CurrentTheta = p260._CurrentTheta or p260._BaseTheta or 0
					local u937 = v935 and 0.15 or 0

					p260._RotConn = v7.Heartbeat:Connect(function(dt)
						if not p260.Frame or not p260.Frame.Parent then
							if p260._RotConn then
								p260._RotConn:Disconnect()
								p260._RotConn = nil
							end

							return
						end

						u937 += dt
						_CurrentTheta += dt * (1.6 * (1 - (1 - math.min(u937 / 0.15, 1)) ^ 3))
						p260._CurrentTheta = _CurrentTheta
						p260._SetCameraAtAngle(_CurrentTheta, p260._ViewportLift or 0.45)
					end)
				end

				return
			end
		end
	end
	local function v938(p261)
		if not p261 or not p261.Item then
			return
		end

		if obj._Selected[p261.Item.Id] then
			p261.Frame.ZIndex = 3
			v46(p261.Stroke, t1.Smooth, {
				Transparency = 0,
				Thickness = 2
			})
			v46(p261.Glow, t1.Smooth, {
				Thickness = 5,
				Transparency = 0.5
			})
			v46(p261.Frame, t1.Smooth, {
				BackgroundColor3 = t4._Theme.CardBackgroundActive
			})
			v46(p261.NameLabel, t1.Smooth, {
				TextColor3 = t4._Theme.TextPrimary
			})
			p261.Check.Visible = true

			if p261.HoverStroke then
				v46(p261.HoverStroke, t1.Fast, {
					Thickness = 0
				})
			end

			if p261._RotReasons then
				p261._RotReasons.selected = true
			end

			v932(p261)
		else
			p261.Frame.ZIndex = 1
			v46(p261.Stroke, t1.Smooth, {
				Transparency = 1,
				Thickness = 2
			})
			v46(p261.Glow, t1.Smooth, {
				Thickness = 0,
				Transparency = 1
			})
			v46(p261.Frame, t1.Smooth, {
				BackgroundColor3 = t4._Theme.CardBackground
			})
			v46(p261.NameLabel, t1.Smooth, {
				TextColor3 = t4._Theme.TextSecondary
			})
			p261.Check.Visible = false

			if p261._RotReasons then
				p261._RotReasons.selected = nil
			end

			v932(p261)
		end
	end
	local function v939()
		for _, v in pairs(obj._CardsByItemId) do
			v938(v)
		end
	end
	local function v942(p262)
		local huge = math.huge
		local huge2 = math.huge
		local huge3 = math.huge
		local u946 = -math.huge
		local u947 = -math.huge
		local u948 = -math.huge
		local u949 = false

		local function v950(p263)
			if not p263:IsA("BasePart") then
				return
			end

			if p263.Transparency >= 0.98 then
				return
			end

			local v951 = string.lower(p263.Name or "")

			if v951 == "humanoidrootpart" or v951 == "rootpart" or v951 == "hitbox" then
				return
			end

			local CFrame_ = p263.CFrame
			local v953 = p263.Size * 0.5

			for i = -1, 1, 2 do
				for i2 = -1, 1, 2 do
					for i3 = -1, 1, 2 do
						local v957 = CFrame_:PointToWorldSpace(Vector3.new(v953.X * i, v953.Y * i2, v953.Z * i3))
						local v958 = math.min(huge, v957.X)
						local v959 = math.min(huge2, v957.Y)
						local v960 = math.min(huge3, v957.Z)

						huge = v958
						huge2 = v959
						huge3 = v960

						local v961 = math.max(u946, v957.X)
						local v962 = math.max(u947, v957.Y)
						local v963 = math.max(u948, v957.Z)

						u946 = v961
						u947 = v962
						u948 = v963
						u949 = true
					end
				end
			end
		end

		if p262:IsA("BasePart") then
			v950(p262)
		else
			for _, descendant in ipairs(p262:GetDescendants()) do
				v950(descendant)
			end
		end

		if not u949 then
			return nil
		end

		local vector3 = Vector3.new(huge, huge2, huge3)
		local vector32 = Vector3.new(u946, u947, u948)

		return CFrame.new((vector3 + vector32) * 0.5), vector32 - vector3
	end
	local function v968(p264)
		local Id = p264.Id
		local v970 = obj._ModelCache[Id]

		if v970 then
			return v970
		end

		local Model = p264.Model

		if typeof(Model) ~= "Instance" then
			local GetModel = p264.GetModel or p264.ModelProvider or v878.ModelProvider

			if typeof(GetModel) == "function" then
				local ok, model = pcall(GetModel, p264)

				if ok and typeof(model) == "Instance" then
					Model = model
					p264.Model = model
				end
			end
		end

		if typeof(Model) ~= "Instance" then
			return nil
		end

		local ok, result2 = pcall(function()
			return Model:Clone()
		end)

		if not ok or not result2 then
			return nil
		end

		for _, descendant in ipairs(result2:GetDescendants()) do
			if descendant:IsA("Script") or descendant:IsA("LocalScript") or descendant:IsA("ModuleScript") then
				pcall(function()
					descendant:Destroy()
				end)
			end
		end

		local cFrame, vector3

		if result2:IsA("Model") then
			local ok3, result3, result4 = pcall(result2.GetBoundingBox, result2)

			if ok3 then
				cFrame = result3
				vector3 = result4
			else
				cFrame = CFrame.new()
				vector3 = Vector3.new(1, 1, 1)
			end

			if p264.VisibleBounds or v878.VisibleBounds then
				local v984, v985 = v942(result2)

				if v984 and v985 then
					cFrame = v984
					vector3 = v985
				end
			end

			if result2.PrimaryPart == nil then
				for _, descendant in ipairs(result2:GetDescendants()) do
					if descendant:IsA("BasePart") then
						result2.PrimaryPart = descendant

						break
					end
				end
			end
		elseif result2:IsA("BasePart") then
			cFrame = result2.CFrame
			vector3 = result2.Size
		else
			cFrame = CFrame.new()
			vector3 = Vector3.new(1, 1, 1)
		end

		local t31 = {
			instance = result2,
			cf = cFrame,
			size = vector3
		}

		obj._ModelCache[Id] = t31

		return t31
	end
	local function v989(p265)
		for k, v in pairs(obj._ModelCache) do
			if not p265[k] then
				pcall(function()
					v.instance:Destroy()
				end)
				obj._ModelCache[k] = nil
			end
		end
	end
	local function v992(p266, p267)
		local MobileScale2 = isMobile and (sizing.MobileScale or 1) or 1
		local v995 = isMobile and math.max(3, math.floor(8 * MobileScale2 + 0.5)) or 8
		local v996 = math.max(3, math.floor(v995 / 2))
		local v997 = isMobile and math.max(8, math.floor(18 * MobileScale2 + 0.5)) or 18
		local v998 = isMobile and math.max(7, math.floor(12 * MobileScale2 + 0.5))

		v998 = v998 or 12

		local v999 = isMobile and math.max(2, math.floor(4 * MobileScale2 + 0.5)) or 4
		local v1000 = isMobile and math.max(1, math.floor(3 * MobileScale2 + 0.5)) or 2
		local v1001 = isMobile and math.max(8, math.floor(18 * MobileScale2 + 0.5)) or 18
		local v1002 = isMobile and math.max(2, math.floor(5 * MobileScale2 + 0.5)) or 5
		local v1003 = isMobile and math.max(2, math.floor(6 * MobileScale2 + 0.5))

		v1003 = v1003 or 6

		local v1004 = isMobile and math.max(9, math.floor(20 * MobileScale2 + 0.5)) or 20
		local v1005 = math.max(6, math.floor(v1004 * 0.7 + 0.5))
		local v1006 = math.floor((v1004 - v1005) / 2)
		local Frame6 = v40("Frame", {
			Size = UDim2.fromOffset(p267, Y),
			BackgroundColor3 = t4._Theme.CardBackground,
			BorderSizePixel = 0
		})

		v40("UICorner", {
			Parent = Frame6,
			CornerRadius = sizing.CornerRadius
		})

		local UIGradient = v40("UIGradient", {
			Parent = Frame6,
			Rotation = 90,
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
				ColorSequenceKeypoint.new(1, Color3.new(0.97, 0.97, 0.97))
			})
		})
		local UIStroke2 = v40("UIStroke", {
			Parent = Frame6,
			Color = t4._Theme.AccentSolid,
			Thickness = 2,
			Transparency = 1
		})
		local UIStroke3 = v40("UIStroke", {
			Parent = Frame6,
			Color = t4._Theme.AccentSolid,
			Thickness = 0,
			Transparency = 0.5,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		})
		local Frame7 = v40("Frame", {
			Parent = Frame6,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0
		})
		local ImageLabel = v40("ImageLabel", {
			Parent = Frame7,
			Size = UDim2.new(0.86, 0, sizing.GridItemImageRatio, 0),
			Position = UDim2.fromScale(0.5, 0.06),
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundTransparency = 1,
			Image = "",
			ScaleType = Enum.ScaleType.Fit,
			Visible = false,
			ZIndex = 2
		})
		local ViewportFrame = v40("ViewportFrame", {
			Parent = Frame7,
			Size = UDim2.new(0.92, 0, sizing.GridItemImageRatio + 0.04, 0),
			Position = UDim2.fromScale(0.5, 0.04),
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Ambient = Color3.fromRGB(195, 195, 210),
			LightColor = Color3.fromRGB(255, 250, 240),
			LightDirection = Vector3.new(-0.5, -1, -0.7),
			Visible = false,
			ZIndex = 2
		})
		local Camera = Instance.new("Camera")

		Camera.FieldOfView = 50
		Camera.Parent = ViewportFrame
		ViewportFrame.CurrentCamera = Camera

		local Frame8 = v40("Frame", {
			Parent = Frame7,
			Size = UDim2.new(0.7, 0, sizing.GridItemImageRatio - 0.1, 0),
			Position = UDim2.fromScale(0.5, 0.1),
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = t4._Theme.AccentMuted,
			BorderSizePixel = 0,
			Visible = false,
			ZIndex = 2
		})

		v40("UICorner", {
			Parent = Frame8,
			CornerRadius = sizing.CornerRadius
		})
		v40("UIGradient", {
			Parent = Frame8,
			Rotation = 135,
			Color = ColorSequence.new(t4._Theme.AccentGradientFrom, t4._Theme.AccentGradientTo)
		})

		local TextLabel5 = v40("TextLabel", {
			Parent = Frame8,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamBold,
			TextSize = math.floor(Y * 0.32),
			TextColor3 = t4._Theme.PrimaryText,
			Text = "?"
		})
		local TextLabel6 = v40("TextLabel", {
			Parent = Frame7,
			Size = UDim2.new(1, -v995, 0, v998),
			Position = UDim2.new(0, v996, 1, -(v997 + v998 + v999 + v1000)),
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamMedium,
			TextSize = sizing.CaptionFont - 1,
			TextColor3 = t4._Theme.TextSecondary,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd,
			Text = "",
			Visible = false,
			ZIndex = 3
		})
		local TextLabel7 = v40("TextLabel", {
			Parent = Frame7,
			Size = UDim2.new(1, -v995, 0, v997),
			Position = UDim2.new(0, v996, 1, -(v997 + v999)),
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamMedium,
			TextSize = sizing.CaptionFont,
			TextColor3 = t4._Theme.TextSecondary,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 3
		})
		local Frame9 = v40("Frame", {
			Parent = Frame7,
			Size = UDim2.fromOffset(0, v1001),
			AutomaticSize = Enum.AutomaticSize.X,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -v1003, 0, v1003),
			BackgroundColor3 = t4._Theme.Primary,
			BorderSizePixel = 0,
			Visible = false,
			ZIndex = 4
		})

		v40("UICorner", {
			Parent = Frame9,
			CornerRadius = UDim.new(0, math.max(2, math.floor(3 * MobileScale2 + 0.5)))
		})
		v40("UIPadding", {
			Parent = Frame9,
			PaddingLeft = UDim.new(0, v1002),
			PaddingRight = UDim.new(0, v1002)
		})

		local TextLabel8 = v40("TextLabel", {
			Parent = Frame9,
			Size = UDim2.new(0, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamBold,
			TextSize = math.max(isMobile and 6 or 10, sizing.CaptionFont - 2),
			TextColor3 = t4._Theme.PrimaryText,
			Text = "",
			ZIndex = 5
		})
		local Frame10 = v40("Frame", {
			Parent = Frame7,
			Size = UDim2.fromOffset(v1004, v1004),
			Position = UDim2.fromOffset(v1003, v1003),
			BackgroundColor3 = t4._Theme.AccentSolid,
			BorderSizePixel = 0,
			Visible = false,
			ZIndex = 4
		})

		v40("UICorner", {
			Parent = Frame10,
			CornerRadius = UDim.new(1, 0)
		})
		v95(Frame10, "check", v1005, Color3.fromRGB(255, 255, 255)).Position = UDim2.fromOffset(v1006, v1006)

		local TextButton = v40("TextButton", {
			Parent = Frame7,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			Text = "",
			ZIndex = 5
		})
		local t32 = {
			Frame = Frame6,
			PulseHost = Frame7,
			Stroke = UIStroke2,
			Glow = UIStroke3,
			CardGradient = UIGradient,
			Image = ImageLabel,
			Viewport = ViewportFrame,
			Camera = Camera,
			Fallback = Frame8,
			FallbackText = TextLabel5,
			Subtitle = TextLabel6,
			NameLabel = TextLabel7,
			Badge = Frame9,
			BadgeText = TextLabel8,
			Check = Frame10,
			Clicker = TextButton,
			Item = p266,
			ViewportContent = nil,
			_Lifted = false
		}

		TextLabel7.Text = p266.Name or p266.Id or "?"

		if p266.BackgroundColor3 then
			Frame6.BackgroundColor3 = p266.BackgroundColor3
		end

		if p266.Subtitle then
			TextLabel6.Visible = true
			TextLabel6.Text = p266.Subtitle
		end

		if p266.Badge then
			Frame9.Visible = true
			TextLabel8.Text = p266.Badge
			Frame9.BackgroundColor3 = p266.BadgeColor or t4._Theme.AccentSolid
		end

		if p266.Model and typeof(p266.Model) == "Instance" or typeof(p266.GetModel) == "function" or typeof(p266.ModelProvider) == "function" or typeof(v878.ModelProvider) == "function" then
			local v1023 = v968(p266)

			if v1023 then
				ViewportFrame.Visible = true
				v1023.instance.Parent = ViewportFrame
				t32.ViewportContent = v1023.instance

				local size = v1023.size
				local v1025 = math.max(size.X, size.Y, size.Z)

				if v1025 <= 0 then
					v1025 = 1
				end

				local v1026 = tonumber(p266.ViewportZoom or v878.ViewportZoom) or 1.35
				local viewportLift = tonumber(p266.ViewportLift or v878.ViewportLift) or 0.45
				local baseTheta = tonumber(p266.ViewportTheta or v878.ViewportTheta) or 0.78539816339744828
				local ViewportOffset = p266.ViewportOffset or v878.ViewportOffset

				if typeof(ViewportOffset) ~= "Vector3" then
					ViewportOffset = Vector3.new()
				end

				local v1030 = v1025 * v1026
				local v1031 = v1023.cf.Position + ViewportOffset

				local function setCameraAtAngle(p268, p269)
					Camera.CFrame = CFrame.new(v1031 + Vector3.new(math.cos(p268) * v1030 * 0.85, v1030 * (p269 or viewportLift), math.sin(p268) * v1030 * 0.85), v1031)
				end

				setCameraAtAngle(0.78539816339744828, 0.45)
				t32._SetCameraAtAngle = setCameraAtAngle
				t32._BaseTheta = 0.78539816339744828

				if baseTheta ~= 0.78539816339744828 or viewportLift ~= 0.45 then
					setCameraAtAngle(baseTheta, viewportLift)
					t32._BaseTheta = baseTheta
				end

				t32._ViewportLift = viewportLift
			elseif not p266.Image or p266.Image == "" then
				Frame8.Visible = true
				TextLabel5.Text = (p266.Name or p266.Id or "?"):sub(1, 1):upper()
			else
				ImageLabel.Visible = true
				ImageLabel.Image = p266.Image
			end
		elseif not p266.Image or p266.Image == "" then
			Frame8.Visible = true
			TextLabel5.Text = (p266.Name or p266.Id or "?"):sub(1, 1):upper()
		else
			ImageLabel.Visible = true
			ImageLabel.Image = p266.Image
		end

		local UIStroke4 = v40("UIStroke", {
			Parent = Frame6,
			Color = t4._Theme.AccentSolid,
			Thickness = 0,
			Transparency = 0.4,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		})

		t32.HoverStroke = UIStroke4

		if t32._SetCameraAtAngle and (v878.HoverRotate or p266.HoverRotate) then
			t32._RotReasons = t32._RotReasons or {}
		end

		local function v1034()
			if t32._Lifted then
				return
			end

			t32._Lifted = true

			if not obj._Selected[p266.Id] then
				v46(Frame6, t1.Default, {
					BackgroundColor3 = t4._Theme.CardBackgroundHover
				})
				v46(UIStroke4, t1.Default, {
					Thickness = 1.5
				})
			end

			if t32._RotReasons then
				t32._RotReasons.hover = true
				v932(t32)
			end
		end
		local function v1035()
			if t32._RotReasons then
				t32._RotReasons.hover = nil
				v932(t32)
			end

			if not t32._Lifted then
				return
			end

			t32._Lifted = false

			if not obj._Selected[p266.Id] then
				v46(Frame6, t1.Default, {
					BackgroundColor3 = t4._Theme.CardBackground
				})
				v46(UIStroke4, t1.Default, {
					Thickness = 0
				})
			end
		end

		TextButton.MouseEnter:Connect(v1034)
		TextButton.MouseLeave:Connect(v1035)

		if t32._SetCameraAtAngle and (v878.AutoRotate or p266.AutoRotate) then
			local _BaseTheta = t32._BaseTheta or 0
			local connection2

			connection2 = v7.Heartbeat:Connect(function(dt)
				if not t32.Frame.Parent then
					if connection2 then
						connection2:Disconnect()
						connection2 = nil
					end

					return
				end

				_BaseTheta += dt * 0.8
				t32._SetCameraAtAngle(_BaseTheta, t32._ViewportLift or 0.45)
			end)
			t32._AutoRotConn = connection2
		end

		TextButton.MouseButton1Click:Connect(function()
			local UIScale = Frame7:FindFirstChildOfClass("UIScale") or v40("UIScale", {
				Parent = Frame7,
				Scale = 1
			})

			v46(UIScale, t1.Fast, {
				Scale = 0.94
			})
			task.delay(0.08, function()
				if UIScale.Parent then
					v46(UIScale, t1.Spring, {
						Scale = 1
					})
				end
			end)
			task.delay(0.15, function()
				if Frame6.Parent and t32.Item then
					t32._Lifted = false
				end
			end)

			if multi then
				obj._Selected[p266.Id] = not obj._Selected[p266.Id] or nil
			else
				table.clear(obj._Selected)
				obj._Selected[p266.Id] = true
			end

			v939()
			v920()

			if not multi then
				v48(v878.OnCardActivate, p266)
			end
		end)

		if v878.OnCardDoubleClick then
			local n14 = 0

			TextButton.MouseButton1Click:Connect(function()
				local now = tick()

				if now - n14 < 0.3 then
					v48(v878.OnCardDoubleClick, p266)
				end

				n14 = now
			end)
		end

		return t32
	end

	obj._ActiveRows = {}
	obj._RowPool = {}
	obj._RowMeta = {}

	local v1041 = Y
	local v1042 = v1041 + GridItemPadding
	local n15 = 1
	local u1044 = X

	local function v1045()
		local Frame6 = v40("Frame", {
			Parent = ScrollingFrame,
			Size = UDim2.new(1, -v911 * 2, 0, v1041),
			BackgroundTransparency = 1,
			Visible = false
		})

		v40("UIListLayout", {
			Parent = Frame6,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, GridItemPadding),
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center
		})

		return Frame6
	end
	local function v1047(p270)
		local v1048 = obj._RowMeta[p270]

		if v1048 then
			for _, v in ipairs(v1048) do
				if v._RotConn then
					v._RotConn:Disconnect()
					v._RotConn = nil
				end

				if v._RotDecay then
					v._RotDecay:Disconnect()
					v._RotDecay = nil
				end

				if v._AutoRotConn then
					v._AutoRotConn:Disconnect()
					v._AutoRotConn = nil
				end

				if v._RotReasons then
					v._RotReasons.hover = nil
					v._RotReasons.selected = nil
				end

				if v.Item and v.Item.Id then
					if v.ViewportContent then
						v.ViewportContent.Parent = nil
					end

					obj._CardsByItemId[v.Item.Id] = nil
				end

				if v.Frame.Parent then
					v.Frame:Destroy()
				end
			end

			obj._RowMeta[p270] = nil
		end
	end
	local function v1051()
		return table.remove(obj._RowPool) or v1045()
	end
	local function v1052(p271, p272, p273)
		v1047(p271)
		p271.Position = UDim2.fromOffset(v911, v911 + (p272 - 1) * v1042)
		p271.Visible = true

		local t33 = {}
		local v1054 = (p272 - 1) * n15 + 1

		for i = 1, n15 do
			local v1056 = obj._Filtered[v1054 + i - 1]

			if not v1056 then
				break
			end

			local v1057 = v992(v1056, u1044)

			v1057.Frame.Parent = p271
			v1057.Frame.LayoutOrder = i
			obj._CardsByItemId[v1056.Id] = v1057
			table.insert(t33, v1057)
			v938(v1057)

			if p273 then
				local Position = v1057.Frame.Position
				local BackgroundTransparency = v1057.Frame.BackgroundTransparency

				v1057.Frame.BackgroundTransparency = 1
				v1057.Frame.Position = Position + UDim2.fromOffset(0, v33(14, 5))

				for _, descendant in ipairs(v1057.Frame:GetDescendants()) do
					if descendant:IsA("ImageLabel") then
						descendant.ImageTransparency = 1
					elseif descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
						if descendant.TextTransparency ~= nil then
							descendant.TextTransparency = 1
						end
					end
				end

				task.delay((i - 1) % 12 * 0.018, function()
					if not v1057.Frame.Parent then
						return
					end

					v46(v1057.Frame, t1.Stagger, {
						Position = Position,
						BackgroundTransparency = BackgroundTransparency
					})

					for _, descendant in ipairs(v1057.Frame:GetDescendants()) do
						if descendant:IsA("ImageLabel") then
							v46(descendant, t1.Stagger, {
								ImageTransparency = 0
							})
						elseif (descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox")) and descendant.TextTransparency ~= nil then
							v46(descendant, t1.Stagger, {
								TextTransparency = 0
							})
						end
					end
				end)
			end
		end

		obj._RowMeta[p271] = t33
	end
	local function v1064(p274)
		local v1065 = obj._ActiveRows[p274]

		if not v1065 then
			return
		end

		v1047(v1065)
		v1065.Visible = false
		obj._ActiveRows[p274] = nil
		table.insert(obj._RowPool, v1065)
	end
	local function v1066()
		for k in pairs(obj._ActiveRows) do
			v1064(k)
		end
	end
	local function v1068()
		local v1069 = ScrollingFrame.AbsoluteSize.X - v911 * 2

		if v1069 <= 0 then
			return false
		end

		n15 = math.max(1, math.floor((v1069 + GridItemPadding) / (X + GridItemPadding)))
		u1044 = math.floor((v1069 - (n15 - 1) * GridItemPadding) / n15)

		return true
	end
	local function v1070(p275)
		if not v1068() then
			local function v1071()
				if ScrollingFrame.Parent then
					v1070(p275)
				end
			end

			task.defer(v1071)

			return
		end

		local v1072 = #obj._Filtered

		Frame4.Visible = v1072 == 0

		if v1072 == 0 then
			if #obj._Items == 0 then
				TextLabel3.Text = "No items yet"
				TextLabel4.Text = "Items will appear here when added"
			else
				TextLabel3.Text = "No results found"
				TextLabel4.Text = "Try a different search term"
			end

			v1066()
			ScrollingFrame.CanvasSize = UDim2.fromOffset(0, 0)

			return
		end

		local v1073 = math.ceil(v1072 / n15)

		ScrollingFrame.CanvasSize = UDim2.fromOffset(0, v911 * 2 + v1073 * v1041 + math.max(0, v1073 - 1) * GridItemPadding)

		local Y2 = ScrollingFrame.CanvasPosition.Y
		local Y3 = ScrollingFrame.AbsoluteSize.Y

		if Y3 <= 0 then
			return
		end

		local v1076 = math.max(1, math.floor((Y2 - v911) / v1042) + 1 - 2)
		local v1077 = math.min(v1073, math.ceil((Y2 + Y3 - v911) / v1042) + 2)

		for k in pairs(obj._ActiveRows) do
			if k < v1076 or v1077 < k then
				v1064(k)
			end
		end

		for i = v1076, v1077 do
			if not obj._ActiveRows[i] then
				local v1080 = v1051()

				obj._ActiveRows[i] = v1080
				v1052(v1080, i, p275)
			end
		end
	end
	local function v1081(p276)
		v1066()
		v1070(p276)
	end

	v195(ScrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		v1070(false)
	end))

	local n16 = 0

	v195(ScrollingFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		n16 += 1

		local v1083 = n16

		task.delay(0.04, function()
			if v1083 == n16 then
				if ScrollingFrame.Parent then
					v1066()
					v1070(false)
				end
			end
		end)
	end))

	if TextBox then
		local n17 = 0

		v195(TextBox:GetPropertyChangedSignal("Text"):Connect(function()
			n17 += 1

			local v1085 = n17

			task.delay(0.1, function()
				if v1085 ~= n17 or not TextBox.Parent then
					return
				end

				local v1086 = string.lower(TextBox.Text)

				if v1086 == "" then
					obj._Filtered = obj._Items
				else
					local filtered = {}

					for _, item in ipairs(obj._Items) do
						local lower = string.lower
						local concat = table.concat
						local t34 = {}
						local v1093 = tostring(item.Name or "")
						local v1094 = tostring(item.Id or "")
						local v1095 = tostring(item.Subtitle or "")
						local v1096 = tostring(item.Badge or "")
						local tostring_ = tostring
						local _SearchText = item._SearchText or ""

						do
							local values = table.pack(v1093, v1094, v1095, v1096, tostring_(_SearchText))

							table.move(values, 1, values.n, 1, t34)
						end

						if string.find(lower(concat(t34, " ")), v1086, 1, true) then
							table.insert(filtered, item)
						end
					end

					obj._Filtered = filtered
				end

				if TextLabel2 then
					TextLabel2.Text = ("%d / %d"):format(#obj._Filtered, #obj._Items)
				end

				ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
				v1081(true)
			end)
		end))
	end

	task.defer(function()
		if TextLabel2 then
			TextLabel2.Text = ("%d items"):format(#obj._Items)
		end

		v1081(true)
	end)

	local v1100 = v196(function(p277)
		ScrollingFrame.ScrollBarImageColor3 = p277.ScrollbarThumb

		if TextBox then
			TextBox.BackgroundColor3 = p277.CardBackground
			TextBox.TextColor3 = p277.TextPrimary
			TextBox.PlaceholderColor3 = p277.TextPlaceholder
		end

		if TextLabel2 then
			TextLabel2.TextColor3 = p277.TextSecondary
		end

		TextLabel3.TextColor3 = p277.TextPrimary
		TextLabel4.TextColor3 = p277.TextSecondary
		v119(Frame5, p277.TextSecondary)

		for _, v in pairs(obj._CardsByItemId) do
			if v.Frame and v.Frame.Parent then
				v.Stroke.Color = p277.AccentSolid
				v.Glow.Color = p277.AccentSolid

				if v.HoverStroke then
					v.HoverStroke.Color = p277.AccentSolid
				end

				if not obj._Selected[v.Item.Id] then
					v.Frame.BackgroundColor3 = p277.CardBackground
				end

				if v.Fallback then
					v.Fallback.BackgroundColor3 = p277.AccentMuted

					for _, child in ipairs(v.Fallback:GetChildren()) do
						if child:IsA("UIGradient") then
							child.Color = ColorSequence.new(p277.AccentGradientFrom, p277.AccentGradientTo)
						end
					end

					if v.FallbackText then
						v.FallbackText.TextColor3 = p277.PrimaryText
					end
				end

				if v.Subtitle then
					v.Subtitle.TextColor3 = p277.TextSecondary
				end

				if v.NameLabel and not obj._Selected[v.Item.Id] then
					v.NameLabel.TextColor3 = p277.TextSecondary
				end

				if v.Badge then
					v.Badge.BackgroundColor3 = v.Item and v.Item.BadgeColor or p277.AccentSolid
				end

				if v.BadgeText then
					v.BadgeText.TextColor3 = p277.PrimaryText
				end

				if v.Check then
					v.Check.BackgroundColor3 = p277.AccentSolid
				end

				v938(v)
			end
		end
	end)

	obj._Unsubscribe = v1100
	obj.SelectAll = function(p278)
		for _, v in ipairs(p278._Filtered) do
			p278._Selected[v.Id] = true
		end

		v939()
		v920()
	end
	obj.Clear = function(p279)
		table.clear(p279._Selected)
		v939()
		v920()
	end
	obj.GetSelected = function(p280)
		local t35 = {}

		for k in pairs(p280._Selected) do
			table.insert(t35, k)
		end

		return t35
	end
	obj.SetItems = function(p281, p282)
		local v1109 = v887(p282 or {})
		local t36 = {}

		for _, v in ipairs(v1109) do
			t36[v.Id] = true
		end

		v989(t36)
		p281._Items = v1109

		if p281._FilterFn then
			local filtered = {}

			for _, item in ipairs(p281._Items) do
				if p281._FilterFn(item) then
					table.insert(filtered, item)
				end
			end

			p281._Filtered = filtered
		else
			p281._Filtered = p281._Items
		end

		table.clear(p281._Selected)

		if TextLabel2 then
			TextLabel2.Text = ("%d items"):format(#p281._Items)
		end

		ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
		v1081(true)
		v920()
	end
	obj.Filter = function(p283, p284)
		p283._FilterFn = p284

		if p284 then
			local filtered = {}

			for _, item in ipairs(p283._Items) do
				if p284(item) then
					table.insert(filtered, item)
				end
			end

			p283._Filtered = filtered
		else
			p283._Filtered = p283._Items
		end

		local t37 = {}

		for _, v in ipairs(p283._Filtered) do
			t37[v.Id] = true
		end

		for k in pairs(p283._Selected) do
			if not t37[k] then
				p283._Selected[k] = nil
			end
		end

		ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
		v1081(true)
	end
	obj.Refresh = function()
		v1081(true)
	end
	obj.Destroy = function(p285)
		v1100()
		v1066()

		for _, v in ipairs(p285._RowPool) do
			if v.Parent then
				v:Destroy()
			end
		end

		table.clear(p285._RowPool)
		table.clear(p285._RowMeta)

		for _, v in pairs(p285._ModelCache) do
			pcall(function()
				v.instance:Destroy()
			end)
		end

		table.clear(p285._ModelCache)
		Frame3:Destroy()
	end

	return obj
end

local t38 = {}

t38.__index = t38
t38.CreateSection = function(p286, p287)
	if type(p287) == "string" then
		return v475(p286, p287, nil)
	end

	if type(p287) == "table" then
		return v475(p286, p287.Name, p287.Side)
	end
end
t38.AddItemGrid = function(p288, p289)
	if p288._FullCol then
		p288._FullCol.Visible = false
	end

	if not p288._GridArea then
		p288._GridArea = v40("Frame", {
			Parent = p288._Page,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0
		})
	end

	local v1128 = v877(p288, p289)

	p288._Grids = p288._Grids or {}
	table.insert(p288._Grids, v1128)

	return v1128
end
t38.SetActive = function(p290)
	if p290._Window then
		p290._Window:_SetActiveTab(p290)
	end
end
t38.Remove = function(p291)
	if p291._Window then
		p291._Window:_RemoveTab(p291)
	end
end
t38.SetActionBar = function(p292, p293)
	p292._ActionBarConfig = p293

	local _Window = p292._Window

	if _Window and _Window._ActiveTab == p292 and _Window._RebuildFooterFromActiveTab then
		_Window:_RebuildFooterFromActiveTab()
	end
end
t38.ClearActionBar = function(p294)
	p294:SetActionBar(nil)
end
t38.Rename = function(p295, p296)
	p295._Name = p296

	if p295._TabLabel then
		p295._TabLabel.Text = p296
	end
end

local t39 = {}

t39.__index = t39
t4.CreateWindow = function(p297, p298)
	local v1131 = p298 or {}
	local _Theme = t4._Theme
	local Size = v1131.Size or UDim2.fromOffset(sizing.DefaultWindowSize.X, sizing.DefaultWindowSize.Y)
	local MinSize = v1131.MinSize or sizing.MinWindowSize
	local MaxSize = v1131.MaxSize or sizing.MaxWindowSize

	if v1131.Theme then
		t4:SetTheme(v1131.Theme)
	end

	if isMobile then
		v26(s1)
		v31()

		if not v1131.Size then
			Size = UDim2.fromOffset(sizing.DefaultWindowSize.X, sizing.DefaultWindowSize.Y)
		end

		if not v1131.MinSize then
			MinSize = sizing.MinWindowSize
		end

		if not v1131.MaxSize then
			MaxSize = sizing.MaxWindowSize
		end

		local v1136 = v20()
		local MobileScale = sizing.MobileScale or v21()
		local v1138 = math.max(4, math.floor(16 * MobileScale + 0.5))
		local v1139 = math.max(160, v1136.X - v1138 * 2)
		local v1140 = math.max(120, v1136.Y - v1138 * 2)
		local Offset = Size.X.Offset > 0 and Size.X.Offset or sizing.DefaultWindowSize.X
		local Offset2 = Size.Y.Offset > 0 and Size.Y.Offset or sizing.DefaultWindowSize.Y

		if v1131.Size and not v1131.MobileScaled then
			Offset *= MobileScale
			Offset2 *= MobileScale
		end

		local v1143 = v54(Offset, math.min(sizing.MinWindowSize.X, v1139), v1139)
		local v1144 = v54(Offset2, math.min(sizing.MinWindowSize.Y, v1140), v1140)

		Size = UDim2.fromOffset(v1143, v1144)
		MinSize = Vector2.new(math.min(MinSize.X, v1143, sizing.MinWindowSize.X, v1139), math.min(MinSize.Y, v1144, sizing.MinWindowSize.Y, v1140))
		MaxSize = Vector2.new(math.max(MinSize.X, math.min(MaxSize.X, v1139)), math.max(MinSize.Y, math.min(MaxSize.Y, v1140)))
	end

	local obj = setmetatable({}, t39)

	obj._Tabs = {}
	obj._ActiveTab = nil
	obj._Connections = {}
	obj._Unsubscribers = {}

	local Frame3 = v40("Frame", {
		Parent = v237,
		Size = Size,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1
	})
	local UISizeConstraint = v40("UISizeConstraint", {
		Parent = Frame3,
		MinSize = MinSize,
		MaxSize = MaxSize
	})
	local v1148 = v79
	local v1149 = Frame3
	local t40 = {
		Spread = isMobile and 18 or 22
	}

	t40.Opacity = math.min(_Theme.ShadowOpacity, 0.42)
	t40.Color = _Theme.ShadowColor
	t40.YOffset = 8
	v1148(v1149, t40)

	local Frame4 = v40("Frame", {
		Parent = Frame3,
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromScale(0, 0),
		BackgroundColor3 = _Theme.WindowBackground,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ZIndex = 1
	})

	v40("UICorner", {
		Parent = Frame4,
		CornerRadius = sizing.CornerRadiusLarge
	})

	local UIStroke2 = v40("UIStroke", {
		Parent = Frame4,
		Color = _Theme.Border,
		Thickness = 1.5,
		Transparency = 0.3
	})
	local Position = Frame3.Position

	Frame3.Size = UDim2.fromOffset(Size.X.Offset * 0.94, Size.Y.Offset * 0.94)
	Frame3.Position = Position + UDim2.fromOffset(0, v33(24, 8))
	Frame4.BackgroundTransparency = 1
	UIStroke2.Transparency = 1
	v46(Frame3, t1.Open, {
		Size = Size,
		Position = Position
	})
	v46(Frame4, t1.Smooth, {
		BackgroundTransparency = 0
	})
	task.delay(0.1, function()
		if UIStroke2.Parent then
			v46(UIStroke2, t1.Smooth, {
				Transparency = 0.3
			})
		end
	end)

	local Frame5 = v40("Frame", {
		Parent = Frame4,
		Size = UDim2.new(1, 0, 0, sizing.HeaderHeight),
		BackgroundColor3 = _Theme.HeaderBackground,
		BorderSizePixel = 0,
		ZIndex = 2
	})

	v40("UICorner", {
		Parent = Frame5,
		CornerRadius = sizing.CornerRadiusLarge
	})

	local Frame6 = v40("Frame", {
		Parent = Frame5,
		Position = UDim2.new(0, 0, 1, -1),
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundColor3 = _Theme.Border,
		BorderSizePixel = 0,
		BackgroundTransparency = 0.3
	})
	local v1156 = math.floor(sizing.HeaderHeight * 0.66)
	local v1157 = math.floor((sizing.HeaderHeight - v1156) / 2)

	local function v1158(p299, p300, p301)
		local v1159 = v40
		local s12 = "TextButton"
		local v1161 = v1159(s12, {
			Parent = Frame5,
			Size = UDim2.fromOffset(v1156, v1156),
			Position = p300 < 0 and UDim2.new(1, p300 - v1156, 0, v1157) or UDim2.fromOffset(p300, v1157),
			AnchorPoint = p300 < 0 and Vector2.new(0, 0) or Vector2.new(0, 0),
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			Text = ""
		})

		v40("UICorner", {
			Parent = v1161,
			CornerRadius = sizing.CornerRadiusSmall
		})
		v67(v1161)

		local v1162 = math.floor(v1156 * 0.7)
		local v1163 = math.floor((v1156 - v1162) / 2)
		local Frame7 = v40("Frame", {
			Parent = v1161,
			Size = UDim2.fromOffset(v1162, v1162),
			Position = UDim2.fromOffset(v1163, v1163),
			BackgroundTransparency = 1
		})

		v95(Frame7, p299, v1162, _Theme.TextSecondary)
		v1161.BackgroundColor3 = p301 and _Theme.Danger or _Theme.CardBackgroundHover

		if p301 then
			v1161:SetAttribute("Destructive", true)
		end

		v1161.MouseEnter:Connect(function()
			v46(v1161, t1.Fast, {
				BackgroundTransparency = 0
			})

			if p301 then
				v119(Frame7, Color3.fromRGB(255, 255, 255))
			end
		end)
		v1161.MouseLeave:Connect(function()
			if not v1161:GetAttribute("Active") then
				v46(v1161, t1.Default, {
					BackgroundTransparency = 1
				})
			end

			if p301 then
				v119(Frame7, t4._Theme.TextSecondary)
			end
		end)

		return v1161, Frame7
	end

	local v1165, v1166 = v1158("settings", v1157)
	local v1167, v1168 = v1158("close", -v1157, true)
	local v1169, v1170 = v1158("minimize", -v1157 - v1156 - v33(4, 2))
	local TextLabel2 = v40("TextLabel", {
		Parent = Frame5,
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(v1156 + v1157 + v33(8, 3), 0),
		Size = UDim2.fromOffset(200, sizing.HeaderHeight),
		Font = Enum.Font.GothamSemibold,
		TextSize = sizing.TitleFont,
		TextColor3 = _Theme.TextPrimary,
		Text = v1131.Title or "Window",
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd
	})
	local textSize = v10:GetTextSize(TextLabel2.Text, sizing.TitleFont, Enum.Font.GothamSemibold, Vector2.new(1000, 100))
	local v1173 = isMobile

	if v1173 then
		v1173 = math.max(24, math.floor(82 * (sizing.MobileScale or 1) + 0.5))
	end

	v1173 = v1173 or 220
	TextLabel2.Size = UDim2.fromOffset(math.min(textSize.X + v33(8, 3), v1173), sizing.HeaderHeight)

	local v1174 = v1156 + v1157 + v33(8, 3) + math.min(textSize.X + v33(8, 3), v1173) + v33(14, 4)
	local v1175 = (v1156 + v33(4, 2)) * 2 + v1157
	local ScrollingFrame = v40("ScrollingFrame", {
		Parent = Frame5,
		Position = UDim2.fromOffset(v1174, v1157),
		Size = UDim2.new(1, -(v1174 + v1175), 0, sizing.HeaderHeight - v1157 * 2),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ZIndex = 2,
		BorderSizePixel = 0,
		CanvasSize = UDim2.fromOffset(0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.X,
		ScrollingDirection = Enum.ScrollingDirection.X,
		ScrollBarThickness = 0,
		ScrollBarImageTransparency = 1,
		Active = true
	})
	local Frame7 = v40("Frame", {
		Parent = ScrollingFrame,
		BackgroundColor3 = _Theme.AccentSolid,
		BorderSizePixel = 0,
		Visible = false,
		ZIndex = 1,
		Size = UDim2.fromOffset(0, 0)
	})

	v40("UICorner", {
		Parent = Frame7,
		CornerRadius = sizing.CornerRadiusSmall
	})

	local UIGradient = v40("UIGradient", {
		Parent = Frame7,
		Rotation = 35,
		Color = ColorSequence.new(_Theme.AccentGradientFrom, _Theme.AccentGradientTo)
	})

	v40("UIStroke", {
		Parent = Frame7,
		Color = Color3.fromRGB(255, 255, 255),
		Thickness = 1,
		Transparency = 0.7,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	})

	local ImageLabel = v40("ImageLabel", {
		Parent = Frame7,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 2),
		Size = UDim2.new(1, 18, 1, 14),
		BackgroundTransparency = 1,
		Image = "rbxassetid://6014261993",
		ImageColor3 = _Theme.AccentSolid,
		ImageTransparency = 0.62,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(49, 49, 450, 450),
		ZIndex = 0
	})
	local Frame8 = v40("Frame", {
		Parent = ScrollingFrame,
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, 0),
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundColor3 = _Theme.Border,
		BackgroundTransparency = 0.5,
		BorderSizePixel = 0,
		ZIndex = 0
	})
	local Frame9 = v40("Frame", {
		Parent = ScrollingFrame,
		Size = UDim2.new(0, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundTransparency = 1,
		ZIndex = 2
	})

	v40("UIListLayout", {
		Parent = Frame9,
		FillDirection = Enum.FillDirection.Horizontal,
		Padding = UDim.new(0, v33(4, 2)),
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		HorizontalAlignment = Enum.HorizontalAlignment.Left
	})

	local Frame10 = v40("Frame", {
		Parent = Frame4,
		Position = UDim2.fromOffset(0, sizing.HeaderHeight),
		Size = UDim2.new(1, 0, 1, -sizing.HeaderHeight - sizing.FooterHeight),
		BackgroundColor3 = _Theme.ContentBackground,
		BorderSizePixel = 0,
		ZIndex = 1
	})

	v40("UICorner", {
		Parent = Frame10,
		CornerRadius = sizing.CornerRadiusLarge
	})

	local Frame11 = v40("Frame", {
		Parent = Frame4,
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, 0),
		Size = UDim2.new(1, 0, 0, sizing.FooterHeight),
		BackgroundColor3 = _Theme.FooterBackground,
		BorderSizePixel = 0,
		ZIndex = 5
	})

	v40("UICorner", {
		Parent = Frame11,
		CornerRadius = sizing.CornerRadiusLarge
	}):SetAttribute("FooterPersistent", true)

	local UIStroke3 = v40("UIStroke", {
		Parent = Frame11,
		Color = _Theme.Border,
		Thickness = 1.5,
		Transparency = 0.3
	})
	local Frame12 = v40("Frame", {
		Parent = Frame11,
		Size = UDim2.new(1, 0, 0, sizing.CornerRadiusLarge.Offset),
		Position = UDim2.fromOffset(0, 0),
		BackgroundColor3 = _Theme.FooterBackground,
		BorderSizePixel = 0,
		ZIndex = 1
	})

	Frame12:SetAttribute("FooterPersistent", true)
	UIStroke3:SetAttribute("FooterPersistent", true)

	local u1186 = false

	obj._SetFooterCollapsed = function(p302)
		u1186 = p302
	end
	table.insert(obj._Unsubscribers, v196(function(p303)
		local ContentBackground = u1186 and p303.ContentBackground or p303.FooterBackground

		Frame11.BackgroundColor3 = ContentBackground
		Frame12.BackgroundColor3 = ContentBackground
		UIStroke3.Color = p303.Border
	end))

	local v1188

	local function v1189()
		local FooterHeight = sizing.FooterHeight

		if obj._SetFooterCollapsed then
			obj._SetFooterCollapsed(false)
		end

		Frame11.Visible = true
		Frame11.Size = UDim2.new(1, 0, 0, FooterHeight)
		Frame11.Position = UDim2.new(0, 0, 1, 0)
		Frame11.BackgroundColor3 = t4._Theme.FooterBackground
		UIStroke3.Transparency = 0.3
		Frame12.Visible = true
		Frame12.BackgroundColor3 = t4._Theme.FooterBackground
		Frame10.Size = UDim2.new(1, 0, 1, -sizing.HeaderHeight - FooterHeight)
	end
	local function v1191()
		if obj._SetFooterCollapsed then
			obj._SetFooterCollapsed(true)
		end

		Frame11.Visible = false
		Frame12.Visible = false
		Frame10.Size = UDim2.new(1, 0, 1, -sizing.HeaderHeight)
	end

	obj._RebuildFooterFromActiveTab = function(p304)
		local _ActiveTab = p304._ActiveTab
		local _ActionBarConfig = _ActiveTab and _ActiveTab._ActionBarConfig

		if _ActionBarConfig then
			v1188(_ActionBarConfig)

			if not p304._Minimized then
				v1189()
			end

			if p304._UpdateStatus then
				p304._UpdateStatus()
			end
		else
			for _, child in ipairs(Frame11:GetChildren()) do
				if not child:GetAttribute("FooterPersistent") then
					child:Destroy()
				end
			end

			p304._UpdateStatus = nil
			v1191()
		end
	end
	obj.SetFooterVisible = function(p305, p306)
		if p306 == nil then
			p305:_RebuildFooterFromActiveTab()
		elseif p306 then
			local _ActiveTab = p305._ActiveTab

			if _ActiveTab and _ActiveTab._ActionBarConfig then
				v1189()
			end
		else
			v1191()
		end
	end
	obj.IsFooterVisible = function()
		return Frame11.Visible
	end

	local Frame13 = v40("Frame", {
		Parent = Frame10,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		ClipsDescendants = true
	})
	local MobileScale = isMobile and (sizing.MobileScale or 1) or 1
	local v1199 = isMobile and math.max(2, math.floor(6 * MobileScale + 0.5)) or 6
	local v1200 = isMobile and math.max(sizing.ResizeHandleSize, 12) or math.max(sizing.ResizeHandleSize, 32)
	local TextButton = v40("TextButton", {
		Parent = Frame4,
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, -v1199, 1, -v1199),
		Size = UDim2.fromOffset(v1200, v1200),
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Text = "",
		ZIndex = 200
	})

	v60(TextButton, "rbxasset://textures/Cursors/MouseHandle.png")

	local Frame14 = v40("Frame", {
		Parent = TextButton,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = _Theme.AccentSolid,
		BorderSizePixel = 0,
		ZIndex = 200
	})

	v40("UICorner", {
		Parent = Frame14,
		CornerRadius = UDim.new(0, isMobile and math.max(2, math.floor(4 * MobileScale + 0.5)) or 4)
	})
	v40("UIGradient", {
		Parent = Frame14,
		Rotation = 45,
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(0.499, 1),
			NumberSequenceKeypoint.new(0.501, 0),
			NumberSequenceKeypoint.new(1, 0)
		})
	})

	local t41 = {}

	TextButton.MouseEnter:Connect(function()
		v46(Frame14, t1.Fast, {
			BackgroundColor3 = t4._Theme.PrimaryHover
		})
	end)
	TextButton.MouseLeave:Connect(function()
		v46(Frame14, t1.Default, {
			BackgroundColor3 = t4._Theme.AccentSolid
		})
	end)
	v242(Frame5, Frame3, function(p307)
		local Position2 = p307.Position

		local function v1205(p308)
			local AbsolutePosition = p308.AbsolutePosition
			local AbsoluteSize = p308.AbsoluteSize

			return Position2.X >= AbsolutePosition.X and Position2.X <= AbsolutePosition.X + AbsoluteSize.X and Position2.Y >= AbsolutePosition.Y and Position2.Y <= AbsolutePosition.Y + AbsoluteSize.Y
		end

		if v1205(v1165) or v1205(v1167) or v1205(v1169) then
			return true
		end

		for _, tab in ipairs(obj._Tabs) do
			if not tab._TabBtn then
				continue
			end

			if v1205(tab._TabBtn) then
				return true
			end
		end

		return false
	end, obj._Connections)

	if v1131.Resizable ~= false then
		v248(Frame3, TextButton, "br", MinSize, MaxSize, nil, obj._Connections)
	end

	v1167.MouseButton1Click:Connect(function()
		if obj._Destroying then
			return
		end

		obj._Destroying = true
		v48(v1131.OnClose)

		local Position2 = Frame3.Position

		v46(Frame3, t1.Open, {
			Size = UDim2.fromOffset(Frame3.AbsoluteSize.X * 0.94, Frame3.AbsoluteSize.Y * 0.94),
			Position = Position2 + UDim2.fromOffset(0, v33(24, 8))
		})
		v46(Frame4, t1.Default, {
			BackgroundTransparency = 1
		})
		v46(UIStroke2, t1.Fast, {
			Transparency = 1
		})
		task.delay(0.3, function()
			obj:Destroy()
		end)
	end)

	local u1211 = false
	local Offset = Frame3.Size.Y.Offset
	local MinSize2 = UISizeConstraint.MinSize
	local u1214 = false

	obj._Minimized = false
	v1169.MouseButton1Click:Connect(function()
		if u1211 then
			u1211 = false
			obj._Minimized = false
			UISizeConstraint.MinSize = MinSize2
			TextButton.Visible = true
			TextButton.Active = true
			v46(Frame3, t1.SoftSpring, {
				Size = UDim2.fromOffset(Frame3.AbsoluteSize.X, Offset)
			})

			if u1214 then
				obj:_RebuildFooterFromActiveTab()
			end
		else
			u1211 = true
			obj._Minimized = true
			Offset = Frame3.AbsoluteSize.Y
			UISizeConstraint.MinSize = Vector2.new(MinSize2.X, sizing.HeaderHeight)
			TextButton.Visible = false
			TextButton.Active = false
			u1214 = Frame11.Visible

			if u1214 then
				v46(Frame11, t1.Default, {
					Position = UDim2.new(0, 0, 1, sizing.FooterHeight)
				})
				task.delay(0.18, function()
					if u1211 then
						Frame11.Visible = false
					end
				end)
			end

			v46(Frame3, t1.SoftSpring, {
				Size = UDim2.fromOffset(Frame3.AbsoluteSize.X, sizing.HeaderHeight)
			})
		end
	end)

	local ToggleKeybind = v1131.ToggleKeybind or Enum.KeyCode.RightControl
	local u1216 = true

	table.insert(obj._Connections, v5.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed then
			if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == ToggleKeybind then
				u1216 = not u1216

				if u1216 then
					Frame3.Visible = true
					Frame4.BackgroundTransparency = 1
					UIStroke2.Transparency = 1
					v46(Frame4, t1.Default, {
						BackgroundTransparency = 0
					})
					v46(UIStroke2, t1.Default, {
						Transparency = 0.3
					})
				else
					v46(Frame4, t1.Default, {
						BackgroundTransparency = 1
					})
					v46(UIStroke2, t1.Default, {
						Transparency = 1
					})
					task.delay(0.2, function()
						if not u1216 and Frame3.Parent then
							Frame3.Visible = false
						end
					end)
				end
			end
		end
	end))

	if TouchEnabled then
		v146(Frame10, function(p309)
			if #obj._Tabs <= 1 then
				return
			end

			local v1217

			for i, tab in ipairs(obj._Tabs) do
				if tab == obj._ActiveTab then
					v1217 = i

					break
				end
			end

			if not v1217 then
				return
			end

			local v1220

			if p309 == "left" then
				v1220 = v1217 + 1

				if v1220 > #obj._Tabs then
					v1220 = 1
				end
			else
				if p309 ~= "right" then
					return
				end

				v1220 = v1217 - 1

				if v1220 < 1 then
					v1220 = #obj._Tabs
				end
			end

			obj:_SetActiveTab(obj._Tabs[v1220])
		end, 80)
	end

	local function v1221()
		if not obj._ActiveTab or not obj._ActiveTab._TabBtn then
			Frame7.Visible = false

			return
		end

		if #obj._Tabs <= 1 then
			Frame7.Visible = false

			return
		end

		local _TabBtn = obj._ActiveTab._TabBtn

		if not _TabBtn.Parent then
			Frame7.Visible = false

			return
		end

		local AbsoluteSize = _TabBtn.AbsoluteSize

		if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 then
			return
		end

		local v1224 = _TabBtn.AbsolutePosition - ScrollingFrame.AbsolutePosition
		local CanvasPosition = ScrollingFrame.CanvasPosition or Vector2.new(0, 0)

		Frame7.Visible = true
		v46(Frame7, t1.TabIndicator, {
			Position = UDim2.fromOffset(v1224.X + CanvasPosition.X, v1224.Y),
			Size = UDim2.fromOffset(AbsoluteSize.X, AbsoluteSize.Y)
		})
	end
	local function v1226()
		if obj._ActiveTab then
			if obj._ActiveTab._TabBtn then
				if not ScrollingFrame:IsA("ScrollingFrame") then
					return
				end

				local _TabBtn = obj._ActiveTab._TabBtn

				if not _TabBtn.Parent or _TabBtn.AbsoluteSize.X <= 0 then
					return
				end

				local v1228 = _TabBtn.AbsolutePosition.X - ScrollingFrame.AbsolutePosition.X
				local v1229 = v1228 + _TabBtn.AbsoluteSize.X
				local X = ScrollingFrame.CanvasPosition.X

				if v1228 < 8 then
					ScrollingFrame.CanvasPosition = Vector2.new(math.max(0, X + v1228 - 8), 0)
				elseif ScrollingFrame.AbsoluteSize.X - 8 < v1229 then
					ScrollingFrame.CanvasPosition = Vector2.new(X + (v1229 - ScrollingFrame.AbsoluteSize.X) + 8, 0)
				end

				return
			end
		end
	end

	obj._SetActiveTab = function(p310, p311)
		if p310._ActiveTab == p311 then
			return
		end

		local _ActiveTab = p310._ActiveTab

		if _ActiveTab and _ActiveTab._Grids then
			for _, grid in ipairs(_ActiveTab._Grids) do
				if grid and grid.Clear then
					pcall(function()
						grid:Clear()
					end)
				end
			end
		end

		p310._ActiveTab = p311

		for _, tab in ipairs(p310._Tabs) do
			if tab._TabBtn and tab._TabLabel then
				if tab == p311 then
					local _Theme2 = t4._Theme
					local v1237 = v69(_Theme2.AccentGradientFrom, _Theme2.AccentGradientTo, 0.5)

					v46(tab._TabLabel, t1.Default, {
						TextColor3 = v78(v1237)
					})
					tab._TabLabel.Font = Enum.Font.GothamBold
					v46(tab._TabBtn, t1.Default, {
						BackgroundTransparency = 1
					})
				else
					v46(tab._TabBtn, t1.Default, {
						BackgroundTransparency = 1
					})
					v46(tab._TabLabel, t1.Default, {
						TextColor3 = t4._Theme.TextSecondary
					})
					tab._TabLabel.Font = Enum.Font.GothamSemibold
				end
			end
		end

		if p311 and p311._TabBtn then
			task.spawn(function()
				for i = 1, 8 do
					if not p311._TabBtn.Parent then
						return
					end

					local AbsoluteSize = p311._TabBtn.AbsoluteSize

					if not (AbsoluteSize.X > 0) or not (AbsoluteSize.Y > 0) then
						task.wait()

						continue
					end

					v1221()
					v1226()

					return
				end
			end)
		else
			Frame7.Visible = false
		end

		local _Page = _ActiveTab and _ActiveTab._Page
		local _Page2 = p311 and p311._Page

		if _Page and _Page.Parent then
			_Page.Visible = false
			_Page.Position = UDim2.fromOffset(0, 0)
		end

		if _Page2 then
			_Page2.Visible = true

			if _ActiveTab then
				_Page2.Position = UDim2.fromOffset(v33(10, 4), 0)
				task.delay(0.04, function()
					if _Page2.Parent then
						v46(_Page2, t1.Smooth, {
							Position = UDim2.fromOffset(0, 0)
						})
					end
				end)
			else
				_Page2.Position = UDim2.fromOffset(0, 0)
			end
		end

		p310:_RebuildFooterFromActiveTab()
	end
	obj._RemoveTab = function(p312, p313)
		for i, tab in ipairs(p312._Tabs) do
			if tab ~= p313 then
				continue
			end

			if p313._Grids then
				for _, grid in ipairs(p313._Grids) do
					pcall(function()
						grid:Destroy()
					end)
				end

				table.clear(p313._Grids)
			end

			table.remove(p312._Tabs, i)

			if p313._TabBtn then
				p313._TabBtn:Destroy()
			end

			if p313._Page then
				p313._Page:Destroy()
			end

			if p312._ActiveTab == p313 then
				p312._ActiveTab = nil

				if p312._Tabs[1] then
					p312:_SetActiveTab(p312._Tabs[1])
				else
					Frame7.Visible = false
				end
			end

			return
		end
	end
	obj.CreateTab = function(p314, p315)
		local v1246 = p315 or {}
		local obj2 = setmetatable({}, t38)

		obj2._Window = p314
		obj2._Name = v1246.Name or "Tab"

		local TextButton2 = v40("TextButton", {
			Parent = Frame9,
			Size = UDim2.fromOffset(0, sizing.HeaderHeight - v1157 * 2),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = t4._Theme.CardBackgroundHover,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			AutoButtonColor = false,
			LayoutOrder = #p314._Tabs + 1
		})

		v40("UICorner", {
			Parent = TextButton2,
			CornerRadius = sizing.CornerRadiusSmall
		})
		v67(TextButton2)

		local v1249 = v40
		local s13 = "UIPadding"
		local t42 = {
			Parent = TextButton2
		}
		local n18 = 0
		local v1253 = isMobile

		if v1253 then
			v1253 = math.max(4, math.floor(14 * (sizing.MobileScale or 1) + 0.5))
		end

		t42.PaddingLeft = UDim.new(n18, v1253 or 14)

		local n19 = 0
		local v1255 = isMobile

		if v1255 then
			v1255 = math.max(4, math.floor(14 * (sizing.MobileScale or 1) + 0.5))
		end

		t42.PaddingRight = UDim.new(n19, v1255 or 14)
		v1249(s13, t42)

		local v1256 = v40
		local s14 = "UIListLayout"
		local t43 = {
			Parent = TextButton2,
			FillDirection = Enum.FillDirection.Horizontal
		}
		local n20 = 0
		local v1260 = isMobile

		if v1260 then
			v1260 = math.max(2, math.floor(6 * (sizing.MobileScale or 1) + 0.5))
		end

		t43.Padding = UDim.new(n20, v1260 or 6)
		t43.VerticalAlignment = Enum.VerticalAlignment.Center
		t43.HorizontalAlignment = Enum.HorizontalAlignment.Center
		t43.SortOrder = Enum.SortOrder.LayoutOrder
		v1256(s14, t43)

		if v1246.Icon then
			local v1261 = v40
			local s15 = "ImageLabel"
			local t44 = {
				Parent = TextButton2
			}
			local uDim2 = UDim2.fromOffset
			local v1265 = isMobile

			if v1265 then
				v1265 = math.max(8, math.floor(18 * (sizing.MobileScale or 1) + 0.5))
			end

			v1265 = v1265 or 18

			local v1266 = isMobile

			if v1266 then
				v1266 = math.max(8, math.floor(18 * (sizing.MobileScale or 1) + 0.5))
			end

			t44.Size = uDim2(v1265, v1266 or 18)
			t44.BackgroundTransparency = 1
			t44.Image = v1246.Icon
			t44.LayoutOrder = 1
			v1261(s15, t44)
		end

		local TextLabel3 = v40("TextLabel", {
			Parent = TextButton2,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.fromOffset(0, sizing.HeaderHeight - v1157 * 2),
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamSemibold,
			TextSize = sizing.BodyFont,
			TextColor3 = t4._Theme.TextSecondary,
			Text = v1246.Name or "Tab",
			LayoutOrder = 2
		})

		obj2._TabBtn = TextButton2
		obj2._TabLabel = TextLabel3
		table.insert(p314._Connections, TextButton2:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			if p314._ActiveTab == obj2 then
				v1221()
			end
		end))
		table.insert(p314._Connections, TextButton2:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
			if p314._ActiveTab == obj2 then
				v1221()
			end
		end))
		TextButton2.MouseEnter:Connect(function()
			if p314._ActiveTab ~= obj2 then
				v46(TextButton2, t1.Default, {
					BackgroundTransparency = 0.7
				})
				v46(TextLabel3, t1.Default, {
					TextColor3 = t4._Theme.TextPrimary
				})
			end
		end)
		TextButton2.MouseLeave:Connect(function()
			if p314._ActiveTab ~= obj2 then
				v46(TextButton2, t1.Default, {
					BackgroundTransparency = 1
				})
				v46(TextLabel3, t1.Default, {
					TextColor3 = t4._Theme.TextSecondary
				})
			end
		end)
		TextButton2.MouseButton1Click:Connect(function()
			p314:_SetActiveTab(obj2)
		end)

		local Frame15 = v40("Frame", {
			Parent = Frame13,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Visible = false
		})

		v40("UIPadding", {
			Parent = Frame15,
			PaddingLeft = UDim.new(0, sizing.WindowPadding),
			PaddingRight = UDim.new(0, sizing.WindowPadding),
			PaddingTop = UDim.new(0, sizing.WindowPadding),
			PaddingBottom = UDim.new(0, sizing.WindowPadding)
		})

		local ScrollingFrame2 = v40("ScrollingFrame", {
			Parent = Frame15,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = sizing.ScrollbarThickness,
			ScrollBarImageColor3 = t4._Theme.ScrollbarThumb,
			CanvasSize = UDim2.fromOffset(0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y
		})

		v40("UIPadding", {
			Parent = ScrollingFrame2,
			PaddingRight = UDim.new(0, sizing.ScrollbarThickness + v33(24, 6))
		})
		v40("UIListLayout", {
			Parent = ScrollingFrame2,
			Padding = UDim.new(0, sizing.SectionSpacing),
			SortOrder = Enum.SortOrder.LayoutOrder
		})

		local ScrollingFrame3
		local ScrollingFrame4

		local function v1272()
			if ScrollingFrame3 then
				return
			end

			ScrollingFrame2.Visible = false

			local Frame16 = v40("Frame", {
				Parent = Frame15,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1
			})
			local v1274 = v33(6, 2)
			local v1275 = sizing.ScrollbarThickness + v33(24, 6)

			ScrollingFrame3 = v40("ScrollingFrame", {
				Parent = Frame16,
				Size = UDim2.new(0.5, -v1274, 1, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = sizing.ScrollbarThickness,
				ScrollBarImageColor3 = t4._Theme.ScrollbarThumb,
				CanvasSize = UDim2.fromOffset(0, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y
			})
			v40("UIPadding", {
				Parent = ScrollingFrame3,
				PaddingRight = UDim.new(0, v1275)
			})
			v40("UIListLayout", {
				Parent = ScrollingFrame3,
				Padding = UDim.new(0, sizing.SectionSpacing),
				SortOrder = Enum.SortOrder.LayoutOrder
			})
			ScrollingFrame4 = v40("ScrollingFrame", {
				Parent = Frame16,
				Position = UDim2.new(0.5, v1274, 0, 0),
				Size = UDim2.new(0.5, -v1274, 1, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = sizing.ScrollbarThickness,
				ScrollBarImageColor3 = t4._Theme.ScrollbarThumb,
				CanvasSize = UDim2.fromOffset(0, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y
			})
			v40("UIPadding", {
				Parent = ScrollingFrame4,
				PaddingRight = UDim.new(0, v1275)
			})
			v40("UIListLayout", {
				Parent = ScrollingFrame4,
				Padding = UDim.new(0, sizing.SectionSpacing),
				SortOrder = Enum.SortOrder.LayoutOrder
			})
			obj2._LeftCol = ScrollingFrame3
			obj2._RightCol = ScrollingFrame4
		end

		obj2._FullCol = ScrollingFrame2

		local CreateSection = obj2.CreateSection

		obj2.CreateSection = function(p316, p317)
			if isMobile and type(p317) == "table" then
				return CreateSection(p316, {
					Name = p317.Name
				})
			end

			if type(p317) == "table" and p317.Side then
				v1272()
			end

			return CreateSection(p316, p317)
		end
		obj2._Page = Frame15
		table.insert(p314._Tabs, obj2)

		if not p314._ActiveTab then
			p314:_SetActiveTab(obj2)
		end

		return obj2
	end
	v1188 = function(p318)
		for _, child in ipairs(Frame11:GetChildren()) do
			if not child:GetAttribute("FooterPersistent") then
				child:Destroy()
			end
		end

		obj._UpdateStatus = nil

		local v1279 = isMobile and math.max(sizing.ButtonHeight, 14) or math.max(sizing.ButtonHeight, 32)
		local MobileScale2 = sizing.MobileScale or 1
		local v1281 = isMobile and math.max(38, math.floor(100 * MobileScale2 + 0.5)) or 90
		local v1282 = isMobile and math.max(5, math.floor(14 * MobileScale2 + 0.5)) or 14

		if isMobile then
			local v1283 = math.min(v1279, math.max(14, math.floor(40 * MobileScale2 + 0.5)))
			local v1284 = math.max(8, math.floor(18 * MobileScale2 + 0.5))
			local v1285 = math.max(2, math.floor(5 * MobileScale2 + 0.5))
			local v1286 = math.max(2, math.floor(3 * MobileScale2 + 0.5))
			local v1287 = p318.Status and v1285 + v1284 + v1286 or math.floor((sizing.FooterHeight - v1283) / 2)
			local v1288 = math.max(v1282, v1199 + v1200 - 4)

			if p318.Status then
				local TextLabel3 = v40("TextLabel", {
					Parent = Frame11,
					Position = UDim2.fromOffset(v1282, v1285),
					Size = UDim2.new(1, -(v1282 + v1288), 0, v1284),
					BackgroundTransparency = 1,
					Font = Enum.Font.GothamMedium,
					TextSize = sizing.CaptionFont,
					TextColor3 = t4._Theme.TextSecondary,
					Text = "",
					TextXAlignment = Enum.TextXAlignment.Right,
					TextTruncate = Enum.TextTruncate.AtEnd,
					ClipsDescendants = true,
					RichText = true,
					ZIndex = 2
				})

				obj._UpdateStatus = function()
					local ok, text = pcall(p318.Status)

					if ok then
						TextLabel3.Text = text or ""
					end
				end
				obj._UpdateStatus()
			end

			local ScrollingFrame2 = v40("ScrollingFrame", {
				Parent = Frame11,
				Position = UDim2.fromOffset(v1282, v1287),
				Size = UDim2.new(1, -(v1282 + v1288), 0, v1283),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.fromOffset(0, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				ScrollingDirection = Enum.ScrollingDirection.X,
				ScrollBarThickness = 0,
				ScrollBarImageTransparency = 1,
				Active = true,
				ZIndex = 2
			})

			ScrollingFrame2:SetAttribute("NoWindowSwipe", true)
			v40("UIListLayout", {
				Parent = ScrollingFrame2,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, math.max(3, math.floor(8 * MobileScale2 + 0.5))),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			})

			local function v1293(p319, p320, p321, p322)
				local v1294 = tostring(p319 or "")
				local v1295 = math.max(46, math.floor(138 * MobileScale2 + 0.5))
				local v1296 = math.max(34, math.floor(84 * MobileScale2 + 0.5))
				local TextButton2 = v40("TextButton", {
					Parent = ScrollingFrame2,
					Size = UDim2.fromOffset(p321 and math.max(46, v1295) or math.max(v1296, math.min(v1295, #v1294 * math.max(4, sizing.ButtonFont - 2) + math.max(10, math.floor(24 * MobileScale2 + 0.5)))), v1283),
					BackgroundColor3 = p321 and t4._Theme.Primary or t4._Theme.CardBackgroundHover,
					BorderSizePixel = 0,
					Font = p321 and Enum.Font.GothamSemibold or Enum.Font.GothamMedium,
					TextSize = sizing.ButtonFont,
					TextColor3 = p321 and t4._Theme.PrimaryText or t4._Theme.TextPrimary,
					Text = v1294,
					AutoButtonColor = false,
					ClipsDescendants = true,
					LayoutOrder = p322 or 1,
					ZIndex = 2
				})

				TextButton2:SetAttribute("NoWindowSwipe", true)
				v40("UICorner", {
					Parent = TextButton2,
					CornerRadius = sizing.CornerRadius
				})
				v40("UIStroke", {
					Parent = TextButton2,
					Color = p321 and Color3.fromRGB(255, 255, 255) or t4._Theme.BorderStrong,
					Thickness = 1,
					Transparency = p321 and 0.7 or 0.2,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				})
				TextButton2.MouseEnter:Connect(function()
					v46(TextButton2, t1.Default, {
						BackgroundColor3 = p321 and t4._Theme.PrimaryHover or t4._Theme.CardBackgroundActive
					})
				end)
				TextButton2.MouseLeave:Connect(function()
					local v1298 = v46
					local v1299 = TextButton2
					local Default = t1.Default
					local t45 = {
						BackgroundColor3 = p321 and t4._Theme.Primary or t4._Theme.CardBackgroundHover
					}

					v1298(v1299, Default, t45)
				end)
				TextButton2.MouseButton1Down:Connect(function(x, y)
					local v1302 = v122
					local v1303 = TextButton2

					v1302(v1303, x, y, p321 and Color3.fromRGB(255, 255, 255) or t4._Theme.AccentSolid)
				end)
				TextButton2.MouseButton1Click:Connect(function()
					v48(p320)
				end)
			end

			local n21 = 1
			local ipairs_ = ipairs
			local Left = p318.Left or {}

			for _, v in ipairs_(Left) do
				v1293(v.Text, v.Callback, false, n21)
				n21 += 1
			end

			if p318.Primary then
				v1293(p318.Primary.Text or "OK", p318.Primary.Callback, true, n21)
			end

			return
		end

		local n22 = 0

		if p318.Left and #p318.Left > 0 then
			local v1310 = #p318.Left
			local v1311 = v1310 * v1281 + (v1310 - 1) * 8

			n22 = v1311

			local Frame15 = v40("Frame", {
				Parent = Frame11,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, v1282, 0.5, 0),
				Size = UDim2.fromOffset(v1311, v1279),
				BackgroundTransparency = 1,
				ZIndex = 2
			})

			v40("UIListLayout", {
				Parent = Frame15,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, 8),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			})

			for i, v in ipairs(p318.Left) do
				local TextButton2 = v40("TextButton", {
					Parent = Frame15,
					Size = UDim2.fromOffset(v1281, v1279),
					BackgroundColor3 = t4._Theme.CardBackgroundHover,
					BorderSizePixel = 0,
					Font = Enum.Font.GothamMedium,
					TextSize = sizing.ButtonFont,
					TextColor3 = t4._Theme.TextPrimary,
					Text = v.Text or "",
					AutoButtonColor = false,
					ClipsDescendants = true,
					LayoutOrder = i,
					ZIndex = 2
				})

				v40("UICorner", {
					Parent = TextButton2,
					CornerRadius = sizing.CornerRadius
				})
				v40("UIStroke", {
					Parent = TextButton2,
					Color = t4._Theme.BorderStrong,
					Thickness = 1,
					Transparency = 0.2,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				})
				TextButton2.MouseEnter:Connect(function()
					v46(TextButton2, t1.Default, {
						BackgroundColor3 = t4._Theme.CardBackgroundActive
					})
				end)
				TextButton2.MouseLeave:Connect(function()
					v46(TextButton2, t1.Default, {
						BackgroundColor3 = t4._Theme.CardBackgroundHover
					})
				end)
				TextButton2.MouseButton1Down:Connect(function(x, y)
					v122(TextButton2, x, y, t4._Theme.AccentSolid)
				end)

				local Callback = v.Callback

				TextButton2.MouseButton1Click:Connect(function()
					v48(Callback)
				end)
			end
		end

		local v1317 = isMobile and 130 or 140
		local v1318 = math.max(v1282, v1199 + v1200 - 4)
		local v1319 = math.max(0, math.min(360, math.max(Frame11.AbsoluteSize.X, Frame4.AbsoluteSize.X, sizing.DefaultWindowSize.X) - (v1282 + n22 + (n22 > 0 and 16 or 0)) - v1318 - (p318.Primary and v1317 + 12 or 0)))
		local TextLabel3

		if p318.Status then
			TextLabel3 = v40("TextLabel", {
				Parent = Frame11,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -v1318, 0.5, 0),
				Size = UDim2.fromOffset(v1319, 22),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamMedium,
				TextSize = sizing.CaptionFont,
				TextColor3 = t4._Theme.TextSecondary,
				Text = "",
				TextXAlignment = Enum.TextXAlignment.Right,
				TextTruncate = Enum.TextTruncate.AtEnd,
				ClipsDescendants = true,
				RichText = true,
				ZIndex = 2
			})
			obj._UpdateStatus = function()
				local ok, text = pcall(p318.Status)

				if ok then
					TextLabel3.Text = text or ""
				end
			end
			obj._UpdateStatus()
		end

		if p318.Primary then
			local v1323 = TextLabel3 and v1319 + 12 or 0
			local TextButton2 = v40("TextButton", {
				Parent = Frame11,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -(v1318 + v1323), 0.5, 0),
				Size = UDim2.fromOffset(v1317, v1279),
				BackgroundColor3 = t4._Theme.Primary,
				BorderSizePixel = 0,
				Font = Enum.Font.GothamSemibold,
				TextSize = sizing.ButtonFont,
				TextColor3 = t4._Theme.PrimaryText,
				Text = p318.Primary.Text or "OK",
				AutoButtonColor = false,
				ClipsDescendants = true,
				ZIndex = 2
			})

			v40("UICorner", {
				Parent = TextButton2,
				CornerRadius = sizing.CornerRadius
			})

			local Frame15 = v40("Frame", {
				Parent = TextButton2,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BorderSizePixel = 0,
				ZIndex = 3
			})

			v40("UICorner", {
				Parent = Frame15,
				CornerRadius = sizing.CornerRadius
			})
			v40("UIGradient", {
				Parent = Frame15,
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0.78),
					NumberSequenceKeypoint.new(0.5, 0.92),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
			v40("UIStroke", {
				Parent = TextButton2,
				Color = Color3.fromRGB(255, 255, 255),
				Thickness = 1,
				Transparency = 0.7,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			})
			v40("UIGradient", {
				Parent = TextButton2,
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
					ColorSequenceKeypoint.new(1, Color3.new(0.92, 0.92, 0.92))
				})
			})
			TextButton2.MouseEnter:Connect(function()
				v46(TextButton2, t1.Default, {
					BackgroundColor3 = t4._Theme.PrimaryHover
				})
			end)
			TextButton2.MouseLeave:Connect(function()
				v46(TextButton2, t1.Default, {
					BackgroundColor3 = t4._Theme.Primary
				})
			end)
			TextButton2.MouseButton1Down:Connect(function(x, y)
				v46(TextButton2, t1.Fast, {
					BackgroundColor3 = t4._Theme.PrimaryPressed
				})
				v122(TextButton2, x, y, Color3.fromRGB(255, 255, 255))
			end)
			TextButton2.MouseButton1Up:Connect(function()
				v46(TextButton2, t1.Fast, {
					BackgroundColor3 = t4._Theme.PrimaryHover
				})
			end)

			local Callback = p318.Primary.Callback

			TextButton2.MouseButton1Click:Connect(function()
				v48(Callback)
			end)
		end
	end
	obj.SetActionBar = function(p323, p324, p325)
		if not p325 then
			p325 = {}

			for _, tab in ipairs(p323._Tabs) do
				if tab._Grids and #tab._Grids > 0 then
					table.insert(p325, tab)
				end
			end
		end

		for _, v in ipairs(p325) do
			v._ActionBarConfig = p324
		end

		p323:_RebuildFooterFromActiveTab()
	end

	local u1331 = false
	local Frame15
	local v1333 = isMobile

	if v1333 then
		v1333 = math.max(90, math.floor(220 * (sizing.MobileScale or 1) + 0.5))
	end

	v1333 = v1333 or 260

	local u1334

	local function v1335()
		local _Theme2 = t4._Theme
		local MobileScale2 = isMobile and (sizing.MobileScale or 1) or 1
		local v1338 = isMobile and math.max(5, math.floor(14 * MobileScale2 + 0.5)) or 14
		local v1339 = isMobile and math.max(3, math.floor(8 * MobileScale2 + 0.5)) or 8
		local v1340 = isMobile and math.max(10, math.floor(22 * MobileScale2 + 0.5)) or 22
		local v1341 = isMobile and math.max(9, math.floor(18 * MobileScale2 + 0.5)) or 18
		local v1342 = isMobile and math.max(13, math.floor(30 * MobileScale2 + 0.5)) or 30
		local v1343 = isMobile and math.max(12, math.floor(26 * MobileScale2 + 0.5)) or 26

		Frame15 = v40("Frame", {
			Parent = Frame4,
			Size = UDim2.new(0, v1333, 1, -sizing.HeaderHeight),
			Position = UDim2.fromOffset(-v1333, sizing.HeaderHeight),
			BackgroundColor3 = _Theme2.ContentBackground,
			BorderSizePixel = 0,
			ZIndex = 50,
			ClipsDescendants = true
		})

		local Frame16 = v40("Frame", {
			Parent = Frame15,
			Position = UDim2.new(1, -1, 0, 0),
			Size = UDim2.new(0, 1, 1, 0),
			BackgroundColor3 = _Theme2.Border,
			BorderSizePixel = 0,
			ZIndex = 51
		})
		local Frame17 = v40("Frame", {
			Parent = Frame15,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ZIndex = 50
		})

		v40("UIPadding", {
			Parent = Frame17,
			PaddingLeft = UDim.new(0, v1338),
			PaddingRight = UDim.new(0, v1338),
			PaddingTop = UDim.new(0, v1338),
			PaddingBottom = UDim.new(0, v1338)
		})
		v40("UIListLayout", {
			Parent = Frame17,
			Padding = UDim.new(0, v1339),
			SortOrder = Enum.SortOrder.LayoutOrder
		})

		local TextLabel3 = v40("TextLabel", {
			Parent = Frame17,
			Size = UDim2.new(1, 0, 0, v1340),
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamSemibold,
			TextSize = sizing.TitleFont,
			TextColor3 = _Theme2.TextPrimary,
			Text = "Settings",
			TextXAlignment = Enum.TextXAlignment.Left,
			LayoutOrder = 1
		})
		local TextLabel4 = v40("TextLabel", {
			Parent = Frame17,
			Size = UDim2.new(1, 0, 0, v1341),
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamBold,
			TextSize = math.max(isMobile and 6 or 11, sizing.CaptionFont - 1),
			TextColor3 = _Theme2.TextDisabled,
			Text = "THEME",
			TextXAlignment = Enum.TextXAlignment.Left,
			LayoutOrder = 2
		})
		local t46 = {}
		local s16 = "Dark"

		local function v1350()
			for _, v in ipairs(t46) do
				local v1353 = v.Text == s16

				v46(v, t1.Fast, {
					BackgroundColor3 = v1353 and t4._Theme.AccentSolid or t4._Theme.CardBackground,
					TextColor3 = v1353 and t4._Theme.PrimaryText or t4._Theme.TextPrimary
				})
			end
		end

		for i, v in ipairs({
			"Dark",
			"Light",
			"Midnight",
			"Catppuccin",
			"AMOLED"
		}) do
			local TextButton2 = v40("TextButton", {
				Parent = Frame17,
				Size = UDim2.new(1, 0, 0, v1342),
				BackgroundColor3 = _Theme2.CardBackground,
				BorderSizePixel = 0,
				Font = Enum.Font.GothamMedium,
				TextSize = sizing.BodyFont,
				TextColor3 = _Theme2.TextPrimary,
				Text = v,
				AutoButtonColor = false,
				LayoutOrder = 2 + i
			})

			v40("UICorner", {
				Parent = TextButton2,
				CornerRadius = sizing.CornerRadiusSmall
			})
			TextButton2.MouseEnter:Connect(function()
				if TextButton2.Text ~= s16 then
					v46(TextButton2, t1.Fast, {
						BackgroundColor3 = t4._Theme.CardBackgroundHover
					})
				end
			end)
			TextButton2.MouseLeave:Connect(function()
				if TextButton2.Text ~= s16 then
					v46(TextButton2, t1.Fast, {
						BackgroundColor3 = t4._Theme.CardBackground
					})
				end
			end)
			TextButton2.MouseButton1Click:Connect(function()
				s16 = v
				t4:SetTheme(v)
				v1350()
			end)
			t46[i] = TextButton2
		end

		v1350()

		local TextLabel5 = v40("TextLabel", {
			Parent = Frame17,
			Size = UDim2.new(1, 0, 0, v1341),
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamBold,
			TextSize = math.max(isMobile and 6 or 11, sizing.CaptionFont - 1),
			TextColor3 = _Theme2.TextDisabled,
			Text = "DENSITY",
			TextXAlignment = Enum.TextXAlignment.Left,
			LayoutOrder = 20
		})
		local t47 = {}
		local u1359 = s1

		local function v1360()
			for _, v in ipairs(t47) do
				local v1363 = v.Text == u1359

				v46(v, t1.Fast, {
					BackgroundColor3 = v1363 and t4._Theme.AccentSolid or t4._Theme.CardBackground,
					TextColor3 = v1363 and t4._Theme.PrimaryText or t4._Theme.TextPrimary
				})
			end
		end

		for i, v in ipairs({
			"compact",
			"normal",
			"comfortable"
		}) do
			local TextButton2 = v40("TextButton", {
				Parent = Frame17,
				Size = UDim2.new(1, 0, 0, v1343),
				BackgroundColor3 = _Theme2.CardBackground,
				BorderSizePixel = 0,
				Font = Enum.Font.GothamMedium,
				TextSize = sizing.CaptionFont,
				TextColor3 = _Theme2.TextPrimary,
				Text = v,
				AutoButtonColor = false,
				LayoutOrder = 20 + i
			})

			v40("UICorner", {
				Parent = TextButton2,
				CornerRadius = sizing.CornerRadiusSmall
			})
			TextButton2.MouseEnter:Connect(function()
				if TextButton2.Text ~= u1359 then
					v46(TextButton2, t1.Fast, {
						BackgroundColor3 = t4._Theme.CardBackgroundHover
					})
				end
			end)
			TextButton2.MouseLeave:Connect(function()
				if TextButton2.Text ~= u1359 then
					v46(TextButton2, t1.Fast, {
						BackgroundColor3 = t4._Theme.CardBackground
					})
				end
			end)
			TextButton2.MouseButton1Click:Connect(function()
				u1359 = v
				t4:SetDensity(v)
				v1360()
			end)
			t47[i] = TextButton2
		end

		v1360()
		v40("TextLabel", {
			Parent = Frame17,
			Size = UDim2.new(1, 0, 0, isMobile and math.max(8, math.floor(14 * MobileScale2 + 0.5)) or 14),
			BackgroundTransparency = 1,
			Font = Enum.Font.Gotham,
			TextSize = sizing.CaptionFont,
			TextColor3 = _Theme2.TextDisabled,
			Text = "v" .. t4.Version,
			TextXAlignment = Enum.TextXAlignment.Center,
			LayoutOrder = 99
		})
		u1334 = v196(function(p326)
			Frame15.BackgroundColor3 = p326.ContentBackground
			Frame16.BackgroundColor3 = p326.Border
			TextLabel3.TextColor3 = p326.TextPrimary
			TextLabel4.TextColor3 = p326.TextDisabled
			TextLabel5.TextColor3 = p326.TextDisabled

			for _, child in ipairs(Frame17:GetChildren()) do
				if child:IsA("TextButton") then
					child.BackgroundColor3 = p326.CardBackground
					child.TextColor3 = p326.TextPrimary
				end
			end

			v1350()
			v1360()
		end)
		table.insert(obj._Unsubscribers, u1334)
	end
	local function v1369()
		v1165:SetAttribute("Active", u1331)

		if u1331 then
			v46(v1165, t1.Fast, {
				BackgroundTransparency = 0,
				BackgroundColor3 = t4._Theme.CardBackgroundActive
			})
		else
			v46(v1165, t1.Default, {
				BackgroundTransparency = 1,
				BackgroundColor3 = t4._Theme.CardBackgroundHover
			})
		end
	end

	v1165.MouseButton1Click:Connect(function()
		if not Frame15 then
			v1335()
		end

		u1331 = not u1331
		v46(Frame15, t1.Smooth, {
			Position = UDim2.fromOffset(u1331 and 0 or -v1333, sizing.HeaderHeight)
		})
		v1369()
	end)
	table.insert(obj._Connections, v5.InputBegan:Connect(function(input)
		if u1331 then
			if Frame15 then
				if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
					return
				end

				local Position2 = input.Position

				local function v1371(p327)
					if not p327 or not p327.Parent then
						return false
					end

					local AbsolutePosition = p327.AbsolutePosition
					local AbsoluteSize = p327.AbsoluteSize

					return Position2.X >= AbsolutePosition.X and Position2.X <= AbsolutePosition.X + AbsoluteSize.X and Position2.Y >= AbsolutePosition.Y and Position2.Y <= AbsolutePosition.Y + AbsoluteSize.Y
				end

				if v1371(Frame15) or v1371(v1165) then
					return
				end

				u1331 = false
				v46(Frame15, t1.Smooth, {
					Position = UDim2.fromOffset(-v1333, sizing.HeaderHeight)
				})
				v1369()

				return
			end
		end
	end))
	table.insert(obj._Unsubscribers, v196(function(p328)
		Frame4.BackgroundColor3 = p328.WindowBackground
		UIStroke2.Color = p328.Border
		Frame5.BackgroundColor3 = p328.HeaderBackground
		Frame6.BackgroundColor3 = p328.Border
		TextLabel2.TextColor3 = p328.TextPrimary
		Frame10.BackgroundColor3 = p328.ContentBackground
		Frame7.BackgroundColor3 = p328.AccentSolid
		UIGradient.Color = ColorSequence.new(p328.AccentGradientFrom, p328.AccentGradientTo)
		ImageLabel.ImageColor3 = p328.AccentSolid
		Frame8.BackgroundColor3 = p328.Border

		for _, v in ipairs({
			v1166,
			v1168,
			v1170
		}) do
			v119(v, p328.TextSecondary)
		end

		Frame14.BackgroundColor3 = p328.AccentSolid

		for _, v in ipairs(t41) do
			v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		end

		for _, v in ipairs({
			v1165,
			v1167,
			v1169
		}) do
			v.BackgroundColor3 = v:GetAttribute("Destructive") and p328.Danger or p328.CardBackgroundHover
		end

		if obj._RebuildFooterFromActiveTab then
			obj:_RebuildFooterFromActiveTab()
		end

		for _, tab in ipairs(obj._Tabs) do
			if tab._TabLabel then
				if tab == obj._ActiveTab then
					local v1382 = v69(p328.AccentGradientFrom, p328.AccentGradientTo, 0.5)

					tab._TabLabel.TextColor3 = v78(v1382)
				else
					tab._TabLabel.TextColor3 = p328.TextSecondary
				end
			end
		end
	end))
	table.insert(obj._Unsubscribers, v203(function(p329)
		Frame5.Size = UDim2.new(1, 0, 0, p329.HeaderHeight)
		TextLabel2.Size = UDim2.fromOffset(TextLabel2.Size.X.Offset, p329.HeaderHeight)
		TextLabel2.TextSize = p329.TitleFont
		ScrollingFrame.Size = UDim2.new(1, -(v1174 + v1175), 0, p329.HeaderHeight - v1157 * 2)
		Frame10.Position = UDim2.fromOffset(0, p329.HeaderHeight)
		obj:_RebuildFooterFromActiveTab()

		if Frame15 then
			Frame15.Size = UDim2.new(0, v1333, 1, -p329.HeaderHeight)
			Frame15.Position = u1331 and UDim2.fromOffset(0, p329.HeaderHeight) or UDim2.fromOffset(-v1333, p329.HeaderHeight)
		end
	end))
	obj._Root = Frame4
	obj._Wrapper = Frame3
	obj._Header = Frame5
	obj._Content = Frame10
	obj._TabBar = ScrollingFrame
	obj._TabIndicator = Frame7
	table.insert(t4._Windows, obj)

	return obj
end
t39.Destroy = function(p330)
	for i, window in ipairs(t4._Windows) do
		if window == p330 then
			table.remove(t4._Windows, i)

			break
		end
	end

	local _Tabs = p330._Tabs or {}

	for _, _Tab in ipairs(_Tabs) do
		if _Tab._Grids then
			for _, grid in ipairs(_Tab._Grids) do
				pcall(function()
					grid:Destroy()
				end)
			end

			table.clear(_Tab._Grids)
		end
	end

	local _Connections = p330._Connections or {}

	for _, _Connection in ipairs(_Connections) do
		pcall(function()
			_Connection:Disconnect()
		end)
	end

	table.clear(p330._Connections or {})

	local _Unsubscribers = p330._Unsubscribers or {}

	for _, _Unsubscriber in ipairs(_Unsubscribers) do
		pcall(_Unsubscriber)
	end

	table.clear(p330._Unsubscribers or {})

	if p330._Wrapper then
		p330._Wrapper:Destroy()
	elseif p330._Root then
		p330._Root:Destroy()
	end
end

local function v1396()
	return typeof(writefile) == "function" and typeof(readfile) == "function" and typeof(isfile) == "function" and typeof(makefolder) == "function"
end
local function v1397()
	return tostring(game.PlaceId or 0)
end
local function v1398()
	if not v1396() then
		return false
	end

	pcall(function()
		if typeof(isfolder) == "function" then
			if not isfolder("MyLibrary") then
				makefolder("MyLibrary")
			end

			if not isfolder("MyLibrary/configs") then
				makefolder("MyLibrary/configs")
			end

			if not isfolder("MyLibrary/configs" .. "/" .. v1397()) then
				makefolder("MyLibrary/configs" .. "/" .. v1397())
			end
		else
			pcall(makefolder, "MyLibrary")
			pcall(makefolder, "MyLibrary/configs")
			pcall(makefolder, "MyLibrary/configs" .. "/" .. v1397())
		end
	end)

	return true
end
local function v1399(p331)
	return "MyLibrary/configs" .. "/" .. v1397() .. "/" .. p331 .. ".json"
end

t4.SaveConfig = function(p332, p333)
	if not v1396() then
		warn("[UI] No file IO.")

		return false
	end

	v1398()

	local t48 = {}

	for k, v1402 in pairs(t4._Flags) do
		if v1402.GetState then
			local ok, result2 = pcall(v1402.GetState, v1402)

			if ok then
				t48[k] = result2
			end
		end
	end

	local ok, result2 = pcall(v8.JSONEncode, v8, t48)

	if not ok then
		warn("[UI] JSON encode failed:", result2)

		return false
	end

	local ok3, result3 = pcall(writefile, v1399(p333), result2)

	if ok3 then
		return true
	end

	warn("[UI] writefile failed:", result3)

	return false
end
t4.LoadConfig = function(p334, p335)
	if not v1396() then
		return false
	end

	local v1409 = v1399(p335)

	if not isfile(v1409) then
		return false
	end

	local ok, result2 = pcall(readfile, v1409)

	if not ok then
		return false
	end

	local ok3, result3 = pcall(v8.JSONDecode, v8, result2)

	if not ok3 then
		return false
	end

	for k, v in pairs(result3) do
		local v1416 = t4._Flags[k]

		if v1416 and v1416.SetState then
			pcall(v1416.SetState, v1416, v)
		end
	end

	return true
end
t4.GetConfigs = function()
	if v1396() then
		if typeof(listfiles) == "function" then
			v1398()

			local t49 = {}

			pcall(function()
				for _, v in ipairs(listfiles("MyLibrary/configs" .. "/" .. v1397())) do
					local match = v:match("([^/\\]+)%.json$")

					if match then
						table.insert(t49, match)
					end
				end
			end)

			return t49
		end
	end

	return {}
end
t4.DeleteConfig = function(p336, p337)
	if not v1396() then
		return false
	end

	local v1421 = v1399(p337)

	if not isfile(v1421) or typeof(delfile) ~= "function" then
		return false
	end

	pcall(delfile, v1421)

	return true
end
t4.Destroy = function()
	if t4._Destroyed then
		return
	end

	t4._Destroyed = true

	for _, connection2 in ipairs(t4._Connections) do
		pcall(function()
			connection2:Disconnect()
		end)
	end

	table.clear(t4._Connections)

	for _, window in ipairs(t4._Windows) do
		pcall(function()
			window:Destroy()
		end)
	end

	pcall(function()
		v237:Destroy()
	end)
	pcall(function()
		v238:Destroy()
	end)
	pcall(function()
		v239:Destroy()
	end)
	pcall(function()
		v240:Destroy()
	end)
	pcall(function()
		v241:Destroy()
	end)
	pcall(function()
		local Lighting = game:GetService("Lighting")

		for _, child in ipairs(Lighting:GetChildren()) do
			if child:IsA("BlurEffect") and child:GetAttribute("MM2_UI_Blur") then
				child:Destroy()
			end
		end
	end)
	table.clear(t4._Flags)
	table.clear(t4._ThemeListeners)
	table.clear(t4._SizingListeners)
	table.clear(t4._OpenPopups)
end

return t4