-- discord.gg/syncrypt

local v1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))():CreateWindow({
	Title = "Project Reverse [Adopt Me] - Cool Things!",
	Icon = "slice",
	Transparent = true,
	Author = "By Project Reverse",
	Size = UDim2.fromOffset(580, 460),
	MinSize = Vector2.new(429, 280),
	MaxSize = Vector2.new(1000, 800),
	Theme = "Dark",
	SideBarWidth = 180
})

v1:EditOpenButton({
	Title = "Open Prev UI",
	Icon = "monitor",
	CornerRadius = UDim.new(0, 32),
	StrokeThickness = 2,
	Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
	OnlyMobile = false,
	Enabled = true,
	Draggable = true
})

local v2 = v1:Section({
	Title = "Spawner",
	Icon = "egg",
	Opened = false
})
local v3 = v1:Section({
	Title = "Trade Helper",
	Icon = "handshake",
	Opened = false
})
local v4 = v1:Section({
	Title = "Inventory Helper",
	Icon = "backpack",
	Opened = false
})
local v5 = v2:Tab({
	Title = "Pet Spawner",
	Locked = false
})
local v6 = v3:Tab({
	Title = "Trade Info",
	Locked = false
})
local v7 = v4:Tab({
	Title = "Inventory Analyzer",
	Locked = false
})

local function v8()
	local load_ = require(game.ReplicatedStorage:WaitForChild("Fsys")).load

	set_thread_identity(2)

	local ClientData = load_("ClientData")
	local KindDB = load_("KindDB")
	local RouterClient = load_("RouterClient")
	local DownloadClient = load_("DownloadClient")
	local AnimationManager = load_("AnimationManager")
	local v16 = load_("new:PetRigs")
	local predict = ClientData.predict
	local get = ClientData.get
	local get_data = ClientData.get_data
	local rollback_prediction = ClientData.rollback_prediction
	local register_callback = ClientData.register_callback
	local update = ClientData.update

	pcall(function()
		if islclosure and islclosure(predict) then
			for i = 1, 50 do
				local v24, v25 = debug.getupvalue(predict, i)

				if v24 == nil then
					break
				end

				if type(v25) == "table" and rawget(v25, "predict") then
					predict = v25.predict or predict
					get = v25.get or get
					get_data = v25.get_data or get_data
					rollback_prediction = v25.rollback_prediction or rollback_prediction
					update = v25.update or update

					break
				end
			end
		end
	end)
	set_thread_identity(8)

	local t2 = {}
	local t3 = {}
	local u28
	local u29
	local u30
	local t4 = {}
	local t5 = {}
	local u33 = false
	local t6 = {}
	local u35
	local LocalPlayer = game.Players.LocalPlayer
	local get2

	local function v38(p1)
		if type(p1) ~= "table" then
			return p1
		end

		local kind = typeof and typeof(p1)

		if kind == "Instance" or kind == "Color3" or kind == "CFrame" or kind == "Vector3" or kind == "EnumItem" then
			return p1
		end

		local t7 = {}

		for k, v in pairs(p1) do
			t7[k] = v38(v)
		end

		return t7
	end
	local function v43(p2)
		if not p2 then
			return nil
		end

		if tostring(p2.sender) == LocalPlayer.Name then
			return "sender_offer"
		end

		if tostring(p2.recipient) == LocalPlayer.Name then
			return "recipient_offer"
		end

		return nil
	end
	local function v44(p3)
		local n1 = 0

		for _ in pairs(t4) do
			n1 += 1
		end

		if n1 == 0 then
			return false
		end

		if #p3 ~= n1 then
			return false
		end

		for _, v in ipairs(p3) do
			if t4[v.unique] then
				continue
			end

			return false
		end

		return true
	end
	local function v49(p4)
		if not p4 or next(t4) == nil then
			return p4
		end

		local v50 = v43(p4)

		if not v50 or not p4[v50] then
			return p4
		end

		if v44(p4[v50].items or {}) then
			return p4
		end

		local v51 = v38(p4)
		local items = {}

		for _, v in ipairs(t5) do
			if t4[v] then
				table.insert(items, t4[v])
			end
		end

		v51[v50].items = items

		return v51
	end
	local function v55(p5, p6)
		local v56 = get(p5)

		if v56 == nil then
			return
		end

		local ok, result = pcall(table.clone, v56)

		if not ok then
			return
		end

		local v59 = p6(result)

		if v59 ~= nil then
			pcall(predict, p5, v59)
		end
	end
	local function v60()
		return game:GetService("HttpService"):GenerateGUID(false)
	end
	local function v61(p7)
		if t2[p7] then
			return t2[p7]
		end

		local v62 = DownloadClient.promise_download_copy("Pets", p7):expect()

		t2[p7] = v62

		return v62
	end
	local function spawnPet(p8, p9)
		local v64 = v60()
		local t8

		set_thread_identity(2)
		v55("inventory", function(p10)
			local v66 = table.clone(p10.pets)

			t8 = {
				unique = v64,
				category = "pets",
				id = p8,
				kind = KindDB[p8].kind,
				newness_order = 0,
				properties = p9
			}
			v66[v64] = t8
			p10.pets = v66

			return p10
		end)
		set_thread_identity(8)
		t3[v64] = {
			data = t8,
			model = nil
		}

		return t8
	end
	local function v67(p11, p12)
		local PetModel = p11:FindFirstChild("PetModel")

		if not PetModel then
			return
		end

		for k, neonPart in pairs(p12.neon_parts) do
			local v71 = v16.get(PetModel).get_geo_part(PetModel, k)

			v71.Material = neonPart.Material
			v71.Color = neonPart.Color
		end
	end
	local function v72(p13)
		v55("pet_char_wrappers", function(p14)
			p13.unique = #p14 + 1
			p13.index = #p14 + 1
			p14[#p14 + 1] = p13

			return p14
		end)
	end
	local function v73(p15)
		v55("pet_state_managers", function(p16)
			p16[#p16 + 1] = p15

			return p16
		end)
	end
	local function v74(p17, p18)
		for k, v in pairs(p17) do
			if p18(v, k) then
				return k
			end
		end

		return nil
	end
	local function v77(p19)
		v55("pet_char_wrappers", function(p20)
			local v78 = v74(p20, function(p21)
				return p21.pet_unique == p19
			end)

			if not v78 then
				return p20
			end

			table.remove(p20, v78)

			for k, v in pairs(p20) do
				v.unique = k
				v.index = k
			end

			return p20
		end)
	end
	local function v81(p22)
		local v82 = t3[p22]

		if not v82 then
			return
		end

		if v82.model then
			v55("pet_state_managers", function(p23)
				local v83 = v74(p23, function(p24)
					return p24.char == v82.model
				end)

				if not v83 then
					return p23
				end

				local v84 = table.clone(p23)

				v84[v83] = table.clone(v84[v83])
				v84[v83].states = {}

				return v84
			end)

			return
		end
	end
	local function v85(p25, p26)
		local v86 = t3[p25]

		if not v86 then
			return
		end

		if v86.model then
			v55("pet_state_managers", function(p27)
				local v87 = v74(p27, function(p28)
					return p28.char == v86.model
				end)

				if not v87 then
					return p27
				end

				local v88 = table.clone(p27)

				v88[v87] = table.clone(v88[v87])
				v88[v87].states = { {
					id = p26
				} }

				return v88
			end)

			return
		end
	end
	local function v89(p29)
		local Character = game.Players.LocalPlayer.Character

		if not Character then
			return false
		end

		if not Character.PrimaryPart then
			return false
		end

		local RidePosition = p29:FindFirstChild("RidePosition", true)

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
	local function v94()
		v55("state_manager", function(p30)
			local v95 = table.clone(p30)

			v95.states = {}
			v95.is_sitting = false

			return v95
		end)
	end
	local function v96(p31)
		v55("state_manager", function(p32)
			local v97 = table.clone(p32)

			v97.states = { {
				id = p31
			} }
			v97.is_sitting = true

			return v97
		end)
	end
	local function v98(p33)
		local v99 = t3[p33]

		if not v99 then
			return
		end

		if v99.model then
			v55("pet_state_managers", function(p34)
				local v100 = v74(p34, function(p35)
					return p35.char == v99.model
				end)

				if v100 then
					table.remove(p34, v100)

					return p34
				end

				return p34
			end)

			return
		end
	end
	local function v101(p36)
		local v102 = t3[p36]

		if not v102 then
			return
		end

		if not v102.model then
			return
		end

		if u30 then
			u30:Stop()
			u30:Destroy()
		end

		local SourceAttachment = v102.model:FindFirstChild("SourceAttachment", true)

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

		v81(p36)
		v94()
		v102.model:ScaleTo(1)
		u29 = nil
	end
	local function v106(p37, p38, p39)
		local v107 = t3[p37]

		if not v107 then
			return
		end

		if not v107.model then
			return
		end

		local LocalPlayer2 = game.Players.LocalPlayer

		if not LocalPlayer2.Character then
			return
		end

		if not LocalPlayer2.Character.PrimaryPart then
			return
		end

		u29 = p37
		v85(p37, p39)
		v96(p38)
		v107.model:ScaleTo(2)
		v89(v107.model)
		u30 = LocalPlayer2.Character.Humanoid.Animator:LoadAnimation(AnimationManager.get_track("PlayerRidingPet"))
		LocalPlayer2.Character.Humanoid.Sit = true

		for _, descendant in pairs(LocalPlayer2.Character:GetDescendants()) do
			if descendant:IsA("BasePart") and descendant.Massless == false then
				descendant.Massless = true
				descendant:SetAttribute("HaveMass", true)
			end
		end

		u30:Play()
	end
	local function v111(p40)
		v106(p40, "PlayerFlyingPet", "PetBeingFlown")
	end
	local function v112(p41)
		v106(p41, "PlayerRidingPet", "PetBeingRidden")
	end
	local function v113(p42)
		local v114 = t3[p42.unique]

		if not v114 then
			return
		end

		if not v114.model then
			return
		end

		v101(p42.unique)
		v77(p42.unique)
		v98(p42.unique)
		v114.model:Destroy()
		v114.model = nil
		u28 = nil
		pcall(function()
			v55("equip_manager", function(p43)
				local v115 = table.clone(p43[p42.category] or {})

				for i = #v115, 1, -1 do
					if v115[i].unique == p42.unique then
						table.remove(v115, i)
					end
				end

				p43[p42.category] = v115

				return p43
			end)
		end)
	end
	local function v117(p44)
		if u28 then
			v113(u28)
		end

		if get2 then
			local v118 = get("pet_char_wrappers")

			if v118 then
				for _, v in pairs(v118) do
					if not (v.player ~= game.Players.LocalPlayer or t3[v.pet_unique]) then
						get2("ToolAPI/Unequip"):InvokeServer(v.pet_unique)
					end
				end
			end
		end

		local clone = v61(p44.kind):Clone()
		local Character = game.Players.LocalPlayer.Character

		if Character and Character.PrimaryPart then
			clone:PivotTo(Character.PrimaryPart.CFrame * CFrame.new(3, 0, 0))
		end

		clone.Parent = workspace
		t3[p44.unique].model = clone

		if p44.properties.neon or p44.properties.mega_neon then
			pcall(v67, clone, KindDB[p44.kind])
		end

		u28 = p44

		local v123 = v72

		v123({
			char = clone,
			mega_neon = p44.properties.mega_neon,
			neon = p44.properties.neon,
			player = game.Players.LocalPlayer,
			entity_controller = game.Players.LocalPlayer,
			controller = game.Players.LocalPlayer,
			rp_name = p44.properties.rp_name or "",
			pet_trick_level = p44.properties.pet_trick_level,
			pet_unique = p44.unique,
			pet_id = p44.id,
			location = {
				full_destination_id = "housing",
				destination_id = "housing",
				house_owner = game.Players.LocalPlayer
			},
			pet_progression = {
				friendship_level = p44.properties.friendship_level,
				age = p44.properties.age,
				percentage = 0
			},
			are_colors_sealed = false,
			is_pet = true
		})
		v73({
			char = clone,
			player = game.Players.LocalPlayer,
			store_key = "pet_state_managers",
			is_sitting = false,
			chars_connected_to_me = {},
			states = {}
		})
		pcall(function()
			v55("equip_manager", function(p45)
				local v124 = table.clone(p45[p44.category] or {})

				for i = #v124, 1, -1 do
					if v124[i].unique == p44.unique then
						table.remove(v124, i)
					end
				end

				table.insert(v124, 1, p44)
				p45[p44.category] = v124

				return p45
			end)
		end)
	end

	get2 = RouterClient.get

	local function v126(p46)
		return {
			InvokeServer = function(...)
				return p46(select(2, ...))
			end
		}
	end
	local function v127(p47)
		return {
			FireServer = function(...)
				return p47(select(2, ...))
			end
		}
	end

	local v128 = v126(function(p48, p49)
		local v129 = t3[p48]

		if v129 then
			v117(v129.data)

			return true, {
				action = "equip",
				is_server = true
			}
		end

		if u28 then
			v113(u28)
		end

		return get2("ToolAPI/Equip"):InvokeServer(p48, p49)
	end)
	local v130 = v126(function(p50)
		local v131 = t3[p50]

		if not v131 then
			return get2("ToolAPI/Unequip"):InvokeServer(p50)
		end

		v113(v131.data)

		return true, {
			action = "unequip",
			is_server = true
		}
	end)
	local v132 = v126(function(p51)
		v112(p51.pet_unique)
	end)
	local v133 = v126(function(p52)
		v111(p52.pet_unique)
	end)
	local v134 = v126(function()
		v101(u29)
	end)
	local v135 = v127(function()
		v101(u29)
	end)
	local v136 = v126(function()
		local t9 = {}

		pcall(function()
			t9 = get2("TradeAPI/GetTradeHistory"):InvokeServer() or {}
		end)

		if #t6 == 0 then
			return t9
		end

		local t10 = {}

		for _, v in ipairs(t9) do
			local v141 = false

			for _, v9 in ipairs(t6) do
				if (v.sender_user_id == v9.sender_user_id and v.recipient_user_id == v9.recipient_user_id or v.sender_user_id == v9.recipient_user_id and v.recipient_user_id == v9.sender_user_id) and math.abs(v.timestamp - v9.timestamp) < 30 then
					v141 = true

					break
				end
			end

			if not v141 then
				table.insert(t10, v)
			end
		end

		for _, v in ipairs(t6) do
			table.insert(t10, v)
		end

		table.sort(t10, function(p53, p54)
			return p53.timestamp < p54.timestamp
		end)

		return t10
	end)
	local v146 = v127(function(p55)
		if t3[p55] then
			t4[p55] = t3[p55].data
		else
			local v147 = get("inventory")

			if v147 then
				for _, v in pairs(v147) do
					if type(v) == "table" and v[p55] then
						t4[p55] = v[p55]

						break
					end
				end
			end

			pcall(function()
				get2("TradeAPI/AddItemToOffer"):FireServer(p55)
			end)
		end

		table.insert(t5, p55)
	end)
	local v150 = v127(function(p56)
		local v151 = t3[p56] ~= nil

		t4[p56] = nil

		for i, v in ipairs(t5) do
			if v == p56 then
				table.remove(t5, i)

				break
			end
		end

		if not v151 then
			pcall(function()
				get2("TradeAPI/RemoveItemFromOffer"):FireServer(p56)
			end)
		end

		task.defer(function()
			u33 = true

			local function v154()
				set_thread_identity(2)
				rollback_prediction("trade")
				set_thread_identity(8)
			end

			pcall(v154)

			if next(t4) == nil then
				u33 = false

				return
			end

			local v155 = get("trade")

			if not v155 then
				u33 = false

				return
			end

			local v156 = v49(v155)

			if v156 and v156 ~= v155 then
				pcall(function()
					set_thread_identity(2)
					predict("trade", v156)
					set_thread_identity(8)
				end)
			end

			u33 = false
		end)
	end)

	RouterClient.get = function(p57)
		if p57 == "ToolAPI/Equip" then
			return v128
		end

		if p57 == "ToolAPI/Unequip" then
			return v130
		end

		if p57 == "AdoptAPI/RidePet" then
			return v132
		end

		if p57 == "AdoptAPI/FlyPet" then
			return v133
		end

		if p57 == "AdoptAPI/ExitSeatStatesYield" then
			return v134
		end

		if p57 == "AdoptAPI/ExitSeatStates" then
			return v135
		end

		if p57 == "TradeAPI/AddItemToOffer" then
			if checkcaller() then
				return get2(p57)
			end

			return v146
		end

		if p57 == "TradeAPI/RemoveItemFromOffer" then
			if checkcaller() then
				return get2(p57)
			end

			return v150
		end

		if p57 == "TradeAPI/GetTradeHistory" then
			return v136
		end

		return get2(p57)
	end
	pcall(function()
		local TradeApp = LocalPlayer.PlayerGui:FindFirstChild("TradeApp")

		if TradeApp then
			TradeApp:GetPropertyChangedSignal("Enabled"):Connect(function()
				if not (TradeApp.Enabled or next(t4) == nil) then
					TradeApp.Enabled = true
				end
			end)
		end
	end)
	set_thread_identity(2)
	register_callback("trade", function(p58, p59)
		if u33 then
			return
		end

		if p59 == nil then
			pcall(function()
				if u35 and next(t4) ~= nil then
					local sender_offer = u35.sender_offer
					local recipient_offer = u35.recipient_offer

					if sender_offer and recipient_offer and (sender_offer.confirmed and recipient_offer.confirmed or u35.current_stage == "confirmation") then
						local v160 = tostring(u35.sender) == LocalPlayer.Name
						local items = sender_offer.items or {}
						local items2 = recipient_offer.items or {}
						local t11 = {}

						for _, item in ipairs(items) do
							table.insert(t11, {
								category = item.category,
								kind = item.kind,
								id = item.id,
								properties = {
									flyable = item.properties and item.properties.flyable or nil,
									rideable = item.properties and item.properties.rideable or nil,
									neon = item.properties and item.properties.neon or nil,
									mega_neon = item.properties and item.properties.mega_neon or nil,
									age = item.properties and item.properties.age or nil
								}
							})
						end

						local t12 = {}

						for _, v in ipairs(items2) do
							table.insert(t12, {
								category = v.category,
								kind = v.kind,
								id = v.id,
								properties = {
									flyable = v.properties and v.properties.flyable or nil,
									rideable = v.properties and v.properties.rideable or nil,
									neon = v.properties and v.properties.neon or nil,
									mega_neon = v.properties and v.properties.mega_neon or nil,
									age = v.properties and v.properties.age or nil
								}
							})
						end

						local sender = u35.sender
						local recipient = u35.recipient

						table.insert(t6, 1, {
							trade_id = "fake_" .. tostring(tick()) .. "_" .. math.random(10000, 99999),
							sender_items = t11,
							recipient_items = t12,
							sender_name = sender_offer.player_name or typeof(sender) == "Instance" and sender.Name or "",
							recipient_name = recipient_offer.player_name or typeof(recipient) == "Instance" and recipient.Name or "",
							sender_user_id = typeof(sender) == "Instance" and sender.UserId or 0,
							recipient_user_id = typeof(recipient) == "Instance" and recipient.UserId or 0,
							timestamp = os.time()
						})
					end
				end
			end)
			u35 = nil
			t4 = {}
			t5 = {}
			pcall(function()
				rollback_prediction("trade")
			end)

			return
		end

		u35 = v38(p59)

		if next(t4) ~= nil then
			local v171 = v49(u35)

			if v171 then
				u35 = v171
			end
		end

		if next(t4) == nil then
			return
		end

		local v172 = v43(p59)

		if not v172 or not p59[v172] then
			return
		end

		if v44(p59[v172].items or {}) then
			return
		end

		task.defer(function()
			if next(t4) == nil then
				return
			end

			local v173 = get("trade")

			if not v173 then
				return
			end

			local v174 = v49(v173)

			if v174 ~= v173 then
				u33 = true

				local _ = pcall(function()
					set_thread_identity(2)
					predict("trade", v174)
					set_thread_identity(8)
				end)

				u33 = false
			end
		end)
	end)
	register_callback("inventory", function(p60, p61)
		if not p61 then
			return
		end

		local v177 = false

		for _ in pairs(t3) do
			v177 = true

			break
		end

		if not v177 then
			return
		end

		local v179 = true

		if p61.pets then
			for k in pairs(t3) do
				if not p61.pets[k] then
					v179 = false

					break
				end
			end
		else
			v179 = false
		end

		if v179 then
			return
		end

		local v181 = get_data()
		local inventory = v181 and v181[LocalPlayer.Name] and v181[LocalPlayer.Name].inventory

		if not inventory then
			return
		end

		local v183 = table.clone(inventory)

		v183.pets = table.clone(v183.pets or {})

		for k, v in pairs(t3) do
			if not v183.pets[k] then
				v183.pets[k] = v.data
			end
		end

		task.defer(function()
			pcall(function()
				set_thread_identity(2)
				predict("inventory", v183)
				set_thread_identity(8)
			end)
		end)
	end)
	set_thread_identity(8)
	pcall(function()
		set_thread_identity(2)

		local OfferPane = load_("OfferPane")

		set_thread_identity(8)

		if OfferPane then
			if OfferPane._build_slot then
				local _build_slot = OfferPane._build_slot

				OfferPane._build_slot = function(p62, ...)
					local do_not_display_tags = p62.props and p62.props.do_not_display_tags

					if p62.props then
						p62.props.do_not_display_tags = false
					end

					local v189 = _build_slot(p62, ...)

					if p62.props then
						p62.props.do_not_display_tags = do_not_display_tags
					end

					return v189
				end
			end
		end
	end)
	task.spawn(function()
		while task.wait(0.5) do
			if ClientData.get ~= get then
				local get3 = ClientData.get

				ClientData.get = function(p63)
					local v191 = get3(p63)

					if checkcaller() then
						return v191
					end

					if p63 == "inventory" and v191 and type(v191) == "table" and next(t3) ~= nil then
						v191 = table.clone(v191)
						v191.pets = table.clone(v191.pets or {})

						for k, v in pairs(t3) do
							v191.pets[k] = v.data
						end
					elseif p63 == "equip_manager" then
						local v194 = get(p63)

						if v194 then
							return v194
						end
					end

					return v191
				end

				break
			end
		end
	end)

	local v195 = get("pet_char_wrappers") or {}

	for _, v in pairs(v195) do
		get2("ToolAPI/Unequip"):InvokeServer(v.pet_unique)
	end

	local InventoryDB = require(game.ReplicatedStorage.Fsys).load("InventoryDB")

	GetPetByName = function(p64)
		for _, pet in pairs(InventoryDB.pets) do
			if pet.name:lower() == p64:lower() then
				return pet.id
			end
		end

		return false
	end

	local t1 = {
		SpawnPet = spawnPet,
		FindPet = GetPetByName
	}

	return t1
end

local v201 = v8()
local s1 = "Normal"
local s2 = "Shadow Dragon"

set_thread_identity(6)
v5:Dropdown({
	Title = "Select Pet Neon Type (FR/NFR/MFR)",
	Values = {
		"Normal",
		"Neon",
		"Mega Neon"
	},
	Value = s1,
	Callback = function(p65)
		s1 = p65 or "Normal"
	end
})
v5:Input({
	Title = "Select Pet Name",
	Value = s2,
	Callback = function(p66)
		s2 = p66 or "Cat"
	end
})
v5:Button({
	Title = "Spawn Pet",
	Callback = function()
		local v204 = v201.FindPet(s2)

		if v204 then
			if s1 == "Normal" then
				v201.SpawnPet(v204, {
					pet_trick_level = 0,
					rideable = true,
					flyable = true,
					friendship_level = 0,
					age = 1,
					rp_name = ""
				})
			elseif s1 == "Neon" then
				v201.SpawnPet(v204, {
					pet_trick_level = 0,
					neon = true,
					rideable = true,
					flyable = true,
					friendship_level = 0,
					age = 1,
					rp_name = ""
				})
			elseif s1 == "Mega Neon" then
				v201.SpawnPet(v204, {
					pet_trick_level = 0,
					mega_neon = true,
					rideable = true,
					flyable = true,
					friendship_level = 0,
					age = 1,
					rp_name = ""
				})
			end
		end
	end
})

local function v205()
	local HttpService = game:GetService("HttpService")

	if not isfolder("ValueData") then
		makefolder("ValueData")
	end

	if isfile("ValueData/adopt_values.json") then
		local ok, result = pcall(readfile, "ValueData/adopt_values.json")

		if ok and result ~= "" then
			local ok2, result2 = pcall(HttpService.JSONDecode, HttpService, result)

			if ok2 and result2 and tick() - result2._time < 3600 then
				return result2.data
			end
		end
	end

	local ok, result = pcall(game.HttpGet, game, "http://72.56.90.233:3910/api/valuables/get-game-valuables?game=ame")

	if not ok then
		local ok2, result2 = pcall(function()
			return HttpService:JSONDecode(readfile("ValueData/adopt_values.json"))
		end)

		return ok2 and result2 and result2.data or {}
	end

	local ok2, result2 = pcall(HttpService.JSONDecode, HttpService, result)

	if not ok2 or type(result2) ~= "table" then
		return {}
	end

	pcall(writefile, "ValueData/adopt_values.json", HttpService:JSONEncode({
		data = result2.data,
		_time = tick()
	}))

	return result2.data or {}
end
local function v217()
	local t13 = {}
	local v219 = v205()

	for _, v in pairs(v219) do
		t13[v.name] = v.price
	end

	return t13
end
local function v222()
	local t14 = {}
	local ok, result = pcall(load, "InventoryDB")

	if not ok or not result then
		return t14
	end

	local inventory

	pcall(function()
		inventory = _origGet("inventory") or clientData.get("inventory")
	end)

	if not inventory or type(inventory) ~= "table" then
		return t14
	end

	for k, v in pairs(inventory) do
		if type(v) == "table" then
			local v229 = result[k]

			if v229 and type(v229) == "table" then
				for _, v9 in pairs(v) do
					if type(v9) == "table" and v9.id then
						local v232 = v229[v9.id]

						if v232 and v232.name and v9.properties then
							local name = v232.name
							local properties = v9.properties
							local v235 = (properties.mega_neon and "Mega Neon " or properties.neon and "Neon " or "") .. (properties.flyable and "Fly " or "") .. (properties.rideable and "Ride " or "") .. name

							t14[v235] = (t14[v235] or 0) + 1
						end
					end
				end
			end
		end
	end

	return t14
end
local function v236()
	local v237 = v222()
	local v238 = v217()
	local t15 = {}
	local n2 = 0
	local n3 = 0

	for k, v in pairs(v237) do
		local v244 = v238[k] or 0
		local v245 = v244 * v

		if v245 > 0 then
			table.insert(t15, {
				name = k,
				count = v,
				price = v244,
				total = v245
			})
			n2 += v245
			n3 += v
		end
	end

	table.sort(t15, function(p67, p68)
		return p67.total > p68.total
	end)

	local t16 = {
		"Inventory Analysis:",
		string.rep("-", 40)
	}

	for _, v in ipairs(t15) do
		table.insert(t16, string.format("%-20s x%-4d | $%8.2f | $%10.2f", v.name, v.count, v.price, v.total))
	end

	table.insert(t16, string.rep("-", 40))
	table.insert(t16, string.format("Total Items: %d", n3))
	table.insert(t16, string.format("Total Value: $%d", math.floor(n2)))

	return table.concat(t16, "\n")
end
local function v249(p69)
	info = p69:Paragraph({
		Title = "Please Wait!",
		Desc = "Collecting information about you!",
		Buttons = { {
			Icon = "bird",
			Title = "Copy Inventory Information",
			Callback = function()
				local ok, result = pcall(v236)

				if ok then
					if result then
						setclipboard(result)
					end
				end
			end
		} }
	})

	local ok, result = pcall(v236)

	res = ok
	inventoryData = result

	if not res then
		inventoryData = "Error: " .. tostring(inventoryData)
	end

	pcall(function()
		set_thread_identity(7)
		info:SetTitle("Your Inventory Data:")
	end)
	info:SetDesc(inventoryData or "No data available")
	print(2)
	isAnalyzing = false
end

v7:Paragraph({
	Title = "What is this?",
	Desc = "This page will help u know ur inventory value, all information about ur inventory will be sorted and organized here!",
	Color = "White"
})
v7:Button({
	Title = "Start Analyzis",
	Desc = "This button will analyze ur inventory and give u all data about it!",
	Locked = false,
	Callback = function()
		if not isAnalyzing then
			isAnalyzing = true
			v249(v7)
		end
	end
})
DISPLAY_VALUES = false
tradegui = game:GetService("Players").LocalPlayer.PlayerGui.TradeApp

local load_ = require(game.ReplicatedStorage.Fsys).load
local RouterClient = load_("RouterClient")
local DataChanged = RouterClient.get("DataAPI/DataChanged")
local InventoryDB = load_("InventoryDB")
local SendTradeRequest = RouterClient.get("TradeAPI/SendTradeRequest")

tradeallfunc = function()
	for _, player in pairs(game.Players:GetPlayers()) do
		SendTradeRequest:FireServer(player)
	end
end
valuelabels = Instance.new("TextLabel")
valuelabels.Parent = tradegui
valuelabels.Position = UDim2.new(0.54, 1, 0.2, 0.45)
valuelabels.Size = UDim2.new(0.1, 0.1, 0.1, 0.1)
valuelabels.TextSize = 20
undervalues = Instance.new("TextLabel")
undervalues.Parent = valuelabels
undervalues.Position = UDim2.new(0.5, 0.1, 0.1, 0.1)
undervalues.Text = "Total Value:"
undervalues.TextSize = 14
undervalues.TextStrokeTransparency = 0.8
valuelabels2 = Instance.new("TextLabel")
valuelabels2.Parent = tradegui
valuelabels2.Position = UDim2.new(0.36, 1, 0.2, 0.45)
valuelabels2.Size = UDim2.new(0.1, 0.1, 0.1, 0.1)
valuelabels2.TextSize = 20
undervalues2 = Instance.new("TextLabel")
undervalues2.Parent = valuelabels2
undervalues2.Position = UDim2.new(0.5, 0.1, 0.1, 0.1)
undervalues2.Text = "Total Value:"
undervalues2.TextSize = 14
undervalues2.TextStrokeTransparency = 0.8
valuelabels.Visible = false
valuelabels2.Visible = false
tradegui.Frame:GetPropertyChangedSignal("Visible"):Connect(function()
	state = DISPLAY_VALUES and tradegui.Frame.Visible
	valuelabels.Visible = state
	valuelabels2.Visible = state
end)

local v261 = v217()

DataChanged.OnClientEvent:Connect(function(...)
	x = { ... }

	if type(x[3]) == "table" and x[2] == "trade" then
		trade = x[3]

		if trade.recipient == game.Players.LocalPlayer.Name then
			me = "recipient_offer"
		elseif trade.sender == game.Players.LocalPlayer.Name then
			me = "sender_offer"
		end

		if tostring(trade.recipient) == game.Players.LocalPlayer.Name then
			me = "recipient_offer"
			notme = "sender_offer"
		end

		if tostring(trade.sender) == game.Players.LocalPlayer.Name then
			me = "sender_offer"
			notme = "recipient_offer"
		end

		me = trade[me]
		notme = trade[notme]
		my_value = 0
		his_value = 0

		for _, item in pairs(me.items) do
			local name = InventoryDB[item.category][item.id].name
			local properties = item.properties

			my_value += v261[(properties.mega_neon and "Mega Neon " or properties.neon and "Neon " or "") .. (properties.flyable and "Fly " or "") .. (properties.rideable and "Ride " or "") .. name] or 0
		end

		for _, item in pairs(notme.items) do
			local name = InventoryDB[item.category][item.id].name
			local properties = item.properties

			his_value += v261[(properties.mega_neon and "Mega Neon " or properties.neon and "Neon " or "") .. (properties.flyable and "Fly " or "") .. (properties.rideable and "Ride " or "") .. name] or 0
		end

		if my_value and his_value then
			valuelabels.Text = tostring(his_value) .. " $"
			valuelabels2.Text = tostring(my_value) .. " $"
		end
	end
end)
set_thread_identity(7)
v6:Toggle({
	Title = "Display Values In Trade",
	Desc = "Helps u decide is trade good or bad!",
	Type = "Checkbox",
	Default = false,
	Callback = function(p70)
		DISPLAY_VALUES = p70

		if tradegui.Frame.Visible then
			valuelabels.Visible = p70
			valuelabels2.Visible = p70
		end
	end
})
v6:Button({
	Title = "Trade Everyone",
	Desc = "This button will send trade request to every single person on the server!",
	Locked = false,
	Callback = tradeallfunc
})
