-- discord.gg/syncrypt

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
local v2 = lib:CreateWindow({
	Title = "[Adopt Me] - House Changer",
	Icon = "home",
	Transparent = true,
	Author = "<3 <3 <3",
	Size = UDim2.fromOffset(580, 460),
	MinSize = Vector2.new(429, 280),
	MaxSize = Vector2.new(1000, 800),
	Theme = "Dark",
	SideBarWidth = 200
})

v2:EditOpenButton({
	Title = "House Changer",
	Icon = "home",
	CornerRadius = UDim.new(0, 32),
	StrokeThickness = 2,
	Color = ColorSequence.new(Color3.fromHex("6C5CE7"), Color3.fromHex("A29BFE")),
	OnlyMobile = false,
	Enabled = true,
	Draggable = true
})

local v3 = v2:Section({
	Title = "House Changer",
	Icon = "home",
	Opened = true
})
local v4 = v2:Section({
	Title = "Status",
	Icon = "info",
	Opened = false
})
local v5 = v3:Tab({
	Title = "Change House",
	Locked = false
})
local v6 = v4:Tab({
	Title = "Info",
	Locked = false
})
local LocalPlayer = game:GetService("Players").LocalPlayer
local load = require(game.ReplicatedStorage:WaitForChild("Fsys")).load

set_thread_identity(2)

local ClientStore = load("ClientStore")
local HouseDB = load("HouseDB")
local InteriorsM = load("InteriorsM")
local DownloadClient = load("DownloadClient")
local ClientData = load("ClientData")

set_thread_identity(8)

local store = ClientStore.store
local building_type
local u16
local u17 = false
local u18 = false
local dispatch
local thread
local textures = {}
local texturesHash = 0
local t1

local function v24()
	local t2 = {}

	for k, v in pairs(HouseDB) do
		if type(v) == "table" and v.name and v.model_name then
			table.insert(t2, {
				id = k,
				name = v.name,
				model_name = v.model_name,
				order = v.order or 9999,
				cost = v.cost,
				gamepass = v.gamepass
			})
		end
	end

	table.sort(t2, function(p1, p2)
		return p1.order < p2.order
	end)

	return t2
end

local v28 = v24()
local t3 = {}
local t4 = {}
local t5 = {}

for _, v in ipairs(v28) do
	local name = v.name

	if v.gamepass then
		name ..= " [GP]"
	end

	if v.cost then
		name ..= " ($" .. tostring(v.cost) .. ")"
	end

	if t5[name] then
		name ..= " (" .. v.id .. ")"
	end

	t5[name] = true
	table.insert(t3, name)
	t4[name] = v.id
end

local t6 = {
	Color3 = true,
	CFrame = true,
	Vector3 = true,
	Vector2 = true,
	UDim2 = true,
	UDim = true,
	BrickColor = true,
	Instance = true,
	EnumItem = true,
	Enum = true,
	NumberRange = true,
	Rect = true
}

local function v36(p3)
	if type(p3) ~= "table" then
		return p3
	end

	if typeof and t6[typeof(p3)] then
		return p3
	end

	local t7 = {}

	for k, v in pairs(p3) do
		t7[k] = v36(v)
	end

	return t7
end
local function v40(p4)
	if not p4 then
		return nil, nil
	end

	for k, v in pairs(p4) do
		if v.player_name == LocalPlayer.Name then
			return k, v
		end
	end

	return nil, nil
end
local function v43(p5)
	set_thread_identity(2)

	local ok, result = pcall(function()
		return DownloadClient.promise_download_copy("Interiors", p5):expect()
	end)

	set_thread_identity(8)

	if not ok or not result then
		return {}
	end

	local t8 = {}

	for _, v in ipairs({
		"Walls",
		"Floors"
	}) do
		local v49 = result:FindFirstChild(v)

		if v49 then
			for _, descendant in ipairs(v49:GetDescendants()) do
				if descendant:IsA("Texture") then
					t8[descendant.Name] = true
				end
			end
		end
	end

	result:Destroy()

	local t9 = {}

	for k in pairs(t8) do
		t9[k] = {
			walls = "white",
			floors = "woodenplanks"
		}
	end

	return t9
end
local function v54()
	if dispatch then
		return
	end

	local v55 = getmetatable(store)

	dispatch = v55.dispatch
	v55.dispatch = function(p6, p7)
		if u18 then
			return dispatch(p6, p7)
		end

		if u17 and u16 then
			if p7.type == "map_server_data_to_client_store" then
				if p7.key == "house_exteriors" and p7.value then
					for _, v in pairs(p7.value) do
						if type(v) == "table" and v.player_name == LocalPlayer.Name then
							v.building_type = u16
						end
					end
				end

				if p7.key == "house_interior" and p7.value and type(p7.value) == "table" then
					if p7.value.building_type and p7.value.house_pos then
						p7.value.building_type = u16
					end

					if p7.value.textures ~= nil then
						p7.value.textures = textures
						p7.value.textures_hash = texturesHash
					end
				end

				if p7.key == "house_manager" and p7.value then
					local name = HouseDB[u16] and HouseDB[u16].name or u16
					local v59 = false

					if type(p7.value) == "table" then
						for _, v in pairs(p7.value) do
							if type(v) == "table" and v.building_type then
								if v.building_type ~= u16 then
									v59 = true
								end

								v.building_type = u16
								v.name = name
							end
						end
					end

					if v59 then
						task.defer(function()
							if u17 and u16 then
								set_thread_identity(2)
								ClientData.update("house_manager", p7.value)
								set_thread_identity(8)
							end
						end)
					end
				end
			end

			if p7.type == "set_texture_preview" then
				if p7.value and type(p7.value) == "table" and p7.value.room_id then
					t1 = {
						room_id = p7.value.room_id,
						texture_type = p7.value.texture_type,
						texture_id = p7.value.texture_id
					}
				elseif p7.hide_confirmation_menu and t1 then
					local v62 = t1

					textures[v62.room_id] = textures[v62.room_id] or {}
					textures[v62.room_id][v62.texture_type] = v62.texture_id
					texturesHash += 1
					t1 = nil
				elseif p7.value == "NONE" then
					t1 = nil
				end
			end
		end

		return dispatch(p6, p7)
	end
end
local function v63()
	if not dispatch then
		return
	end

	getmetatable(store).dispatch = dispatch
	dispatch = nil
end
local function v64()
	local HouseInteriors = workspace:FindFirstChild("HouseInteriors")

	if not HouseInteriors then
		return
	end

	local blueprint = HouseInteriors:FindFirstChild("blueprint")

	if not blueprint then
		return
	end

	local children = blueprint:GetChildren()

	if #children <= 1 then
		return
	end

	for i = 1, #children - 1 do
		children[i]:Destroy()
	end
end
local function v69()
	if thread then
		return
	end

	thread = task.spawn(function()
		while u17 do
			task.wait(3)

			if u17 then
				v64()
			end
		end

		thread = nil
	end)
end
local function v70()
	thread = nil
end
local function v71(p8)
	if not building_type then
		local v72 = store:getState()
		local _, v74 = v40(v72 and v72.house_exteriors)

		if v74 then
			building_type = v74.building_type
		end
	end

	u16 = p8
	u17 = true

	local v75 = HouseDB[p8]

	if v75 and v75.model_name then
		textures = v43(v75.model_name)
		texturesHash = tick()
	end

	v54()
	u18 = true

	local house_exteriors = store:getState().house_exteriors

	if house_exteriors then
		local t10 = {}

		for k, house_exterior in pairs(house_exteriors) do
			if house_exterior.player_name == LocalPlayer.Name then
				local v80 = v36(house_exterior)

				v80.building_type = p8
				t10[k] = v80
			else
				t10[k] = house_exterior
			end
		end

		store:dispatch({
			type = "map_server_data_to_client_store",
			key = "house_exteriors",
			value = t10
		})
	end

	local house_manager = store:getState().house_manager

	if house_manager then
		local name = HouseDB[p8] and HouseDB[p8].name or p8
		local v83 = v36(house_manager)

		for _, v in pairs(v83) do
			if type(v) == "table" and v.building_type then
				v.building_type = p8
				v.name = name
			end
		end

		store:dispatch({
			type = "map_server_data_to_client_store",
			key = "house_manager",
			value = v83
		})
		set_thread_identity(2)
		ClientData.update("house_manager", v83)
		set_thread_identity(8)
	end

	u18 = false
	v69()

	return true
end
local function v86()
	if not building_type then
		return
	end

	u17 = false
	u16 = nil
	textures = {}
	texturesHash = 0
	t1 = nil
	v63()
	v70()

	local house_exteriors = store:getState().house_exteriors

	if house_exteriors then
		local t11 = {}

		for k, house_exterior in pairs(house_exteriors) do
			if house_exterior.player_name == LocalPlayer.Name then
				local v91 = v36(house_exterior)

				v91.building_type = building_type
				t11[k] = v91
			else
				t11[k] = house_exterior
			end
		end

		store:dispatch({
			type = "map_server_data_to_client_store",
			key = "house_exteriors",
			value = t11
		})
	end

	local house_manager = store:getState().house_manager

	if house_manager then
		local name = HouseDB[building_type] and HouseDB[building_type].name or building_type
		local v94 = v36(house_manager)

		for _, v in pairs(v94) do
			if type(v) == "table" and v.building_type then
				v.building_type = building_type
				v.name = name
			end
		end

		store:dispatch({
			type = "map_server_data_to_client_store",
			key = "house_manager",
			value = v94
		})
		set_thread_identity(2)
		ClientData.update("house_manager", v94)
		set_thread_identity(8)
	end

	task.delay(3, v64)
end

local houseChangedTo

v5:Dropdown({
	Title = "Select House",
	Values = t3,
	Value = "",
	Multi = false,
	Callback = function(p9)
		houseChangedTo = p9
	end
})
v5:Button({
	Title = "Apply House Change",
	Callback = function()
		if not houseChangedTo then
			lib:Notify({
				Title = "House Changer",
				Content = "Please select a house first!",
				Duration = 3
			})

			return
		end

		local v98 = t4[houseChangedTo]

		if v98 then
			v71(v98)
			lib:Notify({
				Title = "House Changer",
				Content = "House changed to: " .. houseChangedTo,
				Duration = 5
			})

			return
		end

		lib:Notify({
			Title = "House Changer",
			Content = "Invalid house selection!",
			Duration = 3
		})
	end
})
v5:Button({
	Title = "Reset to Original House",
	Callback = function()
		v86()
		lib:Notify({
			Title = "House Changer",
			Content = "House restored to original!",
			Duration = 3
		})
	end
})
v5:Button({
	Title = "Enter My House",
	Callback = function()
		task.spawn(function()
			set_thread_identity(2)
			pcall(function()
				InteriorsM.enter("housing", "MainDoor", {
					house_owner = LocalPlayer
				})
			end)
			set_thread_identity(8)
		end)
	end
})
v5:Button({
	Title = "Exit House (to My Plot)",
	Callback = function()
		task.spawn(function()
			set_thread_identity(2)
			pcall(function()
				InteriorsM.enter("exit_housing", "MainDoor", {
					house_owner = LocalPlayer,
					destination_door_id = "MainDoor"
				})
			end)
			set_thread_identity(8)
		end)
	end
})
v5:Colorpicker({
	Title = "House Color",
	Default = Color3.fromRGB(255, 255, 255),
	Callback = function(p10)
		local house_exteriors = store:getState().house_exteriors

		if not house_exteriors then
			return
		end

		u18 = true

		local t12 = {}

		for k, house_exterior in pairs(house_exteriors) do
			if house_exterior.player_name == LocalPlayer.Name then
				local v103 = v36(house_exterior)

				v103.color = p10
				t12[k] = v103
			else
				t12[k] = house_exterior
			end
		end

		store:dispatch({
			type = "map_server_data_to_client_store",
			key = "house_exteriors",
			value = t12
		})
		u18 = false
	end
})
v6:Button({
	Title = "Show Current Status",
	Callback = function()
		local v104 = store:getState()
		local _, v106 = v40(v104.house_exteriors)
		local house_interior = v104.house_interior

		lib:Notify({
			Title = "Status",
			Content = "Active: " .. (u17 and "YES" or "NO") .. "\nOriginal: " .. tostring(building_type or "not saved") .. "\nFake: " .. tostring(u16 or "none") .. "\nStore ext: " .. tostring(v106 and v106.building_type or "nil") .. "\nStore int: " .. tostring(house_interior and house_interior.building_type or "nil") .. "\nHook: " .. (dispatch and "ON" or "OFF"),
			Duration = 8
		})
	end
})
v6:Button({
	Title = "List All Available Houses",
	Callback = function()
		local t13 = {}

		for _, v in ipairs(v28) do
			local v111 = v.name .. " [" .. v.id .. "]"

			if v.cost then
				v111 ..= " - $" .. tostring(v.cost)
			elseif v.gamepass then
				v111 ..= " - Gamepass"
			end

			table.insert(t13, v111)
		end

		local v112 = table.concat(t13, "\n")

		if setclipboard then
			setclipboard(v112)
			lib:Notify({
				Title = "Houses",
				Content = #v28 .. " houses. Copied to clipboard!",
				Duration = 5
			})
		else
			lib:Notify({
				Title = "Houses",
				Content = #v28 .. " houses.\n" .. v112,
				Duration = 10
			})
		end
	end
})
