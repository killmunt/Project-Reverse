-- discord.gg/syncrypt

task.wait(2.5)

local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local CurrentCamera = workspace.CurrentCamera or workspace:FindFirstChildOfClass("Camera")
local ViewportSize = CurrentCamera and CurrentCamera.ViewportSize or Vector2.new(1920, 1080)
local u7 = false

pcall(function()
	local platform = UserInputService:GetPlatform()

	u7 = platform == Enum.Platform.IOS or platform == Enum.Platform.Android
end)

if not u7 then
	u7 = UserInputService.TouchEnabled and ViewportSize.X < 1200
end

local v9
local t1 = {
	"Newborn",
	"Junior",
	"Pre-Teen",
	"Teen",
	"Post-Teen",
	"Full Grown"
}
local t2 = {
	BG = Color3.fromRGB(15, 13, 26),
	SIDEBAR = Color3.fromRGB(22, 20, 40),
	SIDEBAR_HOVER = Color3.fromRGB(35, 30, 60),
	SIDEBAR_ACT = Color3.fromRGB(45, 38, 80),
	CONTENT = Color3.fromRGB(18, 16, 32),
	CARD = Color3.fromRGB(30, 27, 52),
	CARD_BORDER = Color3.fromRGB(55, 50, 90),
	ACCENT = Color3.fromRGB(143, 74, 255),
	ACCENT_LIGHT = Color3.fromRGB(154, 107, 255),
	TEXT = Color3.fromRGB(255, 255, 255),
	TEXT_SEC = Color3.fromRGB(170, 160, 200),
	TEXT_MUTED = Color3.fromRGB(120, 110, 150),
	SUCCESS = Color3.fromRGB(34, 181, 115),
	WARNING = Color3.fromRGB(255, 169, 67),
	DANGER = Color3.fromRGB(247, 44, 44),
	SHADOW = Color3.fromRGB(5, 4, 12),
	HEADER = Color3.fromRGB(26, 23, 46),
	FLY_BLUE = Color3.fromRGB(50, 140, 255),
	RIDE_YELLOW = Color3.fromRGB(230, 40, 110),
	NEON_PURPLE = Color3.fromRGB(30, 220, 100),
	MEGA_PINK = Color3.fromRGB(150, 80, 255)
}
local FredokaOne = Enum.Font.FredokaOne
local GothamBold = Enum.Font.GothamBold
local Gotham = Enum.Font.Gotham
local tweenInfo = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tweenInfo2 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local load = require(game.ReplicatedStorage:WaitForChild("Fsys")).load

set_thread_identity(2)

local RouterClient = load("RouterClient")
local InventoryDB = load("InventoryDB")

set_thread_identity(8)

local t3 = {}
local n1 = 0

local function v22()
	if os.time() - n1 < 3600 and next(t3) then
		return t3
	end

	if not isfolder("ValueData") then
		makefolder("ValueData")
	end

	if isfile("ValueData/adopt_values.json") then
		local ok, result = pcall(readfile, "ValueData/adopt_values.json")

		if ok and result ~= "" then
			local ok2, result2 = pcall(HttpService.JSONDecode, HttpService, result)

			if ok2 and result2 then
				if os.time() - (result2._time or 0) < 3600 then
					local pairs_ = pairs
					local data = result2.data or {}

					for _, v in pairs_(data) do
						t3[v.name] = v.price
					end

					n1 = os.time()

					return t3
				end
			end
		end
	end

	local ok, result = pcall(game.HttpGet, game, "https://api.project-reverse.org/valuables/get-game-valuables?game=ame")

	if ok then
		local data = HttpService:JSONDecode(result)

		pcall(writefile, "ValueData/adopt_values.json", HttpService:JSONEncode({
			data = data.data,
			_time = os.time()
		}))

		local pairs_ = pairs
		local data2 = data.data or {}

		for _, v in pairs_(data2) do
			t3[v.name] = v.price
		end
	end

	n1 = os.time()

	return t3
end

local t4 = {}

local function v39()
	if next(t4) then
		return
	end

	pcall(function()
		for k, pet in pairs(InventoryDB.pets) do
			if type(pet) == "table" and pet.name then
				if pet.id then
					t4[pet.id] = pet.name
				end

				if pet.kind then
					t4[pet.kind] = pet.name
				end

				if type(k) == "string" then
					t4[k] = pet.name
				end
			end
		end
	end)
end
local function v42(p1)
	if not p1 then
		return "Unknown"
	end

	v39()

	if t4[p1] then
		return t4[p1]
	end

	local ok, result = pcall(function()
		return InventoryDB.pets[p1]
	end)

	if ok and type(result) == "table" and result.name then
		t4[p1] = result.name

		return result.name
	end

	return p1:gsub("^%w+_egg_%d+_", ""):gsub("^%w+_%d+_", ""):gsub("_", " "):gsub("(%a)([%w]*)", function(p2, p3)
		return p2:upper() .. p3
	end)
end
local function v45(p4, p5)
	if not p5 or type(p5) ~= "table" then
		return p4
	end

	local s1 = ""

	if p5.mega_neon then
		s1 = "Mega Neon "
	elseif p5.neon then
		s1 = "Neon "
	end

	if p5.flyable then
		s1 ..= "Fly "
	end

	if p5.rideable then
		s1 ..= "Ride "
	end

	return s1 .. p4
end
local function v47(p6)
	if not p6 then
		return ""
	end

	local ok, result = pcall(function()
		return InventoryDB.pets[p6]
	end)

	if ok and type(result) == "table" then
		return result.image_large or result.image or ""
	end

	return ""
end
local function v50(p7, p8)
	if not p7 then
		return 0
	end

	local v51 = v42(p7)

	return t3[v45(v51, p8 or {})] or t3[v51] or 0
end
local function v52(p9)
	if not p9 or p9 <= 0 then
		return ""
	end

	local match, v54 = string.format("%.2f", p9):match("^(%d+)%.(%d+)$")
	local v55 = match:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")

	if v54 == "00" then
		return "$" .. v55
	end

	return "$" .. v55 .. "." .. v54
end
local function v56(p10)
	if p10 >= 100 then
		return t2.SUCCESS
	end

	if p10 >= 10 then
		return t2.ACCENT_LIGHT
	end

	if p10 > 0 then
		return t2.TEXT_SEC
	end

	return t2.TEXT_MUTED
end

local u57
local n2 = 0

local function v59(p11)
	if not p11 then
		if u57 and os.time() - n2 < 30 then
			return u57
		end
	end

	local ok, result = pcall(function()
		return RouterClient.get("DataAPI/GetAllServerData"):InvokeServer()
	end)

	if ok and result then
		u57 = result
		n2 = os.time()
	end

	return u57 or {}
end
local function v62(p12, ...)
	for _, v in ipairs({ ... }) do
		if type(p12) == "table" then
			p12 = p12[v]

			continue
		end

		return nil
	end

	return p12
end
local function v65(p13)
	if type(p13) ~= "table" then
		return 0
	end

	local n3 = 0

	for _ in pairs(p13) do
		n3 += 1
	end

	return n3
end
local function v68(p14)
	if p14 then
		if type(p14) == "number" and not (p14 <= 0) then
			local v69 = math.floor(p14)
			local v70 = math.floor(v69 / 3600)
			local v71 = math.floor(v69 % 3600 / 60)
			local v72 = v69 % 60

			if v70 > 0 then
				return string.format("%dh %dm", v70, v71)
			end

			if v71 > 0 then
				return string.format("%dm %ds", v71, v72)
			end

			return string.format("%ds", v72)
		end
	end

	return "0s"
end
local function v73(p15)
	if not p15 or type(p15) ~= "number" or p15 <= 0 then
		return "N/A"
	end

	local v74 = math.max(0, os.time() - math.floor(p15))

	if v74 < 60 then
		return v74 .. "s ago"
	end

	if v74 < 3600 then
		return math.floor(v74 / 60) .. "m ago"
	end

	if v74 < 86400 then
		return math.floor(v74 / 3600) .. "h ago"
	end

	return math.floor(v74 / 86400) .. "d ago"
end
local function v75(p16)
	local t5 = {}

	if type(p16) == "table" then
		for k in pairs(p16) do
			table.insert(t5, k)
		end
	end

	table.sort(t5)

	return t5
end
local function v78(p17)
	local v79 = v62(p17, "pet_char_wrappers_raw")

	if type(v79) ~= "table" then
		return nil
	end

	for _, v in pairs(v79) do
		if type(v) == "table" and v.is_pet and v.pet_id then
			local pet_progression = v.pet_progression or {}

			return {
				id = v.pet_id,
				name = v42(v.pet_id),
				age = pet_progression.age or 0,
				ageName = t1[pet_progression.age] or "?",
				neon = v.neon or false,
				megaNeon = v.mega_neon or false,
				flyable = v.flyable or false,
				rideable = v.rideable or false,
				trickLevel = v.pet_trick_level or 0,
				rpName = v.rp_name or ""
			}
		end
	end

	return nil
end
local function v83(p18)
	local t6 = {}
	local v85 = v62(p18, "idle_progression_manager", "active_pets")

	if type(v85) ~= "table" then
		return t6
	end

	for k, v in pairs(v85) do
		if type(v) == "table" then
			local item_info = v.item_info or {}
			local properties = item_info.properties or {}

			if item_info.kind then
				table.insert(t6, {
					uid = k,
					kind = item_info.kind,
					name = v42(item_info.kind),
					age = properties.age or 0,
					ageName = t1[properties.age] or "?",
					xp = properties.xp or 0,
					neon = properties.neon or false,
					megaNeon = properties.mega_neon or false,
					maxAge = v.max_age or false,
					flyable = properties.flyable or false,
					rideable = properties.rideable or false
				})
			end
		end
	end

	return t6
end
local function v90(p19)
	local t7 = {
		trades = {},
		wishlists = {},
		collections = {},
		stats = {},
		aboutMe = nil
	}
	local v92 = v62(p19, "player_profile", "pages")

	if type(v92) ~= "table" then
		return t7
	end

	for _, v in pairs(v92) do
		local widgets = type(v) == "table" and v.widgets

		if type(widgets) == "table" then
			for _, widget in pairs(widgets) do
				local v98 = v62(widget, "data", "widget_data")
				local v99 = v62(widget, "data", "widget_kind")

				if v98 and v99 then
					if v99 == "trade_history" then
						local pairs_ = pairs
						local trades = v98.trades or {}

						for _, trade in pairs_(trades) do
							table.insert(t7.trades, trade)
						end
					elseif v99 == "wishlist" then
						table.insert(t7.wishlists, {
							title = v98.title or "",
							items = v98.items or {}
						})
					elseif v99 == "collection" then
						table.insert(t7.collections, {
							items = v98.items or {}
						})
					elseif v99 == "stats" then
						local pairs_ = pairs
						local stats = v98.stats or {}

						for _, stat in pairs_(stats) do
							if type(stat) == "table" and stat.kind then
								t7.stats[stat.kind] = stat.value
							end
						end
					elseif v99 == "about_me" then
						t7.aboutMe = {
							title = v98.title or "",
							body = v98.body or ""
						}
					end
				end
			end
		end
	end

	return t7
end
local function v108(p20)
	local v109 = v62(p20, "idle_progression_manager", "online_periods")
	local t8 = {
		totalTime = 0,
		reconnects = 0,
		lastLogin = v62(p20, "idle_progression_manager", "last_login")
	}

	if type(v109) == "table" then
		for _, v in ipairs(v109) do
			if type(v) == "table" and type(v[1]) == "number" and type(v[2]) == "number" then
				t8.totalTime += v[2] - v[1]
			end
		end

		t8.reconnects = math.max(0, #v109 - 1)
	end

	return t8
end
local function v113(p21)
	local n4 = 0
	local n5 = 0
	local id
	local v117 = v78(p21)

	if v117 then
		local v118 = v50(v117.id, {
			neon = v117.neon,
			mega_neon = v117.megaNeon,
			flyable = v117.flyable,
			rideable = v117.rideable
		})

		n4 += v118

		if n5 < v118 then
			id = v117.id
			n5 = v118
		end
	end

	for _, v in pairs(v83(p21)) do
		local v121 = v50(v.kind, {
			neon = v.neon,
			mega_neon = v.megaNeon,
			flyable = v.flyable,
			rideable = v.rideable
		})

		n4 += v121

		if n5 < v121 then
			id = v.kind
			n5 = v121
		end
	end

	for _, collection in pairs(v90(p21).collections) do
		local pairs_ = pairs
		local items = collection.items or {}

		for _, item in pairs_(items) do
			if type(item) == "table" and item.kind then
				local v128 = v50(item.kind, item.properties)

				n4 += v128

				if n5 < v128 then
					id = item.kind
					n5 = v128
				end
			end
		end
	end

	return n4, n5, id
end
local function v129(p22)
	local n6 = 0
	local n7 = 0
	local sender_items = p22.sender_items or {}

	for _, sender_item in pairs(sender_items) do
		if type(sender_item) == "table" and sender_item.kind then
			n6 += v50(sender_item.kind, sender_item.properties)
		end
	end

	local recipient_items = p22.recipient_items or {}

	for _, recipient_item in pairs(recipient_items) do
		if type(recipient_item) == "table" and recipient_item.kind then
			n7 += v50(recipient_item.kind, recipient_item.properties)
		end
	end

	return n6, n7, n7 - n6, n6 > 0 and n7 / n6 or 0
end
local function v138(p23)
	return p23 and {
		neon = p23.neon,
		mega_neon = p23.megaNeon,
		flyable = p23.flyable,
		rideable = p23.rideable
	} or {}
end

local v139, v140

if u7 then
	local X = type(ViewportSize) == "userdata" and ViewportSize.X or 360
	local Y = type(ViewportSize) == "userdata" and ViewportSize.Y or 640

	v139 = math.max(tonumber(X) or 360, 320)
	v140 = math.max(tonumber(Y) or 640, 400)
else
	v139 = 1320
	v140 = 840
end

local t9

t9 = {
	new = function(p24, p25)
		local instance = Instance.new(p24)
		local v145 = p25 or {}

		for k, v in pairs(v145) do
			if k ~= "Children" and k ~= "Parent" then
				pcall(function()
					instance[k] = v
				end)
			end
		end

		if p25 and p25.Children then
			for _, child in ipairs(p25.Children) do
				child.Parent = instance
			end
		end

		if p25 and p25.Parent then
			instance.Parent = p25.Parent
		end

		return instance
	end,
	corner = function(p26, p27)
		return t9.new("UICorner", {
			CornerRadius = UDim.new(0, p27 or 8),
			Parent = p26
		})
	end,
	stroke = function(p28, p29, p30)
		local new = t9.new
		local s2 = "UIStroke"

		return new(s2, {
			Color = p29 or t2.CARD_BORDER,
			Thickness = p30 or 1,
			Parent = p28
		})
	end,
	padding = function(p31, p32, p33, p34, p35)
		local new = t9.new
		local s3 = "UIPadding"
		local n8 = 0
		local t10 = {
			PaddingTop = UDim.new(n8, p32 or 8),
			PaddingBottom = UDim.new(n8, p33 or 8),
			PaddingLeft = UDim.new(n8, p34 or 8),
			PaddingRight = UDim.new(n8, p35 or 8),
			Parent = p31
		}

		return new(s3, t10)
	end,
	list = function(p36, p37, p38, p39, p40)
		return t9.new("UIListLayout", {
			FillDirection = p37 or Enum.FillDirection.Vertical,
			Padding = UDim.new(0, p38 or 4),
			HorizontalAlignment = p39 or Enum.HorizontalAlignment.Left,
			VerticalAlignment = p40 or Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = p36
		})
	end,
	grid = function(p41, p42, p43)
		return t9.new("UIGridLayout", {
			CellSize = p42 or UDim2.fromOffset(200, 270),
			CellPadding = p43 or UDim2.fromOffset(8, 8),
			SortOrder = Enum.SortOrder.LayoutOrder,
			Parent = p41
		})
	end,
	text = function(p44, p45)
		local new = t9.new
		local s4 = "TextLabel"
		local t11 = {
			BackgroundTransparency = 1,
			Font = p45.font or Gotham,
			TextColor3 = p45.color or t2.TEXT,
			TextSize = p45.size or 14,
			Text = p45.text or "",
			TextXAlignment = p45.alignX or Enum.TextXAlignment.Left,
			TextYAlignment = p45.alignY or Enum.TextYAlignment.Center,
			TextWrapped = p45.wrap ~= false,
			TextTruncate = p45.truncate and Enum.TextTruncate.AtEnd or Enum.TextTruncate.None
		}
		local sz = p45.sz

		if not sz then
			sz = UDim2.new(1, 0, 0, p45.height or 22)
		end

		t11.Size = sz
		t11.Position = p45.pos or UDim2.new()
		t11.AnchorPoint = p45.anchor or Vector2.new()
		t11.LayoutOrder = p45.order or 0
		t11.RichText = p45.rich or false
		t11.Parent = p44

		return new(s4, t11)
	end,
	badge = function(p46, p47, p48, p49)
		local Frame = t9.new("Frame", {
			Size = UDim2.fromOffset(0, 26),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = p48 or t2.ACCENT,
			LayoutOrder = p49 or 0,
			Parent = p46
		})

		t9.corner(Frame, 5)
		t9.padding(Frame, 3, 3, 9, 9)
		t9.text(Frame, {
			text = p47,
			font = GothamBold,
			size = 12,
			color = t2.TEXT,
			sz = UDim2.fromOffset(0, 20),
			height = 20
		})
		Frame.AutomaticSize = Enum.AutomaticSize.X

		return Frame
	end,
	button = function(p50, p51)
		local width = p51.width or u7 and 100 or 130
		local height = p51.height or u7 and 36 or 40
		local TextButton = t9.new("TextButton", {
			Size = UDim2.fromOffset(width, height + 3),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			LayoutOrder = p51.order or 0,
			Parent = p50
		})

		t9.corner(t9.new("Frame", {
			Size = UDim2.new(1, 0, 0, height),
			Position = UDim2.fromOffset(0, 3),
			BackgroundColor3 = p51.shadowColor or Color3.fromRGB(90, 45, 170),
			Parent = TextButton
		}), 7)

		local Frame = t9.new("Frame", {
			Size = UDim2.new(1, 0, 0, height),
			BackgroundColor3 = p51.color or t2.ACCENT,
			Parent = TextButton
		})

		t9.corner(Frame, 7)
		t9.text(Frame, {
			text = p51.text or "Button",
			font = GothamBold,
			size = 15,
			color = t2.TEXT,
			sz = UDim2.fromScale(1, 1),
			alignX = Enum.TextXAlignment.Center
		})
		TextButton.MouseButton1Down:Connect(function()
			TweenService:Create(Frame, tweenInfo, {
				Position = UDim2.fromOffset(0, 3)
			}):Play()
		end)
		TextButton.MouseButton1Up:Connect(function()
			TweenService:Create(Frame, tweenInfo, {
				Position = UDim2.fromOffset(0, 0)
			}):Play()
		end)
		TextButton.MouseButton1Click:Connect(function()
			TweenService:Create(Frame, tweenInfo, {
				Position = UDim2.fromOffset(0, 0)
			}):Play()

			if p51.callback then
				task.spawn(p51.callback)
			end
		end)

		return TextButton
	end
}

local function petImage(p52, p53, p54, p55, p56, p57, p58)
	local v166 = p54 or 80
	local Frame = t9.new("Frame", {
		Size = UDim2.fromOffset(v166, v166),
		BackgroundColor3 = t2.CARD,
		Parent = p52
	})

	t9.corner(Frame, 10)
	t9.corner(t9.new("Frame", {
		Size = UDim2.new(1, -4, 1, -4),
		Position = UDim2.fromOffset(2, 2),
		BackgroundColor3 = Color3.fromRGB(24, 22, 44),
		BackgroundTransparency = 0.5,
		Parent = Frame
	}), 8)

	local v168 = v47(p53)

	if v168 and v168 ~= "" then
		t9.new("ImageLabel", {
			Size = UDim2.fromScale(0.82, 0.82),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Image = v168,
			ScaleType = Enum.ScaleType.Fit,
			Parent = Frame
		})
	else
		local v169 = p53 and v42(p53)

		v169 = v169 or "?"

		if #v169 > 8 then
			v169 = v169:sub(1, 7) .. ".."
		end

		t9.text(Frame, {
			text = v169,
			font = GothamBold,
			size = math.clamp(math.floor(v166 * 0.2), 9, 14),
			color = t2.TEXT_SEC,
			sz = UDim2.fromScale(1, 1),
			alignX = Enum.TextXAlignment.Center
		})
	end

	local v170 = v166 >= 60 and 3 or 2

	if p56 then
		local v171 = t9.stroke(Frame, t2.MEGA_PINK, v170)

		t9.new("UIGradient", {
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(160, 60, 255)),
				ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 80, 220)),
				ColorSequenceKeypoint.new(0.66, Color3.fromRGB(80, 60, 255)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 120, 255))
			}),
			Parent = v171
		})
	elseif p55 then
		t9.stroke(Frame, t2.NEON_PURPLE, v170)
	end

	local v172 = math.clamp(math.floor(v166 * 0.28), 16, 24)
	local t12 = {}

	if p56 then
		table.insert(t12, {
			"M",
			t2.MEGA_PINK
		})
	elseif p55 then
		table.insert(t12, {
			"N",
			t2.NEON_PURPLE
		})
	end

	if p57 then
		table.insert(t12, {
			"F",
			t2.FLY_BLUE
		})
	end

	if p58 then
		table.insert(t12, {
			"R",
			t2.RIDE_YELLOW
		})
	end

	for i, v in ipairs(t12) do
		local Frame2 = t9.new("Frame", {
			Size = UDim2.fromOffset(v172, v172),
			Position = UDim2.fromOffset(v166 - i * (v172 + 2), v166 - v172 - 1),
			BackgroundColor3 = v[2],
			Parent = Frame
		})

		t9.corner(Frame2, math.floor(v172 / 2))
		t9.text(Frame2, {
			text = v[1],
			font = GothamBold,
			size = math.floor(v172 * 0.55),
			color = t2.TEXT,
			sz = UDim2.fromScale(1, 1),
			alignX = Enum.TextXAlignment.Center
		})
	end

	return Frame
end

t9.petImage = petImage
t9.modBadges = function(p59, p60, p61, p62)
	if not p60 then
		return
	end

	local Frame = t9.new("Frame", {
		Size = UDim2.fromOffset(280, 26),
		Position = UDim2.fromOffset(p61 or 0, p62 or 0),
		BackgroundTransparency = 1,
		Parent = p59
	})

	t9.list(Frame, Enum.FillDirection.Horizontal, 4)

	if p60.megaNeon then
		t9.badge(Frame, "MEGA", t2.MEGA_PINK)
	elseif p60.neon then
		t9.badge(Frame, "NEON", t2.NEON_PURPLE)
	end

	if p60.flyable then
		t9.badge(Frame, "FLY", t2.FLY_BLUE)
	end

	if p60.rideable then
		t9.badge(Frame, "RIDE", t2.RIDE_YELLOW)
	end

	return Frame
end
t9.statBar = function(p63, p64)
	local width = p64.width or 150
	local Frame = t9.new("Frame", {
		Size = UDim2.fromOffset(width, p64.label and 24 or 8),
		BackgroundTransparency = 1,
		LayoutOrder = p64.order or 0,
		Parent = p63
	})

	if p64.label then
		t9.text(Frame, {
			text = p64.label,
			font = Gotham,
			size = 12,
			color = t2.TEXT_SEC,
			sz = UDim2.new(1, 0, 0, 14),
			height = 14
		})
	end

	local new = t9.new
	local s5 = "Frame"
	local t13 = {
		Size = UDim2.new(1, 0, 0, 6),
		Position = UDim2.fromOffset(0, p64.label and 16 or 0)
	}

	t13.BackgroundColor3 = t2.CARD_BORDER
	t13.Parent = Frame

	local v183 = new(s5, t13)

	t9.corner(v183, 3)
	t9.corner(t9.new("Frame", {
		Size = UDim2.fromScale(math.clamp((p64.value or 0) / math.max(p64.max or 1, 1), 0, 1), 1),
		BackgroundColor3 = p64.color or t2.ACCENT,
		Parent = v183
	}), 3)

	return Frame
end
t9.scrollFrame = function(p65, p66)
	local new = t9.new
	local s6 = "ScrollingFrame"
	local t14 = {
		Size = p66.size or UDim2.fromScale(1, 1),
		Position = p66.pos or UDim2.new(),
		CanvasSize = UDim2.new()
	}

	t14.AutomaticCanvasSize = Enum.AutomaticSize.Y
	t14.ScrollingDirection = Enum.ScrollingDirection.Y
	t14.ScrollBarThickness = 6
	t14.ScrollBarImageColor3 = t2.ACCENT
	t14.TopImage = "rbxassetid://2577230883"
	t14.MidImage = "rbxassetid://2577230871"
	t14.BottomImage = "rbxassetid://2577230880"
	t14.BackgroundTransparency = 1
	t14.BorderSizePixel = 0
	t14.Parent = p65

	return new(s6, t14)
end
t9.toggle = function(p67, p68)
	local default = p68.default or false
	local Frame = t9.new("Frame", {
		Size = UDim2.fromOffset((p68.labelWidth or 120) + 48, 28),
		BackgroundTransparency = 1,
		LayoutOrder = p68.order or 0,
		Parent = p67
	})

	if p68.label then
		t9.text(Frame, {
			text = p68.label,
			font = Gotham,
			size = 13,
			color = t2.TEXT_SEC,
			sz = UDim2.fromOffset(p68.labelWidth or 120, 28),
			height = 28
		})
	end

	local Frame2 = t9.new("Frame", {
		Size = UDim2.fromOffset(38, 20),
		Position = UDim2.fromOffset(p68.labelWidth or 120, 4),
		BackgroundColor3 = default and t2.ACCENT or t2.CARD_BORDER,
		Parent = Frame
	})

	t9.corner(Frame2, 10)

	local new = t9.new
	local s7 = "Frame"
	local v192 = new(s7, {
		Size = UDim2.fromOffset(16, 16),
		Position = default and UDim2.fromOffset(20, 2) or UDim2.fromOffset(2, 2),
		BackgroundColor3 = t2.TEXT,
		Parent = Frame2
	})

	t9.corner(v192, 8)
	t9.new("TextButton", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = "",
		Parent = Frame2
	}).MouseButton1Click:Connect(function()
		default = not default
		TweenService:Create(v192, tweenInfo, {
			Position = default and UDim2.fromOffset(20, 2) or UDim2.fromOffset(2, 2)
		}):Play()
		TweenService:Create(Frame2, tweenInfo, {
			BackgroundColor3 = default and t2.ACCENT or t2.CARD_BORDER
		}):Play()

		if p68.onChange then
			p68.onChange(default)
		end
	end)

	return Frame
end

local s8 = "miniStat"

local function v194(p69, p70, p71, p72, p73)
	local v195 = u7 and 60

	v195 = v195 or 78

	local Frame = t9.new("Frame", {
		Size = u7 and UDim2.new(0.48, 0, 0, v195) or UDim2.fromOffset(175, v195),
		BackgroundColor3 = t2.CARD,
		LayoutOrder = p73 or 0,
		Parent = p69
	})

	t9.corner(Frame, 10)
	t9.padding(Frame, u7 and 5 or 8, u7 and 5 or 8, u7 and 8 or 14, u7 and 8 or 14)
	t9.text(Frame, {
		text = p70,
		font = Gotham,
		size = u7 and 11 or 13,
		color = t2.TEXT_MUTED,
		height = u7 and 14 or 18
	})
	t9.text(Frame, {
		text = tostring(p71),
		font = GothamBold,
		size = u7 and 18 or 26,
		color = p72 or t2.TEXT,
		sz = UDim2.new(1, 0, 0, u7 and 28 or 38),
		pos = UDim2.fromOffset(u7 and 8 or 14, u7 and 22 or 30)
	})

	return Frame
end

t9[s8] = v194

local ScreenGui = t9.new("ScreenGui", {
	Name = "ServerAnalyzer",
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	ResetOnSpawn = false,
	Parent = LocalPlayer.PlayerGui
})
local v198 = u7 and 220 or 230
local v199 = u7 and 46 or 52
local u200 = false
local Frame

if u7 then
	Frame = t9.new("Frame", {
		Size = UDim2.new(0.96, 0, 0.72, 0),
		Position = UDim2.new(0.5, 0, 0.52, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Parent = ScreenGui
	})
else
	Frame = t9.new("Frame", {
		Size = UDim2.fromOffset(v139, v140),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Parent = ScreenGui
	})
end

local Frame2 = t9.new("Frame", {
	Size = UDim2.new(1, 8, 1, 8),
	Position = UDim2.fromOffset(4, 4),
	BackgroundColor3 = t2.SHADOW,
	BackgroundTransparency = 0.5,
	Parent = Frame
})

t9.corner(Frame2, 12)

local Frame3 = t9.new("Frame", {
	Size = UDim2.fromScale(1, 1),
	BackgroundColor3 = t2.BG,
	ClipsDescendants = true,
	Parent = Frame
})

t9.corner(Frame3, u7 and 8 or 10)
t9.stroke(Frame3, t2.CARD_BORDER)

local Frame4 = t9.new("Frame", {
	Size = UDim2.fromScale(1, 1),
	BackgroundTransparency = 1,
	ZIndex = 100,
	Parent = ScreenGui
})

t9.dropdown = function(p74, p75)
	local selected = p75.selected or p75.options and p75.options[1] or ""
	local visible = false
	local Frame5 = t9.new("Frame", {
		Size = UDim2.fromOffset(p75.width or 180, 40),
		BackgroundTransparency = 1,
		LayoutOrder = p75.order or 0,
		ZIndex = 10,
		Parent = p74
	})
	local TextButton = t9.new("TextButton", {
		Size = UDim2.new(1, 0, 0, 38),
		BackgroundColor3 = t2.CARD,
		Text = "",
		AutoButtonColor = false,
		Parent = Frame5
	})

	t9.corner(TextButton, 7)
	t9.stroke(TextButton, t2.CARD_BORDER)

	local v209 = t9.text(TextButton, {
		text = "  " .. selected,
		font = GothamBold,
		size = 14,
		color = t2.TEXT,
		sz = UDim2.new(1, -28, 1, 0)
	})

	t9.text(TextButton, {
		text = "v",
		font = GothamBold,
		size = 13,
		color = t2.TEXT_MUTED,
		sz = UDim2.fromOffset(22, 38),
		pos = UDim2.new(1, -24, 0, 0),
		alignX = Enum.TextXAlignment.Center
	})

	local Frame6 = t9.new("Frame", {
		Size = UDim2.fromOffset(p75.width or 170, 0),
		BackgroundColor3 = t2.CARD,
		ClipsDescendants = true,
		Visible = false,
		Parent = Frame4
	})

	t9.corner(Frame6, 6)
	t9.stroke(Frame6, t2.ACCENT)

	local v211 = t9.scrollFrame(Frame6, {
		size = UDim2.fromScale(1, 1)
	})

	t9.list(v211, nil, 1)

	local function v212(p76)
		for _, child in pairs(v211:GetChildren()) do
			if child:IsA("TextButton") then
				child:Destroy()
			end
		end

		for i, v in ipairs(p76) do
			local TextButton2 = t9.new("TextButton", {
				Size = UDim2.new(1, 0, 0, 34),
				BackgroundColor3 = t2.SIDEBAR,
				BackgroundTransparency = 0.3,
				Text = "  " .. v,
				TextColor3 = t2.TEXT,
				Font = Gotham,
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutoButtonColor = false,
				LayoutOrder = i,
				Parent = v211
			})

			TextButton2.MouseButton1Click:Connect(function()
				selected = v
				v209.Text = "  " .. v
				visible = false
				Frame6.Visible = false

				if p75.onChange then
					p75.onChange(v)
				end
			end)
			TextButton2.MouseEnter:Connect(function()
				TextButton2.BackgroundTransparency = 0
				TextButton2.BackgroundColor3 = t2.SIDEBAR_HOVER
			end)
			TextButton2.MouseLeave:Connect(function()
				TextButton2.BackgroundTransparency = 0.3
				TextButton2.BackgroundColor3 = t2.SIDEBAR
			end)
		end

		Frame6.Size = UDim2.fromOffset(p75.width or 180, math.min(#p76 * 35, 260))
	end

	v212(p75.options or {})
	TextButton.MouseButton1Click:Connect(function()
		visible = not visible

		if visible then
			local AbsolutePosition = TextButton.AbsolutePosition
			local n9 = 0

			pcall(function()
				n9 = select(1, game:GetService("GuiService"):GetGuiInset()).Y
			end)

			local X = AbsolutePosition.X
			local Y = AbsolutePosition.Y
			local v222 = u7 and 36 or 40

			Frame6.Position = UDim2.fromOffset(math.max(X, 0), math.max(Y + v222 - n9, 0))
		end

		Frame6.Visible = visible
	end)

	local function v223(p77)
		v212(p77)
	end
	local function v224(p78)
		selected = p78
		v209.Text = "  " .. p78
	end

	return Frame5, v223, v224
end

local Frame5
local CanvasGroup
local Frame6 = t9.new("Frame", {
	Size = UDim2.new(1, 0, 0, v199),
	BackgroundColor3 = t2.HEADER,
	BorderSizePixel = 0,
	Parent = Frame3
})

t9.text(Frame6, {
	text = u7 and "Server Analyzer" or "  Project Reverse: Server Analyzer",
	font = FredokaOne,
	size = u7 and 15 or 20,
	color = t2.TEXT,
	sz = UDim2.new(1, -120, 1, 0),
	pos = u7 and UDim2.fromOffset(v199 + 2, 0) or UDim2.new()
})

local TextButton = t9.new("TextButton", {
	Size = UDim2.fromOffset(v199, v199),
	Position = UDim2.new(1, -v199, 0, 0),
	BackgroundTransparency = 1,
	Text = "X",
	TextColor3 = t2.TEXT_MUTED,
	Font = GothamBold,
	TextSize = 20,
	Parent = Frame6
})

TextButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)
TextButton.MouseEnter:Connect(function()
	TextButton.TextColor3 = t2.DANGER
end)
TextButton.MouseLeave:Connect(function()
	TextButton.TextColor3 = t2.TEXT_MUTED
end)

local u229 = false
local TextButton2 = t9.new("TextButton", {
	Size = UDim2.fromOffset(v199, v199),
	Position = UDim2.new(1, -v199 * 2, 0, 0),
	BackgroundTransparency = 1,
	Text = "_",
	TextColor3 = t2.TEXT_MUTED,
	Font = GothamBold,
	TextSize = 20,
	Parent = Frame6
})

TextButton2.MouseEnter:Connect(function()
	TextButton2.TextColor3 = t2.ACCENT_LIGHT
end)
TextButton2.MouseLeave:Connect(function()
	TextButton2.TextColor3 = t2.TEXT_MUTED
end)
TextButton2.MouseButton1Click:Connect(function()
	u229 = not u229

	if u229 then
		if u7 then
			if sidebarBackdrop then
				sidebarBackdrop.Visible = false
			end

			if u200 then
				u200 = false
				Frame5.Visible = false
			end

			CanvasGroup.Visible = false
			TweenService:Create(Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Size = UDim2.new(0.96, 0, 0, v199 + 6)
			}):Play()
		else
			TweenService:Create(Frame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Size = UDim2.fromOffset(v139, v199 + 6)
			}):Play()
			task.delay(0.1, function()
				Frame5.Visible = false
				CanvasGroup.Visible = false
			end)
		end

		TextButton2.Text = "+"
	else
		if u7 then
			CanvasGroup.Visible = true
			Frame5.Visible = false
			TweenService:Create(Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Size = UDim2.new(0.96, 0, 0.72, 0)
			}):Play()
		else
			Frame5.Visible = true
			CanvasGroup.Visible = true
			TweenService:Create(Frame, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				Size = UDim2.fromOffset(v139, v140)
			}):Play()
		end

		TextButton2.Text = "_"

		if menuBtn then
			menuBtn.Text = "≡"
		end
	end
end)

local TextButton3

if u7 then
	TextButton3 = t9.new("TextButton", {
		Size = UDim2.fromOffset(v199, v199),
		Position = UDim2.fromOffset(0, 0),
		BackgroundTransparency = 1,
		Text = "≡",
		TextColor3 = t2.TEXT_SEC,
		Font = GothamBold,
		TextSize = 22,
		Parent = Frame6
	})
	TextButton3.MouseButton1Click:Connect(function()
		if v9 then
			v9()
		end
	end)
end

local u232 = false
local Position
local Position2

Frame6.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		u232 = true
		Position = input.Position
		Position2 = Frame.Position
	end
end)
Frame6.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		u232 = false
	end
end)
UserInputService.InputChanged:Connect(function(input)
	if u232 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local v235 = input.Position - Position

		Frame.Position = UDim2.new(Position2.X.Scale, Position2.X.Offset + v235.X, Position2.Y.Scale, Position2.Y.Offset + v235.Y)
	end
end)

local TextButton4

if u7 then
	TextButton4 = t9.new("TextButton", {
		Size = UDim2.new(1, 0, 1, -v199),
		Position = UDim2.fromOffset(0, v199),
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = 0.4,
		Text = "",
		AutoButtonColor = false,
		Visible = false,
		ZIndex = 8,
		Parent = Frame3
	})
	TextButton4.MouseButton1Click:Connect(function()
		if v9 then
			v9()
		end
	end)
end

Frame5 = t9.new("Frame", {
	Size = UDim2.new(0, v198, 1, -v199),
	Position = u7 and UDim2.fromOffset(-v198, v199) or UDim2.fromOffset(0, v199),
	BackgroundColor3 = t2.SIDEBAR,
	BorderSizePixel = 0,
	ZIndex = u7 and 9 or 1,
	Visible = not u7,
	Parent = Frame3
})

local v237 = t9.scrollFrame(Frame5, {
	size = UDim2.fromScale(1, 1)
})

v237.ScrollBarThickness = 3
t9.list(v237, nil, 2)
v9 = function()
	if not u7 then
		return
	end

	u200 = not u200

	if u200 then
		Frame5.Visible = true
		Frame5.Position = UDim2.fromOffset(-v198, v199)

		if TextButton4 then
			TextButton4.Visible = true
		end

		TweenService:Create(Frame5, tweenInfo2, {
			Position = UDim2.fromOffset(0, v199)
		}):Play()
	else
		TweenService:Create(Frame5, tweenInfo2, {
			Position = UDim2.fromOffset(-v198, v199)
		}):Play()

		if TextButton4 then
			TextButton4.Visible = false
		end

		task.delay(0.2, function()
			if not u200 then
				Frame5.Visible = false
			end
		end)
	end

	if TextButton3 then
		TextButton3.Text = u200 and "✕" or "≡"
	end
end

local s9 = "scanner"
local t15 = {}
local t16 = {}
local t17 = {
	{
		title = "Overview",
		icon = "O",
		color = t2.ACCENT,
		items = {
			{
				id = "scanner",
				title = "Server Scanner"
			},
			{
				id = "rich",
				title = "Rich Finder"
			},
			{
				id = "vip",
				title = "VIP Detection"
			}
		}
	},
	{
		title = "Players",
		icon = "P",
		color = Color3.fromRGB(41, 171, 226),
		items = {
			{
				id = "location",
				title = "Location Tracker"
			},
			{
				id = "about",
				title = "About Me / RP"
			},
			{
				id = "inventory",
				title = "Inventory Analyzer"
			}
		}
	},
	{
		title = "Trading",
		icon = "T",
		color = Color3.fromRGB(34, 181, 115),
		items = {
			{
				id = "trade",
				title = "Trade Spy"
			},
			{
				id = "wishlist",
				title = "Wishlist Matcher"
			}
		}
	},
	{
		title = "Activity",
		icon = "A",
		color = Color3.fromRGB(255, 169, 67),
		items = {
			{
				id = "online",
				title = "Online Activity"
			},
			{
				id = "farm",
				title = "Idle Farm Tracker"
			}
		}
	}
}

local function v242(p79)
	s9 = p79

	for k, v in pairs(t15) do
		local visible = k == p79

		v.frame.BackgroundColor3 = visible and t2.SIDEBAR_ACT or t2.SIDEBAR
		v.label.TextColor3 = visible and t2.TEXT or t2.TEXT_SEC

		if v.bar then
			v.bar.Visible = visible
		end
	end

	if u7 and u200 and v9 then
		v9()
	end

	if CanvasGroup then
		renderContent(p79)
	end
end
local function v246(p80)
	t16.invPlayer = p80
	t16.invAutoRun = true
	v242("inventory")
end

for i, v in ipairs(t17) do
	local Frame7 = t9.new("Frame", {
		Size = UDim2.new(1, 0, 0, 46),
		BackgroundTransparency = 1,
		LayoutOrder = i * 100,
		Parent = v237
	})
	local TextButton5 = t9.new("TextButton", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = "",
		AutoButtonColor = false,
		Parent = Frame7
	})
	local Frame8 = t9.new("Frame", {
		Size = UDim2.fromOffset(34, 34),
		Position = UDim2.fromOffset(12, 6),
		BackgroundColor3 = v.color,
		Parent = Frame7
	})

	t9.corner(Frame8, 17)
	t9.text(Frame8, {
		text = v.icon,
		font = GothamBold,
		size = 16,
		color = t2.TEXT,
		sz = UDim2.fromScale(1, 1),
		alignX = Enum.TextXAlignment.Center
	})
	t9.text(Frame7, {
		text = v.title,
		font = GothamBold,
		size = 16,
		color = t2.TEXT,
		sz = UDim2.new(1, -60, 1, 0),
		pos = UDim2.fromOffset(52, 0)
	})

	local v252 = t9.text(Frame7, {
		text = ">",
		font = GothamBold,
		size = 14,
		color = t2.TEXT_MUTED,
		sz = UDim2.fromOffset(24, 46),
		pos = UDim2.new(1, -28, 0, 0),
		alignX = Enum.TextXAlignment.Center
	})
	local Frame9 = t9.new("Frame", {
		Size = UDim2.new(1, 0, 0, #v.items * 42),
		BackgroundTransparency = 1,
		LayoutOrder = i * 100 + 1,
		ClipsDescendants = true,
		Parent = v237
	})

	t9.list(Frame9, nil, 0)

	local visible = i == 1

	Frame9.Visible = visible
	v252.Text = visible and "v" or ">"

	for i2, item in ipairs(v.items) do
		local TextButton6 = t9.new("TextButton", {
			Size = UDim2.new(1, 0, 0, 42),
			BackgroundColor3 = item.id == s9 and t2.SIDEBAR_ACT or t2.SIDEBAR,
			Text = "",
			AutoButtonColor = false,
			LayoutOrder = i2,
			Parent = Frame9
		})
		local Frame10 = t9.new("Frame", {
			Size = UDim2.new(0, 3, 1, -10),
			Position = UDim2.fromOffset(0, 5),
			BackgroundColor3 = v.color,
			Visible = item.id == s9,
			Parent = TextButton6
		})

		t9.corner(Frame10, 2)
		t15[item.id] = {
			frame = TextButton6,
			label = t9.text(TextButton6, {
				text = "  " .. item.title,
				font = Gotham,
				size = 15,
				color = item.id == s9 and t2.TEXT or t2.TEXT_SEC,
				sz = UDim2.new(1, -8, 1, 0),
				pos = UDim2.fromOffset(38, 0)
			}),
			bar = Frame10
		}
		TextButton6.MouseButton1Click:Connect(function()
			if Frame10 then
				TweenService:Create(Frame10, TweenInfo.new(0.08, Enum.EasingStyle.Quad), {
					Size = UDim2.new(0, 5, 1, -6)
				}):Play()
				task.delay(0.12, function()
					TweenService:Create(Frame10, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
						Size = UDim2.new(0, 3, 1, -10)
					}):Play()
				end)
			end

			v242(item.id)
		end)
		TextButton6.MouseEnter:Connect(function()
			if s9 ~= item.id then
				TweenService:Create(TextButton6, tweenInfo, {
					BackgroundColor3 = t2.SIDEBAR_HOVER
				}):Play()
			end
		end)
		TextButton6.MouseLeave:Connect(function()
			if s9 ~= item.id then
				TweenService:Create(TextButton6, tweenInfo, {
					BackgroundColor3 = t2.SIDEBAR
				}):Play()
			end
		end)
	end

	TextButton5.MouseButton1Click:Connect(function()
		visible = not visible

		local text = visible and "v"

		v252.Text = text or ">"

		if visible then
			Frame9.Visible = true
			TweenService:Create(Frame9, tweenInfo2, {
				Size = UDim2.new(1, 0, 0, #v.items * 42)
			}):Play()
		else
			TweenService:Create(Frame9, tweenInfo2, {
				Size = UDim2.new(1, 0, 0, 0)
			}):Play()
			task.delay(0.2, function()
				if not visible then
					Frame9.Visible = false
				end
			end)
		end
	end)
end

CanvasGroup = t9.new("CanvasGroup", {
	Size = UDim2.new(1, u7 and 0 or -v198, 1, -v199),
	Position = UDim2.fromOffset(u7 and 0 or v198, v199),
	BackgroundColor3 = t2.CONTENT,
	BorderSizePixel = 0,
	ClipsDescendants = true,
	GroupTransparency = 0,
	Parent = Frame3
})

local function v260()
	for _, child in pairs(CanvasGroup:GetChildren()) do
		child:Destroy()
	end
end

local v263 = u7 and 56 or 64

local function v264(p81, p82)
	local Frame7 = t9.new("Frame", {
		Size = UDim2.new(1, 0, 0, v263),
		BackgroundColor3 = t2.CONTENT,
		BorderSizePixel = 0,
		Parent = CanvasGroup
	})

	t9.padding(Frame7, u7 and 8 or 12, u7 and 4 or 8, u7 and 10 or 20, u7 and 10 or 20)
	t9.text(Frame7, {
		text = p81,
		font = FredokaOne,
		size = u7 and 18 or 26,
		color = t2.TEXT,
		sz = UDim2.new(u7 and 0.45 or 0.35, 0, 1, 0)
	})

	if p82 then
		local new = t9.new
		local s10 = "Frame"
		local t18 = {
			Size = UDim2.new(u7 and 0.55 or 0.35, 0, 1, 0)
		}
		local uDim2 = UDim2.fromScale

		t18.Position = uDim2(u7 and 0.45 or 0.65, 0)
		t18.BackgroundTransparency = 1
		t18.Parent = Frame7

		local v270 = new(s10, t18)

		t9.list(v270, Enum.FillDirection.Horizontal, u7 and 4 or 8, Enum.HorizontalAlignment.Right)

		for _, v in ipairs(p82) do
			t9.button(v270, v)
		end
	end

	return Frame7
end
local function v273()
	local v274 = t9.scrollFrame(CanvasGroup, {
		size = UDim2.new(1, 0, 1, -v263),
		pos = UDim2.fromOffset(0, v263)
	})

	t9.padding(v274, u7 and 6 or 10, u7 and 6 or 10, u7 and 10 or 20, u7 and 10 or 20)

	return v274
end
local function v275(p83, p84)
	local text = t9.text
	local v277 = p83
	local t19 = {
		text = p84 or "Click a button above to load data.",
		font = Gotham,
		size = 16
	}

	t19.color = t2.TEXT_MUTED
	t19.sz = UDim2.new(1, 0, 0, 50)
	t19.height = 50
	t19.alignX = Enum.TextXAlignment.Center
	t19.order = 9999
	text(v277, t19)
end
local function v279(p85)
	for _, child in pairs(p85:GetChildren()) do
		if not child:IsA("UIListLayout") then
			if not child:IsA("UIPadding") and not child:IsA("UIGridLayout") then
				child:Destroy()
			end
		end
	end
end
local function v282(p86)
	v279(p86)
	t9.text(p86, {
		text = "Loading...",
		font = Gotham,
		size = 18,
		color = t2.TEXT_MUTED,
		sz = UDim2.new(1, 0, 0, 50),
		height = 50,
		alignX = Enum.TextXAlignment.Center,
		order = 0
	})
end

local t20 = {
	scanner = function()
		local v284

		local function v285()
			if v284 then
				v282(v284)
			end

			task.wait()

			local v286 = v59(true)

			if not v286 or not next(v286) then
				return
			end

			v22()

			if v284 then
				v279(v284)
			end

			local n10 = 0
			local n11 = 0
			local n12 = 0
			local t21 = {}

			for k, v in pairs(v286) do
				n11 += 1

				local v293 = v62(v, "char_wrapper_raw") or {}
				local v294 = v78(v)
				local display_vip = v293.display_vip or false

				if display_vip then
					n12 += 1
				end

				local v296 = v62(v293, "location", "destination_id") or "?"
				local v297 = v62(v, "sessions_played") or 0
				local v298 = v113(v)

				n10 += v298
				table.insert(t21, {
					name = k,
					pet = v294,
					vip = display_vip,
					loc = v296,
					sessions = v297,
					totalVal = v298,
					petPrice = v294 and v50(v294.id, v138(v294)) or 0
				})
			end

			local v299 = n11 > 0 and n10 / n11 or 0

			table.sort(t21, function(p87, p88)
				return p87.totalVal > p88.totalVal
			end)

			local Frame7 = t9.new("Frame", {
				Size = UDim2.new(1, 0, 0, u7 and 134 or 84),
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Parent = v284
			})

			if u7 then
				t9.grid(Frame7, UDim2.new(0.48, 0, 0, 60), UDim2.fromOffset(4, 6))
			else
				t9.list(Frame7, Enum.FillDirection.Horizontal, 10)
			end

			t9.miniStat(Frame7, "Players", tostring(n11), t2.ACCENT_LIGHT, 1)
			t9.miniStat(Frame7, "Server Value", v52(n10), t2.SUCCESS, 2)
			t9.miniStat(Frame7, "Avg Value", v52(v299), t2.TEXT_SEC, 3)
			t9.miniStat(Frame7, "VIP", n12 .. "/" .. n11, t2.WARNING, 4)

			local v301 = u7 and 160 or 240
			local v302 = u7 and 260 or 320
			local Frame8 = t9.new("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Parent = v284
			})

			if u7 then
				t9.grid(Frame8, UDim2.new(0.48, 0, 0, v302), UDim2.fromOffset(4, 6))
			else
				t9.grid(Frame8, UDim2.fromOffset(v301, v302), UDim2.fromOffset(10, 10))
			end

			for _, v in ipairs(t21) do
				local TextButton5 = t9.new("TextButton", {
					Size = UDim2.fromOffset(v301, v302),
					BackgroundColor3 = t2.CARD,
					Text = "",
					AutoButtonColor = false,
					Parent = Frame8
				})

				t9.corner(TextButton5, 10)
				t9.stroke(TextButton5, t2.CARD_BORDER)
				TextButton5.MouseButton1Click:Connect(function()
					v246(v.name)
				end)
				TextButton5.MouseEnter:Connect(function()
					local UIStroke = TextButton5:FindFirstChildOfClass("UIStroke")

					if UIStroke then
						TweenService:Create(UIStroke, tweenInfo, {
							Color = t2.ACCENT_LIGHT,
							Thickness = 2
						}):Play()
					end

					TweenService:Create(TextButton5, tweenInfo, {
						BackgroundColor3 = Color3.fromRGB(38, 34, 62)
					}):Play()
				end)
				TextButton5.MouseLeave:Connect(function()
					local UIStroke = TextButton5:FindFirstChildOfClass("UIStroke")

					if UIStroke then
						TweenService:Create(UIStroke, tweenInfo, {
							Color = t2.CARD_BORDER,
							Thickness = 1
						}):Play()
					end

					TweenService:Create(TextButton5, tweenInfo, {
						BackgroundColor3 = t2.CARD
					}):Play()
				end)

				local v309 = u7 and 66 or 90
				local v310 = u7 and 82 or 106
				local v311 = u7 and 100 or 126
				local v312 = u7 and 118 or 150
				local v313 = u7 and 122 or 158
				local v314 = u7 and 146 or 184
				local v315 = u7 and 174 or 216
				local v316 = u7 and 194 or 244
				local v317 = u7 and 240 or 296

				if v.pet then
					t9.petImage(TextButton5, v.pet.id, v309, v.pet.neon, v.pet.megaNeon, v.pet.flyable, v.pet.rideable).Position = UDim2.new(0.5, -math.floor(v309 / 2), 0, u7 and 6 or 12)
					t9.text(TextButton5, {
						text = v.pet.name,
						font = GothamBold,
						size = u7 and 12 or 14,
						color = t2.ACCENT_LIGHT,
						sz = UDim2.new(1, -12, 0, 20),
						pos = UDim2.fromOffset(6, v310),
						alignX = Enum.TextXAlignment.Center,
						truncate = true
					})

					if v.petPrice > 0 then
						t9.text(TextButton5, {
							text = v52(v.petPrice),
							font = GothamBold,
							size = u7 and 12 or 14,
							color = v56(v.petPrice),
							sz = UDim2.new(1, 0, 0, 18),
							pos = UDim2.fromOffset(0, v311),
							alignX = Enum.TextXAlignment.Center
						})
					end
				else
					t9.text(TextButton5, {
						text = "No Pet",
						font = Gotham,
						size = u7 and 13 or 16,
						color = t2.TEXT_MUTED,
						sz = UDim2.new(1, 0, 0, v309),
						pos = UDim2.fromOffset(0, 12),
						alignX = Enum.TextXAlignment.Center
					})
				end

				t9.new("Frame", {
					Size = UDim2.new(1, -20, 0, 1),
					Position = UDim2.fromOffset(10, v312),
					BackgroundColor3 = t2.CARD_BORDER,
					Parent = TextButton5
				})
				t9.text(TextButton5, {
					text = v.name,
					font = GothamBold,
					size = u7 and 14 or 17,
					color = t2.TEXT,
					sz = UDim2.new(1, -12, 0, 22),
					pos = UDim2.fromOffset(6, v313),
					truncate = true
				})

				local Frame9 = t9.new("Frame", {
					Size = UDim2.new(1, -12, 0, 26),
					Position = UDim2.fromOffset(6, v314),
					BackgroundTransparency = 1,
					Parent = TextButton5
				})

				t9.list(Frame9, Enum.FillDirection.Horizontal, u7 and 3 or 5)

				if v.vip then
					t9.badge(Frame9, "VIP", t2.ACCENT)
				end

				t9.badge(Frame9, v.loc, t2.SIDEBAR_ACT)
				t9.text(TextButton5, {
					text = v.sessions .. " sess",
					font = Gotham,
					size = u7 and 11 or 13,
					color = t2.TEXT_MUTED,
					sz = UDim2.new(1, -12, 0, 16),
					pos = UDim2.fromOffset(6, v315)
				})

				local Frame10 = t9.new("Frame", {
					Size = UDim2.new(1, -12, 0, u7 and 38 or 44),
					Position = UDim2.fromOffset(6, v316),
					BackgroundColor3 = Color3.fromRGB(22, 20, 40),
					Parent = TextButton5
				})

				t9.corner(Frame10, 8)
				t9.text(Frame10, {
					text = "Total Value",
					font = Gotham,
					size = u7 and 10 or 12,
					color = t2.TEXT_MUTED,
					sz = UDim2.new(1, 0, 0, 16),
					pos = UDim2.fromOffset(8, 1)
				})
				t9.text(Frame10, {
					text = v.totalVal > 0 and v52(v.totalVal) or "N/A",
					font = GothamBold,
					size = u7 and 14 or 18,
					color = v.totalVal > 0 and v56(v.totalVal) or t2.TEXT_MUTED,
					sz = UDim2.new(1, -10, 0, 20),
					pos = UDim2.fromOffset(8, u7 and 16 or 20)
				})

				if not u7 then
					t9.text(TextButton5, {
						text = "Click to analyze  >",
						font = Gotham,
						size = 12,
						color = t2.TEXT_MUTED,
						sz = UDim2.new(1, -16, 0, 18),
						pos = UDim2.fromOffset(8, v317),
						alignX = Enum.TextXAlignment.Center
					})
				end
			end
		end

		v260()

		local v320 = v264
		local s11 = "Server Scanner"
		local t22 = {
			{
				text = "Scan Server",
				width = u7 and 100 or 130,
				callback = v285
			},
			{
				text = "Copy All",
				width = u7 and 70 or 90,
				color = Color3.fromRGB(60, 55, 100),
				shadowColor = Color3.fromRGB(40, 35, 70),
				callback = function()
					if t16.scannerSummary then
						setclipboard(t16.scannerSummary)
					end
				end
			}
		}

		v320(s11, t22)
		v284 = v273()
		t9.list(v284, nil, 10)
		v275(v284, "Click 'Scan Server' to load player data.")
	end,
	rich = function()
		local v325
		local richSort = t16.richSort or "By Total Value"

		local function v327()
			if v325 then
				v282(v325)
			end

			task.wait()

			local v328 = v59()

			if not v328 or not next(v328) then
				return
			end

			v22()

			if v325 then
				v279(v325)
			end

			local t25 = {}
			local n13 = 0

			for k, v in pairs(v328) do
				local v333, v334, v335 = v113(v)
				local v336 = v90(v)
				local petCount = #v83(v)
				local v338 = v78(v)

				if v338 then
					petCount += 1
				end

				n13 += v333

				local insert = table.insert
				local v340 = t25
				local t26 = {
					name = k,
					totalVal = v333,
					bestPrice = v334,
					bestPet = v335,
					pet = v338,
					sessions = v62(v, "sessions_played") or 0
				}
				local inventory = v336.stats.inventory

				t26.invCount = inventory or 0
				t26.petCount = petCount
				t26.vip = v62(v, "char_wrapper_raw", "display_vip") or false
				insert(v340, t26)
			end

			if richSort == "By Total Value" then
				table.sort(t25, function(p89, p90)
					return p89.totalVal > p90.totalVal
				end)
			elseif richSort == "By Best Pet Value" then
				table.sort(t25, function(p91, p92)
					return p91.bestPrice > p92.bestPrice
				end)
			elseif richSort == "By Pet Count" then
				table.sort(t25, function(p93, p94)
					return p93.petCount > p94.petCount
				end)
			elseif richSort == "By Sessions" then
				table.sort(t25, function(p95, p96)
					return p95.sessions > p96.sessions
				end)
			else
				table.sort(t25, function(p97, p98)
					return p97.invCount > p98.invCount
				end)
			end

			t9.text(v325, {
				text = "Server Total: " .. v52(n13) .. "  |  " .. #t25 .. " players",
				font = GothamBold,
				size = u7 and 13 or 16,
				color = t2.SUCCESS,
				height = u7 and 26 or 32,
				order = 0
			})

			local Frame7 = t9.new("Frame", {
				Size = UDim2.new(1, 0, 0, u7 and 30 or 38),
				BackgroundColor3 = t2.SIDEBAR,
				LayoutOrder = 1,
				Parent = v325
			})

			t9.corner(Frame7, 5)

			local t27

			if u7 then
				t27 = {
					{
						"#",
						24
					},
					{
						"Player",
						100
					},
					{
						"Total $",
						70
					},
					{
						"Best Pet",
						90
					}
				}
			else
				t27 = {
					{
						"#",
						36
					},
					{
						"Player",
						190
					},
					{
						"Pets",
						52
					},
					{
						"Total $",
						95
					},
					{
						"Best Pet",
						170
					},
					{
						"Best $",
						85
					},
					{
						"Inv",
						52
					},
					{
						"Sess",
						52
					}
				}
			end

			local v345 = u7 and 4 or 10
			local v346 = u7 and 30 or 38

			for _, v in ipairs(t27) do
				t9.text(Frame7, {
					text = v[1],
					font = GothamBold,
					size = u7 and 11 or 13,
					color = t2.TEXT_MUTED,
					sz = UDim2.fromOffset(v[2], v346),
					pos = UDim2.fromOffset(v345, 0),
					alignX = Enum.TextXAlignment.Center
				})
				v345 = v345 + v[2] + (u7 and 3 or 5)
			end

			for i, v in ipairs(t25) do
				local CARD = i % 2 == 0 and t2.CARD or t2.CONTENT
				local v352 = u7 and 44 or 56
				local TextButton5 = t9.new("TextButton", {
					Size = UDim2.new(1, 0, 0, v352),
					BackgroundColor3 = CARD,
					Text = "",
					AutoButtonColor = false,
					LayoutOrder = i + 1,
					Parent = v325
				})

				t9.corner(TextButton5, 5)
				TextButton5.MouseButton1Click:Connect(function()
					v246(v.name)
				end)
				TextButton5.MouseEnter:Connect(function()
					TweenService:Create(TextButton5, tweenInfo, {
						BackgroundColor3 = t2.SIDEBAR_HOVER
					}):Play()
				end)
				TextButton5.MouseLeave:Connect(function()
					TweenService:Create(TextButton5, tweenInfo, {
						BackgroundColor3 = CARD
					}):Play()
				end)

				if u7 then
					t9.text(TextButton5, {
						text = "#" .. i,
						font = GothamBold,
						size = 12,
						color = t2.TEXT_MUTED,
						sz = UDim2.fromOffset(24, v352),
						pos = UDim2.fromOffset(4, 0),
						alignX = Enum.TextXAlignment.Center
					})

					local n14 = 31

					t9.text(TextButton5, {
						text = v.name .. (v.vip and " *" or ""),
						font = GothamBold,
						size = 13,
						color = t2.TEXT,
						sz = UDim2.fromOffset(100, v352),
						pos = UDim2.fromOffset(n14, 0),
						truncate = true
					})

					local v355 = n14 + 103

					t9.text(TextButton5, {
						text = v52(v.totalVal),
						font = GothamBold,
						size = 13,
						color = v56(v.totalVal),
						sz = UDim2.fromOffset(70, v352),
						pos = UDim2.fromOffset(v355, 0),
						alignX = Enum.TextXAlignment.Center
					})

					local v356 = v355 + 73

					t9.text(TextButton5, {
						text = v.bestPet and v42(v.bestPet) or "N/A",
						font = Gotham,
						size = 12,
						color = t2.TEXT_SEC,
						sz = UDim2.fromOffset(90, v352),
						pos = UDim2.fromOffset(v356, 0),
						truncate = true
					})
				else
					t9.text(TextButton5, {
						text = "#" .. i,
						font = GothamBold,
						size = 15,
						color = t2.TEXT_MUTED,
						sz = UDim2.fromOffset(36, v352),
						pos = UDim2.fromOffset(10, 0),
						alignX = Enum.TextXAlignment.Center
					})

					local n15 = 51

					if v.bestPet then
						t9.petImage(TextButton5, v.bestPet, 46, false, false).Position = UDim2.fromOffset(n15, 5)
					end

					t9.text(TextButton5, {
						text = v.name .. (v.vip and " [VIP]" or ""),
						font = GothamBold,
						size = 15,
						color = t2.TEXT,
						sz = UDim2.fromOffset(136, v352),
						pos = UDim2.fromOffset(n15 + 50, 0),
						truncate = true
					})

					local v358 = n15 + 195

					t9.text(TextButton5, {
						text = tostring(v.petCount),
						font = Gotham,
						size = 14,
						color = t2.TEXT_SEC,
						sz = UDim2.fromOffset(52, v352),
						pos = UDim2.fromOffset(v358, 0),
						alignX = Enum.TextXAlignment.Center
					})

					local v359 = v358 + 57

					t9.text(TextButton5, {
						text = v52(v.totalVal),
						font = GothamBold,
						size = 15,
						color = v56(v.totalVal),
						sz = UDim2.fromOffset(95, v352),
						pos = UDim2.fromOffset(v359, 0),
						alignX = Enum.TextXAlignment.Center
					})

					local v360 = v359 + 100

					t9.text(TextButton5, {
						text = v.bestPet and v42(v.bestPet) or "N/A",
						font = Gotham,
						size = 14,
						color = t2.TEXT_SEC,
						sz = UDim2.fromOffset(170, v352),
						pos = UDim2.fromOffset(v360, 0),
						truncate = true
					})

					local v361 = v360 + 175

					t9.text(TextButton5, {
						text = v52(v.bestPrice),
						font = Gotham,
						size = 14,
						color = v56(v.bestPrice),
						sz = UDim2.fromOffset(85, v352),
						pos = UDim2.fromOffset(v361, 0),
						alignX = Enum.TextXAlignment.Center
					})

					local v362 = v361 + 90

					t9.text(TextButton5, {
						text = tostring(v.invCount),
						font = Gotham,
						size = 14,
						color = t2.TEXT_MUTED,
						sz = UDim2.fromOffset(52, v352),
						pos = UDim2.fromOffset(v362, 0),
						alignX = Enum.TextXAlignment.Center
					})
					t9.text(TextButton5, {
						text = tostring(v.sessions),
						font = Gotham,
						size = 14,
						color = t2.TEXT_MUTED,
						sz = UDim2.fromOffset(52, v352),
						pos = UDim2.fromOffset(v362 + 57, 0),
						alignX = Enum.TextXAlignment.Center
					})
				end
			end
		end

		v260()
		t9.dropdown(v264("Rich Player Finder", { {
			text = "Scan",
			width = u7 and 70 or 90,
			callback = v327
		} }), {
			options = {
				"By Total Value",
				"By Best Pet Value",
				"By Pet Count",
				"By Sessions",
				"By Inventory Size"
			},
			selected = richSort,
			width = u7 and 140 or 200,
			onChange = function(p99)
				richSort = p99
				t16.richSort = p99
			end
		}).Position = UDim2.fromOffset(u7 and 130 or 240, u7 and 8 or 12)
		v325 = v273()
		t9.list(v325, nil, 2)

		local padding = t9.padding
		local v364 = v325
		local n16 = 4
		local n17 = 4
		local v367 = u7 and 2

		padding(v364, n16, n17, v367 or 4, u7 and 2 or 4)
		v275(v325)
	end,
	trade = function()
		local v368
		local v369
		local tradeFilter = t16.tradeFilter or "All"

		local function v371()
			if v368 then
				v282(v368)
			end

			task.wait()

			local v372 = v59()

			if not v372 or not next(v372) then
				return
			end

			v22()

			if v368 then
				v279(v368)
			end

			local t28 = {}
			local t29 = { "All" }

			for k, v in pairs(v372) do
				table.insert(t29, k)

				for _, trade in pairs(v90(v).trades) do
					table.insert(t28, {
						player = k,
						trade = trade
					})
				end
			end

			if v369 then
				v369(t29)
			end

			if #t28 == 0 then
				v275(v368, "No trades found.")

				return
			end

			local n18 = 0

			for _, v in ipairs(t28) do
				if tradeFilter == "All" or v.player == tradeFilter then
					n18 += 1

					local trade = v.trade
					local votes = trade.votes or {}
					local W = votes.W or 0
					local L = votes.L or 0
					local F = votes.F or 0
					local v387 = math.max(W + L + F, 1)
					local v388 = W > L and W > F and "WIN" or L > W and L > F and "LOSS" or "FAIR"
					local SUCCESS = v388 == "WIN" and t2.SUCCESS or v388 == "LOSS" and t2.DANGER or t2.WARNING
					local v390, v391, v392, v393 = v129(trade)
					local SUCCESS2 = v392 >= 0 and t2.SUCCESS or t2.DANGER
					local v395 = v392 >= 0 and "+" or ""
					local n19 = 0
					local pairs_ = pairs
					local sender_items = trade.sender_items or {}

					for _ in pairs_(sender_items) do
						n19 += 1
					end

					local n20 = 0
					local pairs_2 = pairs
					local recipient_items = trade.recipient_items or {}

					for _ in pairs_2(recipient_items) do
						n20 += 1
					end

					local v404 = u7 and 2 or 3
					local v405 = u7 and 56 or 72
					local v406 = u7 and 68 or 82
					local v407 = u7 and 44 or 58
					local v408 = (u7 and 90 or 110) + math.max(math.ceil(math.max(n19, n20) / v404), 1) * (v406 + 8)
					local Frame7 = t9.new("Frame", {
						Size = UDim2.new(1, 0, 0, v408),
						BackgroundColor3 = t2.CARD,
						LayoutOrder = n18,
						Parent = v368
					})

					t9.corner(Frame7, 8)
					t9.stroke(Frame7, t2.CARD_BORDER)
					t9.text(Frame7, {
						text = v.player .. " - " .. (trade.sender_name or trade.recipient_name or "?"),
						font = GothamBold,
						size = u7 and 12 or 15,
						color = t2.TEXT,
						sz = UDim2.new(0.7, 0, 0, 28),
						pos = UDim2.fromOffset(u7 and 8 or 14, 4)
					})
					t9.badge(Frame7, v388, SUCCESS).Position = UDim2.new(1, u7 and -60 or -76, 0, 4)

					local v410 = u7 and 32 or 42
					local Frame8 = t9.new("Frame", {
						Size = UDim2.new(0.44, u7 and -4 or -8, 0, 0),
						Position = UDim2.fromOffset(u7 and 6 or 14, v410),
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundTransparency = 1,
						Parent = Frame7
					})

					t9.text(Frame8, {
						text = "Sent: " .. v52(v390),
						font = GothamBold,
						size = u7 and 12 or 14,
						color = t2.DANGER,
						height = 20,
						sz = UDim2.new(1, 0, 0, 20)
					})

					local Frame9 = t9.new("Frame", {
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Parent = Frame8
					})

					t9.grid(Frame9, UDim2.fromOffset(v405, v406), UDim2.fromOffset(4, 4))

					local pairs_3 = pairs
					local sender_items2 = trade.sender_items or {}

					for _, v2 in pairs_3(sender_items2) do
						if type(v2) == "table" and v2.kind then
							local properties = v2.properties or {}
							local Frame10 = t9.new("Frame", {
								Size = UDim2.fromOffset(v405, v406),
								BackgroundTransparency = 1,
								Parent = Frame9
							})

							t9.petImage(Frame10, v2.kind, v407, properties.neon, properties.mega_neon, properties.flyable, properties.rideable)

							local v419 = v50(v2.kind, properties)
							local v420 = v419 > 0 and v52(v419) or v42(v2.kind)

							if #v420 > 8 then
								v420 = v420:sub(1, 7) .. ".."
							end

							t9.text(Frame10, {
								text = v420,
								font = Gotham,
								size = u7 and 9 or 11,
								color = t2.TEXT_MUTED,
								sz = UDim2.new(1, 0, 0, 16),
								pos = UDim2.fromOffset(0, v407 + 2),
								alignX = Enum.TextXAlignment.Center
							})
						end
					end

					local text = t9.text
					local v422 = Frame7
					local t30 = {
						text = "->",
						font = FredokaOne,
						size = u7 and 18 or 24,
						color = t2.TEXT_MUTED,
						sz = UDim2.fromOffset(24, 50)
					}
					local uDim2New = UDim2.new
					local n21 = 0.44

					t30.pos = uDim2New(n21, u7 and -4 or -8, 0, v410 + 16)
					t30.alignX = Enum.TextXAlignment.Center
					text(v422, t30)

					local Frame10 = t9.new("Frame", {
						Size = UDim2.new(n21, u7 and -4 or -8, 0, 0),
						Position = UDim2.new(0.5, u7 and 4 or 8, 0, v410),
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundTransparency = 1,
						Parent = Frame7
					})

					t9.text(Frame10, {
						text = "Got: " .. v52(v391),
						font = GothamBold,
						size = u7 and 12 or 14,
						color = t2.SUCCESS,
						height = 20,
						sz = UDim2.new(1, 0, 0, 20)
					})

					local Frame11 = t9.new("Frame", {
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Parent = Frame10
					})

					t9.grid(Frame11, UDim2.fromOffset(v405, v406), UDim2.fromOffset(4, 4))

					local pairs_4 = pairs
					local recipient_items2 = trade.recipient_items or {}

					for _, v2 in pairs_4(recipient_items2) do
						if type(v2) == "table" and v2.kind then
							local properties = v2.properties or {}
							local Frame12 = t9.new("Frame", {
								Size = UDim2.fromOffset(v405, v406),
								BackgroundTransparency = 1,
								Parent = Frame11
							})

							t9.petImage(Frame12, v2.kind, v407, properties.neon, properties.mega_neon, properties.flyable, properties.rideable)

							local v434 = v50(v2.kind, properties)
							local v435 = v434 > 0 and v52(v434) or v42(v2.kind)

							if #v435 > 8 then
								v435 = v435:sub(1, 7) .. ".."
							end

							t9.text(Frame12, {
								text = v435,
								font = Gotham,
								size = u7 and 9 or 11,
								color = t2.TEXT_MUTED,
								sz = UDim2.new(1, 0, 0, 16),
								pos = UDim2.fromOffset(0, v407 + 2),
								alignX = Enum.TextXAlignment.Center
							})
						end
					end

					local v436 = v408 - 58

					if v390 > 0 or v391 > 0 then
						t9.text(Frame7, {
							text = string.format("Diff: %s%s (%s)", v395, v52(math.abs(v392)), v393 > 0 and string.format("%.1fx", v393) or "N/A"),
							font = GothamBold,
							size = 14,
							color = SUCCESS2,
							sz = UDim2.new(1, -28, 0, 22),
							pos = UDim2.fromOffset(14, v436),
							alignX = Enum.TextXAlignment.Center
						})
					end

					local Frame12 = t9.new("Frame", {
						Size = UDim2.new(1, -28, 0, 10),
						Position = UDim2.fromOffset(14, v436 + 24),
						BackgroundColor3 = t2.CARD_BORDER,
						Parent = Frame7
					})

					t9.corner(Frame12, 5)

					if W > 0 then
						t9.corner(t9.new("Frame", {
							Size = UDim2.fromScale(W / v387, 1),
							BackgroundColor3 = t2.SUCCESS,
							Parent = Frame12
						}), 5)
					end

					if F > 0 then
						t9.corner(t9.new("Frame", {
							Size = UDim2.fromScale(F / v387, 1),
							Position = UDim2.fromScale(W / v387, 0),
							BackgroundColor3 = t2.WARNING,
							Parent = Frame12
						}), 5)
					end

					if L > 0 then
						t9.corner(t9.new("Frame", {
							Size = UDim2.fromScale(L / v387, 1),
							Position = UDim2.fromScale((W + F) / v387, 0),
							BackgroundColor3 = t2.DANGER,
							Parent = Frame12
						}), 5)
					end

					t9.text(Frame7, {
						text = string.format("%dW / %dF / %dL", W, F, L),
						font = Gotham,
						size = 13,
						color = t2.TEXT_MUTED,
						sz = UDim2.new(1, -28, 0, 18),
						pos = UDim2.fromOffset(14, v436 + 36),
						alignX = Enum.TextXAlignment.Center
					})
				end
			end

			if n18 == 0 then
				v275(v368, "No trades for selected player.")
			end
		end

		v260()

		local tradeSpy = v264("Trade Spy", { {
			text = u7 and "Scan" or "Scan Trades",
			width = u7 and 70 or 130,
			callback = v371
		} })
		local v439

		v439, v369 = t9.dropdown(tradeSpy, {
			options = { "All" },
			selected = tradeFilter,
			width = u7 and 120 or 180,
			onChange = function(p100)
				tradeFilter = p100
				t16.tradeFilter = p100
			end
		})

		local v440 = u7 and 110 or 200

		v439.Position = UDim2.fromOffset(v440, u7 and 8 or 12)
		v368 = v273()
		t9.list(v368, nil, 10)
		v275(v368)
	end,
	wishlist = function()
		local v441
		local u442

		local function v443()
			if v441 then
				v282(v441)
			end

			task.wait()

			local v444 = v59()

			if not v444 or not next(v444) then
				return
			end

			v22()

			if v441 then
				v279(v441)
			end

			local t31 = {}
			local t32 = {}

			for k, v in pairs(v444) do
				local v449 = v90(v)

				t31[k] = {}

				for _, wishlist in pairs(v449.wishlists) do
					local pairs_ = pairs
					local items = wishlist.items or {}

					for _, item in pairs_(items) do
						if type(item) == "table" and item.kind then
							t31[k][item.kind] = true
						end
					end
				end

				t32[k] = {}

				for _, collection in pairs(v449.collections) do
					local pairs_ = pairs
					local items = collection.items or {}

					for _, item in pairs_(items) do
						if type(item) == "table" and item.kind then
							t32[k][item.kind] = true
						end
					end
				end

				local v462 = v78(v)

				if v462 then
					t32[k][v462.id] = true
				end
			end

			local t33 = {}
			local n22 = 0

			for k, v in pairs(t31) do
				for k2 in pairs(v) do
					for k3, v2 in pairs(t32) do
						if k3 ~= k and v2[k2] then
							local v470 = v50(k2)

							n22 += v470
							table.insert(t33, {
								wants = k,
								has = k3,
								pet = v42(k2),
								petId = k2,
								price = v470,
								isLocal = k == LocalPlayer.Name or k3 == LocalPlayer.Name
							})
						end
					end
				end
			end

			table.sort(t33, function(p101, p102)
				if p101.isLocal == p102.isLocal then
					return p101.price > p102.price
				end

				return p101.isLocal
			end)
			u442 = t33

			if #t33 == 0 then
				v275(v441, "No wishlist matches found.")

				return
			end

			local Frame7 = t9.new("Frame", {
				Size = UDim2.new(1, 0, 0, u7 and 36 or 42),
				BackgroundColor3 = t2.SIDEBAR_ACT,
				LayoutOrder = 0,
				Parent = v441
			})

			t9.corner(Frame7, 7)
			t9.text(Frame7, {
				text = string.format("  %d matches  |  Value: %s", #t33, v52(n22)),
				font = GothamBold,
				size = u7 and 12 or 15,
				color = t2.ACCENT_LIGHT,
				sz = UDim2.fromScale(1, 1)
			})

			for i, v in ipairs(t33) do
				local CARD = i % 2 == 0 and t2.CARD or t2.CONTENT
				local Frame8 = t9.new("Frame", {
					Size = UDim2.new(1, 0, 0, u7 and 80 or 58),
					BackgroundColor3 = CARD,
					LayoutOrder = i,
					Parent = v441
				})

				t9.corner(Frame8, 7)

				if v.isLocal then
					t9.stroke(Frame8, t2.ACCENT, 1)
				end

				Frame8.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement then
						local tween = TweenService:Create(Frame8, tweenInfo, {
							BackgroundColor3 = t2.SIDEBAR_HOVER
						})

						tween:Play()
					elseif input.UserInputType == Enum.UserInputType.Touch then
						TweenService:Create(Frame8, tweenInfo, {
							BackgroundColor3 = t2.SIDEBAR_HOVER
						}):Play()

						return
					end
				end)
				Frame8.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						TweenService:Create(Frame8, tweenInfo, {
							BackgroundColor3 = CARD
						}):Play()
					end
				end)

				local pet = v.pet
				local v478 = v.price > 0 and " " .. v52(v.price) or ""

				if u7 then
					local TextButton5 = t9.new("TextButton", {
						Size = UDim2.fromOffset(math.floor(v139 * 0.35), 28),
						Position = UDim2.fromOffset(6, 4),
						BackgroundTransparency = 1,
						Text = "",
						AutoButtonColor = false,
						Parent = Frame8
					})

					t9.text(TextButton5, {
						text = v.wants,
						font = GothamBold,
						size = 13,
						color = t2.TEXT,
						sz = UDim2.fromScale(1, 1),
						truncate = true
					})
					TextButton5.MouseButton1Click:Connect(function()
						v246(v.wants)
					end)
					t9.text(Frame8, {
						text = "wants",
						font = Gotham,
						size = 10,
						color = t2.TEXT_MUTED,
						sz = UDim2.fromOffset(36, 28),
						pos = UDim2.fromOffset(math.floor(v139 * 0.35) + 8, 4)
					})
					t9.petImage(Frame8, v.petId, 34, false, false).Position = UDim2.fromOffset(math.floor(v139 * 0.35) + 46, 2)
					t9.text(Frame8, {
						text = pet .. v478,
						font = GothamBold,
						size = 11,
						color = t2.WARNING,
						sz = UDim2.new(1, -math.floor(v139 * 0.35) - 86, 0, 28),
						pos = UDim2.fromOffset(math.floor(v139 * 0.35) + 82, 4),
						truncate = true
					})
					t9.text(Frame8, {
						text = "->",
						font = FredokaOne,
						size = 14,
						color = t2.TEXT_MUTED,
						sz = UDim2.fromOffset(22, 24),
						pos = UDim2.fromOffset(6, 34),
						alignX = Enum.TextXAlignment.Center
					})

					local TextButton6 = t9.new("TextButton", {
						Size = UDim2.fromOffset(math.floor(v139 * 0.4), 24),
						Position = UDim2.fromOffset(30, 36),
						BackgroundTransparency = 1,
						Text = "",
						AutoButtonColor = false,
						Parent = Frame8
					})

					t9.text(TextButton6, {
						text = v.has,
						font = GothamBold,
						size = 13,
						color = t2.SUCCESS,
						sz = UDim2.fromScale(1, 1),
						truncate = true
					})
					TextButton6.MouseButton1Click:Connect(function()
						v246(v.has)
					end)

					if v.isLocal then
						t9.badge(Frame8, "YOU", t2.ACCENT, 0).Position = UDim2.new(1, -48, 0, 36)
					end
				else
					local TextButton5 = t9.new("TextButton", {
						Size = UDim2.fromOffset(150, 58),
						Position = UDim2.fromOffset(8, 0),
						BackgroundTransparency = 1,
						Text = "",
						AutoButtonColor = false,
						Parent = Frame8
					})

					t9.text(TextButton5, {
						text = v.wants,
						font = GothamBold,
						size = 15,
						color = t2.TEXT,
						sz = UDim2.fromScale(1, 1),
						truncate = true
					})
					TextButton5.MouseButton1Click:Connect(function()
						v246(v.wants)
					end)
					TextButton5.MouseEnter:Connect(function()
						TextButton5:FindFirstChildOfClass("TextLabel").TextColor3 = t2.ACCENT_LIGHT
					end)
					TextButton5.MouseLeave:Connect(function()
						TextButton5:FindFirstChildOfClass("TextLabel").TextColor3 = t2.TEXT
					end)
					t9.text(Frame8, {
						text = "wants",
						font = Gotham,
						size = 12,
						color = t2.TEXT_MUTED,
						sz = UDim2.fromOffset(46, 58),
						pos = UDim2.fromOffset(162, 0),
						alignX = Enum.TextXAlignment.Center
					})
					t9.petImage(Frame8, v.petId, 50, false, false).Position = UDim2.fromOffset(212, 4)
					t9.text(Frame8, {
						text = pet .. v478,
						font = GothamBold,
						size = 14,
						color = t2.WARNING,
						sz = UDim2.fromOffset(180, 58),
						pos = UDim2.fromOffset(268, 0),
						truncate = true
					})
					t9.text(Frame8, {
						text = "->",
						font = FredokaOne,
						size = 20,
						color = t2.TEXT_MUTED,
						sz = UDim2.fromOffset(32, 58),
						pos = UDim2.fromOffset(452, 0),
						alignX = Enum.TextXAlignment.Center
					})

					local TextButton6 = t9.new("TextButton", {
						Size = UDim2.fromOffset(160, 58),
						Position = UDim2.fromOffset(488, 0),
						BackgroundTransparency = 1,
						Text = "",
						AutoButtonColor = false,
						Parent = Frame8
					})

					t9.text(TextButton6, {
						text = v.has,
						font = GothamBold,
						size = 15,
						color = t2.SUCCESS,
						sz = UDim2.fromScale(1, 1),
						truncate = true
					})
					TextButton6.MouseButton1Click:Connect(function()
						v246(v.has)
					end)
					TextButton6.MouseEnter:Connect(function()
						TextButton6:FindFirstChildOfClass("TextLabel").TextColor3 = t2.ACCENT_LIGHT
					end)
					TextButton6.MouseLeave:Connect(function()
						TextButton6:FindFirstChildOfClass("TextLabel").TextColor3 = t2.SUCCESS
					end)

					if v.isLocal then
						t9.badge(Frame8, "YOU", t2.ACCENT, 0).Position = UDim2.new(1, -56, 0, 16)
					end
				end
			end
		end

		v260()

		local v483 = v264
		local s12 = "Wishlist Matcher"
		local t34 = {
			{
				text = u7 and "Match" or "Find Matches",
				width = u7 and 80 or 140,
				callback = v443
			},
			{
				text = "Copy",
				width = u7 and 60 or 70,
				color = Color3.fromRGB(60, 55, 100),
				shadowColor = Color3.fromRGB(40, 35, 70),
				callback = function()
					if not u442 or #u442 == 0 then
						return
					end

					local t37 = {
						"Wishlist Matches (" .. #u442 .. ")",
						string.rep("-", 40)
					}

					for _, v in ipairs(u442) do
						table.insert(t37, v.wants .. " wants [" .. v.pet .. "] <- " .. v.has .. (v.price > 0 and " (" .. v52(v.price) .. ")" or ""))
					end

					setclipboard(table.concat(t37, "\n"))
				end
			}
		}

		v483(s12, t34)
		v441 = v273()
		t9.list(v441, nil, 4)
		v275(v441, "Cross-references wishlists with showcased collections.")
	end,
	inventory = function()
		local v491
		local invPlayer = t16.invPlayer

		local function v493()
			if not invPlayer then
				return
			end

			if v491 then
				v282(v491)
			end

			task.wait()

			local v494 = v59()
			local v495 = v494 and v494[invPlayer]

			if not v495 then
				return
			end

			v22()

			if v491 then
				v279(v491)
			end

			local v496 = v90(v495)
			local v497 = v113(v495)
			local Frame7 = t9.new("Frame", {
				Size = UDim2.new(1, 0, 0, u7 and 134 or 84),
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Parent = v491
			})

			if u7 then
				t9.grid(Frame7, UDim2.new(0.48, 0, 0, 60), UDim2.fromOffset(4, 6))
			else
				t9.list(Frame7, Enum.FillDirection.Horizontal, 10)
			end

			local t38 = {
				{
					"Total Value",
					v52(v497),
					v56(v497)
				},
				{
					"Inventory",
					v496.stats.inventory
				},
				{
					"Pets",
					v496.stats.pets
				},
				{
					"Hours",
					v496.stats.hours_played
				}
			}

			for _, v in ipairs(t38) do
				if v[2] then
					t9.miniStat(Frame7, v[1], tostring(v[2]), v[3] or t2.TEXT)
				end
			end

			local v506 = v78(v495)

			if v506 then
				t9.text(v491, {
					text = "Equipped Pet",
					font = GothamBold,
					size = u7 and 15 or 18,
					color = t2.TEXT,
					height = 28,
					order = 2
				})

				local v507 = u7 and 64 or 84
				local Frame8 = t9.new("Frame", {
					Size = UDim2.new(1, 0, 0, u7 and 76 or 100),
					BackgroundColor3 = t2.CARD,
					LayoutOrder = 3,
					Parent = v491
				})

				t9.corner(Frame8, 10)
				t9.petImage(Frame8, v506.id, v507, v506.neon, v506.megaNeon, v506.flyable, v506.rideable).Position = UDim2.fromOffset(6, 6)

				local v509 = v45(v506.name, v138(v506))
				local v510 = v50(v506.id, v138(v506))
				local v511 = u7 and v507 + 14 or 102

				t9.text(Frame8, {
					text = v509,
					font = GothamBold,
					size = u7 and 14 or 18,
					color = t2.TEXT,
					sz = UDim2.new(1, -(v511 + 8), 0, 24),
					pos = UDim2.fromOffset(v511, 6),
					truncate = true
				})
				t9.text(Frame8, {
					text = "Age: " .. v506.ageName .. " | Tricks: " .. v506.trickLevel,
					font = Gotham,
					size = u7 and 12 or 14,
					color = t2.TEXT_SEC,
					sz = UDim2.new(1, -(v511 + 8), 0, 20),
					pos = UDim2.fromOffset(v511, u7 and 30 or 40)
				})

				if v510 > 0 then
					t9.text(Frame8, {
						text = v52(v510),
						font = GothamBold,
						size = u7 and 14 or 17,
						color = v56(v510),
						sz = UDim2.fromOffset(100, 24),
						pos = UDim2.fromOffset(v511, u7 and 50 or 64)
					})
				end
			end

			local v512 = v83(v495)

			if #v512 > 0 then
				local n23 = 0

				for _, v in ipairs(v512) do
					n23 += v50(v.kind, v138(v))
				end

				t9.text(v491, {
					text = "Active Pets (" .. #v512 .. ") - " .. v52(n23),
					font = GothamBold,
					size = u7 and 15 or 18,
					color = t2.TEXT,
					height = 28,
					order = 4
				})

				local v516 = u7 and 110 or 150
				local v517 = u7 and 120 or 148
				local v518 = u7 and 54 or 70
				local Frame8 = t9.new("Frame", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					LayoutOrder = 5,
					Parent = v491
				})

				t9.grid(Frame8, UDim2.fromOffset(v516, v517), UDim2.fromOffset(6, 6))

				for _, v in ipairs(v512) do
					local v522 = v50(v.kind, v138(v))
					local Frame9 = t9.new("Frame", {
						Size = UDim2.fromOffset(v516, v517),
						BackgroundColor3 = t2.CARD,
						Parent = Frame8
					})

					t9.corner(Frame9, 8)
					t9.petImage(Frame9, v.kind, v518, v.neon, v.megaNeon, v.flyable, v.rideable).Position = UDim2.fromOffset(math.floor((v516 - v518) / 2), 4)
					t9.text(Frame9, {
						text = v.name,
						font = Gotham,
						size = u7 and 11 or 13,
						color = t2.TEXT,
						sz = UDim2.new(1, -4, 0, 16),
						pos = UDim2.fromOffset(2, v518 + 6),
						alignX = Enum.TextXAlignment.Center,
						truncate = true
					})
					t9.text(Frame9, {
						text = v.ageName .. " | XP:" .. v.xp,
						font = Gotham,
						size = u7 and 9 or 11,
						color = t2.TEXT_MUTED,
						sz = UDim2.new(1, -4, 0, 14),
						pos = UDim2.fromOffset(2, v518 + 22),
						alignX = Enum.TextXAlignment.Center
					})

					if v522 > 0 then
						t9.text(Frame9, {
							text = v52(v522),
							font = GothamBold,
							size = u7 and 11 or 13,
							color = v56(v522),
							sz = UDim2.new(1, -4, 0, 14),
							pos = UDim2.fromOffset(2, v518 + 36),
							alignX = Enum.TextXAlignment.Center
						})
					end

					t9.statBar(Frame9, {
						value = v.age,
						max = 6,
						color = t2.ACCENT,
						width = v516 - 18
					}).Position = UDim2.fromOffset(9, v517 - 16)
				end
			end

			if #v496.collections > 0 then
				local n24 = 0
				local t43 = {}

				for _, collection in pairs(v496.collections) do
					local pairs_ = pairs
					local items = collection.items or {}

					for _, item in pairs_(items) do
						if type(item) == "table" and item.kind then
							local v532 = v50(item.kind, item.properties)

							n24 += v532
							table.insert(t43, {
								kind = item.kind,
								props = item.properties,
								price = v532
							})
						end
					end
				end

				table.sort(t43, function(p103, p104)
					return p103.price > p104.price
				end)
				t9.text(v491, {
					text = "Showcase (" .. #t43 .. ") - " .. v52(n24),
					font = GothamBold,
					size = u7 and 15 or 18,
					color = t2.TEXT,
					height = 28,
					order = 6
				})

				local v533 = u7 and 86 or 110
				local v534 = u7 and 100 or 120
				local v535 = u7 and 54

				v535 = v535 or 70

				local Frame8 = t9.new("Frame", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					LayoutOrder = 7,
					Parent = v491
				})

				t9.grid(Frame8, UDim2.fromOffset(v533, v534), UDim2.fromOffset(u7 and 4 or 8, u7 and 4 or 8))

				for _, v in pairs(t43) do
					local Frame9 = t9.new("Frame", {
						Size = UDim2.fromOffset(v533, v534),
						BackgroundColor3 = t2.CARD,
						Parent = Frame8
					})

					t9.corner(Frame9, 8)
					t9.petImage(Frame9, v.kind, v535, v.props and v.props.neon, v.props and v.props.mega_neon, v.props and v.props.flyable, v.props and v.props.rideable).Position = UDim2.fromOffset(math.floor((v533 - v535) / 2), 3)

					if v.price > 0 then
						t9.text(Frame9, {
							text = v52(v.price),
							font = GothamBold,
							size = u7 and 10 or 12,
							color = v56(v.price),
							sz = UDim2.new(1, 0, 0, 16),
							pos = UDim2.fromOffset(0, v535 + 4),
							alignX = Enum.TextXAlignment.Center
						})
					end

					t9.text(Frame9, {
						text = v42(v.kind),
						font = Gotham,
						size = u7 and 9 or 11,
						color = t2.TEXT_MUTED,
						sz = UDim2.new(1, 0, 0, 14),
						pos = UDim2.fromOffset(0, v535 + 20),
						alignX = Enum.TextXAlignment.Center,
						truncate = true
					})
				end
			end

			if #v496.trades > 0 then
				t9.text(v491, {
					text = "Trade History (" .. #v496.trades .. ")",
					font = GothamBold,
					size = u7 and 15 or 18,
					color = t2.TEXT,
					height = 28,
					order = 10
				})

				for i, trade in ipairs(v496.trades) do
					local v542, v543, v544 = v129(trade)
					local v545 = v544 >= 0 and "+" or ""
					local SUCCESS = v544 >= 0 and t2.SUCCESS or t2.DANGER
					local votes = trade.votes or {}
					local v548 = u7 and 60 or 50
					local Frame8 = t9.new("Frame", {
						Size = UDim2.new(1, 0, 0, v548),
						BackgroundColor3 = t2.CARD,
						LayoutOrder = 10 + i,
						Parent = v491
					})

					t9.corner(Frame8, 6)

					if u7 then
						t9.text(Frame8, {
							text = "w/ " .. (trade.sender_name or trade.recipient_name or "?"),
							font = GothamBold,
							size = 12,
							color = t2.TEXT,
							sz = UDim2.new(0.5, -4, 0, 28),
							pos = UDim2.fromOffset(8, 2),
							truncate = true
						})
						t9.text(Frame8, {
							text = v545 .. v52(math.abs(v544)),
							font = GothamBold,
							size = 12,
							color = SUCCESS,
							sz = UDim2.new(0.25, 0, 0, 28),
							pos = UDim2.new(0.5, 0, 0, 2),
							alignX = Enum.TextXAlignment.Center
						})
						t9.text(Frame8, {
							text = string.format("%dW/%dF/%dL", votes.W or 0, votes.F or 0, votes.L or 0),
							font = Gotham,
							size = 10,
							color = t2.TEXT_MUTED,
							sz = UDim2.new(0.25, -8, 0, 28),
							pos = UDim2.new(0.75, 0, 0, 2),
							alignX = Enum.TextXAlignment.Right
						})
						t9.text(Frame8, {
							text = v52(v542) .. " -> " .. v52(v543),
							font = Gotham,
							size = 11,
							color = t2.TEXT_SEC,
							sz = UDim2.new(1, -16, 0, 22),
							pos = UDim2.fromOffset(8, 30)
						})
					else
						t9.text(Frame8, {
							text = "w/ " .. (trade.sender_name or trade.recipient_name or "?"),
							font = GothamBold,
							size = 14,
							color = t2.TEXT,
							sz = UDim2.fromOffset(170, v548),
							pos = UDim2.fromOffset(10, 0),
							truncate = true
						})
						t9.text(Frame8, {
							text = "Sent " .. v52(v542) .. " -> Got " .. v52(v543),
							font = Gotham,
							size = 14,
							color = t2.TEXT_SEC,
							sz = UDim2.fromOffset(300, v548),
							pos = UDim2.fromOffset(185, 0)
						})
						t9.text(Frame8, {
							text = v545 .. v52(math.abs(v544)),
							font = GothamBold,
							size = 14,
							color = SUCCESS,
							sz = UDim2.fromOffset(95, v548),
							pos = UDim2.fromOffset(490, 0)
						})
						t9.text(Frame8, {
							text = string.format("%dW/%dF/%dL", votes.W or 0, votes.F or 0, votes.L or 0),
							font = Gotham,
							size = 13,
							color = t2.TEXT_MUTED,
							sz = UDim2.fromOffset(100, v548),
							pos = UDim2.fromOffset(590, 0)
						})
					end
				end
			end
		end

		v260()

		local v550 = v264
		local s13 = "Inventory"
		local t44 = {
			{
				text = "Analyze",
				width = u7 and 75 or 95,
				callback = v493
			},
			{
				text = "Copy",
				width = u7 and 55 or 70,
				color = Color3.fromRGB(60, 55, 100),
				shadowColor = Color3.fromRGB(40, 35, 70),
				callback = function()
					if not invPlayer then
						return
					end

					local v555 = v59()
					local v556 = v555 and v555[invPlayer]

					if not v556 then
						return
					end

					local t47 = {
						invPlayer .. " - Inventory",
						string.rep("-", 40)
					}
					local v558 = v78(v556)

					if v558 then
						table.insert(t47, "Equipped: " .. v45(v558.name, v138(v558)) .. " " .. v52(v50(v558.id, v138(v558))))
					end

					for _, v in ipairs(v83(v556)) do
						table.insert(t47, "Active: " .. v.name .. " " .. v52(v50(v.kind, v138(v))))
					end

					table.insert(t47, "Total: " .. v52(v113(v556)))
					setclipboard(table.concat(t47, "\n"))
				end
			}
		}
		local v561, _, v563 = t9.dropdown(v550(s13, t44), {
			options = v75(v59()),
			selected = invPlayer or "(select player)",
			width = u7 and 150 or 220,
			onChange = function(p105)
				invPlayer = p105
				t16.invPlayer = p105
			end
		})
		local v564 = u7 and 100 or 220
		local v565 = u7 and 8

		v561.Position = UDim2.fromOffset(v564, v565 or 12)
		v491 = v273()
		t9.list(v491, nil, 8)

		if t16.invAutoRun and invPlayer then
			t16.invAutoRun = false

			if v563 then
				v563(invPlayer)
			end

			task.defer(v493)
		else
			v275(v491, "Select a player and click 'Analyze'.")
		end
	end,
	online = function()
		local v566

		local function v567()
			if v566 then
				v282(v566)
			end

			task.wait()

			local v568 = v59()

			if not v568 or not next(v568) then
				return
			end

			v22()

			if v566 then
				v279(v566)
			end

			local t48 = {}
			local n25 = 1

			for k, v in pairs(v568) do
				local v573 = v108(v)
				local v574 = v78(v)

				table.insert(t48, {
					name = k,
					totalTime = v573.totalTime,
					reconnects = v573.reconnects,
					lastLogin = v573.lastLogin,
					pet = v574,
					petVal = v574 and v50(v574.id, v138(v574)) or 0
				})

				if n25 < v573.totalTime then
					n25 = v573.totalTime
				end
			end

			table.sort(t48, function(p106, p107)
				return p106.totalTime > p107.totalTime
			end)

			for i, v in ipairs(t48) do
				local CARD = i % 2 == 0 and t2.CARD or t2.CONTENT
				local TextButton5 = t9.new("TextButton", {
					Size = UDim2.new(1, 0, 0, u7 and 72 or 64),
					BackgroundColor3 = CARD,
					Text = "",
					AutoButtonColor = false,
					LayoutOrder = i,
					Parent = v566
				})

				t9.corner(TextButton5, 7)
				TextButton5.MouseButton1Click:Connect(function()
					v246(v.name)
				end)
				TextButton5.MouseEnter:Connect(function()
					TweenService:Create(TextButton5, tweenInfo, {
						BackgroundColor3 = t2.SIDEBAR_HOVER
					}):Play()
				end)
				TextButton5.MouseLeave:Connect(function()
					TweenService:Create(TextButton5, tweenInfo, {
						BackgroundColor3 = CARD
					}):Play()
				end)

				if u7 then
					if v.pet then
						t9.petImage(TextButton5, v.pet.id, 38, v.pet.neon, v.pet.megaNeon, v.pet.flyable, v.pet.rideable).Position = UDim2.fromOffset(6, 4)
					end

					local v579 = v.pet and 48 or 8

					t9.text(TextButton5, {
						text = v.name,
						font = GothamBold,
						size = 13,
						color = t2.TEXT,
						sz = UDim2.new(0.5, -v579, 0, 22),
						pos = UDim2.fromOffset(v579, 2),
						truncate = true
					})
					t9.text(TextButton5, {
						text = v68(v.totalTime),
						font = GothamBold,
						size = 13,
						color = t2.TEXT_SEC,
						sz = UDim2.new(0.25, 0, 0, 22),
						pos = UDim2.new(0.5, 0, 0, 2)
					})
					t9.text(TextButton5, {
						text = v.reconnects .. "r | " .. v73(v.lastLogin),
						font = Gotham,
						size = 10,
						color = t2.TEXT_MUTED,
						sz = UDim2.new(0.25, -6, 0, 22),
						pos = UDim2.new(0.75, 0, 0, 2),
						alignX = Enum.TextXAlignment.Right
					})
					t9.statBar(TextButton5, {
						value = v.totalTime,
						max = n25,
						color = t2.ACCENT,
						width = u7 and 280 or math.floor(v139 - 50)
					}).Position = UDim2.fromOffset(8, 28)

					if v.petVal > 0 then
						t9.text(TextButton5, {
							text = v52(v.petVal),
							font = Gotham,
							size = 11,
							color = v56(v.petVal),
							sz = UDim2.fromOffset(70, 16),
							pos = UDim2.fromOffset(v579, 50)
						})
					end
				else
					if v.pet then
						t9.petImage(TextButton5, v.pet.id, 52, v.pet.neon, v.pet.megaNeon, v.pet.flyable, v.pet.rideable).Position = UDim2.fromOffset(8, 6)
					end

					local v580 = v.pet and 66 or 12

					t9.text(TextButton5, {
						text = v.name,
						font = GothamBold,
						size = 16,
						color = t2.TEXT,
						sz = UDim2.fromOffset(170, 28),
						pos = UDim2.fromOffset(v580, 4),
						truncate = true
					})

					if v.petVal > 0 then
						t9.text(TextButton5, {
							text = v52(v.petVal),
							font = Gotham,
							size = 13,
							color = v56(v.petVal),
							sz = UDim2.fromOffset(80, 18),
							pos = UDim2.fromOffset(v580, 34)
						})
					end

					t9.statBar(TextButton5, {
						value = v.totalTime,
						max = n25,
						color = t2.ACCENT,
						width = 240
					}).Position = UDim2.fromOffset(250, 26)
					t9.text(TextButton5, {
						text = v68(v.totalTime),
						font = GothamBold,
						size = 14,
						color = t2.TEXT_SEC,
						sz = UDim2.fromOffset(100, 24),
						pos = UDim2.fromOffset(250, 2)
					})
					t9.text(TextButton5, {
						text = v.reconnects .. " recon",
						font = Gotham,
						size = 13,
						color = t2.TEXT_MUTED,
						sz = UDim2.fromOffset(90, 28),
						pos = UDim2.fromOffset(510, 4)
					})
					t9.text(TextButton5, {
						text = "Last: " .. v73(v.lastLogin),
						font = Gotham,
						size = 13,
						color = t2.TEXT_MUTED,
						sz = UDim2.fromOffset(120, 28),
						pos = UDim2.fromOffset(510, 32)
					})
				end
			end
		end

		v260()
		v264("Online Activity", { {
			text = "Refresh",
			width = u7 and 75 or 90,
			callback = v567
		} })
		v566 = v273()
		t9.list(v566, nil, 4)
		v275(v566)
	end,
	farm = function()
		local v581

		local function v582()
			if v581 then
				v282(v581)
			end

			task.wait()

			local v583 = v59()

			if not v583 or not next(v583) then
				return
			end

			v22()

			if v581 then
				v279(v581)
			end

			t9.text(v581, {
				text = "Players actively aging pets in idle mode",
				font = Gotham,
				size = 13,
				color = t2.TEXT_MUTED,
				height = 22,
				order = 0,
				alignX = Enum.TextXAlignment.Center
			})

			local n26 = 1
			local v585 = false

			for k, v in pairs(v583) do
				local v588 = v83(v)

				if #v588 ~= 0 then
					v585 = true

					local t49 = {}
					local t50 = {}
					local n27 = 0

					for _, v2 in pairs(v588) do
						t49[v2.kind] = (t49[v2.kind] or 0) + 1

						if v2.neon then
							t50[v2.kind] = (t50[v2.kind] or 0) + 1
						end

						n27 += v50(v2.kind, v138(v2))
					end

					local Frame7 = t9.new("Frame", {
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundColor3 = t2.CARD,
						LayoutOrder = n26,
						Parent = v581
					})

					t9.corner(Frame7, 8)
					n26 += 1
					t9.text(Frame7, {
						text = k .. "  (" .. #v588 .. " pets)  -  " .. v52(n27),
						font = GothamBold,
						size = u7 and 13 or 16,
						color = t2.TEXT,
						sz = UDim2.new(1, -10, 0, 32),
						pos = UDim2.fromOffset(8, 2)
					})

					for k2, v2 in pairs(t49) do
						if v2 >= 4 then
							local v597 = (t50[k2] or 0) >= 4
							local n28 = 0

							for _, v3 in ipairs(v588) do
								if v3.kind == k2 and v3.age >= 6 then
									n28 += 1
								end
							end

							local v601 = v597 and "MAKING MEGA" or "MAKING NEON"
							local MEGA_PINK = v597 and t2.MEGA_PINK or t2.NEON_PURPLE
							local v603 = t3[(v597 and "Mega Neon " or "Neon ") .. v42(k2)] or 0
							local v604 = not v597 and string.format(" (%d/4)", n28) or ""
							local Frame8 = t9.new("Frame", {
								Size = UDim2.new(1, -12, 0, 22),
								Position = UDim2.fromOffset(6, 28),
								BackgroundColor3 = MEGA_PINK,
								BackgroundTransparency = 0.7,
								Parent = Frame7
							})

							t9.corner(Frame8, 4)
							t9.text(Frame8, {
								text = "  " .. v601 .. " " .. v42(k2) .. v604 .. (v603 > 0 and " -> " .. v52(v603) or ""),
								font = GothamBold,
								size = u7 and 10 or 12,
								color = t2.TEXT,
								sz = UDim2.fromScale(1, 1)
							})
						end
					end

					local v606 = u7 and 96 or 120
					local v607 = u7 and 110 or 135
					local v608 = u7 and 48 or 62
					local Frame8 = t9.new("Frame", {
						Size = UDim2.new(1, -10, 0, 0),
						Position = UDim2.fromOffset(5, 46),
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundTransparency = 1,
						Parent = Frame7
					})

					t9.grid(Frame8, UDim2.fromOffset(v606, v607), UDim2.fromOffset(u7 and 4 or 8, u7 and 4 or 8))

					for _, v2 in ipairs(v588) do
						local v612 = v50(v2.kind, v138(v2))
						local Frame9 = t9.new("Frame", {
							Size = UDim2.fromOffset(v606, v607),
							BackgroundColor3 = t2.CONTENT,
							Parent = Frame8
						})

						t9.corner(Frame9, 8)
						t9.petImage(Frame9, v2.kind, v608, v2.neon, v2.megaNeon, v2.flyable, v2.rideable).Position = UDim2.fromOffset(math.floor((v606 - v608) / 2), 3)
						t9.text(Frame9, {
							text = v2.name,
							font = Gotham,
							size = u7 and 10 or 12,
							color = t2.TEXT,
							sz = UDim2.new(1, -4, 0, 14),
							pos = UDim2.fromOffset(2, v608 + 5),
							alignX = Enum.TextXAlignment.Center,
							truncate = true
						})
						t9.text(Frame9, {
							text = v2.ageName .. (v2.maxAge and " MAX" or ""),
							font = Gotham,
							size = u7 and 9 or 11,
							color = t2.TEXT_MUTED,
							sz = UDim2.new(1, -4, 0, 14),
							pos = UDim2.fromOffset(2, v608 + 19),
							alignX = Enum.TextXAlignment.Center
						})

						if v612 > 0 then
							t9.text(Frame9, {
								text = v52(v612),
								font = GothamBold,
								size = u7 and 10 or 12,
								color = v56(v612),
								sz = UDim2.new(1, -4, 0, 14),
								pos = UDim2.fromOffset(2, v608 + 33),
								alignX = Enum.TextXAlignment.Center
							})
						end

						t9.statBar(Frame9, {
							value = v2.age,
							max = 6,
							color = t2.ACCENT,
							width = v606 - 16
						}).Position = UDim2.fromOffset(8, v607 - 16)
					end
				end
			end

			if not v585 then
				v275(v581, "No players have active idle pets.")
			end
		end

		v260()

		local v614 = v264

		v614("Idle Farm Tracker", { {
			text = u7 and "Scan" or "Scan Farms",
			width = u7 and 70 or 130,
			callback = v582
		} })
		v581 = v273()
		t9.list(v581, nil, 8)
		v275(v581)
	end,
	vip = function()
		local v615

		local function v616()
			if v615 then
				v282(v615)
			end

			task.wait()

			local v617 = v59()

			if not v617 or not next(v617) then
				return
			end

			v22()

			if v615 then
				v279(v615)
			end

			local t51 = {}
			local t52 = {}
			local n29 = 0
			local n30 = 0

			for k, v in pairs(v617) do
				local v624 = v62(v, "char_wrapper_raw") or {}
				local v625 = false
				local v626 = v62(v, "player_tags")

				if type(v626) == "table" then
					for _, v2 in pairs(v626) do
						if v2 == "vip" then
							v625 = true
						end
					end
				end

				local v629 = v113(v)
				local v632 = v78(v)

				if v624.display_vip or v625 then
					n29 += v629
					table.insert(t51, {
						name = k,
						hasTag = v625,
						displayRank = v624.display_rank or false,
						sessions = v62(v, "sessions_played") or 0,
						totalVal = v629,
						pet = v632
					})
				else
					n30 += v629
					table.insert(t52, k)
				end
			end

			table.sort(t51, function(p108, p109)
				return p108.totalVal > p109.totalVal
			end)

			local v633 = #t51 > 0 and n29 / #t51

			v633 = v633 or 0

			local v634 = #t52 > 0 and n30 / #t52 or 0
			local Frame7 = t9.new("Frame", {
				Size = UDim2.new(1, 0, 0, u7 and 36 or 42),
				BackgroundColor3 = t2.SIDEBAR_ACT,
				LayoutOrder = 0,
				Parent = v615
			})

			t9.corner(Frame7, 7)
			t9.text(Frame7, {
				text = string.format("  %d/%d VIP  |  VIP: %s  |  Non: %s", #t51, #t51 + #t52, v52(v633), v52(v634)),
				font = GothamBold,
				size = u7 and 11 or 15,
				color = t2.ACCENT_LIGHT,
				sz = UDim2.fromScale(1, 1)
			})

			local v636 = u7 and 50 or 58
			local v637 = u7 and 54 or 64
			local Frame8 = t9.new("Frame", {
				Size = UDim2.new(1, 0, 0, 38 + #t51 * v637),
				BackgroundColor3 = t2.CARD,
				LayoutOrder = 1,
				Parent = v615
			})

			t9.corner(Frame8, 10)
			t9.stroke(Frame8, t2.ACCENT, 1)
			t9.text(Frame8, {
				text = "  VIP Players (" .. #t51 .. ")",
				font = GothamBold,
				size = u7 and 14 or 16,
				color = t2.ACCENT_LIGHT,
				sz = UDim2.new(1, 0, 0, 36),
				pos = UDim2.fromOffset(0, 0)
			})

			for i, v in ipairs(t51) do
				local TextButton5 = t9.new("TextButton", {
					Size = UDim2.new(1, -10, 0, v636),
					Position = UDim2.fromOffset(5, 36 + (i - 1) * v637),
					BackgroundColor3 = t2.CONTENT,
					Text = "",
					AutoButtonColor = false,
					Parent = Frame8
				})

				t9.corner(TextButton5, 7)
				TextButton5.MouseButton1Click:Connect(function()
					v246(v.name)
				end)
				TextButton5.MouseEnter:Connect(function()
					TweenService:Create(TextButton5, tweenInfo, {
						BackgroundColor3 = t2.SIDEBAR_HOVER
					}):Play()
				end)
				TextButton5.MouseLeave:Connect(function()
					TweenService:Create(TextButton5, tweenInfo, {
						BackgroundColor3 = t2.CONTENT
					}):Play()
				end)

				local v642 = u7 and 40 or 50

				if v.pet then
					t9.petImage(TextButton5, v.pet.id, v642, v.pet.neon, v.pet.megaNeon, v.pet.flyable, v.pet.rideable).Position = UDim2.fromOffset(4, math.floor((v636 - v642) / 2))
				end

				local v643 = v.pet and v642 + 8 or 8

				t9.text(TextButton5, {
					text = v.name,
					font = GothamBold,
					size = u7 and 13 or 16,
					color = t2.TEXT,
					sz = UDim2.new(0.5, -v643, 0, 24),
					pos = UDim2.fromOffset(v643, 2),
					truncate = true
				})
				t9.text(TextButton5, {
					text = v52(v.totalVal) .. " | " .. v.sessions .. "s",
					font = Gotham,
					size = u7 and 11 or 13,
					color = t2.TEXT_SEC,
					sz = UDim2.new(0.5, -v643, 0, 20),
					pos = UDim2.fromOffset(v643, u7 and 24 or 30)
				})

				if u7 then
					t9.badge(TextButton5, "VIP", t2.ACCENT).Position = UDim2.new(0.5, 4, 0, 4)
				else
					local v644 = v643 + 200

					t9.badge(TextButton5, "VIP", t2.ACCENT).Position = UDim2.fromOffset(v644, 4)

					local v645 = v644 + 52

					if v.hasTag then
						t9.badge(TextButton5, "TAG", t2.WARNING).Position = UDim2.fromOffset(v645, 4)
						v645 += 50
					end

					if v.displayRank then
						t9.badge(TextButton5, "RANK", Color3.fromRGB(41, 171, 226)).Position = UDim2.fromOffset(v645, 4)
						v645 += 60
					end

					if v.pet then
						t9.modBadges(TextButton5, v.pet, v645, 4)
					end
				end
			end

			local v646 = u7 and 2 or 3
			local v647 = u7 and 140 or 240
			local Frame9 = t9.new("Frame", {
				Size = UDim2.new(1, 0, 0, 38 + math.ceil(#t52 / v646) * 28),
				BackgroundColor3 = t2.CARD,
				LayoutOrder = 2,
				Parent = v615
			})

			t9.corner(Frame9, 10)
			t9.text(Frame9, {
				text = "  Non-VIP (" .. #t52 .. ")",
				font = GothamBold,
				size = u7 and 13 or 15,
				color = t2.TEXT_MUTED,
				sz = UDim2.new(1, 0, 0, 34)
			})

			for i, v in ipairs(t52) do
				local v651 = (i - 1) % v646
				local v652 = math.floor((i - 1) / v646)

				t9.text(Frame9, {
					text = v,
					font = Gotham,
					size = u7 and 12 or 14,
					color = t2.TEXT_SEC,
					sz = UDim2.fromOffset(v647, 26),
					pos = UDim2.fromOffset(8 + v651 * (v647 + 6), 36 + v652 * 28),
					truncate = true
				})
			end
		end

		v260()

		local v653 = v264
		local s14 = "VIP Detection"
		local t53 = {
			{
				text = "Detect",
				width = u7 and 75 or 90,
				callback = v616
			}
		}

		v653(s14, t53)
		v615 = v273()
		t9.list(v615, nil, 8)
		v275(v615)
	end,
	location = function()
		local v656
		local u657 = false

		local function v658()
			local v659 = v59(true)

			if not v659 or not next(v659) then
				return
			end

			v22()

			if v656 then
				v279(v656)
			end

			local t54 = {}

			for k, v in pairs(v659) do
				local v663 = v62(v, "char_wrapper_raw", "location", "destination_id") or "Unknown"

				if not t54[v663] then
					t54[v663] = {
						players = {},
						totalVal = 0
					}
				end

				local v664 = v78(v)
				local v665 = v113(v)

				t54[v663].totalVal += v665
				table.insert(t54[v663].players, {
					name = k,
					pet = v664,
					totalVal = v665
				})
			end

			local t55 = {}

			for k, v in pairs(t54) do
				table.insert(t55, {
					loc = k,
					players = v.players,
					totalVal = v.totalVal
				})
			end

			table.sort(t55, function(p110, p111)
				return #p110.players > #p111.players
			end)

			local v669 = u7 and 34 or 38

			for i, v in ipairs(t55) do
				local Frame7 = t9.new("Frame", {
					Size = UDim2.new(1, 0, 0, 38 + #v.players * (v669 + 2)),
					BackgroundColor3 = t2.CARD,
					LayoutOrder = i,
					Parent = v656
				})

				t9.corner(Frame7, 10)
				t9.text(Frame7, {
					text = "  " .. v.loc .. " (" .. #v.players .. ") - " .. v52(v.totalVal),
					font = GothamBold,
					size = u7 and 13 or 16,
					color = t2.ACCENT_LIGHT,
					sz = UDim2.new(1, -12, 0, 36)
				})

				for i2, player in ipairs(v.players) do
					local TextButton5 = t9.new("TextButton", {
						Size = UDim2.new(1, -12, 0, v669),
						Position = UDim2.fromOffset(6, 36 + (i2 - 1) * (v669 + 2)),
						BackgroundColor3 = t2.CONTENT,
						BackgroundTransparency = 0.5,
						Text = "",
						AutoButtonColor = false,
						Parent = Frame7
					})

					t9.corner(TextButton5, 5)
					TextButton5.MouseButton1Click:Connect(function()
						v246(player.name)
					end)
					TextButton5.MouseEnter:Connect(function()
						TweenService:Create(TextButton5, tweenInfo, {
							BackgroundTransparency = 0,
							BackgroundColor3 = t2.SIDEBAR_HOVER
						}):Play()
					end)
					TextButton5.MouseLeave:Connect(function()
						TweenService:Create(TextButton5, tweenInfo, {
							BackgroundTransparency = 0.5,
							BackgroundColor3 = t2.CONTENT
						}):Play()
					end)

					local v676 = u7 and 28 or 32

					if player.pet then
						t9.petImage(TextButton5, player.pet.id, v676, player.pet.neon, player.pet.megaNeon, player.pet.flyable, player.pet.rideable).Position = UDim2.fromOffset(3, math.floor((v669 - v676) / 2))
					end

					local v677 = player.pet and v676 + 6 or 6

					t9.text(TextButton5, {
						text = player.name,
						font = Gotham,
						size = u7 and 13 or 15,
						color = t2.TEXT_SEC,
						sz = UDim2.new(0.6, -v677, 0, v669),
						pos = UDim2.fromOffset(v677, 0),
						truncate = true
					})

					if player.totalVal > 0 then
						t9.text(TextButton5, {
							text = v52(player.totalVal),
							font = Gotham,
							size = u7 and 11 or 13,
							color = v56(player.totalVal),
							sz = UDim2.new(0.3, 0, 0, v669),
							pos = UDim2.new(0.7, 0, 0, 0),
							alignX = Enum.TextXAlignment.Right
						})
					end
				end
			end
		end

		v260()
		t9.toggle(v264("Location", { {
			text = "Refresh",
			width = u7 and 75 or 90,
			callback = v658
		} }), {
			label = u7 and "Auto" or "Auto (10s)",
			default = false,
			labelWidth = u7 and 50 or 80,
			onChange = function(p112)
				u657 = p112

				if p112 then
					task.spawn(function()
						while u657 do
							if s9 ~= "location" then
								break
							end

							v658()
							task.wait(10)
						end
					end)
				end
			end
		}).Position = UDim2.fromOffset(u7 and 100 or 220, u7 and 12 or 16)
		v656 = v273()
		t9.list(v656, nil, 8)
		v275(v656)
	end,
	about = function()
		local v678
		local aboutShowAll = t16.aboutShowAll or false

		local function v680()
			if v678 then
				v282(v678)
			end

			task.wait()

			local v681 = v59()

			if not v681 or not next(v681) then
				return
			end

			v22()

			if v678 then
				v279(v678)
			end

			local n31 = 1

			for k, v in pairs(v681) do
				local rp_name = (v62(v, "char_wrapper_raw") or {}).rp_name or ""
				local aboutMe = v90(v).aboutMe
				local v687 = v78(v)
				local v688 = v687 and v50(v687.id, v138(v687)) or 0

				if aboutShowAll or rp_name ~= "" or aboutMe then
					local Frame7 = t9.new("Frame", {
						Size = UDim2.new(1, 0, 0, 44 + (rp_name ~= "" and 26 or 0) + (aboutMe and 44 or 0)),
						BackgroundColor3 = t2.CARD,
						LayoutOrder = n31,
						Parent = v678
					})

					t9.corner(Frame7, 10)
					n31 += 1

					local v690 = u7 and 32 or 38

					if v687 then
						t9.petImage(Frame7, v687.id, v690, v687.neon, v687.megaNeon, v687.flyable, v687.rideable).Position = UDim2.fromOffset(6, 3)
					end

					local v691 = v687 and v690 + 10 or 8

					t9.text(Frame7, {
						text = k,
						font = GothamBold,
						size = u7 and 14 or 16,
						color = t2.TEXT,
						sz = UDim2.new(0.6, -v691, 0, 30),
						pos = UDim2.fromOffset(v691, 4),
						truncate = true
					})

					if v688 > 0 then
						local text = t9.text
						local v693 = Frame7
						local t56 = {
							text = v52(v688),
							font = GothamBold,
							size = u7 and 12 or 13,
							color = v56(v688)
						}

						t56.sz = UDim2.new(0.3, 0, 0, 30)
						t56.pos = UDim2.new(0.7, 0, 0, 4)
						t56.alignX = Enum.TextXAlignment.Right
						text(v693, t56)
					end

					local n32 = 38

					if rp_name ~= "" then
						t9.text(Frame7, {
							text = "RP: \"" .. rp_name .. "\"",
							font = Gotham,
							size = u7 and 12 or 14,
							color = t2.ACCENT_LIGHT,
							sz = UDim2.new(1, -14, 0, 20),
							pos = UDim2.fromOffset(8, n32)
						})
						n32 += 24
					end

					if aboutMe then
						local body = aboutMe.body ~= "" and aboutMe.body or aboutMe.title

						if body ~= "" then
							t9.text(Frame7, {
								text = body,
								font = Gotham,
								size = u7 and 12 or 14,
								color = t2.TEXT_SEC,
								sz = UDim2.new(1, -14, 0, 38),
								pos = UDim2.fromOffset(8, n32),
								wrap = true
							})
						end
					end
				end
			end
		end

		v260()

		local v697 = t9.toggle(v264(u7 and "About / RP" or "About Me / RP Names", { {
			text = u7 and "Load" or "Load Bios",
			width = u7 and 65 or 110,
			callback = v680
		} }), {
			label = u7 and "All" or "Show All",
			default = aboutShowAll,
			labelWidth = u7 and 40 or 70,
			onChange = function(p113)
				aboutShowAll = p113
				t16.aboutShowAll = p113
			end
		})
		local v698 = u7 and 120 or 250
		local v699 = u7 and 12

		v697.Position = UDim2.fromOffset(v698, v699 or 16)
		v678 = v273()
		t9.list(v678, nil, 6)
		v275(v678)
	end
}

renderContent = function(p114)
	local v700 = t20[p114]

	if v700 then
		CanvasGroup.GroupTransparency = 1
		v700()
		TweenService:Create(CanvasGroup, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			GroupTransparency = 0
		}):Play()
	end
end
task.spawn(v22)
Frame3.BackgroundTransparency = 1
Frame2.BackgroundTransparency = 1

if u7 then
	Frame.Size = UDim2.new(0.96, 0, 0.72, 0)
else
	Frame.Size = UDim2.fromOffset(v139, v140)
end

TweenService:Create(Frame3, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
	BackgroundTransparency = 0
}):Play()
TweenService:Create(Frame2, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
	BackgroundTransparency = 0.5
}):Play()
v242("scanner")
