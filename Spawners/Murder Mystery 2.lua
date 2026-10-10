-- discord.gg/syncrypt

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/noowtf31-ui/Arcylic/refs/heads/main/src.lua.txt"))()
local u2

local function v3(p1)
	if type(p1) == "string" then
		return p1
	end

	return p1.Text or p1.Title or p1.Name or "Control"
end
local function v4(p2)
	if type(p2) == "string" then
		return p2
	end

	return p2.Content or p2.Desc or p2.Description or ""
end
local function v5(p3)
	local v6 = tostring(p3.Name or p3.Title or p3.Id or "Item")
	local Id = p3.Id

	if Id == nil or tostring(Id) == v6 then
		return v6
	end

	return string.format("%s [%s]", v6, tostring(Id))
end
local function v8(p4)
	return {
		SetContent = function(p5, p6)
			p4:SetContent(tostring(p6))
		end,
		SetDesc = function(p7, p8)
			p4:SetContent(tostring(p8))
		end,
		Set = function(p9, p10, p11)
			if p11 == nil then
				p4:SetContent(tostring(p10))
			else
				p4:SetTitle(tostring(p10))
				p4:SetContent(tostring(p11))
			end
		end
	}
end
local function v9(p12)
	local t1 = {
		AddParagraph = function(p13, p14)
			local v11 = v8

			return v11(p12:CreateParagraph({
				Title = p14.Title or v3(p14),
				Content = v4(p14)
			}))
		end
	}

	t1.Paragraph = t1.AddParagraph
	t1.AddBanner = function(p15, p16)
		return p15:AddParagraph({
			Title = p16.Type or "Notice",
			Content = p16.Text or v4(p16)
		})
	end
	t1.AddLabel = function(p17, p18)
		return v8(p12:CreateParagraph({
			Title = "Info",
			Content = tostring(p18)
		}))
	end
	t1.AddButton = function(p19, p20)
		return p12:CreateButton({
			Name = v3(p20),
			Callback = p20.Callback or function()
			end
		})
	end
	t1.Button = t1.AddButton

	local function addToggle(p21, p22)
		local v13 = p12
		local CreateToggle = p12.CreateToggle

		return CreateToggle(v13, {
			Name = v3(p22),
			Default = p22.Default == true,
			Flag = p22.Flag,
			Callback = p22.Callback or function()
			end
		})
	end

	t1.AddToggle = addToggle
	t1.Toggle = t1.AddToggle
	t1.AddSlider = function(p23, p24)
		local Value = p24.Value
		local Min = p24.Min or type(Value) == "table" and Value.Min or 0
		local Max = p24.Max or type(Value) == "table" and Value.Max or 100
		local Default = p24.Default or type(Value) == "table" and Value.Default or Min

		return p12:CreateSlider({
			Name = v3(p24),
			Min = Min,
			Max = Max,
			Default = Default,
			Flag = p24.Flag,
			Callback = p24.Callback or function()
			end
		})
	end
	t1.Slider = t1.AddSlider
	t1.AddDropdown = function(p25, p26)
		local Options = p26.Options or p26.Values

		Options = Options or {}

		local Default = p26.Default

		if Default == nil then
			Default = p26.Value
		end

		if Default == nil then
			Default = Options[1]
		end

		return p12:CreateDropdown({
			Name = v3(p26),
			Options = Options,
			Default = Default,
			MultiSelect = p26.MultiSelect == true or p26.Multi == true,
			Flag = p26.Flag,
			Callback = p26.Callback or function()
			end
		})
	end
	t1.Dropdown = t1.AddDropdown
	t1.AddMultiDropdown = function(p27, p28)
		local Options = p28.Options or p28.Values or {}
		local t2 = {}
		local Default = p28.Default or {}

		for _, v in ipairs(Default) do
			t2[v] = true
		end

		local function v26()
			local t3 = {}

			for _, Option in ipairs(Options) do
				if t2[Option] then
					table.insert(t3, Option)
				end
			end

			return t3
		end

		local v30 = p12:CreateDropdown({
			Name = v3(p28),
			Options = Options,
			Default = p28.Default or {},
			MultiSelect = true,
			Flag = p28.Flag,
			Callback = p28.Callback or function()
			end
		})

		return {
			Set = function(p29, p30)
				table.clear(t2)

				local v31 = p30 or {}

				for _, v in ipairs(v31) do
					t2[v] = true
				end

				v30:SetValue(v26())
			end,
			GetValue = v26
		}
	end

	local function addInput(p31, p32)
		return p12:CreateTextBox({
			Name = v3(p32),
			Default = tostring(p32.Default or p32.Value or ""),
			Placeholder = p32.Placeholder or p32.PlaceholderText or "Type here...",
			ClearOnFocus = p32.ClearOnFocus == true or p32.TextDisappear == true,
			NumbersOnly = p32.NumbersOnly == true,
			Flag = p32.Flag,
			Callback = p32.Callback or function()
			end
		})
	end

	t1.AddInput = addInput
	t1.Input = t1.AddInput
	t1.AddTextbox = t1.AddInput
	t1.AddColorPicker = function(p33, p34)
		local v35 = p12
		local CreateColorPicker = p12.CreateColorPicker

		return CreateColorPicker(v35, {
			Name = v3(p34),
			Default = p34.Default or Color3.new(1, 1, 1),
			Flag = p34.Flag,
			Callback = p34.Callback or function()
			end
		})
	end
	t1.Colorpicker = t1.AddColorPicker
	t1.Section = function(p35, p36)
		p12:CreateSection(v3(p36))
	end
	t1.Divider = function()
		p12:CreateSection(" ")
	end

	return t1
end
local function v37(p37, p38, p39)
	local Items = p39.Items or {}
	local t4 = {}
	local t5 = {}
	local t6 = {}
	local v42

	p38:CreateSection("Searchable catalog")

	local function v43(p40)
		local v44 = string.lower(tostring(p40 or ""))

		table.clear(t4)
		table.clear(t5)

		local t7 = {}

		for _, Item in ipairs(Items) do
			local v48 = string.lower(tostring(Item._SearchText or v5(Item)))

			if v44 == "" or string.find(v48, v44, 1, true) then
				local v49 = v5(Item)

				table.insert(t4, Item)
				table.insert(t7, v49)
				t5[v49] = Item
			end
		end

		if #t7 == 0 then
			t7 = { "No matches" }
		end

		if v42 then
			v42:Refresh(t7)
		end

		return t7
	end

	p38:CreateTextBox({
		Name = "Search houses",
		Default = "",
		Placeholder = "Name, id or type...",
		ClearOnFocus = false,
		Callback = function(p41)
			v43(p41)
		end
	})

	local v50 = v43("")

	v42 = p38:CreateDropdown({
		Name = "Select house",
		Options = v50,
		Default = v50[1],
		Callback = function(p42)
			local v51 = t5[p42]

			if not v51 then
				return
			end

			local v52 = tostring(v51.Id)

			if p39.MultiSelect then
				t6[v52] = not t6[v52]
			else
				table.clear(t6)
				t6[v52] = true
			end

			local t8 = {}

			for _, Item in ipairs(Items) do
				local v56 = tostring(Item.Id)

				if t6[v56] then
					table.insert(t8, v56)
				end
			end

			if p39.OnSelectionChanged then
				p39.OnSelectionChanged(t8)
			end

			if p39.OnCardActivate then
				p39.OnCardActivate(v51)
			end
		end
	})

	local function v57()
		local t9 = {}

		for _, Item in ipairs(Items) do
			local v61 = tostring(Item.Id)

			if t6[v61] then
				table.insert(t9, v61)
			end
		end

		return t9
	end
	local function v62()
		if p39.OnSelectionChanged then
			p39.OnSelectionChanged(v57())
		end
	end

	return {
		SetItems = function(p43, p44)
			Items = p44 or {}
			table.clear(t6)
			v43("")
			v62()
		end,
		GetSelected = function()
			return v57()
		end,
		SelectAll = function()
			table.clear(t6)

			for _, Item in ipairs(Items) do
				t6[tostring(Item.Id)] = true
			end

			v62()
		end,
		Clear = function()
			table.clear(t6)
			v62()
		end
	}
end
local function v65(p45, p46)
	local v66 = v9(p45)

	v66.CreateSection = function(p47, p48)
		p45:CreateSection(v3(p48))

		return v9(p45)
	end

	local s1 = "AddItemGrid"

	local function v68(p49, p50)
		return v37(p49, p45, p50)
	end

	v66[s1] = v68
	v66.SetActionBar = function(p51, p52)
		p45:CreateSection("Quick actions")

		local Left = p52.Left or {}

		for _, v in ipairs(Left) do
			p51:AddButton(v)
		end

		if p52.Primary then
			p51:AddButton(p52.Primary)
		end

		if p52.Status then
			local v72 = p51:AddParagraph({
				Title = "Selection",
				Content = "Loading..."
			})

			local function v73()
				local ok, result = pcall(p52.Status)

				v72:SetContent(ok and tostring(result) or "Status unavailable")
			end

			p46._statusUpdaters = p46._statusUpdaters or {}
			table.insert(p46._statusUpdaters, v73)
			p46._UpdateStatus = function()
				for _, statusUpdater in ipairs(p46._statusUpdaters) do
					statusUpdater()
				end
			end
			task.defer(p46._UpdateStatus)
		end
	end

	return v66
end

local t10 = {
	CreateWindow = function(p53, p54)
		local Title = p54.Title or p54.Name

		Title = Title or "Project Reverse"
		u2 = lib.new(Title, "ProjectReverse_" .. string.gsub(Title, "[^%w]+", "_"))

		if p54.ToggleKeybind then
			u2:SetToggleKey(p54.ToggleKeybind)
		end

		if p54.OnClose then
			local Destroy = u2.Destroy
			local u81 = false

			u2.Destroy = function(p55, ...)
				if not u81 then
					u81 = true
					pcall(p54.OnClose)
				end

				return Destroy(p55, ...)
			end
		end

		local t11 = {
			_native = u2,
			_statusUpdaters = {}
		}
		local Main = u2:CreateSection("Main")

		t11.CreateTab = function(p56, p57)
			return v65(Main:CreateTab(v3(p57)), p56)
		end

		local function tab(p58, p59)
			return p58:CreateTab(p59)
		end

		t11.Tab = tab
		t11.Section = function(p60, p61)
			local v85 = u2:CreateSection(v3(p61))

			return {
				Tab = function(p62, p63)
					return v65(v85:CreateTab(v3(p63)), t11)
				end
			}
		end
		t11.EditOpenButton = function()
		end
		t11.Tag = function()
		end
		t11.Destroy = function()
			u2:Destroy()
		end

		return t11
	end,
	Notify = function(p64, p65)
		local Title = p65.Title or p65.Name

		Title = Title or "Notification"

		local v87 = v4(p65)

		if u2 then
			u2:Notify({
				Title = Title,
				Description = v87,
				Duration = p65.Duration or p65.Time or 3,
				Icon = p65.Icon or p65.Image
			})
		else
			warn(string.format("[%s] %s", Title, v87))
		end
	end,
	SetTheme = function()
	end,
	SetDensity = function()
	end,
	Gradient = function(p66, p67)
		return p67
	end
}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game:GetService("Players").LocalPlayer
local CancelRequest = ReplicatedStorage.Trade.CancelRequest
local StartTrade = ReplicatedStorage.Trade.StartTrade
local UpdateTrade = ReplicatedStorage.Trade.UpdateTrade
local DeclineTrade = ReplicatedStorage.Trade.DeclineTrade
local AcceptTrade = ReplicatedStorage.Trade.AcceptTrade
local OfferItem = ReplicatedStorage.Trade.OfferItem
local RemoveOffer = ReplicatedStorage.Trade.RemoveOffer
local ChangeInventoryItem = ReplicatedStorage.Remotes.Inventory.ChangeInventoryItem
local ProfileData = require(ReplicatedStorage.Modules.ProfileData)
local Item = require(ReplicatedStorage.Database.Sync.Item)
local ItemModule = require(ReplicatedStorage.Modules.ItemModule)
local Sync = require(ReplicatedStorage:WaitForChild("Database"):WaitForChild("Sync"))
local Lighting = game:GetService("Lighting")
local NewItem = LocalPlayer.PlayerGui.MainGUI.Game.NewItem

if not NewItem then
	pcall(function()
		NewItem = LocalPlayer.PlayerGui.MainGUI.NewItem
	end)
end

local t12 = {}
local n1 = 1
local n2 = 1
local LFrame

Lighting.NewItemBlur.Enabled = false

local function v108()
	local v109 = t12[1]

	if not v109 then
		return
	end

	local v110 = Sync[v109.Type][v109.ItemName]

	ItemModule.DisplayItem(NewItem.Container.NewItem, v110, v109.Amount or nil)

	local Color = Sync.Rarities[v110.Rarity].Color

	NewItem.Container.Starburst.ImageColor3 = Color3.fromRGB(Color.r, Color.g, Color.b) or Color3.new(1, 1, 1)
	NewItem.Container.Title.Text = v109.TitleText

	if v109.LFrame then
		LFrame = v109.LFrame
		LFrame.Visible = false
	end

	Lighting.NewItemBlur.Enabled = true
	NewItem.Visible = true
end
local function v112(p68, p69)
	table.insert(t12, {
		ItemName = p68,
		TitleText = "You Got...",
		LFrame = nil,
		Type = "Weapons",
		Amount = tonumber(p69)
	})

	if NewItem.Visible then
		n2 += 1
	else
		n1 = 1
		n2 = #t12
		v108()
	end

	if n2 > 1 then
		NewItem.Container.Claim.Text = "Claim (" .. n1 .. "/" .. n2 .. ")"
	else
		NewItem.Container.Claim.Text = "Claim"
	end
end

if getgenv().VisualClaimConnection then
	getgenv().VisualClaimConnection:Disconnect()
end

getgenv().VisualClaimConnection = NewItem.Container.Claim.MouseButton1Click:Connect(function()
	local Inventory = LocalPlayer.PlayerGui.MainGUI.Game.Dock.Inventory
	local Icon = NewItem.Container.NewItem.Container.Icon

	if Inventory and Icon then
		pcall(function()
			ItemModule.AnimateItemIconIntoInventory(Icon, Inventory, LocalPlayer.PlayerGui.MainGUI.Game)
		end)
	end

	NewItem.Visible = false
	table.remove(t12, 1)
	Lighting.NewItemBlur.Enabled = false

	if t12[1] == nil then
		n2 = 1
		n1 = 1

		if LFrame then
			LFrame.Visible = true
		end
	else
		n1 += 1

		if n2 > 1 then
			NewItem.Container.Claim.Text = "Claim (" .. n1 .. "/" .. n2 .. ")"
		else
			NewItem.Container.Claim.Text = "Claim"
		end

		v108()
	end
end)

local t13 = {}

for k, v in pairs(ProfileData.Weapons.Owned) do
	t13[k] = v
end

local u118 = false

local function v119(p70)
	return t13[p70] or 0
end
local function v120(p71, p72)
	u118 = true

	local v121 = v119(p71) + p72

	t13[p71] = v121
	ProfileData.Weapons.Owned[p71] = v121
	firesignal(ChangeInventoryItem.OnClientEvent, "Weapons", p71, v121)
	v112(p71, p72)
	u118 = false
end
local function v122(p73)
	firesignal(AcceptTrade.OnClientEvent, true, p73)

	for _, v in ipairs(p73) do
		v120(v[1], v[2])
	end
end
local function v125(p74)
	for _, v in ipairs(p74) do
		local v128 = v[1]
		local v129 = v[2]
		local v130 = v119(v128)

		u118 = true

		if v130 <= v129 then
			t13[v128] = 0
			ProfileData.Weapons.Owned[v128] = nil
			firesignal(ChangeInventoryItem.OnClientEvent, "Weapons", v128)
		else
			t13[v128] = v130 - v129
			ProfileData.Weapons.Owned[v128] = v130 - v129
			firesignal(ChangeInventoryItem.OnClientEvent, "Weapons", v128, v130 - v129)
		end

		u118 = false
	end
end

local t14 = {}

for k, v in pairs(ProfileData.Weapons.Owned) do
	t14[k] = v
end

ChangeInventoryItem.OnClientEvent:Connect(function(p75, p76, p77)
	if u118 then
		return
	end

	if p75 ~= "Weapons" then
		return
	end

	local v134 = t14[p76] or 0

	t14[p76] = p77 or 0

	local v135 = (p77 or 0) - v134

	if v135 ~= 0 then
		local v136 = t13[p76] or 0

		t13[p76] = v136 + v135
		ProfileData.Weapons.Owned[p76] = v136 + v135
	end

	local v137 = t13[p76] or 0

	if (p77 or 0) < v137 then
		u118 = true
		firesignal(ChangeInventoryItem.OnClientEvent, "Weapons", p76, v137)
		u118 = false
	end
end)

local t15 = {}
local u139
local u140 = false

local function v141(p78)
	if not p78 then
		return nil
	end

	if p78.Player1 and p78.Player1.Player == LocalPlayer then
		return "Player1"
	end

	if p78.Player2 and p78.Player2.Player == LocalPlayer then
		return "Player2"
	end

	return nil
end
local function v142()
	if not u139 then
		return
	end

	local v143 = v141(u139)

	if not v143 then
		return
	end

	local t16 = {
		Locked = u139.Locked,
		LastOffer = u139.LastOffer,
		Player1 = {
			Player = u139.Player1.Player,
			Accepted = u139.Player1.Accepted,
			Offer = {}
		},
		Player2 = {
			Player = u139.Player2.Player,
			Accepted = u139.Player2.Accepted,
			Offer = {}
		}
	}

	for _, v in ipairs(u139.Player1.Offer) do
		table.insert(t16.Player1.Offer, {
			v[1],
			v[2],
			v[3]
		})
	end

	for _, v in ipairs(u139.Player2.Offer) do
		table.insert(t16.Player2.Offer, {
			v[1],
			v[2],
			v[3]
		})
	end

	for _, v in ipairs(t15) do
		local v151 = false

		for _, v2 in ipairs(t16[v143].Offer) do
			if v2[1] == v[1] then
				v2[2] += v[2]
				v151 = true

				break
			end
		end

		if not v151 then
			table.insert(t16[v143].Offer, {
				v[1],
				v[2],
				v[3]
			})
		end
	end

	u140 = true
	firesignal(UpdateTrade.OnClientEvent, t16)
	u140 = false
end

UpdateTrade.OnClientEvent:Connect(function(p79)
	if u140 then
		return
	end

	u139 = p79

	if #t15 > 0 then
		task.defer(v142)
	end
end)
StartTrade.OnClientEvent:Connect(function(p80)
	t15 = {}
	u139 = p80
end)

local function v154()
	t15 = {}
	u139 = nil
end

DeclineTrade.OnClientEvent:Connect(v154)
CancelRequest.OnClientEvent:Connect(v154)

local v155 = getrawmetatable(game)
local __namecall = v155.__namecall

setreadonly(v155, false)
v155.__namecall = newcclosure(function(p81, ...)
	local t17 = { ... }

	if getnamecallmethod() == "FireServer" then
		if p81 == OfferItem then
			local v158 = t17[1]
			local v159 = t14[v158] or 0
			local v160 = v141(u139)

			if v160 then
				local n3 = 0

				for _, v in ipairs(u139[v160].Offer) do
					if v[1] == v158 then
						n3 = v[2]
					end
				end

				if v159 <= n3 then
					local v164 = false

					for _, v in ipairs(t15) do
						if v[1] == v158 then
							v[2] += 1
							v164 = true

							break
						end
					end

					if not v164 then
						table.insert(t15, {
							v158,
							1,
							"Weapons"
						})
					end

					task.defer(v142)

					return
				end
			end
		elseif p81 == RemoveOffer then
			local v167 = t17[1]
			local v168 = false

			for i, v in ipairs(t15) do
				if v[1] == v167 then
					if v[2] > 1 then
						v[2] -= 1
					else
						table.remove(t15, i)
					end

					v168 = true

					break
				end
			end

			if v168 then
				task.defer(v142)

				return
			end
		end
	end

	return __namecall(p81, ...)
end)
gettable = function(p82)
	local t18 = {}

	for k in pairs(Item) do
		if string.find(k:lower(), p82:lower()) then
			table.insert(t18, k)
		end
	end

	return t18
end
getrawnamebyrealname = function(p83)
	for k in pairs(Item) do
		if p83 == k then
			return k
		end
	end
end

local v174 = t10
local v175 = v174:CreateWindow({
	Title = "Visual Trade [MM2]",
	Icon = "swords",
	Author = "Spawner + Fake Trade",
	Transparent = true,
	Size = UDim2.fromOffset(480, 400),
	Theme = "Dark",
	SideBarWidth = 160,
	HideSearchBar = true
})

v175:EditOpenButton({
	Title = "Visual Trade",
	Icon = "swords",
	CornerRadius = UDim.new(0, 14),
	StrokeThickness = 2,
	Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
	OnlyMobile = false,
	Enabled = true,
	Draggable = true
})

local v176 = v175:Tab({
	Title = "Spawner",
	Icon = "package-plus"
})

v176:Section({
	Title = "⚔️ Weapon Spawner"
})

local s2 = ""
local n4 = 1
local v179 = v176:Dropdown({
	Title = "Select Item",
	Values = { "type to filter..." },
	Value = "type to filter...",
	Callback = function(p84)
		s2 = getrawnamebyrealname(p84)
	end
})

v176:Input({
	Title = "Search Database",
	Value = "",
	Callback = function(p85)
		if p85 ~= "" then
			local v180 = gettable(p85)

			task.wait(0.1)
			v179:Refresh(v180)
		end
	end
})
v176:Slider({
	Title = "Amount",
	Step = 1,
	Value = {
		Min = 1,
		Max = 250,
		Default = 1
	},
	Callback = function(p86)
		n4 = p86
	end
})
v176:Button({
	Title = "Spawn Item",
	Callback = function()
		if s2 and s2 ~= "" then
			v120(s2, n4)
			v174:Notify({
				Title = "Spawned",
				Content = n4 .. "x " .. s2,
				Duration = 3
			})
		end
	end
})
