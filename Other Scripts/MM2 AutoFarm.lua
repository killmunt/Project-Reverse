-- discord.gg/syncrypt

local lib = loadstring(game:HttpGet("https://cdn.project-reverse.org/Library.luau"))()
local genv = typeof(getgenv) == "function" and getgenv() or _G

if game.GameId ~= 66654135 then
	lib:Notify({
		Title = "Wrong game",
		Content = "This script only works in Murder Mystery 2 (GameId 66654135).",
		Type = "Danger",
		Duration = 6
	})

	return
end

if genv.mm2VisualLibraryLoaded then
	lib:Notify({
		Title = "Already loaded",
		Content = "MM2 is already loaded in this session.",
		Type = "Warning",
		Duration = 4
	})

	return
end

genv.mm2VisualLibraryLoaded = true

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

repeat
	task.wait()
until game:IsLoaded()

LocalPlayer:WaitForChild("PlayerGui")

local function v15()
	return LocalPlayer.Character
end
local function v16()
	local v17 = v15()

	return v17 and v17:FindFirstChildOfClass("Humanoid")
end
local function v18()
	local v19 = v15()
	local v20 = v19

	return v20 and v19:FindFirstChild("HumanoidRootPart")
end

local CoinCollected = ReplicatedStorage.Remotes.Gameplay.CoinCollected
local RoundStart = ReplicatedStorage.Remotes.Gameplay.RoundStart
local t1 = {
	"MouseButton1Click",
	"MouseButton1Down",
	"Activated"
}

local function v24(p1)
	if not p1 then
		return
	end

	local v25 = false

	for _, v in ipairs(t1) do
		local v28 = p1[v]

		if v28 and typeof(getconnections) == "function" then
			local ok, result = pcall(getconnections, v28)

			if ok then
				for _, v2 in pairs(result) do
					if v2 and typeof(v2.Function) == "function" then
						v25 = true
						pcall(v2.Function)
					end
				end
			end
		end

		if v28 and typeof(firesignal) == "function" then
			v25 = true
			pcall(firesignal, v28)
		end
	end

	if not v25 then
		pcall(function()
			if typeof(p1.Activate) == "function" then
				p1:Activate()
			end
		end)
	end
end

repeat
	pcall(function()
		v24(LocalPlayer.PlayerGui.DeviceSelect.Container.Tablet.Button)
	end)
	pcall(function()
		v24(LocalPlayer.PlayerGui.Join.Friends.Play)
	end)
	task.wait(1)
until LocalPlayer.PlayerGui:FindFirstChild("MainGUI")

local t2 = {
	AutoRevealRoles = false,
	CoinFarm = {
		StatsOverlay = false,
		State = false,
		Settings = {
			Speed = 22.5,
			DestroyMap = false,
			DestroyPlayers = false,
			Fly = false,
			DieAtFullBag = false
		}
	},
	CoinFarm2 = {
		Disable3DRendering = false,
		State = false,
		Settings = {
			Speed = 22.5,
			DestroyMap = false,
			DestroyPlayers = false,
			DieAtFullBag = false,
			Disable3DRendering = false
		}
	},
	ESP = {
		Players = false,
		Traps = false,
		DroppedGun = false
	},
	Noclip = false,
	Gameplay = {
		AutoPickUpGun = false,
		AutoShooting = false
	},
	AutoFarm = {
		TeleportSpawn = false,
		KillEveryoneAsAMurderer = false,
		AutoFlingMurderer = false,
		AutoFlingSheriff = false,
		AutoPrestige = false,
		KillEveryoneAsAMurdererAtFullBag = false,
		TeleportUnderMap = false,
		AutoTeleportToRandomServerIfServerIsEmpty = false,
		AutoFlingMurdererAtFullBag = false,
		PlayersToAutoServerHop = 2
	},
	AnnoyingStuff = {
		Fling = {
			PickedPlayer = nil,
			LoopFlingAllPlayers = false
		}
	},
	Sliders = {
		Speed = 16,
		Jump = 50
	},
	AutoOpenCrates = {
		State = false,
		Crate = "MysteryBox1",
		CrateType = "MysteryBox"
	},
	VisualGun = false,
	ShuffleWeapons = false,
	Emotes = {
		SelectedEmote = "zen",
		AutoPlayEmotes = false,
		AutoPlaySelectedEmote = false,
		EmoteSpamSpeed = 1
	}
}

local function v34(p2)
	local v35 = table.clone(p2)

	for k, v in pairs(v35) do
		if type(v) == "table" then
			v35[k] = v34(v)
		end
	end

	return v35
end

local v38 = v34(t2)

LocalPlayer.Idled:Connect(function()
	VirtualUser:ClickButton2(Vector2.new())
end)

local CenteredLabelGui = CoreGui:FindFirstChild("CenteredLabelGui") or Instance.new("ScreenGui")

CenteredLabelGui.Name = "CenteredLabelGui"
CenteredLabelGui.Parent = CoreGui

local CenteredTextLabel = CenteredLabelGui:FindFirstChild("CenteredTextLabel") or Instance.new("TextLabel")

CenteredTextLabel.Name = "CenteredTextLabel"
CenteredTextLabel.Visible = false
CenteredTextLabel.Text = ""
CenteredTextLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
CenteredTextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
CenteredTextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
CenteredTextLabel.BackgroundTransparency = 1
CenteredTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CenteredTextLabel.TextStrokeTransparency = 0.35
CenteredTextLabel.Font = Enum.Font.SourceSansBold
CenteredTextLabel.TextSize = 42
CenteredTextLabel.Parent = CenteredLabelGui

local now = tick()
local n1 = 0
local n2 = 0
local n3 = 40

CoinCollected.OnClientEvent:Connect(function(p3, p4, p5)
	n1 += 1
	n2 = tonumber(p4) or n2
	n3 = tonumber(p5) or n3
end)
RunService.RenderStepped:Connect(function()
	local v45 = math.floor(n1 * 3600 / math.max(tick() - now, 1))

	CenteredTextLabel.Text = ("Coins Collected: %d/%d\nTotal Coins: %d\nCoins Per Hour: %d"):format(n2, n3, n1, v45)
end)

local u46

local function v47()
	local v48 = v18()

	if not v48 then
		return
	end

	if Workspace:FindFirstChild("safespot") then
		v48.CFrame = CFrame.new(-106, 87.5, 2)
	else
		local Part = Instance.new("Part")

		Part.Name = "safespot"
		Part.Size = Vector3.new(25, 3, 25)
		Part.Position = Vector3.new(-106, 83, 2)
		Part.Parent = Workspace
		Part.Anchored = true
		Part.CanCollide = true
		Part.Transparency = 0
		task.wait()

		for i = 1, 3 do
			local v51 = v18()

			if not v51 then
				return
			end

			v51.CFrame = CFrame.new(-106, 87.5, 2)
			task.wait(0.1)
		end
	end
end

local t3 = {
	"sit",
	"ninja",
	"dab",
	"zen",
	"floss",
	"headless",
	"zombie",
	"wave",
	"cheer",
	"laugh"
}

local function v53(p6)
	ReplicatedStorage.Remotes.Misc.PlayEmote:Fire(p6)
end

task.spawn(function()
	while true do
		task.wait(1 / math.max(v38.Emotes.EmoteSpamSpeed, 1))

		if v38.Emotes.AutoPlayEmotes then
			v53(t3[math.random(1, #t3)])
		end
	end
end)

local function v54()
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and Workspace:WaitForChild(player.Name, 0.01) then
			Workspace[player.Name]:Destroy()
		end
	end
end
local function v57()
	for _, child in pairs(Workspace:GetChildren()) do
		if child:IsA("Model") and child:FindFirstChild("CoinContainer") then
			for _, child2 in pairs(child:GetChildren()) do
				if child2.Name ~= "CoinContainer" then
					child2:Destroy()
				end
			end
		end
	end
end
local function v62()
	if not LocalPlayer.Character then
		return
	end

	for _, descendant in pairs(LocalPlayer.Character:GetDescendants()) do
		if descendant:IsA("BasePart") and descendant.CanCollide then
			descendant.CanCollide = false
		end
	end
end

RunService.Stepped:Connect(function()
	local v65 = v16()

	if v38.Noclip and v65 and v65.Health > 0 and v18() then
		v62()
	end
end)

local function v66()
	local t4 = {}
	local ok, result = pcall(function()
		return require(ReplicatedStorage.Modules.InventoryModule).MyInventory.Data.Weapons
	end)

	if not ok or not result then
		return nil
	end

	for _, v in pairs(result) do
		for k in pairs(v) do
			table.insert(t4, k)
		end
	end

	if #t4 == 0 then
		return nil
	end

	return t4[math.random(1, #t4)]
end

RunService.Stepped:Connect(function()
	if v38.Emotes.AutoPlaySelectedEmote then
		v53(v38.Emotes.SelectedEmote)
	end

	if v38.ShuffleWeapons then
		local v73 = v66()

		if v73 then
			pcall(function()
				local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
				local Inventory = Remotes and Remotes:FindFirstChild("Inventory")
				local Equip = Inventory and Inventory:FindFirstChild("Equip")

				if Equip then
					Equip:FireServer(v73, "Weapons")
				end
			end)
		end
	end

	local CenteredLabelGui2 = CoreGui:FindFirstChild("CenteredLabelGui")

	if CenteredLabelGui2 and CenteredLabelGui2:FindFirstChild("CenteredTextLabel") then
		CenteredLabelGui2.CenteredTextLabel.Visible = v38.CoinFarm.StatsOverlay
	end

	local Character = LocalPlayer.Character
	local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

	if not Character or not Humanoid or not (Humanoid.Health > 0) or not Character:FindFirstChild("HumanoidRootPart") then
		return
	end

	if v38.Sliders.Speed ~= Humanoid.WalkSpeed then
		Humanoid.WalkSpeed = v38.Sliders.Speed
	end

	if v38.Sliders.Jump ~= Humanoid.JumpPower then
		Humanoid.JumpPower = v38.Sliders.Jump
	end
end)
RunService.Stepped:Connect(function()
	if v38.CoinFarm.Settings.DestroyPlayers then
		v54()
	end
end)
RunService.Heartbeat:Connect(function()
	if v38.CoinFarm.Settings.DestroyMap then
		v57()
	end
end)

local function v80()
	if not LocalPlayer.Character then
		return
	end

	local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return
	end

	local t5 = {}

	for _, v in Workspace:GetChildren() do
		if v:IsA("Model") and v:FindFirstChild("CoinContainer") then
			for _, v2 in v.CoinContainer:GetChildren() do
				if v2.Name == "Coin_Server" and not v2:FindFirstChild("CollectedCoin") and v2:FindFirstChild("TouchInterest") then
					local Magnitude = (HumanoidRootPart.Position - v2.Position).Magnitude

					if Magnitude < 100 then
						table.insert(t5, {
							Coin = v2,
							Distance = Magnitude
						})
					end
				end
			end
		end
	end

	table.sort(t5, function(p7, p8)
		return p7.Distance < p8.Distance
	end)

	return t5[1] and t5[1].Coin
end

local connection
local t6 = {}

local function v90()
	for _, v in ipairs(t6) do
		if v then
			pcall(function()
				v:Disconnect()
			end)
		end
	end

	table.clear(t6)
	connection = nil

	local v93 = v18()

	if v93 then
		v93.Anchored = false

		local MM2_CoinFarmVelocity = v93:FindFirstChild("MM2_CoinFarmVelocity")

		if MM2_CoinFarmVelocity then
			MM2_CoinFarmVelocity:Destroy()
		end
	end
end
local function v95()
	v90()

	local connection2

	local function v97()
		if not v38.CoinFarm.State then
			return
		end

		local MainGUI = LocalPlayer.PlayerGui:FindFirstChild("MainGUI")
		local Game = MainGUI and MainGUI:FindFirstChild("Game")
		local ok, result, result2 = pcall(function()
			return Game.CoinBags.Visible, Game.CoinBags.Container.Candy.Full.Visible
		end)
		local v103 = v18()

		if ok and result and not result2 and v103 then
			if not v103:FindFirstChild("MM2_CoinFarmVelocity") then
				local BodyVelocity = Instance.new("BodyVelocity", v103)

				BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
				BodyVelocity.Name = "MM2_CoinFarmVelocity"
			end

			v62()

			local v105 = v80()

			if v105 then
				v103.Anchored = false
				task.spawn(function()
					local v106 = v18()

					if not v106 then
						return
					end

					local v107 = (v106.Position - v105.Position).Magnitude / v38.CoinFarm.Settings.Speed
					local cFrame = CFrame.new(v105.Position + Vector3.new(0, -1, 0))

					TweenService:Create(v106, TweenInfo.new(v107, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
						CFrame = cFrame
					}):Play()

					if v105 and v105.Parent then
						local connection3

						connection3 = v105.Touched:Connect(function()
							task.wait(0.1)

							if v105 then
								v105:Destroy()
								connection3:Disconnect()
							end
						end)
					end
				end)
			else
				v103.Anchored = true
			end

			task.wait(0.02)
		end
	end

	local connection3 = RunService.Heartbeat:Connect(v97)
	local connection4 = CoinCollected.OnClientEvent:Connect(function(p9, p10, p11)
		if p10 == p11 then
			v90()
		end
	end)
	local v112 = v16()

	if v112 then
		connection2 = v112.Died:Connect(function()
			task.wait(1)

			repeat
				task.wait()
			until LocalPlayer.Character ~= nil

			repeat
				task.wait()
			until LocalPlayer.PlayerGui ~= nil

			task.wait(1)

			repeat
				task.wait()
			until LocalPlayer.PlayerGui:FindFirstChild("MainGUI")

			task.wait(1)

			if Teleport_to_map then
				Teleport_to_map()
			end
		end)
	end

	connection = ReplicatedStorage.Remotes.Gameplay.RoundEndFade.OnClientEvent:Connect(function()
		v90()
	end)
	table.insert(t6, connection3)
	table.insert(t6, connection4)

	if connection2 then
		table.insert(t6, connection2)
	end

	table.insert(t6, connection)
end

local vector3 = Vector3.new(1, -100, 1)
local Part = Instance.new("Part", Workspace)

Part.Anchored = true
Part.Position = vector3
Part.Size = Vector3.new(100, 1.2, 100)

local u115 = false

local function v116()
	local v117 = v18()

	if v117 then
		v117.CFrame = CFrame.new(Part.Position + Vector3.new(math.random(-10, 5), 5, math.random(-10, 5)))
	end
end
local function v118(p12)
	local v119 = v18()

	if p12 and v119 then
		v119.CFrame = CFrame.new(p12.Position + Vector3.new(0, -6, 0))
	end
end
local function v120()
	for _, child in ipairs(Workspace:GetChildren()) do
		if child:FindFirstChild("CoinContainer") then
			return child
		end
	end
end

local u123

local function v124()
	if u123 then
		return
	end

	u123 = true
	u115 = false

	if v38.CoinFarm2.State then
		v116()
	end

	while not u115 do
		local v125 = v120()

		if not v125 then
			task.wait(1)

			if v38.CoinFarm2.State then
				continue
			end
		elseif v38.CoinFarm2.State then
			task.spawn(function()
				pcall(v57)
			end)

			local v126
			local huge = math.huge

			for _, child in ipairs(v125.CoinContainer:GetChildren()) do
				if child:FindFirstChild("TouchInterest") and child.Position.Y < huge then
					huge = child.Position.Y
					v126 = child
				end
			end

			local v130 = v126

			if not v130 then
				task.wait(0.1)

				continue
			end

			local u131 = false

			v118(v130)

			local connection2 = CoinCollected.OnClientEvent:Connect(function(p13, p14, p15)
				u131 = true

				if p14 == p15 then
					u115 = true
				end
			end)

			if u115 then
				connection2:Disconnect()

				break
			end

			while true do
				task.wait()
				task.spawn(function()
					local v133 = v18()

					if v133 then
						pcall(firetouchinterest, v133, v130, 0)
						pcall(firetouchinterest, v133, v130, 1)
					end
				end)
				task.wait()
				v62()
				v118(v130)

				if u131 then
					break
				elseif not v130:FindFirstChild("TouchInterest") then
					break
				end
			end

			connection2:Disconnect()
			v116()
			task.wait(2)

			continue
		end

		break
	end

	u123 = false
end

ReplicatedStorage.Remotes.Gameplay.RoundStart.OnClientEvent:Connect(function()
	task.spawn(v124)
end)
LocalPlayer.CharacterAdded:Connect(function()
	if v38.CoinFarm2.State then
		v116()
	end
end)
task.spawn(v95)

local function v134()
	for _, player in ipairs(Players:GetPlayers()) do
		if not player:FindFirstChild("Backpack") then
			continue
		end

		if player.Backpack:FindFirstChild("Knife") then
			return player
		end
	end

	for _, player in ipairs(Players:GetPlayers()) do
		if not player.Character then
			continue
		end

		if player.Character:FindFirstChild("Knife") then
			return player
		end
	end

	if u46 then
		for k, v in pairs(u46) do
			if v.Role ~= "Murderer" then
				continue
			end

			if Players:FindFirstChild(k) then
				return Players:FindFirstChild(k)
			end
		end
	end
end
local function v141()
	for _, player in ipairs(Players:GetPlayers()) do
		if not player:FindFirstChild("Backpack") then
			continue
		end

		if player.Backpack:FindFirstChild("Gun") then
			return player
		end
	end

	for _, player in ipairs(Players:GetPlayers()) do
		if not player.Character then
			continue
		end

		if player.Character:FindFirstChild("Gun") then
			return player
		end
	end

	if u46 then
		for k, v in pairs(u46) do
			if v.Role == "Sheriff" and Players:FindFirstChild(k) then
				return Players:FindFirstChild(k)
			end
		end
	end
end
local function v148()
	for _, child in ipairs(Workspace:GetChildren()) do
		if child.Name == "PlayerESP" then
			child:Destroy()
		end
	end

	for _, player in ipairs(Players:GetPlayers()) do
		if player.Character then
			if not player.Character:FindFirstChild("PlayerESP") then
				local Highlight = Instance.new("Highlight", Workspace)

				Highlight.Name = "PlayerESP"
				Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				Highlight.Adornee = player.Character
				Highlight.FillColor = Color3.fromRGB(255, 255, 255)
				Highlight.FillTransparency = 0.5
				task.spawn(function()
					if player == v134() then
						Highlight.FillColor = Color3.fromRGB(255, 0, 0)
						Highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
					elseif player == v141() then
						Highlight.FillColor = Color3.fromRGB(0, 150, 255)
						Highlight.OutlineColor = Color3.fromRGB(0, 150, 255)
					else
						Highlight.FillColor = Color3.fromRGB(0, 255, 0)
						Highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
					end

					if Highlight and player then
						Highlight.Adornee = player.Character or player.CharacterAdded:Wait()
					end
				end)
			end
		end
	end
end
local function v154()
	if not u46 then
		lib:Notify({
			Title = "No data",
			Content = "playerData has not loaded yet.",
			Type = "Warning",
			Duration = 3
		})

		return
	end

	local t7 = {}

	for k, v in pairs(u46) do
		table.insert(t7, ("%s - %s"):format(k, tostring(v.Role)))
	end

	lib:Notify({
		Title = "Roles",
		Content = table.concat(t7, "\n"),
		Type = "Info",
		Duration = 6
	})
end

local Highlight = Instance.new("Highlight")

Highlight.Name = "TrapESP"
Highlight.OutlineTransparency = 1
Highlight.FillColor = Color3.fromRGB(255, 0, 0)
Highlight.FillTransparency = 0.4
Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
Workspace.DescendantAdded:Connect(function(descendant)
	if v38.ESP.Traps and descendant.Name == "Trap" then
		if descendant.Parent:IsDescendantOf(Workspace) then
			descendant.Transparency = 0

			local clone = Highlight:Clone()

			clone.Parent = Workspace
			clone.Adornee = descendant
		end
	end

	if v38.ESP.DroppedGun and descendant.Name == "GunDrop" then
		local GunESP = Workspace:FindFirstChild("GunESP")

		if not GunESP then
			GunESP = Instance.new("Highlight", Workspace)
			GunESP.OutlineTransparency = 1
			GunESP.FillColor = Color3.fromRGB(255, 255, 0)
			GunESP.Name = "GunESP"
			GunESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		end

		GunESP.Adornee = descendant
		GunESP.Enabled = true

		if v38.Gameplay.AutoPickUpGun then
			task.wait(0.5)

			for i = 1, 5 do
				if pickupgun then
					pickupgun()
				end
			end
		end
	end
end)
Workspace.DescendantRemoving:Connect(function(descendant)
	if v38.ESP.DroppedGun and descendant.Name == "GunDrop" then
		local GunESP = Workspace:FindFirstChild("GunESP")

		if GunESP then
			GunESP:Destroy()
		end

		task.wait(0.6)

		if v38.ESP.Players then
			for _, child in ipairs(Workspace:GetChildren()) do
				if child:IsA("Highlight") then
					child:Destroy()
				end
			end

			v148()
		end
	end
end)

local Remotes = ReplicatedStorage:FindFirstChild("Remotes") or ReplicatedStorage:WaitForChild("Remotes", 5)
local Gameplay = Remotes and (Remotes:FindFirstChild("Gameplay") or Remotes:WaitForChild("Gameplay", 5))
local PlayerDataChanged = Gameplay and Gameplay:WaitForChild("PlayerDataChanged", 5)

if PlayerDataChanged then
	PlayerDataChanged.OnClientEvent:Connect(function(p16)
		u46 = p16

		if v38.ESP.Players then
			v148()
		end
	end)
else
	warn("[MM2] PlayerDataChanged remote was not found; role ESP may be limited.")
end

local function v168()
	local ok = not LocalPlayer.Character

	if not ok then
		ok = not LocalPlayer.Character:FindFirstChild("Knife")
	end

	if ok then
		if not LocalPlayer.Backpack:FindFirstChild("Knife") or not LocalPlayer.Character then
			return
		end

		local Humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")

		if Humanoid then
			Humanoid:EquipTool(LocalPlayer.Backpack:FindFirstChild("Knife"))
		end
	end

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			if player.Character:FindFirstChild("HumanoidRootPart") then
				local HumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
				local HumanoidRootPart2 = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

				HumanoidRootPart.Anchored = true
				HumanoidRootPart.CFrame = HumanoidRootPart2.CFrame + HumanoidRootPart2.CFrame.LookVector * 1
			end
		end
	end

	pcall(function()
		LocalPlayer.Character.Knife.Stab:FireServer("Slash")
	end)
end
local function v175()
	for _, child in ipairs(Workspace:GetChildren()) do
		if not child:FindFirstChild("CoinContainer") then
			continue
		end

		if child:FindFirstChild("Spawns") then
			return child
		end
	end
end

pickupgun = function()
	local v178 = v175()

	if not v178 then
		return
	end

	local GunDrop = v178:FindFirstChild("GunDrop")

	if not GunDrop then
		return
	end

	if v134() == LocalPlayer then
		return
	end

	if not LocalPlayer.Character then
		return
	end

	local pivot = LocalPlayer.Character:GetPivot()

	LocalPlayer.Character:MoveTo(GunDrop.Position)

	local Gun = LocalPlayer.Backpack:FindFirstChild("Gun")
	local now2 = tick()

	while not Gun and tick() - now2 < 2 do
		Gun = LocalPlayer.Backpack:FindFirstChild("Gun")
		task.wait()
	end

	LocalPlayer.Character:PivotTo(pivot)
end
Teleport_to_lobby = function()
	if Workspace:FindFirstChild("Lobby") then
		if LocalPlayer.Character then
			LocalPlayer.Character:MoveTo(Workspace.Lobby.WorldPivot.Position)
		end
	end
end
Teleport_to_map = function()
	if not v175() then
		return
	end

	local Spawns = v175():FindFirstChild("Spawns")

	if not Spawns then
		return
	end

	local children = Spawns:GetChildren()

	if #children > 0 and LocalPlayer.Character then
		LocalPlayer.Character:MoveTo(children[math.random(1, #children)].Position)
	end
end

local function v185()
	local GetSyncData = ReplicatedStorage:FindFirstChild("GetSyncData")

	if not GetSyncData then
		return
	end

	StarterGui:SetCore("SendNotification", {
		Title = "Server IS COOKED",
		Text = "look how ppl freezing mid air lmao",
		Duration = 5
	})

	local n4 = 0

	while true do
		for i = 1, 1 do
			task.spawn(GetSyncData.InvokeServer, GetSyncData)
		end

		n4 += 1

		if n4 ~= 3 then
			continue
		end

		n4 = 0
		task.wait()
	end
end
local function v189(p17)
	local u190 = false

	local function v191(p18)
		local v192 = p18:lower()

		if v192 == "all" or v192 == "others" then
			u190 = true

			return
		end

		if v192 == "random" then
			local players = Players:GetPlayers()
			local v194 = table.find(players, LocalPlayer)

			if v194 then
				table.remove(players, v194)
			end

			if #players == 0 then
				return
			end

			return players[math.random(#players)]
		end

		local players, v196 = Players:GetPlayers()

		for _, v in next, players, v196 do
			if v ~= LocalPlayer then
				if v.Name:lower():match("^" .. v192) then
					return v
				end

				if v.DisplayName:lower():match("^" .. v192) then
					return v
				end
			end
		end
	end
	local function v199(p19)
		local Character = LocalPlayer.Character
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
		local RootPart = Humanoid and Humanoid.RootPart

		if not Character or not Humanoid or not RootPart then
			return
		end

		local Character2 = p19.Character

		if not Character2 then
			return
		end

		local Humanoid2 = Character2:FindFirstChildOfClass("Humanoid")
		local RootPart2 = Humanoid2 and Humanoid2.RootPart
		local Head = Character2:FindFirstChild("Head")

		if RootPart.Velocity.Magnitude < 50 then
			genv.OldPos = RootPart.CFrame
		end

		if Humanoid2 and Humanoid2.Sit and not u190 then
			return
		end

		if Head then
			Workspace.CurrentCamera.CameraSubject = Head
		elseif Humanoid2 and RootPart2 then
			Workspace.CurrentCamera.CameraSubject = Humanoid2
		end

		if not Character2:FindFirstChildWhichIsA("BasePart") then
			return
		end

		local function v207(p20, p21, p22)
			RootPart.CFrame = CFrame.new(p20.Position) * p21 * p22
			pcall(function()
				Character:SetPrimaryPartCFrame(CFrame.new(p20.Position) * p21 * p22)
			end)
			RootPart.Velocity = Vector3.new(90000000, 900000000, 90000000)
			RootPart.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
		end
		local function v208(p23)
			local now2 = tick()
			local n5 = 0

			while RootPart and Humanoid2 do
				if p23.Velocity.Magnitude < 50 then
					n5 += 100
					v207(p23, CFrame.new(0, 1.5, 0) + Humanoid2.MoveDirection * p23.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n5), 0, 0))
					task.wait()
					v207(p23, CFrame.new(0, -1.5, 0) + Humanoid2.MoveDirection * p23.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n5), 0, 0))
					task.wait()
					v207(p23, CFrame.new(2.25, 1.5, -2.25) + Humanoid2.MoveDirection * p23.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n5), 0, 0))
					task.wait()
					v207(p23, CFrame.new(-2.25, -1.5, 2.25) + Humanoid2.MoveDirection * p23.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n5), 0, 0))
					task.wait()
					v207(p23, CFrame.new(0, 1.5, 0) + Humanoid2.MoveDirection, CFrame.Angles(math.rad(n5), 0, 0))
					task.wait()
					v207(p23, CFrame.new(0, -1.5, 0) + Humanoid2.MoveDirection, CFrame.Angles(math.rad(n5), 0, 0))
					task.wait()
				else
					v207(p23, CFrame.new(0, 1.5, Humanoid2.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
					task.wait()
					v207(p23, CFrame.new(0, -1.5, -Humanoid2.WalkSpeed), CFrame.Angles(0, 0, 0))
					task.wait()
					v207(p23, CFrame.new(0, 1.5, Humanoid2.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
					task.wait()

					if RootPart2 then
						v207(p23, CFrame.new(0, 1.5, RootPart2.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						v207(p23, CFrame.new(0, -1.5, -RootPart2.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
						task.wait()
						v207(p23, CFrame.new(0, 1.5, RootPart2.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
					end

					v207(p23, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
					task.wait()
					v207(p23, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
					task.wait()
					v207(p23, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
					task.wait()
					v207(p23, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
					task.wait()
				end

				if p23.Velocity.Magnitude > 500 or p23.Parent ~= p19.Character or p19.Parent ~= Players or Humanoid2.Sit or Humanoid.Health <= 0 or now2 + 2 < tick() then
					break
				end
			end
		end

		Workspace.FallenPartsDestroyHeight = (0/0)

		local BodyVelocity = Instance.new("BodyVelocity")

		BodyVelocity.Name = "EpixVel"
		BodyVelocity.Parent = RootPart
		BodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
		BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

		if RootPart2 then
			v208(RootPart2)
		end

		if BodyVelocity and BodyVelocity.Parent then
			BodyVelocity:Destroy()
		end

		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)

		if genv.OldPos and Humanoid.Health > 0 then
			RootPart.CFrame = genv.OldPos
		end
	end

	for _, v in ipairs(p17) do
		local v214 = v191(v)

		if v214 then
			v199(v214)
		end
	end

	if u190 then
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= LocalPlayer then
				v199(player)
			end
		end
	end
end

task.spawn(function()
	while true do
		task.wait(2)

		if v38.AnnoyingStuff.Fling.LoopFlingAllPlayers then
			for _, player in ipairs(Players:GetPlayers()) do
				if player == LocalPlayer then
					continue
				end

				pcall(function()
					v189({ player.Name })
				end)
				task.wait(0.1)
			end
		end
	end
end)
RunService.RenderStepped:Connect(function()
	if not (v141() == LocalPlayer and v38.Gameplay.AutoShooting) then
		return
	end

	local v219 = v134()

	if not v219 or not v219.Character then
		return
	end

	local HumanoidRootPart = v219.Character:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart then
		return
	end

	if not LocalPlayer.Character then
		return
	end

	local HumanoidRootPart2 = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart2 then
		return
	end

	local v222 = HumanoidRootPart.Position - HumanoidRootPart2.Position
	local raycastParams = RaycastParams.new()

	raycastParams.FilterType = Enum.RaycastFilterType.Exclude
	raycastParams.FilterDescendantsInstances = { LocalPlayer.Character }

	local hit = Workspace:Raycast(HumanoidRootPart2.Position, v222, raycastParams)

	if not hit or hit.Instance.Parent == v219.Character then
		local Gun = LocalPlayer.Character:FindFirstChild("Gun")

		Gun = Gun or LocalPlayer.Backpack:FindFirstChild("Gun")

		if Gun then
			local v226 = v16()

			if v226 and Gun.Parent == LocalPlayer.Backpack then
				v226:EquipTool(Gun)
			end

			local v227 = v134()

			if not v227 or not v227.Character then
				return
			end

			local UpperTorso = v227.Character:FindFirstChild("UpperTorso")
			local Humanoid = v227.Character:FindFirstChild("Humanoid")

			if not UpperTorso or not Humanoid then
				return
			end

			local MoveDirection = Humanoid.MoveDirection
			local v231 = (UpperTorso.Position + UpperTorso.AssemblyLinearVelocity * Vector3.new(0, 0.5, 0) * 0.14 + MoveDirection * 2.8) * (LocalPlayer:GetNetworkPing() * 1000 * 0 + 1)

			pcall(function()
				local Gun2 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Gun")

				if Gun2 then
					Gun2.KnifeLocal.CreateBeam.RemoteFunction:InvokeServer(1, v231, "AH2")
				end
			end)
		end
	end
end)
RoundStart.OnClientEvent:Connect(function()
	if v38.AutoRevealRoles then
		v154()
	end

	if v38.AutoFarm.KillEveryoneAsAMurderer then
		task.wait(1)

		repeat
			v168()
			task.wait(1)
		until v134() ~= LocalPlayer
	end

	if v38.AutoFarm.AutoFlingMurderer then
		local v233 = v134()

		if v233 and v233 ~= LocalPlayer then
			v189({ v233.Name })
		end
	end

	if v38.AutoFarm.AutoFlingSheriff then
		local v234 = v141()

		if v234 and v234 ~= LocalPlayer then
			v189({ v234.Name })
		end
	end

	if v38.AutoFarm.TeleportSpawn then
		Teleport_to_lobby()
	end

	task.spawn(v95)
end)

local function v235()
	pcall(function()
		ReplicatedStorage.Remotes.Extras.GetPlayerData:InvokeServer("GetData")
	end)

	local EmoteModule = ReplicatedStorage.Modules:FindFirstChild("EmoteModule")
	local Emotes = LocalPlayer.PlayerGui.MainGUI.Game:FindFirstChild("Emotes")

	if not EmoteModule or not Emotes then
		return
	end

	local t8 = {
		"headless",
		"zombie",
		"zen",
		"ninja",
		"floss",
		"dab",
		"sit"
	}

	pcall(function()
		require(EmoteModule).GeneratePage(t8, Emotes, "Free Emotes")
	end)
	genv.FreeEmotesOperator = true

	while genv.FreeEmotesOperator do
		if not Emotes.EmotePages:FindFirstChild("Free Emotes") then
			genv.FreeEmotesOperator = false
			v235()
		end

		RunService.RenderStepped:Wait()
	end
end
local function v239()
	local t9 = {}

	pcall(function()
		local response = game:HttpGet(("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100"):format(game.PlaceId))
		local data = HttpService:JSONDecode(response)
		local data2 = data.data or {}

		for _, v in ipairs(data2) do
			if v.id ~= game.JobId and v.playing < v.maxPlayers then
				table.insert(t9, v.id)
			end
		end
	end)

	if #t9 ~= 0 then
		TeleportService:TeleportToPlaceInstance(game.PlaceId, t9[math.random(1, #t9)])

		return
	end

	lib:Notify({
		Title = "ServerHop",
		Content = "No available servers found.",
		Type = "Warning",
		Duration = 3
	})
end

Players.PlayerRemoving:Connect(function()
	task.defer(function()
		if v38.AutoFarm.AutoTeleportToRandomServerIfServerIsEmpty and v38.AutoFarm.PlayersToAutoServerHop > #Players:GetPlayers() then
			v239()
		end
	end)
end)
task.spawn(function()
	while true do
		task.wait(30)

		if v38.AutoFarm.AutoPrestige then
			pcall(function()
				ReplicatedStorage.Remotes.Inventory.Prestige:FireServer()
			end)
		end
	end
end)

local u246 = false

CoinCollected.OnClientEvent:Connect(function(p24, p25, p26)
	if p25 ~= p26 or u246 then
		return
	end

	u246 = true
	task.spawn(function()
		if v38.AutoFarm.KillEveryoneAsAMurdererAtFullBag and v134() == LocalPlayer then
			for i = 1, 10 do
				if v134() ~= LocalPlayer then
					break
				end

				v168()
				task.wait(1)
			end
		elseif v38.AutoFarm.AutoFlingMurdererAtFullBag and v134() ~= LocalPlayer then
			for i = 1, 5 do
				local v249 = v134()

				if not v249 or v249 == LocalPlayer then
					break
				end

				v189({ v249.Name })
				task.wait(1)
			end
		elseif v38.AutoFarm.TeleportUnderMap then
			task.wait(0.1)
			v47()
		elseif v38.CoinFarm.Settings.DieAtFullBag then
			local v250 = v16()

			if v250 then
				v250:ChangeState(Enum.HumanoidStateType.Dead)
			end
		end

		task.wait(2)
		u246 = false
	end)
end)

local u251
local u252
local u253
local s1 = "Supreme"
local u255 = false
local n6 = 6
local u257 = false

local function v258()
	pcall(function()
		if not isfolder("ValueData") then
			makefolder("ValueData")
		end
	end)

	if isfile and isfile("ValueData/mm2_values.json") then
		local ok, result = pcall(readfile, "ValueData/mm2_values.json")

		if ok and result ~= "" then
			local ok2, result2 = pcall(HttpService.JSONDecode, HttpService, result)

			if ok2 and result2 then
				if tick() - (result2._time or 0) < 3600 then
					return result2.data
				end
			end
		end
	end

	local ok, result = pcall(game.HttpGet, game, "https://api.project-reverse.org/valuables/get-game-valuables?game=mm2")

	if ok then
		local data = HttpService:JSONDecode(result)

		pcall(function()
			writefile("ValueData/mm2_values.json", HttpService:JSONEncode({
				data = data.data,
				_time = tick()
			}))
		end)

		return data.data
	end

	local ok2, result2 = pcall(function()
		return HttpService:JSONDecode(readfile("ValueData/mm2_values.json"))
	end)

	return ok2 and result2 and result2.data or {}
end
local function v268()
	local t10 = {}
	local v270 = v258() or {}

	for _, v in pairs(v270) do
		t10[v.name] = v.price
	end

	return t10
end
local function v273()
	local n7 = 0

	local function v275(p27, p28, p29)
		n7 += 1
		task.spawn(function()
			if not genv[p27] then
				local ok, result = pcall(game.HttpGet, game, p28)

				if not ok then
					result = ""
				end

				if p29 then
					result = result:split(p29)[1]
				end

				genv[p27] = result
			end

			n7 -= 1
		end)
	end

	n7 += 1
	task.spawn(function()
		if not genv.htmlparser then
			local ok, htmlparser = pcall(function()
				return loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/RBXL-HTML-Parser/refs/heads/master/html/init.lua"))()
			end)

			if ok then
				genv.htmlparser = htmlparser
			end
		end

		n7 -= 1
	end)
	v275("SupremeAncients", "https://supremevaluelist.com/mm2/ancients.html")
	v275("SupremeChromas", "https://supremevaluelist.com/mm2/chromas.html", "<div class=\"tierheading\" id=\"pets\">Pets</div>")
	v275("SupremeGodlies", "https://supremevaluelist.com/mm2/godlies.html")
	v275("SupremeUniques", "https://supremevaluelist.com/mm2/uniques.html", "<div class=\"tierheading\" id=\"special\">Special Tier</div>")
	v275("SupremeVintages", "https://supremevaluelist.com/mm2/vintages.html")
	v275("SupremeLegendarys", "https://supremevaluelist.com/mm2/legendaries.html", "<div class=\"tierheading\" id=\"tier2\">Tier 2</div>")

	local now2 = tick()

	while n7 > 0 do
		task.wait()

		if tick() - now2 > 30 then
			break
		end
	end

	if not genv.htmlparser then
		return {}
	end

	local v281 = (genv.SupremeAncients or "") .. (genv.SupremeChromas or "") .. (genv.SupremeGodlies or "") .. (genv.SupremeUniques or "") .. (genv.SupremeLegendarys or "") .. (genv.SupremeVintages or "")
	local ok, result = pcall(function()
		return genv.htmlparser.parse(v281)
	end)

	if not ok or not result then
		return {}
	end

	local t11 = {}
	local itemhead = result:select(".itemhead")
	local itembody = result:select(".itembody")

	for i = 1, math.min(#itemhead, #itembody) do
		local name = itemhead[i]:content():gsub("%s<img.+$", "")

		if string.find(name, "https://www.youtube.com/jdrbx") then
			name = "JD"
		end

		local t12 = {
			name = name
		}
		local itemvalue = itembody[i]:select(".itemvalue")

		if #itemvalue > 0 then
			t12.value = itemvalue[1]:content():gsub(",", "")
		end

		if not string.find(t12.name, "Nik's Scythe") then
			table.insert(t11, t12)
		end
	end

	local t13 = {}

	for _, v in pairs(t11) do
		t13[v.name] = {
			value = tonumber(v.value)
		}
	end

	local Item = require(ReplicatedStorage.Database.Sync.Item)
	local t14 = {}
	local t15 = {}

	for k, v in pairs(Item) do
		if v.Rarity == "Unique" or v.Rarity == "Godly" or v.Rarity == "Ancient" or v.Rarity == "Classic" or v.Rarity == "Legendary" then
			table.insert(t14, {
				name = k,
				rarity = v.Rarity,
				chroma = v.Chroma or false
			})
		end
	end

	for _, v in pairs(t14) do
		if not v.name then
			v.name = "???"
		end

		t15[v.name] = {
			rarity = v.rarity,
			chroma = v.chroma
		}
	end

	local t16 = {
		["Red Luger"] = "RedLuger",
		["Hallow's Blade"] = "HallowsBlade",
		["Flowerwood Gun"] = "FlowerwoodGun",
		["Battleaxe II"] = "BattleAxe2",
		["Rainbow Gun"] = "Rainbow_G",
		Waves = "Waves_K",
		["Orange Seer"] = "OrangeSeer",
		Icecracker = "Icecracker_K_2020",
		Soul = "WraithGun",
		["Arctic (Gun)"] = "Arctic_G_2022",
		["C. Elderwood Blade"] = "ElderwoodKnifeChroma",
		["Chroma Heat"] = "HeatChroma",
		["Santa's Spirit"] = "SantasSpirit",
		Spirit = "WraithKnife",
		["Vampire's Edge"] = "VampiresEdge",
		["Vampire's Axe"] = "VampireAxe",
		Evergun = "TreeGun2023",
		["Eternal III"] = "Eternal3",
		["Cotton Candy"] = "CottonCandy",
		["Chroma Gingerblade"] = "GingerbladeChroma",
		["Elderwood Revolver"] = "ElderwoodGun",
		["Chroma Tides"] = "TidesChroma",
		["Spectral (Knife)"] = "Spectral_K_2021",
		["Latte (Gun)"] = "Latte_G_2023",
		["Ginger (Gun)"] = "Ginger_G_2018",
		["Elderwood Blade"] = "ElderwoodKnife",
		["Chroma Seer"] = "SeerChroma",
		["Red Seer"] = "RedSeer",
		Ocean = "Ocean_G",
		["Chroma Evergreen"] = "TreeKnife2023Chroma",
		["Chroma Evergun"] = "TreeGun2023Chroma",
		["Chroma Bauble"] = "BaubleChroma",
		["Green Luger"] = "GreenLuger",
		Gingermint = "Gingermint_G",
		Phantom = "Phantom2022",
		["Chroma Boneblade"] = "BonebladeChroma",
		["Blue Seer"] = "BlueSeer",
		["Winter's Edge"] = "WintersEdge",
		["Chroma Lightbringer"] = "ChromaLightbringer",
		["Cavern (Gun)"] = "Cavern_G_2019",
		["Tree (Knife)"] = "Tree",
		["Tree (Gun)"] = "TreeGun",
		Rupture = "Bleed",
		Evergreen = "TreeKnife2023",
		["Ghost (Gun)"] = "GhostG2018",
		["Red Fire"] = "RedFire",
		["Blue Scratch"] = "ScratchBlue",
		Broken = "Broken_K_2023",
		["Chroma Deathshard"] = "DeathshardChroma",
		["Red Scratch"] = "Scratch",
		["Blue Elite"] = "EliteBlue",
		["Vampire (Knife)"] = "Vampire_K_2022",
		["Traveler (Gun)"] = "Traveler_G_2023",
		["Eternal II"] = "Eternal2",
		["C. Vampire's Gun"] = "VampireGunChroma",
		["Vampire (Gun)"] = "VampireGun",
		["Ice Dragon"] = "IceDragon",
		Icedriller = "Icedriller_G_2020",
		["Green Elite"] = "EliteGreen",
		["Swirly Gun"] = "SwirlyGun",
		["Cavern (Knife)"] = "Cavern_K_2019",
		Turkey = "Turkey2023",
		["C. Traveler's Gun"] = "TravelerGunChroma",
		["Santa's Magic"] = "SantasMagic",
		Sakura = "Sakura_K",
		["Chroma Saw"] = "SawChroma",
		["Traveler's Gun"] = "TravelerGun",
		["Latte (Knife)"] = "Latte_K_2023",
		Australis = "AuroraKnife",
		["Chroma Swirly Gun"] = "SwirlyGunChroma",
		["Chroma Gemstone"] = "GemstoneChroma",
		Corrupt = "Sorry",
		["Old Glory"] = "AmericaSword",
		["Chroma Fang"] = "FangChroma",
		Pearl = "Pearl_K",
		["Ginger Luger"] = "GingerLuger",
		["Eternal IV"] = "Eternal4",
		["Ghost (Knife)"] = "GhostK2018",
		["Chroma Darkbringer"] = "ChromaDarkbringer",
		["Traveler's Axe"] = "TravelerAxe",
		["Chroma Luger"] = "LugerChroma",
		["Ice Shard"] = "IceShard",
		Battleaxe = "BattleAxe",
		Borealis = "AuroraGun",
		Flowerwood = "FlowerwoodKnife",
		Cookiecane = "Gingermint_K",
		["Hallow's Edge"] = "Hallow",
		["Aurora (Gun)"] = "Aurora_G_2021",
		["Frostfade (Knife)"] = "Frostfade_K_2023",
		Batwing = "Scythe",
		Blossom = "Blossom_G",
		["Chroma Shark"] = "SharkChroma",
		["Chroma Candleflame"] = "CandleflameChroma",
		["Yellow Seer"] = "YellowSeer",
		Bat = "ZombieBat",
		["C. Constellation"] = "ConstellationChroma",
		["Purple Seer"] = "PurpleSeer",
		["Chroma Slasher"] = "SlasherChroma",
		Beach = "Beach_K_2023",
		["Elderwood Scythe"] = "ElderwoodScythe",
		Eternalcane = "EternalCane",
		["Chroma Laser"] = "LaserChroma",
		Pearlshine = "Pearl_G",
		["Chroma Cookiecane"] = "Gingermint_KChroma",
		["Swirly Blade"] = "SwirlyBlade",
		Spectre = "Spectre2022",
		["Vampire's Gun"] = "VampireGun",
		Rainbow = "Rainbow_K",
		["Chroma Watergun"] = "WatergunChroma",
		["Swirly Axe"] = "SwirlyAxe",
		Splitter = "Knife1",
		Ghost = "GhostKnife",
		Blood = "BloodKnife",
		Shadow = "ShadowKnife"
	}
	local t17 = {}

	for k, v in pairs(t13) do
		if t15[k] then
			t17[k] = v
		elseif t15[t16[k] or ""] then
			t17[t16[k]] = v
		end
	end

	local t18 = {}

	for k, v in pairs(t17) do
		t18[k] = v.value
	end

	return t18
end

task.spawn(function()
	u252 = v273() or {}
	u253 = v268()
	u251 = u252
end)

local function v308()
	u251 = s1 == "USD" and (u253 or {}) or u252 or {}
end

local MainGUI = LocalPlayer.PlayerGui:WaitForChild("MainGUI", 9e9)
local v310 = false

if MainGUI:FindFirstChild("Lobby") then
	if MainGUI.Lobby:FindFirstChild("LeaderBar") then
		v310 = true
	end
end

local function createTextLabel(p30)
	local TextLabel = Instance.new("TextLabel")

	TextLabel.Position = UDim2.new(0, 0, 0, 0)
	TextLabel.Size = UDim2.new(1, 0, 0.3, 0)
	TextLabel.TextScaled = true
	TextLabel.TextWrapped = true
	TextLabel.TextSize = 14
	TextLabel.TextStrokeTransparency = 0.7
	TextLabel.ZIndex = 10
	TextLabel.BackgroundTransparency = 1
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.Name = "Value"
	TextLabel.Parent = p30

	return TextLabel
end
local function v313(p31)
	pcall(function()
		local Trade = ReplicatedStorage:FindFirstChild("Trade")
		local OfferItem = Trade and Trade:FindFirstChild("OfferItem")

		if OfferItem then
			OfferItem:FireServer(p31, "Weapons")
		end
	end)
end
local function v316(p32)
	pcall(function()
		local Trade = ReplicatedStorage:FindFirstChild("Trade")
		local RemoveOffer = Trade and Trade:FindFirstChild("RemoveOffer")

		if RemoveOffer then
			RemoveOffer:FireServer(p32, "Weapons")
		end
	end)
end
local function v319(p33)
	for _, v in pairs(p33) do
		local n8 = 1
		local v323 = v[2] or 1

		for i = n8, v323 do
			v316(v[1])
		end
	end
end
local function v325(p34)
	v308()

	local t19 = {}
	local ok, result = pcall(function()
		return ReplicatedStorage.Remotes.Extras.GetFullInventory:InvokeServer(p34).Weapons.Owned
	end)

	if not ok or not result then
		return t19
	end

	for k, v in pairs(result) do
		if u251[k] and u251[k] > 0 then
			t19[k] = {
				value = u251[k],
				quantity = v
			}
		end
	end

	return t19
end
local function v331(p35, p36, p37)
	if not p35 or p35 <= 0 then
		return {}, 0
	end

	local v332 = p35 * (1 - p37 / 100)
	local t20 = {}

	for k, v in pairs(p36) do
		for i = 1, v.quantity do
			table.insert(t20, {
				name = k,
				value = v.value
			})
		end
	end

	table.sort(t20, function(p38, p39)
		return p38.value > p39.value
	end)

	return (function(p40, p41, p42)
		local t21 = {}

		for i = 0, #p40 do
			t21[i] = {}

			for i2 = 0, p41 do
				t21[i][i2] = 0
			end
		end

		for i = 1, #p40 do
			for i2 = 0, p41 do
				t21[i][i2] = t21[i - 1][i2]

				if i2 > 0 and t21[i - 1][i2 - 1] + p40[i].value <= p42 then
					t21[i][i2] = math.max(t21[i][i2], t21[i - 1][i2 - 1] + p40[i].value)
				end
			end
		end

		local t22 = {}
		local v343 = p41

		for i = #p40, 1, -1 do
			if t21[i][v343] ~= t21[i - 1][v343] then
				table.insert(t22, p40[i].name)
				v343 -= 1
			end
		end

		return t22, t21[#p40][p41]
	end)(t20, 4, v332)
end

local u345
local Title
local Title2
local Offer
local u349
local n9
local n10
local Player2
local u353
local connection2
local u355

local function v356()
	local v357 = v310 and "TradeGUI_Phone" or "TradeGUI"
	local v358 = LocalPlayer.PlayerGui:FindFirstChild(v357) or LocalPlayer.PlayerGui:WaitForChild(v357, 5)
	local Container = v358 and v358:FindFirstChild("Container")

	return Container and Container:FindFirstChild("Trade")
end
local function v360(p43, p44)
	v308()

	if not p44 or not p43 then
		return
	end

	n9 = 0
	n10 = 0

	for k, v in pairs(p43) do
		local v363 = v[1]
		local v364 = v[2]
		local Container = u345.TheirOffer.Container["NewItem" .. k].Container

		if Container:FindFirstChild("Value") then
			Container.Value:Destroy()
		end

		createTextLabel(Container).Text = "Value: " .. (u251[v363] or 0) * v364

		if u251[v363] then
			n9 += (u251[v363] or 0) * v364
		end
	end

	for k, v in pairs(p44) do
		local v368 = v[1]
		local v369 = v[2]
		local Container = u345.YourOffer.Container["NewItem" .. k].Container

		if Container:FindFirstChild("Value") then
			Container.Value:Destroy()
		end

		createTextLabel(Container).Text = "Value: " .. (u251[v368] or 0) * v369

		if Container:FindFirstChild("Amount") then
			Container.Amount.Position = UDim2.new(0.23, -4, 0.76, 0)
		end

		if u251[v368] then
			n10 += (u251[v368] or 0) * v369
		end
	end

	Title.Text = "YOUR OFFER | TOTAL:" .. n10
	Title2.Text = "THEIR OFFER | TOTAL:" .. n9
end
local function v371()
	n9 = 0
	n10 = 0
	pcall(function()
		u345 = v356()
	end)

	if not u345 then
		return
	end

	for _, v in ipairs({
		u345.TheirOffer.Container,
		u345.YourOffer.Container
	}) do
		for _, child in pairs(v:GetChildren()) do
			if child.ClassName == "Frame" and child:FindFirstChild("Container") then
				if child.Container:FindFirstChild("Value") then
					child.Container.Value:Destroy()
				end
			end
		end
	end

	if Title then
		Title.Text = "YOUR OFFER"
	end

	if Title2 then
		Title2.Text = "THEIR OFFER"
	end
end

ReplicatedStorage.Trade.UpdateTrade.OnClientEvent:Connect(function(p45)
	if p45.Player2.Player == LocalPlayer then
		local Player1 = p45.Player1

		Player2 = p45.Player2
		u353 = Player1
	end

	if p45.Player1.Player == LocalPlayer then
		local Player22 = p45.Player2

		Player2 = p45.Player1
		u353 = Player22
	end

	if not Player2 or not u353 then
		return
	end

	local Offer2 = Player2.Offer

	Offer = u353.Offer
	u349 = Offer2
	pcall(function()
		u345 = v356()
	end)

	if not u345 then
		return
	end

	Title = u345.YourOffer.Title
	Title2 = u345.TheirOffer.Title
	n9 = 0
	n10 = 0

	if u255 then
		pcall(v360, Offer, u349)
	end
end)

local function v379()
	u355 = v325(LocalPlayer.Name)

	if connection2 then
		return connection2
	end

	connection2 = ReplicatedStorage.Trade.UpdateTrade.OnClientEvent:Connect(function(p46)
		if p46.Player2.Player == LocalPlayer then
			local Player1 = p46.Player1

			Player2 = p46.Player2
			u353 = Player1
		end

		if p46.Player1.Player == LocalPlayer then
			local Player22 = p46.Player2

			Player2 = p46.Player1
			u353 = Player22
		end

		if not Player2 or not u353 then
			return
		end

		local Offer2 = Player2.Offer

		Offer = u353.Offer
		u349 = Offer2
		pcall(function()
			u345 = v356()
		end)

		if not u345 then
			return
		end

		local Title3 = u345.TheirOffer.Title

		Title = u345.YourOffer.Title
		Title2 = Title3
		n9 = 0
		n10 = 0

		for _, v in pairs(Offer) do
			if u251[v[1]] then
				n9 += (u251[v[1]] or 0) * v[2]
			end
		end

		for _, v in pairs(u349) do
			if u251[v[1]] then
				n10 += (u251[v[1]] or 0) * v[2]
			end
		end

		if u257 then
			if #Offer == 0 then
				v319(u349)

				return
			end

			local v388, v389 = v331(n9, u355, n6)

			if v389 ~= n10 then
				connection2:Disconnect()
				connection2 = nil
				v319(u349)

				for _, v in pairs(v388) do
					v313(v)
				end

				connection2 = v379()
			end
		end
	end)

	return connection2
end

ReplicatedStorage.Trade.StartTrade.OnClientEvent:Connect(function()
	pcall(function()
		u345 = v356()
	end)

	if not u345 then
		return
	end

	local Title3 = u345.TheirOffer.Title

	Title = u345.YourOffer.Title
	Title2 = Title3

	if u255 then
		Title.Text = "YOUR OFFER | TOTAL: 0"
		Title2.Text = "THEIR OFFER | TOTAL: 0"
	end

	connection2 = v379()
end)
ReplicatedStorage.Trade.EndTrade.OnClientEvent:Connect(function()
	if connection2 then
		connection2:Disconnect()
		connection2 = nil
	end
end)
ReplicatedStorage.Trade.AcceptTrade.OnClientEvent:Connect(function()
	if connection2 then
		connection2:Disconnect()
		connection2 = nil
	end

	if u257 and n9 then
		local v393, v394 = v331(n9, u355 or {}, n6)

		if v394 ~= n10 and u349 then
			for _, v in pairs(u349) do
				for i = 1, v[2] do
					v316(v[1])
				end
			end

			for _, v in pairs(v393) do
				v313(v)
			end

			connection2 = v379()
		end
	end
end)

local function v400()
	local v401, v402 = v331(n9 or 0, u355 or {}, n6)

	if v402 ~= n10 and u349 then
		for _, v in pairs(u349) do
			for i = 1, v[2] do
				v316(v[1])
			end
		end

		for _, v in pairs(v401) do
			v313(v)
		end
	end
end
local function v408()
	if not u349 then
		return
	end

	for _, v in pairs(u349) do
		for i = 1, v[2] do
			v316(v[1])
		end
	end
end
local function v412(p47)
	local response = ReplicatedStorage.Remotes.Extras.GetFullInventory:InvokeServer(p47)
	local t23 = {}
	local Owned = (response.Weapons or {}).Owned or {}

	for k, v in pairs(Owned) do
		t23[k] = (t23[k] or 0) + v
	end

	local Owned2 = (response.Pets or {}).Owned or {}

	for k, v in pairs(Owned2) do
		t23[k] = (t23[k] or 0) + v
	end

	return t23
end
local function v421(p48)
	local v422 = v412(p48)
	local v423 = v268()
	local t24 = {}
	local n11 = 0
	local n12 = 0

	for k, v in pairs(v422) do
		local v429 = v423[k] or 0

		if v429 > 0 then
			local v430 = v429 * v

			table.insert(t24, {
				name = k,
				count = v,
				price = v429,
				total = v430
			})
			n11 += v430
			n12 += v
		end
	end

	table.sort(t24, function(p49, p50)
		return p49.total > p50.total
	end)

	local t25 = {
		"Inventory Analysis:",
		string.rep("-", 40)
	}

	for _, v in ipairs(t24) do
		table.insert(t25, string.format("%-20s x%-4d | $%8.2f | $%10.2f", v.name, v.count, v.price, v.total))
	end

	table.insert(t25, string.rep("-", 40))
	table.insert(t25, string.format("Total Items: %d", n12))
	table.insert(t25, string.format("Total Value: $%d", math.floor(n11)))

	return table.concat(t25, "\n")
end

local v434 = ReplicatedStorage
local ChangeInventoryItem = v434.Remotes.Inventory.ChangeInventoryItem
local ItemGift = v434:FindFirstChild("ItemGift")

local function v437(p51, p52)
	local ok, result = pcall(require, p51)

	if ok then
		if result ~= nil then
			return result
		end
	end

	return p52
end

local v440 = v437(v434.Modules:FindFirstChild("BoxModule"), {})
local v441 = v437(v434.Database.Sync:FindFirstChild("Item"), {})
local v442 = v437(v434.Modules:FindFirstChild("ProfileData"), {
	Weapons = {
		Owned = {}
	}
})

_G.Cache = _G.Cache or {}
_G.SmallCache = _G.SmallCache or {}

local ItemModule

pcall(function()
	ItemModule = require(v434.Modules.ItemModule)
end)

local t26 = {}
local Owned = (v442.Weapons or {}).Owned or {}

for k, v in pairs(Owned) do
	t26[k] = v
end

local function v448(p53)
	return t26[p53] or 0
end
local function v449(p54, p55)
	if not p54 or p54 == "" then
		return
	end

	local v450 = v448(p54) + p55

	t26[p54] = v450
	pcall(function()
		firesignal(ChangeInventoryItem.OnClientEvent, "Weapons", p54, v450)
	end)

	if ItemGift then
		pcall(function()
			firesignal(ItemGift.OnClientEvent, p54, "Weapons", p55)
		end)
	end
end

local t27 = {
	Common = Color3.fromRGB(134, 142, 150),
	Uncommon = Color3.fromRGB(64, 192, 87),
	Rare = Color3.fromRGB(51, 154, 240),
	Legendary = Color3.fromRGB(250, 176, 5),
	Godly = Color3.fromRGB(190, 75, 219),
	Ancient = Color3.fromRGB(255, 107, 107),
	Unique = Color3.fromRGB(255, 212, 59),
	Classic = Color3.fromRGB(255, 146, 43),
	Vintage = Color3.fromRGB(173, 181, 189),
	Christmas = Color3.fromRGB(32, 201, 151),
	Halloween = Color3.fromRGB(252, 126, 20)
}
local t28 = {
	Unique = 1,
	Ancient = 2,
	Godly = 3,
	Classic = 4,
	Vintage = 5,
	Legendary = 6,
	Rare = 7,
	Uncommon = 8,
	Common = 9
}

local function v453(p56, p57)
	if (p56 == nil or p56 == "") and p57 then
		p56 = tostring(p57)
	end

	if p56 ~= nil then
		if p56 ~= "" then
			if type(p56) == "string" and (string.find(p56, "rbxassetid://", 1, true) == 1 or string.find(p56, "rbxthumb://", 1, true) == 1) then
				return p56
			end

			if ItemModule and type(ItemModule.GetImage) == "function" then
				local ok, result = pcall(function()
					return ItemModule.GetImage(p56)
				end)

				if ok and type(result) == "string" and result ~= "" then
					return result
				end
			end

			if tonumber(p56) then
				return "http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId=" .. tostring(p56) .. "&bust=" .. tostring(math.random(1, 10000))
			end

			if type(p56) ~= "string" then
				return nil
			end

			if not string.find(p56, "roblox.com/Thumbs/Asset.ashx", 1, true) or string.find(p56, "&bust=", 1, true) then
				return p56
			end

			return p56 .. "&bust=" .. tostring(math.random(1, 10000))
		end
	end

	return nil
end
local function v456(p58)
	local ItemType = p58 and p58.ItemType

	return ItemType == nil or ItemType == "Knife" or ItemType == "Gun"
end
local function v458()
	local t29 = {}

	for k, v in pairs(v441) do
		if type(v) == "table" then
			if v456(v) then
				local ItemName = v.ItemName or k
				local Rarity = v.Rarity or "Unknown"

				table.insert(t29, {
					Id = k,
					Name = ItemName,
					Subtitle = (v.ItemType or "Weapon") .. " / " .. k,
					Badge = Rarity,
					BadgeColor = t27[Rarity],
					Image = v453(v.Image, v.ItemID),
					_SortName = string.lower(ItemName),
					_SortRarity = t28[Rarity] or 99
				})
			end
		end
	end

	table.sort(t29, function(p59, p60)
		if p59._SortRarity == p60._SortRarity then
			return p59._SortName < p60._SortName
		end

		return p59._SortRarity < p60._SortRarity
	end)

	return t29
end

local v464 = v458()

local function v465()
	local v466 = v437(v434.Database.Sync:FindFirstChild("MysteryBox"), {})

	if not v466 or next(v466) == nil then
		return nil
	end

	local t30 = {}

	for k in pairs(v466) do
		table.insert(t30, k)
	end

	return t30[math.random(1, #t30)]
end
local function v469(p61)
	if not p61 or p61 == "" then
		return
	end

	pcall(function()
		v440.OpenBox(v465(), p61)
	end)
	v449(p61, 1)
end

task.spawn(function()
	while true do
		task.wait(0.5)

		if v38.AutoOpenCrates.State then
			if not v38.AutoOpenCrates.Crate then
				continue
			end

			pcall(function()
				ReplicatedStorage.Remotes.MysteryBox.OpenBox:FireServer(unpack({
					"OpenBox",
					v38.AutoOpenCrates.Crate,
					v38.AutoOpenCrates.CrateType
				}))
			end)
		end
	end
end)
game:GetService("Lighting").ChildAdded:Connect(function(child)
	if child.Name == "DepthOfField" then
		child.InFocusRadius = 500
		child:Destroy()
	end
end)

local v470 = UserInputService.TouchEnabled and not UserInputService.MouseEnabled

local function v471(p62, p63, p64)
	return math.max(p63, math.min(p64, p62))
end
local function v472()
	if not v470 then
		return 1
	end

	local ViewportSize = Workspace.CurrentCamera and Workspace.CurrentCamera.ViewportSize

	ViewportSize = ViewportSize or Vector2.new(390, 800)

	return v471(v471(math.min(math.min(ViewportSize.X, ViewportSize.Y) / 820, math.max(ViewportSize.X, ViewportSize.Y) / 1450), 0.78, 0.96) * 0.43478260869565222, 0.32, 0.46)
end

local v474 = v472()
local uDim2 = v470 and UDim2.fromOffset(math.floor(820 * v474), math.floor(540 * v474)) or UDim2.fromOffset(820, 540)
local vector2 = v470 and Vector2.new(160, 120) or Vector2.new(760, 420)
local vector22 = v470 and Vector2.new(math.max(40, math.floor(118 * v474)), math.max(48, math.floor(148 * v474))) or Vector2.new(118, 148)
local v478 = lib:CreateWindow({
	Title = "Project Reverse [MM2]",
	Size = uDim2,
	MinSize = vector2,
	MaxSize = Vector2.new(1400, 900),
	MobileScaled = v470,
	Resizable = true,
	Theme = "Dark",
	ToggleKeybind = Enum.KeyCode.RightControl,
	OnClose = function()
		pcall(function()
			RunService:Set3dRenderingEnabled(true)
		end)
		pcall(v90)
		genv.ValAutoFarmCoins = false
		genv.mm2VisualLibraryLoaded = false
		genv.MM2LibraryWindow = nil
		print("[MM2] window closed")
	end
})

do
	local v479 = v478:CreateTab({
		Name = "Gameplay"
	})
	local v480 = v479:CreateSection({
		Name = "Tools",
		Side = "Left"
	})

	v480:AddButton({
		Text = "Pick Up Gun",
		Tooltip = "Instant Gun Pick Up",
		Callback = function()
			pickupgun()
		end
	})
	v480:AddToggle({
		Text = "Auto Pick Up Gun",
		Default = false,
		Flag = "AutoPickUpGun",
		Tooltip = "Automatic Instant Gun Pick Up",
		Callback = function(p65)
			v38.Gameplay.AutoPickUpGun = p65
		end
	})

	local v481 = v479:CreateSection({
		Name = "Basic Stuff",
		Side = "Left"
	})

	v481:AddToggle({
		Text = "Noclip",
		Default = false,
		Flag = "Noclip",
		Tooltip = "Walk through walls and objects",
		Callback = function(p66)
			v38.Noclip = p66
		end
	})
	v481:AddButton({
		Text = "Fly GUI",
		Tooltip = "Open the Fly GUI script",
		Callback = function()
			local ok, result = pcall(function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
			end)

			if not ok then
				lib:Notify({
					Title = "Fly GUI failed",
					Content = tostring(result),
					Type = "Danger",
					Duration = 4
				})
			end
		end
	})

	local v484 = v479:CreateSection({
		Name = "More Tools",
		Side = "Left"
	})

	v484:AddButton({
		Text = "Kill Everyone as Murderer",
		Variant = "Danger",
		Tooltip = "Eliminate all players if you are the murderer",
		Callback = function()
			if v134() ~= LocalPlayer then
				lib:Notify({
					Title = "You are not the murderer",
					Content = "You do not have the knife.",
					Type = "Warning",
					Duration = 4
				})
			end

			v168()
		end
	})
	v484:AddButton({
		Text = "Bring All Players",
		Tooltip = "Teleport every player to your location (only useful as murderer)",
		Callback = function()
			if v134() ~= LocalPlayer then
				lib:Notify({
					Title = "You are not the murderer",
					Content = "This is only useful when you are the murderer.",
					Type = "Warning",
					Duration = 4
				})

				return
			end

			for _, player in ipairs(Players:GetPlayers()) do
				if player.Character then
					if player.Character:FindFirstChild("HumanoidRootPart") and player ~= LocalPlayer then
						local HumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
						local HumanoidRootPart2 = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

						HumanoidRootPart.Anchored = true
						HumanoidRootPart.CFrame = HumanoidRootPart2.CFrame + HumanoidRootPart2.CFrame.LookVector * 5
					end
				end
			end

			lib:Notify({
				Title = "Teleported Everyone",
				Content = "All players moved to your position.",
				Type = "Success",
				Duration = 3
			})
		end
	})
	v484:AddToggle({
		Text = "Auto Shoot Murderer",
		Default = false,
		Flag = "AutoShootMurderer",
		Tooltip = "Automatically shoot the murderer when detected",
		Callback = function(p67)
			v38.Gameplay.AutoShooting = p67
		end
	})
	v484:AddButton({
		Text = "Shoot Murderer (manual)",
		Callback = function()
			if not LocalPlayer.Character then
				return
			end

			local Gun = LocalPlayer.Character:FindFirstChild("Gun") or LocalPlayer.Backpack:FindFirstChild("Gun")

			if Gun then
				local v490 = v16()

				if v490 and Gun.Parent == LocalPlayer.Backpack then
					v490:EquipTool(Gun)
				end

				local v491 = v134()

				if not v491 or not v491.Character then
					return
				end

				local UpperTorso = v491.Character:FindFirstChild("UpperTorso")
				local Humanoid = v491.Character:FindFirstChild("Humanoid")

				if not UpperTorso or not Humanoid then
					return
				end

				local MoveDirection = Humanoid.MoveDirection
				local v495 = (UpperTorso.Position + UpperTorso.AssemblyLinearVelocity * Vector3.new(0, 0.5, 0) * 0.14 + MoveDirection * 2.8) * (LocalPlayer:GetNetworkPing() * 1000 * 0 + 1)

				pcall(function()
					local Gun2 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Gun")

					if Gun2 then
						Gun2.KnifeLocal.CreateBeam.RemoteFunction:InvokeServer(1, v495, "AH2")
					end
				end)
			end
		end
	})

	local v497 = v479:CreateSection({
		Name = "Annoying Stuff",
		Side = "Right"
	})

	local function v498(p68)
		if not p68 or p68 == "" then
			return
		end

		local v499 = p68:lower()

		for _, player in pairs(Players:GetPlayers()) do
			if string.find(player.Name:lower(), v499, 1, true) then
				return player.Name
			end

			if string.find(player.DisplayName:lower(), v499, 1, true) then
				return player.Name
			end
		end
	end

	v497:AddInput({
		Text = "Pick A Player",
		Placeholder = "Enter player name...",
		Default = "",
		Flag = "FlingPick",
		Callback = function(p69)
			v38.AnnoyingStuff.Fling.PickedPlayer = v498(p69)
		end
	})
	v497:AddButton({
		Text = "Fling Chosen Player",
		Callback = function()
			if not v38.AnnoyingStuff.Fling.PickedPlayer then
				return
			end

			v189({ v38.AnnoyingStuff.Fling.PickedPlayer })
		end
	})
	v497:AddButton({
		Text = "Fling Murderer",
		Callback = function()
			local v502 = v134()

			if v502 then
				v189({ v502.Name })
			end
		end
	})
	v497:AddButton({
		Text = "Fling Sheriff",
		Callback = function()
			local v503 = v141()

			if v503 then
				v189({ v503.Name })
			end
		end
	})
	v497:AddButton({
		Text = "Fling All Players",
		Variant = "Danger",
		Callback = function()
			v189({ "All" })
		end
	})
	v497:AddButton({
		Text = "Fling Random Player",
		Callback = function()
			local players = Players:GetPlayers()
			local v505 = table.find(players, LocalPlayer)

			if v505 then
				table.remove(players, v505)
			end

			if #players ~= 0 then
				v189({ players[math.random(#players)].Name })

				return
			end

			lib:Notify({
				Title = "No target",
				Content = "There are no other players in the server.",
				Type = "Warning",
				Duration = 3
			})
		end
	})
	v497:AddToggle({
		Text = "Loop Fling All Players",
		Default = false,
		Flag = "LoopFlingAll",
		Tooltip = "Repeatedly fling all players",
		Callback = function(p70)
			v38.AnnoyingStuff.Fling.LoopFlingAllPlayers = p70
		end
	})

	local v506 = v479:CreateSection({
		Name = "Other Tools",
		Side = "Right"
	})

	v506:AddButton({
		Text = "Teleport to Map",
		Callback = function()
			Teleport_to_map()
		end
	})
	v506:AddButton({
		Text = "Teleport to Lobby",
		Callback = function()
			Teleport_to_lobby()
		end
	})
	v506:AddButton({
		Text = "Notify Murderer Username",
		Callback = function()
			local v507 = v134()

			if not v507 then
				lib:Notify({
					Title = "Murderer",
					Content = "Not found.",
					Type = "Warning",
					Duration = 3
				})

				return
			end

			lib:Notify({
				Title = "Murderer Username",
				Content = v507.Name,
				Type = "Info",
				Duration = 5
			})
		end
	})
	v506:AddButton({
		Text = "Notify Sheriff Username",
		Callback = function()
			local v508 = v141()

			if not v508 then
				lib:Notify({
					Title = "Sheriff",
					Content = "Not found.",
					Type = "Warning",
					Duration = 3
				})

				return
			end

			lib:Notify({
				Title = "Sheriff Username",
				Content = v508.Name,
				Type = "Info",
				Duration = 5
			})
		end
	})
	v506:AddButton({
		Text = "Reveal Roles",
		Callback = function()
			v154()
		end
	})
	v506:AddToggle({
		Text = "Auto Reveal Roles",
		Default = false,
		Flag = "AutoRevealRoles",
		Tooltip = "Automatically show player roles each round",
		Callback = function(p71)
			v38.AutoRevealRoles = p71
		end
	})

	local v509 = v479:CreateSection({
		Name = "Speed and Jump",
		Side = "Right"
	})

	v509:AddSlider({
		Text = "WalkSpeed",
		Min = 1,
		Max = 100,
		Default = 16,
		Increment = 1,
		Suffix = "studs/s",
		Flag = "WS",
		Callback = function(p72)
			v38.Sliders.Speed = p72
		end
	})
	v509:AddSlider({
		Text = "JumpPower",
		Min = 1,
		Max = 100,
		Default = 50,
		Increment = 1,
		Flag = "JP",
		Callback = function(p73)
			v38.Sliders.Jump = p73
		end
	})
end

local v510 = v478:CreateTab({
	Name = "ESP"
}):CreateSection("ESP Settings")

v510:AddToggle({
	Text = "Players ESP",
	Default = false,
	Flag = "ESPPlayers",
	Tooltip = "Highlight all players on the map",
	Callback = function(p74)
		v38.ESP.Players = p74

		if p74 then
			v148()
		else
			for _, child in ipairs(Workspace:GetChildren()) do
				if child.Name == "PlayerESP" then
					child:Destroy()
				end
			end
		end
	end
})
v510:AddToggle({
	Text = "Dropped Gun ESP",
	Default = false,
	Flag = "ESPGun",
	Tooltip = "Highlight dropped guns",
	Callback = function(p75)
		v38.ESP.DroppedGun = p75
	end
})
v510:AddToggle({
	Text = "Trap ESP",
	Default = false,
	Flag = "ESPTrap",
	Tooltip = "Highlight traps placed by murderer",
	Callback = function(p76)
		v38.ESP.Traps = p76
	end
})

do
	local v513 = v478:CreateTab({
		Name = "Auto Farm"
	})
	local v514 = v513:CreateSection({
		Name = "Autofarm Features",
		Side = "Left"
	})

	v514:AddToggle({
		Text = "Auto Teleport At Spawn",
		Default = false,
		Flag = "AutoTPSpawn",
		Tooltip = "Teleport to spawn when round starts",
		Callback = function(p77)
			v38.AutoFarm.TeleportSpawn = p77
		end
	})
	v514:AddToggle({
		Text = "Auto Kill Everyone As Murderer",
		Default = false,
		Flag = "AutoKillAll",
		Callback = function(p78)
			v38.AutoFarm.KillEveryoneAsAMurderer = p78
		end
	})
	v514:AddToggle({
		Text = "Auto Prestige",
		Default = false,
		Flag = "AutoPrestige",
		Callback = function(p79)
			v38.AutoFarm.AutoPrestige = p79
		end
	})

	local v515 = v513:CreateSection({
		Name = "More Features",
		Side = "Right"
	})

	v515:AddToggle({
		Text = "Auto Fling Murderer",
		Default = false,
		Flag = "AutoFlingM",
		Callback = function(p80)
			v38.AutoFarm.AutoFlingMurderer = p80
		end
	})
	v515:AddToggle({
		Text = "Auto Fling Sheriff",
		Default = false,
		Flag = "AutoFlingS",
		Callback = function(p81)
			v38.AutoFarm.AutoFlingSheriff = p81
		end
	})
	v515:AddToggle({
		Text = "Server Hop If Server Is Empty",
		Default = false,
		Flag = "AutoSH",
		Callback = function(p82)
			v38.AutoFarm.AutoTeleportToRandomServerIfServerIsEmpty = p82
		end
	})
	v515:AddSlider({
		Text = "Players Threshold For Server Hop",
		Min = 1,
		Max = 12,
		Default = 2,
		Increment = 1,
		Flag = "SHThresh",
		Callback = function(p83)
			v38.AutoFarm.PlayersToAutoServerHop = p83
		end
	})
end

do
	local v516 = v478:CreateTab({
		Name = "Coin Farm"
	})
	local v517 = v516:CreateSection({
		Name = "Coin Farm 1 [Fly]",
		Side = "Left"
	})

	v517:AddToggle({
		Text = "Enable Coin Farm 1",
		Default = false,
		Flag = "CF1",
		Tooltip = "Automatically collect coins (fly method)",
		Callback = function(p84)
			v38.CoinFarm.State = p84

			if not p84 then
				local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart then
					HumanoidRootPart.Anchored = false

					local MM2_CoinFarmVelocity = HumanoidRootPart:FindFirstChild("MM2_CoinFarmVelocity")

					if MM2_CoinFarmVelocity then
						MM2_CoinFarmVelocity:Destroy()
					end
				end
			end
		end
	})
	v517:AddSlider({
		Text = "Farm Speed",
		Min = 15,
		Max = 25,
		Default = 22.5,
		Increment = 0.5,
		Flag = "CF1Speed",
		Callback = function(p85)
			v38.CoinFarm.Settings.Speed = p85
		end
	})
	v516:CreateSection({
		Name = "Coin Farm 2 [Safe TP]",
		Side = "Left"
	}):AddToggle({
		Text = "Enable Coin Farm 2",
		Default = false,
		Flag = "CF2",
		Tooltip = "Teleport-based safe coin farm",
		Callback = function(p86)
			v38.CoinFarm2.State = p86

			if p86 then
				task.spawn(v124)
			end
		end
	})

	local v520 = v516:CreateSection({
		Name = "Coin Settings",
		Side = "Right"
	})

	v520:AddToggle({
		Text = "Destroy Player Models",
		Default = false,
		Flag = "DestroyP",
		Callback = function(p87)
			v38.CoinFarm.Settings.DestroyPlayers = p87
		end
	})
	v520:AddToggle({
		Text = "Destroy Map",
		Default = false,
		Flag = "DestroyM",
		Callback = function(p88)
			v38.CoinFarm.Settings.DestroyMap = p88
		end
	})
	v520:AddToggle({
		Text = "Die At Full Bag",
		Default = false,
		Flag = "DieFull",
		Callback = function(p89)
			v38.CoinFarm.Settings.DieAtFullBag = p89
		end
	})
	v520:AddToggle({
		Text = "Teleport Under Map At Full Bag",
		Default = false,
		Flag = "TPUnderFull",
		Callback = function(p90)
			v38.AutoFarm.TeleportUnderMap = p90
		end
	})
	v520:AddToggle({
		Text = "Auto Fling Murderer At Full Bag",
		Default = false,
		Flag = "AFMFull",
		Callback = function(p91)
			v38.AutoFarm.AutoFlingMurdererAtFullBag = p91
		end
	})
	v520:AddToggle({
		Text = "Disable 3D Rendering",
		Default = false,
		Flag = "Disable3D",
		Callback = function(p92)
			v38.CoinFarm2.Disable3DRendering = p92
			pcall(function()
				RunService:Set3dRenderingEnabled(not p92)
			end)
		end
	})
	v520:AddToggle({
		Text = "Stats Overlay",
		Default = false,
		Flag = "StatsOverlay",
		Callback = function(p93)
			v38.CoinFarm.StatsOverlay = p93
		end
	})

	local v521 = v516:CreateSection({
		Name = "Auto Open Crates",
		Side = "Right"
	})
	local t31 = {}
	local ok, result = pcall(function()
		return require(ReplicatedStorage.Database.Sync.Shop).Weapons
	end)

	if ok and result then
		for k in pairs(result) do
			table.insert(t31, tostring(k))
		end

		table.sort(t31)
	end

	v521:AddToggle({
		Text = "Auto Open Crates",
		Default = false,
		Flag = "AOCrates",
		Callback = function(p94)
			v38.AutoOpenCrates.State = p94
		end
	})

	if #t31 > 0 then
		v521:AddDropdown({
			Text = "Choose Box",
			Options = t31,
			Default = t31[1],
			Searchable = true,
			Flag = "AOCrate_Pick",
			Callback = function(p95)
				v38.AutoOpenCrates.Crate = p95

				local ok2, crateType = pcall(function()
					return require(ReplicatedStorage.Database.Sync.Shop).Weapons[p95].DataType
				end)

				if ok2 and crateType then
					v38.AutoOpenCrates.CrateType = crateType
				end
			end
		})
	end
end

do
	local v528 = v478:CreateTab({
		Name = "Trade Helper"
	})
	local v529 = v528:CreateSection({
		Name = "Trade Info",
		Side = "Left"
	})

	v529:AddParagraph({
		Title = "Trade Helper",
		Content = "This tab shows item values in trades (USD or Supreme), calculates total value, and helps you choose profitable offers."
	})
	v529:AddDropdown({
		Text = "Item Price Display",
		Options = {
			"USD",
			"Supreme"
		},
		Default = "Supreme",
		Flag = "PriceType",
		Callback = function(p96)
			s1 = p96
			v308()
		end
	})
	v529:AddToggle({
		Text = "Show Values In Trade",
		Default = false,
		Flag = "ShowValues",
		Callback = function(p97)
			u255 = p97

			if p97 then
				pcall(v360, Offer, u349)
			else
				pcall(v371)
			end
		end
	})

	local v530 = v528:CreateSection({
		Name = "Auto Trade [Risky]",
		Side = "Right"
	})

	v530:AddBanner({
		Type = "Warning",
		Text = "Auto-trade changes your offer automatically. Test it on an alt first."
	})
	v530:AddToggle({
		Text = "Automatically Generate Offers",
		Default = false,
		Flag = "AutoOffer",
		Callback = function(p98)
			u257 = p98
		end
	})
	v530:AddButton({
		Text = "Generate Offer",
		Callback = function()
			pcall(v400)
		end
	})
	v530:AddButton({
		Text = "Refresh Offer",
		Variant = "Ghost",
		Callback = function()
			pcall(v408)
		end
	})
	v530:AddSlider({
		Text = "Minimum Profit Percentage",
		Min = 0,
		Max = 100,
		Default = 6,
		Increment = 1,
		Suffix = "%",
		Flag = "MinProfit",
		Callback = function(p99)
			n6 = p99
		end
	})
end

do
	local v531 = v478:CreateTab({
		Name = "Inventory"
	})
	local v532 = v531:CreateSection({
		Name = "Inventory Analyzer",
		Side = "Left"
	})

	v532:AddParagraph({
		Title = "What is this?",
		Content = "Analyzes your inventory, sorts items by value, and shows the total USD value."
	})

	local v533 = v532:AddParagraph({
		Title = "Your Inventory:",
		Content = "Press the button below."
	})
	local u534 = false

	v532:AddButton({
		Text = "Start Analysis",
		Variant = "Primary",
		Callback = function()
			if u534 then
				return
			end

			u534 = true
			v533:SetTitle("Please wait...")
			v533:SetContent("Collecting data...")
			task.spawn(function()
				local ok, result = pcall(v421, LocalPlayer.Name)

				v533:SetTitle("Your Inventory:")
				v533:SetContent(ok and result or "Failed to fetch inventory.")
				u534 = false
			end)
		end
	})
	v532:AddButton({
		Text = "Copy To Clipboard",
		Variant = "Ghost",
		Callback = function()
			local ok, result = pcall(v421, LocalPlayer.Name)

			if ok and typeof(setclipboard) == "function" and pcall(setclipboard, result) then
				lib:Notify({
					Title = "Copied",
					Content = "Copied to clipboard.",
					Type = "Success",
					Duration = 3
				})
			end
		end
	})

	local v539 = v531:CreateSection({
		Name = "Other Players' Inventories",
		Side = "Right"
	})

	v539:AddParagraph({
		Title = "Players Inventories Analysis",
		Content = "Start the scanner and wait a minute: it collects all player inventories and sorts them by total value."
	})

	local t32 = {}
	local v541 = v539:AddParagraph({
		Title = "Results:",
		Content = "(empty)"
	})

	local function v542(p100)
		local v543 = string.match(type(p100) == "string" and p100 or "", "Total Value:%s*%$?(%-?[%d%.]+)")

		return tonumber(v543) or 0
	end
	local function v544()
		local t33 = {}

		for k, v in pairs(t32) do
			table.insert(t33, {
				name = k,
				data = v,
				total = v542(v)
			})
		end

		table.sort(t33, function(p101, p102)
			return p101.total > p102.total
		end)

		local t34 = {}

		for _, v in ipairs(t33) do
			table.insert(t34, ("Player %s:\n%s\n"):format(v.name, v.data))
		end

		v541:SetContent(#t34 > 0 and table.concat(t34, "\n") or "(empty)")
	end

	local u551 = false

	v539:AddToggle({
		Text = "Auto-Scan Players Every Minute",
		Default = false,
		Flag = "OthersScan",
		Callback = function(p103)
			u551 = p103

			if p103 then
				task.spawn(function()
					while u551 do
						for _, player in ipairs(Players:GetPlayers()) do
							if not u551 then
								break
							end

							local ok, result = pcall(v421, player.Name)
							local Name = player.Name
							local v557 = ok and result

							t32[Name] = v557 or "Failed to fetch."
							v544()
							task.wait(1)
						end

						task.wait(60)
					end
				end)
			end
		end
	})
	v539:AddButton({
		Text = "Scan All Players Now",
		Callback = function()
			task.spawn(function()
				for _, player in ipairs(Players:GetPlayers()) do
					local ok, result = pcall(v421, player.Name)

					t32[player.Name] = ok and result or "Failed to fetch."
					v544()
					task.wait(0.5)
				end
			end)
		end
	})
end

do
	local n13 = 1

	local function v563()
		if v478 and v478._UpdateStatus then
			pcall(v478._UpdateStatus)
		end
	end
	local function v564(p104)
		n13 = v471(n13 + p104, 1, 100)
		v563()
	end
	local function v565(p105)
		local v566 = #p105:GetSelected()

		return v566, n13, v566 * n13
	end
	local function v567(p106)
		local selected = p106:GetSelected()

		if #selected == 0 then
			lib:Notify({
				Title = "Nothing selected",
				Content = "Select item cards first. Amount applies to each selected item.",
				Type = "Warning",
				Duration = 3
			})

			return
		end

		local ok, result = pcall(function()
			for _, v in ipairs(selected) do
				v449(v, n13)
			end
		end)

		if not ok then
			lib:Notify({
				Title = "Spawn failed",
				Content = tostring(result),
				Type = "Danger",
				Duration = 4
			})

			return
		end

		lib:Notify({
			Title = "Spawned",
			Content = ("%d selected item(s) x %d each = %d total spawned."):format(#selected, n13, #selected * n13),
			Type = "Success",
			Duration = 3
		})
	end
	local function v573(p107)
		local selected = p107:GetSelected()

		if #selected ~= 0 then
			task.spawn(function()
				local n14 = 0

				for _, v in ipairs(selected) do
					local ok, result = pcall(function()
						v469(v)
					end)

					if ok then
						n14 += 1
					else
						lib:Notify({
							Title = "Crate open failed",
							Content = tostring(result),
							Type = "Danger",
							Duration = 4
						})
					end

					task.wait(0.05)
				end

				if n14 > 0 then
					lib:Notify({
						Title = "Crates opened",
						Content = ("%d item(s)."):format(n14),
						Type = "Success",
						Duration = 3
					})
				end
			end)

			return
		end

		lib:Notify({
			Title = "Nothing selected",
			Content = "Select one or more item cards first.",
			Type = "Warning",
			Duration = 3
		})
	end

	local v580 = v478:CreateTab({
		Name = "Spawner"
	})
	local v581 = v580:AddItemGrid({
		Items = v464,
		MultiSelect = true,
		SearchBar = true,
		ItemSize = vector22,
		MobileScaledItemSize = v470,
		OnSelectionChanged = function()
			v563()
		end
	})

	v580:SetActionBar({
		Left = {
			{
				Text = "Select All",
				Callback = function()
					v581:SelectAll()
				end
			},
			{
				Text = "Clear",
				Callback = function()
					v581:Clear()
				end
			},
			{
				Text = "Amount -",
				Callback = function()
					v564(-1)
				end
			},
			{
				Text = "Amount +",
				Callback = function()
					v564(1)
				end
			}
		},
		Primary = {
			Text = "Spawn Selected",
			Callback = function()
				v567(v581)
			end
		},
		Status = function()
			local v582, v583, v584 = v565(v581)

			return ("%d x %d = %d items"):format(v582, v583, v584)
		end
	})

	local v585 = v478:CreateTab({
		Name = "Crates"
	})
	local v586 = v585:AddItemGrid({
		Items = v464,
		MultiSelect = true,
		SearchBar = true,
		ItemSize = vector22,
		MobileScaledItemSize = v470,
		OnSelectionChanged = function()
			v563()
		end
	})

	v585:SetActionBar({
		Left = {
			{
				Text = "Select All",
				Callback = function()
					v586:SelectAll()
				end
			},
			{
				Text = "Clear",
				Callback = function()
					v586:Clear()
				end
			}
		},
		Primary = {
			Text = "Open Crate",
			Callback = function()
				v573(v586)
			end
		},
		Status = function()
			return ("%d selected"):format(#v586:GetSelected())
		end
	})
end

do
	local v587 = v478:CreateTab({
		Name = "Misc"
	})
	local v588 = v587:CreateSection({
		Name = "Server Crasher",
		Side = "Left"
	})

	v588:AddBanner({
		Type = "Danger",
		Text = "Server crash is locked for most users. Development only (getgenv().dev = true)."
	})
	v588:AddButton({
		Text = "Crash Server",
		Variant = "Danger",
		Callback = function()
			if genv.dev then
				task.spawn(v185)

				return
			end

			lib:Notify({
				Title = "Feature locked",
				Content = "You do not have access to this feature.",
				Type = "Warning",
				Duration = 4
			})
		end
	})
	v587:CreateSection({
		Name = "Unlock Emotes",
		Side = "Left"
	}):AddButton({
		Text = "Unlock All Emotes",
		Callback = function()
			local v589 = v16()

			if LocalPlayer.PlayerGui:FindFirstChild("MainGUI") then
				if not LocalPlayer.PlayerGui.MainGUI.Game:FindFirstChild("Emotes") or not v18() or not v589 or not (v589.Health > 0) then
					lib:Notify({
						Title = "Not ready",
						Content = "Wait for the game to finish loading.",
						Type = "Warning",
						Duration = 3
					})

					return
				end

				v235()
			else
				lib:Notify({
					Title = "Not ready",
					Content = "Wait for the game to finish loading.",
					Type = "Warning",
					Duration = 3
				})
			end
		end
	})

	local v590 = v587:CreateSection({
		Name = "Server Stuff",
		Side = "Right"
	})

	v590:AddButton({
		Text = "Rejoin Server",
		Callback = function()
			TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
		end
	})
	v590:AddButton({
		Text = "Server Hop",
		Callback = function()
			v239()
		end
	})

	local v591 = v587:CreateSection({
		Name = "Spam Random Emotes",
		Side = "Right"
	})

	v591:AddToggle({
		Text = "Spam Random Emotes",
		Default = false,
		Flag = "SpamRand",
		Callback = function(p108)
			v38.Emotes.AutoPlayEmotes = p108
		end
	})
	v591:AddSlider({
		Text = "Spam Speed",
		Min = 1,
		Max = 50,
		Default = 1,
		Increment = 1,
		Suffix = "/s",
		Flag = "SpamSpeed",
		Callback = function(p109)
			v38.Emotes.EmoteSpamSpeed = p109
		end
	})

	local v592 = v587:CreateSection({
		Name = "Spam Selected Emote",
		Side = "Right"
	})

	v592:AddToggle({
		Text = "Spam Selected Emote",
		Default = false,
		Flag = "SpamSel",
		Callback = function(p110)
			v38.Emotes.AutoPlaySelectedEmote = p110
		end
	})
	v592:AddDropdown({
		Text = "Pick An Emote",
		Options = t3,
		Default = t3[1],
		Searchable = true,
		Flag = "PickEmote",
		Callback = function(p111)
			v38.Emotes.SelectedEmote = p111
		end
	})
	v587:CreateSection({
		Name = "Fast Skin Swapper",
		Side = "Right"
	}):AddToggle({
		Text = "Shuffle Weapons",
		Default = false,
		Flag = "ShuffleW",
		Callback = function(p112)
			v38.ShuffleWeapons = p112
		end
	})
end

do
	local v593 = v478:CreateTab({
		Name = "Valentine Farm"
	})
	local t35 = {
		PlayerData = {},
		MaxCoins = 40,
		CoinBag = 0,
		TotalCollected = 0,
		SessionTime = 0,
		PauseFloatTP = false,
		IsFarming = false,
		CoinTypes = { "Any" },
		CoinFarmType = "Under",
		FarmSpeed = 22.7,
		KillAllOnFull = false,
		ResetOnFullBag = false,
		FlingMurdererFullBag = false,
		FlingedRecently = false,
		LastFlingTime = 0
	}
	local Gameplay2 = ReplicatedStorage.Remotes.Gameplay
	local Extras = ReplicatedStorage.Remotes.Extras

	pcall(function()
		t35.PlayerData = Gameplay2.GetCurrentPlayerData:InvokeServer()

		local ok, result = pcall(function()
			return Extras.AmElite:InvokeServer()
		end)
		local v599 = ok and result

		t35.MaxCoins = v599 and 50 or 40

		if t35.PlayerData[LocalPlayer.Name] then
			t35.CoinBag = t35.PlayerData[LocalPlayer.Name].Coins or 0
			t35.IsFarming = not t35.PlayerData[LocalPlayer.Name].Dead
		end
	end)
	Gameplay2.PlayerDataChanged.OnClientEvent:Connect(function(p113)
		t35.PlayerData = p113
	end)
	Gameplay2.CoinCollected.OnClientEvent:Connect(function(p114, p115)
		t35.CoinBag = p115
		t35.TotalCollected += 1
	end)
	Gameplay2.LoadingMap.OnClientEvent:Connect(function()
		t35.CoinBag = 0
	end)
	Gameplay2.RoundStart.OnClientEvent:Connect(function()
		local ok, result = pcall(function()
			return Extras.AmElite:InvokeServer()
		end)

		t35.MaxCoins = ok and result and 50 or 40
		t35.IsFarming = true
	end)
	Gameplay2.RoundEndFade.OnClientEvent:Connect(function()
		t35.IsFarming = false
	end)

	local function v602(p116)
		return p116.Character or p116.CharacterAdded:Wait()
	end
	local function v603(p117)
		local v604 = v602(p117)

		return v604 and v604:FindFirstChild("HumanoidRootPart")
	end
	local function v605(p118)
		local v606 = v602(p118)

		return v606 and v606:FindFirstChildOfClass("Humanoid")
	end
	local function v607()
		local Character = LocalPlayer.Character
		local Humanoid = Character and Character:FindFirstChildWhichIsA("Humanoid")

		return Character and Humanoid and Humanoid.Health > 0
	end
	local function v610(p119)
		return t35.PlayerData[p119.Name] and not t35.PlayerData[p119.Name].Dead
	end
	local function v611()
		for _, child in pairs(Workspace:GetChildren()) do
			if child:GetAttribute("MapID") then
				return child
			end
		end
	end
	local function v614()
		return t35.CoinBag >= t35.MaxCoins
	end
	local function v615(p120)
		for k, v in pairs(t35.PlayerData) do
			if k == p120.Name then
				return v.Role
			end
		end

		return "None"
	end
	local function v618()
		return v615(LocalPlayer) == "Murderer"
	end
	local function v619()
		local n15 = 0
		local v621 = false

		for k, v in pairs(t35.PlayerData) do
			if k ~= LocalPlayer.Name and v and not v.Dead then
				n15 += 1

				if v.Role == "Murderer" then
					v621 = true
				end
			end
		end

		return v610(LocalPlayer) and n15 == 1 and v621
	end
	local function v624()
		t35.PauseFloatTP = true
		task.wait(0.5)

		if v607() then
			LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
		end

		repeat
			task.wait(0.2)
		until v607()

		t35.PauseFloatTP = false
	end
	local function v625()
		local v626 = v605(LocalPlayer)

		if LocalPlayer.Backpack:FindFirstChild("Knife") and v626 then
			v626:EquipTool(LocalPlayer.Backpack:FindFirstChild("Knife"))
		end

		local v627 = v602(LocalPlayer)
		local Knife = v627 and v627:FindFirstChild("Knife")

		if not Knife then
			return
		end

		for _, player in pairs(Players:GetPlayers()) do
			task.spawn(function()
				local v631 = v603(LocalPlayer)

				if player.Character and v631 and player ~= LocalPlayer and v610(player) then
					local HumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

					if HumanoidRootPart then
						pcall(function()
							firetouchinterest(Knife.Handle, HumanoidRootPart, 1)
							Knife:FindFirstChild("Events"):FindFirstChild("KnifeStabbed"):FireServer()
							Knife:Activate()
							firetouchinterest(Knife.Handle, HumanoidRootPart, 0)
						end)
						task.wait()
					end
				end
			end)
		end
	end
	local function v633()
		local v634 = v603(LocalPlayer)

		if not v634 then
			return
		end

		local v635 = v611()
		local CoinContainer = v635 and v635:FindFirstChild("CoinContainer")

		if not CoinContainer then
			return
		end

		local t36 = {}

		for _, child in pairs(CoinContainer:GetChildren()) do
			if child:GetAttribute("CoinID") and not child:GetAttribute("Collected") and (table.find(t35.CoinTypes, child:GetAttribute("CoinID")) or table.find(t35.CoinTypes, "Any")) then
				local CoinVisual = child:FindFirstChild("CoinVisual")
				local MainCoin = CoinVisual and CoinVisual:FindFirstChild("MainCoin")

				if MainCoin and MainCoin.Transparency == 0 then
					table.insert(t36, {
						coin = child,
						dist = (v634.Position - child.Position).Magnitude
					})
				end
			end
		end

		table.sort(t36, function(p121, p122)
			return p121.dist < p122.dist
		end)

		return t36[1] and t36[1].coin
	end

	local Part2
	local connection3
	local connection4
	local Position
	local connection5

	local function v647()
		t35.FlingedRecently = true
		t35.LastFlingTime = tick()
		task.delay(30, function()
			if tick() - t35.LastFlingTime >= 30 then
				t35.FlingedRecently = false
			end
		end)
	end
	local function v648(p123)
		genv.ValAutoFarmCoins = p123

		if p123 then
			Part2 = Instance.new("Part")
			Part2.Name = "ValFarmFloat"
			Part2.Size = Vector3.new(5, 0.1, 5)
			Part2.CanCollide = true
			Part2.Anchored = true
			Part2.Parent = Workspace
			Part2.Transparency = 1
			Position = v603(LocalPlayer) and v603(LocalPlayer).Position or Vector3.zero
			connection3 = RunService.RenderStepped:Connect(function()
				if v603(LocalPlayer) then
					local pairs_ = pairs
					local v650 = v602(LocalPlayer)

					for _, descendant in pairs_(v650:GetDescendants()) do
						if descendant:IsA("BasePart") and descendant.CanCollide then
							descendant.CanCollide = false
						end
					end
				end
			end)
			connection5 = RunService.RenderStepped:Connect(function(dt)
				t35.SessionTime += dt
			end)
			connection4 = RunService.Heartbeat:Connect(function()
				local v653 = v603(LocalPlayer)

				if v653 and Part2 and v607() and not t35.PauseFloatTP then
					local cFrame = Part2.CFrame * CFrame.new(0, 3, 0)

					if v610(LocalPlayer) and not v614() and t35.IsFarming then
						cFrame *= CFrame.Angles(math.rad(90), 0, 0)
					end

					v653.CFrame = cFrame
					v653.Velocity = Vector3.zero
					v653.RotVelocity = Vector3.zero
				end
			end)
		else
			if connection3 then
				connection3:Disconnect()
				connection3 = nil
			end

			if connection4 then
				connection4:Disconnect()
				connection4 = nil
			end

			if connection5 then
				connection5:Disconnect()
				connection5 = nil
			end

			if Part2 then
				Part2:Destroy()
				Part2 = nil
			end

			local v655 = v603(LocalPlayer)

			if v655 and Position then
				v655.Anchored = true
				v655.CFrame = CFrame.new(Position)
				v655.Velocity = Vector3.zero
				task.wait(0.7)
				v655.Anchored = false
			end
		end

		task.spawn(function()
			while genv.ValAutoFarmCoins do
				local v656 = v603(LocalPlayer)

				if v656 then
					if not v607() then
						task.wait(1)
						task.wait()

						continue
					end

					if v611() then
						if not v610(LocalPlayer) or v614() or not t35.IsFarming then
							if not t35.IsFarming then
								if Part2 and Part2.Parent then
									Part2.CFrame = CFrame.new(100, 0, 100)
								end

								task.wait(0.1)
								task.wait()

								continue
							end

							if t35.FlingMurdererFullBag then
								if v618() or not v607() or not v614() then
									if v618() and t35.KillAllOnFull and v614() and v610(LocalPlayer) and v607() then
										v625()
									end

									if t35.ResetOnFullBag and v614() and v607() and not v618() and not t35.FlingedRecently and v610(LocalPlayer) then
										v624()
									end

									if Part2 and Part2.Parent then
										Part2.CFrame = CFrame.new(100, 0, 100)
									end

									task.wait(0.1)
									task.wait()

									continue
								end

								if v619() then
									v624()
								else
									for k, v in pairs(t35.PlayerData) do
										if k ~= LocalPlayer.Name and v.Role == "Murderer" then
											if not v.Dead then
												t35.PauseFloatTP = true
												v647()
												v189({ k })
												t35.PauseFloatTP = false
												task.wait(0.5)

												break
											end
										end
									end
								end
							elseif v618() and t35.KillAllOnFull and v614() and v610(LocalPlayer) and v607() then
								v625()
							end

							if t35.ResetOnFullBag and v614() and v607() and not v618() and not t35.FlingedRecently and v610(LocalPlayer) then
								v624()
							end

							if Part2 and Part2.Parent then
								Part2.CFrame = CFrame.new(100, 0, 100)
							end

							task.wait(0.1)
							task.wait()

							continue
						end

						local v659 = v633()

						if v659 then
							local v660 = t35.CoinFarmType == "Under" and -6 or -2
							local cFrame = CFrame.new(v659.Position) * CFrame.new(0, v660 - 1, 0)
							local Magnitude = (v656.Position - cFrame.Position).Magnitude

							if Magnitude >= 200 then
								Part2.CFrame = cFrame
							else
								local tween = TweenService:Create(Part2, TweenInfo.new(Magnitude / t35.FarmSpeed, Enum.EasingStyle.Linear), {
									CFrame = cFrame
								})

								tween:Play()

								if not v614() then
									tween.Completed:Wait()
									tween:Cancel()
								end
							end

							task.spawn(function()
								while v659 and v656 and not v659:GetAttribute("Collected") do
									for i = 0, 200 do
										local function v665()
											pcall(function()
												firetouchinterest(v656, v659, 1)
												firetouchinterest(v656, v659, 0)
											end)
										end

										task.spawn(v665)
									end

									task.wait()
								end
							end)
							v659:Destroy()
						end
					elseif Part2 then
						Part2.CFrame = CFrame.new(100, 0, 100)
					end
				else
					task.wait(1)
				end

				task.wait()
			end
		end)
	end
	local function v666(p124)
		if p124 then
			return RunService.Heartbeat:Connect(function()
				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= LocalPlayer and player.Character then
						for _, descendant in ipairs(player.Character:GetDescendants()) do
							if descendant:IsA("BasePart") and not descendant.Anchored and descendant.Velocity.Magnitude > 100 then
								descendant.Velocity = Vector3.zero
								descendant.RotVelocity = Vector3.zero
								descendant.Anchored = true
								task.delay(0.5, function()
									if descendant and descendant.Anchored then
										descendant.Anchored = false
									end
								end)
							end
						end
					end
				end
			end)
		end
	end

	local v671 = v593:CreateSection({
		Name = "Session Statistics",
		Side = "Left"
	}):AddParagraph({
		Title = "Session Progress",
		Content = "Time: 00:00:00\nCoins: 0 | Per Hour: 0"
	})

	local function v672(p125)
		return string.format("%02d:%02d:%02d", math.floor(p125 / 3600), math.floor(p125 / 60) % 60, p125 % 60)
	end
	local function v673(p126)
		return tostring(p126):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
	end

	local n16 = 0

	RunService.Heartbeat:Connect(function()
		if tick() - n16 > 0.5 then
			n16 = tick()
			v671:SetContent(string.format("Time: %s\nCoins: %s | Per Hour: %s", v672(t35.SessionTime), v673(t35.TotalCollected), t35.SessionTime > 0 and v673(math.round(t35.TotalCollected / t35.SessionTime * 3600)) or "0"))
		end
	end)
	v593:CreateSection({
		Name = "Farming",
		Side = "Left"
	}):AddToggle({
		Text = "Enable Coin Auto Farm",
		Default = false,
		Flag = "ValFarm",
		Callback = function(p127)
			v648(p127)
		end
	})

	local v675 = v593:CreateSection({
		Name = "Farm Settings",
		Side = "Right"
	})

	v675:AddMultiDropdown({
		Text = "Coin Types",
		Options = {
			"Any",
			"Candy",
			"BeachBall",
			"Coin",
			"SnowToken",
			"Egg"
		},
		Default = { "Any" },
		Max = 6,
		Flag = "ValCoinTypes",
		Callback = function(p128)
			t35.CoinTypes = #p128 > 0 and p128 or { "Any" }
		end
	})
	v675:AddDropdown({
		Text = "Teleport Mode",
		Options = {
			"Under",
			"Normal"
		},
		Default = "Under",
		Flag = "ValTPMode",
		Callback = function(p129)
			t35.CoinFarmType = p129
		end
	})
	v675:AddSlider({
		Text = "Farm Speed",
		Min = 19,
		Max = 26,
		Default = 22.7,
		Increment = 0.1,
		Suffix = "studs/s",
		Flag = "ValSpeed",
		Tooltip = "Above 22 might kick",
		Callback = function(p130)
			t35.FarmSpeed = p130
		end
	})

	local v676 = v593:CreateSection({
		Name = "On Full Bag",
		Side = "Right"
	})

	v676:AddToggle({
		Text = "Kill All (Knife required)",
		Default = false,
		Flag = "ValKillAll",
		Callback = function(p131)
			t35.KillAllOnFull = p131
		end
	})
	v676:AddToggle({
		Text = "Reset On Full Bag",
		Default = false,
		Flag = "ValReset",
		Callback = function(p132)
			t35.ResetOnFullBag = p132
		end
	})
	v676:AddToggle({
		Text = "Fling Murderer On Full Bag",
		Default = false,
		Flag = "ValFlingM",
		Callback = function(p133)
			t35.FlingMurdererFullBag = p133
		end
	})

	local v677 = v593:CreateSection({
		Name = "Utilities",
		Side = "Right"
	})
	local u678

	v677:AddToggle({
		Text = "Anti Fling",
		Default = false,
		Flag = "ValAntiFling",
		Callback = function(p134)
			if u678 then
				u678:Disconnect()
				u678 = nil
			end

			if p134 then
				u678 = v666(true)
			end
		end
	})
	v677:AddToggle({
		Text = "Disable Rendering",
		Default = false,
		Flag = "ValNoRender",
		Tooltip = "Lowers CPU usage (Black Screen)",
		Callback = function(p135)
			pcall(function()
				RunService:Set3dRenderingEnabled(not p135)
			end)
		end
	})
end

do
	local v679 = v478:CreateTab({
		Name = "Settings"
	})
	local v680 = v679:CreateSection({
		Name = "Theme",
		Side = "Left"
	})

	v680:AddDropdown({
		Text = "Preset",
		Options = {
			"Dark",
			"Light",
			"Midnight",
			"Catppuccin",
			"AMOLED"
		},
		Default = "Dark",
		Searchable = false,
		Flag = "ThemePreset",
		Callback = function(p136)
			lib:SetTheme(p136)
			lib:Notify({
				Title = "Theme",
				Content = p136,
				Type = "Info",
				Duration = 2
			})
		end
	})
	v680:AddDropdown({
		Text = "Density",
		Options = {
			"compact",
			"normal",
			"comfortable"
		},
		Default = "normal",
		Flag = "ThemeDensity",
		Callback = function(p137)
			lib:SetDensity(p137)
			lib:Notify({
				Title = "Density",
				Content = p137,
				Type = "Info",
				Duration = 2
			})
		end
	})
	v680:AddColorPicker({
		Text = "Custom Accent",
		Default = Color3.fromRGB(232, 71, 176),
		Flag = "ThemeAccent",
		Callback = function(p138)
			lib:SetTheme({
				AccentSolid = p138,
				AccentGradientFrom = Color3.new(p138.R * 0.85, p138.G * 0.85, p138.B * 0.85),
				AccentGradientTo = p138
			})
		end
	})

	local v681 = v679:CreateSection({
		Name = "About",
		Side = "Right"
	})

	v681:AddParagraph({
		Title = "Project Reverse [MM2]",
		Content = "Murder Mystery 2 executor package ported to the new UI Library v" .. (lib.Version or "?") .. ". Drag the header to move the window, resize from the bottom-right corner. Toggle: RightControl."
	})
	v681:AddParagraph({
		Title = "Credits",
		Content = "discord.gg/project-reverse"
	})
	v681:AddBanner({
		Type = "Info",
		Text = "Murder Mystery 2 only (GameId 66654135). Other games are not supported by this script."
	})
end

local v682 = genv

if v682.MM2LibraryWindow then
	pcall(function()
		v682.MM2LibraryWindow:Destroy()
	end)
end

v682.MM2LibraryWindow = v478
task.delay(0.4, function()
	lib:Notify({
		Title = "Project Reverse [MM2] Loaded",
		Content = "Version " .. (lib.Version or "?") .. ". Toggle UI: RightControl.",
		Type = "Success",
		Duration = 5
	})
end)
print("[MM2] UI ready. Toggle with RightControl.")
