-- discord.gg/syncrypt

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local LocalPlayer = Players.LocalPlayer
local Animals = ReplicatedStorage:WaitForChild("Models").Animals
local Animals2 = ReplicatedStorage:WaitForChild("Animations").Animals
local Datas = ReplicatedStorage:WaitForChild("Datas")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Controllers = ReplicatedStorage:WaitForChild("Controllers")
local Shared = ReplicatedStorage:WaitForChild("Shared")
local Animals3 = require(Datas.Animals)
local Mutations = require(Datas.Mutations)
local Traits = require(Datas.Traits)
local Rarities = require(Datas.Rarities)
local Gradients = require(Packages.Gradients)

require(ReplicatedStorage.Utils.NumberUtils)

local NotificationController = require(Controllers.NotificationController)
local PlotController = require(Controllers.PlotController)
local Animals4 = require(Shared.Animals)
local FastOverheadController = require(Controllers.FastOverheadController)
local AnimalOverhead = ReplicatedStorage:WaitForChild("Overheads", 9e9).AnimalOverhead
local leaderstats = LocalPlayer:WaitForChild("leaderstats", 9e9)
local LeftBottom = LocalPlayer.PlayerGui:WaitForChild("LeftBottom", 9e9).LeftBottom
local Cashout = LeftBottom:WaitForChild("Cashout", 9e9)
local Currency = LeftBottom.Currency
local NumberUtils = require(ReplicatedStorage.Utils.NumberUtils)

local function v28(p1)
	local t1 = {}

	for i, v in ipairs({
		"",
		"K",
		"M",
		"B",
		"T",
		"Qa",
		"Qi",
		"Sx",
		"Sp",
		"Oc",
		"No",
		"Dc",
		"Ud",
		"Dd",
		"Td",
		"Qad",
		"Qid",
		"Sxd",
		"Spd",
		"Ocd",
		"Nod",
		"Vg",
		"Uvg",
		"Dvg",
		"Tvg"
	}) do
		t1[v] = (i - 1) * 3
	end

	local match = p1:match("^([%d%.]+)")
	local match2 = p1:match("[A-Za-z]+$") or ""

	return (tonumber(match) or 0) * 10 ^ (t1[match2] or 0)
end

local t2 = {}
local text = "Tralalero Tralala"
local s1 = "None"
local t3 = {}
local v38 = v28(leaderstats.Cash.Value)
local n1 = 0
local clone
local clone2
local PlotModel = PlotController:GetMyPlot().PlotModel
local t4 = {}

for k, v in pairs(Animals3) do
	table.insert(t4, {
		Name = k,
		Rarity = v.Rarity,
		Generation = v.Generation
	})
end

table.sort(t4, function(p2, p3)
	return p2.Name:lower() < p3.Name:lower()
end)

local t5 = {}

for _, v in ipairs(t4) do
	table.insert(t5, v.Name)
end

local t6 = { "None" }
local t7 = {}

for k, Mutation in pairs(Mutations) do
	table.insert(t7, {
		Key = k,
		DisplayText = Mutation.DisplayText,
		Modifier = Mutation.Modifier or 0
	})
end

table.sort(t7, function(p4, p5)
	return p4.Modifier > p5.Modifier
end)

for _, v in ipairs(t7) do
	table.insert(t6, v.DisplayText)
end

local t8 = {}
local t9 = {}

for k, Trait in pairs(Traits) do
	table.insert(t9, {
		Key = k,
		Display = Trait.Display,
		MultiplierModifier = Trait.MultiplierModifier or 0
	})
end

table.sort(t9, function(p6, p7)
	return p6.MultiplierModifier > p7.MultiplierModifier
end)

for _, v in ipairs(t9) do
	table.insert(t8, v.Display)
end

local t10 = {}

for _, v in ipairs(t7) do
	t10[v.DisplayText] = v.Key
end

local t11 = {}

for _, v in ipairs(t9) do
	t11[v.Display] = v.Key
end

local function v67()
	if not PlotModel then
		return nil
	end

	local AnimalPodiums = PlotModel.AnimalPodiums

	for i = 1, #AnimalPodiums:GetChildren() do
		local v70 = AnimalPodiums:FindFirstChild(tostring(i))

		if not v70 then
			continue
		end

		if not v70.Base:FindFirstChild("Spawn") then
			continue
		end

		if not v70.Base.Spawn:FindFirstChild("Attachment") then
			return v70
		end
	end

	return nil
end
local function v71(p8)
	n1 += p8

	local clone3 = Cashout.Template:Clone()

	clone3.Text = (p8 > 0 and "+$%s" or "-$%s"):format(NumberUtils:ToString(math.abs(p8), 2))
	clone3.TextColor3 = p8 > 0 and Color3.fromRGB(13, 255, 0) or Color3.fromRGB(255, 0, 0)
	clone3.Visible = true
	clone3.Parent = Cashout
	TweenService:Create(clone3, TweenInfo.new(5, Enum.EasingStyle.Linear), {
		TextTransparency = 1
	}):Play()
	TweenService:Create(clone3.UIStroke, TweenInfo.new(5, Enum.EasingStyle.Linear), {
		Transparency = 1
	}):Play()
	task.delay(5, function()
		clone3:Destroy()
	end)
end
local function v73()
	if not text then
		return
	end

	local v74 = Animals:FindFirstChild(text)
	local v75 = Animals2:FindFirstChild(text)
	local v76 = Animals3[text]
	local v77 = t10[s1]
	local v78 = v77 and Mutations[v77] or nil

	if v74 and v75 then
		if v76 then
			local v79 = Rarities[v76.Rarity]
			local v80 = v67()

			if not v80 then
				return NotificationController:Error("You need more room in your base to spawn a brainrot.")
			end

			local clone3 = v74:Clone()

			clone3.Parent = PlotModel
			clone3.PrimaryPart.Anchored = true
			clone3:PivotTo(v80.Base.Spawn:GetPivot())

			for _, descendant in ipairs(clone3:GetDescendants()) do
				if descendant:IsA("BasePart") then
					descendant.CanCollide = false
				end
			end

			local Attachment = Instance.new("Attachment")

			Attachment.Name = "Attachment"
			Attachment.Parent = v80.Base.Spawn

			local clone4 = AnimalOverhead:Clone()

			clone4.Parent = clone3:FindFirstChild("RootPart") or clone3.PrimaryPart

			local extentsSize = clone3:GetExtentsSize()
			local Attachment2 = Instance.new("Attachment")

			Attachment2.Name = "Info"
			Attachment2.CFrame = CFrame.new(0, extentsSize.Y * 0.75 * (v76.OverheadYOffsetModifier or 1), 0)
			Attachment2.Parent = v80.Base.Spawn
			clone4.Parent = Attachment2
			clone4.DisplayName.Text = text
			clone4.Mutation.Text = v78 and v78.DisplayText or ""
			clone4.Mutation.TextColor3 = v78 and v78.MainColor or Color3.new(1, 1, 1)
			clone4.Rarity.Text = v76.Rarity
			clone4.Rarity.TextColor3 = v79.Color
			clone4.Price.Text = "$" .. NumberUtils:ToString(v76.Price, 2)

			local t12 = {}

			for _, v in ipairs(t3) do
				local v91 = t11[v]

				if v91 then
					table.insert(t12, v91)
				end
			end

			local v92

			if #t12 > 0 then
				clone4.Traits.Visible = true

				local function v93()
					Animals4:ApplyTraits(clone3, text, t12)

					local t13 = {}

					for _, v in ipairs(t12) do
						local v97 = Traits[v]
						local clone5 = AnimalOverhead.Traits.Template:Clone()

						clone5.Visible = true
						clone5.Parent = clone4.Traits

						if v97 and v97.Icon then
							if v97.Icon:find("://") then
								clone5.Image = v97.Icon
							end
						end

						table.insert(t13, clone5)
					end

					return function()
						for _, v in ipairs(t13) do
							v:Destroy()
						end
					end
				end

				v92 = v93()
			end

			if v78 and v77 then
				Animals4:ApplyMutation(clone3, text, v77)

				if v78.UseRichText then
					clone4.Mutation.RichText = true
					clone4.Mutation.Text = v78.DisplayWithRichText
				end

				if v78.GradientPreset then
					Gradients.apply(clone4.Mutation, v78.GradientPreset)
				end
			else
				clone4.Mutation.Visible = false
			end

			local n2 = 1

			if v78 and v78.Modifier then
				n2 += v78.Modifier
			end

			for _, v in ipairs(t12) do
				local v104 = Traits[v]

				if v104 and v104.MultiplierModifier then
					n2 += v104.MultiplierModifier
				end
			end

			clone4.Generation.Text = "$" .. NumberUtils:ToString(v76.Generation * n2, 1) .. "/s"

			if v79.GradientPreset then
				Gradients.apply(clone4.Rarity, v79.GradientPreset)
			end

			local v105 = clone3.AnimationController.Animator:LoadAnimation(v75.Idle)

			v105:Play()

			local v106, v107 = FastOverheadController.createFastOverhead({
				adornee = v80.Claim.Main,
				guiTemplate = FastOverheadController.GuiTemplates.CashPad
			})

			v106.Enabled = true
			v106.CollectAmount.Text = "$0"

			local PromptAttachment = v80.Base.Spawn:FindFirstChild("PromptAttachment")

			if not PromptAttachment then
				PromptAttachment = Instance.new("Attachment")
				PromptAttachment.Name = "PromptAttachment"
				PromptAttachment.Parent = v80.Base.Spawn
			end

			local t14 = {}

			for _, child in ipairs(PromptAttachment:GetChildren()) do
				if child:IsA("ProximityPrompt") then
					table.insert(t14, child)
				end
			end

			if #t14 == 0 then
				if clone then
					table.insert(t14, clone:Clone())
					t14[#t14].Parent = PromptAttachment
				end

				if clone2 then
					table.insert(t14, clone2:Clone())
					t14[#t14].Parent = PromptAttachment
				end
			end

			local t15 = {
				Name = text,
				MutationKey = v77,
				TraitKeys = t12,
				Model = clone3,
				Podium = v80,
				Attachment = Attachment,
				OverheadAttachment = Attachment2,
				Overhead = clone4,
				CashPadGui = v106,
				CashPadCleanup = v107,
				SpawnTime = workspace:GetServerTimeNow(),
				AnimTrack = v105,
				AnimLength = v105.Length,
				Money = 0,
				Generation = v76.Generation,
				TotalModifier = n2,
				Collecting = false,
				Connections = {},
				GrabPrompt = nil,
				SellPrompt = nil,
				CleanupTraits = v92
			}

			table.insert(t2, t15)
			table.insert(t15.Connections, v80.Claim:WaitForChild("Hitbox").Touched:Connect(function(part)
				if part.Parent == LocalPlayer.Character then
					if t15.Money > 0 and not t15.Collecting then
						t15.Collecting = true

						local Money = t15.Money

						t15.Money = 0
						t15.CashPadGui.CollectAmount.Text = "$0"
						v71(Money)
						task.delay(0.2, function()
							t15.Collecting = false
						end)
					end
				end
			end))

			local v114
			local v115

			for _, v in ipairs(t14) do
				if v:IsA("ProximityPrompt") then
					if not clone and v.KeyboardKeyCode == Enum.KeyCode.E then
						clone = v:Clone()
					end

					if not clone2 and v.KeyboardKeyCode == Enum.KeyCode.F then
						clone2 = v:Clone()
					end

					v.Enabled = true

					if v.KeyboardKeyCode == Enum.KeyCode.E then
						v.ActionText = "Grab"
						v.ObjectText = t15.Name
						v114 = v
						t15.GrabPrompt = v
					elseif v.KeyboardKeyCode == Enum.KeyCode.F then
						v.ActionText = "Sell: $" .. NumberUtils:ToString(math.round(v76.Price / 2))
						v115 = v
						t15.SellPrompt = v
						table.insert(t15.Connections, v.Triggered:Connect(function(player)
							if player ~= LocalPlayer then
								return
							end

							local v118 = math.round(v76.Price / 2)

							t15.Money = 0

							if t15.CashPadCleanup then
								pcall(t15.CashPadCleanup)
							end

							v71(v118)
							pcall(function()
								t15.AnimTrack:Stop()
							end)
							pcall(function()
								t15.Overhead:Destroy()
							end)

							for _, child in ipairs(PromptAttachment:GetChildren()) do
								if child:IsA("ProximityPrompt") then
									child:Destroy()
								end
							end

							pcall(function()
								if t15.CleanupTraits then
									t15.CleanupTraits()
								end

								clone3:Destroy()
							end)
							pcall(function()
								Attachment:Destroy()
							end)

							for _, connection in ipairs(t15.Connections) do
								pcall(function()
									connection:Disconnect()
								end)
							end

							t15.Connections = {}

							for i, v2 in ipairs(t2) do
								if v2 == t15 then
									table.remove(t2, i)

									break
								end
							end
						end))
					end
				end
			end

			if v114 and v115 then
				table.insert(t15.Connections, ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt, player)
					if player ~= LocalPlayer or prompt.Parent ~= PromptAttachment then
						return
					end

					if prompt == v115 then
						v114.Enabled = false
					elseif prompt == v114 then
						v115.Enabled = false
					end
				end))
				table.insert(t15.Connections, ProximityPromptService.PromptButtonHoldEnded:Connect(function(p9, p10)
					if p10 ~= LocalPlayer or p9.Parent ~= PromptAttachment then
						return
					end

					if p9 == v115 then
						v114.Enabled = true
					elseif p9 == v114 then
						v115.Enabled = true
					end
				end))
			end

			NotificationController:Success("Spawned: " .. text .. (v78 and " [" .. v78.DisplayText .. "]" or ""))

			return
		end
	end

	return NotificationController:Error("Brainrot not found: " .. tostring(text))
end
local function v125()
	for i = #t2, 1, -1 do
		local v127 = t2[i]

		pcall(function()
			v127.AnimTrack:Stop()
		end)
		pcall(function()
			v127.Model:Destroy()
		end)
		pcall(function()
			v127.Attachment:Destroy()
		end)

		if v127.OverheadAttachment then
			pcall(function()
				v127.OverheadAttachment:Destroy()
			end)
		end

		if v127.CashPadCleanup then
			pcall(v127.CashPadCleanup)
		end

		if v127.CleanupTraits then
			pcall(v127.CleanupTraits)
		end

		for _, connection in ipairs(v127.Connections) do
			pcall(function()
				connection:Disconnect()
			end)
		end

		table.remove(t2, i)
	end

	n1 = 0
end

RunService.RenderStepped:Connect(function()
	for _, v in ipairs(t2) do
		pcall(function()
			v.CashPadGui.Enabled = true
			v.CashPadGui.Offline.Visible = false
			v.AnimTrack.TimePosition = workspace:GetServerTimeNow() % v.AnimLength
		end)
	end

	leaderstats.Cash.Value = NumberUtils:ToString(v38 + n1, 2)
	Currency.Text = "$" .. NumberUtils:ToString(v38 + n1, 2)
end)
task.spawn(function()
	while task.wait(1) do
		for _, v in ipairs(t2) do
			local n3 = 1
			local Multiplier = PlotModel:FindFirstChild("Multiplier")

			if Multiplier and Multiplier:FindFirstChild("Main") then
				if Multiplier.Main:FindFirstChild("Amount") then
					n3 = tonumber(Multiplier.Main.Amount.Text:sub(2)) or 1
				end
			end

			if v.MutationKey and Mutations[v.MutationKey] then
				n3 += Mutations[v.MutationKey].Modifier or 0
			end

			if v.TraitKeys then
				for _, traitKey in ipairs(v.TraitKeys) do
					local v138 = Traits[traitKey]

					if v138 then
						if v138.MultiplierModifier then
							n3 += v138.MultiplierModifier
						end
					end
				end
			end

			v.Money += math.round(v.Generation * n3)
			v.CashPadGui.CollectAmount.Text = "$" .. NumberUtils:ToString(v.Money, 1)
		end
	end
end)

local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local v141 = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local _ = GuiService:GetGuiInset()
local uDim2 = v141 and UDim2.new(0.92, 0, 0, 0) or UDim2.new(0, 420, 0, 0)
local v145 = v141 and 460 or 520
local uDim22 = v141 and UDim2.new(0.04, 0, 0.04, 0) or UDim2.new(0.5, -210, 0.5, -260)
local v147 = v141 and 44 or 36
local v148 = v141 and 38 or 30
local v149 = v141 and 42 or 34
local v150 = v141 and 48 or 42
local v151 = v141 and 38 or 32
local textSize = v141 and 15 or 13
local textSize2 = v141 and 13 or 11
local textSize3 = v141 and 17 or 15
local v155 = v141 and 200 or 160
local scrollBarThickness = v141 and 6 or 4
local v157 = v141 and 36 or 28
local t16 = {
	Bg = Color3.fromRGB(18, 18, 24),
	Surface = Color3.fromRGB(26, 26, 36),
	Card = Color3.fromRGB(32, 32, 44),
	CardHover = Color3.fromRGB(40, 40, 54),
	Accent = Color3.fromRGB(88, 101, 242),
	AccentHover = Color3.fromRGB(108, 121, 255),
	AccentDark = Color3.fromRGB(60, 70, 180),
	Text = Color3.fromRGB(220, 221, 225),
	TextDim = Color3.fromRGB(140, 142, 155),
	TextMuted = Color3.fromRGB(90, 92, 105),
	Danger = Color3.fromRGB(237, 66, 69),
	DangerHover = Color3.fromRGB(255, 86, 89),
	Success = Color3.fromRGB(35, 165, 90),
	SuccessHover = Color3.fromRGB(55, 185, 110),
	Border = Color3.fromRGB(48, 48, 64),
	InputBg = Color3.fromRGB(20, 20, 28),
	ScrollBar = Color3.fromRGB(60, 60, 80),
	Selected = Color3.fromRGB(88, 101, 242),
	ToggleBg = Color3.fromRGB(88, 101, 242)
}
local ScreenGui = Instance.new("ScreenGui")

ScreenGui.Name = "GetAnyBrainrot"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 100
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = LocalPlayer.PlayerGui

local function v160(p11, p12, p13, p14, p15)
	return TweenService:Create(p11, TweenInfo.new(p13 or 0.2, p14 or Enum.EasingStyle.Quart, p15 or Enum.EasingDirection.Out), p12)
end
local function createUICorner(p16, p17)
	local UICorner = Instance.new("UICorner")

	UICorner.CornerRadius = UDim.new(0, p17 or 8)
	UICorner.Parent = p16

	return UICorner
end
local function createUIStroke(p18, p19, p20)
	local UIStroke = Instance.new("UIStroke")

	UIStroke.Color = p19 or t16.Border
	UIStroke.Thickness = p20 or 1
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke.Parent = p18

	return UIStroke
end
local function createUIPadding(p21, p22, p23, p24, p25)
	local UIPadding = Instance.new("UIPadding")
	local n4 = 0

	UIPadding.PaddingTop = UDim.new(n4, p22 or 0)
	UIPadding.PaddingBottom = UDim.new(n4, p23 or 0)
	UIPadding.PaddingLeft = UDim.new(n4, p24 or 0)
	UIPadding.PaddingRight = UDim.new(n4, p25 or 0)
	UIPadding.Parent = p21

	return UIPadding
end

local TextButton = Instance.new("TextButton")

TextButton.Name = "ToggleBtn"
TextButton.Size = UDim2.new(0, 48, 0, 48)
TextButton.Position = UDim2.new(0, 12, 0.5, -24)
TextButton.BackgroundColor3 = t16.ToggleBg
TextButton.Text = "B"
TextButton.TextColor3 = Color3.new(1, 1, 1)
TextButton.TextSize = 20
TextButton.Font = Enum.Font.GothamBold
TextButton.BorderSizePixel = 0
TextButton.ZIndex = 10
TextButton.Parent = ScreenGui
createUICorner(TextButton, 24)

local ImageLabel = Instance.new("ImageLabel")

ImageLabel.Size = UDim2.new(1, 16, 1, 16)
ImageLabel.Position = UDim2.new(0, -8, 0, -8)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Image = "rbxassetid://6015897843"
ImageLabel.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel.ImageTransparency = 0.5
ImageLabel.ScaleType = Enum.ScaleType.Slice
ImageLabel.SliceCenter = Rect.new(49, 49, 450, 450)
ImageLabel.ZIndex = 0
ImageLabel.Parent = TextButton

local u170
local Position
local Position2

TextButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
		u170 = true
		Position = input.Position
		Position2 = TextButton.Position
	end
end)
TextButton.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch then
		u170 = false

		return
	elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
		u170 = false
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if u170 then
		if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
			local v173 = input.Position - Position

			if v173.Magnitude > 8 then
				TextButton.Position = UDim2.new(Position2.X.Scale, Position2.X.Offset + v173.X, Position2.Y.Scale, Position2.Y.Offset + v173.Y)
			end
		end
	end
end)

local Frame = Instance.new("Frame")

Frame.Name = "Window"

if v141 then
	Frame.Size = UDim2.new(uDim2.X.Scale, uDim2.X.Offset, 0, v145)
else
	Frame.Size = UDim2.new(0, 420, 0, v145)
end

Frame.Position = uDim22
Frame.BackgroundColor3 = t16.Bg
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Parent = ScreenGui
createUICorner(Frame, 12)
createUIStroke(Frame, t16.Border, 1)

local ImageLabel2 = Instance.new("ImageLabel")

ImageLabel2.Name = "Shadow"
ImageLabel2.Size = UDim2.new(1, 30, 1, 30)
ImageLabel2.Position = UDim2.new(0, -15, 0, -15)
ImageLabel2.BackgroundTransparency = 1
ImageLabel2.Image = "rbxassetid://6015897843"
ImageLabel2.ImageColor3 = Color3.new(0, 0, 0)
ImageLabel2.ImageTransparency = 0.5
ImageLabel2.ScaleType = Enum.ScaleType.Slice
ImageLabel2.SliceCenter = Rect.new(49, 49, 450, 450)
ImageLabel2.ZIndex = 0
ImageLabel2.Parent = Frame

local Frame2 = Instance.new("Frame")

Frame2.Name = "TitleBar"
Frame2.Size = UDim2.new(1, 0, 0, v150)
Frame2.BackgroundColor3 = t16.Surface
Frame2.BorderSizePixel = 0
Frame2.Parent = Frame
createUICorner(Frame2, 12)

local Frame3 = Instance.new("Frame")

Frame3.Size = UDim2.new(1, 0, 0, 16)
Frame3.Position = UDim2.new(0, 0, 1, -16)
Frame3.BackgroundColor3 = t16.Surface
Frame3.BorderSizePixel = 0
Frame3.Parent = Frame2

local TextLabel = Instance.new("TextLabel")

TextLabel.Size = UDim2.new(1, -100, 1, 0)
TextLabel.Position = UDim2.new(0, 14, 0, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "Get Any Brainrot"
TextLabel.TextColor3 = t16.Text
TextLabel.TextSize = textSize3
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.Parent = Frame2

local TextLabel2 = Instance.new("TextLabel")

TextLabel2.Size = UDim2.new(0, 40, 1, 0)
TextLabel2.Position = UDim2.new(1, -120, 0, 0)
TextLabel2.BackgroundTransparency = 1
TextLabel2.Text = "v2.0"
TextLabel2.TextColor3 = t16.TextMuted
TextLabel2.TextSize = textSize2
TextLabel2.Font = Enum.Font.Gotham
TextLabel2.TextXAlignment = Enum.TextXAlignment.Right
TextLabel2.Parent = Frame2

local v180 = v141 and 36 or 28
local TextButton2 = Instance.new("TextButton")

TextButton2.Size = UDim2.new(0, v180, 0, v180)
TextButton2.Position = UDim2.new(1, -v180 - 8, 0.5, -v180 / 2)
TextButton2.BackgroundColor3 = t16.Danger
TextButton2.BackgroundTransparency = 0.8
TextButton2.Text = "X"
TextButton2.TextColor3 = t16.Danger
TextButton2.TextSize = v141 and 16 or 12
TextButton2.Font = Enum.Font.GothamBold
TextButton2.BorderSizePixel = 0
TextButton2.Parent = Frame2
createUICorner(TextButton2, 6)

local TextButton3 = Instance.new("TextButton")

TextButton3.Size = UDim2.new(0, v180, 0, v180)
TextButton3.Position = UDim2.new(1, -v180 * 2 - 14, 0.5, -v180 / 2)
TextButton3.BackgroundColor3 = t16.Accent
TextButton3.BackgroundTransparency = 0.8
TextButton3.Text = "_"
TextButton3.TextColor3 = t16.Accent
TextButton3.TextSize = v141 and 16 or 12
TextButton3.Font = Enum.Font.GothamBold
TextButton3.BorderSizePixel = 0
TextButton3.Parent = Frame2
createUICorner(TextButton3, 6)

local u183
local Position3
local Position4

Frame2.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		u183 = true
		Position3 = input.Position
		Position4 = Frame.Position

		return
	elseif input.UserInputType == Enum.UserInputType.Touch then
		u183 = true
		Position3 = input.Position
		Position4 = Frame.Position
	end
end)
Frame2.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		u183 = false
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if u183 then
		local v186

		if input.UserInputType == Enum.UserInputType.MouseMovement then
			v186 = input.Position - Position3
			Frame.Position = UDim2.new(Position4.X.Scale, Position4.X.Offset + v186.X, Position4.Y.Scale, Position4.Y.Offset + v186.Y)

			return
		elseif input.UserInputType == Enum.UserInputType.Touch then
			v186 = input.Position - Position3
			Frame.Position = UDim2.new(Position4.X.Scale, Position4.X.Offset + v186.X, Position4.Y.Scale, Position4.Y.Offset + v186.Y)
		end
	end
end)

local u187 = true
local u188 = false

local function v189()
	if v141 then
		return UDim2.new(uDim2.X.Scale, uDim2.X.Offset, 0, v145)
	end

	return UDim2.new(0, 420, 0, v145)
end
local function v190()
	if v141 then
		return UDim2.new(uDim2.X.Scale, uDim2.X.Offset, 0, v150)
	end

	return UDim2.new(0, 420, 0, v150)
end
local function v191()
	u187 = true
	Frame.Visible = true
	Frame.Size = v189()
	u188 = false
	TextButton3.Text = "_"
	TextButton.BackgroundColor3 = t16.ToggleBg
end
local function v192()
	u187 = false
	v160(Frame, {
		Size = v141 and UDim2.new(uDim2.X.Scale, uDim2.X.Offset, 0, 0) or UDim2.new(0, 420, 0, 0)
	}, 0.3):Play()
	task.delay(0.3, function()
		Frame.Visible = false
	end)
	TextButton.BackgroundColor3 = t16.AccentDark
end

local n5 = 0

TextButton.MouseButton1Click:Connect(function()
	local now = tick()

	if now - n5 < 0.3 then
		return
	end

	n5 = now

	if not u170 then
		if u187 then
			v192()
		else
			v191()
		end
	end
end)
TextButton2.MouseButton1Click:Connect(function()
	v192()
end)
TextButton3.MouseButton1Click:Connect(function()
	u188 = not u188

	if u188 then
		v160(Frame, {
			Size = v190()
		}, 0.25):Play()
		TextButton3.Text = "+"
	else
		v160(Frame, {
			Size = v189()
		}, 0.25):Play()
		TextButton3.Text = "_"
	end
end)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then
		return
	end

	if input.KeyCode == Enum.KeyCode.RightControl then
		if u187 then
			v192()
		else
			v191()
		end
	end
end)

local v195 = v150 + 6
local Frame4 = Instance.new("Frame")

Frame4.Name = "TabBar"
Frame4.Size = UDim2.new(1, -16, 0, v151)
Frame4.Position = UDim2.new(0, 8, 0, v195)
Frame4.BackgroundColor3 = t16.Surface
Frame4.BorderSizePixel = 0
Frame4.Parent = Frame
createUICorner(Frame4, 8)

local UIListLayout = Instance.new("UIListLayout")

UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 2)
UIListLayout.Parent = Frame4
createUIPadding(Frame4, 2, 2, 2, 2)

local t17 = {}
local u199
local v200 = v195 + v151 + 6

local function createScrollingFrame(p26, p27)
	local TextButton4 = Instance.new("TextButton")

	TextButton4.Name = p26
	TextButton4.Size = UDim2.new(0.333, -2, 1, 0)
	TextButton4.BackgroundColor3 = t16.Accent
	TextButton4.BackgroundTransparency = 1
	TextButton4.Text = p26
	TextButton4.TextColor3 = t16.TextDim
	TextButton4.TextSize = v141 and 14 or 12
	TextButton4.Font = Enum.Font.GothamSemibold
	TextButton4.BorderSizePixel = 0
	TextButton4.LayoutOrder = p27
	TextButton4.Parent = Frame4
	createUICorner(TextButton4, 6)

	local ScrollingFrame = Instance.new("ScrollingFrame")

	ScrollingFrame.Name = p26 .. "Page"
	ScrollingFrame.Size = UDim2.new(1, -16, 1, -(v200 + 8))
	ScrollingFrame.Position = UDim2.new(0, 8, 0, v200)
	ScrollingFrame.BackgroundTransparency = 1
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.ScrollBarThickness = scrollBarThickness
	ScrollingFrame.ScrollBarImageColor3 = t16.ScrollBar
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	ScrollingFrame.Visible = false
	ScrollingFrame.Parent = Frame

	local UIListLayout2 = Instance.new("UIListLayout")

	UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout2.Padding = UDim.new(0, 6)
	UIListLayout2.Parent = ScrollingFrame
	t17[p26] = {
		Btn = TextButton4,
		Page = ScrollingFrame
	}
	TextButton4.MouseButton1Click:Connect(function()
		if u199 then
			t17[u199].Page.Visible = false
			v160(t17[u199].Btn, {
				BackgroundTransparency = 1,
				TextColor3 = t16.TextDim
			}, 0.15):Play()
		end

		u199 = p26
		ScrollingFrame.Visible = true
		v160(TextButton4, {
			BackgroundTransparency = 0,
			TextColor3 = Color3.new(1, 1, 1)
		}, 0.15):Play()
	end)

	return ScrollingFrame
end

local Spawner = createScrollingFrame("Spawner", 1)
local Settings = createScrollingFrame("Settings", 2)
local Stats = createScrollingFrame("Stats", 3)

t17.Spawner.Btn.BackgroundTransparency = 0
t17.Spawner.Btn.TextColor3 = Color3.new(1, 1, 1)
Spawner.Visible = true
u199 = "Spawner"

local function createFrame(p28, p29, p30)
	local Frame5 = Instance.new("Frame")

	Frame5.Size = UDim2.new(1, 0, 0, v141 and 32 or 28)
	Frame5.BackgroundTransparency = 1
	Frame5.LayoutOrder = p30
	Frame5.Parent = p28

	local TextLabel3 = Instance.new("TextLabel")

	TextLabel3.Size = UDim2.new(1, 0, 1, 0)
	TextLabel3.BackgroundTransparency = 1
	TextLabel3.Text = p29
	TextLabel3.TextColor3 = t16.TextMuted
	TextLabel3.TextSize = textSize2
	TextLabel3.Font = Enum.Font.GothamBold
	TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel3.Parent = Frame5

	local Frame6 = Instance.new("Frame")

	Frame6.Size = UDim2.new(1, 0, 0, 1)
	Frame6.Position = UDim2.new(0, 0, 1, -1)
	Frame6.BackgroundColor3 = t16.Border
	Frame6.BorderSizePixel = 0
	Frame6.Parent = Frame5

	return Frame5
end
local function createTextButton(p31, p32, p33, p34, p35)
	local TextButton4 = Instance.new("TextButton")

	TextButton4.Size = UDim2.new(1, 0, 0, v147)
	TextButton4.BackgroundColor3 = p33 or t16.Accent
	TextButton4.Text = p32
	TextButton4.TextColor3 = Color3.new(1, 1, 1)
	TextButton4.TextSize = textSize
	TextButton4.Font = Enum.Font.GothamSemibold
	TextButton4.BorderSizePixel = 0
	TextButton4.LayoutOrder = p34
	TextButton4.Parent = p31
	createUICorner(TextButton4, 8)

	local DangerHover = p33 == t16.Danger and t16.DangerHover or p33 == t16.Success and t16.SuccessHover

	DangerHover = DangerHover or t16.AccentHover
	TextButton4.MouseEnter:Connect(function()
		v160(TextButton4, {
			BackgroundColor3 = DangerHover
		}, 0.15):Play()
	end)
	TextButton4.MouseLeave:Connect(function()
		v160(TextButton4, {
			BackgroundColor3 = p33 or t16.Accent
		}, 0.15):Play()
	end)
	TextButton4.MouseButton1Click:Connect(function()
		v160(TextButton4, {
			Size = UDim2.new(1, -4, 0, v147 - 2)
		}, 0.05):Play()
		task.delay(0.05, function()
			v160(TextButton4, {
				Size = UDim2.new(1, 0, 0, v147)
			}, 0.1):Play()
		end)

		if p35 then
			p35()
		end
	end)

	return TextButton4
end
local function v215(p36, p37)
	local v216 = v141 and 56 or 50
	local Frame5 = Instance.new("Frame")

	Frame5.Size = UDim2.new(1, 0, 0, v216)
	Frame5.BackgroundColor3 = t16.Card
	Frame5.BorderSizePixel = 0
	Frame5.LayoutOrder = p37
	Frame5.Parent = p36
	createUICorner(Frame5, 8)

	local TextLabel3 = Instance.new("TextLabel")

	TextLabel3.Name = "Info"
	TextLabel3.Size = UDim2.new(1, -16, 1, 0)
	TextLabel3.Position = UDim2.new(0, 8, 0, 0)
	TextLabel3.BackgroundTransparency = 1
	TextLabel3.Text = ""
	TextLabel3.TextColor3 = t16.Text
	TextLabel3.TextSize = textSize
	TextLabel3.Font = Enum.Font.Gotham
	TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel3.TextWrapped = true
	TextLabel3.RichText = true
	TextLabel3.Parent = Frame5

	return Frame5, TextLabel3
end

local v219, v220 = v215(Spawner, 1)

v219.Size = UDim2.new(1, 0, 0, v141 and 48 or 40)
v220.TextSize = v141 and 16 or 14
v220.Font = Enum.Font.GothamBold

local function v221()
	local v222 = Animals3[text]
	local Rarity = v222 and v222.Rarity or "?"
	local v224 = v222 and Rarities[v222.Rarity]

	v220.Text = text .. "  <font color=\"" .. (v224 and string.format("#%02X%02X%02X", math.floor(v224.Color.R * 255), math.floor(v224.Color.G * 255), math.floor(v224.Color.B * 255)) or "#FFFFFF") .. "\">[" .. Rarity .. "]</font>"

	if s1 ~= "None" then
		v220.Text ..= "  <font color=\"#FFD700\">" .. s1 .. "</font>"
	end
end

v221()
createFrame(Spawner, "SEARCH BRAINROT", 2)

local Frame5 = Instance.new("Frame")

Frame5.Size = UDim2.new(1, 0, 0, v149)
Frame5.BackgroundColor3 = t16.InputBg
Frame5.BorderSizePixel = 0
Frame5.LayoutOrder = 3
Frame5.Parent = Spawner
createUICorner(Frame5, 8)
createUIStroke(Frame5, t16.Border, 1)

local TextBox = Instance.new("TextBox")

TextBox.Size = UDim2.new(1, -16, 1, 0)
TextBox.Position = UDim2.new(0, 8, 0, 0)
TextBox.BackgroundTransparency = 1
TextBox.Text = ""
TextBox.PlaceholderText = v141 and "Tap to search..." or "Type to search..."
TextBox.PlaceholderColor3 = t16.TextMuted
TextBox.TextColor3 = t16.Text
TextBox.TextSize = textSize
TextBox.Font = Enum.Font.Gotham
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.ClearTextOnFocus = false
TextBox.Parent = Frame5

local ScrollingFrame = Instance.new("ScrollingFrame")

ScrollingFrame.Size = UDim2.new(1, 0, 0, v155)
ScrollingFrame.BackgroundColor3 = t16.Surface
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.LayoutOrder = 4
ScrollingFrame.ScrollBarThickness = scrollBarThickness
ScrollingFrame.ScrollBarImageColor3 = t16.ScrollBar
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.Parent = Spawner
createUICorner(ScrollingFrame, 8)

local UIListLayout2 = Instance.new("UIListLayout")

UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout2.Padding = UDim.new(0, v141 and 2 or 1)
UIListLayout2.Parent = ScrollingFrame
createUIPadding(ScrollingFrame, 4, 4, 4, 4)

local t18 = {}

local function v230(p38)
	for _, v in ipairs(t18) do
		v:Destroy()
	end

	t18 = {}

	local v233 = p38 and p38:lower() or ""
	local layoutOrder = 0

	for _, v in ipairs(t4) do
		if v233 ~= "" then
			if not v.Name:lower():find(v233, 1, true) then
				continue
			end
		end

		layoutOrder += 1

		local v237 = Rarities[v.Rarity]
		local TextButton4 = Instance.new("TextButton")

		TextButton4.Size = UDim2.new(1, -8, 0, v148)
		TextButton4.BackgroundColor3 = v.Name == text and t16.Selected or t16.Card
		TextButton4.BackgroundTransparency = v.Name == text and 0.3 or 0
		TextButton4.Text = ""
		TextButton4.BorderSizePixel = 0
		TextButton4.LayoutOrder = layoutOrder
		TextButton4.Parent = ScrollingFrame
		createUICorner(TextButton4, 6)

		local TextLabel3 = Instance.new("TextLabel")

		TextLabel3.Size = UDim2.new(0.65, 0, 1, 0)
		TextLabel3.Position = UDim2.new(0, 10, 0, 0)
		TextLabel3.BackgroundTransparency = 1
		TextLabel3.Text = v.Name
		TextLabel3.TextColor3 = t16.Text
		TextLabel3.TextSize = v141 and 14 or 12
		TextLabel3.Font = Enum.Font.GothamSemibold
		TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel3.TextTruncate = Enum.TextTruncate.AtEnd
		TextLabel3.Parent = TextButton4

		local TextLabel4 = Instance.new("TextLabel")

		TextLabel4.Size = UDim2.new(0.3, -10, 1, 0)
		TextLabel4.Position = UDim2.new(0.7, 0, 0, 0)
		TextLabel4.BackgroundTransparency = 1
		TextLabel4.Text = v.Rarity
		TextLabel4.TextColor3 = v237 and v237.Color or t16.TextDim
		TextLabel4.TextSize = v141 and 13 or 11
		TextLabel4.Font = Enum.Font.GothamSemibold
		TextLabel4.TextXAlignment = Enum.TextXAlignment.Right
		TextLabel4.Parent = TextButton4
		TextButton4.MouseEnter:Connect(function()
			if v.Name ~= text then
				v160(TextButton4, {
					BackgroundColor3 = t16.CardHover
				}, 0.1):Play()
			end
		end)
		TextButton4.MouseLeave:Connect(function()
			if v.Name ~= text then
				v160(TextButton4, {
					BackgroundColor3 = t16.Card
				}, 0.1):Play()
			end
		end)
		TextButton4.MouseButton1Click:Connect(function()
			text = v.Name
			v221()
			v230(TextBox.Text)
		end)
		table.insert(t18, TextButton4)
	end
end

v230("")
TextBox:GetPropertyChangedSignal("Text"):Connect(function()
	v230(TextBox.Text)
end)
createFrame(Spawner, "MUTATION", 5)

local Frame6 = Instance.new("Frame")

Frame6.Size = UDim2.new(1, 0, 0, v149)
Frame6.BackgroundColor3 = t16.Card
Frame6.BorderSizePixel = 0
Frame6.LayoutOrder = 6
Frame6.Parent = Spawner
createUICorner(Frame6, 8)

local TextButton4 = Instance.new("TextButton")

TextButton4.Size = UDim2.new(1, 0, 1, 0)
TextButton4.BackgroundTransparency = 1
TextButton4.Text = "  None"
TextButton4.TextColor3 = t16.Text
TextButton4.TextSize = textSize
TextButton4.Font = Enum.Font.Gotham
TextButton4.TextXAlignment = Enum.TextXAlignment.Left
TextButton4.Parent = Frame6
createUIPadding(TextButton4, 0, 0, 8, 0)

local TextLabel3 = Instance.new("TextLabel")

TextLabel3.Size = UDim2.new(0, 24, 1, 0)
TextLabel3.Position = UDim2.new(1, -32, 0, 0)
TextLabel3.BackgroundTransparency = 1
TextLabel3.Text = "v"
TextLabel3.TextColor3 = t16.TextDim
TextLabel3.TextSize = v141 and 16 or 12
TextLabel3.Font = Enum.Font.GothamBold
TextLabel3.Parent = Frame6

local ScrollingFrame2 = Instance.new("ScrollingFrame")

ScrollingFrame2.Size = UDim2.new(1, 0, 0, 0)
ScrollingFrame2.BackgroundColor3 = t16.Surface
ScrollingFrame2.BorderSizePixel = 0
ScrollingFrame2.LayoutOrder = 7
ScrollingFrame2.ScrollBarThickness = scrollBarThickness
ScrollingFrame2.ScrollBarImageColor3 = t16.ScrollBar
ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame2.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame2.Visible = false
ScrollingFrame2.ClipsDescendants = true
ScrollingFrame2.Parent = Spawner
createUICorner(ScrollingFrame2, 8)

local UIListLayout3 = Instance.new("UIListLayout")

UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout3.Padding = UDim.new(0, v141 and 2 or 1)
UIListLayout3.Parent = ScrollingFrame2
createUIPadding(ScrollingFrame2, 4, 4, 4, 4)

local u246 = false

for i, v in ipairs(t6) do
	local TextButton5 = Instance.new("TextButton")

	TextButton5.Size = UDim2.new(1, -8, 0, v157)
	TextButton5.BackgroundColor3 = t16.Card
	TextButton5.Text = "  " .. v
	TextButton5.TextColor3 = t16.Text
	TextButton5.TextSize = v141 and 14 or 12
	TextButton5.Font = Enum.Font.Gotham
	TextButton5.TextXAlignment = Enum.TextXAlignment.Left
	TextButton5.BorderSizePixel = 0
	TextButton5.LayoutOrder = i
	TextButton5.Parent = ScrollingFrame2
	createUICorner(TextButton5, 6)
	TextButton5.MouseEnter:Connect(function()
		v160(TextButton5, {
			BackgroundColor3 = t16.CardHover
		}, 0.1):Play()
	end)
	TextButton5.MouseLeave:Connect(function()
		v160(TextButton5, {
			BackgroundColor3 = t16.Card
		}, 0.1):Play()
	end)
	TextButton5.MouseButton1Click:Connect(function()
		s1 = v
		TextButton4.Text = "  " .. v
		v221()
		u246 = false
		ScrollingFrame2.Visible = false
		v160(ScrollingFrame2, {
			Size = UDim2.new(1, 0, 0, 0)
		}, 0.15):Play()
	end)
end

TextButton4.MouseButton1Click:Connect(function()
	u246 = not u246

	if u246 then
		ScrollingFrame2.Visible = true

		local v250 = math.min(#t6 * (v157 + 2) + 8, v141 and 220 or 180)

		v160(ScrollingFrame2, {
			Size = UDim2.new(1, 0, 0, v250)
		}, 0.2):Play()
		TextLabel3.Text = "^"
	else
		v160(ScrollingFrame2, {
			Size = UDim2.new(1, 0, 0, 0)
		}, 0.15):Play()
		task.delay(0.15, function()
			ScrollingFrame2.Visible = false
		end)
		TextLabel3.Text = "v"
	end
end)
createFrame(Spawner, "ACTIONS", 10)
createTextButton(Spawner, "Spawn Brainrot", t16.Accent, 11, function()
	v73()
end)
createTextButton(Spawner, "Fill All Podiums", t16.AccentDark, 12, function()
	local n6 = 0

	while v67() do
		v73()
		n6 += 1
		task.wait(0.05)
	end

	if n6 > 0 then
		NotificationController:Success("Spawned " .. n6 .. " brainrots!")
	end
end)
createTextButton(Spawner, "Collect All Money", t16.Success, 13, function()
	local n7 = 0

	for _, v in ipairs(t2) do
		if v.Money > 0 then
			n7 += v.Money
			v.Money = 0
			pcall(function()
				v.CashPadGui.CollectAmount.Text = "$0"
			end)
		end
	end

	if n7 > 0 then
		v71(n7)
		NotificationController:Success("Collected $" .. NumberUtils:ToString(n7, 1) .. "!")
	end
end)
createTextButton(Spawner, "Clear All Brainrots", t16.Danger, 14, function()
	v125()
	NotificationController:Success("All brainrots cleared!")
end)
createFrame(Settings, "CONTROLS", 1)

local _, v256 = v215(Settings, 2)

if v141 then
	v256.Text = "<font color=\"#8888AA\">Toggle UI:</font>  Floating button (drag to move)"
else
	v256.Text = "<font color=\"#8888AA\">Toggle UI:</font>  Right Ctrl / Floating button"
end

createFrame(Settings, "INFO", 3)

local v257, v258 = v215(Settings, 4)

v257.Size = UDim2.new(1, 0, 0, v141 and 80 or 70)
v258.Text = [[<font color="#8888AA">Script:</font>  Get Any Brainrot v2.0
<font color="#8888AA">Author:</font>  Project Reverse
<font color="#8888AA">Total Brainrots:</font>  ]] .. #t5 .. "\n<font color=\"#8888AA\">Platform:</font>  " .. (v141 and "Mobile" or "PC")
createFrame(Stats, "LIVE STATISTICS", 1)

local _, v260 = v215(Stats, 2)
local _, v262 = v215(Stats, 3)
local _, v264 = v215(Stats, 4)
local _, v266 = v215(Stats, 5)

v260.Text = "<font color=\"#8888AA\">Income:</font>  $0/s"
v262.Text = "<font color=\"#8888AA\">Pending:</font>  $0"
v264.Text = "<font color=\"#8888AA\">Total Earned:</font>  $0"
v266.Text = "<font color=\"#8888AA\">Spawned:</font>  0 brainrots"
task.spawn(function()
	while task.wait(0.5) do
		pcall(function()
			local n8 = 0
			local n9 = 0

			for _, v in ipairs(t2) do
				n8 += v.Generation * v.TotalModifier
				n9 += v.Money
			end

			v260.Text = "<font color=\"#8888AA\">Income:</font>  <font color=\"#23A55A\">$" .. NumberUtils:ToString(n8, 1) .. "/s</font>"
			v262.Text = "<font color=\"#8888AA\">Pending:</font>  <font color=\"#FFD700\">$" .. NumberUtils:ToString(n9, 1) .. "</font>"
			v264.Text = "<font color=\"#8888AA\">Total Earned:</font>  <font color=\"#23A55A\">$" .. NumberUtils:ToString(n1, 2) .. "</font>"
			v266.Text = "<font color=\"#8888AA\">Spawned:</font>  " .. #t2 .. " brainrots"
		end)
	end
end)
