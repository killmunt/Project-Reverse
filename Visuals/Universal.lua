-- discord.gg/syncrypt

if game.GameId == 7709344486 then
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local RunService = game:GetService("RunService")
	local Players = game:GetService("Players")
	local TweenService_ = game:GetService("TweenService")
	local ProximityPromptService = game:GetService("ProximityPromptService")

	game:GetService("CollectionService")

	local LocalPlayer = Players.LocalPlayer
	local PlotModel = require(ReplicatedStorage.Controllers.PlotController).GetMyPlot().PlotModel
	local Animals = ReplicatedStorage:WaitForChild("Models").Animals
	local TraitsPerAnimal = ReplicatedStorage:WaitForChild("Models").TraitsPerAnimal
	local Traits = ReplicatedStorage:WaitForChild("Models").Traits
	local Animals2 = ReplicatedStorage:WaitForChild("Animations").Animals
	local Datas = ReplicatedStorage:WaitForChild("Datas")
	local Packages = ReplicatedStorage:WaitForChild("Packages")
	local Sounds = ReplicatedStorage:WaitForChild("Sounds")
	local Classes = ReplicatedStorage:WaitForChild("Classes")
	local Controllers = ReplicatedStorage:WaitForChild("Controllers")
	local Animals3 = require(Datas.Animals)
	local Mutations = require(Datas.Mutations)
	local Traits2 = require(Datas.Traits)
	local Rarities = require(Datas.Rarities)
	local Gradients = require(Packages.Gradients)
	local NumberUtils = require(ReplicatedStorage.Utils.NumberUtils)
	local NotificationController = require(Controllers.NotificationController)

	require(Classes.PlotClient.AnimalPrompt)
	ReplicatedStorage:WaitForChild("MutationSurfaces")
	ReplicatedStorage:WaitForChild("Vfx")

	local Traits3 = ReplicatedStorage:WaitForChild("Vfx").Traits
	local LeftBottom = LocalPlayer.PlayerGui:WaitForChild("LeftBottom", 9e9).LeftBottom
	local Cashout = LeftBottom:WaitForChild("Cashout", 9e9)
	local Currency = LeftBottom.Currency
	local AnimalOverhead = ReplicatedStorage:WaitForChild("Overheads", 9e9).AnimalOverhead
	local leaderstats = LocalPlayer:WaitForChild("leaderstats", 9e9)

	workspace:GetServerTimeNow()

	local t1 = {}
	local t2 = {}
	local text = "Strawberry Elephant"
	local s1 = "None"
	local Value_ = leaderstats.Cash.Value
	local n1 = 0
	local clone
	local clone2
	local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local Humanoid = Character:FindFirstChildWhichIsA("Humanoid") or Character:WaitForChild("Humanoid", 9e9)
	local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart") or Character:WaitForChild("HumanoidRootPart", 9e9)

	LocalPlayer.CharacterAdded:Connect(function(character)
		Character = character
		Humanoid = character:FindFirstChildWhichIsA("Humanoid") or character:WaitForChild("Humanoid", 9e9)
		HumanoidRootPart = character:FindFirstChild("HumanoidRootPart") or character:WaitForChild("HumanoidRootPart", 9e9)
	end)

	local v41 = loadstring(game:HttpGet("https://raw.githubusercontent.com/veryimportantrr/reverse-visual/refs/heads/main/gui.lua"))():CreateWindow({
		Title = "Project Reverse Undetected SAB SPAWNER",
		Icon = "eye",
		Transparent = true,
		Author = "By Project Reverse [Egorikusa]"
	})
	local v42 = v41:Tab({
		Title = "Brainrot Spawner",
		Icon = "layout-grid",
		Locked = false
	})
	local v43 = v41:Tab({
		Title = "Base Skin-Changer",
		Icon = "layout-grid",
		Locked = false
	})
	local t3 = {}

	for k, v in pairs(Animals3) do
		table.insert(t3, {
			Name = k,
			Generation = v.Generation
		})
	end

	table.sort(t3, function(p1, p2)
		return p1.Generation > p2.Generation
	end)

	local t4 = {}

	for _, v in ipairs(t3) do
		table.insert(t4, v.Name)
	end

	for k, v in pairs({
		["Dragon Cannelloni"] = 0.8,
		["Strawberry Elephant"] = 0.95
	}) do
		Animals3[k].OverheadYOffsetModifier = v
	end

	v42:Dropdown({
		Title = "Select Brainrot To Spawn",
		Values = t4,
		Value = t4[1],
		Callback = function(p3)
			text = p3
		end
	})

	local t5 = {}

	for k, Mutation in pairs(Mutations) do
		table.insert(t5, {
			Key = k,
			DisplayText = Mutation.DisplayText,
			Modifier = Mutation.Modifier or 0
		})
	end

	table.sort(t5, function(p4, p5)
		return p4.Modifier > p5.Modifier
	end)

	local t6 = { "None" }

	for _, v in ipairs(t5) do
		table.insert(t6, v.DisplayText)
	end

	v42:Dropdown({
		Title = "Select Mutation",
		Values = t6,
		Value = "None",
		Callback = function(p6)
			if typeof(p6) == "string" then
				s1 = string.gsub(p6, " ", "")
			end
		end
	})

	local t7 = {}

	for _, v in pairs(Traits2) do
		table.insert(t7, {
			Display = v.Display,
			MultiplierModifier = v.MultiplierModifier or 0
		})
	end

	table.sort(t7, function(p7, p8)
		return p7.MultiplierModifier > p8.MultiplierModifier
	end)

	local t8 = {}

	for _, v in ipairs(t7) do
		if v.Display ~= "Comet-struck" then
			table.insert(t8, v.Display)
		end
	end

	v42:Dropdown({
		Title = "Select Trait's",
		Values = t8,
		Value = {},
		Multi = true,
		AllowNone = true,
		Callback = function(p9)
			t2 = p9
		end
	})

	local t9 = {}

	for _, v in ipairs(t6) do
		if v ~= "Bloodrot" then
			table.insert(t9, v)
		end
	end

	v43:Dropdown({
		Title = "Select Base Skin",
		Values = t9,
		Value = "None",
		Callback = function(p10)
			local v67 = string.gsub(p10, " ", "")

			for _, descendant in pairs(PlotModel:GetDescendants()) do
				if descendant:IsA("BasePart") and descendant:GetAttribute("DefaultColor") then
					descendant.Color = descendant:GetAttribute("DefaultColor")
					descendant:RemoveTag("RainbowModel")
				end
			end

			if p10 == "None" then
				return
			end

			if p10 == "Rainbow" then
				for _, descendant in pairs(PlotModel:GetDescendants()) do
					if descendant:IsA("BasePart") and descendant:GetAttribute("DefaultColor") then
						descendant:AddTag("RainbowModel")
					end
				end

				return
			end

			for _, descendant in pairs(PlotModel:GetDescendants()) do
				if descendant:IsA("BasePart") and descendant:HasTag("RainbowModel") then
					descendant:RemoveTag("RainbowModel")
					descendant.Color = descendant:GetAttribute("DefaultColor")
				end
			end

			local v74 = Mutations[v67]

			if not v74 then
				return
			end

			for _, descendant in pairs(PlotModel:GetDescendants()) do
				if descendant:IsA("BasePart") then
					local attribute = descendant:GetAttribute("DefaultColor")

					if attribute then
						local v78 = v74.BaseColors[Vector3.new(math.floor(attribute.R * 255), math.floor(attribute.G * 255), math.floor(attribute.B * 255))]

						if v78 then
							descendant.Color = v78
						end
					end
				end
			end
		end
	})

	local function v79()
		for i = 1, #PlotModel.AnimalPodiums:GetChildren() do
			local v81 = PlotModel.AnimalPodiums[tostring(i)]

			if v81 then
				if not v81.Base:FindFirstChild("Spawn") then
					continue
				end

				if v81.Base.Spawn:FindFirstChild("Attachment") then
					continue
				end

				return v81
			end
		end
	end
	local function v82(p11)
		local clone3 = Cashout.Template:Clone()
		local v84 = p11 > 0

		clone3.Text = (v84 and "+$%s" or "-$%s"):format(NumberUtils:ToString(math.abs(p11), 2))
		clone3.TextColor3 = p11 > 0 and Color3.fromRGB(13, 255, 0) or Color3.fromRGB(255, 0, 0)
		clone3.Visible = true
		clone3.Parent = Cashout
		Sounds.Sfx.Cashout:Play()

		local tween = TweenService_:Create(clone3, TweenInfo.new(5, Enum.EasingStyle.Linear), {
			TextTransparency = 1
		})
		local tween2 = TweenService_:Create(clone3.UIStroke, TweenInfo.new(5, Enum.EasingStyle.Linear), {
			Transparency = 1
		})

		tween:Play()
		tween2:Play()
		tween.Completed:Once(function()
			clone3:Destroy()
		end)
	end
	local function v87(p12, p13)
		if not p13 or p13 == "None" then
			return
		end

		require(game:GetService("ReplicatedStorage"):WaitForChild("Shared").Animals):ApplyMutation(p12, text, p13)
	end
	local function v88(p14, p15, p16, p17)
		local v89 = table.find(p17, "Matteo Hat") ~= nil
		local v90 = table.find(p17, "Lightning") ~= nil
		local t10 = {}

		for _, v in ipairs(p17) do
			local v94 = Traits2[v]
			local clone3 = AnimalOverhead.Traits.Template:Clone()

			clone3.Visible = true
			clone3.Parent = p15.Traits

			if v94.Icon then
				if v94.Icon:find("://") then
					clone3.Image = v94.Icon
				end
			end

			table.insert(t10, clone3)

			if v ~= "Explosive" then
				local function v96()
					if v94 then
						local v97 = TraitsPerAnimal:FindFirstChild(v) or Traits:FindFirstChild(v)

						if v97 then
							local clone4 = v97:Clone()

							table.insert(t10, clone4)
							clone4.Name = ("_Trait.%s"):format(v)

							for _, child in ipairs(clone4:GetChildren()) do
								local v101 = false

								for _, child2 in ipairs(child:GetChildren()) do
									if child2:IsA("Attachment") then
										local Child2Name = p14:FindFirstChild(child2.Name, true)

										if Child2Name then
											v101 = true

											if v == "Taco" and v89 then
												child2.Position += Vector3.new(0, -1.33, 0)
											end

											local RigidConstraint = Instance.new("RigidConstraint")

											RigidConstraint.Attachment0 = child2
											RigidConstraint.Attachment1 = Child2Name
											RigidConstraint.Parent = child

											if v94.Modify then
												v94.Modify(child, child2, Child2Name)
											end
										end
									end
								end

								if not v101 then
									child:Destroy()
								end
							end

							clone4.Parent = p14

							local Animator = v90 and clone4:FindFirstChildWhichIsA("Animator", true)

							if Animator then
								Animator:SetAttribute("Animation", "Animations.Traits.Lightning")
								Animator:AddTag("ClientLoadAnimation")
							end
						end
					end
				end
				local function v107()
					if v94 then
						local v108 = Traits3:FindFirstChild(v)

						if v108 then
							for _, child in ipairs(v108:GetChildren()) do
								local ChildName = p14:FindFirstChild(child.Name)

								if ChildName then
									local clone4 = child:Clone()

									clone4.Massless = true
									clone4.CanCollide = false
									clone4.CanQuery = false
									clone4.CanTouch = false
									clone4.Transparency = 1
									clone4.CFrame = ChildName.CFrame

									local WeldConstraint = Instance.new("WeldConstraint", clone4)

									WeldConstraint.Part0 = ChildName
									WeldConstraint.Part1 = clone4
									clone4.Parent = p14
									clone4.Name = ("_%s"):format(child.Name)
									table.insert(t10, clone4)

									if v94.ModifyVFX then
										v94.ModifyVFX(clone4, ChildName)
									end
								end
							end
						end
					end
				end
				local function v114()
					if Traits2[v] then
						local v115 = TraitsPerAnimal:FindFirstChild(v)

						if v115 then
							local v116 = v115:FindFirstChild(p16)

							if v116 then
								local clone4 = v116:Clone()

								table.insert(t10, clone4)
								clone4.Name = ("_Trait.%s"):format(v)

								for _, child in ipairs(clone4:GetChildren()) do
									local Attachment = child:FindFirstChildOfClass("Attachment")

									if Attachment then
										local AttachmentName = p14:FindFirstChild(Attachment.Name, true)

										if AttachmentName then
											local RigidConstraint = Instance.new("RigidConstraint")

											RigidConstraint.Attachment0 = Attachment
											RigidConstraint.Attachment1 = AttachmentName
											RigidConstraint.Parent = child
										end
									end
								end

								clone4.Parent = p14
							end
						end
					end
				end

				v114()
				v96()
				v107()
			end
		end

		return function()
			for _, v in ipairs(t10) do
				v:Destroy()
			end
		end
	end
	local function v125()
		if not text then
			return
		end

		local v126 = Animals:FindFirstChild(text)
		local v127 = Animals2:FindFirstChild(text)
		local v128 = Animals3[text]
		local v129 = Mutations[s1]

		if not v126 or not v127 or not v128 then
			return
		end

		local v130 = Rarities[v128.Rarity]
		local v131 = v79()

		if not v131 then
			return NotificationController:Error("You need more room in your base to spawn a brainrot.")
		end

		local clone3 = v126:Clone()

		clone3.Parent = PlotModel
		clone3.PrimaryPart.Anchored = true
		clone3:PivotTo(v131.Base.Spawn:GetPivot())

		for _, descendant in ipairs(clone3:GetDescendants()) do
			if descendant:IsA("BasePart") then
				descendant.CanCollide = false
			end
		end

		local Attachment = Instance.new("Attachment")

		Attachment.Name = "Attachment"
		Attachment.Parent = v131.Base.Spawn

		local clone4 = AnimalOverhead:Clone()

		clone4.Parent = clone3:FindFirstChild("RootPart") or clone3.PrimaryPart

		local extentsSize = clone3:GetExtentsSize()
		local Attachment2 = Instance.new("Attachment")

		Attachment2.Name = "Info"
		Attachment2.CFrame = CFrame.new(0, extentsSize.Y * 0.75 * (v128.OverheadYOffsetModifier or 1), 0)
		Attachment2.Parent = v131.Base.Spawn
		clone4.Parent = Attachment2
		clone4.DisplayName.Text = text
		clone4.Mutation.Text = v129 and v129.DisplayText or ""
		clone4.Mutation.TextColor3 = v129 and v129.MainColor or Color3.new(1, 1, 1)
		clone4.Rarity.Text = v128.Rarity
		clone4.Rarity.TextColor3 = v130.Color
		clone4.Price.Text = "$" .. NumberUtils:ToString(v128.Price, 2)

		local v139

		if #t2 > 0 then
			clone4.Traits.Visible = true
			v139 = v88(clone3, clone4, text, t2)
		end

		v87(clone3, s1)

		if v129 then
			if v129.UseRichText then
				clone4.Mutation.RichText = true
				clone4.Mutation.Text = v129.DisplayWithRichText
			end

			if v129.GradientPreset then
				Gradients.apply(clone4.Mutation, v129.GradientPreset)
			end
		end

		local n2 = 1

		if s1 ~= "None" and v129 and v129.Modifier then
			n2 += v129.Modifier
		end

		if #t2 > 0 then
			for _, v in ipairs(t2) do
				local v143 = Traits2[v]

				if v143 and v143.MultiplierModifier then
					n2 += v143.MultiplierModifier
				end
			end
		end

		clone4.Generation.Text = "$" .. NumberUtils:ToString(v128.Generation * n2, 1) .. "/s"

		if v130.GradientPreset then
			Gradients.apply(clone4.Rarity, v130.GradientPreset)
		end

		if s1 == "None" then
			clone4.Mutation.Visible = false
		end

		local v144 = clone3.AnimationController.Animator:LoadAnimation(v127.Idle)

		v144:Play()

		local Collect = v131.Claim.Main.Collect

		Collect.Enabled = true
		Collect.Collect.Text = "Collect <br/><font color=\"#73ff00\">$0</font>"

		local ViewportFrame = Collect:FindFirstChildOfClass("ViewportFrame")

		if ViewportFrame then
			ViewportFrame.WorldModel:ClearAllChildren()
			clone3:Clone().Parent = ViewportFrame.WorldModel
		end

		local PromptAttachment = v131.Base.Spawn:FindFirstChild("PromptAttachment")

		if not PromptAttachment then
			PromptAttachment = Instance.new("Attachment")
			PromptAttachment.Name = "PromptAttachment"
			PromptAttachment.Parent = v131.Base.Spawn
		end

		local t11 = {}

		for _, child in ipairs(PromptAttachment:GetChildren()) do
			if child:IsA("ProximityPrompt") then
				table.insert(t11, child)
			end
		end

		if #t11 == 0 then
			if clone then
				local clone5 = clone:Clone()

				clone5.Parent = PromptAttachment
				table.insert(t11, clone5)
			end

			if clone2 then
				local clone5 = clone2:Clone()

				clone5.Parent = PromptAttachment
				table.insert(t11, clone5)
			end
		end

		local t12 = {
			Name = text,
			Mutation = s1,
			Traits = t2,
			Model = clone3,
			Podium = v131,
			Attachment = Attachment,
			Overhead = clone4,
			SpawnTime = workspace:GetServerTimeNow(),
			AnimTrack = v144,
			AnimLength = v144.Length,
			Money = 0,
			Generation = v128.Generation,
			Collecting = false,
			Connections = {},
			GrabPrompt = nil,
			SellPrompt = nil,
			CleanupTraits = v139
		}

		table.insert(t1, t12)
		table.insert(t12.Connections, v131.Claim:WaitForChild("Hitbox").Touched:Connect(function(part)
			if part.Parent == LocalPlayer.Character and t12.Money > 0 and not t12.Collecting then
				t12.Collecting = true

				local Money = t12.Money

				t12.Money = 0
				t12.Podium.Claim.Main.Collect.Collect.Text = "Collect <br/><font color=\"#73ff00\">$0</font>"
				v82(Money)
				task.delay(0.2, function()
					t12.Collecting = false
				end)
			end
		end))

		local v155
		local v156

		for _, v in ipairs(t11) do
			if v:IsA("ProximityPrompt") then
				if not (clone or v.KeyboardKeyCode ~= Enum.KeyCode.E) then
					clone = v:Clone()
				end

				if not (clone2 or v.KeyboardKeyCode ~= Enum.KeyCode.F) then
					clone2 = v:Clone()
				end

				v.Enabled = true

				if v.KeyboardKeyCode == Enum.KeyCode.E then
					v.ActionText = "Grab"
					v.ObjectText = t12.Name
					v155 = v
					t12.GrabPrompt = v
					task.spawn(function()
						while true do
							task.wait()
							v.ObjectText = t12.Name
							v:SetAttribute("State", "Grab")

							if v.Parent == nil then
								break
							elseif not t12.Podium then
								break
							end
						end
					end)
				elseif v.KeyboardKeyCode == Enum.KeyCode.F then
					v.ActionText = "Sell: $" .. NumberUtils:ToString(math.round(v128.Price / 2))
					v156 = v
					t12.SellPrompt = v
					task.spawn(function()
						while true do
							task.wait()
							v:SetAttribute("State", "Sell")

							if v.Parent == nil then
								break
							elseif not t12.Podium then
								break
							end
						end
					end)
					table.insert(t12.Connections, v.Triggered:Connect(function(player)
						if player ~= LocalPlayer then
							return
						end

						local v159 = math.round(v128.Price / 2)

						t12.Money = 0

						local Collect2 = t12.Podium and t12.Podium.Claim and t12.Podium.Claim.Main and t12.Podium.Claim.Main.Collect

						if Collect2 then
							Collect2.Collect.Text = "Collect <br/><font color=\"#73ff00\">$" .. NumberUtils:ToString(0, 1) .. "</font>"
							Collect2.Enabled = false

							local ViewportFrame2 = Collect2:FindFirstChildOfClass("ViewportFrame")

							if ViewportFrame2 and ViewportFrame2.WorldModel then
								pcall(function()
									ViewportFrame2.WorldModel:ClearAllChildren()
								end)
							end
						end

						v82(v159)
						pcall(function()
							if t12.AnimTrack then
								t12.AnimTrack:Stop()
							end
						end)

						if t12.Overhead then
							pcall(function()
								t12.Overhead:Destroy()
							end)
						end

						if PromptAttachment and PromptAttachment.Parent then
							for _, child in ipairs(PromptAttachment:GetChildren()) do
								if child:IsA("ProximityPrompt") then
									child:Destroy()
								end
							end
						end

						pcall(function()
							if t12.CleanupTraits then
								t12.CleanupTraits()
							end

							clone3:Destroy()
						end)
						pcall(function()
							Attachment:Destroy()
						end)

						for _, connection in ipairs(t12.Connections) do
							pcall(function()
								connection:Disconnect()
							end)
						end

						t12.Connections = {}

						for i, v2 in ipairs(t1) do
							if v2 == t12 then
								table.remove(t1, i)

								break
							end
						end
					end))
				end
			end
		end

		if v155 and v156 then
			local function v168(p18)
				if p18 then
					v155.Enabled = false
				else
					v156.Enabled = false
				end
			end
			local function v169(p19)
				if p19 then
					v155.Enabled = true
				else
					v156.Enabled = true
				end
			end

			table.insert(t12.Connections, ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt, player)
				if player ~= LocalPlayer or prompt.Parent ~= PromptAttachment then
					return
				end

				if prompt == v156 then
					v168(true)
				elseif prompt == v155 then
					v168(false)
				end
			end))
			table.insert(t12.Connections, ProximityPromptService.PromptButtonHoldEnded:Connect(function(p20, p21)
				if p21 ~= LocalPlayer or p20.Parent ~= PromptAttachment then
					return
				end

				if p20 == v156 then
					v169(true)
				elseif p20 == v155 then
					v169(false)
				end
			end))
		end
	end

	v42:Button({
		Title = "Spawn Brainrot",
		Callback = function()
			v125()
		end
	})
	ProximityPromptService.PromptButtonHoldEnded:Connect(function(p22, p23)
		if p23 ~= LocalPlayer then
			return
		end

		local ok = p22.ActionText == "Grab"

		if not ok then
			ok = not not p22.ActionText:find("Sell")
		end

		if ok then
			for _, v in ipairs(t1) do
				if v.Podium and v.Podium.Base and v.Podium.Base.Spawn then
					local PromptAttachment = v.Podium.Base.Spawn:FindFirstChild("PromptAttachment")

					if PromptAttachment and p22.Parent == PromptAttachment and v.GrabPrompt and v.SellPrompt then
						v.GrabPrompt.Enabled = true
						v.SellPrompt.Enabled = true
					end
				end
			end
		end
	end)

	local function v174(p24)
		local v175 = p24:gsub("%$", ""):gsub("/s", "")
		local n3 = 1

		if v175:find("K") then
			n3 = 1000
		elseif v175:find("M") then
			n3 = 1000000
		elseif v175:find("B") then
			n3 = 1e9
		elseif v175:find("T") then
			n3 = 1e12
		end

		local v177 = v175:gsub("[KMBT]", "")
		local v178 = tonumber(v177)

		if v178 then
			return v178 * n3
		end

		return nil
	end

	Cashout.ChildAdded:Connect(function(child)
		if child:IsA("TextLabel") then
			local v179 = v174(child.Text)

			if v179 then
				n1 += v179
			end
		end
	end)
	RunService.RenderStepped:Connect(function()
		for _, v in ipairs(t1) do
			v.Podium.Claim.Main.Collect.Enabled = true
			v.Podium.Claim.Main.Collect.Offline.Visible = false
			v.AnimTrack.TimePosition = workspace:GetServerTimeNow() % v.AnimLength
		end

		leaderstats.Cash.Value = Value_ + n1
		Currency.Text = "$" .. NumberUtils:ToString(Value_ + n1, 2)
	end)
	task.spawn(function()
		while task.wait(1) do
			for _, v in ipairs(t1) do
				local n4 = 1
				local Multiplier = PlotModel:FindFirstChild("Multiplier")

				if Multiplier and Multiplier:FindFirstChild("Main") then
					if Multiplier.Main:FindFirstChild("Amount") then
						n4 = tonumber(Multiplier.Main.Amount.Text:sub(2)) or 1
					end
				end

				if v.Mutation and Mutations[v.Mutation] then
					n4 += Mutations[v.Mutation].Modifier
				end

				if v.Traits then
					if #v.Traits > 0 then
						for _, trait in ipairs(v.Traits) do
							local v188 = Traits2[trait]

							if v188 and v188.MultiplierModifier then
								n4 += v188.MultiplierModifier
							end
						end
					end
				end

				v.Money += math.round(v.Generation * n4)
				v.Podium.Claim.Main.Collect.Collect.Text = "Collect <br/><font color=\"#73ff00\">$" .. NumberUtils:ToString(v.Money, 1) .. "</font>"
			end
		end
	end)

	return
end

if game.GameId ~= 66654135 then
	game:GetService("Lighting").ChildAdded:Connect(function(child)
		if child.Name == "DepthOfField" then
			child.InFocusRadius = 500
			child:Destroy()
		end
	end)

	local function v189()
		return {}
	end
	local function v190()
		require(game.ReplicatedStorage.Modules.SeedPackController)
		require(game.ReplicatedStorage.Data.SeedPackData)

		local PetRegistry = require(game.ReplicatedStorage.Data.PetRegistry)
		local PetUtilities = require(game.ReplicatedStorage.Modules.PetServices.PetUtilities)
		local ActivePetsService = game:GetService("ReplicatedStorage").Modules.PetServices.ActivePetsService
		local petModels = {}
		local v196 = game:GetObjects("rbxassetid://125869296102137")[1]
		local EggModels = game:GetService("ReplicatedStorage").Assets.Models.EggModels
		local SelectiveAssetReplication = require(game.ReplicatedStorage.Modules.SelectiveAssetReplication)
		local GetFarm = require(game.ReplicatedStorage.Modules.GetFarm)
		local GetMouseToWorld = require(game.ReplicatedStorage.Modules.GetMouseToWorld)
		local Manhattan2D = require(game.ReplicatedStorage.Code.Manhattan2D)
		local Notification = require(game.ReplicatedStorage.Modules.Notification)

		local function v203()
			return {
				Raccoon = CFrame.Angles(-1.5707963267948966, -1.5707963267948966, 0),
				Kitsune = CFrame.new()
			}
		end

		local v204 = v203()

		local function v205(p25)
			local n5 = 0

			for _ in pairs(p25) do
				n5 += 1
			end

			return n5
		end
		local function v208(p26)
			return SelectiveAssetReplication:GetAssetAsync("PetAssets", p26):Clone()
		end

		for k in pairs(PetRegistry.PetList) do
			task.spawn(function()
				petModels[k] = v208(k)
			end)
		end

		repeat
			task.wait()
		until v205(petModels) == v205(PetRegistry.PetList)

		local petNames = {}
		local t14 = {}
		local t15 = {}

		for _, child in pairs(EggModels:GetChildren()) do
			table.insert(t15, child.Name)
		end

		for _, v in petModels, nil, nil do
			table.insert(petNames, v.Name)
		end

		local function createTool(p27)
			local LocalPlayer = game.Players.LocalPlayer

			if not LocalPlayer then
				return
			end

			local v219 = EggModels:FindFirstChild(p27)
			local Tool = Instance.new("Tool")

			Tool.Name = v219.Name
			Tool.RequiresHandle = true
			Tool.ToolTip = v219.Name .. " Egg"

			local v221 = (Tool:GetAttribute("Quantity") or 0) + 1

			Tool.Name = v219.Name .. " x" .. v221
			Tool:SetAttribute("ItemType", "PetEgg")
			Tool:SetAttribute("EggName", v219.Name)
			Tool:SetAttribute("Quantity", v221)

			local Part = Instance.new("Part")

			Part.Name = "Handle"
			Part.Transparency = 1
			Part.Size = Vector3.new(0.5, 0.5, 0.5)
			Part.CanCollide = false
			Part.Anchored = false
			Part.Parent = Tool

			local v223 = v219:GetExtentsSize().Z / 2

			Tool.Grip = CFrame.new(0, -0.800000072, -1.4000001, 0, 1, 0, 0, 0, -1, -1, 0, 0)

			local Animation = Instance.new("Animation")

			Animation.Name = "Hold"
			Animation.AnimationId = "rbxassetid://113938302810353"
			Animation.Parent = Tool

			local clone = v219:Clone()

			clone.Parent = Part

			local PrimaryPart = clone.PrimaryPart or clone:FindFirstChildWhichIsA("BasePart")

			if PrimaryPart then
				local Weld = Instance.new("Weld")

				Weld.Name = "EggWeld"
				Weld.Part0 = Part
				Weld.Part1 = PrimaryPart
				Weld.C0 = CFrame.new(0, 0, 0)
				Weld.Parent = Part
			end

			for _, descendant in ipairs(clone:GetDescendants()) do
				if descendant:IsA("BasePart") then
					descendant.CanCollide = false
					descendant.Massless = true
					descendant.CollisionGroup = "Weapons"
				end
			end

			local u230

			Tool.Equipped:Connect(function()
				if LocalPlayer.Character then
					if LocalPlayer.Character:FindFirstChild("Humanoid") then
						local Humanoid = LocalPlayer.Character.Humanoid

						if Humanoid:FindFirstChildOfClass("Animator") then
							u230 = Humanoid.Animator:LoadAnimation(Animation)
							u230:Play()
						end
					end
				end
			end)
			Tool.Unequipped:Connect(function()
				if u230 then
					u230:Stop()
					u230:Destroy()
					u230 = nil
				end
			end)
			Tool.Parent = LocalPlayer.Backpack

			return Tool
		end
		local function v232(p28)
			local function v233(p29)
				for _, child in pairs(p29:GetChildren()) do
					if child:IsA("Tool") then
						if child.Name:match("^" .. p28 .. " Seed %[%u%d+%]$") then
							return child
						end
					end
				end

				return nil
			end

			return v233(game.Players.LocalPlayer.Backpack) or v233(game.Players.LocalPlayer.Character)
		end
		local function v236(p30)
			return tonumber(p30.Name:match("%[X?(%d+)%]")) or 1
		end
		local function v237(p31, p32)
			p31.Name = p31.Name:gsub("%[X?%d+%]", "[X" .. p32 .. "]")
		end
		local function spawnSeed(p33)
			if not p33 or p33 == "" then
				return
			end

			local v239 = v196

			if not v239 then
				return
			end

			local v240 = v239:FindFirstChild(p33)

			if not v240 then
				return
			end

			local v241 = v232(p33)

			if v241 then
				v237(v241, v236(v241) + 1)
			else
				local Tool = Instance.new("Tool")

				Tool.Name = p33 .. " Seed [X1]"
				Tool:SetAttribute("SeedName", p33)
				Tool:SetAttribute("Quantity", 1)
				Tool:SetAttribute("Placable", true)
				Tool.RequiresHandle = true
				Tool.CanBeDropped = true
				Tool.GripPos = Vector3.new(0.2, -0.45, 0.23)

				local clone = v240:Clone()

				clone.Name = "Handle"
				clone.Parent = Tool
				clone.CanCollide = false
				clone.Anchored = false
				Tool.Activated:Connect(function()
					local v244 = v236(Tool)

					if v244 > 1 then
						v237(Tool, v244 - 1)
					else
						Tool:Destroy()
					end
				end)
				Tool.Parent = game.Players.LocalPlayer.Backpack
			end
		end

		for _, v in v196:GetChildren() do
			table.insert(t14, v.Name)
		end

		local PetUtilities2 = require(game.ReplicatedStorage.Modules.PetServices.PetUtilities)

		local function v248(p34)
			return PetUtilities2:GetCurrentLevelXPCost(p34)
		end

		local t13 = {
			SpawnPet = function(p35, p36, p37, p38)
				local v249 = math.floor(PetUtilities:CalculateWeight(p36, p37) * 100) / 100
				local Tool = Instance.new("Tool")

				Tool.Name = p35 .. " [" .. tostring(math.floor(v249 * 100) / 100) .. " KG] [Age " .. tostring(p37) .. "]"
				Tool.RequiresHandle = true
				Tool:SetAttribute("PetNamee", p35)
				Tool:SetAttribute("Pet_UUID", "{" .. game:GetService("HttpService"):GenerateGUID(false) .. "}")
				Tool:SetAttribute("pet_data", game.HttpService:JSONEncode({
					HatchedFrom = "Common Egg",
					Name = "Bob",
					BaseWeight = p36,
					LevelProgress = v248(p37),
					Level = p37,
					Hunger = 0,
					Boosts = {}
				}))

				local v251 = PetRegistry.PetList[p35]
				local AnimationId = v251.Animations.Idle.AnimationId
				local Part = Instance.new("Part")

				Part.Name = "Handle"
				Part.Size = Vector3.new(0.1, 0.1, 0.1)
				Part.Transparency = 1
				Part.CanCollide = false
				Part.Massless = true
				Part.Anchored = false
				Part.Parent = Tool

				local clone = petModels[p35]:Clone()

				clone.Parent = Part

				local v255 = p36 + (v251.ModelScalePerLevel or 0.01) * p37
				local pivot = clone:GetPivot()

				clone:PivotTo(pivot)
				clone:ScaleTo(v255)
				clone:GetExtentsSize()
				clone:FindFirstChildWhichIsA("BasePart")

				local WeldOffset = v251.WeldOffset or CFrame.new()
				local Weld = Instance.new("Weld")

				Weld.Part0 = Part
				Weld.Part1 = clone.RootPart
				Weld.C0 = CFrame.new(0, 0, 0) * WeldOffset
				Weld.Parent = clone.RootPart

				for _, descendant in pairs(clone:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendant.Anchored = false
						descendant.CanCollide = false
						descendant.Massless = true
					end
				end

				Tool.Equipped:Connect(function()
					local AnimationController = clone:FindFirstChildOfClass("AnimationController")

					if AnimationController then
						local Animator = AnimationController:FindFirstChildOfClass("Animator")
						local playingAnimationTracks = Animator:GetPlayingAnimationTracks()

						for _, playingAnimationTrack in ipairs(playingAnimationTracks) do
							playingAnimationTrack:Stop()
							playingAnimationTrack:Destroy()
						end

						if Animator then
							local Animation = Instance.new("Animation")

							Animation.AnimationId = AnimationId

							local v267 = Animator:LoadAnimation(Animation)

							v267:Play()
							v267:AdjustWeight(math.huge, math.huge)
							v267:AdjustSpeed(1)
						end
					end
				end)
				Tool.Activated:Connect(function()
					local LocalPlayer = game.Players.LocalPlayer
					local v269 = GetFarm(LocalPlayer)

					if not v269 then
						return
					end

					local v270 = GetMouseToWorld()

					if not v270 then
						return
					end

					local Position = v270.Position
					local v272 = false

					for _, child in ipairs(v269:GetChildren()) do
						if child:IsA("BasePart") and child.CFrame and Manhattan2D(Position, child) then
							v272 = true

							break
						end
					end

					if not v272 then
						Notification.CreateNotification(tostring(math.random()), "You can only place your pets in your garden!")

						return
					end

					IS_PLACABLE = v204[p35]

					if not IS_PLACABLE then
						return
					end

					local attribute = Tool:GetAttribute("Pet_UUID")
					local attribute2 = Tool:GetAttribute("PetNamee")
					local clone2 = petModels[attribute2]:Clone()

					clone2:ScaleTo(v255)

					if not clone2 or not attribute or not attribute2 then
						return
					end

					LocalPlayer.Character.Humanoid:UnequipTools()
					Tool:Destroy()

					local Part2 = Instance.new("Part")

					Part2.Size = Vector3.new(2, 2, 2)
					Part2.Transparency = 1
					Part2.Material = Enum.Material.Neon
					Part2.Color = Color3.fromRGB(15, 119, 255)
					Part2.Anchored = true
					Part2.CanQuery = false
					Part2.CanCollide = false
					Part2:AddTag("PetTargetable")
					Part2:SetAttribute("UUID", attribute)
					Part2:SetAttribute("OWNER", tostring(LocalPlayer.Name))
					Part2.Name = "PetMover"

					local Y = v270.Position.Y
					local PetArea = v269:FindFirstChild("PetArea")

					if PetArea then
						Y = PetArea.Position.Y + Part2.Size.Y / 2
					end

					local vector3 = Vector3.new(v270.Position.X, Y, v270.Position.Z)

					Part2:PivotTo(CFrame.lookAt(vector3, vector3 + Vector3.new(0, 0, 1)))

					local _, v283 = clone2:GetBoundingBox()
					local v284 = v283.Y / 2

					clone2:SetPrimaryPartCFrame(Part2.CFrame + Vector3.new(0, v284, 0))
					Part2.Parent = workspace:WaitForChild("PetsPhysical")

					local Weld2 = Instance.new("Weld")

					Weld2.Name = "RootPart_PetMover_WELD"
					Weld2.Part0 = clone2:FindFirstChild("RootPart")
					Weld2.Part1 = Part2
					Weld2.C0 = (WeldOffset or CFrame.new()) * p38
					Weld2.C1 = CFrame.new()
					Weld2.Parent = Part2
					clone2.RootPart.Anchored = false
					clone2:SetPrimaryPartCFrame(Part2.CFrame)
					clone2.Parent = Part2

					local AnimationController = clone2:FindFirstChildOfClass("AnimationController")
					local Animator = AnimationController and AnimationController:FindFirstChildOfClass("Animator")
					local Animation = Instance.new("Animation")
					local Animation2 = Instance.new("Animation")
					local v290 = PetRegistry.PetList[attribute2]

					Animation.AnimationId = v290.Animations.Idle.AnimationId
					Animation2.AnimationId = v290.Animations.Walk.AnimationId

					local v291 = Animator:LoadAnimation(Animation)
					local v292 = Animator:LoadAnimation(Animation2)

					v291.Looped = true
					v292.Looped = true
					v291:Play()
					coroutine.wrap(function()
						local PetArea2 = v269:FindFirstChild("PetArea")

						if not PetArea2 then
							return
						end

						local MovementSpeed = v290.MovementSpeed or 5

						if not v290.YHeightScaler then
						end

						local raycastParams = RaycastParams.new()

						raycastParams.FilterDescendantsInstances = {
							clone2,
							Part2
						}
						raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

						local function v296(p39)
							local hit = workspace:Raycast(p39 + Vector3.new(0, 5, 0), Vector3.new(0, -20, 0), raycastParams)

							if hit then
								return hit.Position.Y
							end

							return p39.Y - 3
						end
						local function v298()
							local CFrame_ = PetArea2.CFrame
							local Size = PetArea2.Size

							for i = 1, 20 do
								local v302 = math.random(-Size.X / 2, Size.X / 2)
								local v303 = math.random(-Size.Z / 2, Size.Z / 2)
								local Position2 = (CFrame_ * CFrame.new(v302, 0, v303)).Position

								if Manhattan2D(Position2, PetArea2) then
									return Position2
								end
							end

							return Part2.Position
						end

						local LookVector = Part2.CFrame.LookVector

						while clone2.Parent do
							local v306 = v298()
							local Position2 = Part2.Position

							v296(v306)

							local vector32 = Vector3.new(Position2.X, 0, Position2.Z)
							local vector33 = Vector3.new(v306.X, 0, v306.Z)
							local Unit = (vector33 - vector32).Unit
							local v311 = (vector33 - vector32).Magnitude / MovementSpeed
							local now = tick()

							v292:Play()
							v291:Stop()

							while tick() - now < v311 do
								local v313 = vector32:Lerp(vector33, (tick() - now) / v311)
								local v314 = v284 / 2
								local v315 = v296(v313) + v314
								local Y2 = Part2.Position.Y
								local v317 = Y2 + (v315 - Y2) * 0.05

								LookVector = LookVector:Lerp(Unit, 0.1)

								local cFrame = CFrame.lookAt(Vector3.new(v313.X, v317, v313.Z), Vector3.new(v313.X, v317, v313.Z) + LookVector)

								Part2:PivotTo(cFrame)
								task.wait()
							end

							v292:Stop()
							v291:Play()
							task.wait(math.random(2, 5))
						end
					end)()
				end)
				Tool.Parent = game.Players.LocalPlayer.Backpack

				return Tool
			end,
			SpawnSeed = spawnSeed,
			SpawnEgg = createTool,
			PetModels = petModels,
			WhitelistPetSpawnerWithWeldOffsets = v204,
			PetNames = petNames
		}

		return t13
	end
	local function v319()
		local load = require(game.ReplicatedStorage:WaitForChild("Fsys")).load

		set_thread_identity(2)

		local ClientData = load("ClientData")
		local KindDB = load("KindDB")
		local RouterClient = load("RouterClient")
		local DownloadClient = load("DownloadClient")
		local AnimationManager = load("AnimationManager")
		local v327 = load("new:PetRigs")

		set_thread_identity(8)

		local t17 = {}
		local t18 = {}
		local u330
		local u331
		local u332

		local function v333(p40, p41)
			local v334 = ClientData.get(p40)
			local v335 = table.clone(v334)

			ClientData.predict(p40, p41(v335))
		end
		local function v336()
			return game:GetService("HttpService"):GenerateGUID(false)
		end
		local function v337(p42)
			if t17[p42] then
				return t17[p42]
			end

			local v338 = DownloadClient.promise_download_copy("Pets", p42):expect()

			t17[p42] = v338

			return v338
		end
		local function spawnPet(p43, p44)
			local v340 = v336()
			local t19

			set_thread_identity(2)
			v333("inventory", function(p45)
				local v342 = table.clone(p45.pets)

				t19 = {
					unique = v340,
					category = "pets",
					id = p43,
					kind = KindDB[p43].kind,
					newness_order = 0,
					properties = p44
				}
				v342[v340] = t19
				p45.pets = v342

				return p45
			end)
			set_thread_identity(8)
			t18[v340] = {
				data = t19,
				model = nil
			}

			return t19
		end
		local function v343(p46, p47)
			local PetModel = p46:FindFirstChild("PetModel")

			if not PetModel then
				return
			end

			for k, neonPart in pairs(p47.neon_parts) do
				local v347 = v327.get(PetModel).get_geo_part(PetModel, k)

				v347.Material = neonPart.Material
				v347.Color = neonPart.Color
			end
		end
		local function v348(p48)
			v333("pet_char_wrappers", function(p49)
				p48.unique = #p49 + 1
				p48.index = #p49 + 1
				p49[#p49 + 1] = p48

				return p49
			end)
		end
		local function v349(p50)
			v333("pet_state_managers", function(p51)
				p51[#p51 + 1] = p50

				return p51
			end)
		end
		local function v350(p52, p53)
			for k, v in pairs(p52) do
				if p53(v, k) then
					return k
				end
			end

			return nil
		end
		local function v353(p54)
			v333("pet_char_wrappers", function(p55)
				local v354 = v350(p55, function(p56)
					return p56.pet_unique == p54
				end)

				if not v354 then
					return p55
				end

				table.remove(p55, v354)

				for k, v in pairs(p55) do
					v.unique = k
					v.index = k
				end

				return p55
			end)
		end
		local function v357(p57)
			local v358 = t18[p57]

			if not v358 then
				return
			end

			if v358.model then
				v333("pet_state_managers", function(p58)
					local v359 = v350(p58, function(p59)
						return p59.char == v358.model
					end)

					if not v359 then
						return p58
					end

					local v360 = table.clone(p58)

					v360[v359] = table.clone(v360[v359])
					v360[v359].states = {}

					return v360
				end)

				return
			end
		end
		local function v361(p60, p61)
			local v362 = t18[p60]

			if not v362 then
				return
			end

			if v362.model then
				v333("pet_state_managers", function(p62)
					local function v363(p63)
						return p63.char == v362.model
					end

					local v364 = v350(p62, v363)

					if not v364 then
						return p62
					end

					local v365 = table.clone(p62)

					v365[v364] = table.clone(v365[v364])
					v365[v364].states = { {
						id = p61
					} }

					return v365
				end)

				return
			end
		end
		local function v366(p64)
			local Character = game.Players.LocalPlayer.Character

			if not Character then
				return false
			end

			if not Character.PrimaryPart then
				return false
			end

			local RidePosition = p64:FindFirstChild("RidePosition", true)

			if not RidePosition then
				return false
			end

			local Attachment = Instance.new("Attachment")

			Attachment.Parent = RidePosition
			Attachment.Position = Vector3.new(0, 1.237, 0)
			Attachment.Name = "SourceAttachment"

			local RigidConstraint = Instance.new("RigidConstraint")

			RigidConstraint.Name = "StateConnection"
			RigidConstraint.Attachment0 = Attachment
			RigidConstraint.Attachment1 = Character.PrimaryPart.RootAttachment
			RigidConstraint.Parent = Character

			return true
		end
		local function v371()
			v333("state_manager", function(p65)
				local v372 = table.clone(p65)

				v372.states = {}
				v372.is_sitting = false

				return v372
			end)
		end
		local function v373(p66)
			v333("state_manager", function(p67)
				local v374 = table.clone(p67)

				v374.states = { {
					id = p66
				} }
				v374.is_sitting = true

				return v374
			end)
		end
		local function v375(p68)
			local v376 = t18[p68]

			if not v376 then
				return
			end

			if v376.model then
				v333("pet_state_managers", function(p69)
					local v377 = v350(p69, function(p70)
						return p70.char == v376.model
					end)

					if v377 then
						table.remove(p69, v377)

						return p69
					end

					return p69
				end)

				return
			end
		end
		local function v378(p71)
			local v379 = t18[p71]

			if not v379 then
				return
			end

			if not v379.model then
				return
			end

			if u332 then
				u332:Stop()
				u332:Destroy()
			end

			local SourceAttachment = v379.model:FindFirstChild("SourceAttachment", true)

			if SourceAttachment then
				SourceAttachment:Destroy()
			end

			if game.Players.LocalPlayer.Character then
				for _, descendant in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if descendant:IsA("BasePart") and descendant:GetAttribute("HaveMass") then
						descendant.Massless = false
					end
				end
			end

			v357(p71)
			v371()
			v379.model:ScaleTo(1)
			u331 = nil
		end
		local function v383(p72, p73, p74)
			local v384 = t18[p72]

			if not v384 then
				return
			end

			if not v384.model then
				return
			end

			local LocalPlayer = game.Players.LocalPlayer

			if not LocalPlayer.Character then
				return
			end

			if not LocalPlayer.Character.PrimaryPart then
				return
			end

			u331 = p72
			v361(p72, p74)
			v373(p73)
			v384.model:ScaleTo(2)
			v366(v384.model)
			u332 = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(AnimationManager.get_track("PlayerRidingPet"))
			LocalPlayer.Character.Humanoid.Sit = true

			for _, descendant in pairs(LocalPlayer.Character:GetDescendants()) do
				if descendant:IsA("BasePart") and descendant.Massless == false then
					descendant.Massless = true
					descendant:SetAttribute("HaveMass", true)
				end
			end

			u332:Play()
		end
		local function v388(p75)
			v383(p75, "PlayerFlyingPet", "PetBeingFlown")
		end
		local function v389(p76)
			v383(p76, "PlayerRidingPet", "PetBeingRidden")
		end
		local function v390(p77)
			local v391 = t18[p77.unique]

			if not v391 then
				return
			end

			if not v391.model then
				return
			end

			v378(p77.unique)
			v353(p77.unique)
			v375(p77.unique)
			v391.model:Destroy()
			v391.model = nil
			u330 = nil
		end
		local function v392(p78)
			if u330 then
				v390(u330)
			end

			local clone = v337(p78.kind):Clone()

			clone.Parent = workspace
			t18[p78.unique].model = clone

			if p78.properties.neon or p78.properties.mega_neon then
				v343(clone, KindDB[p78.kind])
			end

			u330 = p78
			v348({
				char = clone,
				mega_neon = p78.properties.mega_neon,
				neon = p78.properties.neon,
				player = game.Players.LocalPlayer,
				entity_controller = game.Players.LocalPlayer,
				controller = game.Players.LocalPlayer,
				rp_name = p78.properties.rp_name or "",
				pet_trick_level = p78.properties.pet_trick_level,
				pet_unique = p78.unique,
				pet_id = p78.id,
				location = {
					full_destination_id = "housing",
					destination_id = "housing",
					house_owner = game.Players.LocalPlayer
				},
				pet_progression = {
					friendship_level = p78.properties.friendship_level,
					age = p78.properties.age,
					percentage = 0
				},
				are_colors_sealed = false,
				is_pet = true
			})
			v349({
				char = clone,
				player = game.Players.LocalPlayer,
				store_key = "pet_state_managers",
				is_sitting = false,
				chars_connected_to_me = {},
				states = {}
			})
		end

		local get = RouterClient.get

		local function v395(p79)
			return {
				InvokeServer = function(...)
					return p79(select(2, ...))
				end
			}
		end
		local function v396(p80)
			return {
				FireServer = function(...)
					return p80(select(2, ...))
				end
			}
		end

		local v397 = v395(function(p81)
			local v398 = t18[p81]

			if v398 then
				v392(v398.data)

				return true, {
					action = "equip",
					is_server = true
				}
			end
		end)
		local v399 = v395(function(p82)
			local v400 = t18[p82]

			if v400 then
				v390(v400.data)

				return true, {
					action = "unequip",
					is_server = true
				}
			end
		end)
		local v401 = v395(function(p83)
			v389(p83.pet_unique)
		end)
		local v402 = v395(function(p84)
			v388(p84.pet_unique)
		end)
		local v403 = v395(function()
			v378(u331)
		end)
		local v404 = v396(function()
			v378(u331)
		end)

		RouterClient.get = function(p85)
			if p85 == "ToolAPI/Equip" then
				return v397
			end

			if p85 == "ToolAPI/Unequip" then
				return v399
			end

			if p85 == "AdoptAPI/RidePet" then
				return v401
			end

			if p85 == "AdoptAPI/FlyPet" then
				return v402
			end

			if p85 == "AdoptAPI/ExitSeatStatesYield" then
				return v403
			end

			if p85 == "AdoptAPI/ExitSeatStates" then
				return v404
			end

			return get(p85)
		end

		for _, v in pairs(ClientData.get("pet_char_wrappers")) do
			get("ToolAPI/Unequip"):InvokeServer(v.pet_unique)
		end

		local InventoryDB = require(game.ReplicatedStorage.Fsys).load("InventoryDB")

		GetPetByName = function(p86)
			for _, pet in pairs(InventoryDB.pets) do
				if pet.name:lower() == p86:lower() then
					return pet.id
				end
			end

			return false
		end

		local t16 = {
			SpawnPet = spawnPet,
			FindPet = GetPetByName
		}

		return t16
	end
	local function v410()
	end

	local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/veryimportantrr/reverse-visual/refs/heads/main/gui"))()

	lib:Localization({
		Enabled = true,
		Prefix = "loc:",
		DefaultLanguage = "en",
		Translations = {
			en = {
				WINDUI_EXAMPLE = "Project Reverse [Fun]",
				WELCOME = "Welcome to new scripts vault!",
				LIB_DESC = "Enjoy using this script!",
				SETTINGS = "Settings",
				APPEARANCE = "Appearance",
				FEATURES = "Features",
				UTILITIES = "Utilities",
				UI_ELEMENTS = "UI Elements",
				CONFIGURATION = "Configuration",
				SAVE_CONFIG = "Save Configuration",
				LOAD_CONFIG = "Load Configuration",
				THEME_SELECT = "Select Theme",
				TRANSPARENCY = "Window Transparency"
			}
		}
	})
	lib.TransparencyValue = 0.2
	lib:SetTheme("Dark")

	local function v412(p87, p88, p89)
		local s2 = ""

		for i = 1, #p87 do
			local v415 = (i - 1) / (#p87 - 1)

			s2 ..= string.format("<font color=\"rgb(%d,%d,%d)\">%s</font>", math.floor((p88.R + (p89.R - p88.R) * v415) * 255), math.floor((p88.G + (p89.G - p88.G) * v415) * 255), math.floor((p88.B + (p89.B - p88.B) * v415) * 255), p87:sub(i, i))
		end

		return s2
	end

	lib:Popup({
		Title = v412("Project Reverse", Color3.fromHex("#6A11CB"), Color3.fromHex("#2575FC")),
		Icon = "sparkles",
		Content = "loc:LIB_DESC",
		Buttons = { {
			Title = "Get Started",
			Icon = "arrow-right",
			Variant = "Primary",
			Callback = function()
			end
		} }
	})

	local v416 = lib:CreateWindow({
		Title = "loc:WINDUI_EXAMPLE",
		Icon = "geist:window",
		Author = "loc:WELCOME",
		Folder = "WindUI_Example",
		Size = UDim2.fromOffset(580, 490),
		Theme = "Dark",
		User = {
			Enabled = true,
			Anonymous = true,
			Callback = function()
				lib:Notify({
					Title = "User Profile",
					Content = "User profile clicked!",
					Duration = 3
				})
			end
		},
		Acrylic = true,
		HideSearchBar = false,
		SideBarWidth = 200
	})

	v416:Tag({
		Title = "v1.2.0",
		Color = Color3.fromHex("#00FF8C")
	})
	v416:Tag({
		Title = "Public",
		Color = Color3.fromHex("#315dff")
	})
	v416:CreateTopbarButton("theme-switcher", "moon", function()
		lib:SetTheme(lib:GetCurrentTheme() == "Dark" and "Light" or "Dark")
		lib:Notify({
			Title = "Theme Changed",
			Content = "Current theme: " .. lib:GetCurrentTheme(),
			Duration = 2
		})
	end, 990)

	local t20 = {
		Main = v416:Section({
			Title = "Games",
			Opened = true
		}),
		Settings = v416:Section({
			Title = "loc:SETTINGS",
			Opened = true
		})
	}
	local t21 = {
		MM2 = t20.Main:Tab({
			Title = "Murder Mystery 2",
			Icon = "layout-grid"
		}),
		GAG = t20.Main:Tab({
			Title = "Grow A Garden",
			Icon = "sprout"
		}),
		ADOPT = t20.Main:Tab({
			Title = "Adopt Me",
			Icon = "paw-print"
		}),
		BB = t20.Main:Tab({
			Title = "Blade Ball - EMPTY",
			Icon = "circle"
		}),
		SAB = t20.Main:Tab({
			Title = "Steal A Brainrot",
			Icon = "brain"
		}),
		UNIVERSAL = t20.Main:Tab({
			Title = "Universal - EMPTY",
			Icon = "earth"
		}),
		Appearance = t20.Settings:Tab({
			Title = "Customization",
			Icon = "brush"
		})
	}

	MM2_API = {}
	GAG_API = {}
	ADOPT_API = {}
	BB_API = {}
	SAB_API = {}
	UNIVERSAL_API = {}
	MM2_API.LoadMM2 = function(p90, p91)
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local TweenService_ = game:GetService("TweenService")
		local VirtualUser = game:GetService("VirtualUser")
		local VirtualInputManager = game:GetService("VirtualInputManager")
		local LocalPlayer = Players.LocalPlayer
		local ItemGift = ReplicatedStorage.ItemGift
		local ChangeInventoryItem = ReplicatedStorage.Remotes.Inventory.ChangeInventoryItem
		local Item = require(ReplicatedStorage.Database.Sync.Item)
		local ProfileData = require(ReplicatedStorage.Modules.ProfileData)
		local BoxModule = require(ReplicatedStorage.Modules.BoxModule)
		local t22 = {}
		local Owned = ProfileData.Weapons.Owned or {}

		for k, v in pairs(Owned) do
			t22[k] = v
		end

		local function v435(p92)
			return t22[p92] or 0
		end
		local function v436(p93, p94)
			if not p93 or p93 == "" then
				return
			end

			local v437 = v435(p93) + p94

			t22[p93] = v437
			pcall(function()
				firesignal(ChangeInventoryItem.OnClientEvent, "Weapons", p93, v437)
			end)
			pcall(function()
				firesignal(ItemGift.OnClientEvent, p93, "Weapons", p94)
			end)
		end
		local function v438(p95)
			if not p95 or p95 == "" then
				return {}
			end

			local t23 = {}
			local v440 = p95:lower()

			for k in pairs(Item) do
				if string.find(k:lower(), v440) then
					table.insert(t23, k)
				end
			end

			table.sort(t23)

			return t23
		end
		local function v442()
			local MysteryBox = require(ReplicatedStorage.Database.Sync.MysteryBox)

			if not MysteryBox or next(MysteryBox) == nil then
				return nil
			end

			local t24 = {}

			for k in pairs(MysteryBox) do
				table.insert(t24, k)
			end

			return t24[math.random(1, #t24)]
		end
		local function v446(p96)
			if p96 then
				if p96 ~= "" then
					pcall(function()
						BoxModule.OpenBox(v442(), p96)
					end)
					v436(p96, 1)

					return
				end
			end
		end

		local v447 = p90:Tab({
			Title = "Weapon Spawner",
			Locked = false
		})

		v447:Paragraph({
			Title = "Item Spawner",
			Desc = "Spawn ANY weapon visually in 1 click!",
			Image = "sword",
			ImageSize = 20,
			Color = Color3.fromHex("#fa0808")
		})

		local u448
		local n6 = 1
		local v450

		v447:Input({
			Title = "Search Items",
			Value = "",
			Placeholder = "Enter item name...",
			Callback = function(p97)
				if p97 ~= "" then
					local v451 = v438(p97)

					if #v451 > 0 and v450 then
						v450:Refresh(v451)
					end
				end
			end
		})
		v450 = v447:Dropdown({
			Title = "Select Item",
			Values = { "Search above first..." },
			Value = "Search above first...",
			Callback = function(p98)
				if p98 and p98 ~= "Search above first..." then
					u448 = p98
				end
			end
		})
		v447:Slider({
			Title = "Quantity",
			Desc = "How many items to spawn",
			Value = {
				Min = 1,
				Max = 100,
				Default = 1
			},
			Step = 1,
			Callback = function(p99)
				n6 = p99
			end
		})
		v447:Button({
			Title = "Spawn Item",
			Callback = function()
				if u448 then
					local ok, result = pcall(function()
						v436(u448, n6)
					end)

					if not ok then
						warn("[Hub Spawner] Spawn failed: " .. tostring(result))
					end
				end
			end
		})

		local v454 = p90:Tab({
			Title = "Crate Opener",
			Locked = false
		})

		v454:Paragraph({
			Title = "Crate Opener",
			Desc = "Open crates and get any item visually!",
			Image = "package-plus",
			ImageSize = 20,
			Color = Color3.fromHex("#08b5fa")
		})

		local u455
		local v456

		v454:Input({
			Title = "Search Items",
			Value = "",
			Placeholder = "Enter item name...",
			Callback = function(p100)
				if p100 ~= "" then
					local v457 = v438(p100)

					if #v457 > 0 and v456 then
						v456:Refresh(v457)
					end
				end
			end
		})
		v456 = v454:Dropdown({
			Title = "Select Item",
			Values = { "Search above first..." },
			Value = "Search above first...",
			Callback = function(p101)
				if p101 and p101 ~= "Search above first..." then
					u455 = p101
				end
			end
		})
		v454:Button({
			Title = "Open Crate",
			Callback = function()
				if u455 then
					local ok, result = pcall(function()
						v446(u455)
					end)

					if not ok then
						warn("[Hub Spawner] Crate open failed: " .. tostring(result))
					end
				end
			end
		})

		local Remotes = ReplicatedStorage.Remotes
		local Gameplay = Remotes.Gameplay
		local Extras = Remotes.Extras
		local response = Gameplay.GetCurrentPlayerData:InvokeServer()
		local u464 = pcall(function()
			return Extras.AmElite:InvokeServer()
		end) and 50 or 40
		local Coins = response[LocalPlayer.Name] and response[LocalPlayer.Name].Coins or 0
		local n7 = 0
		local n8 = 0
		local u468 = false
		local u469 = response[LocalPlayer.Name] and not response[LocalPlayer.Name].Dead or false

		for _, v in pairs(getconnections(LocalPlayer.Idled)) do
			pcall(function()
				v:Disable()
			end)
		end

		LocalPlayer.Idled:connect(function()
			VirtualUser:ClickButton2(Vector2.new())
		end)
		Gameplay.PlayerDataChanged.OnClientEvent:Connect(function(...)
			response = table.unpack({ ... })
		end)
		Gameplay.CoinCollected.OnClientEvent:Connect(function(p102, p103)
			Coins = p103
			n7 += 1
		end)
		Gameplay.LoadingMap.OnClientEvent:Connect(function()
			Coins = 0
		end)
		Gameplay.RoundStart.OnClientEvent:Connect(function()
			local ok, result = pcall(function()
				return Extras.AmElite:InvokeServer()
			end)

			u464 = ok and result and 50 or 40
			u469 = true
		end)
		Gameplay.RoundEndFade.OnClientEvent:Connect(function()
			u469 = false
		end)

		local function v474(p104)
			return p104.Character or p104.CharacterAdded:Wait()
		end
		local function v475(p105)
			local v476 = v474(p105)
			local v477 = v476

			return v477 and v476:FindFirstChild("HumanoidRootPart")
		end
		local function v478(p106)
			local v479 = v474(p106)

			return v479 and v479:FindFirstChildOfClass("Humanoid")
		end
		local function v480()
			local Character = LocalPlayer.Character
			local Humanoid = Character and Character:FindFirstChildWhichIsA("Humanoid")

			return Character and Humanoid and Humanoid.Health > 0
		end
		local function v483(p107)
			return response[p107.Name] and not response[p107.Name].Dead
		end
		local function v484()
			for _, child in pairs(game.Workspace:GetChildren()) do
				if child:GetAttribute("MapID") then
					return child
				end
			end

			return nil
		end
		local function v487()
			return Coins >= u464
		end
		local function v488(p108)
			for k, v in pairs(response) do
				if k == p108.Name then
					return v.Role
				end
			end

			return "None"
		end
		local function v491()
			return v488(LocalPlayer) == "Murderer"
		end
		local function v492()
			local n9 = 0
			local v494 = false

			for k, v in pairs(response) do
				if k ~= LocalPlayer.Name and v and not v.Dead then
					n9 += 1

					if v.Role == "Murderer" then
						v494 = true
					end
				end
			end

			return v483(LocalPlayer) and n9 == 1 and v494
		end
		local function v497()
			u468 = true
			task.wait(0.5)

			if v480() then
				LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
			end

			repeat
				task.wait(0.2)
			until v480()

			u468 = false
		end
		local function v498()
			local v499 = v478(LocalPlayer)

			if LocalPlayer.Backpack:FindFirstChild("Knife") then
				if v499 then
					v499:EquipTool(LocalPlayer.Backpack:FindFirstChild("Knife"))
				end
			end

			local v500 = v474(LocalPlayer)

			if v500 then
				local Knife = v500:FindFirstChild("Knife")

				if Knife then
					for _, player in pairs(Players:GetPlayers()) do
						task.spawn(function()
							local v504 = v475(LocalPlayer)

							if player.Character and v504 and player ~= LocalPlayer and v483(player) then
								local HumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

								if HumanoidRootPart then
									task.spawn(function()
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
			end
		end

		local u506 = true

		local function v507(p109)
			if not u506 then
				task.wait(0.5)
			end

			if not v480() then
				return false
			end

			local v508 = LocalPlayer
			local u509 = false

			local function v510(p110)
				local v511 = p110:lower()

				if v511 == "all" or v511 == "others" then
					u509 = true

					return
				end

				if v511 == "random" then
					local players = Players:GetPlayers()

					table.remove(players, table.find(players, v508))

					return players[math.random(#players)]
				end

				for _, v in Players:GetPlayers() do
					if v == v508 then
						continue
					end

					if v.Name:lower():match("^" .. v511) then
						return v
					end

					if v.DisplayName:lower():match("^" .. v511) then
						return v
					end
				end
			end
			local function v515(p111)
				local Character = v508.Character

				if not Character or not Character.Parent then
					return false
				end

				local Humanoid = Character:FindFirstChildOfClass("Humanoid")

				if not Humanoid or Humanoid.Health <= 0 then
					return false
				end

				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

				if not HumanoidRootPart then
					return false
				end

				if HumanoidRootPart.Velocity.Magnitude < 50 then
					getgenv().OldPos = HumanoidRootPart.CFrame
				end

				local Character2 = p111.Character

				if not Character2 or not Character2.Parent then
					return false
				end

				local Humanoid2 = Character2:FindFirstChildOfClass("Humanoid")

				if not Humanoid2 or Humanoid2.Sit then
					return false
				end

				local HumanoidRootPart2 = Character2:FindFirstChild("HumanoidRootPart") or Character2:FindFirstChild("Head") or Character2:FindFirstChildWhichIsA("BasePart")

				if not HumanoidRootPart2 then
					return false
				end

				workspace.CurrentCamera.CameraSubject = HumanoidRootPart2
				workspace.FallenPartsDestroyHeight = math.huge

				local BodyVelocity = Instance.new("BodyVelocity")

				BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				BodyVelocity.Velocity = Vector3.zero
				BodyVelocity.Parent = HumanoidRootPart
				Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

				local now = tick()
				local n10 = 0
				local u525 = false

				local function v526()
					u525 = true
				end

				Humanoid.Died:Connect(v526)
				Character.AncestryChanged:Connect(function(child, parent)
					if not parent then
						v526()
					end
				end)

				while not u525 and v508.Character and v508.Character.Parent and HumanoidRootPart.Parent and Humanoid.Health > 0 and Character2.Parent and Humanoid2.Parent and HumanoidRootPart2.Parent == Character2 do
					n10 += 100
					HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart2.Position) * CFrame.new(0, 1.5, 0) * CFrame.Angles(math.rad(n10), 0, 0)
					HumanoidRootPart.Velocity = Vector3.new(5000000, 5000000, 5000000)
					HumanoidRootPart.RotVelocity = Vector3.new(5000000, 5000000, 5000000)
					RunService.Heartbeat:Wait()

					if HumanoidRootPart2.Velocity.Magnitude > 500 or now + 2 < tick() then
						break
					end
				end

				if BodyVelocity and BodyVelocity.Parent then
					BodyVelocity:Destroy()
				end

				if HumanoidRootPart.Parent then
					HumanoidRootPart.Velocity = Vector3.zero
					HumanoidRootPart.RotVelocity = Vector3.zero
				end

				Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
				pcall(function()
					workspace.CurrentCamera.CameraSubject = Humanoid
				end)
				workspace.FallenPartsDestroyHeight = -500

				if getgenv().OldPos and HumanoidRootPart.Parent and Humanoid.Health > 0 then
					while not u525 and v480() and HumanoidRootPart.Parent and Humanoid.Health > 0 do
						HumanoidRootPart.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)

						for _, v in Character:GetChildren() do
							if v:IsA("BasePart") then
								v.Velocity = Vector3.zero
								v.RotVelocity = Vector3.zero
							end
						end

						task.wait()

						if (HumanoidRootPart.Position - getgenv().OldPos.p).Magnitude < 25 then
							break
						end
					end
				end
			end

			for _, v in p109, nil, nil do
				local v531 = v510(v)

				if v531 then
					if v531 == v508 then
						continue
					end

					if v480() then
						v515(v531)

						continue
					end

					return false
				end
			end

			if u509 then
				for _, v in Players:GetPlayers() do
					if v ~= v508 then
						v515(v)
					end
				end
			end

			return true
		end

		local u534 = false
		local n11 = 0

		local function v536()
			u534 = true
			n11 = tick()
			task.delay(30, function()
				if tick() - n11 >= 30 then
					u534 = false
				end
			end)
		end

		local t25 = { "Any" }
		local s3 = "Under"
		local n12 = 22.7
		local u540 = false
		local u541 = false
		local u542 = false

		local function v543()
			local v544 = v475(LocalPlayer)

			if not v544 then
				return nil
			end

			local CoinContainer = v484() and v484():FindFirstChild("CoinContainer")

			if not CoinContainer then
				return nil
			end

			local t26 = {}

			for _, child in pairs(CoinContainer:GetChildren()) do
				if child:GetAttribute("CoinID") and not child:GetAttribute("Collected") and (table.find(t25, child:GetAttribute("CoinID")) or table.find(t25, "Any")) then
					local CoinVisual = child:FindFirstChild("CoinVisual")

					if CoinVisual and CoinVisual.MainCoin.Transparency == 0 then
						table.insert(t26, {
							coin = child,
							distance = (v544.Position - child.Position).Magnitude
						})
					end
				end
			end

			table.sort(t26, function(p112, p113)
				return p112.distance < p113.distance
			end)

			return t26[1] and t26[1].coin or nil
		end

		local Part
		local connection
		local connection2
		local Position
		local connection3

		local function v555(p114)
			getgenv().HubAutoFarmCoins = p114

			if p114 then
				Part = Instance.new("Part")
				Part.Name = "FarmFloatPart"
				Part.Size = Vector3.new(5, 0.1, 5)
				Part.CanCollide = true
				Part.Anchored = true
				Part.Parent = workspace
				Part.Transparency = 1
				Position = v475(LocalPlayer) and v475(LocalPlayer).Position or Vector3.zero
				connection = RunService.RenderStepped:Connect(function()
					if v475(LocalPlayer) then
						local pairs_ = pairs
						local v557 = v474(LocalPlayer)

						for _, descendant in pairs_(v557:GetDescendants()) do
							if descendant:IsA("BasePart") and descendant.CanCollide then
								descendant.CanCollide = false
							end
						end
					end
				end)
				connection3 = RunService.RenderStepped:Connect(function(dt)
					n8 += dt
				end)
				connection2 = RunService.Heartbeat:Connect(function()
					local v560 = v475(LocalPlayer)

					if v560 and Part and v480() and not u468 then
						local cFrame = Part.CFrame * CFrame.new(0, 3, 0)

						if v483(LocalPlayer) and not v487() and u469 then
							cFrame *= CFrame.Angles(math.rad(90), 0, 0)
						end

						v560.CFrame = cFrame
						v560.Velocity = Vector3.zero
						v560.RotVelocity = Vector3.zero
					end
				end)
			else
				if connection then
					connection:Disconnect()
					connection = nil
				end

				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end

				if connection3 then
					connection3:Disconnect()
					connection3 = nil
				end

				if Part then
					Part:Destroy()
					Part = nil
				end

				local v562 = v475(LocalPlayer)

				if v562 and Position then
					v562.Anchored = true
					v562.CFrame = CFrame.new(Position)
					v562.Velocity = Vector3.zero
					task.wait(0.7)
					v562.Anchored = false
				end
			end

			spawn(function()
				while getgenv().HubAutoFarmCoins do
					local v563 = v475(LocalPlayer)

					if not v563 then
						task.wait(1)
						task.wait()

						continue
					end

					if not v480() then
						task.wait(1)
					elseif v484() then
						local v564 = v483(LocalPlayer)
						local v565 = not v487()

						if v564 and v565 and u469 then
							local v566 = v543()

							if v566 then
								local v567 = s3 == "Under" and -6

								v567 = v567 or -2

								local cFrame = CFrame.new(v566.Position) * CFrame.new(0, v567 - 1, 0)
								local Magnitude = (v563.Position - cFrame.Position).Magnitude

								if Magnitude >= 200 then
									Part.CFrame = cFrame
								else
									local tween = TweenService_:Create(Part, TweenInfo.new(Magnitude / n12, Enum.EasingStyle.Linear), {
										CFrame = cFrame
									})

									tween:Play()

									if not v487() then
										tween.Completed:Wait()
										tween:Cancel()
									end
								end

								task.spawn(function()
									while v566 and v563 and not v566:GetAttribute("Collected") do
										for i = 0, 200 do
											task.spawn(function()
												pcall(function()
													firetouchinterest(v563, v566, 1)
													firetouchinterest(v563, v566, 0)
												end)
											end)
										end

										task.wait()
									end
								end)
								v566:Destroy()
							end
						else
							if u469 then
								if u542 and not v491() and v480() and v487() then
									if v492() then
										v497()
									else
										for k, v in pairs(response) do
											if k ~= LocalPlayer.Name and v.Role == "Murderer" then
												if not v.Dead then
													u468 = true
													v536()
													u506 = v507({ k })
													u468 = false
													task.wait(0.5)

													break
												end
											end
										end
									end
								elseif v491() and u540 and v487() and v483(LocalPlayer) and v480() then
									v498()
								end

								if u541 and v487() and v480() and not (v491() or u534 or not v483(LocalPlayer)) then
									v497()
								end
							end

							if Part and Part.Parent then
								Part.CFrame = CFrame.new(100, 0, 100)
							end

							task.wait(0.1)
						end
					elseif Part then
						Part.CFrame = CFrame.new(100, 0, 100)
					end

					task.wait()
				end
			end)
		end
		local function v574(p115)
			local connection4

			if p115 then
				connection4 = RunService.Heartbeat:Connect(function()
					for _, player in ipairs(Players:GetPlayers()) do
						if player ~= LocalPlayer and v474(player) then
							local ipairs_ = ipairs
							local v579 = v474(player)

							for _, descendant in ipairs_(v579:GetDescendants()) do
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

			return connection4
		end

		task.spawn(function()
			local PlayerGui = LocalPlayer:FindFirstChildWhichIsA("PlayerGui")

			if not PlayerGui then
				return
			end

			while task.wait(0.3) do
				if PlayerGui:FindFirstChild("DeviceSelect") or PlayerGui:FindFirstChild("Join") then
					break
				end
			end

			while task.wait(0.3) do
				local DeviceSelect = PlayerGui:FindFirstChild("DeviceSelect")
				local Join = PlayerGui:FindFirstChild("Join")

				if DeviceSelect then
					local Container = DeviceSelect:FindFirstChild("Container")

					if Container then
						local Button = Container:FindFirstChild("Phone") and Container.Phone:FindFirstChild("Button")

						if Button then
							local AbsolutePosition = Button.AbsolutePosition
							local AbsoluteSize = Button.AbsoluteSize

							VirtualInputManager:SendMouseButtonEvent(AbsolutePosition.X + AbsoluteSize.X / 2, AbsolutePosition.Y + AbsoluteSize.Y / 2, 0, true, game, 1)
							VirtualInputManager:SendMouseButtonEvent(AbsolutePosition.X + AbsoluteSize.X / 2, AbsolutePosition.Y + AbsoluteSize.Y / 2, 0, false, game, 1)
						end
					end
				end

				if Join then
					local Friends = Join:FindFirstChild("Friends")

					if Friends then
						local Play = Friends:FindFirstChild("Play")

						if Play and Play.Visible then
							firesignal(Play.MouseButton1Click)
						end
					end
				end

				if not (DeviceSelect or Join) then
					break
				end
			end
		end)

		local v591 = p91:Tab({
			Title = "Valentine Autofarm",
			Locked = false
		})

		v591:Section({
			Title = "Session Statistics"
		})

		local function v592(p116)
			return string.format("%02d:%02d:%02d", math.floor(p116 / 3600), math.floor(p116 / 60) % 60, p116 % 60)
		end
		local function v593(p117)
			return tostring(p117):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
		end

		local v594 = v591:Paragraph({
			Title = "Session Progress",
			Desc = "<b>Time:</b> 00:00:00\n<b>Coins:</b> 0 | <b>Per Hour:</b> 0",
			Locked = false
		})
		local n13 = 0

		RunService.Heartbeat:Connect(function()
			if tick() - n13 > 0.5 then
				n13 = tick()

				local v596 = v594
				local SetDesc = v594.SetDesc
				local format = string.format
				local s4 = "<b>Time:</b> %s\n<b>Coins:</b> %s | <b>Per Hour:</b> %s"

				SetDesc(v596, format(s4, v592(n8), v593(n7), n8 > 0 and v593(math.round(n7 / n8 * 3600)) or "0"))
			end
		end)
		v591:Divider()
		v591:Section({
			Title = "Farming Options"
		})
		v591:Toggle({
			Title = "Enable Coin Auto Farm",
			Type = "Toggle",
			Default = false,
			Callback = function(p118)
				v555(p118)
			end
		})
		v591:Dropdown({
			Title = "Coin Types",
			Values = {
				"Any",
				"Candy",
				"BeachBall",
				"Coin",
				"SnowToken",
				"Egg"
			},
			Value = { "Any" },
			Multi = true,
			AllowNone = false,
			Callback = function(p119)
				t25 = p119
			end
		})
		v591:Dropdown({
			Title = "Teleport Mode",
			Values = {
				"Under",
				"Normal"
			},
			Value = "Under",
			Multi = false,
			AllowNone = false,
			Callback = function(p120)
				s3 = p120
			end
		})
		v591:Slider({
			Title = "Farm Speed",
			Desc = "Above 22 might kick",
			Step = 0.1,
			Value = {
				Min = 19,
				Max = 26,
				Default = 22.7
			},
			Callback = function(p121)
				n12 = p121
			end
		})
		v591:Divider()
		v591:Section({
			Title = "On Full Bag"
		})
		v591:Toggle({
			Title = "Kill All (Knife Required)",
			Type = "Toggle",
			Default = false,
			Callback = function(p122)
				u540 = p122
			end
		})
		v591:Toggle({
			Title = "Reset On Full Bag",
			Type = "Toggle",
			Default = false,
			Callback = function(p123)
				u541 = p123
			end
		})
		v591:Toggle({
			Title = "Fling Murderer On Full Bag",
			Type = "Toggle",
			Default = false,
			Callback = function(p124)
				u542 = p124
			end
		})
		v591:Divider()
		v591:Section({
			Title = "Utilities"
		})

		local u600

		v591:Toggle({
			Title = "Anti Fling",
			Type = "Toggle",
			Default = false,
			Callback = function(p125)
				if u600 then
					u600:Disconnect()
					u600 = nil
				end

				if p125 then
					u600 = v574(true)
				end
			end
		})
		v591:Toggle({
			Title = "Disable Rendering",
			Desc = "Lowers CPU usage (Black Screen)",
			Default = false,
			Callback = function(p126)
				game:GetService("RunService"):Set3dRenderingEnabled(not p126)
			end
		})
	end
	GAG_API.LoadGAG = function(p127, p128, p129, p130)
		local v601 = v190()
		local v602 = game:GetObjects("rbxassetid://125869296102137")[1]
		local EggModels = game:GetService("ReplicatedStorage").Assets.Models.EggModels
		local SeedPackController = require(game.ReplicatedStorage.Modules.SeedPackController)
		local SeedPackData = require(game.ReplicatedStorage.Data.SeedPackData)
		local t27 = {}
		local t28 = {}

		for _, child in pairs(EggModels:GetChildren()) do
			table.insert(t28, child.Name)
		end

		for _, v in v602:GetChildren() do
			table.insert(t27, v.Name)
		end

		local s5 = "Raccoon"
		local s6 = "Carrot"
		local s7 = "Night Egg"

		p127:Dropdown({
			Title = "Select Pet To Spawn",
			Values = v601.PetNames,
			Value = s5,
			Callback = function(p131)
				s5 = p131 or "Raccoon"
			end
		})

		local n14 = 0.1

		p127:Input({
			Title = "Select Pet Base Weight",
			Value = n14,
			Callback = function(p132)
				n14 = p132 or 0.1
			end
		})

		local n15 = 1

		p127:Input({
			Title = "Select Pet Age",
			Value = n15,
			Callback = function(p133)
				n15 = p133 or 0.1
			end
		})
		p127:Button({
			Title = "Spawn Pet",
			Callback = function()
				if s5 and n14 then
					if n15 then
						v601.SpawnPet(s5, n14, n15, v601.WhitelistPetSpawnerWithWeldOffsets[s5])
					end
				end
			end
		})
		p127:Divider()
		p127:Dropdown({
			Title = "Select Seed To Spawn",
			Values = t27,
			Value = s6,
			Callback = function(p134)
				s6 = p134 or "Carrot"
			end
		})
		p127:Button({
			Title = "Spawn Seed",
			Callback = function()
				if s6 then
					v601.SpawnSeed(s6)
				end
			end
		})
		p127:Divider()
		p127:Dropdown({
			Title = "Select Egg To Spawn",
			Values = t28,
			Value = s7,
			Callback = function(p135)
				s7 = p135 or "Night Egg"
			end
		})
		p127:Button({
			Title = "Spawn Egg",
			Callback = function()
				if s7 then
					v601.SpawnEgg(s7)
				end
			end
		})
		p127:Divider()
		p129:Paragraph({
			Title = "Weather Settings",
			Desc = "This probably lagged u but trust this thing!",
			Image = "zap",
			ImageSize = 20,
			Color = Color3.fromHex("#30ff6a")
		})

		local t29 = {
			EVERYTHING = false
		}

		p129:Toggle({
			Title = "Toggle ALL Weather Events",
			Desc = "This button only toggles all weather events in game!",
			Value = false,
			Callback = function(p136)
				t29.EVERYTHING = p136

				for _, v in game.HttpService:JSONDecode(game.Workspace:GetAttribute("AllWeather")) do
					if not string.find(v, "Brainrot") then
						game.Workspace:SetAttribute(v, p136)
					end
				end
			end
		})

		for _, v in game.HttpService:JSONDecode(game.Workspace:GetAttribute("AllWeather")) do
			t29[v] = false
			p129:Toggle({
				Title = "Toggle Weather Event: " .. v,
				Desc = "This button only toggles " .. v .. " event!",
				Value = false,
				Callback = function(p137)
					t29[v] = p137

					if not string.find(v, "Brainrot") then
						game.Workspace:SetAttribute(v, p137)
					end
				end
			})
		end

		p130:Paragraph({
			Title = "Spin Packs!",
			Desc = "Get Any item from Any pack in game!",
			Image = "award",
			ImageSize = 20,
			Color = Color3.fromHex("#30ff6a")
		})

		for k, pack in pairs(SeedPackData.Packs) do
			local t30 = {}

			for i = 1, #pack.Items do
				table.insert(t30, pack.Items[i].RewardId)
			end

			p130:Dropdown({
				Title = k,
				Values = t30,
				Value = "",
				Callback = function(p138)
					if p138 == "" then
						return
					end

					local n16 = 1

					for i, item in ipairs(SeedPackData.Packs[k].Items) do
						if item.Name == p138 or item.RewardId == p138 then
							n16 = i
							SeedPackController:Spin({
								seedPackType = k,
								resultIndex = n16
							})

							return
						end
					end

					SeedPackController:Spin({
						seedPackType = k,
						resultIndex = n16
					})
				end
			})
		end

		return true
	end
	ADOPT_API.LoadADM = function(p139)
		local v629 = v319()
		local s8 = "Normal"
		local s9 = "Shadow Dragon"

		set_thread_identity(6)
		p139:Dropdown({
			Title = "Select Pet Neon Type (FR/NFR/MFR)",
			Values = {
				"Normal",
				"Neon",
				"Mega Neon"
			},
			Value = s8,
			Callback = function(p140)
				s8 = p140 or "Normal"
			end
		})
		p139:Input({
			Title = "Select Pet Name",
			Value = s9,
			Callback = function(p141)
				s9 = p141 or "Cat"
			end
		})
		p139:Button({
			Title = "Spawn Pet",
			Callback = function()
				local v632 = v629.FindPet(s9)

				if v632 then
					if s8 == "Normal" then
						v629.SpawnPet(v632, {
							pet_trick_level = 0,
							rideable = true,
							flyable = true,
							friendship_level = 0,
							age = 1,
							ailments_completed = 0,
							rp_name = ""
						})
					elseif s8 == "Neon" then
						v629.SpawnPet(v632, {
							pet_trick_level = 0,
							neon = true,
							rideable = true,
							flyable = true,
							friendship_level = 0,
							age = 1,
							ailments_completed = 0,
							rp_name = ""
						})
					elseif s8 == "Mega Neon" then
						v629.SpawnPet(v632, {
							pet_trick_level = 0,
							mega_neon = true,
							rideable = true,
							flyable = true,
							friendship_level = 0,
							age = 1,
							ailments_completed = 0,
							rp_name = ""
						})
					end
				end
			end
		})
	end
	SAB_API.LoadSAB = function()
		v410()
	end
	BB_API.LoadBB = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/veryimportantrr/reverse-visual/refs/heads/main/imported/bb.luau"))
	end
	UNIVERSAL_API.LoadUniversal = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/veryimportantrr/reverse-visual/refs/heads/main/imported/universal.luau"))
	end

	if game.GameId == 7709344486 then
		local v633 = t21.SAB:Section({
			Title = "Pet Spawner",
			Icon = "wallpaper"
		})
		local v634 = t21.SAB:Section({
			Title = "Farming",
			Icon = "dumbbell"
		})

		SAB_API.LoadSAB(v633, v634)
	end

	if game.GameId == 66654135 then
		local v635 = t21.MM2:Section({
			Title = "Game Vulns",
			Icon = "wallpaper"
		})
		local v636 = t21.MM2:Section({
			Title = "Farming",
			Icon = "dumbbell"
		})

		MM2_API.LoadMM2(v635, v636)
	else
		t21.MM2:Paragraph({
			Title = "U are in wrong game!",
			Desc = "Please go to MM2 if u want to use it features, it cant load in different game"
		})
	end

	if game.GameId == 7436755782 then
		local v637 = t21.GAG:Section({
			Title = "Spawner",
			Icon = "wallpaper"
		})
		local v638 = t21.GAG:Section({
			Title = "Weather",
			Icon = "umbrella"
		})
		local v639 = t21.GAG:Section({
			Title = "Seed Packs",
			Icon = "package-open"
		})

		GAG_API.LoadGAG(v637, t21.GAG:Section({
			Title = "Farming",
			Icon = "dumbbell"
		}), v638, v639)
	else
		t21.GAG:Paragraph({
			Title = "U are in wrong game!",
			Desc = "Please go to GAG if u want to use it features, it cant load in different game"
		})
	end

	if game.GameId == 383310974 then
		local v640 = t21.ADOPT:Section({
			Title = "Pet Spawner",
			Icon = "wallpaper"
		})
		local v641 = t21.ADOPT:Section({
			Title = "Farming",
			Icon = "dumbbell"
		})

		ADOPT_API.LoadADM(v640, v641)
	end

	if game.GameId == 4777817887 then
		local v642 = t21.BB:Section({
			Title = "Visuals",
			Icon = "wallpaper"
		})
		local v643 = t21.BB:Section({
			Title = "Farming",
			Icon = "dumbbell"
		})

		BB_API.LoadBB(v642, v643)
	else
		t21.BB:Paragraph({
			Title = "U are in wrong game!",
			Desc = "Please go to Blade Ball if u want to use it features, it cant load in different game"
		})
	end

	local v644 = t21.UNIVERSAL:Section({
		Title = "Universal",
		Icon = "earth"
	})

	v644:Paragraph({
		Title = "Roblox Universal Visuals/Scripts",
		Desc = "Features here can apply to every aspect of game, friends/coregui/names/whatever"
	})
	UNIVERSAL_API.LoadUniversal(v644)
	t21.Appearance:Paragraph({
		Title = "Customize Interface",
		Desc = "Personalize your experience",
		Image = "palette",
		ImageSize = 20,
		Color = "White"
	})

	local t31 = {}

	for k in pairs(lib:GetThemes()) do
		table.insert(t31, k)
	end

	table.sort(t31)

	local u647 = true
	local u648 = true
	local v649 = t21.Appearance:Dropdown({
		Title = "loc:THEME_SELECT",
		Values = t31,
		Value = "Dark",
		Callback = function(p142)
			u648 = false
			lib:SetTheme(p142)
			lib:Notify({
				Title = "Theme Applied",
				Content = p142,
				Icon = "palette",
				Duration = 2
			})
			u648 = true
		end
	})

	t21.Appearance:Slider({
		Title = "loc:TRANSPARENCY",
		Value = {
			Min = 0,
			Max = 1,
			Default = 0.2
		},
		Step = 0.1,
		Callback = function(p143)
			lib.TransparencyValue = tonumber(p143)
			v416:ToggleTransparency(tonumber(p143) > 0)
		end
	})

	local v650 = t21.Appearance:Toggle({
		Title = "Enable Dark Mode",
		Desc = "Use dark color scheme",
		Value = true,
		Callback = function(p144)
			if u647 then
				lib:SetTheme(p144 and "Dark" or "Light")
			end

			if u648 then
				v649:Select(p144 and "Dark" or "Light")
			end
		end
	})

	lib:OnThemeChange(function(p145)
		u647 = false
		v650:Set(p145 == "Dark")
		u647 = true
	end)
	t21.Appearance:Button({
		Title = "Create New Theme",
		Icon = "plus",
		Callback = function()
			v416:Dialog({
				Title = "Create Theme",
				Content = "This feature is coming soon!",
				Buttons = { {
					Title = "OK",
					Variant = "Primary"
				} }
			})
		end
	})
	t21.Appearance:Paragraph({
		Title = "by Egorikusa",
		Desc = "discord.gg/project-reverse",
		Image = "users",
		ImageSize = 20,
		Color = "Grey",
		Buttons = { {
			Title = "Copy Link",
			Icon = "copy",
			Variant = "Tertiary",
			Callback = function()
				setclipboard("https://discord.gg/project-reverse")
				lib:Notify({
					Title = "Copied!",
					Content = "Server link copied to clipboard",
					Duration = 2
				})
			end
		} }
	})
	v416:OnClose(function()
	end)
	v416:OnDestroy(function()
	end)

	local ScreenGui = Instance.new("ScreenGui")

	ScreenGui.Name = "CustomGUI"
	ScreenGui.Parent = gethui and gethui() or game.CoreGui
	ScreenGui.ResetOnSpawn = false

	local ViewportSize = workspace.CurrentCamera.ViewportSize
	local v653 = math.clamp(math.min(ViewportSize.X, ViewportSize.Y) * 0.06, 40, 100)
	local TextButton = Instance.new("TextButton")

	TextButton.Name = "ToggleButton"
	TextButton.Size = UDim2.new(0, v653, 0, v653)
	TextButton.Position = UDim2.new(0, v653 * 0.5, 0, v653 * 0.5)
	TextButton.BackgroundTransparency = 1
	TextButton.Text = "≡"
	TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.TextScaled = true
	TextButton.Font = Enum.Font.GothamBold
	TextButton.AutoButtonColor = false
	TextButton.Parent = ScreenGui
	TextButton.Active = true
	TextButton.Draggable = true
	TextButton.BorderSizePixel = 0

	local Frame = Instance.new("Frame")

	Frame.Size = UDim2.new(1, 0, 1, 0)
	Frame.BackgroundTransparency = 0.85
	Frame.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
	Frame.ZIndex = 0
	Frame.Parent = TextButton

	local UICorner = Instance.new("UICorner")

	UICorner.CornerRadius = UDim.new(0, v653 * 0.3)
	UICorner.Parent = Frame

	local UIStroke = Instance.new("UIStroke")

	UIStroke.Thickness = math.clamp(v653 / 25, 2, 4)
	UIStroke.Color = Color3.fromRGB(0, 255, 150)
	UIStroke.Transparency = 0.1
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke.Parent = TextButton

	local color3 = Color3.fromRGB(0, 255, 150)
	local color32 = Color3.fromRGB(255, 70, 70)
	local color33 = Color3.fromRGB(255, 255, 255)
	local u661 = true
	local TweenService_ = game:GetService("TweenService")

	local function v663(p146, p147, p148)
		TweenService_:Create(p146, TweenInfo.new(p148, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), p147):Play()
	end

	TextButton.MouseEnter:Connect(function()
		v663(UIStroke, {
			Thickness = UIStroke.Thickness + 1,
			Color = color33
		}, 0.15)
	end)
	TextButton.MouseLeave:Connect(function()
		local v664 = u661 and color3 or color32

		v663(UIStroke, {
			Thickness = math.clamp(v653 / 25, 2, 4),
			Color = v664
		}, 0.2)
	end)
	TextButton.MouseButton1Click:Connect(function()
		u661 = not u661

		if u661 then
			v663(Frame, {
				BackgroundColor3 = color3
			}, 0.25)
			v663(UIStroke, {
				Color = color3
			}, 0.25)

			if v416 and v416.Open then
				v416:Open()
			end
		else
			v663(Frame, {
				BackgroundColor3 = color32
			}, 0.25)
			v663(UIStroke, {
				Color = color32
			}, 0.25)

			if v416 and v416.Close then
				v416:Close()
			end
		end
	end)
	workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
		local ViewportSize2 = workspace.CurrentCamera.ViewportSize
		local v666 = math.clamp(math.min(ViewportSize2.X, ViewportSize2.Y) * 0.06, 40, 100)

		v663(TextButton, {
			Size = UDim2.new(0, v666, 0, v666)
		}, 0.3)
		v663(TextButton, {
			Position = UDim2.new(0, v666 * 0.5, 0, v666 * 0.5)
		}, 0.3)
		UICorner.CornerRadius = UDim.new(0, v666 * 0.3)
		UIStroke.Thickness = math.clamp(v666 / 25, 2, 4)
	end)

	return
end

if getgenv().mm2Visual then
	return
end

getgenv().mm2Visual = true

repeat
	task.wait()
until game:IsLoaded()

local lib = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local function v668(p149)
	local v669 = p149:Tab({
		Title = "Supported Games",
		Icon = "layout-grid",
		Locked = false
	})

	p149:Tab({
		Title = "Credits",
		Icon = "layout-grid",
		Locked = false
	}):Paragraph({
		Title = "Server",
		Desc = "discord.gg/project-reverse"
	})

	local v670 = "Features:\n - " .. table.concat({
		"feature 1",
		"feature 2"
	}, ",\n - ")
	local v671 = "Features:\n - " .. table.concat({ "pet spawner" }, ",\n - ")
	local v672 = "Features:\n - " .. table.concat({ "pet spwaner" }, ",\n - ")
	local v673 = "Features:\n - " .. table.concat({ "brenrot" }, ",\n - ")

	local function v674(p150)
		pcall(function()
			game:GetService("TeleportService"):Teleport(p150)
		end)
		task.wait(2)
		lib:Popup({
			Title = "Teleportation Failed",
			Icon = "info",
			Content = "Please launch this game manually",
			Buttons = { {
				Title = "Okay",
				Icon = "arrow-right",
				Callback = function()
				end,
				Variant = "Primary"
			} }
		})
	end

	v669:Paragraph({
		Title = "Murder Mystery 2",
		Desc = v670,
		Image = "package-plus",
		ImageSize = 20,
		Color = "Red",
		Buttons = { {
			Icon = "slice",
			Title = "Teleport",
			Callback = function()
				v674(142823291)
			end
		} }
	})
	v669:Paragraph({
		Title = "Adopt Me",
		Desc = v671,
		Image = "package-plus",
		ImageSize = 20,
		Color = "White",
		Buttons = { {
			Icon = "slice",
			Title = "Teleport",
			Callback = function()
				v674(920587237)
			end
		} }
	})
	v669:Paragraph({
		Title = "Grow A Garden",
		Desc = v672,
		Image = "package-plus",
		ImageSize = 20,
		Color = "Green",
		Buttons = { {
			Icon = "slice",
			Title = "Teleport",
			Callback = function()
				v674(126884695634066)
			end
		} }
	})
	v669:Paragraph({
		Title = "Steal A Brainrot",
		Desc = v673,
		Image = "package-plus",
		ImageSize = 20,
		Color = "Blue",
		Buttons = { {
			Icon = "slice",
			Title = "Teleport",
			Callback = function()
				v674(109983668079237)
			end
		} }
	})
end

if not table.find({
	66654135,
	383310974,
	7709344486,
	7436755782
}, game.GameId) then
	local v675 = lib:CreateWindow({
		Title = "Project Reverse [Not Found]",
		Icon = "eye",
		Transparent = true,
		Author = "By Project Reverse [Egorikusa]"
	})

	v668(v675)
end

if game.GameId == 66654135 then
	local v676 = lib:CreateWindow({
		Title = "Project Reverse [MM2]",
		Icon = "slice",
		Transparent = true,
		Author = "By Project Reverse [Egorikusa]"
	})
	local Players = game:GetService("Players")

	Players.LocalPlayer:WaitForChild("PlayerGui")

	local HttpService = game:GetService("HttpService")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local RunService = game:GetService("RunService")

	game:GetService("Workspace")

	local VirtualUser = game:GetService("VirtualUser")
	local LocalPlayer = Players.LocalPlayer
	local CoinCollected = ReplicatedStorage.Remotes.Gameplay.CoinCollected
	local RoundStart = ReplicatedStorage.Remotes.Gameplay.RoundStart
	local t32 = {
		"MouseButton1Click",
		"MouseButton1Down",
		"Activated"
	}

	TapUI = function(p151, p152, p153)
		if p152 == "Active Check" then
			if not p151.Active then
				return
			end

			p151 = p151[p153]
		end

		if p152 == "Text Check" then
			if p151 ~= "^" then
				return
			end

			p151 = p153
		end

		for _, v in pairs(t32) do
			for _, v2 in pairs(getconnections(p151[v])) do
				v2.Function()
			end
		end
	end

	repeat
		pcall(function()
			TapUI(LocalPlayer.PlayerGui.DeviceSelect.Container.Tablet.Button)
		end)
		pcall(function()
			TapUI(game:GetService("Players").LocalPlayer.PlayerGui.Join.Friends.Play)
		end)
		task.wait(1)
	until LocalPlayer.PlayerGui:FindFirstChild("MainGUI")

	DefaultConfig = {
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
	deep_copy_table = function(p154)
		local v690 = table.clone(p154)

		for k, v in pairs(v690) do
			if type(v) == "table" then
				v690[k] = table.clone(v)
			end
		end

		return v690
	end
	Config = deep_copy_table(DefaultConfig)
	Players.LocalPlayer.Idled:connect(function()
		VirtualUser:ClickButton2(Vector2.new())
	end)
	TeleportUnderMap = function()
		if workspace:FindFirstChild("safespot") then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-106, 87.5, 2)
		else
			safespot = Instance.new("Part")
			safespot.Name = "safespot"
			safespot.Size = Vector3.new(25, 3, 25)
			safespot.Position = Vector3.new(-106, 83, 2)
			safespot.Parent = workspace
			safespot.Anchored = true
			safespot.CanCollide = true
			safespot.Transparency = 0
			task.wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-106, 87.5, 2)
			task.wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-106, 87.5, 2)
			task.wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-106, 87.5, 2)
		end
	end

	local t33 = {
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

	PlayEmote = function(p155)
		game:GetService("ReplicatedStorage").Remotes.Misc.PlayEmote:Fire(p155)
	end
	task.spawn(function()
		while task.wait(1 / Config.Emotes.EmoteSpamSpeed) do
			if Config.Emotes.AutoPlayEmotes then
				PlayEmote(t33[math.random(1, #t33)])
			end
		end
	end)
	destroyplayers = function()
		for _, player in pairs(game.Players:GetPlayers()) do
			if player ~= LocalPlayer then
				if game.Workspace:WaitForChild(player.Name, 0.01) then
					game.Workspace[player.Name]:Destroy()
				end
			end
		end
	end
	DestroyMapFunc = function()
		for _, child in pairs(game.Workspace:GetChildren()) do
			if child:IsA("Model") and child:FindFirstChild("CoinContainer") then
				for _, child2 in pairs(child:GetChildren()) do
					if child2.Name ~= "CoinContainer" then
						child2:Destroy()
					end
				end
			end
		end
	end
	clipclop = function()
		for _, descendant in pairs(LocalPlayer.Character:GetDescendants()) do
			if descendant:IsA("BasePart") and descendant.CanCollide == true and descendant.Name ~= floatName then
				descendant.CanCollide = false
			end
		end
	end
	Noclipping = RunService.Stepped:Connect(function()
		if Config.Noclip and LocalPlayer.Character then
			if LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and LocalPlayer.Character.Humanoid.Health > 0 then
				if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					clipclop()
				end
			end
		end
	end)
	RandomItemFromInventory = function()
		local t34 = {}

		for _, weapon in pairs(require(game:GetService("ReplicatedStorage").Modules.InventoryModule).MyInventory.Data.Weapons) do
			for k in weapon, nil, nil do
				table.insert(t34, k)
			end
		end

		return t34[math.random(1, #t34)]
	end
	RunService.Stepped:Connect(function()
		if Config.Emotes.AutoPlaySelectedEmote then
			PlayEmote(Config.Emotes.SelectedEmote)
		end

		if Config.ShuffleWeapons then
			local t35 = {
				RandomItemFromInventory(),
				"Weapons"
			}

			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Inventory"):WaitForChild("Equip"):FireServer(unpack(t35))
		end

		if game:GetService("CoreGui"):FindFirstChild("CenteredLabelGui") then
			if game:GetService("CoreGui"):FindFirstChild("CenteredLabelGui"):FindFirstChild("CenteredTextLabel") then
				game:GetService("CoreGui").CenteredLabelGui.CenteredTextLabel.Visible = Config.CoinFarm.StatsOverlay
			end
		end

		if LocalPlayer.Character then
			if LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and LocalPlayer.Character.Humanoid.Health > 0 then
				if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					if Config.Sliders.Speed ~= LocalPlayer.Character.Humanoid.WalkSpeed then
						LocalPlayer.Character.Humanoid.WalkSpeed = Config.Sliders.Speed
					end

					if Config.Sliders.Jump ~= LocalPlayer.Character.Humanoid.JumpPower then
						LocalPlayer.Character.Humanoid.JumpPower = Config.Sliders.Jump
					end

					return
				end
			end
		end
	end)
	DestroyPlayers = RunService.Stepped:Connect(function()
		if Config.CoinFarm.Settings.DestroyPlayers then
			destroyplayers()
		end
	end)

	local function v707()
		local t36 = {}

		if not Players.LocalPlayer.Character then
			return
		end

		local Position = Players.LocalPlayer.Character.HumanoidRootPart.Position

		for _, v in game.Workspace:GetChildren() do
			if v:IsA("Model") and v:FindFirstChild("CoinContainer") then
				for _, v2 in v.CoinContainer:GetChildren() do
					if v2.Name == "Coin_Server" and not v2:FindFirstChild("CollectedCoin") and v2:FindFirstChild("TouchInterest") then
						local Magnitude = (Position - v2.Position).Magnitude

						if Magnitude < 100 then
							table.insert(t36, {
								Coin = v2,
								Distance = Magnitude
							})
						end
					end
				end
			end
		end

		table.sort(t36, function(p156, p157)
			return p156.Distance < p157.Distance
		end)

		return t36[1] and t36[1].Coin
	end

	TweenService = game.TweenService
	coinfarm1 = function()
		local connection
		local connection2
		local connection3 = RunService.Heartbeat:Connect(function()
			if Config.CoinFarm.State then
				local Game = Players.LocalPlayer.PlayerGui:WaitForChild("MainGUI").Game

				if Game.CoinBags.Visible and not Game.CoinBags.Container.Candy.Full.Visible and Players.LocalPlayer.Character then
					if Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
						local HumanoidRootPart = Players.LocalPlayer.Character.HumanoidRootPart

						if not HumanoidRootPart:FindFirstChild("FLY_NIGGER") then
							local BodyVelocity = Instance.new("BodyVelocity", HumanoidRootPart)

							BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
							BodyVelocity.Name = "FLY_NIGGER"
						end

						AutoFarming = true
						clipclop()

						local v721 = v707()

						if v721 then
							HumanoidRootPart.Anchored = false
							spawn(function()
								if not Players.LocalPlayer.Character then
									return
								end

								local HumanoidRootPart2 = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
								local v723 = (HumanoidRootPart2.Position - v721.Position).Magnitude / Config.CoinFarm.Settings.Speed
								local cFrame = CFrame.new(v721.Position + Vector3.new(0, -1, 0))

								TweenService:Create(HumanoidRootPart2, TweenInfo.new(v723, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
									CFrame = cFrame
								}):Play()

								if v721 and v721.Parent then
									local connection3

									connection3 = v721.Touched:Connect(function()
										task.wait(0.1)

										if v721 then
											v721:Destroy()
											connection3:Disconnect()
										end
									end)
								end
							end)
						else
							HumanoidRootPart.Anchored = true
						end

						task.wait(0.02)
						AutoFarming = false
					end
				end
			end
		end)

		connection = CoinCollected.OnClientEvent:Connect(function(p158, p159, p160)
			if p159 == p160 then
				connection3:Disconnect()
				connection:Disconnect()
				connection2:Disconnect()
				roundEndConenction:Disconnect()
			end
		end)
		connection2 = Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
			task.wait(1)

			repeat
				task.wait()
			until Players.LocalPlayer.Character ~= nil

			repeat
				task.wait()
			until Players.LocalPlayer.PlayerGui ~= nil

			task.wait(1)

			repeat
				task.wait()
			until game:GetService("Players").LocalPlayer.PlayerGui.MainGUI ~= nil

			task.wait(1)
			Teleport_to_map()
		end)
		roundEndConenction = game:GetService("ReplicatedStorage").Remotes.Gameplay.RoundEndFade.OnClientEvent:Connect(function()
			connection3:Disconnect()
			connection:Disconnect()
			connection2:Disconnect()
			roundEndConenction:Disconnect()
		end)
	end
	CoinColldown = 2

	local vector3 = Vector3.new(1, -100, 1)
	local Part = Instance.new("Part", workspace)
	local LocalPlayer2 = Players.LocalPlayer

	Part.Anchored = true
	Part.Position = vector3
	Part.Size = Vector3.new(100, 1.2, 100)

	local u729 = false

	PlayerToBrick = function()
		LocalPlayer2.Character.HumanoidRootPart.CFrame = CFrame.new(Part.Position + Vector3.new(math.random(-10, 5), 5, math.random(-10, 5)))
	end
	PlayerToCoin = function(p161)
		if p161 then
			LocalPlayer2.Character.HumanoidRootPart.CFrame = CFrame.new(p161.Position + Vector3.new(0, -6, 0))
		end
	end
	GetMap = function()
		for _, child in ipairs(workspace:GetChildren()) do
			if child:FindFirstChild("CoinContainer") then
				return child
			end
		end
	end
	CoinFarm2 = function()
		u729 = false

		if Config.CoinFarm2.State then
			PlayerToBrick()
		end

		while not u729 do
			local v732 = GetMap()

			if v732 then
				if Config.CoinFarm2.State then
					task.spawn(function()
						pcall(function()
							DestroyMapFunc()
						end)
					end)

					local v733
					local huge = math.huge

					for _, child in ipairs(v732.CoinContainer:GetChildren()) do
						if child:FindFirstChild("TouchInterest") then
							local Y = child.Position.Y

							if Y < huge then
								huge = Y
								v733 = child
							end
						end
					end

					coin = v733

					local u738 = false

					PlayerToCoin(coin)

					local connection = CoinCollected.OnClientEvent:Connect(function(p162, p163, p164)
						u738 = true

						if p163 == p164 then
							u729 = true
						end
					end)

					if u729 then
						break
					end

					while true do
						task.wait()
						task.spawn(function()
							firetouchinterest(LocalPlayer2.Character.HumanoidRootPart, coin, 0)
							firetouchinterest(LocalPlayer2.Character.HumanoidRootPart, coin, 1)
						end)
						task.wait()
						clipclop()
						PlayerToCoin(coin)

						if u738 then
							break
						elseif not coin:FindFirstChild("TouchInterest") then
							break
						end
					end

					connection:Disconnect()
					PlayerToBrick()
					wait(CoinColldown)

					continue
				end
			else
				task.wait(1)

				if Config.CoinFarm2.State then
					continue
				end
			end

			break
		end
	end
	game:GetService("ReplicatedStorage").Remotes.Gameplay.RoundStart.OnClientEvent:Connect(function()
		task.spawn(function()
			CoinFarm2()
		end)
		RunningCoinFarm2 = true
	end)
	game.Players.LocalPlayer.CharacterAdded:Connect(function()
		if Config.CoinFarm2.State then
			PlayerToBrick()
		end
	end)
	spawn(coinfarm1)

	local function v740()
		for _, player in ipairs(game.Players:GetPlayers()) do
			if player:FindFirstChild("Backpack") then
				if player.Backpack:FindFirstChild("Knife") then
					return player
				end
			end
		end

		for _, player in ipairs(game.Players:GetPlayers()) do
			if player.Character then
				if player.Character:FindFirstChild("Knife") then
					return player
				end
			end
		end

		if playerData then
			for k, v in pairs(playerData) do
				if v.Role ~= "Murderer" then
					continue
				end

				if game.Players:FindFirstChild(k) then
					return game.Players:FindFirstChild(k)
				end
			end
		end

		return nil
	end
	local function v747()
		for _, player in ipairs(game.Players:GetPlayers()) do
			if player:FindFirstChild("Backpack") then
				if player.Backpack:FindFirstChild("Gun") then
					return player
				end
			end
		end

		for _, player in ipairs(game.Players:GetPlayers()) do
			if player.Character then
				if player.Character:FindFirstChild("Gun") then
					return player
				end
			end
		end

		if playerData then
			for k, v in pairs(playerData) do
				if v.Role ~= "Sheriff" then
					continue
				end

				if game.Players:FindFirstChild(k) then
					return game.Players:FindFirstChild(k)
				end
			end
		end

		return nil
	end

	reloadESP = function()
		for _, child in ipairs(workspace:GetChildren()) do
			if child.Name == "PlayerESP" then
				child:Destroy()
			end
		end

		local children = game.Players:GetChildren()

		for _, child in ipairs(children) do
			if child.Character ~= nil then
				local Character = child.Character

				if not Character:FindFirstChild("PlayerESP") then
					local Highlight = Instance.new("Highlight", workspace)

					Highlight.Name = "PlayerESP"
					Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					Highlight.Adornee = Character
					Highlight.FillColor = Color3.fromRGB(255, 255, 255)
					Highlight.FillTransparency = 0.5
					task.spawn(function()
						if child == v740() then
							Highlight.FillColor = Color3.fromRGB(255, 0, 0)
							Highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
						elseif child == v747() then
							Highlight.FillColor = Color3.fromRGB(0, 150, 255)
							Highlight.OutlineColor = Color3.fromRGB(0, 150, 255)
						else
							Highlight.FillColor = Color3.fromRGB(0, 255, 0)
							Highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
						end

						if Highlight then
							if not child then
								return
							end

							Highlight.Adornee = child.Character or child.CharactedAdded:Wait()
						end
					end)
				end
			end
		end
	end
	KillEveryoneAsAMurderer = function()
		if not LocalPlayer.Character:FindFirstChild("Knife") then
			LocalPlayer.Character:FindFirstChild("Humanoid")

			if not LocalPlayer.Backpack:FindFirstChild("Knife") then
				return
			end

			LocalPlayer.Character:FindFirstChild("Humanoid"):EquipTool(LocalPlayer.Backpack:FindFirstChild("Knife"))
		end

		for _, player in ipairs(game.Players:GetPlayers()) do
			if player.Character then
				if player.Character:FindFirstChild("HumanoidRootPart") and player ~= LocalPlayer then
					player.Character:FindFirstChild("HumanoidRootPart").Anchored = true
					player.Character:FindFirstChild("HumanoidRootPart").CFrame = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame + LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame.LookVector * 1
				end
			end
		end

		LocalPlayer.Character.Knife.Stab:FireServer(unpack({ "Slash" }))
	end
	RunService.RenderStepped:Connect(function()
		if v747() == LocalPlayer then
			if Config.Gameplay.AutoShooting then
				local v763 = v740()

				if not v763 then
					return
				end

				local Character = v763.Character

				if not Character then
					return
				end

				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

				if not HumanoidRootPart then
					return
				end

				local Position = HumanoidRootPart.Position

				if not LocalPlayer.Character then
					return
				end

				local HumanoidRootPart2 = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

				if not HumanoidRootPart2 then
					return
				end

				local v768 = Position - HumanoidRootPart2.Position
				local raycastParams = RaycastParams.new()

				raycastParams.FilterType = Enum.RaycastFilterType.Exclude
				raycastParams.FilterDescendantsInstances = { LocalPlayer.Character }

				local hit = workspace:Raycast(HumanoidRootPart2.Position, v768, raycastParams)

				if not hit or hit.Instance.Parent == v763.Character then
					local ok = LocalPlayer.Character:FindFirstChild("Gun")

					if not ok then
						ok = not not LocalPlayer.Backpack:FindFirstChild("Gun")
					end

					if ok then
						LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gun"))

						local v772 = v740()
						local UpperTorso = v772.Character:FindFirstChild("UpperTorso")
						local Humanoid = v772.Character:FindFirstChild("Humanoid")

						if not UpperTorso then
							return
						end

						if not Humanoid then
							return
						end

						Vector3.new()

						local AssemblyLinearVelocity = UpperTorso.AssemblyLinearVelocity
						local MoveDirection = Humanoid.MoveDirection

						if not (AssemblyLinearVelocity.Y > 0 and -1) then
						end

						LocalPlayer.Character.Gun.KnifeLocal.CreateBeam.RemoteFunction:InvokeServer(1, (UpperTorso.Position + AssemblyLinearVelocity * Vector3.new(0, 0.5, 0) * 0.14 + MoveDirection * 2.8) * (LocalPlayer:GetNetworkPing() * 1000 * 0 + 1), "AH2")
					end
				end
			end
		end
	end)
	RoundStart.OnClientEvent:Connect(function()
		if Config.AutoRevealRoles then
			RevealRoles()
		end

		if Config.AutoFarm.KillEveryoneAsAMurderer then
			task.wait(1)

			repeat
				KillEveryoneAsAMurderer()
				task.wait(1)
			until v740() ~= Players.LocalPlayer
		end

		if Config.AutoFarm.AutoFlingMurderer then
			murd = v740()

			if murd and murd ~= game.Players.LocalPlayer then
				miniFling({ murd.Name })
			end
		end

		if Config.AutoFarm.AutoFlingSheriff then
			sher = v747()

			if sher and sher ~= game.Players.LocalPlayer then
				miniFling({ sher.Name })
			end
		end

		if Config.AutoFarm.TeleportSpawn then
			Teleport_to_lobby()
		end

		spawn(init)
		spawn(coinfarm1)
	end)
	RunService.Heartbeat:Connect(function()
		if Config.CoinFarm.Settings.DestroyMap then
			DestroyMapFunc()
		end
	end)
	game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gameplay"):WaitForChild("PlayerDataChanged", 5).OnClientEvent:Connect(function(p165)
		playerData = p165

		if Config.ESP.Players then
			reloadESP()
		end
	end)
	getMap = function()
		for _, child in ipairs(workspace:GetChildren()) do
			if child:FindFirstChild("CoinContainer") then
				if child:FindFirstChild("Spawns") then
					return child
				end
			end
		end

		return nil
	end
	GetAllEmotes = function()
		game.ReplicatedStorage.Remotes.Extras.GetPlayerData:InvokeServer("GetData")

		local EmoteModule = game:GetService("ReplicatedStorage").Modules.EmoteModule
		local Emotes = LocalPlayer.PlayerGui.MainGUI.Game:FindFirstChild("Emotes")

		require(EmoteModule).GeneratePage({
			"headless",
			"zombie",
			"zen",
			"ninja",
			"floss",
			"dab",
			"sit"
		}, Emotes, "Free Emotes")
		getgenv().FreeEmotesOperator = true

		while getgenv().FreeEmotesOperator == true do
			if LocalPlayer.PlayerGui.MainGUI.Game:FindFirstChild("Emotes") then
				if not LocalPlayer.PlayerGui.MainGUI.Game.Emotes.EmotePages:FindFirstChild("Free Emotes") then
					getgenv().FreeEmotesOperator = false
					GetAllEmotes()
				end
			end

			RunService.RenderStepped:wait()
		end
	end
	pickupgun = function()
		if not getMap() then
			return
		end

		if not getMap():FindFirstChild("GunDrop") then
			return
		end

		if v740() == LocalPlayer then
			return
		end

		if not LocalPlayer.Character then
			return
		end

		local pivot = LocalPlayer.Character:GetPivot()

		LocalPlayer.Character:MoveTo(getMap():FindFirstChild("GunDrop").Position)
		LocalPlayer.Backpack.ChildAdded:Wait()
		LocalPlayer.Character:PivotTo(pivot)
	end
	game.Workspace.DescendantAdded:Connect(function(descendant)
		if Config.ESP.Traps and descendant.Name == "Trap" then
			if descendant.Parent:IsDescendantOf(workspace) then
				descendant.Transparency = 0

				local clone = trapESP:Clone()

				clone.Parent = workspace
				clone.Adornee = descendant
			end
		end

		if Config.ESP.DroppedGun and descendant.Name == "GunDrop" then
			if not workspace:FindFirstChild("GunESP") then
				local Highlight = Instance.new("Highlight", workspace)

				Highlight.OutlineTransparency = 1
				Highlight.FillColor = Color3.fromRGB(255, 255, 0)
				Highlight.Name = "GunESP"
				Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				Highlight.Adornee = descendant
				Highlight.Enabled = true
			end

			workspace:FindFirstChild("GunESP").Adornee = descendant
			workspace:FindFirstChild("GunESP").Enabled = true

			if Config.Gameplay.AutoPickUpGun then
				task.wait(0.5)

				for i = 1, 5 do
					pickupgun()
				end
			end
		end
	end)
	game.Workspace.DescendantRemoving:Connect(function(descendant)
		if Config.ESP.DroppedGun and descendant.Name == "GunDrop" then
			if game.Workspace:FindFirstChild("GunESP") then
				game.Workspace:FindFirstChild("GunESP"):Destroy()
			end

			task.wait(0.6)

			if Config.ESP.Players then
				for _, child in ipairs(game.Workspace:GetChildren()) do
					if child:IsA("Highlight") then
						child:Destroy()
					end
				end
			end

			local children = game.Players:GetChildren()

			for _, child in ipairs(children) do
				if child.Character ~= nil then
					local Character = child.Character

					if not Character:FindFirstChild("PlayerESP") then
						local Highlight = Instance.new("Highlight", workspace)

						Highlight.Name = "PlayerESP"
						Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						Highlight.Adornee = Character
						Highlight.FillColor = Color3.fromRGB(255, 255, 255)
						Highlight.FillTransparency = 0.5
						task.spawn(function()
							if child == v740() then
								Highlight.FillColor = Color3.fromRGB(255, 0, 0)
								Highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
							elseif child == v747() then
								Highlight.FillColor = Color3.fromRGB(255, 255, 0)
								Highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
							else
								Highlight.FillColor = Color3.fromRGB(0, 255, 0)
								Highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
							end

							if Highlight then
								if not child then
									return
								end

								Highlight.Adornee = child.Character or child.CharactedAdded:Wait()
							end
						end)
					end
				end
			end
		end
	end)
	killme = function()
		LocalPlayer.Character:BreakJoints()
	end
	Teleport_to_lobby = function()
		game.Players.LocalPlayer.Character:MoveTo(workspace.Lobby.WorldPivot.Position)
	end
	Teleport_to_map = function()
		if not getMap() then
			return
		end

		local Spawns = getMap():FindFirstChild("Spawns")

		if Spawns then
			local children = Spawns:GetChildren()

			LocalPlayer.Character:MoveTo(children[math.random(1, #children)].Position)
		end
	end
	CrashServer = function()
		local GetSyncData = game:GetService("ReplicatedStorage").GetSyncData
		local InvokeServer = GetSyncData.InvokeServer
		local n17 = 0

		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Server IS COOKED",
			Text = "look how ppl freezing mid air lmao",
			Duration = 5
		})

		while true do
			for i = 1, 1 do
				task.spawn(InvokeServer, GetSyncData)
			end

			n17 += 1

			if n17 ~= 3 then
				continue
			end

			n17 = 0
			wait(0)
		end
	end
	miniFling = function(p166)
		local Players2 = game:GetService("Players")
		local u799 = false

		local function v800(p167)
			local v801 = p167:lower()

			if v801 == "all" or v801 == "others" then
				u799 = true

				return
			end

			if v801 == "random" then
				local players = Players2:GetPlayers()

				if table.find(players, Players2.LocalPlayer) then
					table.remove(players, table.find(players, Players2.LocalPlayer))
				end

				return players[math.random(#players)]
			end

			if v801 == "random" or v801 == "all" or v801 == "others" then
				return
			end

			local players, v804 = Players2:GetPlayers()

			for _, v in next, players, v804 do
				if v == Players2.LocalPlayer then
					continue
				end

				if v.Name:lower():match("^" .. v801) then
					return v
				end

				if v.DisplayName:lower():match("^" .. v801) then
					return v
				end
			end
		end
		local function v807(p168, p169, p170)
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = p168,
				Text = p169,
				Duration = p170
			})
		end
		local function v808(p171)
			local Character = Players2.LocalPlayer.Character
			local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
			local RootPart = Humanoid and Humanoid.RootPart
			local Character2 = p171.Character
			local Humanoid2
			local RootPart2
			local Head
			local Accessory
			local Handle

			if Character2:FindFirstChildOfClass("Humanoid") then
				Humanoid2 = Character2:FindFirstChildOfClass("Humanoid")
			end

			if Humanoid2 and Humanoid2.RootPart then
				RootPart2 = Humanoid2.RootPart
			end

			if Character2:FindFirstChild("Head") then
				Head = Character2.Head
			end

			if Character2:FindFirstChildOfClass("Accessory") then
				Accessory = Character2:FindFirstChildOfClass("Accessory")
			end

			if Accessoy and Accessory:FindFirstChild("Handle") then
				Handle = Accessory.Handle
			end

			if not Character or not Humanoid or not RootPart then
				return
			end

			if RootPart.Velocity.Magnitude < 50 then
				getgenv().OldPos = RootPart.CFrame
			end

			if Humanoid2 and Humanoid2.Sit and not u799 then
				return
			end

			if Head then
				game.Workspace.CurrentCamera.CameraSubject = Head
			elseif Handle then
				game.Workspace.CurrentCamera.CameraSubject = Handle
			elseif Humanoid2 and RootPart2 then
				game.Workspace.CurrentCamera.CameraSubject = Humanoid2
			end

			if not Character2:FindFirstChildWhichIsA("BasePart") then
				return
			end

			local function v818(p172, p173, p174)
				RootPart.CFrame = CFrame.new(p172.Position) * p173 * p174
				Character:SetPrimaryPartCFrame(CFrame.new(p172.Position) * p173 * p174)
				RootPart.Velocity = Vector3.new(90000000, 900000000, 90000000)
				RootPart.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
			end
			local function v819(p175)
				local now = tick()
				local n18 = 0

				while RootPart and Humanoid2 do
					if p175.Velocity.Magnitude < 50 then
						n18 += 100
						v818(p175, CFrame.new(0, 1.5, 0) + Humanoid2.MoveDirection * p175.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n18), 0, 0))
						task.wait()
						v818(p175, CFrame.new(0, -1.5, 0) + Humanoid2.MoveDirection * p175.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n18), 0, 0))
						task.wait()
						v818(p175, CFrame.new(2.25, 1.5, -2.25) + Humanoid2.MoveDirection * p175.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n18), 0, 0))
						task.wait()
						v818(p175, CFrame.new(-2.25, -1.5, 2.25) + Humanoid2.MoveDirection * p175.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(n18), 0, 0))
						task.wait()
						v818(p175, CFrame.new(0, 1.5, 0) + Humanoid2.MoveDirection, CFrame.Angles(math.rad(n18), 0, 0))
						task.wait()
						v818(p175, CFrame.new(0, -1.5, 0) + Humanoid2.MoveDirection, CFrame.Angles(math.rad(n18), 0, 0))
						task.wait()
					else
						v818(p175, CFrame.new(0, 1.5, Humanoid2.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						v818(p175, CFrame.new(0, -1.5, -Humanoid2.WalkSpeed), CFrame.Angles(0, 0, 0))
						task.wait()
						v818(p175, CFrame.new(0, 1.5, Humanoid2.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						v818(p175, CFrame.new(0, 1.5, RootPart2.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						v818(p175, CFrame.new(0, -1.5, -RootPart2.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
						task.wait()
						v818(p175, CFrame.new(0, 1.5, RootPart2.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						v818(p175, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
						task.wait()
						v818(p175, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
						task.wait()
						v818(p175, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
						task.wait()
						v818(p175, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
						task.wait()
					end

					if p175.Velocity.Magnitude > 500 or p175.Parent ~= p171.Character or p171.Parent ~= Players2 or not p171.Character == Character2 or Humanoid2.Sit or Humanoid.Health <= 0 or now + 2 < tick() then
						break
					end
				end
			end

			game.Workspace.FallenPartsDestroyHeight = (0/0)

			local BodyVelocity = Instance.new("BodyVelocity")

			BodyVelocity.Name = "EpixVel"
			BodyVelocity.Parent = RootPart
			BodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
			BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

			if RootPart2 and Head then
				if (RootPart2.CFrame.p - Head.CFrame.p).Magnitude > 5 then
					v819(Head)
				else
					v819(RootPart2)
				end
			elseif RootPart2 and not Head then
				v819(RootPart2)
			elseif RootPart2 or not Head then
				if RootPart2 or Head or not Accessory or not Handle then
					return
				end

				v819(Handle)
			else
				v819(Head)
			end

			BodyVelocity:Destroy()
			Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
			game.Workspace.CurrentCamera.CameraSubject = Humanoid

			repeat
				RootPart.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
				Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
				Humanoid:ChangeState("GettingUp")
				table.foreach(Character:GetChildren(), function(p176, p177)
					if p177:IsA("BasePart") then
						local vector32 = Vector3.new()
						local vector33 = Vector3.new()

						p177.Velocity = vector32
						p177.RotVelocity = vector33
					end
				end)
				task.wait()
			until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25

			game.Workspace.FallenPartsDestroyHeight = -500
			game.Workspace.FallenPartsDestroyHeight = -500
		end

		if not p166[1] then
			return
		end

		for _, v in next, p166, nil do
			v800(v)
		end

		if u799 then
			local next_ = next
			local players, v829 = Players2:GetPlayers()

			for _, v in next_, players, v829 do
				v808(v)
			end
		end

		for _, v in next, p166, nil do
			if v800(v) and v800(v) ~= Players2.LocalPlayer then
				local v834 = v800(v)

				if v834 then
					v808(v834)
				end
			else
				v800(v)
			end
		end
	end
	task.spawn(function()
		while task.wait() do
			if Config.AnnoyingStuff.Fling.LoopFlingAllPlayers then
				for _, player in ipairs(game.Players:GetPlayers()) do
					if player ~= LocalPlayer then
						pcall(function()
							miniFling({ player.Name })
						end)
					end
				end
			end
		end
	end)
	ServerHop = function()
		local t37 = {}
		local data = HttpService:JSONDecode(request({
			Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)
		}).Body)

		if data and data.data then
			for _, v in next, data.data, nil do
				if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
					table.insert(t37, 1, v.id)
				end
			end
		end

		if #t37 > 0 then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, t37[math.random(1, #t37)], game:GetService("Players").LocalPlayer)
		end
	end
	game:GetService("Players").PlayerRemoving:Connect(function()
		if Config.AutoFarm.AutoTeleportToRandomServerIfServerIsEmpty then
			if Config.AutoFarm.PlayersToAutoServerHop > #game.Players:GetPlayers() then
				ServerHop()
			end
		end
	end)
	task.spawn(function()
		while task.wait(30) do
			if Config.AutoFarm.AutoPrestige then
				game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Inventory"):WaitForChild("Prestige"):FireServer()
			end
		end
	end)

	local ScreenGui = Instance.new("ScreenGui")

	ScreenGui.Name = "CenteredLabelGui"
	ScreenGui.Parent = game:GetService("CoreGui")

	local TextLabel = Instance.new("TextLabel")

	TextLabel.Name = "CenteredTextLabel"
	TextLabel.Visible = false
	TextLabel.Text = ""
	TextLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
	TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel.BackgroundTransparency = 1
	TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.Font = Enum.Font.SourceSansBold
	TextLabel.TextSize = 48
	TextLabel.Parent = ScreenGui
	startTime = tick()
	totalCoinsCollected = 0
	CoinCollected.OnClientEvent:Connect(function(p178, p179, p180)
		totalCoinsCollected += 1
		RNcoins = p179
		MAXcoins = p180

		if p179 == p180 then
			if Config.AutoFarm.KillEveryoneAsAMurdererAtFullBag and v740() == LocalPlayer then
				repeat
					KillEveryoneAsAMurderer()
					task.wait(1)
				until v740() ~= LocalPlayer
			elseif Config.AutoFarm.AutoFlingMurdererAtFullBag and v740() ~= LocalPlayer then
				repeat
					murd = v740()

					if murd and murd ~= game.Players.LocalPlayer then
						miniFling({ murd.Name })
						task.wait(1)
					end
				until not v740()
			elseif Config.AutoFarm.TeleportUnderMap then
				wait(0.1)
				TeleportUnderMap()
			elseif Config.CoinFarm.Settings.DieAtFullBag then
				LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
			end
		end
	end)
	task.wait(0.01)
	coinsPerHour = 0
	RNcoins = 0
	MAXcoins = 40
	RunService.RenderStepped:Connect(function()
		game:GetService("RunService"):Set3dRenderingEnabled(not Config.CoinFarm2.Disable3DRendering)
		elapsedTime = tick() - startTime

		if totalCoinsCollected > 0 then
			coinsPerHour = math.floor(totalCoinsCollected * 3600 / elapsedTime)
		else
			coinsPerHour = 0
		end

		TextLabel.Text = "Coins Collected: " .. RNcoins .. "/" .. MAXcoins .. "\nTotal Coins: " .. totalCoinsCollected .. "\nCoins Per Hour: " .. coinsPerHour
	end)
	task.spawn(function()
		while task.wait(15) do
			if Config.AutoOpenCrates.State then
				local t38 = {
					Config.AutoOpenCrates.Crate,
					Config.AutoOpenCrates.CrateType,
					"Coins"
				}

				game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Shop"):WaitForChild("OpenCrate"):InvokeServer(unpack(t38))
			end
		end
	end)
	RevealRoles = function()
		local children = game:GetService("TextChatService"):WaitForChild("TextChannels"):GetChildren()

		for _, child in ipairs(children) do
			if child.Name ~= "RBXSystem" then
				local v847 = v740()
				local v848 = v747()
				local s10 = "-"
				local s11 = "-"

				if v847 then
					s10 = v847.Name
				end

				if v848 then
					s11 = v848.Name
				end

				local v851 = string.format("Murderer: %s |\nSheriff: %s |\nProject Reverse MM2 Hub", s10, s11)

				child:SendAsync(v851)
			end
		end
	end
	poop = {}

	local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
	local Lighting = game:GetService("Lighting")
	local MainGUI = LocalPlayer.PlayerGui:FindFirstChild("MainGUI")
	local Game = MainGUI and MainGUI:FindFirstChild("Game")
	local NewItem = Game and Game:FindFirstChild("NewItem")
	local ItemModule = require(ReplicatedStorage2.Modules.ItemModule)
	local Sync = require(ReplicatedStorage2:WaitForChild("Database"):WaitForChild("Sync"))
	local LFrame
	local t39 = {}
	local n19 = 1
	local n20 = 1
	local NewItemBlur = Lighting:FindFirstChild("NewItemBlur")

	if NewItemBlur then
		NewItemBlur.Enabled = false
	end

	local function v864()
		if not NewItem then
			return
		end

		local v865 = t39[1]

		if not v865 then
			return
		end

		warn(v865.Type, v865.ItemName)

		local v866 = Sync[v865.Type][v865.ItemName]

		ItemModule.DisplayItem(NewItem.Container.NewItem, v866, v865.Amount or nil)

		local Color = Sync.Rarities[v866.Rarity].Color

		NewItem.Container.Starburst.ImageColor3 = Color3.fromRGB(Color.r, Color.g, Color.b) or Color3.new(1, 1, 1)
		NewItem.Container.Title.Text = v865.TitleText

		if v865.LFrame then
			LFrame = v865.LFrame
			LFrame.Visible = false
		end

		if NewItemBlur then
			NewItemBlur.Enabled = true
		end

		NewItem.Visible = true
	end

	poop.NewItem = function(p181, p182, p183, p184, p185)
		if not NewItem then
			return
		end

		table.insert(t39, {
			ItemName = p181,
			TitleText = p182 or "You Got...",
			LFrame = p183,
			Type = "Item",
			Amount = tonumber(p185)
		})

		if NewItem.Visible then
			n20 += 1
		else
			n19 = 1
			n20 = #t39
			v864()
		end

		if n20 > 1 then
			NewItem.Container.Claim.Text = "Claim (" .. n19 .. "/" .. n20 .. ")"
		else
			NewItem.Container.Claim.Text = "Claim"
		end
	end

	if poop.ClaimConnection then
		poop.ClaimConnection:Disconnect()
	end

	if NewItem then
		poop.ClaimConnection = NewItem.Container.Claim.MouseButton1Click:Connect(function()
			ItemModule.AnimateItemIconIntoInventory(NewItem.Container.NewItem.Container.Icon, Game.Dock.Inventory, Game)
			NewItem.Visible = false
			poop.UnfinishedItem = nil
			poop.UnfinishedType = nil
			table.remove(t39, 1)

			if NewItemBlur then
				NewItemBlur.Enabled = false
			end

			if t39[1] == nil then
				n20 = 1
				n19 = 1

				if LFrame then
					LFrame.Visible = true
				end
			else
				n19 += 1

				if n20 > 1 then
					NewItem.Container.Claim.Text = "Claim (" .. n19 .. "/" .. n20 .. ")"
				else
					NewItem.Container.Claim.Text = "Claim"
				end

				v864()
			end
		end)
	end

	boxmodule = require(game:GetService("ReplicatedStorage").Modules.BoxModule)
	itemdatabase = require(game:GetService("ReplicatedStorage").Database.Sync.Item)
	getrandombox = function()
		local MysteryBox = require(game:GetService("ReplicatedStorage").Database.Sync.MysteryBox)

		if not MysteryBox or next(MysteryBox) == nil then
			return nil
		end

		local t40 = {}

		for k in pairs(MysteryBox) do
			table.insert(t40, k)
		end

		return t40[math.random(1, #t40)]
	end
	getgenv().spawnamount = 1
	opencrate = function(p186, p187)
		if not p187 then
			boxmodule.OpenBox(getrandombox(), p186)
			poop.NewItem(p186, nil, nil, "Weapons", 1)

			return
		end

		poop.NewItem(p186, nil, nil, "Weapons", getgenv().spawnamount)
	end
	getrawnamebyrealname = function(p188)
		for k in pairs(itemdatabase) do
			if p188 == k then
				return k
			end
		end
	end
	gettable = function(p189)
		nikita_gay = {}

		for k in pairs(itemdatabase) do
			if string.find(k:lower(), p189:lower()) then
				table.insert(nikita_gay, k)
			end
		end

		return nikita_gay
	end
	print_table = function(p190)
		local function v873(p191)
			local s12 = ""

			for i = 1, p191 do
				s12 ..= "\t"
			end

			return s12
		end

		local t41 = {}
		local t42 = {}
		local t43 = {}
		local n21 = 1
		local s13 = "{\n"

		while true do
			local n22 = 0

			for _ in pairs(p190) do
				n22 += 1
			end

			local n23 = 1

			for k, v in pairs(p190) do
				if t41[p190] == nil or t41[p190] <= n23 then
					if string.find(s13, "}", s13:len()) then
						s13 ..= ",\n"
					elseif not string.find(s13, "\n", s13:len()) then
						s13 ..= "\n"
					end

					table.insert(t43, s13)

					local s14 = ""
					local v887

					if type(k) == "number" or type(k) == "boolean" then
						v887 = "[" .. tostring(k) .. "]"
					else
						v887 = "['" .. tostring(k) .. "']"
					end

					local v888

					if type(v) == "number" or type(v) == "boolean" then
						v888 = s14 .. v873(n21) .. v887 .. " = " .. tostring(v)

						if n23 == n22 then
							s13 = v888 .. "\n" .. v873(n21 - 1) .. "}"
						else
							s13 = v888 .. ","
						end

						n23 += 1
					elseif type(v) == "table" then
						s13 = s14 .. v873(n21) .. v887 .. " = {\n"
						table.insert(t42, p190)
						table.insert(t42, v)
						t41[p190] = n23 + 1

						break
					else
						v888 = s14 .. v873(n21) .. v887 .. " = '" .. tostring(v) .. "'"

						if n23 == n22 then
							s13 = v888 .. "\n" .. v873(n21 - 1) .. "}"
						else
							s13 = v888 .. ","
						end

						n23 += 1
					end
				else
					if n23 == n22 then
						s13 ..= "\n" .. v873(n21 - 1) .. "}"
					end

					n23 += 1
				end
			end

			if not (#t42 > 0) then
				break
			end

			p190 = t42[#t42]
			t42[#t42] = nil
			n21 = t41[p190] == nil and n21 + 1 or n21 - 1
		end

		table.insert(t43, s13)

		local v889 = table.concat(t43)

		print(v889)
	end

	local v890 = v676:Section({
		Title = "Gameplay",
		Icon = "sword",
		Opened = false
	})
	local v891 = v676:Section({
		Title = "ESP",
		Icon = "eye",
		Opened = false
	})
	local v892 = v676:Section({
		Title = "Auto Farm",
		Icon = "tractor",
		Opened = false
	})
	local v893 = v676:Section({
		Title = "Coin Farm",
		Icon = "bitcoin",
		Opened = false
	})
	local v894 = v676:Section({
		Title = "Trade Helper",
		Icon = "handshake",
		Opened = false
	})
	local v895 = v676:Section({
		Title = "Inventory Helper",
		Icon = "backpack",
		Opened = false
	})
	local v896 = v676:Section({
		Title = "Spawner & Crate Opener",
		Icon = "egg",
		Opened = false
	})
	local v897 = v676:Section({
		Title = "Misc",
		Icon = "ellipsis",
		Opened = false
	})
	local v898 = v676:Section({
		Title = "Valentine Farm",
		Icon = "heart",
		Opened = false
	})
	local v899 = v890:Tab({
		Title = "Tools",
		Locked = false
	})
	local v900 = v890:Tab({
		Title = "Annoying Stuff",
		Locked = false
	})
	local v901 = v890:Tab({
		Title = "Basic Stuff",
		Locked = false
	})
	local v902 = v890:Tab({
		Title = "Other Tools",
		Locked = false
	})
	local v903 = v890:Tab({
		Title = "More Tools",
		Locked = false
	})
	local v904 = v890:Tab({
		Title = "Speed and Jump",
		Locked = false
	})
	local v905 = v891:Tab({
		Title = "ESP Settings",
		Locked = false
	})
	local v906 = v892:Tab({
		Title = "Autofarm Features",
		Locked = false
	})
	local v907 = v892:Tab({
		Title = "More Features",
		Locked = false
	})
	local v908 = v893:Tab({
		Title = "Coin Farm 1 [Fly]",
		Locked = false
	})
	local v909 = v893:Tab({
		Title = "Coin Farm 2 [Safe TP]",
		Locked = false
	})
	local v910 = v893:Tab({
		Title = "Coin Settings",
		Locked = false
	})
	local v911 = v893:Tab({
		Title = "Auto Open Crates",
		Locked = false
	})
	local v912 = v894:Tab({
		Title = "Trade Info",
		Locked = false
	})
	local v913 = v894:Tab({
		Title = "Auto Trade [Risky]",
		Locked = false
	})
	local v914 = v895:Tab({
		Title = "Inventory Analyzer",
		Locked = false
	})
	local v915 = v895:Tab({
		Title = "Other's Inventory's",
		Locked = false
	})
	local v916 = v896:Tab({
		Title = "Weapon Spawner",
		Locked = false
	})
	local v917 = v896:Tab({
		Title = "Crate Opener",
		Locked = false
	})
	local v918 = v897:Tab({
		Title = "Server Crasher",
		Locked = false
	})
	local v919 = v897:Tab({
		Title = "Unlock Emotes",
		Locked = false
	})
	local v920 = v897:Tab({
		Title = "Server Stuff",
		Locked = false
	})
	local v921 = v897:Tab({
		Title = "Spam Random Emotes",
		Locked = false
	})
	local v922 = v897:Tab({
		Title = "Fast Skin Swapper",
		Locked = false
	})
	local v923 = v897:Tab({
		Title = "Spam Selected Emote",
		Locked = false
	})

	v899:Button({
		Title = "Pick Up Gun",
		Desc = "Instant Gun Pick Up",
		Locked = false,
		Callback = function()
			pickupgun()
		end
	})
	v899:Toggle({
		Title = "Auto Pick Up Gun",
		Desc = "Automatic Instant Gun Pick Up",
		Type = "Checkbox",
		Default = false,
		Callback = function(p192)
			Config.Gameplay.AutoPickUpGun = p192
		end
	})
	findplayer = function(p193)
		for _, player in pairs(game.Players:GetPlayers()) do
			name = player.Name:lower()
			displayname = player.DisplayName:lower()

			if string.find(name, p193) or string.find(displayname, p193) then
				return player.Name
			end
		end
	end
	v900:Input({
		Title = "Pick A Player",
		Desc = "Enter player name to target",
		Value = "",
		InputIcon = "user",
		Type = "Input",
		Placeholder = "Enter player name...",
		Callback = function(p194)
			Config.AnnoyingStuff.Fling.PickedPlayer = findplayer(p194)
		end
	})
	v900:Button({
		Title = "Fling Chosen Player",
		Desc = "Fling the selected player",
		Locked = false,
		Callback = function()
			if Config.AnnoyingStuff.Fling.PickedPlayer then
				miniFling({ Config.AnnoyingStuff.Fling.PickedPlayer })

				return
			end
		end
	})
	v900:Button({
		Title = "Fling Murderer",
		Desc = "Fling the murderer",
		Locked = false,
		Callback = function()
			miniFling({ v740().Name })
		end
	})
	v900:Button({
		Title = "Fling Sheriff",
		Desc = "Fling the sheriff",
		Locked = false,
		Callback = function()
			miniFling({ v747().Name })
		end
	})
	v900:Button({
		Title = "Fling All Players",
		Desc = "Fling every player in the server",
		Locked = false,
		Callback = function()
			miniFling({ "All" })
		end
	})
	v900:Button({
		Title = "Fling Random Player",
		Desc = "Pick a random player and fling them",
		Locked = false,
		Callback = function()
			miniFling({ Players:GetPlayers()[math.random(#Players:GetPlayers())].Name })
		end
	})
	v900:Toggle({
		Title = "Loop Fling All Players",
		Desc = "Repeatedly fling all players",
		Icon = "repeat",
		Type = "Checkbox",
		Default = false,
		Callback = function(p195)
			Config.AnnoyingStuff.Fling.LoopFlingAllPlayers = p195
		end
	})
	v901:Toggle({
		Title = "Noclip",
		Desc = "Walk through walls and objects",
		Icon = "ghost",
		Type = "Checkbox",
		Default = false,
		Callback = function(p196)
			Config.Noclip = p196
		end
	})
	v901:Button({
		Title = "Fly GUI",
		Desc = "Open the Fly GUI script",
		Locked = false,
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
		end
	})
	v902:Button({
		Title = "Teleport to Map",
		Desc = "Teleport your character to the main map",
		Locked = false,
		Callback = function()
			Teleport_to_map()
		end
	})
	v902:Button({
		Title = "Teleport to Lobby",
		Desc = "Teleport your character back to the lobby",
		Locked = false,
		Callback = function()
			Teleport_to_lobby()
		end
	})
	v902:Button({
		Title = "Notify Murderer Username",
		Desc = "Show a notification with the murderer’s username",
		Locked = false,
		Callback = function()
			local v926 = v740()

			if not v926 then
				return
			end

			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Murderer Username:",
				Text = v926.Name,
				Duration = 5
			})
		end
	})
	v902:Button({
		Title = "Notify Sheriff Username",
		Desc = "Show a notification with the sheriff’s username",
		Locked = false,
		Callback = function()
			local v927 = v747()

			if not v927 then
				return
			end

			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Sheriff Username:",
				Text = v927.Name,
				Duration = 5
			})
		end
	})
	v902:Button({
		Title = "Reveal Roles",
		Desc = "Display all current player roles",
		Locked = false,
		Callback = function()
			RevealRoles()
		end
	})
	v902:Toggle({
		Title = "Auto Reveal Roles",
		Desc = "Automatically show player roles each round",
		Icon = "eye",
		Type = "Checkbox",
		Default = false,
		Callback = function(p197)
			Config.AutoRevealRoles = p197
		end
	})
	v903:Button({
		Title = "Kill Everyone as Murderer",
		Desc = "Eliminate all players if you are the murderer",
		Locked = false,
		Callback = function()
			if v740() ~= LocalPlayer then
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "You are not a murderer",
					Text = "You don’t have a knife",
					Duration = 5
				})
			end

			KillEveryoneAsAMurderer()
		end
	})
	v903:Button({
		Title = "Bring All Players",
		Desc = "Teleport every player to your location (useful only as murderer)",
		Locked = false,
		Callback = function()
			if v740() ~= LocalPlayer then
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "You are not a murderer",
					Text = "This is not useful if you are not the murderer",
					Duration = 5
				})

				return
			end

			for _, player in ipairs(game.Players:GetPlayers()) do
				if player.Character then
					if player.Character:FindFirstChild("HumanoidRootPart") and player ~= LocalPlayer then
						local HumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
						local HumanoidRootPart2 = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

						HumanoidRootPart.Anchored = true
						HumanoidRootPart.CFrame = HumanoidRootPart2.CFrame + HumanoidRootPart2.CFrame.LookVector * 5
					end
				end
			end

			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Teleported Everyone",
				Text = "All players moved to your position",
				Duration = 5
			})
		end
	})
	v903:Toggle({
		Title = "Auto Shoot Murderer",
		Desc = "Automatically shoot the murderer when detected",
		Icon = "target",
		Type = "Checkbox",
		Default = false,
		Callback = function(p198)
			Config.Gameplay.AutoShooting = p198
		end
	})
	v903:Button({
		Title = "Shoot Murderer",
		Desc = "Manually shoot at the murderer",
		Locked = false,
		Callback = function()
			local ok = LocalPlayer.Character:FindFirstChild("Gun")

			if not ok then
				ok = not not LocalPlayer.Backpack:FindFirstChild("Gun")
			end

			if not ok then
				return
			end

			LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gun"))

			local v933 = v740()

			if not v933 or not v933.Character then
				return
			end

			local UpperTorso = v933.Character:FindFirstChild("UpperTorso")
			local Humanoid = v933.Character:FindFirstChild("Humanoid")

			if UpperTorso then
				if Humanoid then
					local MoveDirection = Humanoid.MoveDirection

					LocalPlayer.Character.Gun.KnifeLocal.CreateBeam.RemoteFunction:InvokeServer(1, (UpperTorso.Position + UpperTorso.AssemblyLinearVelocity * Vector3.new(0, 0.5, 0) * 0.14 + MoveDirection * 2.8) * (LocalPlayer:GetNetworkPing() * 1000 * 0 + 1), "AH2")

					return
				end
			end
		end
	})
	v904:Slider({
		Title = "Speed",
		Desc = "Adjust your walking speed",
		Step = 1,
		Value = {
			Min = 1,
			Max = 100,
			Default = 16
		},
		Callback = function(p199)
			Config.Sliders.Speed = p199
		end
	})
	v904:Slider({
		Title = "Jump",
		Desc = "Adjust your jump height",
		Step = 1,
		Value = {
			Min = 1,
			Max = 100,
			Default = 50
		},
		Callback = function(p200)
			Config.Sliders.Jump = p200
		end
	})
	v905:Toggle({
		Title = "Players ESP",
		Desc = "Highlight all players on the map",
		Icon = "users",
		Type = "Checkbox",
		Default = false,
		Callback = function(p201)
			Config.ESP.Players = p201

			if p201 then
				reloadESP()
			else
				for _, child in ipairs(workspace:GetChildren()) do
					if child.Name == "PlayerESP" then
						child:Destroy()
					end
				end
			end
		end
	})
	v905:Toggle({
		Title = "Dropped Gun ESP",
		Desc = "Highlight dropped guns on the ground",
		Icon = "target",
		Type = "Checkbox",
		Default = false,
		Callback = function(p202)
			Config.ESP.DroppedGun = p202
		end
	})
	v906:Toggle({
		Title = "Auto Teleport At Spawn",
		Desc = "Automatically teleport to spawn location when the round starts",
		Icon = "map-pin",
		Type = "Checkbox",
		Default = false,
		Callback = function(p203)
			Config.AutoFarm.TeleportSpawn = p203
		end
	})
	v906:Toggle({
		Title = "Auto Kill Everyone As A Murderer",
		Desc = "Automatically kill all players when you are the murderer",
		Type = "Checkbox",
		Default = false,
		Callback = function(p204)
			Config.AutoFarm.KillEveryoneAsAMurderer = p204
		end
	})
	v906:Toggle({
		Title = "Auto Prestige",
		Desc = "Automatically prestige when the level cap is reached",
		Icon = "star",
		Type = "Checkbox",
		Default = false,
		Callback = function(p205)
			Config.AutoFarm.AutoPrestige = p205
		end
	})
	v907:Toggle({
		Title = "Auto Fling Murderer",
		Desc = "Automatically fling the murderer each round",
		Type = "Checkbox",
		Default = false,
		Callback = function(p206)
			Config.AutoFarm.AutoFlingMurderer = p206
		end
	})
	v907:Toggle({
		Title = "Auto Fling Sheriff",
		Desc = "Automatically fling the sheriff each round",
		Type = "Checkbox",
		Default = false,
		Callback = function(p207)
			Config.AutoFarm.AutoFlingSheriff = p207
		end
	})
	v907:Toggle({
		Title = "Server Hop If Server Is Empty",
		Desc = "Automatically teleport to another server when this one is empty",
		Type = "Checkbox",
		Default = false,
		Callback = function(p208)
			Config.AutoFarm.AutoTeleportToRandomServerIfServerIsEmpty = p208
		end
	})
	v907:Slider({
		Title = "Players To Auto Server Hop",
		Desc = "Number of players threshold before auto server hop",
		Step = 1,
		Value = {
			Min = 1,
			Max = 12,
			Default = 2
		},
		Callback = function(p209)
			Config.AutoFarm.PlayersToAutoServerHop = p209
		end
	})
	v908:Toggle({
		Title = "Enable Coin Farm 1",
		Desc = "Automatically collect coins using Coin Farm method 1",
		Icon = "coins",
		Type = "Checkbox",
		Default = false,
		Callback = function(p210)
			Config.CoinFarm.State = p210

			if not p210 then
				local HumanoidRootPart = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

				if HumanoidRootPart then
					HumanoidRootPart.Anchored = false

					if HumanoidRootPart:FindFirstChild("FLY_NIGGER") then
						HumanoidRootPart.FLY_NIGGER:Destroy()
					end
				end
			end
		end
	})
	v908:Slider({
		Title = "Farm Speed",
		Desc = "Adjust the farming movement speed",
		Step = 0.5,
		Value = {
			Min = 15,
			Max = 25,
			Default = Config.CoinFarm.Settings.Speed
		},
		Callback = function(p211)
			Config.CoinFarm.Settings.Speed = p211
		end
	})
	v909:Toggle({
		Title = "Enable Coin Farm 2",
		Desc = "Automatically collect coins using Teleport Farm method",
		Icon = "coins",
		Type = "Checkbox",
		Default = false,
		Callback = function(p212)
			Config.CoinFarm2.State = p212

			if p212 then
				task.spawn(function()
					CoinFarm2()
				end)
			end
		end
	})
	v910:Toggle({
		Title = "Destroy Player Models",
		Desc = "Remove other players’ models while farming coins",
		Type = "Checkbox",
		Default = false,
		Callback = function(p213)
			Config.CoinFarm.Settings.DestroyPlayers = p213
		end
	})
	v910:Toggle({
		Title = "Destroy Map",
		Desc = "Remove map elements to optimize coin farming",
		Type = "Checkbox",
		Default = false,
		Callback = function(p214)
			Config.CoinFarm.Settings.DestroyMap = p214
		end
	})
	v910:Toggle({
		Title = "Die At Full Bag",
		Desc = "Automatically die when your coin bag is full",
		Type = "Checkbox",
		Default = false,
		Callback = function(p215)
			Config.CoinFarm.Settings.DieAtFullBag = p215
		end
	})
	v910:Toggle({
		Title = "Teleport Under Map At Full Bag",
		Desc = "Teleport under the map when your coin bag is full",
		Type = "Checkbox",
		Default = false,
		Callback = function(p216)
			Config.AutoFarm.TeleportUnderMap = p216
		end
	})
	v910:Toggle({
		Title = "Auto Fling Murderer At Full Bag",
		Desc = "Automatically fling the murderer when your coin bag is full",
		Type = "Checkbox",
		Default = false,
		Callback = function(p217)
			Config.AutoFarm.AutoFlingMurdererAtFullBag = p217
		end
	})
	v910:Toggle({
		Title = "Disable 3D Rendering",
		Desc = "Disable 3D rendering in Coin Farm 2 to improve performance",
		Type = "Checkbox",
		Default = false,
		Callback = function(p218)
			Config.CoinFarm2.Disable3DRendering = p218
		end
	})
	v910:Toggle({
		Title = "Stats Overlay",
		Desc = "Show overlay with coin farm statistics",
		Type = "Checkbox",
		Default = false,
		Callback = function(p219)
			Config.CoinFarm.StatsOverlay = p219
		end
	})

	local t44 = {}

	for k in pairs(require(game:GetService("ReplicatedStorage").Database.Sync.Shop).Weapons) do
		table.insert(t44, tostring(k))
	end

	v911:Toggle({
		Title = "Auto Open Crates",
		Desc = "Automatically open crates",
		Icon = "gift",
		Type = "Checkbox",
		Default = false,
		Callback = function(p220)
			Config.AutoOpenCrates.State = p220
		end
	})
	v911:Dropdown({
		Title = "Choose Box",
		Desc = "Select which crate to open automatically",
		Values = t44,
		Value = t44[1],
		Multi = false,
		AllowNone = false,
		Callback = function(p221)
			local v942 = t44[p221] or p221

			Config.AutoOpenCrates.Crate = v942
			Config.AutoOpenCrates.CrateType = require(game:GetService("ReplicatedStorage").Database.Sync.Shop).Weapons[v942].DataType
		end
	})
	v918:Button({
		Title = "Crash Server",
		Desc = "Attempt to crash the server (dev only)",
		Locked = false,
		Callback = function()
			if getgenv().dev then
				CrashServer()

				return
			end

			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Feature is locked",
				Text = "Check the server for more information",
				Duration = 5
			})
		end
	})
	v919:Button({
		Title = "Unlock All Emotes",
		Desc = "Unlock all emotes if conditions are met",
		Locked = false,
		Callback = function()
			if LocalPlayer.PlayerGui.MainGUI.Game:FindFirstChild("Emotes") then
				if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.Humanoid.Health >= 0 then
					GetAllEmotes()
				end
			end
		end
	})
	v920:Button({
		Title = "Rejoin Server",
		Desc = "Rejoin the current server instance",
		Locked = false,
		Callback = function()
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
		end
	})
	v920:Button({
		Title = "Server Hop",
		Desc = "Teleport to a different server",
		Locked = false,
		Callback = function()
			ServerHop()
		end
	})
	v921:Toggle({
		Title = "Spam Random Emotes",
		Desc = "Automatically play random emotes",
		Icon = "shuffle",
		Type = "Checkbox",
		Default = false,
		Callback = function(p222)
			Config.Emotes.AutoPlayEmotes = p222
		end
	})
	v921:Slider({
		Title = "Spam Speed",
		Desc = "Adjust the speed of emote spam",
		Step = 1,
		Value = {
			Min = 1,
			Max = 50,
			Default = Config.Emotes.EmoteSpamSpeed
		},
		Callback = function(p223)
			Config.Emotes.EmoteSpamSpeed = p223
		end
	})
	v922:Toggle({
		Title = "Shuffle Weapons",
		Desc = "Automatically shuffle your weapons",
		Icon = "shuffle",
		Type = "Checkbox",
		Default = false,
		Callback = function(p224)
			Config.ShuffleWeapons = p224
		end
	})
	v923:Toggle({
		Title = "Spam Selected Emote",
		Desc = "Automatically play your selected emote",
		Icon = "play",
		Type = "Checkbox",
		Default = false,
		Callback = function(p225)
			Config.Emotes.AutoPlaySelectedEmote = p225
		end
	})
	v923:Dropdown({
		Title = "Pick A Emote",
		Desc = "Select an emote to spam",
		Values = t33,
		Value = t33[1],
		Multi = false,
		AllowNone = false,
		Callback = function(p226)
			Config.Emotes.SelectedEmote = p226
		end
	})
	Config.Sliders.Speed = 16
	Config.Sliders.Jump = 50

	local function v943()
		local HttpService2 = game:GetService("HttpService")

		if not isfolder("ValueData") then
			makefolder("ValueData")
		end

		if isfile("ValueData/mm2_values.json") then
			local ok, result = pcall(readfile, "ValueData/mm2_values.json")

			if ok and result ~= "" then
				local ok2, result2 = pcall(HttpService2.JSONDecode, HttpService2, result)

				if ok2 and result2 and tick() - result2._time < 3600 then
					return result2.data
				end
			end
		end

		local ok, result = pcall(game.HttpGet, game, "https://api.project-reverse.org/valuables/get-game-valuables?game=mm2")

		if ok then
			local data = HttpService2:JSONDecode(result)

			writefile("ValueData/mm2_values.json", HttpService2:JSONEncode({
				data = data.data,
				_time = tick()
			}))

			return data.data
		end

		local ok2, result2 = pcall(function()
			return HttpService2:JSONDecode(readfile("ValueData/mm2_values.json"))
		end)

		return ok2 and result2 and result2.data or {}
	end
	local function v954()
		local t45 = {}
		local v956 = v943()

		for _, v in pairs(v956) do
			t45[v.name] = v.price
		end

		return t45
	end

	isAnalyzing = false

	local function v959(p227)
		local response = game:GetService("ReplicatedStorage").Remotes.Extras.GetFullInventory:InvokeServer(p227)
		local t46 = {}
		local Owned = response.Weapons.Owned or {}

		for k, v in pairs(Owned) do
			t46[k] = (t46[k] or 0) + v
		end

		local Owned2 = response.Pets.Owned or {}

		for k, v in pairs(Owned2) do
			t46[k] = (t46[k] or 0) + v
		end

		return t46
	end

	GetSupremeValues = function()
		local n24 = 0

		local function v969(p228, p229, p230)
			n24 += 1
			task.spawn(function()
				if not getgenv()[p228] then
					local response = game:HttpGet(p229)

					if p230 then
						response = response:split(p230)[1]
					end

					getgenv()[p228] = response
				end

				n24 -= 1
			end)
		end

		n24 += 1
		task.spawn(function()
			if not getgenv().htmlparser then
				getgenv().htmlparser = loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/RBXL-HTML-Parser/refs/heads/master/html/init.lua"))()
			end

			n24 -= 1
		end)
		v969("SupremeAncients", "https://supremevaluelist.com/mm2/ancients.html")
		v969("SupremeChromas", "https://supremevaluelist.com/mm2/chromas.html", "<div class=\"tierheading\" id=\"pets\">Pets</div>")
		v969("SupremeGodlies", "https://supremevaluelist.com/mm2/godlies.html")
		v969("SupremeUniques", "https://supremevaluelist.com/mm2/uniques.html", "<div class=\"tierheading\" id=\"special\">Special Tier</div>")
		v969("SupremeVintages", "https://supremevaluelist.com/mm2/vintages.html")
		v969("SupremeLegendarys", "https://supremevaluelist.com/mm2/legendaries.html", "<div class=\"tierheading\" id=\"tier2\">Tier 2</div>")

		while n24 > 0 do
			task.wait()
		end

		local v971 = htmlparser.parse(SupremeAncients .. SupremeChromas .. SupremeGodlies .. SupremeUniques .. SupremeLegendarys .. SupremeVintages)
		local t47 = {}
		local itemhead = v971:select(".itemhead")
		local itembody = v971:select(".itembody")

		for i = 1, math.min(#itemhead, #itembody) do
			local name_ = itemhead[i]:content():gsub("%s<img.+$", "")

			if string.find(name_, "https://www.youtube.com/jdrbx") then
				name_ = "JD"
			end

			local t48 = {
				name = name_
			}
			local itemvalue = itembody[i]:select(".itemvalue")

			if #itemvalue > 0 then
				Value = itemvalue[1]:content():gsub(",", "")
				t48.value = Value
			end

			local itemstability = itembody[i]:select(".itemstability")

			if #itemstability > 0 then
				t48.stability = itemstability[1]:content()
			end

			local match = itembody[i]:content():match("Demand %- <b>(%d+)</b>")

			if match then
				t48.demand = tonumber(match)
			end

			local match2 = itembody[i]:content():match("Rarity %- <b>(%d+)</b>")

			if match2 then
				t48.rarity = tonumber(match2)
			end

			if not string.find(t48.name, "Nik's Scythe") then
				table.insert(t47, t48)
			end
		end

		Values = {}

		for _, v in pairs(t47) do
			Values[v.name] = {
				value = tonumber(v.value),
				rarity = v.rarity,
				demand = v.demand,
				stability = v.stability
			}
		end

		table.sort(Values, function(p231, p232)
			return p231.value > p232.value
		end)
		Database = require(game.ReplicatedStorage.Database.Sync.Item)
		NewDb = {}

		for k, v in pairs(Database) do
			if v.Rarity == "Unique" or v.Rarity == "Godly" or v.Rarity == "Ancient" or v.Rarity == "Classic" or v.Rarity == "Legendary" then
				table.insert(NewDb, {
					name = k,
					rarity = v.Rarity,
					chroma = v.Chroma or false
				})
			end
		end

		NewNewDb = {}

		for _, v in pairs(NewDb) do
			if v.name == nil then
				v.name = "???"
			end

			NewNewDb[v.name] = {
				rarity = v.rarity,
				chroma = v.chroma
			}
		end

		NewValues = {}
		CorrectNames = {
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
		tbl = {}

		for k, v in pairs(Values) do
			if not NewNewDb[k] and NewNewDb[CorrectNames[k]] then
				NewValues[CorrectNames[k]] = v
			end

			if NewNewDb[k] then
				NewValues[k] = v
			end
		end

		local t49 = {}

		for k, v in pairs(NewValues) do
			t49[k] = v.value
		end

		return t49
	end
	Values = GetSupremeValues()
	SupremeValues = Values
	USDValues = v954()
	Values = nil
	CreateLabel = function(p233)
		textlabel = Instance.new("TextLabel")
		textlabel.Position = UDim2.new(0, 0, 0, 0)
		textlabel.Size = UDim2.new(1, 0, 0.3, 0)
		textlabel.TextScaled = true
		textlabel.TextWrapped = true
		textlabel.TextSize = 14
		textlabel.TextStrokeTransparency = 0.7
		textlabel.ZIndex = 10
		textlabel.BackgroundTransparency = 1
		textlabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		textlabel.Name = "Value"
		textlabel.Parent = p233

		return textlabel
	end
	MinimumProfitPercentage = 6
	AutoOffer = false
	SelectedPriceType = "Supreme"
	ShowValuesInTrade = false
	maingui = game.Players.LocalPlayer.PlayerGui.MainGUI
	lobbygui = maingui:FindFirstChild("Lobby")
	MobileState = false

	if lobbygui then
		b = maingui.Lobby:FindFirstChild("LeaderBar")

		if b then
			MobileState = true
		else
			MobileState = false
		end
	end

	AddItem = function(p234)
		local t50 = {
			p234,
			"Weapons"
		}

		game:GetService("ReplicatedStorage"):WaitForChild("Trade"):WaitForChild("OfferItem"):FireServer(unpack(t50))
	end
	RemoveItem = function(p235)
		local t51 = {
			p235,
			"Weapons"
		}

		game:GetService("ReplicatedStorage"):WaitForChild("Trade"):WaitForChild("RemoveOffer"):FireServer(unpack(t51))
	end
	RemoveItems = function(p236)
		for _, v in pairs(p236) do
			local n25 = 1
			local v998 = MyOffer[v] or 1

			for i = n25, v998 do
				RemoveItem(v[1])
			end
		end
	end
	CalculateOffer = function(p237, p238, p239)
		startTime = tick()

		if p237 == nil then
			p237 = 0
		end

		if p237 <= 0 then
			return {}, 0
		end

		local v1000 = p237 * (1 - p239 / 100)
		local t52 = {}

		for k, v in pairs(p238) do
			for i = 1, v.quantity do
				table.insert(t52, {
					name = k,
					value = v.value
				})
			end
		end

		table.sort(t52, function(p240, p241)
			return p240.value > p241.value
		end)
		findBestOffer = function(p242, p243, p244)
			table.sort(p242, function(p245, p246)
				return p245.value > p246.value
			end)

			local t53 = {}

			for i = 0, #p242 do
				t53[i] = {}

				for i2 = 0, p243 do
					t53[i][i2] = 0
				end
			end

			local t54 = {}

			for i = 1, #p242 do
				for i2 = 0, p243 do
					t53[i][i2] = t53[i - 1][i2]

					if i2 > 0 and t53[i - 1][i2 - 1] + p242[i].value <= p244 then
						t53[i][i2] = math.max(t53[i][i2], t53[i - 1][i2 - 1] + p242[i].value)
					end
				end
			end

			local v1011 = p243

			for i = #p242, 1, -1 do
				if t53[i][v1011] ~= t53[i - 1][v1011] then
					table.insert(t54, p242[i].name)
					v1011 -= 1
				end
			end

			return t54, t53[#p242][p243]
		end

		local v1013, v1014 = findBestOffer(t52, 4, v1000)

		return v1013, v1014, startTime
	end
	UpdateValuesTable = function()
		if SelectedPriceType == "USD" then
			Values = USDValues
		else
			Values = SupremeValues
		end
	end
	UpdateValuesTable()
	GetInventory = function(p247)
		UpdateValuesTable()

		local t55 = {}

		for k, v in pairs(game:GetService("ReplicatedStorage").Remotes.Extras.GetFullInventory:InvokeServer(p247).Weapons.Owned) do
			if Values[k] and Values[k] > 0 then
				t55[k] = {
					value = Values[k],
					quantity = v
				}
			end
		end

		return t55
	end
	IsTradeAlreadyGood = function(p248, p249)
		if p248 == p249 then
			return true
		end

		return false
	end

	local function v1018(p250, p251)
		UpdateValuesTable()

		if not p251 or not p250 then
			return
		end

		for k, v in pairs(p250) do
			name = v[1]
			amount = v[2]
			PATH = trade.TheirOffer.Container["NewItem" .. k].Container

			if PATH:FindFirstChild("Value") then
				PATH.Value:Destroy()
				hisvaluelabel = CreateLabel(PATH)

				if Values[name] then
					hisvaluelabel.Text = "Value: " .. (Values[name] or 0) * amount
				else
					hisvaluelabel.Text = "Value: 0"
				end
			else
				hisvaluelabel = CreateLabel(PATH)

				if Values[name] then
					hisvaluelabel.Text = "Value: " .. (Values[name] or 0) * amount
				else
					hisvaluelabel.Text = "Value: 0"
				end
			end

			if Values[name] then
				HisTotalValue += (Values[name] or 0) * amount
			end
		end

		for k, v in pairs(p251) do
			name = v[1]
			amount = v[2]
			PATH = trade.YourOffer.Container["NewItem" .. k].Container

			if PATH:FindFirstChild("Value") then
				PATH.Value:Destroy()
				myvaluelabel = CreateLabel(PATH)

				if Values[name] then
					myvaluelabel.Text = "Value: " .. (Values[name] or 0) * amount
				else
					myvaluelabel.Text = "Value: 0"
				end
			else
				myvaluelabel = CreateLabel(PATH)

				if Values[name] then
					myvaluelabel.Text = "Value: " .. (Values[name] or 0) * amount
				else
					myvaluelabel.Text = "Value: 0"
				end

				myvaluelabel.Parent.Amount.Position = UDim2.new(0.23, -4, 0.76, 0)
			end

			if Values[name] then
				MyTotalValue += (Values[name] or 0) * amount
			end
		end

		MyTitle.Text = "YOUR OFFER | TOTAL:" .. MyTotalValue
		HisTitle.Text = "THEIR OFFER | TOTAL:" .. HisTotalValue
	end

	game:GetService("ReplicatedStorage").Trade.UpdateTrade.OnClientEvent:Connect(function(p252)
		if p252.Player2.Player == game.Players.LocalPlayer then
			Me = p252.Player2
			NotMe = p252.Player1
		end

		if p252.Player1.Player == game.Players.LocalPlayer then
			Me = p252.Player1
			NotMe = p252.Player2
		end

		HisOffer = NotMe.Offer
		MyOffer = Me.Offer

		if MobileState then
			trade = game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI_Phone.Container.Trade
		else
			trade = game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade
		end

		MyTitle = trade.YourOffer.Title
		HisTitle = trade.TheirOffer.Title
		HisTotalValue = 0
		MyTotalValue = 0

		if ShowValuesInTrade then
			v1018(HisOffer, MyOffer)
		end
	end)
	InitializeTradingConnection = function()
		MyInvWithValues = GetInventory(game.Players.LocalPlayer.Name)

		if TradingConnection then
			return TradingConnection
		end

		TradingConnection = game:GetService("ReplicatedStorage").Trade.UpdateTrade.OnClientEvent:Connect(function(p253)
			if p253.Player2.Player == game.Players.LocalPlayer then
				Me = p253.Player2
				NotMe = p253.Player1
			end

			if p253.Player1.Player == game.Players.LocalPlayer then
				Me = p253.Player1
				NotMe = p253.Player2
			end

			HisOffer = NotMe.Offer
			MyOffer = Me.Offer

			if MobileState then
				trade = game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI_Phone.Container.Trade
			else
				trade = game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade
			end

			MyTitle = trade.YourOffer.Title
			HisTitle = trade.TheirOffer.Title
			HisTotalValue = 0
			MyTotalValue = 0

			for _, v in pairs(HisOffer) do
				name = v[1]
				amount = v[2]

				if Values[name] then
					HisTotalValue += (Values[name] or 0) * amount
				end
			end

			for _, v in pairs(MyOffer) do
				name = v[1]
				amount = v[2]

				if Values[name] then
					MyTotalValue += (Values[name] or 0) * amount
				end
			end

			if AutoOffer then
				if #HisOffer == 0 then
					RemoveItems(MyOffer)

					return
				end

				local v1027, v1028 = CalculateOffer(HisTotalValue, MyInvWithValues, MinimumProfitPercentage)

				offer = v1027
				value = v1028
				tradegood = IsTradeAlreadyGood(value, MyTotalValue)

				if not (tradegood or isUpdating) then
					TradingConnection:Disconnect()
					TradingConnection = nil
					RemoveItems(MyOffer)

					for _, v in pairs(offer) do
						AddItem(v)
					end

					TradingConnection = InitializeTradingConnection()
				end
			end
		end)

		return TradingConnection
	end
	game:GetService("ReplicatedStorage").Trade.StartTrade.OnClientEvent:Connect(function()
		if MobileState then
			trade = game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI_Phone.Container.Trade
		else
			trade = game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade
		end

		MyTitle = trade.YourOffer.Title
		HisTitle = trade.TheirOffer.Title
		OLD_HIS_TITLE_TEXT = HisTitle.Text
		OLD_MY_TITLE_TEXT = MyTitle.Text

		if ShowValuesInTrade then
			MyTitle.Text = "YOUR OFFER | TOTAL: 0"
			HisTitle.Text = "THEIR OFFER | TOTAL: 0"
		end

		TradingConnection = InitializeTradingConnection()
	end)
	game:GetService("ReplicatedStorage").Trade.EndTrade.OnClientEvent:Connect(function()
		if TradingConnection then
			TradingConnection:Disconnect()
			TradingConnection = nil
		end
	end)
	game:GetService("ReplicatedStorage").Trade.AcceptTrade.OnClientEvent:Connect(function()
		if TradingConnection then
			TradingConnection:Disconnect()
			TradingConnection = nil
		end

		if AutoOffer then
			local v1031, v1032 = CalculateOffer(HisTotalValue, MyInvWithValues, MinimumProfitPercentage)

			offer = v1031
			value = v1032
			tradegood = IsTradeAlreadyGood(value, MyTotalValue)

			if not tradegood then
				for _, v in pairs(MyOffer) do
					for i = 1, v[2] do
						RemoveItem(v[1])
					end
				end

				for _, v in pairs(offer) do
					AddItem(v)
				end

				TradingConnection = InitializeTradingConnection()
			end
		end
	end)
	AutoAcceptTrades = false
	AutoReadyTrades = false

	local function v1038()
		local v1039, v1040 = CalculateOffer(HisTotalValue, MyInvWithValues, MinimumProfitPercentage)

		offer = v1039
		value = v1040
		tradegood = IsTradeAlreadyGood(value, MyTotalValue)

		if not tradegood then
			for _, v in pairs(MyOffer) do
				for i = 1, v[2] do
					RemoveItem(v[1])
				end
			end

			for _, v in pairs(offer) do
				AddItem(v)
			end
		end
	end
	local function v1046()
		for _, v in pairs(MyOffer) do
			for i = 1, v[2] do
				RemoveItem(v[1])
			end
		end
	end
	local function v1050()
		if MobileState then
			trade = game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI_Phone.Container.Trade
		else
			trade = game:GetService("Players").LocalPlayer.PlayerGui.TradeGUI.Container.Trade
		end

		HisTotalValue = 0
		MyTotalValue = 0

		for _, child in pairs(trade.TheirOffer.Container:GetChildren()) do
			if child.ClassName == "Frame" then
				if child.Container:FindFirstChild("Value") then
					child.Container:FindFirstChild("Value"):Destroy()
				end
			end
		end

		for _, child in pairs(trade.YourOffer.Container:GetChildren()) do
			if child.ClassName == "Frame" then
				if child.Container:FindFirstChild("Value") then
					child.Container:FindFirstChild("Value"):Destroy()
				end
			end
		end

		MyTitle = trade.YourOffer.Title
		HisTitle = trade.TheirOffer.Title
		HisTitle.Text = "YOUR OFFER"
		MyTitle.Text = "THEIR OFFER"
	end

	v912:Paragraph({
		Title = "Trade Helper Information",
		Desc = "This page will help u make profitable trades by using values displayed on trade (USD or Supreme) and also calculating profit percentage of that trade"
	})
	v912:Dropdown({
		Title = "Item Price Display",
		Desc = "USD or Supreme Values",
		Values = {
			"USD",
			"Supreme"
		},
		Value = "Supreme",
		Multi = false,
		AllowNone = false,
		Callback = function(p254)
			SelectedPriceType = p254
			UpdateValuesTable()
		end
	})
	v912:Toggle({
		Title = "Show Values In Trade",
		Desc = "Display Values In Trade",
		Type = "Checkbox",
		Default = false,
		Callback = function(p255)
			ShowValuesInTrade = p255

			if ShowValuesInTrade then
				local _ = pcall(v1018, HisOffer, MyOffer)
			else
				local _ = pcall(v1050)
			end
		end
	})
	v913:Paragraph({
		Title = "Auto Trade Information",
		Desc = "This page will let u automate trading and get W trades while u sleep, doing nothing but putting your account in game and giving it some stuff to start"
	})
	v913:Toggle({
		Title = "Automatically Generate Offers",
		Desc = "instant offer generation depends on your profit percentage",
		Type = "Checkbox",
		Default = false,
		Callback = function(p256)
			AutoOffer = p256
		end
	})
	v913:Button({
		Title = "Generate Offer",
		Desc = "Automatically Generates Offer And Puts it In the Trade",
		Locked = false,
		Callback = function()
			v1038()
		end
	})
	v913:Button({
		Title = "Refresh Offer",
		Desc = "Trade Glitched - Click Here",
		Locked = false,
		Callback = function()
			v1046()
		end
	})
	v913:Slider({
		Title = "Minimum Profit Percentage",
		Desc = "this will calculate the profit of your offer",
		Value = {
			Min = 0,
			Max = 100,
			Default = 6
		},
		Step = 1,
		Callback = function(p257)
			MinimumProfitPercentage = p257
		end
	})

	local function v1059(p258)
		local v1060 = v959(p258)
		local v1061 = v954()
		local t56 = {}
		local n26 = 0
		local n27 = 0

		for k, v in pairs(v1060) do
			local v1067 = v1061[k] or 0
			local v1068 = v1067 * v

			if v1067 > 0 then
				table.insert(t56, {
					name = k,
					count = v,
					price = v1067,
					total = v1068
				})
				n26 += v1068
				n27 += v
			end
		end

		table.sort(t56, function(p259, p260)
			return p259.total > p260.total
		end)

		local t57 = {
			"Inventory Analysis:",
			string.rep("-", 40)
		}

		for _, v in ipairs(t56) do
			table.insert(t57, string.format("%-20s x%-4d | $%8.2f | $%10.2f", v.name, v.count, v.price, v.total))
		end

		table.insert(t57, string.rep("-", 40))
		table.insert(t57, string.format("Total Items: %d", n27))
		table.insert(t57, string.format("Total Value: $%d", math.floor(n26)))

		return table.concat(t57, "\n")
	end
	local function v1072(p261)
		info = p261:Paragraph({
			Title = "Please Wait!",
			Desc = "Collecting information about you!",
			Buttons = { {
				Icon = "bird",
				Title = "Copy Inventory Information",
				Callback = function()
					local ok, result = pcall(v1059, game.Players.LocalPlayer.Name)

					res = ok
					inventoryData = result
					setclipboard(inventoryData)
				end
			} }
		})

		local ok, result = pcall(v1059, game.Players.LocalPlayer.Name)

		res = ok
		inventoryData = result
		info:SetTitle("Your Inventory Data:")
		info:SetDesc(inventoryData)
		isAnalyzing = false
	end

	v914:Paragraph({
		Title = "What is this?",
		Desc = "This page will help u know ur inventory value, all information about ur inventory will be sorted and organized here!",
		Color = "White"
	})
	v914:Button({
		Title = "Start Analyzis",
		Desc = "This button will analyze ur inventory and give u all data about it!",
		Locked = false,
		Callback = function()
			if not isAnalyzing then
				isAnalyzing = true
				v1072(v914)
			end
		end
	})

	local t58 = {}
	local u1078
	local u1079 = false

	local function v1080(p262)
		local n28 = 0
		local v1082 = string.match(p262, "Total Value:%s*([%d%.]+)")

		if v1082 then
			n28 = tonumber(v1082) or 0
		end

		return n28
	end
	local function v1083(p263)
		local t59 = {}

		table.insert(t59, "📦 All Players Inventories Analysis:\n")

		local t60 = {}

		for k, v in pairs(t58) do
			table.insert(t60, {
				name = k,
				desc = v.desc or v,
				totalValue = v1080(v)
			})
		end

		table.sort(t60, function(p264, p265)
			return p264.totalValue > p265.totalValue
		end)

		for _, v in ipairs(t60) do
			table.insert(t59, ("👤 %s:\n%s\n"):format(v.name, v.desc))
		end

		if u1078 then
			u1078:SetDesc(table.concat(t59, "\n"))
		else
			u1078 = p263:Paragraph({
				Title = "Players Inventories Analysis",
				Desc = table.concat(t59, "\n"),
				Color = "White"
			})
		end
	end
	local function v1090(p266, p267)
		local Name = p267.Name

		t58[Name] = "Collecting data..."
		v1083(p266)
		spawn(function()
			local ok, result = pcall(v1059, Name)

			if ok and result then
				t58[Name] = result
			else
				t58[Name] = "Failed to fetch inventory."
			end

			v1083(p266)
		end)
	end
	local function v1094(p268, p269)
		if u1079 then
			return
		end

		u1079 = true
		spawn(function()
			while u1079 do
				local players = game.Players:GetPlayers()

				for _, player in ipairs(players) do
					v1090(p268, player)
					wait(1)
				end

				wait(p269 or 60)
			end
		end)
	end

	v1094(v915, 60)

	local ReplicatedStorage3 = game:GetService("ReplicatedStorage")
	local ChangeInventoryItem = ReplicatedStorage3.Remotes.Inventory.ChangeInventoryItem
	local ItemGift = ReplicatedStorage3.ItemGift
	local BoxModule = require(ReplicatedStorage3.Modules.BoxModule)
	local Item = require(ReplicatedStorage3.Database.Sync.Item)
	local ProfileData = require(ReplicatedStorage3.Modules.ProfileData)
	local t61 = {}
	local pairs_ = pairs
	local Owned = ProfileData.Weapons.Owned or {}

	for k, v in pairs_(Owned) do
		t61[k] = v
	end

	local function v1109(p270)
		return t61[p270] or 0
	end
	local function v1110(p271, p272)
		if p271 then
			if p271 ~= "" then
				local v1111 = v1109(p271) + p272

				t61[p271] = v1111
				pcall(function()
					firesignal(ChangeInventoryItem.OnClientEvent, "Weapons", p271, v1111)
				end)
				pcall(function()
					firesignal(ItemGift.OnClientEvent, p271, "Weapons", p272)
				end)
				poop.NewItem(p271, nil, nil, "Weapons", p272)

				return
			end
		end
	end
	local function v1112(p273)
		if p273 then
			if p273 ~= "" then
				local t62 = {}
				local v1114 = p273:lower()

				for k in pairs(Item) do
					if string.find(k:lower(), v1114) then
						table.insert(t62, k)
					end
				end

				table.sort(t62)

				return t62
			end
		end

		return {}
	end
	local function v1116()
		local MysteryBox = require(ReplicatedStorage3.Database.Sync.MysteryBox)

		if not MysteryBox or next(MysteryBox) == nil then
			return nil
		end

		local t63 = {}

		for k in pairs(MysteryBox) do
			table.insert(t63, k)
		end

		return t63[math.random(1, #t63)]
	end
	local function v1120(p274)
		if not p274 or p274 == "" then
			return
		end

		pcall(function()
			BoxModule.OpenBox(v1116(), p274)
		end)
		v1110(p274, 1)
	end

	v917:Paragraph({
		Title = "Crate Opener",
		Desc = "Open crates and get any item visually!",
		Image = "package-plus",
		ImageSize = 20,
		Color = Color3.fromHex("#08b5fa")
	})

	local u1121
	local v1122

	v917:Input({
		Title = "Search Items",
		Value = "",
		Placeholder = "Enter item name...",
		Callback = function(p275)
			if p275 ~= "" then
				local v1123 = v1112(p275)

				if #v1123 > 0 and v1122 then
					v1122:Refresh(v1123)
				end
			end
		end
	})
	v1122 = v917:Dropdown({
		Title = "Select Item",
		Values = { "Search above first..." },
		Value = "Search above first...",
		Callback = function(p276)
			if p276 and p276 ~= "Search above first..." then
				u1121 = p276
			end
		end
	})
	v917:Button({
		Title = "Open Crate",
		Callback = function()
			if u1121 then
				local ok, result = pcall(function()
					v1120(u1121)
				end)

				if not ok then
					warn("[Spawner] Crate open failed: " .. tostring(result))
				end
			end
		end
	})
	v916:Paragraph({
		Title = "Item Spawner",
		Desc = "Spawn ANY weapon visually in 1 click!",
		Image = "sword",
		ImageSize = 20,
		Color = Color3.fromHex("#fa0808")
	})

	local u1126
	local n29 = 1
	local v1128

	v916:Input({
		Title = "Search Items",
		Value = "",
		Placeholder = "Enter item name...",
		Callback = function(p277)
			if p277 ~= "" then
				local v1129 = v1112(p277)

				if #v1129 > 0 and v1128 then
					v1128:Refresh(v1129)
				end
			end
		end
	})
	v1128 = v916:Dropdown({
		Title = "Select Item",
		Values = { "Search above first..." },
		Value = "Search above first...",
		Callback = function(p278)
			if p278 and p278 ~= "Search above first..." then
				u1126 = p278
			end
		end
	})
	v916:Slider({
		Title = "Quantity",
		Desc = "How many items to spawn",
		Value = {
			Min = 1,
			Max = 100,
			Default = 1
		},
		Step = 1,
		Callback = function(p279)
			n29 = p279
		end
	})
	v916:Button({
		Title = "Spawn Item",
		Callback = function()
			if u1126 then
				local ok, result = pcall(function()
					v1110(u1126, n29)
				end)

				if not ok then
					warn("[Spawner] Spawn failed: " .. tostring(result))
				end
			end
		end
	})

	local function v1132()
		local v1133 = v898:Tab({
			Title = "Autofarm",
			Locked = false
		})
		local v1134 = v898:Tab({
			Title = "Settings",
			Locked = false
		})
		local Players2 = game:GetService("Players")
		local RunService2 = game:GetService("RunService")
		local ReplicatedStorage4 = game:GetService("ReplicatedStorage")
		local TweenService_ = game:GetService("TweenService")
		local VirtualUser2 = game:GetService("VirtualUser")

		game:GetService("VirtualInputManager")

		local LocalPlayer3 = Players2.LocalPlayer
		local Remotes = ReplicatedStorage4.Remotes
		local Gameplay = Remotes.Gameplay
		local Extras = Remotes.Extras
		local response = Gameplay.GetCurrentPlayerData:InvokeServer()
		local u1145 = pcall(function()
			return Extras.AmElite:InvokeServer()
		end) and 50 or 40
		local Coins = response[LocalPlayer3.Name] and response[LocalPlayer3.Name].Coins or 0
		local n30 = 0
		local n31 = 0
		local u1149 = false
		local u1150 = response[LocalPlayer3.Name] and not response[LocalPlayer3.Name].Dead or false

		for _, v in pairs(getconnections(LocalPlayer3.Idled)) do
			pcall(function()
				v:Disable()
			end)
		end

		LocalPlayer3.Idled:connect(function()
			VirtualUser2:ClickButton2(Vector2.new())
		end)
		Gameplay.PlayerDataChanged.OnClientEvent:Connect(function(...)
			response = table.unpack({ ... })
		end)
		Gameplay.CoinCollected.OnClientEvent:Connect(function(p280, p281)
			Coins = p281
			n30 += 1
		end)
		Gameplay.LoadingMap.OnClientEvent:Connect(function()
			Coins = 0
		end)
		Gameplay.RoundStart.OnClientEvent:Connect(function()
			local ok, result = pcall(function()
				return Extras.AmElite:InvokeServer()
			end)

			u1145 = ok and result and 50 or 40
			u1150 = true
		end)
		Gameplay.RoundEndFade.OnClientEvent:Connect(function()
			u1150 = false
		end)

		local function v1155(p282)
			return p282.Character or p282.CharacterAdded:Wait()
		end
		local function v1156(p283)
			local v1157 = v1155(p283)

			return v1157 and v1157:FindFirstChild("HumanoidRootPart")
		end
		local function v1158(p284)
			local v1159 = v1155(p284)

			return v1159 and v1159:FindFirstChildOfClass("Humanoid")
		end
		local function v1160()
			local Character = LocalPlayer3.Character
			local Humanoid = Character and Character:FindFirstChildWhichIsA("Humanoid")

			return Character and Humanoid and Humanoid.Health > 0
		end
		local function v1163(p285)
			return response[p285.Name] and not response[p285.Name].Dead
		end
		local function v1164()
			for _, child in pairs(game.Workspace:GetChildren()) do
				if child:GetAttribute("MapID") then
					return child
				end
			end

			return nil
		end
		local function v1167()
			return Coins >= u1145
		end
		local function v1168(p286)
			for k, v in pairs(response) do
				if k == p286.Name then
					return v.Role
				end
			end

			return "None"
		end
		local function v1171()
			return v1168(LocalPlayer3) == "Murderer"
		end
		local function v1172()
			local n32 = 0
			local v1174 = false

			for k, v in pairs(response) do
				if k ~= LocalPlayer3.Name and v and not v.Dead then
					n32 += 1

					if v.Role == "Murderer" then
						v1174 = true
					end
				end
			end

			return v1163(LocalPlayer3) and n32 == 1 and v1174
		end
		local function v1177()
			u1149 = true
			task.wait(0.5)

			if v1160() then
				LocalPlayer3.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
			end

			repeat
				task.wait(0.2)
			until v1160()

			u1149 = false
		end
		local function v1178()
			local v1179 = v1158(LocalPlayer3)

			if LocalPlayer3.Backpack:FindFirstChild("Knife") and v1179 then
				v1179:EquipTool(LocalPlayer3.Backpack:FindFirstChild("Knife"))
			end

			local v1180 = v1155(LocalPlayer3)

			if v1180 then
				local Knife = v1180:FindFirstChild("Knife")

				if Knife then
					for _, player in pairs(Players2:GetPlayers()) do
						task.spawn(function()
							local v1184 = v1156(LocalPlayer3)

							if player.Character and v1184 and player ~= LocalPlayer3 and v1163(player) then
								local HumanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

								if HumanoidRootPart then
									task.spawn(function()
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
			end
		end

		local u1186 = true

		local function v1187(p287)
			if not u1186 then
				task.wait(0.5)
			end

			if not v1160() then
				return false
			end

			local v1188 = LocalPlayer3
			local u1189 = false

			local function v1190(p288)
				local v1191 = p288:lower()

				if v1191 ~= "all" then
					if v1191 ~= "others" then
						if v1191 == "random" then
							local players = Players2:GetPlayers()

							table.remove(players, table.find(players, v1188))

							return players[math.random(#players)]
						end

						for _, v in Players2:GetPlayers() do
							if v == v1188 then
								continue
							end

							if v.Name:lower():match("^" .. v1191) then
								return v
							end

							if v.DisplayName:lower():match("^" .. v1191) then
								return v
							end
						end

						return
					end
				end

				u1189 = true
			end
			local function v1195(p289)
				local Character = v1188.Character

				if not Character or not Character.Parent then
					return false
				end

				local Humanoid = Character:FindFirstChildOfClass("Humanoid")

				if Humanoid then
					if not (Humanoid.Health <= 0) then
						local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

						if not HumanoidRootPart then
							return false
						end

						if HumanoidRootPart.Velocity.Magnitude < 50 then
							getgenv().OldPos = HumanoidRootPart.CFrame
						end

						local Character2 = p289.Character

						if not Character2 or not Character2.Parent then
							return false
						end

						local Humanoid2 = Character2:FindFirstChildOfClass("Humanoid")

						if not Humanoid2 or Humanoid2.Sit then
							return false
						end

						local HumanoidRootPart2 = Character2:FindFirstChild("HumanoidRootPart") or Character2:FindFirstChild("Head") or Character2:FindFirstChildWhichIsA("BasePart")

						if not HumanoidRootPart2 then
							return false
						end

						workspace.CurrentCamera.CameraSubject = HumanoidRootPart2
						workspace.FallenPartsDestroyHeight = math.huge

						local BodyVelocity = Instance.new("BodyVelocity")

						BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
						BodyVelocity.Velocity = Vector3.zero
						BodyVelocity.Parent = HumanoidRootPart
						Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

						local now = tick()
						local n33 = 0
						local u1205 = false

						local function v1206()
							u1205 = true
						end

						Humanoid.Died:Connect(v1206)
						Character.AncestryChanged:Connect(function(child, parent)
							if not parent then
								v1206()
							end
						end)

						while not u1205 do
							if v1188.Character and v1188.Character.Parent and HumanoidRootPart.Parent and Humanoid.Health > 0 and Character2.Parent and Humanoid2.Parent and HumanoidRootPart2.Parent == Character2 then
								n33 += 100
								HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart2.Position) * CFrame.new(0, 1.5, 0) * CFrame.Angles(math.rad(n33), 0, 0)
								HumanoidRootPart.Velocity = Vector3.new(5000000, 5000000, 5000000)
								HumanoidRootPart.RotVelocity = Vector3.new(5000000, 5000000, 5000000)
								RunService2.Heartbeat:Wait()

								if not (HumanoidRootPart2.Velocity.Magnitude > 500 or now + 2 < tick()) then
									continue
								end
							end

							break
						end

						if BodyVelocity and BodyVelocity.Parent then
							BodyVelocity:Destroy()
						end

						if HumanoidRootPart.Parent then
							HumanoidRootPart.Velocity = Vector3.zero
							HumanoidRootPart.RotVelocity = Vector3.zero
						end

						Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
						pcall(function()
							workspace.CurrentCamera.CameraSubject = Humanoid
						end)
						workspace.FallenPartsDestroyHeight = -500

						if getgenv().OldPos and HumanoidRootPart.Parent and Humanoid.Health > 0 then
							while not u1205 and v1160() and HumanoidRootPart.Parent and Humanoid.Health > 0 do
								HumanoidRootPart.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)

								for _, v in Character:GetChildren() do
									if v:IsA("BasePart") then
										v.Velocity = Vector3.zero
										v.RotVelocity = Vector3.zero
									end
								end

								task.wait()

								if (HumanoidRootPart.Position - getgenv().OldPos.p).Magnitude < 25 then
									break
								end
							end
						end

						return
					end
				end

				return false
			end

			for _, v in p287, nil, nil do
				local v1211 = v1190(v)

				if v1211 and v1211 ~= v1188 then
					if v1160() then
						v1195(v1211)

						continue
					end

					return false
				end
			end

			if u1189 then
				for _, v in Players2:GetPlayers() do
					if v ~= v1188 then
						v1195(v)
					end
				end
			end

			return true
		end

		local u1214 = false
		local n34 = 0

		local function v1216()
			u1214 = true
			n34 = tick()
			task.delay(30, function()
				if tick() - n34 >= 30 then
					u1214 = false
				end
			end)
		end

		local t64 = { "Any" }
		local s15 = "Under"
		local n35 = 22.7
		local u1220 = false
		local u1221 = false
		local u1222 = false

		local function v1223()
			local v1224 = v1156(LocalPlayer3)

			if not v1224 then
				return nil
			end

			local CoinContainer = v1164() and v1164():FindFirstChild("CoinContainer")

			if not CoinContainer then
				return nil
			end

			local t65 = {}

			for _, child in pairs(CoinContainer:GetChildren()) do
				if child:GetAttribute("CoinID") and not child:GetAttribute("Collected") and (table.find(t64, child:GetAttribute("CoinID")) or table.find(t64, "Any")) then
					local CoinVisual = child:FindFirstChild("CoinVisual")

					if CoinVisual and CoinVisual.MainCoin.Transparency == 0 then
						table.insert(t65, {
							coin = child,
							distance = (v1224.Position - child.Position).Magnitude
						})
					end
				end
			end

			table.sort(t65, function(p290, p291)
				return p290.distance < p291.distance
			end)

			return t65[1] and t65[1].coin or nil
		end

		local Part2
		local connection
		local connection2
		local Position
		local connection3

		local function v1235(p292)
			getgenv().ValAutoFarmCoins = p292

			if p292 then
				Part2 = Instance.new("Part")
				Part2.Name = "ValFarmFloat"
				Part2.Size = Vector3.new(5, 0.1, 5)
				Part2.CanCollide = true
				Part2.Anchored = true
				Part2.Parent = workspace
				Part2.Transparency = 1
				Position = v1156(LocalPlayer3) and v1156(LocalPlayer3).Position or Vector3.zero
				connection = RunService2.RenderStepped:Connect(function()
					if v1156(LocalPlayer3) then
						local pairs_2 = pairs
						local v1237 = v1155(LocalPlayer3)

						for _, descendant in pairs_2(v1237:GetDescendants()) do
							if descendant:IsA("BasePart") and descendant.CanCollide then
								descendant.CanCollide = false
							end
						end
					end
				end)
				connection3 = RunService2.RenderStepped:Connect(function(dt)
					n31 += dt
				end)
				connection2 = RunService2.Heartbeat:Connect(function()
					local v1240 = v1156(LocalPlayer3)

					if v1240 and Part2 and v1160() and not u1149 then
						local cFrame = Part2.CFrame * CFrame.new(0, 3, 0)

						if v1163(LocalPlayer3) and not v1167() and u1150 then
							cFrame *= CFrame.Angles(math.rad(90), 0, 0)
						end

						v1240.CFrame = cFrame
						v1240.Velocity = Vector3.zero
						v1240.RotVelocity = Vector3.zero
					end
				end)
			else
				if connection then
					connection:Disconnect()
					connection = nil
				end

				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end

				if connection3 then
					connection3:Disconnect()
					connection3 = nil
				end

				if Part2 then
					Part2:Destroy()
					Part2 = nil
				end

				local v1242 = v1156(LocalPlayer3)

				if v1242 and Position then
					v1242.Anchored = true
					v1242.CFrame = CFrame.new(Position)
					v1242.Velocity = Vector3.zero
					task.wait(0.7)
					v1242.Anchored = false
				end
			end

			spawn(function()
				while getgenv().ValAutoFarmCoins do
					local v1243 = v1156(LocalPlayer3)

					if not (v1243 and v1160()) then
						task.wait(1)
					elseif v1164() then
						if v1163(LocalPlayer3) and not v1167() and u1150 then
							local v1244 = v1223()

							if v1244 then
								local v1245 = s15 == "Under" and -6 or -2
								local cFrame = CFrame.new(v1244.Position) * CFrame.new(0, v1245 - 1, 0)
								local Magnitude = (v1243.Position - cFrame.Position).Magnitude

								if Magnitude >= 200 then
									Part2.CFrame = cFrame
								else
									local tween = TweenService_:Create(Part2, TweenInfo.new(Magnitude / n35, Enum.EasingStyle.Linear), {
										CFrame = cFrame
									})

									tween:Play()

									if not v1167() then
										tween.Completed:Wait()
										tween:Cancel()
									end
								end

								task.spawn(function()
									while v1244 do
										if v1243 then
											if not v1244:GetAttribute("Collected") then
												for i = 0, 200 do
													task.spawn(function()
														pcall(function()
															firetouchinterest(v1243, v1244, 1)
															firetouchinterest(v1243, v1244, 0)
														end)
													end)
												end

												task.wait()

												continue
											end
										end

										break
									end
								end)
								v1244:Destroy()
							end
						else
							if not u1150 then
								if Part2 and Part2.Parent then
									Part2.CFrame = CFrame.new(100, 0, 100)
								end

								task.wait(0.1)
								task.wait()

								continue
							end

							if not u1222 or v1171() or not v1160() then
								if v1171() and u1220 and v1167() and v1163(LocalPlayer3) and v1160() then
									v1178()
								end

								if u1221 and v1167() and v1160() and not (v1171() or u1214 or not v1163(LocalPlayer3)) then
									v1177()
								end

								if Part2 and Part2.Parent then
									Part2.CFrame = CFrame.new(100, 0, 100)
								end

								task.wait(0.1)
								task.wait()

								continue
							end

							if v1167() then
								if v1172() then
									v1177()
								else
									for k, v in pairs(response) do
										if not (k == LocalPlayer3.Name or v.Role ~= "Murderer" or v.Dead) then
											u1149 = true
											v1216()
											u1186 = v1187({ k })
											u1149 = false
											task.wait(0.5)

											break
										end
									end
								end
							elseif v1171() and u1220 and v1167() and v1163(LocalPlayer3) and v1160() then
								v1178()
							end

							if u1221 and v1167() and v1160() and not (v1171() or u1214 or not v1163(LocalPlayer3)) then
								v1177()
							end

							if Part2 and Part2.Parent then
								Part2.CFrame = CFrame.new(100, 0, 100)
							end

							task.wait(0.1)
							task.wait()

							continue
						end
					elseif Part2 then
						Part2.CFrame = CFrame.new(100, 0, 100)
					end

					task.wait()
				end
			end)
		end
		local function v1252(p293)
			local connection4

			if p293 then
				connection4 = RunService2.Heartbeat:Connect(function()
					for _, player in ipairs(Players2:GetPlayers()) do
						if player ~= LocalPlayer3 and player.Character then
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

			return connection4
		end

		v1133:Section({
			Title = "Session Statistics"
		})

		local function v1258(p294)
			return string.format("%02d:%02d:%02d", math.floor(p294 / 3600), math.floor(p294 / 60) % 60, p294 % 60)
		end
		local function v1259(p295)
			return tostring(p295):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
		end

		local v1260 = v1133:Paragraph({
			Title = "Session Progress",
			Desc = "<b>Time:</b> 00:00:00\n<b>Coins:</b> 0 | <b>Per Hour:</b> 0",
			Locked = false
		})
		local n36 = 0

		RunService2.Heartbeat:Connect(function()
			if tick() - n36 > 0.5 then
				n36 = tick()
				v1260:SetDesc(string.format("<b>Time:</b> %s\n<b>Coins:</b> %s | <b>Per Hour:</b> %s", v1258(n31), v1259(n30), n31 > 0 and v1259(math.round(n30 / n31 * 3600)) or "0"))
			end
		end)
		v1133:Divider()
		v1133:Section({
			Title = "Farming"
		})
		v1133:Toggle({
			Title = "Enable Coin Auto Farm",
			Type = "Toggle",
			Default = false,
			Callback = function(p296)
				v1235(p296)
			end
		})
		v1134:Section({
			Title = "Farm Settings"
		})
		v1134:Dropdown({
			Title = "Coin Types",
			Values = {
				"Any",
				"Candy",
				"BeachBall",
				"Coin",
				"SnowToken",
				"Egg"
			},
			Value = { "Any" },
			Multi = true,
			AllowNone = false,
			Callback = function(p297)
				t64 = p297
			end
		})
		v1134:Dropdown({
			Title = "Teleport Mode",
			Values = {
				"Under",
				"Normal"
			},
			Value = "Under",
			Multi = false,
			AllowNone = false,
			Callback = function(p298)
				s15 = p298
			end
		})
		v1134:Slider({
			Title = "Farm Speed",
			Desc = "Above 22 might kick",
			Step = 0.1,
			Value = {
				Min = 19,
				Max = 26,
				Default = 22.7
			},
			Callback = function(p299)
				n35 = p299
			end
		})
		v1134:Divider()
		v1134:Section({
			Title = "On Full Bag"
		})
		v1134:Toggle({
			Title = "Kill All (Knife Required)",
			Type = "Toggle",
			Default = false,
			Callback = function(p300)
				u1220 = p300
			end
		})
		v1134:Toggle({
			Title = "Reset On Full Bag",
			Type = "Toggle",
			Default = false,
			Callback = function(p301)
				u1221 = p301
			end
		})
		v1134:Toggle({
			Title = "Fling Murderer On Full Bag",
			Type = "Toggle",
			Default = false,
			Callback = function(p302)
				u1222 = p302
			end
		})
		v1134:Divider()
		v1134:Section({
			Title = "Utilities"
		})

		local u1262

		v1134:Toggle({
			Title = "Anti Fling",
			Type = "Toggle",
			Default = false,
			Callback = function(p303)
				if u1262 then
					u1262:Disconnect()
					u1262 = nil
				end

				if p303 then
					u1262 = v1252(true)
				end
			end
		})
		v1134:Toggle({
			Title = "Disable Rendering",
			Desc = "Lowers CPU usage (Black Screen)",
			Default = false,
			Callback = function(p304)
				game:GetService("RunService"):Set3dRenderingEnabled(not p304)
			end
		})
	end

	v1132()

	local v1263 = v676:Section({
		Title = "Info",
		Icon = "info",
		Opened = false
	})

	v668(v1263)
end
