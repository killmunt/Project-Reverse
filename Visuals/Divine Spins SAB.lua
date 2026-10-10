-- discord.gg/syncrypt

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local LocalPlayer = Players.LocalPlayer
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Controllers = ReplicatedStorage:WaitForChild("Controllers")
local Datas = ReplicatedStorage:WaitForChild("Datas")
local Shared = ReplicatedStorage:WaitForChild("Shared")
local NotificationController = require(Controllers.NotificationController)
local PlotController = require(Controllers.PlotController)

require(ReplicatedStorage.Utils.NumberUtils)

local Synchronizer = require(Packages.Synchronizer)
local Gradients = require(Packages.Gradients)
local Animals = require(Datas.Animals)
local Mutations = require(Datas.Mutations)
local Rarities = require(Datas.Rarities)
local Animals2 = require(Shared.Animals)
local DivineSpinWheel = require(Datas.DivineSpinWheel)
local Shop = require(Datas.Shop)
local Animals3 = ReplicatedStorage:WaitForChild("Models").Animals
local Animals4 = ReplicatedStorage:WaitForChild("Animations").Animals
local AnimalOverhead = ReplicatedStorage:WaitForChild("Overheads", 9e9).AnimalOverhead
local leaderstats = LocalPlayer:WaitForChild("leaderstats", 9e9)
local LeftBottom = LocalPlayer.PlayerGui:WaitForChild("LeftBottom", 9e9).LeftBottom
local Cashout = LeftBottom:WaitForChild("Cashout", 9e9)
local Currency = LeftBottom.Currency
local NumberUtils = require(ReplicatedStorage.Utils.NumberUtils)

local function v29(p1)
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

local t2 = {
	[3290160783] = 25000,
	[3290160857] = 100000,
	[3290161030] = 1000000
}
local u36 = false
local u37 = false
local u38 = false
local totalSpins = 0
local t3 = {}
local n1 = 0
local v42 = v29(leaderstats.Cash.Value)
local t4 = {}
local v44 = Random.new(os.clock() * 1000000 + tick() * 1000)

local function v45()
	local Rewards = DivineSpinWheel.Rewards
	local n2 = 0

	for _, Reward in ipairs(Rewards) do
		n2 += Reward.Weight
	end

	local v50 = v44:NextNumber() * n2
	local n3 = 0

	for i, Reward in ipairs(Rewards) do
		n3 += Reward.Weight

		if v50 <= n3 then
			return i, Reward
		end
	end

	return #Rewards, Rewards[#Rewards]
end
local function v54()
	local v55 = Synchronizer:Get(LocalPlayer)

	if v55 then
		local Rebirth = v55:Get("Rebirth") or 0

		if Rebirth > 1 then
			return Rebirth
		end

		if Rebirth == 1 then
			return 1.5
		end
	end

	return 1
end
local function v57(p2)
	n1 += p2

	local clone = Cashout.Template:Clone()

	clone.Text = ("+$%s"):format(NumberUtils:ToString(p2, 2))
	clone.TextColor3 = Color3.fromRGB(13, 255, 0)
	clone.Visible = true
	clone.Parent = Cashout
	TweenService:Create(clone, TweenInfo.new(5, Enum.EasingStyle.Linear), {
		TextTransparency = 1
	}):Play()
	TweenService:Create(clone.UIStroke, TweenInfo.new(5, Enum.EasingStyle.Linear), {
		Transparency = 1
	}):Play()
	task.delay(5, function()
		clone:Destroy()
	end)
end
local function v59()
	local myPlot = PlotController:GetMyPlot()

	if not myPlot or not myPlot.PlotModel then
		return nil
	end

	local AnimalPodiums = myPlot.PlotModel.AnimalPodiums

	for i = 1, #AnimalPodiums:GetChildren() do
		local v63 = AnimalPodiums:FindFirstChild(tostring(i))

		if v63 then
			if not v63.Base:FindFirstChild("Spawn") then
				continue
			end

			if v63.Base.Spawn:FindFirstChild("Attachment") then
				continue
			end

			return v63
		end
	end

	return nil
end
local function v64(p3, p4)
	local v65 = Animals3:FindFirstChild(p3)
	local v66 = Animals4:FindFirstChild(p3)
	local v67 = Animals[p3]

	if not v65 or not v66 or not v67 then
		return false
	end

	local v68 = Rarities[v67.Rarity]
	local v69 = v59()

	if not v69 then
		NotificationController:Error("No room for " .. p3 .. "! Base is full.")

		return false
	end

	local PlotModel = PlotController:GetMyPlot().PlotModel
	local v71 = p4 and Mutations[p4] or nil
	local clone = v65:Clone()

	clone.Parent = PlotModel
	clone.PrimaryPart.Anchored = true
	clone:PivotTo(v69.Base.Spawn:GetPivot())

	for _, descendant in ipairs(clone:GetDescendants()) do
		if descendant:IsA("BasePart") then
			descendant.CanCollide = false
		end
	end

	local Attachment = Instance.new("Attachment")

	Attachment.Name = "Attachment"
	Attachment.Parent = v69.Base.Spawn

	local clone2 = AnimalOverhead:Clone()

	clone2.Parent = clone:FindFirstChild("RootPart") or clone.PrimaryPart

	local extentsSize = clone:GetExtentsSize()
	local Attachment2 = Instance.new("Attachment")

	Attachment2.Name = "Info"
	Attachment2.CFrame = CFrame.new(0, extentsSize.Y * 0.75 * (v67.OverheadYOffsetModifier or 1), 0)
	Attachment2.Parent = v69.Base.Spawn
	clone2.Parent = Attachment2
	clone2.DisplayName.Text = p3
	clone2.Rarity.Text = v67.Rarity
	clone2.Rarity.TextColor3 = v68.Color
	clone2.Price.Text = "$" .. NumberUtils:ToString(v67.Price, 2)

	if v71 then
		Animals2:ApplyMutation(clone, p3, p4)
		clone2.Mutation.Text = v71.DisplayText
		clone2.Mutation.TextColor3 = v71.MainColor or Color3.new(1, 1, 1)

		if v71.GradientPreset then
			Gradients.apply(clone2.Mutation, v71.GradientPreset)
		end
	else
		clone2.Mutation.Visible = false
	end

	local v79 = 1 + (v71 and v71.Modifier or 0)

	clone2.Generation.Text = "$" .. NumberUtils:ToString(v67.Generation * v79, 1) .. "/s"

	if v68.GradientPreset then
		Gradients.apply(clone2.Rarity, v68.GradientPreset)
	end

	local v80 = clone.AnimationController.Animator:LoadAnimation(v66.Idle)

	v80:Play()

	local Collect = v69.Claim.Main.Collect

	Collect.Enabled = true
	Collect.Collect.Text = "Collect <br/><font color=\"#73ff00\">$0</font>"

	local ViewportFrame = Collect:FindFirstChildOfClass("ViewportFrame")

	if ViewportFrame then
		ViewportFrame.WorldModel:ClearAllChildren()
		clone:Clone().Parent = ViewportFrame.WorldModel
	end

	local t5 = {
		Model = clone,
		Podium = v69,
		Attachment = Attachment,
		OvAtt = Attachment2,
		Overhead = clone2,
		AnimTrack = v80,
		AnimLength = v80.Length,
		Money = 0,
		Generation = v67.Generation,
		TotalModifier = v79,
		Collecting = false,
		Connections = {}
	}

	table.insert(t4, t5)
	table.insert(t5.Connections, v69.Claim:WaitForChild("Hitbox").Touched:Connect(function(part)
		if part.Parent == LocalPlayer.Character and t5.Money > 0 and not t5.Collecting then
			t5.Collecting = true

			local Money = t5.Money

			t5.Money = 0
			v69.Claim.Main.Collect.Collect.Text = "Collect <br/><font color=\"#73ff00\">$0</font>"
			v57(Money)
			task.delay(0.2, function()
				t5.Collecting = false
			end)
		end
	end))

	return true
end
local function v85(p5)
	if p5.Type ~= "Cash-Pack" then
		if p5.Type == "Animal" then
			if v64(p5.Index, p5.Mutation) then
				return (p5.Mutation and p5.Mutation .. " " or "") .. p5.Index
			end

			return p5.Index .. " (no room)"
		end

		if p5.Type == "Item" then
			return p5.Display .. " (visual only)"
		end

		if p5.Type == "Server-Luck" then
			return p5.Display .. " (visual only)"
		end

		return p5.Display or "?"
	end

	local v86 = math.round((t2[p5.Index] or Shop[p5.Index] and Shop[p5.Index].Value or 0) * v54())

	v57(v86)

	return "$" .. NumberUtils:ToString(v86, 2)
end
local function v87()
	local DivineWheel = LocalPlayer.PlayerGui:FindFirstChild("DivineWheel")

	if DivineWheel then
		return DivineWheel:FindFirstChild("DivineWheel")
	end

	return nil
end
local function v89()
	local v90 = v87()

	return v90 and v90.Visible == true
end
local function v91(p6, p7)
	u36 = true

	local v92 = v87()
	local rotation = (p6 - 1) * -60 - (v44:NextNumber() - 0.5) * 0.7 * 60
	local v94 = u38 and 0.5 or 5
	local v95 = rotation + (u38 and 1 or 9) * 360

	if v92 then
		local Wheel = v92:FindFirstChild("Wheel")

		if Wheel then
			local Spinning = SoundService:FindFirstChild("Spinning")

			if Spinning then
				Spinning.Looped = true
				Spinning.Volume = u38 and 1 or 0.8
				Spinning:Play()
				TweenService:Create(Spinning, TweenInfo.new(v94, Enum.EasingStyle.Linear), {
					Volume = 0
				}):Play()
			end

			local u98
			local connection = RunService.PostSimulation:Connect(function()
				local v100 = math.floor((Wheel.Rotation + 30) / 60)

				if u98 ~= v100 then
					u98 = v100

					local Tick = v92:FindFirstChild("Tick")

					if Tick then
						Tick.Rotation = -40
						TweenService:Create(Tick, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							Rotation = 0
						}):Play()
					end
				end
			end)
			local tween = TweenService:Create(Wheel, TweenInfo.new(v94, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Rotation = v95
			})

			tween:Play()
			tween.Completed:Wait()
			connection:Disconnect()
			Wheel.Rotation = rotation

			if Spinning then
				Spinning:Stop()
				Spinning.Volume = u38 and 1 or 0.8
			end
		end
	else
		task.wait(u38 and 0.5 or 5)
	end

	u36 = false

	if p7 then
		p7()
	end
end
local function v103()
	if u36 then
		return nil
	end

	if not v89() then
		NotificationController:Error("Open the Divine Wheel first!")

		return nil
	end

	local v104, v105 = v45()

	totalSpins += 1

	local Display = v105.Display or "?"

	t3[Display] = (t3[Display] or 0) + 1
	v91(v104, nil)
	NotificationController:Success("You received " .. v85(v105) .. "!")

	return v105
end

RunService.RenderStepped:Connect(function()
	for _, v in ipairs(t4) do
		pcall(function()
			v.Podium.Claim.Main.Collect.Enabled = true
			v.Podium.Claim.Main.Collect.Offline.Visible = false
			v.AnimTrack.TimePosition = workspace:GetServerTimeNow() % v.AnimLength
		end)
	end

	leaderstats.Cash.Value = NumberUtils:ToString(v42 + n1, 2)
	Currency.Text = "$" .. NumberUtils:ToString(v42 + n1, 2)
end)
task.spawn(function()
	while task.wait(1) do
		local myPlot = PlotController:GetMyPlot()
		local n4 = 1

		if myPlot and myPlot.PlotModel then
			local Multiplier = myPlot.PlotModel:FindFirstChild("Multiplier")

			if Multiplier and Multiplier:FindFirstChild("Main") then
				if Multiplier.Main:FindFirstChild("Amount") then
					n4 = tonumber(Multiplier.Main.Amount.Text:sub(2)) or 1
				end
			end
		end

		for _, v in ipairs(t4) do
			v.Money += math.round(v.Generation * n4 * v.TotalModifier)
			pcall(function()
				v.Podium.Claim.Main.Collect.Collect.Text = "Collect <br/><font color=\"#73ff00\">$" .. NumberUtils:ToString(v.Money, 1) .. "</font>"
			end)
		end
	end
end)

local function v114()
	local t6 = {
		"Total Spins: " .. totalSpins,
		""
	}
	local t7 = {}

	for k, v in pairs(t3) do
		table.insert(t7, {
			Name = k,
			Count = v
		})
	end

	table.sort(t7, function(p8, p9)
		return p8.Count > p9.Count
	end)

	for _, v in ipairs(t7) do
		table.insert(t6, v.Name .. ": " .. v.Count .. " (" .. math.floor(v.Count / math.max(totalSpins, 1) * 10000) / 100 .. "%)")
	end

	table.insert(t6, "")
	table.insert(t6, "Cash Earned: $" .. NumberUtils:ToString(n1, 2))

	return table.concat(t6, "\n")
end

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt"))()
local v122 = lib:Window("Divine Roulette", Color3.fromRGB(155, 89, 182), Enum.KeyCode.RightControl)
local Spin = v122:Tab("Spin")
local Statistics = v122:Tab("Statistics")

Spin:Label("Status: Ready")
Spin:Button("Spin Once", function()
	if not u36 then
		task.spawn(v103)
	end
end)
Spin:Toggle("Auto Spin", false, function(p10)
	u37 = p10

	if p10 then
		task.spawn(function()
			while u37 do
				if u36 then
					task.wait(0.1)
				else
					v103()
					task.wait(0.2)
				end
			end
		end)
	end
end)
Spin:Toggle("Fast Spin", u38, function(p11)
	u38 = p11
end)
Spin:Button("Clear Stats", function()
	totalSpins = 0
	t3 = {}
	n1 = 0
end)
Statistics:Label("Spins: 0 | Earned: $0 | Brainrots: 0")
task.spawn(function()
	while task.wait(1) do
		pcall(function()
			if not (u36 and "SPINNING...") then
				if not (u37 and "AUTO") then
				end
			end

			lib:ChangePresetColor(Color3.fromRGB(155, 89, 182))
		end)
	end
end)
