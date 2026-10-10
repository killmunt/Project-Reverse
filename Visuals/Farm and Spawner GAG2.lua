-- discord.gg/syncrypt

task.spawn(function()
    loadstring(game:HttpGet("https://cdn.project-reverse.org/yandex_metrika.luau"))()
end)


if rawget(_G, "__GAG2_LOADED") then
	local value = rawget(_G, "__GAG2_LIBRARY")

	if value then
		pcall(function()
			value:Notify({
				Title = "GAG2",
				Content = "Already loaded.",
				Type = "Warning",
				Duration = 3
			})
		end)
	end

	return
end

local ok2, result = pcall(function()
	return loadstring(game:HttpGet("https://cdn.project-reverse.org/Library.luau"))()
end)

if not ok2 or not result then
	warn(("[GAG2 %s] Library load failed: %s"):format("1.0.0", tostring(result)))

	return
end

local v4 = result

_G.__GAG2_LIBRARY = v4

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local SharedModules = ReplicatedStorage:WaitForChild("SharedModules")
local SharedData = ReplicatedStorage:WaitForChild("SharedData")
local t1 = {
	LocalPlayer = LocalPlayer,
	Networking = require(SharedModules.Networking),
	SeedData = require(SharedModules.SeedData),
	SeedPackData = require(SharedModules.SeedPackData),
	GearShopData = require(SharedModules.GearShopData),
	CrateData = require(SharedModules.CrateData),
	EggData = require(SharedModules.EggData),
	WeatherData = require(SharedModules.WeatherData),
	TimeCycleData = require(SharedModules.TimeCycleData),
	SellValueData = require(SharedModules.SellValueData),
	MutationData = require(SharedModules.MutationData),
	PropData = require(SharedModules.PropData),
	SprinklerData = require(SharedModules.SprinklerData),
	PetData = require(SharedData.PetData),
	PetTypes = require(SharedData.PetTypes),
	PetSizes = require(SharedData.PetSizes),
	PetModules = require(SharedModules.PetModules),
	PlayerStateClient = require(ReplicatedStorage:WaitForChild("ClientModules"):WaitForChild("PlayerStateClient")),
	FruitProxyUtil = require(SharedModules.FruitProxyUtil),
	Assets = ReplicatedStorage:WaitForChild("Assets"),
	LOCAL_TOOL_ATTR = "PR_GAG2_Local",
	LOCAL_WILD_ATTR = "PR_GAG2_LocalWild",
	LOCAL_PET_ATTR = "PR_GAG2_LocalPet",
	SeedOptions = {},
	SeedPrices = {},
	SeedsByName = {}
}

for _, v in ipairs(t1.SeedData) do
	if type(v) == "table" and v.SeedName then
		t1.SeedsByName[v.SeedName] = v
		t1.SeedPrices[v.SeedName] = tonumber(v.PurchasePrice) or 0
		table.insert(t1.SeedOptions, v.SeedName)
	end
end

table.sort(t1.SeedOptions)
t1.RARITY_ORDER = {
	Common = 1,
	Uncommon = 2,
	Rare = 3,
	Epic = 4,
	Legendary = 5,
	Mythic = 6,
	Super = 7,
	Secret = 8
}
t1.formatShortNumber = function(p1)
	local v16 = tonumber(p1) or 0

	if v16 >= 1000000 then
		return string.format("%.1fm", v16 / 1000000)
	end

	if v16 >= 1000 then
		return string.format("%.1fk", v16 / 1000)
	end

	return tostring(math.floor(v16))
end
t1.getRarityOrder = function(p2)
	return t1.RARITY_ORDER[p2] or 0
end
t1.SORT_OPTIONS = {
	"Rarity",
	"Price",
	"Alpha",
	"Stock"
}
t1.getItemPrice = function(p3, p4, p5)
	if p5 and p5[p3] ~= nil then
		return tonumber(p5[p3]) or 0
	end

	if type(p4) == "table" then
		return tonumber(p4.Cost) or tonumber(p4.PurchasePrice) or tonumber(p4.BasePrice) or tonumber(p4.Price) or 0
	end

	return 0
end
t1.getItemRarity = function(p6)
	return type(p6) == "table" and p6.Rarity or "Common"
end
t1.compareSortRows = function(p7, p8, p9)
	local v17 = t1.getRarityOrder(p7.Rarity or p7._Rarity or "Common")
	local v18 = t1.getRarityOrder(p8.Rarity or p8._Rarity or "Common")
	local v19 = tonumber(p7.Price or p7._Price) or 0
	local v20 = tonumber(p8.Price or p8._Price) or 0
	local v21 = tonumber(p7.Stock or p7._Stock) or 0
	local v22 = tonumber(p8.Stock or p8._Stock) or 0
	local v23 = tostring(p7.Name or p7.Id or "")
	local v24 = tostring(p8.Name or p8.Id or "")

	if p9 == "Price" then
		if v19 == v20 then
			return v23 < v24
		end

		return v19 > v20
	end

	if p9 == "Alpha" then
		return v23 < v24
	end

	if p9 == "Stock" then
		if v21 == v22 then
			return v23 < v24
		end

		return v21 > v22
	end

	if v17 ~= v18 then
		return v17 > v18
	end

	if v19 == v20 then
		return v23 < v24
	end

	return v19 > v20
end
t1.sortRows = function(p10, p11)
	table.sort(p10, function(p12, p13)
		return t1.compareSortRows(p12, p13, p11)
	end)

	return p10
end
t1.sortNameList = function(p14, p15, p16, p17, p18)
	local t2 = {}

	for _, v in ipairs(p14) do
		local v28 = p16 and p16[v]
		local n1 = 0

		if p18 then
			n1 = t1.readStockAmount(p18:FindFirstChild(v))
		end

		table.insert(t2, {
			Name = v,
			Rarity = t1.getItemRarity(v28),
			Price = t1.getItemPrice(v, v28, p17),
			Stock = n1
		})
	end

	t1.sortRows(t2, p15)

	local t3 = {}

	for _, v in ipairs(t2) do
		table.insert(t3, v.Name)
	end

	return t3
end
t1.sortGridItems = function(p19, p20)
	t1.sortRows(p19, p20)

	return p19
end
t1.getSeedRarity = function(p21)
	local v33 = t1.SeedsByName[p21]

	return v33 and v33.Rarity or "Common"
end
t1.parseListString = function(p22)
	local t4 = {}
	local v35 = p22 or ""

	for match in string.gmatch(tostring(v35), "([^,;]+)") do
		local match2 = match:match("^%s*(.-)%s*$")

		if match2 ~= "" then
			table.insert(t4, match2)
		end
	end

	return t4
end

local function countInventorySeeds(p23, p24)
	local n2 = 0

	for _, v in ipairs(t1.getTools(function(p25)
		return p25:GetAttribute("SeedTool") == p23
	end)) do
		if not p24 or not t1.isLocalTool(v) then
			n2 += t1.getSeedToolQuantity(v)
		end
	end

	return n2
end

t1.countInventorySeeds = countInventorySeeds
t1.buildStockDropdown = function(p26, p27, p28, p29, p30)
	if p30 then
		table.clear(p30)
	end

	local v42 = t1.getShopStockRoot(p26)
	local t5 = {}

	for k, v in pairs(p27) do
		local n3 = 0

		if v42 then
			n3 = t1.readStockAmount(v42:FindFirstChild(k))
		end

		local v47 = p28[k]
		local Rarity = v47 and v47.Rarity or "Common"

		table.insert(t5, {
			Name = k,
			Label = ("[%s] %s — %s (%d)"):format(Rarity, k, t1.formatShortNumber(v), n3),
			Price = v,
			Stock = n3,
			Rarity = Rarity
		})
	end

	if p29 == "Price" then
		table.sort(t5, function(p31, p32)
			return t1.compareSortRows(p31, p32, "Price")
		end)
	elseif p29 == "Alpha" then
		table.sort(t5, function(p33, p34)
			return t1.compareSortRows(p33, p34, "Alpha")
		end)
	elseif p29 == "Stock" then
		table.sort(t5, function(p35, p36)
			return t1.compareSortRows(p35, p36, "Stock")
		end)
	else
		table.sort(t5, function(p37, p38)
			return t1.compareSortRows(p37, p38, "Rarity")
		end)
	end

	local t6 = {}

	for _, v in ipairs(t5) do
		table.insert(t6, v.Label)

		if p30 then
			p30[v.Label] = v.Name
		end
	end

	return t6
end
t1.labelToName = function(p39, p40, p41)
	if p39 and p39[p40] then
		return p39[p40]
	end

	return p41 or p40
end
t1.FruitOptions = {}

for k in pairs(t1.SellValueData) do
	table.insert(t1.FruitOptions, k)
end

table.sort(t1.FruitOptions)
t1.FruitPrices = {}

for _, fruitOption in ipairs(t1.FruitOptions) do
	t1.FruitPrices[fruitOption] = tonumber(t1.SellValueData[fruitOption]) or 0
end

t1.PetOptions = {}

for k, v in pairs(t1.PetData) do
	if type(v) == "table" and v.Rarity then
		table.insert(t1.PetOptions, k)
	end
end

table.sort(t1.PetOptions)

local function getPetSpec(p42)
	local v58 = t1.PetData[p42]

	if type(v58) == "table" then
		return v58
	end

	return nil
end

t1.getPetSpec = getPetSpec
t1.EggOptions = {}
t1.EggsByName = {}

local Data = t1.EggData.Data or {}

for _, v in ipairs(Data) do
	if type(v) == "table" and v.EggName then
		t1.EggsByName[v.EggName] = v
		table.insert(t1.EggOptions, v.EggName)
	end
end

table.sort(t1.EggOptions)
t1.PackOptions = {}
t1.PacksByName = {}

local Data2 = t1.SeedPackData.Data or {}

for _, v in ipairs(Data2) do
	if type(v) == "table" and v.PackName then
		t1.PacksByName[v.PackName] = v
		table.insert(t1.PackOptions, v.PackName)
	end
end

table.sort(t1.PackOptions)
t1.GearOptions = {}
t1.GearPrices = {}
t1.GearByName = {}

local Data3 = t1.GearShopData.Data or {}

for _, v in ipairs(Data3) do
	if type(v) == "table" and v.ItemName then
		t1.GearByName[v.ItemName] = v
		t1.GearPrices[v.ItemName] = tonumber(v.Cost) or 0
		table.insert(t1.GearOptions, v.ItemName)
	end
end

table.sort(t1.GearOptions)
t1.CrateOptions = {}
t1.CratePrices = {}
t1.CratesByName = {}

for _, v in ipairs(t1.CrateData.GetAllCrates()) do
	if type(v) == "table" and v.Name then
		t1.CratesByName[v.Name] = v
		t1.CratePrices[v.Name] = tonumber(v.Cost) or 0
		table.insert(t1.CrateOptions, v.Name)
	end
end

table.sort(t1.CrateOptions)
t1.PropOptions = {}
t1.PropsByName = {}

local Data4 = t1.PropData.Data or {}

for _, v in ipairs(Data4) do
	if type(v) == "table" and v.PropName then
		t1.PropsByName[v.PropName] = v
		table.insert(t1.PropOptions, v.PropName)
	end
end

table.sort(t1.PropOptions)
t1.WeatherOptions = {}

local Data5 = t1.WeatherData.Data or {}

for _, v in ipairs(Data5) do
	if type(v) == "table" and v.Name then
		table.insert(t1.WeatherOptions, v.Name)
	end
end

table.sort(t1.WeatherOptions)
t1.RarityOptions = {
	"Common",
	"Uncommon",
	"Rare",
	"Epic",
	"Legendary",
	"Mythic",
	"Super",
	"Secret"
}
t1.PlantPositionModes = {
	"Random",
	"Current",
	"Saved",
	"Grid"
}
t1.MutationOptions = { "None" }

for k in pairs({
	Gold = true,
	Rainbow = true,
	Electric = true,
	Frozen = true,
	Bloodlit = true,
	Chained = true,
	Starstruck = true
}) do
	table.insert(t1.MutationOptions, k)
end

t1.SprinklerOptions = {}

for _, v in ipairs(t1.SprinklerData) do
	if type(v) == "table" and v.SprinklerName then
		table.insert(t1.SprinklerOptions, v.SprinklerName)
	end
end

table.sort(t1.SprinklerOptions)
table.sort(t1.MutationOptions, function(p43, p44)
	if p43 == "None" then
		return true
	end

	if p44 == "None" then
		return false
	end

	return p43 < p44
end)
t1.PhaseOptions = {}
t1.PhaseWeathers = {}

local Data6 = t1.TimeCycleData.Data or {}

for k, v in pairs(Data6) do
	table.insert(t1.PhaseOptions, k)
	t1.PhaseWeathers[k] = {}

	if type(v.Weathers) == "table" then
		local t7 = {}

		for k2, weather in pairs(v.Weathers) do
			table.insert(t7, {
				Name = k2,
				Chance = tonumber(weather.Chance) or 0
			})
		end

		table.sort(t7, function(p45, p46)
			if p45.Chance == p46.Chance then
				return p45.Name < p46.Name
			end

			return p45.Chance > p46.Chance
		end)

		for _, v2 in ipairs(t7) do
			table.insert(t1.PhaseWeathers[k], v2.Name)
		end
	end
end

table.sort(t1.PhaseOptions, function(p47, p48)
	return (t1.TimeCycleData.Data[p47] and t1.TimeCycleData.Data[p47].StartOrder or 999) < (t1.TimeCycleData.Data[p48] and t1.TimeCycleData.Data[p48].StartOrder or 999)
end)
t1.getDefaultPhaseWeather = function(p49)
	local v87 = t1.PhaseWeathers[p49]

	if not v87 or #v87 == 0 then
		return ""
	end

	if p49 == "Night" then
		for _, v in ipairs(v87) do
			if v == "Moon" then
				return v
			end
		end
	end

	return v87[1]
end
t1.CutsceneOptions = {}

local Cutscenes = t1.Assets:FindFirstChild("Cutscenes")

if Cutscenes then
	for _, child in ipairs(Cutscenes:GetChildren()) do
		table.insert(t1.CutsceneOptions, child.Name)
	end

	table.sort(t1.CutsceneOptions)
end

t1.FenceThemeOptions = {}

local PlotAssets = t1.Assets:FindFirstChild("PlotAssets")
local FenceThemes = PlotAssets and PlotAssets:FindFirstChild("FenceThemes")

if FenceThemes then
	for _, child in ipairs(FenceThemes:GetChildren()) do
		table.insert(t1.FenceThemeOptions, child.Name)
	end

	table.sort(t1.FenceThemeOptions)
end

t1.WeatherEffectOptions = {
	"LightningStart",
	"LightningEnd",
	"RainStart",
	"RainEnd",
	"RainbowStart",
	"RainbowEnd",
	"BloodmoonStart",
	"BloodmoonEnd",
	"BlizzardStart",
	"BlizzardEnd",
	"NightStart",
	"NightEnd"
}
t1.pickDefault = function(p50, p51)
	if type(p50) == "table" and p50[1] then
		return p50[1]
	end

	return p51 or ""
end
t1.isPropName = function(p52)
	return t1.PropsByName[p52] ~= nil
end
t1.getPlotId = function()
	local v97 = tonumber(LocalPlayer:GetAttribute("PlotId"))

	if v97 then
		return v97
	end

	local v98 = t1.getPlayerPlot()

	if v98 then
		return tonumber(string.match(v98.Name, "%d+"))
	end
end
t1.notify = function(p53, p54, p55, p56, p57)
	pcall(function()
		p53:Notify({
			Title = p54,
			Content = p55 or "",
			Type = p56 or "Info",
			Duration = p57 or 3
		})
	end)
end
t1.getSheckles = function()
	local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
	local Sheckles = leaderstats and leaderstats:FindFirstChild("Sheckles")

	if Sheckles then
		return tonumber(Sheckles.Value) or 0
	end

	local localReplica = t1.PlayerStateClient:GetLocalReplica()

	if localReplica and localReplica.Data then
		return tonumber(localReplica.Data.Sheckles) or 0
	end

	return 0
end
t1.readStockAmount = function(p58)
	if not p58 then
		return 0
	end

	local ok, result2 = pcall(function()
		if p58:IsA("ValueBase") then
			return p58.Value
		end

		return nil
	end)

	if ok and result2 ~= nil then
		return tonumber(result2) or 0
	end

	for _, v in ipairs({
		"Stock",
		"Quantity",
		"Amount",
		"Count",
		"Value"
	}) do
		local attribute = p58:GetAttribute(v)

		if attribute ~= nil then
			return tonumber(attribute) or 0
		end
	end

	local Stock = p58:FindFirstChild("Stock") or p58:FindFirstChild("Quantity") or p58:FindFirstChild("Amount")

	if Stock and Stock:IsA("ValueBase") then
		return tonumber(Stock.Value) or 0
	end

	return 0
end
t1.getShopStockRoot = function(p59)
	local StockValues = ReplicatedStorage:FindFirstChild("StockValues")
	local v109 = StockValues and StockValues:FindFirstChild(p59)

	return v109 and v109:FindFirstChild("Items")
end
t1.getAffordableItem = function(p60, p61, p62, p63, p64)
	return t1.getAffordableItems(p60, p61, p62, p63, p64 or {})[1]
end
t1.getAffordableItems = function(p65, p66, p67, p68, p69)
	local v110 = p69 or {}

	if not p65 then
		return {}
	end

	local v111 = t1.getSheckles()
	local v112 = tonumber(v110.maxPrice) or 0
	local wishlist = v110.wishlist or {}
	local v114 = tonumber(v110.maintainCount) or 0
	local inventoryCounter = v110.inventoryCounter
	local t8 = {}

	for _, child in ipairs(p65:GetChildren()) do
		local v119 = t1.readStockAmount(child)

		if not (v119 <= 0) then
			local Name = child.Name
			local huge = p66[Name] or math.huge

			if not (v111 < huge) and (not (v112 > 0) or not (v112 < huge)) and (not (#wishlist > 0) or table.find(wishlist, Name)) then
				if v114 > 0 and inventoryCounter then
					if v114 <= (inventoryCounter(Name) or 0) then
						continue
					end
				end

				table.insert(t8, {
					Name = Name,
					Price = huge,
					Stock = v119
				})
			end
		end
	end

	if p67 == "Selected" and p68 then
		for _, v in ipairs(t8) do
			if v.Name == p68 then
				return { p68 }
			end
		end

		return {}
	end

	if p67 ~= "Wishlist" then
		if p67 ~= "All" and p67 ~= "Maintain" then
			if p67 == "Cheapest" then
				table.sort(t8, function(p70, p71)
					return p70.Price < p71.Price
				end)
			else
				table.sort(t8, function(p72, p73)
					return p72.Price > p73.Price
				end)
			end

			if #t8 > 0 then
				return { t8[1].Name }
			end

			return {}
		end

		local t9 = {}

		for _, v in ipairs(t8) do
			table.insert(t9, v.Name)
		end

		return t9
	end

	local t10 = {}

	for _, v in ipairs(wishlist) do
		for _, v2 in ipairs(t8) do
			if v2.Name == v then
				table.insert(t10, v2.Name)

				break
			end
		end
	end

	return t10
end
t1.getPlayerPlot = function()
	local attribute = LocalPlayer:GetAttribute("PlotId")

	if not attribute then
		return nil
	end

	local Gardens = Workspace:FindFirstChild("Gardens")

	return Gardens and Gardens:FindFirstChild("Plot" .. attribute)
end
t1.getContainers = function()
	local t11 = {}
	local Backpack = LocalPlayer:FindFirstChildOfClass("Backpack")

	if Backpack then
		table.insert(t11, Backpack)
	end

	if LocalPlayer.Character then
		table.insert(t11, LocalPlayer.Character)
	end

	return t11
end
t1.getTools = function(p74)
	local t12 = {}

	for _, v in ipairs(t1.getContainers()) do
		for _, child in ipairs(v:GetChildren()) do
			if child:IsA("Tool") and p74(child) then
				table.insert(t12, child)
			end
		end
	end

	return t12
end
t1.isLocalTool = function(p75)
	return p75 and p75:GetAttribute(t1.LOCAL_TOOL_ATTR) == true
end
t1.markLocalTool = function(p76)
	if p76 then
		p76:SetAttribute(t1.LOCAL_TOOL_ATTR, true)
	end
end
t1.getSeedToolQuantity = function(p77)
	if not p77 then
		return 0
	end

	local attribute = p77:GetAttribute("Count")

	if attribute ~= nil then
		return math.max(0, tonumber(attribute) or 0)
	end

	local attribute2 = p77:GetAttribute("Quantity")

	if attribute2 == nil then
		return 1
	end

	return math.max(0, tonumber(attribute2) or 0)
end
t1.setSeedToolQuantity = function(p78, p79)
	local n4 = 0
	local v144 = math.max(n4, tonumber(p79) or 0)

	p78:SetAttribute("Count", v144)

	local attribute = p78:GetAttribute("SeedTool") or "Seed"

	if not (v144 <= 0) then
		p78.Name = ("%s Seed [X%d]"):format(attribute, v144)

		return
	end

	p78:Destroy()
end
t1.getSeedImageId = function(p80)
	local v146 = t1.SeedsByName[p80]

	if v146 and v146.SeedImage then
		if v146.SeedImage:IsA("StringValue") then
			return v146.SeedImage.Value
		end
	end

	return ""
end
t1.getPetImageId = function(p81)
	local v147 = t1.getPetSpec(p81)

	return v147 and v147.Image or ""
end
t1.getPropImageId = function(p82)
	local v148 = t1.PropsByName[p82]

	return v148 and v148.IMG or ""
end
t1.triggerHandleControllers = function(p83)
	local Character = LocalPlayer.Character

	if p83 and Character then
		task.defer(function()
			if not p83 or not p83.Parent then
				return
			end

			local PlayerScripts = LocalPlayer:FindFirstChild("PlayerScripts")
			local Controllers = PlayerScripts and PlayerScripts:FindFirstChild("Controllers")

			if not Controllers then
				return
			end

			for _, child in ipairs(Controllers:GetChildren()) do
				if child:IsA("ModuleScript") and string.match(child.Name, "HandleController$") then
					pcall(function()
						local module = require(child)

						if module.IsTrackedTool and module:IsTrackedTool(p83) then
							module:SetupTool(p83, Character)
						end
					end)
				end
			end

			if p83:GetAttribute("Pet") and t1.isLocalTool(p83) then
				t1.bindLocalPetTool(p83)
			end
		end)

		return
	end
end
t1.getOwnedSeedTool = function(p84)
	local v155 = p84 == true
	local v156
	local v157
	local n5 = 0

	for _, v in ipairs(t1.getTools(function(p85)
		return p85:GetAttribute("SeedTool") ~= nil
	end)) do
		if not v155 or not t1.isLocalTool(v) then
			local attribute = v:GetAttribute("SeedTool")

			if type(attribute) == "string" and attribute ~= "" then
				local v162 = t1.getSeedToolQuantity(v)

				if v162 > 0 and n5 <= v162 then
					v156 = v
					v157 = attribute
					n5 = v162
				end
			end
		end
	end

	return v156, v157
end

local function simulatePetEquipped(p86, p87, p88, p89)
	local t13 = {
		Id = p86,
		Name = p87,
		Size = p88 ~= "" and p88 or nil,
		Type = p89 ~= "" and p89 or nil
	}

	pcall(function()
		t1.Networking.Pets.PetEquipped.OnClientEvent:Fire(p86, t13)
	end)
end

t1.simulatePetEquipped = simulatePetEquipped
t1.spawnLocalPetSlot = function(p90, p91, p92, p93)
	local PlayerPetReferences = Workspace:FindFirstChild("PlayerPetReferences")

	if not PlayerPetReferences then
		PlayerPetReferences = Instance.new("Folder")
		PlayerPetReferences.Name = "PlayerPetReferences"
		PlayerPetReferences.Parent = Workspace
	end

	local Folder = PlayerPetReferences:FindFirstChild(tostring(LocalPlayer.UserId))

	if not Folder then
		Folder = Instance.new("Folder")
		Folder.Name = tostring(LocalPlayer.UserId)
		Folder.Parent = PlayerPetReferences
	end

	local n6 = 1

	while Folder:FindFirstChild("PetPart" .. n6) do
		n6 += 1
	end

	local Part = Instance.new("Part")

	Part.Name = "PetPart" .. n6
	Part.Size = Vector3.new(1, 1, 1)
	Part.Transparency = 1
	Part.CanCollide = false
	Part.CanQuery = false
	Part.CanTouch = false
	Part.Anchored = true
	Part:SetAttribute("PetSpecies", p91)
	Part:SetAttribute("PetId", p90)
	Part:SetAttribute("PetVisible", true)
	Part:SetAttribute("PetAttached", true)
	Part:SetAttribute(t1.LOCAL_PET_ATTR, true)

	if p92 ~= "" then
		Part:SetAttribute("PetSize", p92)
	end

	if p93 ~= "" then
		Part:SetAttribute("PetType", p93)
	end

	local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

	if HumanoidRootPart then
		Part.CFrame = HumanoidRootPart.CFrame
	end

	Part.Parent = Folder

	return Part, n6
end

local t14 = {
	{
		0,
		3
	},
	{
		-2.5,
		4
	},
	{
		2.5,
		4
	},
	{
		-4,
		5
	},
	{
		4,
		5
	},
	{
		-5.5,
		6
	},
	{
		5.5,
		6
	}
}

t1.findLocalPetPart = function(p94)
	local v171 = tostring(p94 or "")

	if v171 == "" then
		return nil
	end

	local PlayerPetReferences = Workspace:FindFirstChild("PlayerPetReferences")
	local v173 = PlayerPetReferences and PlayerPetReferences:FindFirstChild(tostring(LocalPlayer.UserId))

	if not v173 then
		return nil
	end

	for _, child in ipairs(v173:GetChildren()) do
		if child:IsA("BasePart") then
			if child:GetAttribute("PetId") == v171 then
				return child
			end
		end
	end

	return nil
end
t1.isLocalPetPart = function(p95)
	return p95 and p95:GetAttribute(t1.LOCAL_PET_ATTR) == true
end
t1.isLocalPetId = function(p96)
	local v176 = t1.findLocalPetPart(p96)

	return v176 and t1.isLocalPetPart(v176)
end
t1.getPetPartSlotIndex = function(p97)
	local match = p97.Name:match("^PetPart(%d+)$")

	return tonumber(match) or 1
end
t1.getPetFollowOffset = function(p98)
	local v178 = t14[p98] or t14[(p98 - 1) % #t14 + 1]

	return v178[1], v178[2]
end
t1.isPetPartFollowing = function(p99)
	if not p99 then
		return false
	end

	if p99:GetAttribute("SlotOverride") == true then
		return false
	end

	local attribute = p99:GetAttribute("SlotOffsetX")
	local attribute2 = p99:GetAttribute("SlotOffsetZ")

	return type(attribute) == "number" and type(attribute2) == "number"
end
t1.getGardenPetPosition = function()
	local v181 = t1.getPlayerPlot()
	local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

	if v181 and HumanoidRootPart then
		local v183 = t1.getPlantAreaParts(v181)

		for _, v in ipairs(v183) do
			local v186 = v.CFrame:PointToObjectSpace(HumanoidRootPart.Position)

			if math.abs(v186.X) <= v.Size.X * 0.5 and math.abs(v186.Z) <= v.Size.Z * 0.5 then
				local hit = Workspace:Raycast(HumanoidRootPart.Position + Vector3.new(0, 6, 0), Vector3.new(0, -30, 0))

				if hit then
					return hit.Position + Vector3.new(0, 0.35, 0)
				end

				return Vector3.new(HumanoidRootPart.Position.X, v.Position.Y + v.Size.Y * 0.5, HumanoidRootPart.Position.Z)
			end
		end
	end

	if v181 then
		local v188 = t1.getRandomPlantPosition(v181)

		if v188 then
			return v188 + Vector3.new(0, 0.35, 0)
		end
	end

	if not HumanoidRootPart then
		return Vector3.new(0, 5, 0)
	end

	local hit = Workspace:Raycast(HumanoidRootPart.Position + Vector3.new(0, 6, 0), Vector3.new(0, -30, 0))

	if hit then
		return hit.Position + Vector3.new(0, 0.35, 0)
	end

	return HumanoidRootPart.Position
end
t1.enableLocalPetFollow = function(p100)
	if not p100 then
		return
	end

	local v190 = t1.getPetPartSlotIndex(p100)
	local v191, v192 = t1.getPetFollowOffset(v190)

	p100:SetAttribute("SlotOverride", false)
	p100:SetAttribute("PetAttached", true)
	p100:SetAttribute("SlotOffsetX", v191)
	p100:SetAttribute("SlotOffsetZ", v192)
end
t1.placeLocalPetInGarden = function(p101, p102)
	if not p101 then
		return false
	end

	local v193 = p102 or t1.getGardenPetPosition()

	p101:SetAttribute("SlotOverride", true)
	p101:SetAttribute("PetAttached", false)
	p101:SetAttribute("SlotOffsetX", nil)
	p101:SetAttribute("SlotOffsetZ", nil)
	p101.CFrame = CFrame.new(v193)

	return true
end
t1.getMouseGardenPosition = function()
	local mouse = LocalPlayer:GetMouse()

	if mouse and mouse.Hit then
		return mouse.Hit.Position + Vector3.new(0, 0.35, 0)
	end

	return t1.getGardenPetPosition()
end
t1.snapLocalPetVisuals = function()
	pcall(function()
		local PlayerScripts = LocalPlayer:FindFirstChild("PlayerScripts")
		local Controllers = PlayerScripts and PlayerScripts:FindFirstChild("Controllers")
		local PetVisualController = Controllers and Controllers:FindFirstChild("PetVisualController")

		if PetVisualController then
			require(PetVisualController):SnapPetsForPlayer(LocalPlayer)
		end
	end)
end
t1.toggleLocalPetGarden = function(p103, p104)
	local v198 = t1.findLocalPetPart(p103)

	if not v198 or not t1.isLocalPetPart(v198) then
		return false
	end

	if t1.isPetPartFollowing(v198) then
		t1.placeLocalPetInGarden(v198, p104)
	else
		t1.enableLocalPetFollow(v198)
	end

	t1.snapLocalPetVisuals()

	return true
end
t1.LOCAL_PET_BOUND_ATTR = "PR_GAG2_PetBound"
t1.bindLocalPetTool = function(p105)
	if not p105 or not t1.isLocalTool(p105) then
		return
	end

	local attribute = p105:GetAttribute("PetId")

	if type(attribute) ~= "string" or attribute == "" then
		return
	end

	if p105:GetAttribute(t1.LOCAL_PET_BOUND_ATTR) then
		return
	end

	p105:SetAttribute(t1.LOCAL_PET_BOUND_ATTR, true)

	local UserInputService = game:GetService("UserInputService")
	local connection

	local function v202()
		t1.toggleLocalPetGarden(attribute, t1.getMouseGardenPosition())
	end

	task.defer(function()
		if not p105 or not p105.Parent then
			return
		end

		if typeof(getconnections) == "function" then
			for _, v in ipairs(getconnections(p105.Activated)) do
				pcall(function()
					v:Disconnect()
				end)
			end
		end

		p105.Activated:Connect(v202)
	end)
	p105.Equipped:Connect(function()
		if connection then
			connection:Disconnect()
		end

		connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if gameProcessed or p105.Parent ~= LocalPlayer.Character then
				return
			end

			if input.UserInputType == Enum.UserInputType.MouseButton2 then
				v202()
			end
		end)
	end)
	p105.Unequipped:Connect(function()
		if connection then
			connection:Disconnect()
			connection = nil
		end
	end)
end
t1.initLocalPetSystem = function()
	if t1._localPetSystemReady then
		return
	end

	local RequestToggleFollower = t1.Networking.Pets.RequestToggleFollower

	if RequestToggleFollower then
		if not RequestToggleFollower._gag2ToggleHook then
			local Fire = RequestToggleFollower.Fire

			RequestToggleFollower.Fire = function(p106, p107, ...)
				if t1.toggleLocalPetGarden(p107, t1.getMouseGardenPosition()) then
					return
				end

				return Fire(p106, p107, ...)
			end
			RequestToggleFollower._gag2ToggleHook = true
		end
	end

	t1._localPetSystemReady = true
end
t1.initLocalPetSystem()
t1.resetHandLock = function()
	t1._handLockUntil = 0
end
t1.handLockActive = function()
	return os.clock() < (t1._handLockUntil or 0)
end
t1.tryHandLock = function(p108)
	local now = os.clock()

	if now < (t1._handLockUntil or 0) then
		return false
	end

	t1._handLockUntil = now + (p108 or 0.15)

	return true
end
t1.extendHandLock = function(p109)
	local _handLockUntil = t1._handLockUntil or 0

	t1._handLockUntil = math.max(_handLockUntil, os.clock() + (p109 or 0.15))
end
t1.performHandAction = function(p110, p111)
	if not t1.tryHandLock(p110 or 0.2) then
		return false
	end

	local ok, result2 = pcall(p111)

	t1.resetHandLock()

	if ok then
		return result2
	end

	return false
end
t1.getEquippedActionTool = function()
	local Character = LocalPlayer.Character

	if not Character then
		return nil
	end

	for _, child in ipairs(Character:GetChildren()) do
		if child:IsA("Tool") and (child:GetAttribute("SeedTool") or child:GetAttribute("WateringCan") or child:GetAttribute("Sprinkler") or child:GetAttribute("Egg") or child:GetAttribute("SeedPack") or child:GetAttribute("Crate")) then
			return child
		end
	end
end
t1.getRandomPlantPosition = function(p112)
	local v214 = t1.getPlantAreaParts(p112)

	if #v214 == 0 then
		return nil
	end

	local v215 = v214[math.random(1, #v214)]
	local vector3 = Vector3.new((math.random() - 0.5) * v215.Size.X * 0.8, 0, (math.random() - 0.5) * v215.Size.Z * 0.8)
	local v217 = v215.CFrame:PointToWorldSpace(vector3)
	local raycastParams = RaycastParams.new()

	raycastParams.FilterType = Enum.RaycastFilterType.Include
	raycastParams.FilterDescendantsInstances = v214

	local hit = Workspace:Raycast(v217 + Vector3.new(0, 50, 0), Vector3.new(0, -120, 0), raycastParams)

	if hit then
		return hit.Position
	end

	return v217
end
t1.getHarvestTargets = function(p113, p114)
	local v220 = p113 or 1
	local v221 = p114 == true
	local v222 = t1.getPlayerPlot()

	if not v222 then
		return {}
	end

	local Plants = v222:FindFirstChild("Plants")

	if not Plants then
		return {}
	end

	local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	local Position = HumanoidRootPart and HumanoidRootPart.Position
	local t15 = {}

	for _, descendant in ipairs(Plants:GetDescendants()) do
		if descendant:IsA("ProximityPrompt") and descendant:HasTag("HarvestPrompt") and descendant.Enabled and not descendant:GetAttribute("Collected") then
			local Model = descendant:FindFirstAncestorWhichIsA("Model")

			if Model then
				local attribute = Model:GetAttribute("PlantId")

				if attribute then
					local PrimaryPart = Model.PrimaryPart or Model:FindFirstChildWhichIsA("BasePart")
					local distance = 0

					if Position and PrimaryPart then
						distance = (Position - PrimaryPart.Position).Magnitude
					end

					local insert = table.insert
					local v234 = t15
					local t16 = {
						PlantId = attribute
					}
					local attribute2 = Model:GetAttribute("FruitId")

					t16.FruitId = attribute2 or ""
					t16.Distance = distance
					t16.Weight = tonumber(Model:GetAttribute("Weight")) or tonumber(Model:GetAttribute("SizeMulti")) or 0
					t16.Mutation = Model:GetAttribute("Mutation")
					t16.Favorited = Model:GetAttribute("IsFavorite") == true
					insert(v234, t16)
				end
			end
		end
	end

	if v221 and Position then
		table.sort(t15, function(p115, p116)
			return p115.Distance < p116.Distance
		end)
	end

	local t17 = {}

	for _, v in ipairs(t15) do
		table.insert(t17, v)

		if v220 <= #t17 then
			break
		end
	end

	return t17
end
t1.getGrowTargets = function(p117)
	local v240 = p117 or 1
	local v241 = t1.getPlayerPlot()

	if not v241 then
		return {}
	end

	local Plants = v241:FindFirstChild("Plants")

	if not Plants then
		return {}
	end

	local t18 = {}

	for _, descendant in ipairs(Plants:GetDescendants()) do
		if not descendant:IsA("ProximityPrompt") or not descendant:HasTag("GrowPrompt") or not descendant.Enabled then
			continue
		end

		local Model = descendant:FindFirstAncestorWhichIsA("Model")

		if Model then
			local attribute = Model:GetAttribute("PlantId")

			if attribute then
				table.insert(t18, attribute)

				if not (v240 <= #t18) then
					continue
				end
			else
				continue
			end
		else
			continue
		end

		break
	end

	return t18
end
t1.hasSellableFruits = function(p118)
	local v248 = p118 == true

	for _, v in ipairs(t1.getTools(function(p119)
		return p119:GetAttribute("HarvestedFruit") == true and not t1.isLocalTool(p119)
	end)) do
		if v248 and v:GetAttribute("IsFavorite") then
			continue
		end

		return true
	end

	return false
end
t1.hasSellablePets = function(p120)
	local v251 = p120 == true

	for _, v in ipairs(t1.getTools(function(p121)
		return p121:GetAttribute("Pet") ~= nil and not t1.isLocalTool(p121)
	end)) do
		if v251 and v:GetAttribute("IsFavorite") then
			continue
		end

		return true
	end

	return false
end
t1.getFruitInventoryCount = function()
	local v254 = tonumber(LocalPlayer:GetAttribute("FruitCount"))

	if v254 ~= nil then
		return math.max(0, v254)
	end

	local n7 = 0

	for _ in ipairs(t1.getTools(function(p122)
		return p122:GetAttribute("HarvestedFruit") == true and not t1.isLocalTool(p122)
	end)) do
		n7 += 1
	end

	return n7
end
t1.getMaxFruitCapacity = function()
	return tonumber(LocalPlayer:GetAttribute("MaxFruitCapacity")) or 100
end
t1.isFruitInventoryNearlyFull = function(p123)
	local v257 = tonumber(p123) or 0.9
	local v258 = t1.getMaxFruitCapacity()

	return t1.getFruitInventoryCount() >= math.floor(v258 * v257)
end

local function getEquippedPetIds()
	local t19 = {}
	local ok, result2 = pcall(function()
		return t1.Networking.Pets.GetEquippedPets:Fire()
	end)

	if ok and type(result2) == "table" then
		for _, v in ipairs(result2) do
			if type(v) == "table" then
				local Id = v.Id or v.PetId or v.PetID

				if type(Id) == "string" and Id ~= "" then
					t19[Id] = true
				end
			elseif type(v) == "string" and v ~= "" then
				t19[v] = true
			end
		end
	end

	return t19
end

t1.getEquippedPetIds = getEquippedPetIds
t1.estimateToolFruitValue = function(p124)
	return t1.estimateFruitValue(p124:GetAttribute("FruitName") or p124:GetAttribute("Fruit") or p124.Name, p124:GetAttribute("SizeMultiplier") or p124:GetAttribute("Weight"), p124:GetAttribute("Mutation"))
end
t1.preparePart = function(p125)
	p125.Anchored = false
	p125.CanCollide = false
	p125.CanQuery = false
	p125.CanTouch = false
	p125.Massless = true
end
t1.preparePreview = function(p126)
	local function v266(p127)
		if p127:IsA("BasePart") then
			p127.Anchored = true
			p127.CanCollide = false
			p127.CanTouch = false
			pcall(function()
				p127.CanQuery = false
			end)
		elseif p127:IsA("Script") or p127:IsA("LocalScript") then
			p127.Disabled = true
		elseif p127:IsA("ProximityPrompt") then
			p127.Enabled = false
		end
	end

	v266(p126)

	for _, descendant in ipairs(p126:GetDescendants()) do
		v266(descendant)
	end
end
t1.getPackEligibleSeeds = function()
	if t1._packEligibleSeeds then
		return t1._packEligibleSeeds
	end

	local t20 = {}

	for _, v in ipairs(t1.SeedData) do
		if type(v) == "table" and v.RestockShop and v.SeedName then
			local v272 = tonumber(t1.SellValueData[v.SeedName]) or 0

			if not v.IsSingleHarvest then
				v272 *= 6
			end

			table.insert(t20, {
				Name = v.SeedName,
				Gen = v272
			})
		end
	end

	table.sort(t20, function(p128, p129)
		if p128.Gen == p129.Gen then
			return p128.Name < p129.Name
		end

		return p128.Gen < p129.Gen
	end)

	local packEligibleSeeds = {}

	for _, v in ipairs(t20) do
		table.insert(packEligibleSeeds, v.Name)
	end

	t1._packEligibleSeeds = packEligibleSeeds

	return packEligibleSeeds
end
t1.getPackProgressDropTable = function(p130)
	local v276 = t1.getPackEligibleSeeds()
	local v277 = #v276

	if v277 == 0 then
		return {}
	end

	if v277 == 1 then
		return { {
			Name = v276[1],
			Chance = 1
		} }
	end

	local v278 = tonumber(p130.TargetPercentile) or 0.5
	local v279 = tonumber(p130.Spread) or 0.15

	if v279 <= 0 then
		v279 = 0.0001
	end

	local t21 = {}

	for i, v in ipairs(v276) do
		local v283 = (i - 1) / (v277 - 1) - v278

		table.insert(t21, {
			Name = v,
			Chance = math.exp(-0.5 * (v283 / v279) * (v283 / v279))
		})
	end

	return t21
end
t1.getPackDropTable = function(p131)
	local v284 = t1.PacksByName[p131]

	if not v284 then
		return {}
	end

	if type(v284.Seeds) ~= "table" or not (#v284.Seeds > 0) then
		return t1.getPackProgressDropTable(v284)
	end

	local t22 = {}

	for _, seed in ipairs(v284.Seeds) do
		table.insert(t22, {
			Name = seed.SeedName or seed.Name,
			Chance = tonumber(seed.Chance) or 1
		})
	end

	return t22
end
t1.getCrateDropTable = function(p132)
	local v288 = t1.CratesByName[p132]

	if not v288 or type(v288.Items) ~= "table" then
		return {}
	end

	local t23 = {}

	for _, item in ipairs(v288.Items) do
		table.insert(t23, {
			Name = item.Name,
			Chance = tonumber(item.Chance) or 1
		})
	end

	return t23
end
t1.getEggDropTable = function(p133)
	local v292 = t1.EggsByName[p133]

	if not v292 or type(v292.Pets) ~= "table" then
		return {}
	end

	local t24 = {}

	for _, pet in ipairs(v292.Pets) do
		table.insert(t24, {
			Name = pet.PetName,
			Chance = tonumber(pet.Chance) or 1
		})
	end

	return t24
end
t1.formatRollImage = function(p134)
	if p134 then
		if p134 ~= "" then
			if p134:find("rbxassetid://") then
				return p134
			end

			if tonumber(p134) then
				return "rbxassetid://" .. p134
			end

			return p134
		end
	end

	return ""
end
t1.getRollImage = function(p135)
	local v296 = tostring(p135 or "")

	if v296 == "" then
		return ""
	end

	local v297 = t1.getSeedImageId(v296)

	if v297 ~= "" then
		return t1.formatRollImage(v297)
	end

	local v298 = t1.getPetImageId(v296)

	if v298 ~= "" then
		return t1.formatRollImage(v298)
	end

	local v299 = t1.getPropImageId(v296)

	if v299 ~= "" then
		return t1.formatRollImage(v299)
	end

	local v300 = t1.GearByName[v296]

	if v300 and v300.IMG then
		return t1.formatRollImage(v300.IMG)
	end

	local v301 = t1.EggsByName[v296]

	if v301 and v301.IMG then
		return t1.formatRollImage(v301.IMG)
	end

	local v302 = t1.PacksByName[v296]

	if v302 and v302.IMG then
		return t1.formatRollImage(v302.IMG)
	end

	local v303 = t1.CratesByName[v296]

	if v303 and v303.IMG then
		return t1.formatRollImage(v303.IMG)
	end

	return ""
end
t1.enrichRollDropTable = function(p136)
	local t25 = {}

	for i, v in ipairs(p136) do
		t25[i] = {
			Name = v.Name,
			Chance = v.Chance,
			Image = v.Image or t1.getRollImage(v.Name)
		}
	end

	return t25
end
t1.enrichRollDropRow = function(p137)
	if p137 then
		return {
			Name = p137.Name,
			Chance = p137.Chance,
			Image = p137.Image or t1.getRollImage(p137.Name)
		}
	end

	return nil
end
t1.getEggPetOptions = function(p138)
	local t26 = {}

	for _, v in ipairs(t1.getEggDropTable(p138)) do
		if v.Name and v.Name ~= "" then
			local v310 = false

			for _, v2 in ipairs(t26) do
				if v2 == v.Name then
					v310 = true

					break
				end
			end

			if not v310 then
				table.insert(t26, v.Name)
			end
		end
	end

	table.sort(t26)

	return t26
end
t1.getCrateItemOptions = function(p139)
	local t27 = {}

	for _, v in ipairs(t1.getCrateDropTable(p139)) do
		table.insert(t27, v.Name)
	end

	return t27
end
t1.getPackSeedOptions = function(p140)
	local t28 = {}
	local t29 = {}

	for _, v in ipairs(t1.getPackDropTable(p140)) do
		local Name = v.Name

		if Name and Name ~= "" and not t29[Name] then
			t29[Name] = true
			table.insert(t28, Name)
		end
	end

	table.sort(t28)

	return t28
end
t1.getPackSeedDropdownOptions = function(p141)
	return t1.getPackSeedOptions(p141)
end
t1.getEggPetDropdownOptions = function(p142)
	local v321 = t1.getEggPetOptions(p142)

	if #v321 == 0 then
		return t1.PetOptions
	end

	return v321
end
t1.getCrateItemDropdownOptions = function(p143)
	return t1.getCrateItemOptions(p143)
end
t1.getPlantAreaParts = function(p144)
	local t30 = {}

	for _, v in CollectionService:GetTagged("PlantArea") do
		if v:IsDescendantOf(p144) then
			table.insert(t30, v)
		end
	end

	return t30
end
t1.getRandomPlantAreaPosition = function(p145)
	return t1.getRandomPlantPosition(p145)
end
t1.getPetRarity = function(p146)
	local v325 = t1.getPetSpec(p146)

	return v325 and v325.Rarity or "Common"
end
t1.matchesTextFilter = function(p147, p148)
	local v326 = tostring(p148 or "")

	if v326 == "" then
		return true
	end

	return tostring(p147 or ""):lower():find(v326:lower(), 1, true) ~= nil
end
t1.matchesRarityFilter = function(p149, p150)
	local v327 = tostring(p150 or "")

	if v327 == "" or v327 == "Any" then
		return true
	end

	return tostring(p149 or "") == v327
end
t1.countInventoryTools = function()
	local n8 = 0

	for _, v in ipairs(t1.getContainers()) do
		for _, child in ipairs(v:GetChildren()) do
			if child:IsA("Tool") then
				n8 += 1
			end
		end
	end

	return n8
end
t1.getMaxBackpackCapacity = function()
	local v333 = t1.getPlayerPlot()
	local Signs = v333 and v333:FindFirstChild("Signs")
	local Garden = Signs and Signs:FindFirstChild("Garden")
	local CorePart = Garden and Garden:FindFirstChild("CorePart")
	local Skills = CorePart and CorePart:FindFirstChild("Skills")
	local MaxBackpack = Skills and Skills:FindFirstChild("MaxBackpack")

	if MaxBackpack and MaxBackpack:IsA("ValueBase") then
		return tonumber(MaxBackpack.Value) or 40
	end

	local localReplica = t1.PlayerStateClient:GetLocalReplica()

	if localReplica and localReplica.Data and localReplica.Data.Skills then
		return tonumber(localReplica.Data.Skills.MaxBackpack) or 40
	end

	return 40
end
t1.isBackpackNearlyFull = function(p151)
	local v340 = tonumber(p151) or 0.9
	local v341 = t1.getMaxBackpackCapacity()

	return t1.countInventoryTools() >= math.floor(v341 * v340)
end
t1.triggerProximityPrompt = function(p152)
	if p152 then
		if p152:IsDescendantOf(Workspace) then
			p152:InputHoldBegin()

			local v342 = p152.HoldDuration + 0.05

			if v342 > 0 then
				task.delay(v342, function()
					if p152:IsDescendantOf(Workspace) then
						p152:InputHoldEnd()
					end
				end)
			else
				p152:InputHoldEnd()
			end

			return true
		end
	end

	return false
end
t1.getPlantPosition = function(p153, p154, p155, p156)
	local v343 = p156 or {}

	if p154 == "Current" then
		local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart then
			return HumanoidRootPart.Position
		end
	else
		if p154 == "Saved" and typeof(p155) == "Vector3" then
			return p155
		end

		if p154 == "Grid" or v343.layout == "Grid" then
			return t1.getGridPlantPosition(p153, v343)
		end
	end

	return t1.getRandomPlantPosition(p153)
end

local function getGridPlantPosition(p157, p158)
	local v346 = p158 or {}
	local v347 = tonumber(v346.spacing) or 3
	local v348 = t1.getPlantAreaParts(p157)

	if #v348 == 0 then
		return t1.getRandomPlantPosition(p157)
	end

	local v349 = v348[1]
	local v350 = math.floor(v349.Size.X / v347)
	local v351 = math.floor(v349.Size.Z / v347)

	if v350 < 1 or v351 < 1 then
		return t1.getRandomPlantPosition(p157)
	end

	local v352 = (v346.gridIndex or 0) % (v350 * v351)

	if type(v346.gridState) == "table" then
		v346.gridState.gridIndex = v352 + 1
	end

	local vector3 = Vector3.new((v352 % v350 - v350 / 2) * v347, 0, (math.floor(v352 / v350) - v351 / 2) * v347)
	local v354 = v349.CFrame:PointToWorldSpace(vector3)
	local raycastParams = RaycastParams.new()

	raycastParams.FilterType = Enum.RaycastFilterType.Include
	raycastParams.FilterDescendantsInstances = v348

	local hit = Workspace:Raycast(v354 + Vector3.new(0, 50, 0), Vector3.new(0, -120, 0), raycastParams)

	return hit and hit.Position or v354
end

t1.getGridPlantPosition = getGridPlantPosition
t1.getFruitBidValue = function(p159)
	if not p159 then
		return nil
	end

	local ok, result2 = pcall(function()
		return t1.Networking.NPCS.GetFruitBid:Fire(p159)
	end)

	if ok and type(result2) == "table" then
		return tonumber(result2.CurrentOffer) or tonumber(result2.BidPrice) or tonumber(result2.Value)
	end

	if ok and tonumber(result2) then
		return tonumber(result2)
	end

	return nil
end
t1.getOwnedSeedToolFiltered = function(p160, p161)
	local v359 = p160 == true
	local v360 = tostring(p161 or "")
	local v361
	local v362
	local n9 = 0

	for _, v in ipairs(t1.getTools(function(p162)
		return p162:GetAttribute("SeedTool") ~= nil
	end)) do
		if not v359 or not t1.isLocalTool(v) then
			local attribute = v:GetAttribute("SeedTool")

			if type(attribute) == "string" and attribute ~= "" and t1.matchesTextFilter(attribute, v360) then
				local v367 = t1.getSeedToolQuantity(v)

				if v367 > 0 and n9 <= v367 then
					v361 = v
					v362 = attribute
					n9 = v367
				end
			end
		end
	end

	return v361, v362
end
t1.getSprinklerTool = function(p163)
	local v368 = tostring(p163 or "")

	if v368 == "" then
		return t1.getToolWithAttribute("Sprinkler")
	end

	for _, v in ipairs(t1.getTools(function(p164)
		return p164:GetAttribute("Sprinkler") == v368 and not t1.isLocalTool(p164)
	end)) do
		return v
	end

	return nil
end
t1.getShovelTool = function()
	return t1.getToolWithAttribute("Shovel")
end
t1.getTrowelTool = function()
	for _, v in ipairs(t1.getTools(function(p165)
		return p165:GetAttribute("Trowel") ~= nil and not t1.isLocalTool(p165)
	end)) do
		return v
	end
end
t1.isPlantSkipped = function(p166)
	if p166:GetAttribute("IsFavorite") == true or p166:GetAttribute("Favorited") == true then
		return true
	end

	return false
end
t1.getPlotPlantModels = function()
	local v373 = t1.getPlayerPlot()
	local Plants = v373 and v373:FindFirstChild("Plants")

	if not Plants then
		return {}
	end

	local t31 = {}

	for _, child in ipairs(Plants:GetChildren()) do
		if child:IsA("Model") and child:GetAttribute("PlantId") then
			table.insert(t31, child)
		end
	end

	return t31
end
t1.getShovelTargets = function(p167, p168, p169)
	local v378 = p167 or 1
	local v379 = tostring(p169 or "")
	local t32 = {}

	for _, v in ipairs(t1.getPlotPlantModels()) do
		if p168 and t1.isPlantSkipped(v) then
			continue
		end

		if not t1.matchesTextFilter(v:GetAttribute("SeedName") or "", v379) then
			continue
		end

		local attribute = v:GetAttribute("PlantId")

		if attribute then
			table.insert(t32, {
				PlantId = attribute,
				FruitId = "",
				Model = v
			})

			if not (v378 <= #t32) then
				continue
			end
		else
			continue
		end

		break
	end

	return t32
end
t1.getTrowelTargets = function(p170, p171)
	local v384 = p170 or 1
	local v385 = tostring(p171 or "")
	local t33 = {}

	for _, v in ipairs(t1.getPlotPlantModels()) do
		if not t1.matchesTextFilter(v:GetAttribute("SeedName") or "", v385) then
			continue
		end

		local attribute = v:GetAttribute("PlantId")

		if attribute then
			table.insert(t33, {
				PlantId = attribute,
				Model = v
			})

			if not (v384 <= #t33) then
				continue
			end
		else
			continue
		end

		break
	end

	return t33
end
t1.getDecayingPlantTargets = function(p172)
	local v390 = p172 or 1
	local t34 = {}

	for _, v in ipairs(t1.getPlotPlantModels()) do
		if v:GetAttribute("Mutation") then
			continue
		end

		local v394 = tonumber(v:GetAttribute("Age")) or 0
		local v395 = tonumber(v:GetAttribute("MaxAge")) or 0

		if not (v395 > 0) then
			continue
		end

		if not (v394 < v395) then
			continue
		end

		local attribute = v:GetAttribute("PrimeStartedAt")

		if not attribute then
			continue
		end

		if not (tonumber(attribute) > 0) then
			continue
		end

		local v397 = t1.SeedsByName[v:GetAttribute("SeedName") or ""]

		if not v397 then
			continue
		elseif v397.AlwaysPrime then
			continue
		elseif v397.PrimeTime then
			table.insert(t34, v)

			if not (v390 <= #t34) then
				continue
			end
		else
			continue
		end

		break
	end

	return t34
end
t1.getDroppedCollectibles = function(p173, p174)
	local DroppedItems = Workspace:FindFirstChild("DroppedItems")

	if not DroppedItems then
		return {}
	end

	local t35 = {}

	for _, child in ipairs(DroppedItems:GetChildren()) do
		if child:IsA("Model") then
			local attribute = child:GetAttribute("DroppedBy")

			if attribute == nil or attribute == LocalPlayer.UserId then
				local attribute2 = child:GetAttribute("ItemCategory")
				local attribute3 = child:GetAttribute("DisplayName") or child:GetAttribute("ItemName") or ""

				if (not p173 or attribute2 == "Seeds") and (not p174 or attribute3 == "Acorn") then
					local Visual = child:FindFirstChild("Visual")
					local PrimaryPart

					if Visual and Visual:IsA("BasePart") then
						PrimaryPart = Visual
					elseif Visual and Visual:IsA("Model") then
						PrimaryPart = Visual.PrimaryPart or Visual:FindFirstChildWhichIsA("BasePart")
					end

					if PrimaryPart then
						table.insert(t35, {
							Model = child,
							Part = PrimaryPart,
							Name = attribute3
						})
					end
				end
			end
		end
	end

	return t35
end
t1.collectDroppedItem = function(p175)
	local Character = LocalPlayer.Character
	local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

	if not HumanoidRootPart or not p175 or not p175.Part then
		return false
	end

	local Position = p175.Part.Position

	if (HumanoidRootPart.Position - Position).Magnitude > 12 then
		HumanoidRootPart.CFrame = CFrame.new(Position + Vector3.new(0, 2, 0))
		task.wait(0.05)
	end

	if firetouchinterest then
		pcall(function()
			firetouchinterest(HumanoidRootPart, p175.Part, 0)
			task.wait()
			firetouchinterest(HumanoidRootPart, p175.Part, 1)
		end)
	end

	for _, descendant in ipairs(p175.Model:GetDescendants()) do
		if descendant:IsA("ProximityPrompt") and descendant.Enabled then
			t1.triggerProximityPrompt(descendant)

			return true
		end
	end

	return true
end
t1.getStealPrompts = function(p176)
	local v412 = p176 or 1
	local t36 = {}

	for _, v in ipairs(CollectionService:GetTagged("StealPrompt")) do
		if v:IsA("ProximityPrompt") and v.Enabled then
			table.insert(t36, v)

			if not (v412 <= #t36) then
				continue
			end
		else
			continue
		end

		break
	end

	return t36
end
t1.isNightTime = function()
	local Night = ReplicatedStorage:FindFirstChild("Night")

	if Night then
		if Night:IsA("BoolValue") and Night.Value == true then
			return true
		end
	end

	local attribute = Workspace:GetAttribute("ActivePhase")

	if type(attribute) == "string" then
		if attribute:lower():find("night", 1, true) then
			return true
		end
	end

	return false
end
t1.estimateFruitValue = function(p177, p178, p179)
	local v418 = tonumber(t1.SellValueData[p177]) or 0
	local v419 = tonumber(p178) or 1
	local n10 = 1

	if p179 and p179 ~= "" and p179 ~= "None" then
		n10 = 2
	end

	return math.floor(v418 * v419 * n10)
end
t1.estimatePetValue = function(p180)
	local v421 = t1.getPetSpec(p180)

	return tonumber(v421 and v421.BasePrice) or 0
end
t1.getEquippedToolWithAttribute = function(p181)
	local Character = LocalPlayer.Character

	if not Character then
		return nil
	end

	for _, child in ipairs(Character:GetChildren()) do
		if child:IsA("Tool") and child:GetAttribute(p181) then
			return child
		end
	end
end
t1.getToolWithAttribute = function(p182)
	local v425 = t1.getEquippedToolWithAttribute(p182)

	if v425 then
		return v425
	end

	return t1.getTools(function(p183)
		return p183:GetAttribute(p182) ~= nil
	end)[1]
end
t1.equipTool = function(p184)
	if not p184 then
		return false
	end

	local Character = LocalPlayer.Character
	local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

	if not Character or not Humanoid then
		return false
	end

	if p184.Parent == Character then
		return true
	end

	Humanoid:UnequipTools()
	p184.Parent = Character

	return p184.Parent == Character
end
t1.getPotPlantTargets = function(p185)
	local v428 = p185 or 1
	local v429 = t1.getPlayerPlot()

	if not v429 then
		return {}
	end

	local Plants = v429:FindFirstChild("Plants")

	if not Plants then
		return {}
	end

	local t37 = {}
	local v432 = tostring(LocalPlayer.UserId) .. "_"

	for _, child in ipairs(Plants:GetChildren()) do
		if not child:IsA("Model") then
			continue
		end

		local attribute = child:GetAttribute("SeedName")
		local ok = not attribute

		if not ok then
			local v437 = t1.SeedsByName[attribute]

			ok = not (not not v437 and not not v437.IsSingleHarvest)
		end

		if not ok then
			continue
		end

		local v438 = tonumber(child:GetAttribute("Age")) or 0
		local v439 = tonumber(child:GetAttribute("MaxAge")) or 0

		if not (v439 > 0) then
			continue
		end

		if not (v439 <= v438) then
			continue
		end

		if child:GetAttribute("IsPotted") == true then
			continue
		end

		local attribute2 = child:GetAttribute("PlantId")

		if not attribute2 then
			attribute2 = child.Name

			if string.sub(attribute2, 1, #v432) == v432 then
				attribute2 = string.sub(attribute2, #v432 + 1)
			end
		end

		table.insert(t37, attribute2)

		if v428 <= #t37 then
			break
		end
	end

	return t37
end
t1.getWildPetInstances = function()
	local v441 = t1.getWildPetRefFolder()

	if not v441 then
		return {}
	end

	local t38 = {}

	for _, child in ipairs(v441:GetChildren()) do
		if child:IsA("BasePart") and child:GetAttribute("PetName") then
			table.insert(t38, child)
		end
	end

	return t38
end
t1.getWildPetRefFolder = function()
	local Map = Workspace:FindFirstChild("Map")

	if not Map then
		return nil
	end

	local WildPetRef = Map:FindFirstChild("WildPetRef")

	if WildPetRef and WildPetRef:IsA("Folder") then
		return WildPetRef
	end

	local Folder = Instance.new("Folder")

	Folder.Name = "WildPetRef"
	Folder.Parent = Map

	return Folder
end
t1.isLocalWildPet = function(p186)
	return p186 and p186:GetAttribute(t1.LOCAL_WILD_ATTR) == true
end
t1.getWildPetSpawnsFolder = function()
	local Map = Workspace:FindFirstChild("Map")

	if not Map then
		return nil
	end

	local WildPetSpawns = Map:FindFirstChild("WildPetSpawns")

	if WildPetSpawns and WildPetSpawns:IsA("Folder") then
		return WildPetSpawns
	end

	local Folder = Instance.new("Folder")

	Folder.Name = "WildPetSpawns"
	Folder.Parent = Map

	return Folder
end
t1.getWildPetPrice = function(p187)
	return math.max(0, t1.estimatePetValue(p187))
end
t1.tryTameLocalWildPet = function(p188)
	local _tryTameLocalWildPet = t1._tryTameLocalWildPet

	if _tryTameLocalWildPet then
		return _tryTameLocalWildPet(p188)
	end

	return false
end
t1.getToolBillboardAdornee = function(p189)
	local Handle = p189:FindFirstChild("Handle") or p189:FindFirstChildWhichIsA("BasePart")

	if Handle then
		return Handle
	end

	local Parent = p189.Parent

	if Parent and Parent:IsA("Model") then
		return Parent:FindFirstChild("HumanoidRootPart") or Parent:FindFirstChild("RightHand")
	end

	return nil
end
t1.formatFruitPriceText = function(p190, p191, p192, p193)
	local v454

	if p193 and type(p193) == "string" and not p193:find("^PR_") then
		v454 = t1.getFruitBidValue(p193)
	end

	return t1.formatShortNumber(v454 or t1.estimateFruitValue(p190, p191, p192))
end
t1.getGardenFruitOverlays = function()
	local t39 = {}
	local Gardens = Workspace:FindFirstChild("Gardens")

	if not Gardens then
		return t39
	end

	for _, child in ipairs(Gardens:GetChildren()) do
		local Plants = child:FindFirstChild("Plants")

		if Plants then
			for _, descendant in ipairs(Plants:GetDescendants()) do
				if descendant:IsA("ProximityPrompt") and descendant.Enabled and (descendant:HasTag("HarvestPrompt") or descendant:HasTag("StealPrompt")) then
					local Model = descendant:FindFirstAncestorWhichIsA("Model")

					if Model then
						local PrimaryPart = Model.PrimaryPart or Model:FindFirstChildWhichIsA("BasePart")

						if PrimaryPart then
							table.insert(t39, {
								Part = PrimaryPart,
								FruitName = Model:GetAttribute("CorePartName") or Model:GetAttribute("SeedName") or Model.Name,
								Weight = tonumber(Model:GetAttribute("SizeMulti")) or tonumber(Model:GetAttribute("Weight")) or 1,
								Mutation = Model:GetAttribute("Mutation"),
								FruitId = Model:GetAttribute("FruitId")
							})
						end
					end
				end
			end
		end
	end

	return t39
end
t1.getStealTargets = function(p194)
	if not t1.isNightTime() then
		return {}
	end

	local v464 = p194 or 1
	local t40 = {}
	local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

	for _, v in ipairs(CollectionService:GetTagged("StealPrompt")) do
		if v:IsA("ProximityPrompt") and v.Enabled then
			local Model = v:FindFirstAncestorWhichIsA("Model")

			if Model then
				local v470 = tonumber(Model:GetAttribute("UserId"))
				local attribute = Model:GetAttribute("PlantId")

				if v470 and attribute and v470 ~= LocalPlayer.UserId then
					local PrimaryPart = Model.PrimaryPart or Model:FindFirstChildWhichIsA("BasePart")
					local n11 = 0

					if HumanoidRootPart and PrimaryPart then
						n11 = (HumanoidRootPart.Position - PrimaryPart.Position).Magnitude
					end

					table.insert(t40, {
						UserId = v470,
						PlantId = attribute,
						FruitId = Model:GetAttribute("FruitId") or "",
						Distance = n11
					})
				end
			end
		end
	end

	table.sort(t40, function(p195, p196)
		return p195.Distance < p196.Distance
	end)

	local t41 = {}

	for i = 1, math.min(v464, #t40) do
		t41[i] = t40[i]
	end

	return t41
end
t1.getWeatherMachineProps = function()
	local v476 = t1.getPlayerPlot()

	if not v476 then
		return {}
	end

	local t42 = {}

	for _, descendant in ipairs(v476:GetDescendants()) do
		if descendant:IsA("Model") and descendant:GetAttribute("PropId") and descendant:FindFirstChild("ZONE") then
			table.insert(t42, descendant)
		end
	end

	return t42
end
t1.isGardenEmpty = function()
	return #t1.getPlotPlantModels() == 0
end
t1.tryStealFruit = function(p197)
	if not p197 then
		return false
	end

	for _, v in ipairs(CollectionService:GetTagged("StealPrompt")) do
		if v:IsA("ProximityPrompt") then
			if not v.Enabled then
				continue
			end

			local Model = v:FindFirstAncestorWhichIsA("Model")

			if not Model then
				continue
			end

			local v483 = tonumber(Model:GetAttribute("UserId"))
			local attribute = Model:GetAttribute("PlantId")
			local attribute2 = Model:GetAttribute("FruitId") or ""

			if v483 ~= p197.UserId then
				continue
			end

			if attribute ~= p197.PlantId then
				continue
			end

			if attribute2 ~= (p197.FruitId or "") then
				continue
			end

			if v.HoldDuration == 0 then
				return (pcall(function()
					t1.Networking.Steal.BeginSteal:Fire(v483, attribute, attribute2)
					t1.Networking.Steal.CompleteSteal:Fire()
				end))
			end

			return t1.triggerProximityPrompt(v)
		end
	end

	return false
end

local v486 = t1

_G.__GAG2_COMMON = v486

repeat
	task.wait()
until game:IsLoaded()

local v487 = v4:CreateWindow({
	Title = ("[GAG2 v%s]"):format("1.0.0"),
	Size = UDim2.fromOffset(900, 650),
	MinSize = Vector2.new(720, 480),
	MaxSize = Vector2.new(1400, 900),
	Resizable = true,
	Theme = "Dark",
	ToggleKeybind = Enum.KeyCode.RightControl
})
local Networking = v486.Networking
local t43 = {
	AutoBuySeeds = false,
	AutoBuyGear = false,
	AutoBuyCrates = false,
	AutoPlant = false,
	AutoHarvest = false,
	AutoGrow = false,
	AutoSellFruits = false,
	AutoSellPets = false,
	AutoSellOnFull = false,
	AutoOpenPacks = false,
	AutoOpenEggs = false,
	AutoOpenCrates = false,
	SkipSeedPacks = false,
	AutoEquipGear = false,
	AntiAfk = false,
	BuyModeSeeds = "Best",
	SelectedSeed = v486.pickDefault(v486.SeedOptions),
	SelectedGear = v486.pickDefault(v486.GearOptions),
	SelectedCrate = v486.pickDefault(v486.CrateOptions),
	EquipGearName = v486.pickDefault(v486.GearOptions),
	BuyInterval = 0.2,
	PlantInterval = 0.2,
	HarvestInterval = 0.15,
	GrowInterval = 0.5,
	SellInterval = 2,
	OpenInterval = 0.35,
	HarvestBatch = 4,
	GrowBatch = 2,
	AutoExpandGarden = false,
	AutoWater = false,
	AutoPotPlant = false,
	AutoPlaceSprinkler = false,
	AutoTameWildPets = false,
	ExpandInterval = 5,
	WaterInterval = 1,
	PotInterval = 2,
	SprinklerInterval = 3,
	TameInterval = 1,
	PotBatch = 2,
	TameBatch = 1,
	PlantSeedFilter = "",
	PlantPositionMode = "Random",
	SavedPlantPosition = nil,
	SelectedSprinkler = v486.pickDefault(v486.SprinklerOptions),
	AutoCollectDroppedSeeds = false,
	AutoCollectDroppedAcorns = false,
	CollectDropInterval = 0.35,
	AutoShovel = false,
	ShovelInterval = 1,
	ShovelBatch = 1,
	ShovelSkipFavorited = false,
	ShovelNameFilter = "",
	AutoTrowel = false,
	TrowelInterval = 1.5,
	TrowelBatch = 1,
	TrowelNameFilter = "",
	AutoReclaimTrees = false,
	ReclaimInterval = 2,
	AutoWeatherSlots = false,
	WeatherSlotInterval = 8,
	SellFullThreshold = 0.9,
	AutoFavoriteMutations = false,
	AutoFavoriteInventory = false,
	AutoUnfavoriteInventory = false,
	AutoFavoriteFarm = false,
	FavoriteMutationList = {
		"Gold",
		"Rainbow"
	},
	AutoEquipPets = false,
	PetEquipInterval = 3,
	PetEquipNameFilter = "",
	PetEquipRarity = "Any",
	TameNameFilter = "",
	TameRarityFilter = "Any",
	AutoAcceptGift = false,
	AutoTrader = false,
	TraderWebhook = "",
	AutoStealFruit = false,
	StealBatch = 2,
	EggSnip = false,
	HideRollUi = false,
	ShowFruitPrices = false,
	ShowPetPrices = false,
	ShowPlantList = false,
	Noclip = false,
	InfiniteJump = false,
	LowGraphics = false,
	BlackScreen = false,
	WhiteScreen = false,
	HideNotifications = false,
	HideWatermark = false,
	CustomCursor = false,
	ServerHop = false,
	ServerHopInterval = 300,
	AutoReconnect = false,
	PingFreezeRejoin = false,
	PingFreezeThreshold = 8000,
	ErrorNotify = false,
	DropdownSort = "Rarity",
	BuyModeGear = "Best",
	BuyModeCrates = "Best",
	SeedWishlist = "",
	GearWishlist = "",
	MaintainSeedCount = 0,
	MaintainGearCount = 0,
	BuyMaxPrice = 0,
	BuyPauseIfFull = false,
	BuyFullThreshold = 0.95,
	PlantLayout = "Random",
	PlantGridSpacing = 3,
	HarvestNearest = false,
	HarvestMinWeight = 0,
	HarvestSkipFavorited = false,
	SellMinValue = 0,
	SellPreview = false,
	SellDelayAfterHarvest = 0,
	SellSkipFavorited = true,
	OpenOrder = "Crates,Eggs,Packs",
	PackSnip = false,
	OpenOnlyIfSpace = false,
	PetEquipSlot1 = "",
	PetEquipSlot2 = "",
	PetEquipSlot3 = "",
	ShowDropEsp = false,
	HopOnlyIfEmptyGarden = false,
	HopMinSheckles = 0,
	ActivityLogEnabled = true,
	ConfigProfileName = "default",
	AutoExecuteUrl = "",
	ScreenIntensity = 1,
	LastHarvestAt = 0
}
local t44 = {
	gridIndex = 0
}
local t45 = {}
local t46 = {}
local t47 = {}
local t48 = {}
local t49 = {}
local t50 = {}
local t51 = {
	"Best",
	"Cheapest",
	"Selected",
	"All",
	"Wishlist",
	"Maintain"
}
local t52 = {
	LastHarvestAt = true
}
local t53 = {
	schedulerRunning = true,
	connections = {},
	onUnload = {}
}

local function v500(p198)
	if p198 then
		table.insert(t53.connections, p198)
	end

	return p198
end
local function v501(p199)
	if type(p199) == "function" then
		table.insert(t53.onUnload, p199)
	end
end

local t54 = {}

local function v503(p200, p201)
	if p201 then
		t54[p200] = p201
	end
end
local function v504(p202, p203)
	pcall(function()
		p202:SetValue(p203)
	end)
	pcall(function()
		p202:Set(p203)
	end)
end
local function v505()
	for k, v in pairs(t54) do
		if t43[k] ~= nil then
			v504(v, t43[k])
		end
	end
end

local u508 = false
local u509 = false
local u510 = false
local u511 = false
local n12 = 0
local n13 = 0
local n14 = 0
local now = os.clock()
local n15 = 0
local n16 = 1
local Folder
local t55 = {
	noclipConn = nil,
	noclipCharConn = nil,
	noclipRemovingConn = nil,
	noclipDescConn = nil,
	noclipSaved = nil,
	jumpConn = nil,
	colorEffect = nil,
	savedGlobalShadows = nil,
	savedQualityLevel = nil,
	coreGuiSaved = false,
	savedCoreGui = {}
}

local function v520(p204, p205, p206, p207)
	v486.notify(v4, p204, p205, p206, p207)
end
local function v521(p208)
	if not t43.ActivityLogEnabled then
		return
	end

	table.insert(t45, 1, ("[%s] %s"):format(os.date("%H:%M:%S"), p208))

	if #t45 > 30 then
		table.remove(t45)
	end
end
local function v522()
	return {
		maxPrice = t43.BuyMaxPrice,
		wishlist = v486.parseListString(t43.SeedWishlist),
		maintainCount = t43.MaintainSeedCount,
		inventoryCounter = function(p209)
			return v486.countInventorySeeds(p209, true)
		end
	}
end
local function v523()
	return {
		maxPrice = t43.BuyMaxPrice,
		wishlist = v486.parseListString(t43.GearWishlist),
		maintainCount = t43.MaintainGearCount
	}
end
local function v524()
	return {
		maxPrice = t43.BuyMaxPrice
	}
end
local function v525(p210)
	if typeof(p210) == "Vector3" then
		return {
			__t = "Vector3",
			x = p210.X,
			y = p210.Y,
			z = p210.Z
		}
	end

	if type(p210) ~= "table" then
		return p210
	end

	local t56 = {}

	for k, v in pairs(p210) do
		t56[k] = v525(v)
	end

	return t56
end
local function v529(p211)
	if type(p211) == "table" then
		if p211.__t == "Vector3" then
			return Vector3.new(p211.x or 0, p211.y or 0, p211.z or 0)
		end
	end

	if type(p211) ~= "table" or p211.__t then
		return p211
	end

	local t57 = {}

	for k, v in pairs(p211) do
		t57[k] = v529(v)
	end

	return t57
end
local function v533()
	return t43.BuyPauseIfFull and v486.isBackpackNearlyFull(t43.BuyFullThreshold)
end
local function v534(p212)
	local v535 = tostring(p212 or t43.ConfigProfileName or "default")

	if not writefile then
		v520("Profile", "writefile unavailable.", "Warning", 3)

		return
	end

	local t58 = {}

	for k, v in pairs(t43) do
		if not t52[k] then
			t58[k] = v525(v)
		end
	end

	t58.__version = "1.0.0"
	pcall(function()
		writefile("PR_GAG2_profile_" .. v535 .. ".json", HttpService:JSONEncode(t58))
	end)
	v521("Saved profile " .. v535)
	v520("Profile", "Saved " .. v535, "Success", 2)
end
local function v539(p213)
	local configProfileName = tostring(p213 or t43.ConfigProfileName or "default")

	if not readfile or not isfile or not isfile("PR_GAG2_profile_" .. configProfileName .. ".json") then
		v520("Profile", "Profile not found.", "Warning", 3)

		return
	end

	local ok, result2 = pcall(function()
		return HttpService:JSONDecode(readfile("PR_GAG2_profile_" .. configProfileName .. ".json"))
	end)

	if not ok or type(result2) ~= "table" then
		v520("Profile", "Failed to load.", "Warning", 3)

		return
	end

	for k, v in pairs(result2) do
		if k ~= "__version" and t43[k] ~= nil and not t52[k] then
			t43[k] = v529(v)
		end
	end

	t43.ConfigProfileName = configProfileName
	v505()
	task.defer(function()
		local value = rawget(_G, "__GAG2_APPLY_MOVEMENT")

		if value then
			pcall(value)
		end
	end)
	v521("Loaded profile " .. configProfileName)
	v520("Profile", "Loaded " .. configProfileName, "Success", 2)
end
local function v546(p214, p215, p216, p217)
	t46[p214] = {
		interval = p215,
		run = p216,
		enabled = p217
	}
end

task.spawn(function()
	while t53.schedulerRunning do
		local now2 = os.clock()

		for k, v in pairs(t46) do
			if v.enabled == nil or v.enabled() then
				if v.interval() <= now2 - (t47[k] or 0) then
					t47[k] = now2
					task.spawn(function()
						pcall(v.run)
					end)
				end
			end
		end

		task.wait(0.05)
	end
end)

local function v550(p218)
	Networking.SeedShop.PurchaseSeed:Fire(p218)
end
local function v551(p219)
	Networking.GearShop.PurchaseGear:Fire(p219)
end
local function v552(p220)
	Networking.CrateShop.PurchaseCrate:Fire(p220)
end
local function v553(p221, p222, p223)
	if not p222 or v486.getSeedToolQuantity(p222) <= 0 then
		return false
	end

	local v554 = v486.getPlayerPlot()

	if not v554 then
		return false
	end

	local v555 = p223

	if not v555 then
		v555 = v486.getPlantPosition(v554, t43.PlantLayout == "Grid" and "Grid" or t43.PlantPositionMode, t43.SavedPlantPosition, {
			layout = t43.PlantLayout,
			spacing = t43.PlantGridSpacing,
			gridIndex = t44.gridIndex,
			gridState = t44
		})
	end

	local v556 = v555

	if not v556 then
		return false
	end

	Networking.Plant.PlantSeed:Fire(v556, p221, p222)

	return true
end
local function v557(p224)
	local v558 = v486.getHarvestTargets(p224, t43.HarvestNearest)

	for _, v in ipairs(v558) do
		if (not t43.HarvestSkipFavorited or not v.Favorited) and (not (t43.HarvestMinWeight > 0) or not (v.Weight < t43.HarvestMinWeight)) then
			Networking.Garden.CollectFruit:Fire(v.PlantId, v.FruitId)
			t43.LastHarvestAt = os.clock()
			v521("Harvest " .. v.PlantId)
		end
	end
end
local function v561(p225)
	for _, v in ipairs(v486.getGrowTargets(p225)) do
		Networking.GrowPlant:Fire(v)
	end
end
local function v564()
	local ok, result2 = pcall(function()
		return Networking.NPCS.PreviewSellAll:Fire()
	end)

	if ok and type(result2) == "table" then
		return result2
	end

	return nil
end
local function v567()
	local v568 = v564()

	if v568 then
		return tonumber(v568.TotalValue) or tonumber(v568.SellPrice) or tonumber(v568.Total) or 0
	end

	local n17 = 0

	for _, v in ipairs(v486.getTools(function(p226)
		return p226:GetAttribute("HarvestedFruit") == true and not v486.isLocalTool(p226)
	end)) do
		if not t43.SellSkipFavorited or not v:GetAttribute("IsFavorite") then
			local attribute = v:GetAttribute("Id")

			n17 += attribute and v486.getFruitBidValue(attribute) or v486.estimateToolFruitValue(v)
		end
	end

	return n17
end
local function v573()
	if not v486.hasSellableFruits(t43.SellSkipFavorited) then
		return false
	end

	local v574 = v564()
	local v575 = v574 and tonumber(v574.FruitCount) or 0

	if v574 and v575 > 100 then
		task.wait(0.5)
	end

	if t43.SellPreview and v574 then
		v521(("Sell preview %s"):format(v486.formatShortNumber(v567())))
	end

	local ok, result2 = pcall(function()
		return Networking.NPCS.SellAll:Fire()
	end)

	if not ok or type(result2) ~= "table" or not result2.Success then
		if ok then
			v521("SellAll fruits")
		end

		return false
	end

	v521(("Sold %d fruits for %s"):format(tonumber(result2.SoldCount) or 0, v486.formatShortNumber(tonumber(result2.SellPrice) or 0)))

	return true
end
local function v578()
	local v579 = v486.getEquippedPetIds()
	local n18 = 0

	for _, v in ipairs(v486.getTools(function(p227)
		return p227:GetAttribute("Pet") ~= nil and not v486.isLocalTool(p227)
	end)) do
		if t43.SellSkipFavorited then
			if v:GetAttribute("IsFavorite") then
				continue
			end
		end

		local attribute = v:GetAttribute("PetId") or v:GetAttribute("Id")

		if attribute and not v579[attribute] then
			local ok, result2 = pcall(function()
				return Networking.NPCS.SellPet:Fire(attribute)
			end)

			if ok and type(result2) == "table" and result2.Success then
				n18 += 1
			end

			task.wait(0.05)
		end
	end

	if n18 > 0 then
		v521(("Sold %d pets"):format(n18))
	end

	return n18 > 0
end
local function v586(p228)
	local attribute = p228:GetAttribute("SeedPack")

	if not attribute then
		return false
	end

	local ok, result2 = pcall(function()
		return Networking.SeedPack.OpenSeedPack:Fire(attribute)
	end)

	if not ok or type(result2) ~= "table" or result2.Success ~= true then
		return false
	end

	if t43.PackSnip then
		pcall(function()
			Networking.SeedPack.ConfirmSeedPack:Fire(attribute, result2.WonSeed or result2.SeedName or "", result2.SeedId or result2.Id or "")
		end)
	end

	v521("Opened pack " .. attribute)

	return true
end
local function v590(p229)
	local attribute = p229:GetAttribute("Egg")

	if not attribute then
		return false
	end

	local ok, result2 = pcall(function()
		return Networking.Egg.OpenEgg:Fire(attribute)
	end)

	if ok and type(result2) == "table" then
		if result2.Success == true then
			if t43.EggSnip then
				pcall(function()
					local ConfirmEgg = Networking.Egg.ConfirmEgg
					local v595 = ConfirmEgg
					local Fire = ConfirmEgg.Fire
					local v597 = attribute
					local PetName = result2.PetName or result2.WonPet

					PetName = PetName or ""

					local PetId = result2.PetId or result2.Id

					Fire(v595, v597, PetName, PetId or "")
				end)
			end

			return true
		end
	end

	return false
end
local function v600(p230)
	local attribute = p230:GetAttribute("Crate")

	if not attribute then
		return false
	end

	local ok, result2 = pcall(function()
		return Networking.Crate.OpenCrate:Fire(attribute)
	end)

	return ok and type(result2) == "table" and result2.Success == true
end
local function v604(p231, p232)
	for _, v in ipairs(v486.getTools(function(p233)
		return p233:GetAttribute(p231) ~= nil and not v486.isLocalTool(p233)
	end)) do
		if p232(v) then
			return true
		end
	end

	return false
end
local function v607(p234)
	local SellSkipFavorited = t43.SellSkipFavorited
	local AutoSellOnFull = t43.AutoSellOnFull and v486.isFruitInventoryNearlyFull(t43.SellFullThreshold)

	if t43.SellDelayAfterHarvest > 0 and not AutoSellOnFull and not p234 and os.clock() - t43.LastHarvestAt < t43.SellDelayAfterHarvest then
		return
	end

	local AutoSellFruits = (t43.AutoSellFruits or AutoSellOnFull or p234) and v486.hasSellableFruits(SellSkipFavorited)
	local AutoSellPets = (t43.AutoSellPets or p234) and v486.hasSellablePets(SellSkipFavorited)

	if AutoSellFruits and t43.SellMinValue > 0 and v567() < t43.SellMinValue then
		AutoSellFruits = false
	end

	if u508 then
		return
	end

	if not AutoSellFruits and not AutoSellPets then
		return
	end

	u508 = true
	task.spawn(function()
		local ok, result2 = pcall(function()
			if AutoSellFruits then
				v573()
			end

			if AutoSellPets then
				v578()
			end
		end)

		u508 = false

		if not ok then
			v521(("Sell error: %s"):format(tostring(result2)))
		end
	end)
end
local function v614()
	if u511 then
		return
	end

	if t43.OpenOnlyIfSpace and v486.isBackpackNearlyFull(0.98) then
		return
	end

	if not t43.AutoOpenPacks and not t43.AutoOpenEggs and not t43.AutoOpenCrates then
		return
	end

	u511 = true
	task.spawn(function()
		local ok, result2 = pcall(function()
			for match in string.gmatch(t43.OpenOrder, "([^,]+)") do
				local v618 = match:match("^%s*(.-)%s*$"):lower()

				if v618 == "packs" and t43.AutoOpenPacks and not t43.SkipSeedPacks then
					if v604("SeedPack", v586) then
						return
					end

					continue
				end

				if v618 == "eggs" and t43.AutoOpenEggs then
					if v604("Egg", v590) then
						return
					end

					continue
				end

				if v618 == "crates" and t43.AutoOpenCrates and v604("Crate", v600) then
					return
				end
			end
		end)

		u511 = false

		if not ok then
			v521(("Open error: %s"):format(tostring(result2)))
		end
	end)
end
local function v619()
	if not t43.AutoPlant then
		return
	end

	local v620, attribute = v486.getOwnedSeedToolFiltered(true, t43.PlantSeedFilter)

	if not v620 or not attribute then
		return
	end

	local SeedTool = v486.getEquippedToolWithAttribute("SeedTool")

	if SeedTool and not v486.isLocalTool(SeedTool) and v486.getSeedToolQuantity(SeedTool) > 0 and v486.matchesTextFilter(SeedTool:GetAttribute("SeedTool"), t43.PlantSeedFilter) then
		v620 = SeedTool
		attribute = SeedTool:GetAttribute("SeedTool")
	end

	v486.performHandAction(0.2, function()
		if v620.Parent == LocalPlayer.Character or v486.equipTool(v620) then
			v553(attribute, v620)
		end
	end)
end
local function v623()
	if not t43.AutoWater then
		return
	end

	if waterGarden() then
		n13 = os.clock()
	end
end
local function v624()
	if t43.AutoPlaceSprinkler then
		if placeSprinkler() then
			n14 = os.clock()
		end

		return
	end
end
local function v625()
	if t43.EquipGearName and t43.EquipGearName ~= "" then
		pcall(function()
			Networking.GearShop.EquipGear:Fire(t43.EquipGearName)
		end)

		return
	end
end
local function v626()
	pcall(function()
		Networking.Actions.ExpandGarden:Fire()
	end)
end
local function v627()
	if os.clock() - n12 < 0.55 then
		return false
	end

	local v628 = v486.getPlayerPlot()

	if not v628 then
		return false
	end

	local WateringCan = v486.getToolWithAttribute("WateringCan")

	if WateringCan then
		return v486.performHandAction(0.2, function()
			if not v486.equipTool(WateringCan) then
				return false
			end

			local v630 = v486.getRandomPlantAreaPosition(v628)

			if not v630 then
				return false
			end

			local attribute = WateringCan:GetAttribute("WateringCan")

			if not attribute or attribute == "" then
				return false
			end

			n12 = os.clock()
			pcall(function()
				Networking.WateringCan.UseWateringCan:Fire(v630 - Vector3.new(0, 0.3, 0), attribute, WateringCan)
			end)

			return true
		end) == true
	end

	return false
end
local function v632(p235)
	for _, v in ipairs(v486.getPotPlantTargets(p235)) do
		pcall(function()
			Networking.Garden.PotPlant:Fire(v)
		end)
	end
end
local function v635()
	local v636 = v486.getPlayerPlot()
	local v637 = v486.getPlotId()

	if v636 then
		if v637 then
			local v638 = v486.getSprinklerTool(t43.SelectedSprinkler)

			if v638 then
				return v486.performHandAction(0.25, function()
					if not v486.equipTool(v638) then
						return false
					end

					local v639 = v486.getRandomPlantAreaPosition(v636)

					if not v639 then
						return false
					end

					local attribute = v638:GetAttribute("Sprinkler")

					if attribute and attribute ~= "" then
						pcall(function()
							Networking.Place.PlaceSprinkler:Fire(v639, attribute, v638, v637)
						end)

						return true
					end

					return false
				end) == true
			end

			return false
		end
	end

	return false
end
local function v641(p236)
	for _, v in ipairs(v486.getWildPetInstances()) do
		local attribute = v:GetAttribute("PetName") or ""
		local v645 = v486.getPetRarity(attribute)

		if not v486.matchesTextFilter(attribute, t43.TameNameFilter) then
			continue
		end

		if not v486.matchesRarityFilter(v645, t43.TameRarityFilter) then
			continue
		end

		if v486.isLocalWildPet(v) then
			if v486.tryTameLocalWildPet(v) then
				p236 -= 1
			end
		else
			pcall(function()
				Networking.Pets.WildPetTame:Fire(v)
			end)
			p236 -= 1
		end

		if p236 <= 0 then
			break
		end
	end
end
local function v646(p237, p238)
	if u510 then
		return
	end

	u510 = true
	task.spawn(function()
		local ok, result2 = pcall(function()
			for _, v in ipairs(v486.getDroppedCollectibles(p237, p238)) do
				v486.collectDroppedItem(v)
			end
		end)

		u510 = false

		if not ok then
			v521(("Collect drops error: %s"):format(tostring(result2)))
		end
	end)
end
local function v651(p239)
	local v652 = v486.getShovelTool()

	if not v652 then
		return false
	end

	local attribute = v652:GetAttribute("Shovel")

	if attribute then
		return v486.performHandAction(0.25, function()
			if not v486.equipTool(v652) then
				return false
			end

			for _, v in ipairs(v486.getShovelTargets(p239, t43.ShovelSkipFavorited, t43.ShovelNameFilter)) do
				pcall(function()
					Networking.Shovel.UseShovel:Fire(v.PlantId, v.FruitId, attribute, v652)
				end)
			end

			return true
		end) == true
	end

	return false
end
local function v656(p240)
	local v657 = v486.getTrowelTool()

	if not v657 then
		return false
	end

	if v486.getPlayerPlot() then
		return v486.performHandAction(0.3, function()
			if not v486.equipTool(v657) then
				return false
			end

			for _, v in ipairs(v486.getTrowelTargets(p240, t43.TrowelNameFilter)) do
				local Model = v.Model
				local PrimaryPart = Model and (Model.PrimaryPart or Model:FindFirstChildWhichIsA("BasePart"))

				if PrimaryPart then
					local Position = PrimaryPart.Position

					pcall(function()
						Networking.Trowel.MovePlant:Fire(v.PlantId, Position, PrimaryPart.Orientation.Y)
					end)
				end
			end

			return true
		end) == true
	end

	return false
end
local function v663()
	if v486.getPlayerPlot() then
		local WateringCan = v486.getToolWithAttribute("WateringCan")

		if WateringCan then
			return v486.performHandAction(0.2, function()
				if not v486.equipTool(WateringCan) then
					return false
				end

				local attribute = WateringCan:GetAttribute("WateringCan")

				if not attribute then
					return false
				end

				for _, v in ipairs(v486.getDecayingPlantTargets(2)) do
					local PrimaryPart = v.PrimaryPart or v:FindFirstChildWhichIsA("BasePart")

					if PrimaryPart then
						pcall(function()
							Networking.WateringCan.UseWateringCan:Fire(PrimaryPart.Position - Vector3.new(0, 0.3, 0), attribute, WateringCan)
						end)
					end
				end

				return true
			end) == true
		end

		return false
	end

	return false
end
local function v669()
	local v670 = v486.getWeatherMachineProps()

	if #v670 == 0 then
		return
	end

	local ServerValues = ReplicatedStorage:FindFirstChild("ServerValues")
	local WeatherMachineData = ServerValues and ServerValues:FindFirstChild("WeatherMachineData")

	if not WeatherMachineData then
		return
	end

	local children = WeatherMachineData:GetChildren()

	if #children == 0 then
		return
	end

	n16 = n16 % #children + 1

	local v674 = children[n16]

	if not v674 then
		return
	end

	local Name = v674.Name
	local v676

	for _, v in ipairs(v670) do
		if v:GetAttribute("PropId") == Name then
			v676 = v

			break
		end
	end

	if not v676 then
		v676 = v670[1]
		Name = v676:GetAttribute("PropId") or Name
	end

	pcall(function()
		Networking.WeatherMachine.PlayerEntered:Fire(v676.Name, Name)
	end)
end
local function v679(p241)
	local v680 = tostring(p241 or "")

	if v680 == "" then
		return false
	end

	for _, v in ipairs(v486.getTools(function(p242)
		return p242:GetAttribute("Pet") ~= nil and not v486.isLocalTool(p242)
	end)) do
		if (v:GetAttribute("Pet") or v.Name) == v680 then
			if v.Parent == LocalPlayer.Character then
				return true
			end
		end
	end

	return false
end
local function v683()
	local v684 = false

	for _, v in ipairs({
		t43.PetEquipSlot1,
		t43.PetEquipSlot2,
		t43.PetEquipSlot3
	}) do
		if v and v ~= "" and not v679(v) then
			pcall(function()
				Networking.Pets.RequestEquipByName:Fire(v)
			end)
			v521("Equip pet " .. v)
			v684 = true
		end
	end

	if v684 then
		return
	end

	for _, v in ipairs(v486.getTools(function(p243)
		return p243:GetAttribute("Pet") ~= nil and not v486.isLocalTool(p243)
	end)) do
		local attribute = v:GetAttribute("Pet") or v.Name

		if v679(attribute) then
			continue
		end

		local v690 = v486.getPetRarity(attribute)

		if v486.matchesTextFilter(attribute, t43.PetEquipNameFilter) and v486.matchesRarityFilter(v690, t43.PetEquipRarity) then
			pcall(function()
				Networking.Pets.RequestEquipByName:Fire(attribute)
			end)
			v521("Equip pet " .. attribute)

			return
		end
	end
end
local function v691()
	for _, v in ipairs(v486.getTools(function(p244)
		return p244:GetAttribute("HarvestedFruit") == true and not v486.isLocalTool(p244)
	end)) do
		local attribute = v:GetAttribute("Id")
		local attribute2 = v:GetAttribute("Mutation")
		local AutoFavoriteInventory = t43.AutoFavoriteInventory

		if t43.AutoUnfavoriteInventory then
			AutoFavoriteInventory = false
		end

		if t43.AutoFavoriteMutations and attribute2 then
			for _, v2 in ipairs(t43.FavoriteMutationList) do
				if attribute2 == v2 then
					AutoFavoriteInventory = true

					break
				end
			end
		end

		if attribute and v:GetAttribute("IsFavorite") ~= AutoFavoriteInventory then
			pcall(function()
				Networking.Backpack.SetFruitFavorite:Fire(attribute, AutoFavoriteInventory)
			end)
			v:SetAttribute("IsFavorite", AutoFavoriteInventory and true or nil)
		end
	end
end
local function v699()
	for _, v in ipairs(v486.getPlotPlantModels()) do
		local attribute = v:GetAttribute("Mutation")
		local v703 = false

		if t43.AutoFavoriteFarm and attribute then
			for _, v2 in ipairs(t43.FavoriteMutationList) do
				if attribute == v2 then
					v703 = true

					break
				end
			end
		end

		if v703 then
			v:SetAttribute("IsFavorite", true)
			v:SetAttribute("Favorited", true)
		end
	end
end
local function v706()
	for _, v in ipairs(v486.getStealTargets(t43.StealBatch)) do
		if v486.tryStealFruit(v) then
			v521("Steal " .. v.PlantId)
		end
	end
end
local function v709(p245, p246)
	local v710 = tostring(t43.TraderWebhook or "")

	if v710 ~= "" and HttpService.HttpEnabled then
		pcall(function()
			HttpService:PostAsync(v710, HttpService:JSONEncode({
				content = ("[%s] %s"):format(p245 or "?", p246 or "")
			}), Enum.HttpContentType.ApplicationJson)
		end)

		return
	end
end
local function v711()
	if Networking.Gifting then
		if Networking.Gifting.Prompted then
			v500(Networking.Gifting.Prompted.OnClientEvent:Connect(function(p247)
				if t43.AutoAcceptGift and p247 then
					pcall(function()
						Networking.Gifting.Response:Fire(p247, true)
					end)
				end
			end))
		end
	end
end
local function v712()
	local function v713(p248)
		if not t43.AutoTrader or not p248 then
			return
		end

		local v714 = tostring(p248.Text or "")

		if v714:lower():find("trade", 1, true) then
			v709(p248.TextSource and p248.TextSource.Name, v714)
		end
	end

	pcall(function()
		local TextChatService = game:GetService("TextChatService")

		if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
			v500(TextChatService.MessageReceived:Connect(v713))
		end
	end)
	v500(LocalPlayer.Chatted:Connect(function(message)
		if t43.AutoTrader then
			if message:lower():find("trade", 1, true) then
				v709(LocalPlayer.Name, message)
			end
		end
	end))
end
local function v716(p249)
	local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
	local RollFrame_New = PlayerGui and PlayerGui:FindFirstChild("RollFrame_New")

	if RollFrame_New then
		RollFrame_New.Enabled = not p249
	end
end
local function v719()
	if t55.noclipDescConn then
		t55.noclipDescConn:Disconnect()
		t55.noclipDescConn = nil
	end

	if t55.noclipSaved then
		for k, v in pairs(t55.noclipSaved) do
			if k and k.Parent then
				k.CanCollide = v
			end
		end

		t55.noclipSaved = nil
	end
end
local function v722(p250)
	if not p250:IsA("BasePart") then
		return
	end

	t55.noclipSaved = t55.noclipSaved or {}

	if t55.noclipSaved[p250] == nil then
		t55.noclipSaved[p250] = p250.CanCollide
	end

	if p250.CanCollide then
		p250.CanCollide = false
	end
end
local function v723(p251)
	if not p251 then
		return
	end

	for _, descendant in ipairs(p251:GetDescendants()) do
		v722(descendant)
	end

	if t55.noclipDescConn then
		t55.noclipDescConn:Disconnect()
	end

	t55.noclipDescConn = p251.DescendantAdded:Connect(function(descendant)
		if t43.Noclip then
			v722(descendant)
		end
	end)
end
local function v726()
	if t55.noclipConn then
		t55.noclipConn:Disconnect()
		t55.noclipConn = nil
	end

	if t55.noclipCharConn then
		t55.noclipCharConn:Disconnect()
		t55.noclipCharConn = nil
	end

	if t55.noclipRemovingConn then
		t55.noclipRemovingConn:Disconnect()
		t55.noclipRemovingConn = nil
	end

	v719()
end
local function v727()
	v726()

	local RunService = game:GetService("RunService")

	t55.noclipSaved = {}

	local Character = LocalPlayer.Character

	if Character then
		v723(Character)
	end

	t55.noclipCharConn = LocalPlayer.CharacterAdded:Connect(function(character)
		if not t43.Noclip then
			return
		end

		task.defer(function()
			if t43.Noclip and character.Parent then
				v723(character)
			end
		end)
	end)

	if t55.noclipRemovingConn then
		t55.noclipRemovingConn:Disconnect()
	end

	t55.noclipRemovingConn = LocalPlayer.CharacterRemoving:Connect(function()
		t55.noclipSaved = {}
	end)
	t55.noclipConn = RunService.Heartbeat:Connect(function()
		if not t43.Noclip then
			return
		end

		local Character2 = LocalPlayer.Character

		if not Character2 then
			return
		end

		for _, descendant in ipairs(Character2:GetDescendants()) do
			if descendant:IsA("BasePart") and descendant.CanCollide then
				v722(descendant)
			end
		end
	end)
end
local function v733()
	local Lighting = game:GetService("Lighting")
	local UserInputService = game:GetService("UserInputService")

	v726()

	if t55.jumpConn then
		t55.jumpConn:Disconnect()
		t55.jumpConn = nil
	end

	if t43.Noclip then
		v727()
	end

	if t43.InfiniteJump then
		t55.jumpConn = UserInputService.JumpRequest:Connect(function()
			local Humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

			if Humanoid then
				Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end)
	end

	if t43.LowGraphics then
		if t55.savedGlobalShadows == nil then
			t55.savedGlobalShadows = Lighting.GlobalShadows
			pcall(function()
				t55.savedQualityLevel = settings().Rendering.QualityLevel
			end)
		end

		Lighting.GlobalShadows = false
		pcall(function()
			settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
		end)
	elseif t55.savedGlobalShadows ~= nil then
		Lighting.GlobalShadows = t55.savedGlobalShadows
		t55.savedGlobalShadows = nil

		if t55.savedQualityLevel ~= nil then
			pcall(function()
				settings().Rendering.QualityLevel = t55.savedQualityLevel
			end)
			t55.savedQualityLevel = nil
		end
	end

	if t55.colorEffect then
		t55.colorEffect:Destroy()
		t55.colorEffect = nil
	end

	if t43.BlackScreen or t43.WhiteScreen then
		local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
		local v738 = tonumber(t43.ScreenIntensity) or 1

		ColorCorrectionEffect.Brightness = t43.BlackScreen and -v738 or v738
		ColorCorrectionEffect.Parent = Lighting
		t55.colorEffect = ColorCorrectionEffect
	end

	local StarterGui = game:GetService("StarterGui")

	if t43.HideNotifications then
		if not t55.coreGuiSaved then
			t55.coreGuiSaved = true
			t55.savedCoreGui = {}

			for _, v in ipairs(Enum.CoreGuiType:GetEnumItems()) do
				t55.savedCoreGui[v] = StarterGui:GetCoreGuiEnabled(v)
			end
		end

		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
	elseif t55.coreGuiSaved then
		for k, v in pairs(t55.savedCoreGui) do
			StarterGui:SetCoreGuiEnabled(k, v)
		end

		t55.coreGuiSaved = false
		t55.savedCoreGui = {}
	end

	v716(t43.HideRollUi)
end

_G.__GAG2_APPLY_MOVEMENT = v733

local function v744()
	if Folder then
		Folder:Destroy()
		Folder = nil
	end
end

local Folder2

local function v746()
	if Folder2 then
		Folder2:Destroy()
		Folder2 = nil
	end

	if not t43.ShowDropEsp then
		return
	end

	Folder2 = Instance.new("Folder")
	Folder2.Name = "PR_GAG2_DropEsp"
	Folder2.Parent = Workspace

	for _, v in ipairs(v486.getDroppedCollectibles(true, true)) do
		local BillboardGui = Instance.new("BillboardGui")

		BillboardGui.Size = UDim2.fromOffset(100, 28)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.Parent = Folder2
		BillboardGui.Adornee = v.Part

		local TextLabel = Instance.new("TextLabel")

		TextLabel.Size = UDim2.fromScale(1, 1)
		TextLabel.BackgroundTransparency = 1
		TextLabel.TextColor3 = Color3.fromRGB(120, 255, 160)
		TextLabel.TextScaled = true
		TextLabel.Font = Enum.Font.GothamBold
		TextLabel.Text = v.Name or "Drop"
		TextLabel.Parent = BillboardGui
	end
end
local function v751()
	v744()
	v746()

	if not t43.ShowFruitPrices and not t43.ShowPetPrices then
		return
	end

	Folder = Instance.new("Folder")
	Folder.Name = "PR_GAG2_Prices"
	Folder.Parent = Workspace

	local function v752(p252, p253, p254)
		if not p252 then
			return
		end

		local BillboardGui = Instance.new("BillboardGui")

		BillboardGui.Size = UDim2.fromOffset(90, 26)
		BillboardGui.AlwaysOnTop = true
		BillboardGui.Parent = Folder
		BillboardGui.Adornee = p252

		local TextLabel = Instance.new("TextLabel")

		TextLabel.Size = UDim2.fromScale(1, 1)
		TextLabel.BackgroundTransparency = 1
		TextLabel.TextColor3 = p254
		TextLabel.TextScaled = true
		TextLabel.Font = Enum.Font.GothamBold
		TextLabel.Text = p253
		TextLabel.Parent = BillboardGui
	end

	if t43.ShowFruitPrices then
		for _, v in ipairs(v486.getTools(function(p255)
			return p255:GetAttribute("HarvestedFruit") == true
		end)) do
			v752(v486.getToolBillboardAdornee(v), v486.formatFruitPriceText(v:GetAttribute("FruitName") or v:GetAttribute("Fruit") or v.Name, v:GetAttribute("SizeMultiplier") or v:GetAttribute("Weight"), v:GetAttribute("Mutation"), v:GetAttribute("Id")), Color3.fromRGB(255, 220, 80))
		end

		for _, v in ipairs(v486.getGardenFruitOverlays()) do
			v752(v.Part, v486.formatFruitPriceText(v.FruitName, v.Weight, v.Mutation, v.FruitId), Color3.fromRGB(255, 200, 60))
		end
	end

	if t43.ShowPetPrices then
		for _, v in ipairs(v486.getTools(function(p256)
			return p256:GetAttribute("Pet") ~= nil
		end)) do
			v752(v486.getToolBillboardAdornee(v), v486.formatShortNumber(v486.estimatePetValue(v:GetAttribute("Pet") or v.Name)), Color3.fromRGB(120, 200, 255))
		end
	end
end
local function v761()
	if t43.HopMinSheckles > 0 and v486.getSheckles() < t43.HopMinSheckles then
		return false
	end

	if t43.HopOnlyIfEmptyGarden and not v486.isGardenEmpty() then
		return false
	end

	return true
end
local function v762()
	if v761() then
		v521("Server hop")
		pcall(function()
			Networking.AntiAfk.RequestHop:Fire()
		end)
		pcall(function()
			game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
		end)

		return
	end

	v521("Hop skipped (conditions)")
end
local function v763()
	pcall(function()
		v500(game:GetService("TeleportService").TeleportInitFailed:Connect(function()
			if t43.AutoReconnect then
				task.wait(5)
				v762()
			end
		end))
	end)

	if queue_on_teleport and t43.AutoExecuteUrl ~= "" then
		pcall(function()
			queue_on_teleport(t43.AutoExecuteUrl)
		end)
	end
end

local n19 = 0

local function v765()
	local Stats = game:GetService("Stats")

	while t53.schedulerRunning do
		task.wait(2)

		local n20 = 0

		pcall(function()
			n20 = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
		end)
		n15 = n20

		if n20 > 0 then
			now = os.clock()
			n19 = 0
		else
			n19 += 1
		end

		if t43.PingFreezeRejoin and n19 < 3 and t43.PingFreezeThreshold / 1000 < os.clock() - now then
			v762()
			now = os.clock()
		end
	end
end
local function v768()
	if Networking.Notification and Networking.Notification.OnClientEvent then
		v500(Networking.Notification.OnClientEvent:Connect(function(p257, p258)
			if t43.ErrorNotify then
				v520("Error", tostring(p257) .. " " .. tostring(p258), "Warning", 4)
			end
		end))
	end
end

local t59 = {
	Egg = v486.pickDefault(v486.EggOptions),
	Pack = v486.pickDefault(v486.PackOptions),
	Crate = v486.pickDefault(v486.CrateOptions),
	Gear = v486.pickDefault(v486.GearOptions),
	Pet = v486.pickDefault(v486.PetOptions),
	Seed = v486.pickDefault(v486.SeedOptions)
}

local function v770()
	local n21 = 0

	for _, v in ipairs(v486.getWildPetInstances()) do
		if v486.isLocalWildPet(v) then
			if v486.tryTameLocalWildPet(v) then
				n21 += 1
			end
		else
			pcall(function()
				Networking.Pets.WildPetTame:Fire(v)
			end)
			n21 += 1
		end
	end

	v520("Tame", ("Sent %d tame requests."):format(n21), n21 > 0 and "Success" or "Warning", 2)
end

v546("buySeeds", function()
	return t43.BuyInterval
end, function()
	if v533() or not t43.AutoBuySeeds then
		return
	end

	for _, v in ipairs(v486.getAffordableItems(v486.getShopStockRoot("SeedShop"), v486.SeedPrices, t43.BuyModeSeeds, t43.SelectedSeed, v522())) do
		v550(v)
		v521("Buy seed " .. v)
	end
end, function()
	return t43.AutoBuySeeds
end)
v546("buyGear", function()
	return t43.BuyInterval
end, function()
	if not v533() then
		if t43.AutoBuyGear then
			for _, v in ipairs(v486.getAffordableItems(v486.getShopStockRoot("GearShop"), v486.GearPrices, t43.BuyModeGear, t43.SelectedGear, v523())) do
				v551(v)
				v521("Buy gear " .. v)
			end

			return
		end
	end
end, function()
	return t43.AutoBuyGear
end)
v546("buyCrates", function()
	return t43.BuyInterval
end, function()
	if v533() or not t43.AutoBuyCrates then
		return
	end

	for _, v in ipairs(v486.getAffordableItems(v486.getShopStockRoot("CrateShop"), v486.CratePrices, t43.BuyModeCrates, t43.SelectedCrate, v524())) do
		v552(v)
		v521("Buy crate " .. v)
	end
end, function()
	return t43.AutoBuyCrates
end)
v546("plant", function()
	return t43.PlantInterval
end, v619, function()
	return t43.AutoPlant
end)
v546("water", function()
	return t43.WaterInterval
end, v623, function()
	return t43.AutoWater
end)
v546("sprinkler", function()
	return t43.SprinklerInterval
end, v624, function()
	return t43.AutoPlaceSprinkler
end)
v546("harvest", function()
	return t43.HarvestInterval
end, function()
	if t43.AutoHarvest then
		v557(t43.HarvestBatch)
	end
end, function()
	return t43.AutoHarvest
end)
v546("grow", function()
	return t43.GrowInterval
end, function()
	if t43.AutoGrow then
		v561(t43.GrowBatch)
	end
end, function()
	return t43.AutoGrow
end)
v546("sell", function()
	return t43.SellInterval
end, v607, function()
	return t43.AutoSellFruits or t43.AutoSellPets or t43.AutoSellOnFull
end)
v546("open", function()
	return t43.OpenInterval
end, v614, function()
	return t43.AutoOpenPacks or t43.AutoOpenEggs or t43.AutoOpenCrates
end)
v546("equipGear", function()
	return 2
end, v625, function()
	return t43.AutoEquipGear
end)
v546("antiafk", function()
	return 30
end, function()
	if t43.AntiAfk then
		v486.LocalPlayer:SetAttribute("AntiAfkIdleOverride", 999999)
		pcall(function()
			game:GetService("VirtualUser"):CaptureController()
			game:GetService("VirtualUser"):ClickButton2(Vector2.new())
		end)
	end
end, function()
	return t43.AntiAfk
end)
v546("expand", function()
	return t43.ExpandInterval
end, v626, function()
	return t43.AutoExpandGarden
end)
v546("pot", function()
	return t43.PotInterval
end, function()
	if t43.AutoPotPlant then
		v632(t43.PotBatch)
	end
end, function()
	return t43.AutoPotPlant
end)
v546("tame", function()
	return t43.TameInterval
end, function()
	if t43.AutoTameWildPets then
		v641(t43.TameBatch)
	end
end, function()
	return t43.AutoTameWildPets
end)
v546("drops", function()
	return t43.CollectDropInterval
end, function()
	if t43.AutoCollectDroppedSeeds then
		v646(true, false)
	end

	if t43.AutoCollectDroppedAcorns then
		v646(false, true)
	end
end, function()
	return t43.AutoCollectDroppedSeeds or t43.AutoCollectDroppedAcorns
end)
v546("shovel", function()
	return t43.ShovelInterval
end, function()
	if t43.AutoShovel then
		v651(t43.ShovelBatch)
	end
end, function()
	return t43.AutoShovel
end)
v546("trowel", function()
	return t43.TrowelInterval
end, function()
	if t43.AutoTrowel then
		v656(t43.TrowelBatch)
	end
end, function()
	return t43.AutoTrowel
end)
v546("reclaim", function()
	return t43.ReclaimInterval
end, function()
	if t43.AutoReclaimTrees then
		v663()
	end
end, function()
	return t43.AutoReclaimTrees
end)
v546("handLockWatch", function()
	return 1.5
end, function()
	if v486.handLockActive() and not v486.getEquippedActionTool() then
		local _handLockUntil = v486._handLockUntil or 0

		if _handLockUntil > 0 and _handLockUntil + 0.5 < os.clock() then
			v486.resetHandLock()
		end
	end
end)
v546("weatherSlot", function()
	return t43.WeatherSlotInterval
end, v669, function()
	return t43.AutoWeatherSlots
end)
v546("petEquip", function()
	return t43.PetEquipInterval
end, v683, function()
	return t43.AutoEquipPets
end)
v546("favorites", function()
	return 3
end, function()
	if t43.AutoFavoriteInventory or t43.AutoUnfavoriteInventory or t43.AutoFavoriteMutations then
		v691()
	end

	if t43.AutoFavoriteFarm then
		v699()
	end
end, function()
	return t43.AutoFavoriteInventory or t43.AutoUnfavoriteInventory or t43.AutoFavoriteMutations or t43.AutoFavoriteFarm
end)
v546("steal", function()
	return 2
end, function()
	if t43.AutoStealFruit then
		v706()
	end
end, function()
	return t43.AutoStealFruit
end)
v546("overlays", function()
	return 5
end, v751, function()
	return t43.ShowFruitPrices or t43.ShowPetPrices or t43.ShowDropEsp
end)
v546("hop", function()
	return t43.ServerHopInterval
end, v762, function()
	return t43.ServerHop
end)
v711()
v712()
v763()
v768()
task.spawn(v765)

local t60 = {}
local t61 = {}

local function v783()
	for _, v in ipairs(t60) do
		if v.stockShop then
			local v786 = v486.buildStockDropdown(v.stockShop, v.priceMap, v.specByName, t43.DropdownSort, v.labelToName)

			v.dropdown:SetOptions(v786)
		else
			local v787 = v486.sortNameList(v.names, t43.DropdownSort, v.specByName, v.priceMap, v.stockRoot)

			v.dropdown:SetOptions(v787)
		end
	end

	for _, v in ipairs(t61) do
		if v.grid then
			v.grid:SetItems(v486.sortGridItems(v.build(), t43.DropdownSort))
		end
	end
end
local function v790(p259, p260, p261, p262, p263, p264)
	table.insert(t60, {
		dropdown = p259,
		names = p260,
		specByName = p261,
		priceMap = p262,
		stockShop = p263,
		labelToName = p264,
		stockRoot = p263 and v486.getShopStockRoot(p263)
	})
end
local function v791()
	local v792 = v487:CreateTab({
		Name = "System"
	})
	local v793 = v792:CreateSection({
		Name = "Control",
		Side = "Left"
	})
	local v794 = v792:CreateSection({
		Name = "Profiles",
		Side = "Right"
	})
	local v795 = v792:CreateSection({
		Name = "Status",
		Side = "Left"
	})

	v793:AddDropdown({
		Text = "List sort",
		Options = v486.SORT_OPTIONS,
		Default = t43.DropdownSort,
		Callback = function(p265)
			t43.DropdownSort = p265
			v783()
		end
	})
	v793:AddButton({
		Text = "Unload script",
		Icon = "power",
		Callback = function()
			local value = rawget(_G, "__GAG2_UNLOAD")

			if value then
				value()
			end
		end
	})
	v794:AddInput({
		Text = "Profile name",
		Default = t43.ConfigProfileName,
		Placeholder = "default",
		Callback = function(p266)
			t43.ConfigProfileName = p266
		end
	})
	v794:AddButton({
		Text = "Save profile",
		Icon = "save",
		Callback = function()
			v534(t43.ConfigProfileName)
		end
	})
	v794:AddButton({
		Text = "Load profile",
		Icon = "folder-open",
		Callback = function()
			v539(t43.ConfigProfileName)
		end
	})
	v795:AddParagraph({
		Title = "Backpack",
		Content = ""
	})
	v795:AddButton({
		Text = "Refresh status",
		Icon = "refresh-cw",
		Callback = function()
			local v797 = v486.getMaxBackpackCapacity()
			local v798 = v486.countInventoryTools()

			v520("Status", ("Sheckles %s | Backpack %d/%d | Ping %dms"):format(v486.formatShortNumber(v486.getSheckles()), v798, v797, math.floor(n15)), "Info", 4)
		end
	})
	v795:AddButton({
		Text = "Show activity log",
		Icon = "list",
		Callback = function()
			v520("Log", table.concat(t45, "\n") or "Empty.", "Info", 8)
		end
	})
end
local function v799()
	local v800 = v487:CreateTab({
		Name = "Shops"
	})
	local v801 = v487:CreateTab({
		Name = "Garden"
	})
	local v802 = v487:CreateTab({
		Name = "Sell"
	})
	local v803 = v487:CreateTab({
		Name = "Pets"
	})
	local v804 = v487:CreateTab({
		Name = "Items"
	})
	local v805 = v487:CreateTab({
		Name = "Misc"
	})
	local v806 = v487:CreateTab({
		Name = "Info"
	})
	local v807 = v487:CreateTab({
		Name = "Movement"
	})
	local v808 = v487:CreateTab({
		Name = "Session"
	})
	local v809 = v487:CreateTab({
		Name = "Utility"
	})
	local v810 = v800:CreateSection({
		Name = "Seed shop",
		Side = "Left"
	})
	local v811 = v800:CreateSection({
		Name = "Gear shop",
		Side = "Right"
	})
	local v812 = v800:CreateSection({
		Name = "Crate shop",
		Side = "Right"
	})
	local v813 = v801:CreateSection({
		Name = "Planting",
		Side = "Left"
	})
	local v814 = v801:CreateSection({
		Name = "Harvest & grow",
		Side = "Right"
	})
	local v815 = v801:CreateSection({
		Name = "Collect drops",
		Side = "Left"
	})
	local v816 = v801:CreateSection({
		Name = "Tools",
		Side = "Right"
	})
	local v817 = v801:CreateSection({
		Name = "Garden extras",
		Side = "Right"
	})
	local v818 = v802:CreateSection({
		Name = "Auto sell",
		Side = "Left"
	})
	local v819 = v802:CreateSection({
		Name = "Favorites",
		Side = "Right"
	})
	local v820 = v803:CreateSection({
		Name = "Auto equip",
		Side = "Left"
	})
	local v821 = v803:CreateSection({
		Name = "Wild tame",
		Side = "Right"
	})
	local v822 = v804:CreateSection({
		Name = "Auto open",
		Side = "Left"
	})
	local v823 = v804:CreateSection({
		Name = "Gear equip",
		Side = "Right"
	})
	local v824 = v805:CreateSection({
		Name = "Actions",
		Side = "Left"
	})
	local v825 = v805:CreateSection({
		Name = "UI",
		Side = "Right"
	})
	local v826 = v806:CreateSection({
		Name = "Overlays",
		Side = "Left"
	})
	local v827 = v806:CreateSection({
		Name = "Tools",
		Side = "Right"
	})
	local v828 = v807:CreateSection({
		Name = "Player",
		Side = "Left"
	})
	local v829 = v807:CreateSection({
		Name = "Visual",
		Side = "Right"
	})
	local v830 = v808:CreateSection({
		Name = "Server",
		Side = "Left"
	})
	local v831 = v808:CreateSection({
		Name = "Monitor",
		Side = "Right"
	})
	local v832 = v809:CreateSection({
		Name = "Safety",
		Side = "Left"
	})
	local v833 = v809:CreateSection({
		Name = "Manual",
		Side = "Right"
	})

	v503("AutoBuySeeds", v810:AddToggle({
		Text = "Auto buy seeds",
		Default = t43.AutoBuySeeds,
		Callback = function(p267)
			t43.AutoBuySeeds = p267
		end
	}))

	if #v486.SeedOptions > 0 then
		local SeedShop = v486.buildStockDropdown("SeedShop", v486.SeedPrices, v486.SeedsByName, t43.DropdownSort, t48)

		v790(v810:AddDropdown({
			Text = "Seed",
			Options = SeedShop,
			Default = SeedShop[1],
			Searchable = true,
			Callback = function(p268)
				t43.SelectedSeed = v486.labelToName(t48, p268, t43.SelectedSeed)
			end
		}), nil, v486.SeedsByName, v486.SeedPrices, "SeedShop", t48)
	end

	v503("AutoBuyGear", v811:AddToggle({
		Text = "Auto buy gear",
		Default = t43.AutoBuyGear,
		Callback = function(p269)
			t43.AutoBuyGear = p269
		end
	}))

	if #v486.GearOptions > 0 then
		local GearShop = v486.buildStockDropdown("GearShop", v486.GearPrices, v486.GearByName, t43.DropdownSort, t49)

		v790(v811:AddDropdown({
			Text = "Gear",
			Options = GearShop,
			Default = GearShop[1],
			Searchable = true,
			Callback = function(p270)
				t43.SelectedGear = v486.labelToName(t49, p270, t43.SelectedGear)
			end
		}), nil, v486.GearByName, v486.GearPrices, "GearShop", t49)
	end

	v503("AutoBuyCrates", v812:AddToggle({
		Text = "Auto buy crates",
		Default = t43.AutoBuyCrates,
		Callback = function(p271)
			t43.AutoBuyCrates = p271
		end
	}))

	if #v486.CrateOptions > 0 then
		local CrateShop = v486.buildStockDropdown("CrateShop", v486.CratePrices, v486.CratesByName, t43.DropdownSort, t50)

		v790(v812:AddDropdown({
			Text = "Crate",
			Options = CrateShop,
			Default = CrateShop[1],
			Searchable = true,
			Callback = function(p272)
				t43.SelectedCrate = v486.labelToName(t50, p272, t43.SelectedCrate)
			end
		}), nil, v486.CratesByName, v486.CratePrices, "CrateShop", t50)
	end

	local v837 = v800:CreateSection({
		Name = "Buy settings",
		Side = "Left"
	})

	v503("BuyModeSeeds", v837:AddDropdown({
		Text = "Seed buy mode",
		Options = t51,
		Default = t43.BuyModeSeeds,
		Callback = function(p273)
			t43.BuyModeSeeds = p273
		end
	}))
	v503("BuyModeGear", v837:AddDropdown({
		Text = "Gear buy mode",
		Options = t51,
		Default = t43.BuyModeGear,
		Callback = function(p274)
			t43.BuyModeGear = p274
		end
	}))
	v503("BuyModeCrates", v837:AddDropdown({
		Text = "Crate buy mode",
		Options = t51,
		Default = t43.BuyModeCrates,
		Callback = function(p275)
			t43.BuyModeCrates = p275
		end
	}))
	v837:AddInput({
		Text = "Seed wishlist",
		Default = t43.SeedWishlist,
		Placeholder = "Acorn,Carrot",
		Callback = function(p276)
			t43.SeedWishlist = p276
		end
	})
	v837:AddInput({
		Text = "Gear wishlist",
		Default = t43.GearWishlist,
		Placeholder = "Shovel,Trowel",
		Callback = function(p277)
			t43.GearWishlist = p277
		end
	})
	v837:AddSlider({
		Text = "Maintain seed count",
		Min = 0,
		Max = 50,
		Default = t43.MaintainSeedCount,
		Increment = 1,
		Callback = function(p278)
			t43.MaintainSeedCount = p278
		end
	})
	v837:AddSlider({
		Text = "Buy max price",
		Min = 0,
		Max = 50000000,
		Default = t43.BuyMaxPrice,
		Increment = 1000,
		Callback = function(p279)
			t43.BuyMaxPrice = p279
		end
	})
	v837:AddToggle({
		Text = "Pause buy if backpack full",
		Default = false,
		Callback = function(p280)
			t43.BuyPauseIfFull = p280
		end
	})
	v837:AddSlider({
		Text = "Buy interval",
		Min = 0.05,
		Max = 2,
		Default = t43.BuyInterval,
		Increment = 0.05,
		Callback = function(p281)
			t43.BuyInterval = p281
		end
	})
	v503("AutoPlant", v813:AddToggle({
		Text = "Auto plant",
		Default = t43.AutoPlant,
		Callback = function(p282)
			t43.AutoPlant = p282
		end
	}))
	v813:AddSlider({
		Text = "Plant interval",
		Min = 0.05,
		Max = 2,
		Default = t43.PlantInterval,
		Increment = 0.05,
		Callback = function(p283)
			t43.PlantInterval = p283
		end
	})
	v503("PlantSeedFilter", v813:AddInput({
		Text = "Seed name filter",
		Default = t43.PlantSeedFilter or "",
		Placeholder = "partial name",
		Callback = function(p284)
			t43.PlantSeedFilter = p284
		end
	}))
	v503("PlantPositionMode", v813:AddDropdown({
		Text = "Plant position",
		Options = v486.PlantPositionModes,
		Default = t43.PlantPositionMode,
		Callback = function(p285)
			t43.PlantPositionMode = p285
		end
	}))
	v813:AddButton({
		Text = "Save plant position",
		Icon = "map-pin",
		Callback = function()
			local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart then
				t43.SavedPlantPosition = HumanoidRootPart.Position
				v520("Plant", "Position saved.", "Success", 2)
			end
		end
	})
	v813:AddDropdown({
		Text = "Plant layout",
		Options = {
			"Random",
			"Grid"
		},
		Default = t43.PlantLayout,
		Callback = function(p286)
			t43.PlantLayout = p286
		end
	})
	v813:AddSlider({
		Text = "Grid spacing",
		Min = 2,
		Max = 8,
		Default = t43.PlantGridSpacing,
		Increment = 0.5,
		Callback = function(p287)
			t43.PlantGridSpacing = p287
		end
	})
	v503("AutoHarvest", v814:AddToggle({
		Text = "Auto harvest",
		Default = t43.AutoHarvest,
		Callback = function(p288)
			t43.AutoHarvest = p288
		end
	}))
	v503("HarvestNearest", v814:AddToggle({
		Text = "Harvest nearest first",
		Default = t43.HarvestNearest,
		Callback = function(p289)
			t43.HarvestNearest = p289
		end
	}))
	v814:AddSlider({
		Text = "Min harvest weight",
		Min = 0,
		Max = 50,
		Default = t43.HarvestMinWeight,
		Increment = 0.1,
		Callback = function(p290)
			t43.HarvestMinWeight = p290
		end
	})
	v814:AddToggle({
		Text = "Skip favorited harvest",
		Default = false,
		Callback = function(p291)
			t43.HarvestSkipFavorited = p291
		end
	})
	v814:AddSlider({
		Text = "Harvest interval",
		Min = 0.05,
		Max = 2,
		Default = t43.HarvestInterval,
		Increment = 0.05,
		Callback = function(p292)
			t43.HarvestInterval = p292
		end
	})
	v814:AddSlider({
		Text = "Harvest batch",
		Min = 1,
		Max = 12,
		Default = t43.HarvestBatch,
		Increment = 1,
		Callback = function(p293)
			t43.HarvestBatch = p293
		end
	})
	v503("AutoGrow", v814:AddToggle({
		Text = "Auto grow plants",
		Default = t43.AutoGrow,
		Callback = function(p294)
			t43.AutoGrow = p294
		end
	}))
	v814:AddSlider({
		Text = "Grow batch",
		Min = 1,
		Max = 8,
		Default = t43.GrowBatch,
		Increment = 1,
		Callback = function(p295)
			t43.GrowBatch = p295
		end
	})
	v817:AddToggle({
		Text = "Auto expand garden",
		Default = false,
		Callback = function(p296)
			t43.AutoExpandGarden = p296
		end
	})
	v817:AddToggle({
		Text = "Auto water",
		Default = false,
		Callback = function(p297)
			t43.AutoWater = p297
		end
	})
	v817:AddToggle({
		Text = "Auto pot plants",
		Default = false,
		Callback = function(p298)
			t43.AutoPotPlant = p298
		end
	})
	v817:AddSlider({
		Text = "Pot batch",
		Min = 1,
		Max = 6,
		Default = t43.PotBatch,
		Increment = 1,
		Callback = function(p299)
			t43.PotBatch = p299
		end
	})
	v817:AddToggle({
		Text = "Auto place sprinkler",
		Default = false,
		Callback = function(p300)
			t43.AutoPlaceSprinkler = p300
		end
	})

	if #v486.SprinklerOptions > 0 then
		v790(v817:AddDropdown({
			Text = "Sprinkler",
			Options = v486.sortNameList(v486.SprinklerOptions, t43.DropdownSort),
			Default = t43.SelectedSprinkler,
			Searchable = true,
			Callback = function(p301)
				t43.SelectedSprinkler = p301
			end
		}), v486.SprinklerOptions)
	end

	v817:AddToggle({
		Text = "Auto weather slots",
		Default = false,
		Callback = function(p302)
			t43.AutoWeatherSlots = p302
		end
	})
	v817:AddSlider({
		Text = "Weather slot interval",
		Min = 3,
		Max = 60,
		Default = t43.WeatherSlotInterval,
		Increment = 1,
		Callback = function(p303)
			t43.WeatherSlotInterval = p303
		end
	})
	v815:AddToggle({
		Text = "Auto collect dropped seeds",
		Default = false,
		Callback = function(p304)
			t43.AutoCollectDroppedSeeds = p304
		end
	})
	v815:AddToggle({
		Text = "Auto collect acorns",
		Default = false,
		Callback = function(p305)
			t43.AutoCollectDroppedAcorns = p305
		end
	})
	v816:AddToggle({
		Text = "Auto shovel",
		Default = false,
		Callback = function(p306)
			t43.AutoShovel = p306
		end
	})
	v816:AddToggle({
		Text = "Skip favorited plants",
		Default = false,
		Callback = function(p307)
			t43.ShovelSkipFavorited = p307
		end
	})
	v816:AddInput({
		Text = "Shovel name filter",
		Default = "",
		Placeholder = "partial name",
		Callback = function(p308)
			t43.ShovelNameFilter = p308
		end
	})
	v816:AddToggle({
		Text = "Auto trowel",
		Default = false,
		Callback = function(p309)
			t43.AutoTrowel = p309
		end
	})
	v816:AddInput({
		Text = "Trowel name filter",
		Default = "",
		Placeholder = "partial name",
		Callback = function(p310)
			t43.TrowelNameFilter = p310
		end
	})
	v816:AddToggle({
		Text = "Auto reclaim trees",
		Default = false,
		Callback = function(p311)
			t43.AutoReclaimTrees = p311
		end
	})
	v503("AutoSellFruits", v818:AddToggle({
		Text = "Auto sell fruits",
		Default = t43.AutoSellFruits,
		Callback = function(p312)
			t43.AutoSellFruits = p312
		end
	}))
	v503("AutoSellPets", v818:AddToggle({
		Text = "Auto sell pets",
		Default = t43.AutoSellPets,
		Callback = function(p313)
			t43.AutoSellPets = p313
		end
	}))
	v818:AddToggle({
		Text = "Sell when fruit slots full",
		Default = false,
		Callback = function(p314)
			t43.AutoSellOnFull = p314
		end
	})
	v818:AddToggle({
		Text = "Skip favorited on sell",
		Default = true,
		Callback = function(p315)
			t43.SellSkipFavorited = p315
		end
	})
	v818:AddSlider({
		Text = "Fruit full threshold",
		Min = 0.5,
		Max = 1,
		Default = t43.SellFullThreshold,
		Increment = 0.05,
		Callback = function(p316)
			t43.SellFullThreshold = p316
		end
	})
	v818:AddSlider({
		Text = "Sell interval",
		Min = 1,
		Max = 10,
		Default = t43.SellInterval,
		Increment = 0.25,
		Callback = function(p317)
			t43.SellInterval = p317
		end
	})
	v503("SellMinValue", v818:AddSlider({
		Text = "Min sell value",
		Min = 0,
		Max = 10000000,
		Default = t43.SellMinValue,
		Increment = 100,
		Callback = function(p318)
			t43.SellMinValue = p318
		end
	}))
	v818:AddToggle({
		Text = "Preview before sell",
		Default = false,
		Callback = function(p319)
			t43.SellPreview = p319
		end
	})
	v818:AddSlider({
		Text = "Delay after harvest",
		Min = 0,
		Max = 10,
		Default = t43.SellDelayAfterHarvest,
		Increment = 0.5,
		Callback = function(p320)
			t43.SellDelayAfterHarvest = p320
		end
	})
	v818:AddButton({
		Text = "Preview sell value",
		Icon = "eye",
		Callback = function()
			v520("Preview", v486.formatShortNumber(v567()), "Info", 3)
		end
	})
	v819:AddToggle({
		Text = "Auto favorite mutations",
		Default = false,
		Callback = function(p321)
			t43.AutoFavoriteMutations = p321
		end
	})
	v819:AddToggle({
		Text = "Favorite inventory fruits",
		Default = false,
		Callback = function(p322)
			t43.AutoFavoriteInventory = p322
		end
	})
	v819:AddToggle({
		Text = "Unfavorite inventory fruits",
		Default = false,
		Callback = function(p323)
			t43.AutoUnfavoriteInventory = p323
		end
	})
	v819:AddToggle({
		Text = "Favorite farm plants",
		Default = false,
		Callback = function(p324)
			t43.AutoFavoriteFarm = p324
		end
	})

	local t62 = { "Any" }

	for _, rarityOption in ipairs(v486.RarityOptions) do
		table.insert(t62, rarityOption)
	end

	v503("PetEquipSlot1", v820:AddInput({
		Text = "Equip slot 1",
		Default = t43.PetEquipSlot1 or "",
		Placeholder = "Pet name",
		Callback = function(p325)
			t43.PetEquipSlot1 = p325
		end
	}))
	v503("PetEquipSlot2", v820:AddInput({
		Text = "Equip slot 2",
		Default = t43.PetEquipSlot2 or "",
		Placeholder = "Pet name",
		Callback = function(p326)
			t43.PetEquipSlot2 = p326
		end
	}))
	v503("PetEquipSlot3", v820:AddInput({
		Text = "Equip slot 3",
		Default = t43.PetEquipSlot3 or "",
		Placeholder = "Pet name",
		Callback = function(p327)
			t43.PetEquipSlot3 = p327
		end
	}))
	v820:AddToggle({
		Text = "Auto equip pets",
		Default = false,
		Callback = function(p328)
			t43.AutoEquipPets = p328
		end
	})
	v820:AddInput({
		Text = "Pet name filter",
		Default = "",
		Placeholder = "partial name",
		Callback = function(p329)
			t43.PetEquipNameFilter = p329
		end
	})
	v820:AddDropdown({
		Text = "Pet rarity",
		Options = t62,
		Default = t43.PetEquipRarity,
		Callback = function(p330)
			t43.PetEquipRarity = p330
		end
	})
	v821:AddToggle({
		Text = "Auto tame wild pets",
		Default = false,
		Callback = function(p331)
			t43.AutoTameWildPets = p331
		end
	})
	v821:AddInput({
		Text = "Tame name filter",
		Default = "",
		Placeholder = "partial name",
		Callback = function(p332)
			t43.TameNameFilter = p332
		end
	})
	v821:AddDropdown({
		Text = "Tame rarity",
		Options = t62,
		Default = t43.TameRarityFilter,
		Callback = function(p333)
			t43.TameRarityFilter = p333
		end
	})
	v821:AddSlider({
		Text = "Tame batch",
		Min = 1,
		Max = 6,
		Default = t43.TameBatch,
		Increment = 1,
		Callback = function(p334)
			t43.TameBatch = p334
		end
	})
	v822:AddToggle({
		Text = "Auto open seed packs",
		Default = false,
		Callback = function(p335)
			t43.AutoOpenPacks = p335
		end
	})
	v822:AddToggle({
		Text = "Auto open eggs",
		Default = false,
		Callback = function(p336)
			t43.AutoOpenEggs = p336
		end
	})
	v822:AddToggle({
		Text = "Auto open crates",
		Default = false,
		Callback = function(p337)
			t43.AutoOpenCrates = p337
		end
	})
	v822:AddToggle({
		Text = "Skip seed packs",
		Default = false,
		Callback = function(p338)
			t43.SkipSeedPacks = p338
		end
	})
	v822:AddToggle({
		Text = "Egg snip",
		Default = false,
		Callback = function(p339)
			t43.EggSnip = p339
		end
	})
	v822:AddToggle({
		Text = "Pack snip",
		Default = false,
		Callback = function(p340)
			t43.PackSnip = p340
		end
	})
	v503("OpenOrder", v822:AddInput({
		Text = "Open order",
		Default = t43.OpenOrder,
		Placeholder = "Crates,Eggs,Packs",
		Callback = function(p341)
			t43.OpenOrder = p341
		end
	}))
	v822:AddToggle({
		Text = "Open only if space",
		Default = false,
		Callback = function(p342)
			t43.OpenOnlyIfSpace = p342
		end
	})
	v822:AddSlider({
		Text = "Open interval",
		Min = 0.1,
		Max = 2,
		Default = t43.OpenInterval,
		Increment = 0.05,
		Callback = function(p343)
			t43.OpenInterval = p343
		end
	})
	v823:AddToggle({
		Text = "Auto equip gear",
		Default = false,
		Callback = function(p344)
			t43.AutoEquipGear = p344
		end
	})

	if #v486.GearOptions > 0 then
		v790(v823:AddDropdown({
			Text = "Gear to equip",
			Options = v486.sortNameList(v486.GearOptions, t43.DropdownSort, v486.GearByName, v486.GearPrices),
			Default = t43.EquipGearName,
			Searchable = true,
			Callback = function(p345)
				t43.EquipGearName = p345
			end
		}), v486.GearOptions, v486.GearByName, v486.GearPrices)
	end

	v824:AddToggle({
		Text = "Auto accept gifts",
		Default = false,
		Callback = function(p346)
			t43.AutoAcceptGift = p346
		end
	})
	v824:AddToggle({
		Text = "Auto trader webhook",
		Default = false,
		Callback = function(p347)
			t43.AutoTrader = p347
		end
	})
	v824:AddInput({
		Text = "Webhook URL",
		Default = "",
		Placeholder = "https://discord.com/api/webhooks/...",
		Callback = function(p348)
			t43.TraderWebhook = p348
		end
	})
	v824:AddToggle({
		Text = "Auto steal fruit (night)",
		Default = false,
		Callback = function(p349)
			t43.AutoStealFruit = p349
		end
	})
	v825:AddToggle({
		Text = "Hide roll UI",
		Default = false,
		Callback = function(p350)
			t43.HideRollUi = p350
			v716(p350)
		end
	})
	v826:AddToggle({
		Text = "Fruit price overlays",
		Default = false,
		Callback = function(p351)
			t43.ShowFruitPrices = p351
			v751()
		end
	})
	v826:AddToggle({
		Text = "Pet price overlays",
		Default = false,
		Callback = function(p352)
			t43.ShowPetPrices = p352
			v751()
		end
	})
	v826:AddToggle({
		Text = "Drop ESP",
		Default = false,
		Callback = function(p353)
			t43.ShowDropEsp = p353
			v746()
		end
	})
	v827:AddButton({
		Text = "Show plant list",
		Icon = "list",
		Callback = function()
			local t63 = {}

			for _, v in ipairs(v486.getPlotPlantModels()) do
				table.insert(t63, ("%s | age %s/%s"):format(v:GetAttribute("SeedName") or "?", tostring(v:GetAttribute("Age")), tostring(v:GetAttribute("MaxAge"))))
			end

			v520("Plants", table.concat(t63, "\n") or "No plants.", "Info", 6)
		end
	})
	v827:AddButton({
		Text = "Fruit value calc",
		Icon = "calculator",
		Callback = function()
			local n22 = 0

			for _, v in ipairs(v486.getTools(function(p354)
				return p354:GetAttribute("HarvestedFruit") == true
			end)) do
				local attribute = v:GetAttribute("Id")
				local v849 = attribute and v486.getFruitBidValue(attribute)

				if not v849 then
					v849 = v486.estimateFruitValue(v:GetAttribute("Fruit") or v.Name, v:GetAttribute("Weight"), v:GetAttribute("Mutation"))
				end

				n22 += v849
			end

			v520("Fruit value", v486.formatShortNumber(n22), "Info", 4)
		end
	})
	v827:AddButton({
		Text = "Pet value calc",
		Icon = "calculator",
		Callback = function()
			local n23 = 0

			for _, v in ipairs(v486.getTools(function(p355)
				return p355:GetAttribute("Pet") ~= nil
			end)) do
				n23 += v486.estimatePetValue(v:GetAttribute("Pet") or v.Name)
			end

			v520("Pet value", tostring(n23), "Info", 4)
		end
	})
	v828:AddToggle({
		Text = "Noclip",
		Default = false,
		Callback = function(p356)
			t43.Noclip = p356
			v733()
		end
	})
	v828:AddToggle({
		Text = "Infinite jump",
		Default = false,
		Callback = function(p357)
			t43.InfiniteJump = p357
			v733()
		end
	})
	v828:AddToggle({
		Text = "Low graphics",
		Default = false,
		Callback = function(p358)
			t43.LowGraphics = p358
			v733()
		end
	})
	v829:AddToggle({
		Text = "Black screen",
		Default = false,
		Callback = function(p359)
			t43.BlackScreen = p359
			t43.WhiteScreen = false
			v733()
		end
	})
	v829:AddToggle({
		Text = "White screen",
		Default = false,
		Callback = function(p360)
			t43.WhiteScreen = p360
			t43.BlackScreen = false
			v733()
		end
	})
	v829:AddSlider({
		Text = "Screen intensity",
		Min = 0.2,
		Max = 2,
		Default = t43.ScreenIntensity,
		Increment = 0.1,
		Callback = function(p361)
			t43.ScreenIntensity = p361
			v733()
		end
	})
	v829:AddToggle({
		Text = "Hide notifications",
		Default = false,
		Callback = function(p362)
			t43.HideNotifications = p362
			v733()
		end
	})
	v829:AddToggle({
		Text = "Hide watermark",
		Default = false,
		Callback = function(p363)
			t43.HideWatermark = p363
			pcall(function()
				local Instance_ = v4.Instance or v4.MainFrame and v4.MainFrame.Parent

				if Instance_ then
					local Watermark = Instance_:FindFirstChild("Watermark", true)

					if Watermark then
						if Watermark:IsA("GuiObject") then
							Watermark.Visible = not p363
						end
					end
				end
			end)
		end
	})
	v830:AddToggle({
		Text = "Server hop",
		Default = false,
		Callback = function(p364)
			t43.ServerHop = p364
		end
	})
	v830:AddSlider({
		Text = "Hop interval",
		Min = 60,
		Max = 1800,
		Default = t43.ServerHopInterval,
		Increment = 30,
		Callback = function(p365)
			t43.ServerHopInterval = p365
		end
	})
	v830:AddToggle({
		Text = "Hop only if garden empty",
		Default = false,
		Callback = function(p366)
			t43.HopOnlyIfEmptyGarden = p366
		end
	})
	v830:AddSlider({
		Text = "Min sheckles to hop",
		Min = 0,
		Max = 100000000,
		Default = t43.HopMinSheckles,
		Increment = 1000,
		Callback = function(p367)
			t43.HopMinSheckles = p367
		end
	})
	v830:AddInput({
		Text = "Auto execute URL",
		Default = "",
		Placeholder = "loadstring(...)",
		Callback = function(p368)
			t43.AutoExecuteUrl = p368
		end
	})
	v830:AddButton({
		Text = "Hop now",
		Icon = "refresh-cw",
		Callback = v762
	})
	v830:AddToggle({
		Text = "Auto reconnect",
		Default = false,
		Callback = function(p369)
			t43.AutoReconnect = p369
		end
	})
	v831:AddToggle({
		Text = "Rejoin on ping freeze",
		Default = false,
		Callback = function(p370)
			t43.PingFreezeRejoin = p370
		end
	})
	v831:AddSlider({
		Text = "Freeze threshold (ms)",
		Min = 3000,
		Max = 20000,
		Default = t43.PingFreezeThreshold,
		Increment = 500,
		Callback = function(p371)
			t43.PingFreezeThreshold = p371
		end
	})
	v831:AddToggle({
		Text = "Notify on errors",
		Default = false,
		Callback = function(p372)
			t43.ErrorNotify = p372
		end
	})
	v831:AddParagraph({
		Title = "Ping",
		Content = "Check Stats > Network in Roblox settings."
	})
	v832:AddToggle({
		Text = "Anti AFK",
		Default = false,
		Callback = function(p373)
			t43.AntiAfk = p373
		end
	})
	v833:AddButton({
		Text = "Sell fruits now",
		Icon = "coins",
		Callback = function()
			if v486.hasSellableFruits(t43.SellSkipFavorited) then
				local v855 = v573()

				v520("Sell", v855 and "Sold." or "SellAll sent.", v855 and "Success" or "Warning", 2)
			else
				v520("Sell", "No fruits.", "Warning", 2)
			end
		end
	})
	v833:AddButton({
		Text = "Sell pets now",
		Icon = "paw-print",
		Callback = function()
			if v486.hasSellablePets(t43.SellSkipFavorited) then
				local v856 = v578()

				v520("Sell", v856 and "Pets sold." or "Nothing sold.", v856 and "Success" or "Warning", 2)
			else
				v520("Sell", "No pets.", "Warning", 2)
			end
		end
	})
	v833:AddButton({
		Text = "Grow all ready",
		Icon = "zap",
		Callback = function()
			v561(12)
		end
	})
	v833:AddButton({
		Text = "Expand garden",
		Icon = "maximize",
		Callback = function()
			v626()
			v520("Garden", "ExpandGarden sent.", "Success", 2)
		end
	})
	v833:AddButton({
		Text = "Water once",
		Icon = "droplet",
		Callback = function()
			v627()
		end
	})
	v833:AddButton({
		Text = "Pot ready plants",
		Icon = "flower",
		Callback = function()
			v632(6)
		end
	})
	v833:AddButton({
		Text = "Place sprinkler",
		Icon = "crosshair",
		Callback = function()
			v635()
		end
	})
	v833:AddButton({
		Text = "Tame wild pets",
		Icon = "heart",
		Callback = function()
			v641(3)
		end
	})
end
local function v857(p374)
	local v858 = v487:CreateTab({
		Name = "Server"
	})
	local v859 = v858:CreateSection({
		Name = "Open items",
		Side = "Left"
	})
	local v860 = v858:CreateSection({
		Name = "Equip",
		Side = "Left"
	})
	local v861 = v858:CreateSection({
		Name = "World",
		Side = "Right"
	})

	v858:CreateSection({
		Name = "Info",
		Side = "Right"
	}):AddParagraph({
		Title = "Client spawn",
		Content = "Adds tools to backpack and visuals on map. No server remotes."
	})

	if #v486.PackOptions > 0 then
		v790(v859:AddDropdown({
			Text = "Pack",
			Options = v486.sortNameList(v486.PackOptions, t43.DropdownSort, v486.PacksByName),
			Default = t59.Pack,
			Searchable = true,
			Callback = function(p375)
				t59.Pack = p375
			end
		}), v486.PackOptions, v486.PacksByName)
		v859:AddButton({
			Text = "Open pack",
			Icon = "gift",
			Callback = function()
				p374.spinRoll(v486.getPackDropTable(t59.Pack), "", function(p376)
					p374.spawnSeedTool(p376, 1)
				end)
			end
		})
	end

	if #v486.EggOptions > 0 then
		v790(v859:AddDropdown({
			Text = "Egg",
			Options = v486.sortNameList(v486.EggOptions, t43.DropdownSort, v486.EggsByName),
			Default = t59.Egg,
			Searchable = true,
			Callback = function(p377)
				t59.Egg = p377
			end
		}), v486.EggOptions, v486.EggsByName)
		v859:AddButton({
			Text = "Open egg",
			Icon = "egg",
			Callback = function()
				p374.spinRoll(v486.getEggDropTable(t59.Egg), "", function(p378)
					p374.spawnPetTool(p378, "", "")
				end)
			end
		})
	end

	if #v486.CrateOptions > 0 then
		v790(v859:AddDropdown({
			Text = "Crate",
			Options = v486.sortNameList(v486.CrateOptions, t43.DropdownSort, v486.CratesByName, v486.CratePrices),
			Default = t59.Crate,
			Searchable = true,
			Callback = function(p379)
				t59.Crate = p379
			end
		}), v486.CrateOptions, v486.CratesByName, v486.CratePrices)
		v859:AddButton({
			Text = "Open crate",
			Icon = "box",
			Callback = function()
				p374.spinRoll(v486.getCrateDropTable(t59.Crate), "", function(p380)
					if v486.isPropName(p380) then
						p374.spawnPropTool(p380)
					else
						p374.spawnGearTool(p380)
					end
				end)
			end
		})
	end

	if #v486.GearOptions > 0 then
		v790(v860:AddDropdown({
			Text = "Gear",
			Options = v486.sortNameList(v486.GearOptions, t43.DropdownSort, v486.GearByName, v486.GearPrices),
			Default = t59.Gear,
			Searchable = true,
			Callback = function(p381)
				t59.Gear = p381
			end
		}), v486.GearOptions, v486.GearByName, v486.GearPrices)
		v860:AddButton({
			Text = "Spawn gear",
			Icon = "shield",
			Callback = function()
				p374.spawnGearTool(t59.Gear)
			end
		})
	end

	if #v486.PetOptions > 0 then
		v790(v860:AddDropdown({
			Text = "Pet",
			Options = v486.sortNameList(v486.PetOptions, t43.DropdownSort, v486.PetData),
			Default = t59.Pet,
			Searchable = true,
			Callback = function(p382)
				t59.Pet = p382
			end
		}), v486.PetOptions, v486.PetData)
		v860:AddButton({
			Text = "Spawn pet",
			Icon = "paw-print",
			Callback = function()
				p374.spawnPetTool(t59.Pet, "", "")
			end
		})
	end

	if #v486.SeedOptions > 0 then
		v790(v860:AddDropdown({
			Text = "Seed",
			Options = v486.sortNameList(v486.SeedOptions, t43.DropdownSort, v486.SeedsByName, v486.SeedPrices),
			Default = t59.Seed or v486.pickDefault(v486.SeedOptions),
			Searchable = true,
			Callback = function(p383)
				t59.Seed = p383
			end
		}), v486.SeedOptions, v486.SeedsByName, v486.SeedPrices)
		v860:AddButton({
			Text = "Spawn seed",
			Icon = "sprout",
			Callback = function()
				p374.spawnSeedTool(t59.Seed or v486.pickDefault(v486.SeedOptions), 1)
			end
		})
	end

	v790(v861:AddDropdown({
		Text = "Wild pet",
		Options = v486.sortNameList(v486.PetOptions, t43.DropdownSort, v486.PetData),
		Default = t59.Pet,
		Searchable = true,
		Callback = function(p384)
			t59.Pet = p384
		end
	}), v486.PetOptions, v486.PetData)
	v861:AddButton({
		Text = "Spawn wild pet",
		Icon = "map-pin",
		Callback = function()
			p374.spawnWildPet(t59.Pet, "", "")
		end
	})
	v861:AddButton({
		Text = "Spawn wild x5",
		Icon = "layers",
		Callback = function()
			task.spawn(function()
				for i = 1, 5 do
					p374.spawnWildPet(t59.Pet, "", "")
					task.wait(0.15)
				end
			end)
		end
	})
end
local function v863()
	local LocalPlayer2 = v486.LocalPlayer
	local RunService = game:GetService("RunService")
	local RollController = require(LocalPlayer2:WaitForChild("PlayerScripts"):WaitForChild("Controllers"):WaitForChild("RollController"))
	local Assets = v486.Assets
	local Seeds = Assets:WaitForChild("Seeds")
	local Eggs = Assets:WaitForChild("Eggs")
	local Pets = Assets:FindFirstChild("Pets")
	local Props = Assets:FindFirstChild("Props")
	local Plants = Assets:FindFirstChild("Plants")
	local SeedPacks = Assets:FindFirstChild("SeedPacks")
	local cFrame = CFrame.new(0, -0.5, 0.25)
	local t64 = {
		Seed = v486.pickDefault(v486.SeedOptions),
		Pet = v486.pickDefault(v486.PetOptions),
		PetSize = "",
		PetType = "",
		Egg = v486.pickDefault(v486.EggOptions),
		Pack = v486.pickDefault(v486.PackOptions),
		PackSeed = v486.pickDefault(v486.getPackSeedDropdownOptions(v486.pickDefault(v486.PackOptions))),
		Gear = v486.pickDefault(v486.GearOptions),
		Crate = v486.pickDefault(v486.CrateOptions),
		CrateItem = "",
		Fruit = v486.pickDefault(v486.FruitOptions),
		FruitWeight = 1,
		FruitMutation = "None",
		Prop = v486.pickDefault(v486.PropOptions),
		PreviewSeed = v486.pickDefault(v486.SeedOptions),
		PreviewPlant = v486.pickDefault(v486.SeedOptions),
		PreviewPet = v486.pickDefault(v486.PetOptions),
		PreviewPack = v486.pickDefault(v486.PackOptions),
		Phase = v486.pickDefault(v486.PhaseOptions),
		PhaseWeather = v486.getDefaultPhaseWeather(v486.pickDefault(v486.PhaseOptions)),
		WildPet = v486.pickDefault(v486.PetOptions),
		WildPetSize = "",
		WildPetType = "",
		WildPetInGarden = true,
		WildPetWander = true,
		WildPetLifetime = 300,
		EggPet = v486.pickDefault(v486.getEggPetDropdownOptions(v486.pickDefault(v486.EggOptions)))
	}

	if v486.PhaseWeathers[t64.Phase] and v486.getDefaultPhaseWeather(t64.Phase) ~= "" then
		t64.PhaseWeather = v486.getDefaultPhaseWeather(t64.Phase)
	end

	local n24 = 0
	local t65 = {}
	local connection

	local function v879()
		local n25 = 0

		for _, v in ipairs(v486.getWildPetInstances()) do
			if v486.isLocalWildPet(v) then
				n25 += 1
			end
		end

		return n25
	end
	local function v883(p385, p386, p387)
		local hit = Workspace:Raycast(Vector3.new(p385, p387 + 12, p386), Vector3.new(0, -40, 0))

		if hit then
			return hit.Position.Y
		end

		return p387
	end
	local function v885(p388, p389)
		if p388.inGarden then
			local v886 = v486.getPlayerPlot()

			if v886 then
				local v887 = v486.getRandomPlantPosition(v886)

				if v887 then
					return Vector3.new(v887.X, p389.Position.Y, v887.Z)
				end
			end
		end

		local Position = p389.Position
		local v889 = math.random() * math.pi * 2
		local v890 = 4 + math.random() * 9

		return Position + Vector3.new(math.cos(v889) * v890, 0, math.sin(v889) * v890)
	end
	local function v891()
		if connection then
			return
		end

		connection = RunService.Heartbeat:Connect(function(dt)
			if not next(t65) then
				connection:Disconnect()
				connection = nil

				return
			end

			for k, v in pairs(t65) do
				if k.Parent then
					local attribute = k:GetAttribute("SpawnedAt")
					local attribute2 = k:GetAttribute("Lifetime")

					if type(attribute) == "number" and type(attribute2) == "number" and attribute + attribute2 <= os.time() then
						t65[k] = nil
						k:Destroy()
					elseif v.wander then
						local now2 = os.clock()

						if v.idleUntil and now2 < v.idleUntil then
							k:SetAttribute("State", "")
						else
							local Position = k.Position
							local targetPos = v.targetPos

							if not targetPos then
								targetPos = v885(v, k)
								v.targetPos = targetPos
							end

							local vector3 = Vector3.new(targetPos.X - Position.X, 0, targetPos.Z - Position.Z)
							local Magnitude = vector3.Magnitude

							if Magnitude < 1.25 then
								v.targetPos = nil
								v.idleUntil = now2 + 1.5 + math.random() * 3
								k:SetAttribute("State", "")
							else
								k:SetAttribute("State", "wandering_walking")

								local v901 = Position + vector3.Unit * math.min(4.5 * dt, Magnitude)

								k.CFrame = CFrame.new(v901.X, v883(v901.X, v901.Z, Position.Y) + 1, v901.Z)
							end
						end
					else
						k:SetAttribute("State", "")
					end
				else
					t65[k] = nil
				end
			end
		end)
	end
	local function v902(p390)
		local PopVFXModel = v486.Assets:FindFirstChild("PopVFXModel")

		if not PopVFXModel then
			return
		end

		local clone = PopVFXModel:Clone()

		pcall(function()
			if clone:IsA("Model") then
				clone:PivotTo(CFrame.new(p390))
			elseif clone:IsA("BasePart") then
				clone.CFrame = CFrame.new(p390)
			end
		end)
		clone.Parent = Workspace
		task.defer(function()
			if not clone.Parent then
				return
			end

			for _, v in clone:GetDescendants() do
				if v:IsA("ParticleEmitter") then
					v:Emit(v:GetAttribute("EmitCount") or 1)
				end
			end

			task.delay(3, function()
				if clone.Parent then
					clone:Destroy()
				end
			end)
		end)
	end
	local function v907(p391, p392)
		if p391 and p391.Parent then
			if p392 then
				v902(p391.Position)
				p391:SetAttribute("OwnerUserId", LocalPlayer2.UserId)
				spawnPetTool(p392.petName, p392.petSize or "", p392.petType or "")
				task.delay(0.12, function()
					t65[p391] = nil

					if p391.Parent then
						p391:Destroy()
					end
				end)

				return
			end
		end
	end
	local function v908(p393, p394)
		task.defer(function()
			local v909 = v486.getWildPetSpawnsFolder()
			local v910 = ("WildPet_%s_%s"):format(p394.petName, p393.Name)
			local v911
			local v912 = os.clock() + 4

			while os.clock() < v912 do
				if v909 then
					v911 = v909:FindFirstChild(v910)
				end

				if not v911 then
					task.wait(0.05)

					continue
				end

				break
			end

			if not v911 then
				return
			end

			local PrimaryPart = v911.PrimaryPart or v911:FindFirstChildWhichIsA("BasePart")

			if not PrimaryPart then
				return
			end

			local BuyPrompt = PrimaryPart:FindFirstChild("BuyPrompt")

			if BuyPrompt and BuyPrompt:IsA("ProximityPrompt") then
				BuyPrompt.Triggered:Connect(function(player)
					if player ~= LocalPlayer2 then
						return
					end

					v907(p393, p394)
				end)

				return
			end
		end)
	end
	local function v915()
		for _, v in ipairs(v486.getWildPetInstances()) do
			if v486.isLocalWildPet(v) then
				t65[v] = nil
				v:Destroy()
			end
		end

		if connection then
			connection:Disconnect()
			connection = nil
		end

		v520("Wild pet", "Local wild pets cleared.", "Success", 2)
	end
	local function v918(p395)
		return Seeds:FindFirstChild(p395) or Seeds:FindFirstChild(p395 .. " Seed")
	end
	local function v919(p396)
		if Pets then
			local v920 = Pets:FindFirstChild(p396)

			if v920 then
				return v920
			end
		end

		return Assets:FindFirstChild(p396)
	end
	local function v921(p397)
		local v922 = v486.GearByName[p397]

		if v922 then
			return Assets:FindFirstChild(v922.ItemType or p397) or Assets:FindFirstChild(p397)
		end

		return nil
	end
	local function v923(p398)
		local v924 = v486.CratesByName[p398]

		if not v924 then
			return nil
		end

		local v925 = Assets:FindFirstChild(p398)

		if not v925 then
			v925 = Assets:FindFirstChild(v924.CrateType or p398)
		end

		return v925
	end
	local function v926(p399)
		for _, v in ipairs(v486.getTools(function(p400)
			return p400:GetAttribute("SeedTool") == p399 and v486.isLocalTool(p400)
		end)) do
			return v
		end
	end
	local function v929(p401, p402)
		v486.setSeedToolQuantity(p401, v486.getSeedToolQuantity(p401) + p402)
	end
	local function v930(p403)
		p403.Parent = LocalPlayer2:WaitForChild("Backpack")
		v486.triggerHandleControllers(p403)
	end
	local function v931(p404, p405)
		local v932 = tostring(p404 or "")
		local v933 = math.max(1, tonumber(p405) or 1)

		if v932 == "" then
			return
		end

		local v934 = v926(v932)

		if v934 then
			v929(v934, v933)
			v520("Seed", v932 .. " x" .. v933, "Success", 2)

			return
		end

		if not v918(v932) then
			v520("Seed", "Model not found.", "Warning", 3)

			return
		end

		local Tool = Instance.new("Tool")

		Tool.Name = v932 .. " Seed [X" .. v933 .. "]"
		Tool.RequiresHandle = true
		Tool.CanBeDropped = true
		Tool:SetAttribute("SeedTool", v932)
		Tool:SetAttribute("Count", v933)
		Tool:SetAttribute("MainCategory", "Seed")
		Tool.Grip = cFrame
		v486.markLocalTool(Tool)

		local v936 = v486.getSeedImageId(v932)

		if v936 ~= "" then
			Tool.TextureId = v936
		end

		v930(Tool)
		v520("Seed", v932, "Success", 2)
	end
	local function v937(p406, p407, p408)
		local v938 = tostring(p406 or "")

		if v938 == "" then
			return
		end

		local v939 = v919(v938)

		if not v939 or not v939:IsA("Model") then
			v520("Pet", "Model not found.", "Warning", 3)

			return
		end

		local v940 = HttpService:GenerateGUID(false)
		local Tool = Instance.new("Tool")

		Tool.Name = v486.PetSizes.DisplayName(v938, p407 ~= "" and p407 or nil)
		Tool.RequiresHandle = true
		Tool.CanBeDropped = true
		Tool:SetAttribute("MainCategory", "Pet")
		Tool:SetAttribute("Pet", v938)
		Tool:SetAttribute("PetId", v940)

		local Part = Instance.new("Part")

		Part.Name = "Handle"
		Part.Size = Vector3.new(0.2, 0.2, 0.2)
		Part.Transparency = 1
		Part.CanCollide = false
		Part.Massless = true
		Part.Parent = Tool

		if p407 ~= "" then
			Tool:SetAttribute("PetSize", p407)
		end

		if p408 ~= "" then
			Tool:SetAttribute("PetType", p408)
		end

		if p408 == v486.PetTypes.Rainbow then
			Tool:AddTag("PetRainbow")
		end

		v486.markLocalTool(Tool)

		local v943 = v486.getPetImageId(v938)

		if v943 ~= "" then
			Tool.TextureId = v943
		end

		v930(Tool)
		t1.bindLocalPetTool(Tool)

		local v944, v945 = v486.spawnLocalPetSlot(v940, v938, p407, p408)

		if v944 then
			local v946, v947 = v486.getPetFollowOffset(v945 or v486.getPetPartSlotIndex(v944))

			v944:SetAttribute("SlotOffsetX", v946)
			v944:SetAttribute("SlotOffsetZ", v947)
		end

		v486.simulatePetEquipped(v940, v938, p407, p408)
		v520("Pet", v938, "Success", 2)
	end
	local function v948(p409, p410, p411, p412)
		local Tool = Instance.new("Tool")

		Tool.Name = p409
		Tool.RequiresHandle = true
		Tool:SetAttribute(p410, p411)
		Tool:SetAttribute("Count", 1)
		v486.markLocalTool(Tool)

		if p412 then
			for k, v in pairs(p412) do
				Tool:SetAttribute(k, v)
			end
		end

		v930(Tool)
		v520("Spawner", p409, "Success", 2)
	end
	local function v952(p413)
		local name = tostring(p413 or "")

		if name == "" then
			return
		end

		if Eggs:FindFirstChild(name) then
			local Tool = Instance.new("Tool")

			Tool.Name = name
			Tool.RequiresHandle = true
			Tool:SetAttribute("Egg", name)
			Tool:SetAttribute("Count", 1)
			v486.markLocalTool(Tool)
			v930(Tool)
			v520("Egg", name, "Success", 2)

			return
		end

		v948(name, "Egg", name)
	end
	local function v955(p414)
		local name = tostring(p414 or "")

		if name == "" then
			return
		end

		local v957 = v486.GearByName[name]

		if not v957 then
			return
		end

		local s1, ItemName

		if v957.ItemType and string.find(v957.ItemType, "Sprinkler", 1, true) then
			s1 = "Sprinkler"
			ItemName = v957.ItemName
		elseif v957.ItemType and string.find(v957.ItemType, "Watering Can", 1, true) then
			s1 = "WateringCan"
			ItemName = v957.ItemName
		elseif v957.EquippableGear then
			s1 = "Gear"
			ItemName = name
		else
			s1 = v957.ItemType or "Gear"
			ItemName = name
		end

		local Tool = Instance.new("Tool")

		Tool.Name = name
		Tool.RequiresHandle = true
		Tool:SetAttribute(s1, ItemName)
		Tool:SetAttribute("Count", 1)
		v486.markLocalTool(Tool)
		v930(Tool)
		v520("Gear", name, "Success", 2)
	end
	local function v961(p415)
		local name = tostring(p415 or "")

		if name == "" then
			return
		end

		if not v923(name) then
			v520("Crate", "Model not found.", "Warning", 3)

			return
		end

		local Tool = Instance.new("Tool")

		Tool.Name = name
		Tool.RequiresHandle = true
		Tool:SetAttribute("Crate", name)
		Tool:SetAttribute("Count", 1)
		v486.markLocalTool(Tool)
		v930(Tool)
		v520("Crate", name, "Success", 2)
	end
	local function v964(p416)
		local name = tostring(p416 or "")

		if name == "" then
			return
		end

		if Props then
			if Props:FindFirstChild(name) then
				local Tool = Instance.new("Tool")

				Tool.Name = name
				Tool.RequiresHandle = true
				Tool.CanBeDropped = true
				Tool:SetAttribute("Build", name)
				Tool:SetAttribute("Count", 1)
				v486.markLocalTool(Tool)

				local v967 = v486.getPropImageId(name)

				if v967 ~= "" then
					Tool.TextureId = v967
				end

				v930(Tool)
				v520("Prop", name, "Success", 2)

				return
			end
		end

		v520("Prop", "Model not found.", "Warning", 3)
	end
	local function v968(p417, p418, p419)
		local v969 = tostring(p417 or "")
		local v970 = tonumber(p418) or 1

		if p419 == "None" then
		end

		local Fruits = Assets:FindFirstChild("Fruits")
		local v972 = Fruits and Fruits:FindFirstChild(v969)
		local Tool

		if v972 then
			local isTool = v972:IsA("Tool") and v972 or v972:FindFirstChildWhichIsA("Tool")

			if isTool then
				Tool = v486.FruitProxyUtil.CreateTool(isTool, {
					FruitName = v969,
					Weight = v970,
					Mutation = p419
				})
			end
		end

		if not Tool then
			Tool = Instance.new("Tool")
			Tool.RequiresHandle = true

			local Part = Instance.new("Part")

			Part.Name = "Handle"
			Part.Size = Vector3.new(0.3, 0.3, 0.3)
			Part.Transparency = 1
			Part.CanCollide = false
			Part.Parent = Tool
			v486.FruitProxyUtil.SetFruitAttributes(Tool, {
				FruitName = v969,
				Weight = v970,
				Mutation = p419
			})
		end

		Tool:SetAttribute("Id", HttpService:GenerateGUID(false))
		v486.markLocalTool(Tool)
		v930(Tool)
		v520("Fruit", v969, "Success", 2)
	end
	local function createFolder()
		local PR_GAG2_PREVIEW = Workspace:FindFirstChild("PR_GAG2_PREVIEW")

		if PR_GAG2_PREVIEW and PR_GAG2_PREVIEW:IsA("Folder") then
			return PR_GAG2_PREVIEW
		end

		local Folder3 = Instance.new("Folder")

		Folder3.Name = "PR_GAG2_PREVIEW"
		Folder3.Parent = Workspace

		return Folder3
	end
	local function v979()
		local Character = LocalPlayer2.Character

		if Character then
			return Character:FindFirstChild("HumanoidRootPart") or Character:FindFirstChild("UpperTorso")
		end

		return nil
	end
	local function v981(p420)
		local v982 = v979()

		if v982 then
			return v982.CFrame * CFrame.new(((p420 - 1) % 4 - 1.5) * 5, 0, -8 - math.floor((p420 - 1) / 4) * 5)
		end

		return CFrame.new(0, 6, 0)
	end
	local function v983(p421, p422)
		local v984 = v981(p422)

		if p421:IsA("Model") then
			local ok, _, result3 = pcall(function()
				return p421:GetBoundingBox()
			end)

			p421:PivotTo(v984 * CFrame.new(0, ok and result3 and math.max(result3.Y / 2, 1) or 2, 0))
		elseif p421:IsA("BasePart") then
			p421.CFrame = v984 * CFrame.new(0, math.max(p421.Size.Y / 2, 1), 0)
		end
	end
	local function v988(p423, p424)
		local v989 = tostring(p424 or "")
		local PlantModel

		if p423 == "Seed" then
			PlantModel = v918(v989)
		elseif p423 == "Plant" then
			local v991 = v486.SeedsByName[v989]

			if v991 and typeof(v991.PlantModel) == "Instance" then
				PlantModel = v991.PlantModel
			else
				PlantModel = Plants and Plants:FindFirstChild(v989)
			end
		elseif p423 == "Pet" then
			PlantModel = v919(v989)
		elseif p423 == "Pack" then
			local v992 = v486.PacksByName[v989]

			PlantModel = v992 and v992.Model or SeedPacks and SeedPacks:FindFirstChild(v989)
		end

		if not PlantModel then
			v520("Preview", "Asset not found.", "Warning", 3)

			return
		end

		local v993 = createFolder()

		if #v993:GetChildren() >= 24 then
			v993:ClearAllChildren()
			n24 = 0
		end

		local clone = PlantModel:Clone()

		n24 += 1
		clone.Name = ("Preview_%s_%s"):format(p423, v989)
		v486.preparePreview(clone)
		clone.Parent = v993
		v983(clone, n24)
		v520("Preview", v989, "Success", 2)
	end
	local function v995()
		local PR_GAG2_PREVIEW = Workspace:FindFirstChild("PR_GAG2_PREVIEW")

		if PR_GAG2_PREVIEW then
			PR_GAG2_PREVIEW:ClearAllChildren()
		end

		n24 = 0
	end
	local function v997(p425, p426, p427, p428)
		local v998 = tostring(p425 or "")

		if v998 == "" then
			return
		end

		local v999 = p428 or {}
		local inGarden = v999.inGarden ~= nil and v999.inGarden or t64.WildPetInGarden
		local wander = v999.wander ~= nil and v999.wander or t64.WildPetWander
		local v1002 = tonumber(v999.lifetime or t64.WildPetLifetime) or 300

		if v879() >= 24 then
			v520("Wild pet", "Local wild limit reached.", "Warning", 3)

			return
		end

		if not v919(v998) then
			v520("Wild pet", "Model not found.", "Warning", 3)

			return
		end

		local v1003 = v486.getWildPetRefFolder()

		if not v1003 then
			v520("Wild pet", "Map not loaded.", "Warning", 3)

			return
		end

		local Position

		if inGarden then
			local v1005 = v486.getPlayerPlot()

			if v1005 then
				Position = v486.getRandomPlantPosition(v1005)
			end
		end

		if not Position then
			local v1006 = v979()

			if v1006 then
				Position = (v1006.CFrame * CFrame.new(math.random(-5, 5), 0, -8 - math.random(0, 5))).Position
			else
				Position = Vector3.new(0, 5, 0)
			end
		end

		local v1007 = v883(Position.X, Position.Z, Position.Y)
		local Part = Instance.new("Part")

		Part.Name = "WildPetSpawn_" .. HttpService:GenerateGUID(false)
		Part.Anchored = true
		Part.CanCollide = false
		Part.CanQuery = false
		Part.CanTouch = false
		Part.Transparency = 1
		Part.Size = Vector3.new(2, 2, 2)
		Part.CFrame = CFrame.new(Position.X, v1007 + 1, Position.Z)

		local v1009 = v486.getPetSpec(v998)

		Part:SetAttribute("PetName", v998)
		Part:SetAttribute("Rarity", v1009 and v1009.Rarity or "Common")
		Part:SetAttribute("Price", v486.getWildPetPrice(v998))
		Part:SetAttribute("OwnerUserId", 0)
		Part:SetAttribute("SpawnedAt", os.time())
		Part:SetAttribute("Lifetime", math.clamp(v1002, 30, 900))
		Part:SetAttribute(v486.LOCAL_WILD_ATTR, true)

		if p426 ~= "" then
			Part:SetAttribute("PetSize", p426)
		end

		if p427 ~= "" then
			Part:SetAttribute("PetType", p427)
		end

		Part:SetAttribute("State", "")
		Part.Parent = v1003

		local t66 = {
			petName = v998,
			petSize = p426,
			petType = p427,
			wander = wander,
			inGarden = inGarden,
			targetPos = nil,
			idleUntil = os.clock() + math.random() * 1.5
		}

		t65[Part] = t66
		v891()
		v908(Part, t66)
		v520("Wild pet", v998, "Success", 2)
	end
	local function v1011(p429, p430, p431, p432)
		local v1012 = math.clamp(math.floor(tonumber(p432) or 1), 1, 5)

		task.spawn(function()
			for i = 1, v1012 do
				v997(p429, p430, p431)
				task.wait(0.08)
			end
		end)
	end

	v486._tryTameLocalWildPet = function(p433)
		local v1014 = t65[p433]

		if not v1014 then
			return false
		end

		v907(p433, v1014)

		return true
	end

	local function v1015()
		for _, v in ipairs(v486.getWildPetInstances()) do
			if v486.isLocalWildPet(v) then
				if not t65[v] then
					local attribute = v:GetAttribute("PetName") or ""

					if attribute ~= "" then
						local t67 = {
							petName = attribute,
							petSize = v:GetAttribute("PetSize") or "",
							petType = v:GetAttribute("PetType") or "",
							wander = t64.WildPetWander,
							inGarden = t64.WildPetInGarden,
							targetPos = nil,
							idleUntil = os.clock() + math.random()
						}

						t65[v] = t67
						v908(v, t67)
					end
				end
			end
		end

		if next(t65) then
			v891()
		end
	end
	local function v1020(p434, p435, p436)
		if u509 then
			v520("Roll", "Spinner busy.", "Warning", 2)

			return
		end

		if #p434 == 0 then
			v520("Roll", "Empty table.", "Warning", 3)

			return
		end

		local v1021 = v486.enrichRollDropTable(p434)
		local v1022
		local v1023 = tostring(p435 or "")

		if v1023 ~= "" then
			for _, v in ipairs(v1021) do
				if v.Name == v1023 then
					v1022 = v486.enrichRollDropRow(v)

					break
				end
			end
		end

		u509 = true
		task.spawn(function()
			local ok, result2 = pcall(function()
				local v1028 = RollController:Roll(v1021, v1022)
				local Name = v1028 and v1028.Name or v1022 and v1022.Name

				if p436 and Name then
					p436(Name)
				end
			end)

			u509 = false

			if not ok then
				v520("Roll", tostring(result2), "Warning", 3)
			end
		end)
	end

	local WeatherValues = ReplicatedStorage:WaitForChild("WeatherValues")

	local function v1031(p437, p438)
		local v1032 = tostring(p437 or "")

		if v1032 == "" then
			return
		end

		local v1033 = v1032 .. "_Playing"
		local v1034 = v1032 .. "_EndTime"

		if p438 then
			WeatherValues:SetAttribute(v1033, true)
			WeatherValues:SetAttribute(v1034, DateTime.now().UnixTimestamp + 600)
		else
			WeatherValues:SetAttribute(v1033, false)
			WeatherValues:SetAttribute(v1034, 0)
		end
	end
	local function v1035(p439, p440)
		local v1036 = tostring(p439 or "")

		if v1036 == "" then
			return
		end

		Workspace:SetAttribute("ActivePhase", v1036)

		local Night = ReplicatedStorage:FindFirstChild("Night")

		if Night and Night:IsA("BoolValue") then
			Night.Value = v1036:lower():find("night", 1, true) ~= nil
		end

		local v1038 = p440

		if not v1038 or v1038 == "" then
			v1038 = v486.getDefaultPhaseWeather(v1036)
		end

		if v1038 and v1038 ~= "" then
			Workspace:SetAttribute("ActiveWeather", v1038)
		end

		Workspace:SetAttribute("TimeFrozen", true)
	end
	local function v1039()
		task.spawn(function()
			for _, seedOption in ipairs(v486.SeedOptions) do
				v931(seedOption, 1)
				task.wait(0.05)
			end

			v520("Bulk", "All seeds spawned.", "Success", 2)
		end)
	end
	local function v1042()
		task.spawn(function()
			for _, gearOption in ipairs(v486.GearOptions) do
				v955(gearOption)
				task.wait(0.05)
			end

			v520("Bulk", "All gear spawned.", "Success", 2)
		end)
	end
	local function v1045(p441)
		if typeof(getconnections) ~= "function" then
			return
		end

		for _, v in ipairs(getconnections(p441)) do
			pcall(function()
				v:Disconnect()
			end)
		end
	end

	local t68 = {}
	local t69 = {}
	local t70 = {}
	local t71 = {}
	local u1052 = false
	local GuiController = require(LocalPlayer2.PlayerScripts.Controllers.GuiController)

	local function v1054(p442)
		local v1055 = LocalPlayer2.PlayerGui:FindFirstChild(p442)

		if not v1055 then
			return nil
		end

		local Frame = v1055:FindFirstChild("Frame")

		if Frame then
			return Frame:FindFirstChild("NormalShop") or Frame:FindFirstChild("ScrollingFrame")
		end

		return nil
	end
	local function v1057(p443, p444)
		if p443 then
			local Sheckles_Shelf = p443:FindFirstChild("Sheckles_Shelf")

			if Sheckles_Shelf and Sheckles_Shelf.Visible then
				local v1059 = Sheckles_Shelf.LayoutOrder - 1

				for _, child in ipairs(p443:GetChildren()) do
					if child:IsA("GuiObject") and child.Name ~= "ItemTemplate" and child.LayoutOrder == v1059 then
						return child.Name
					end
				end
			end
		end

		return t68[p444]
	end
	local function v1062(p445, p446, p447, p448)
		if t69[p445] then
			return false
		end

		v1045(p445.Activated)

		if p445.MouseButton1Click then
			v1045(p445.MouseButton1Click)
		end

		p445.Activated:Connect(function()
			local v1063 = v1057(p446, p447)

			if not v1063 then
				v520("Glitch", "Select an item first.", "Warning", 2)

				return
			end

			t71[p447] = true
			p448(v1063)
			t71[p447] = false
		end)
		t69[p445] = true

		return true
	end
	local function v1064(p449, p450, p451)
		if not p449 or t70[p449] then
			return
		end

		t70[p449] = true

		local function v1065(child)
			if not child:IsA("GuiObject") or child.Name == "ItemTemplate" then
				return
			end

			local Name = child.Name

			if not p451(Name) then
				return
			end

			local Main_Frame = child:FindFirstChild("Main_Frame")
			local TextButton = Main_Frame and Main_Frame:FindFirstChild("TextButton")

			if TextButton then
				TextButton.Activated:Connect(function()
					t68[p450] = Name
				end)
			end
		end

		for _, child in ipairs(p449:GetChildren()) do
			v1065(child)
		end

		p449.ChildAdded:Connect(v1065)
	end
	local function v1071(p452, p453)
		local v1072 = p453 or 8
		local v1073 = os.clock() + v1072

		while true do
			if not (os.clock() < v1073) then
				return false
			end

			for _, child in ipairs(p452:GetChildren()) do
				if child:IsA("GuiObject") and child.Name ~= "ItemTemplate" then
					return true
				end
			end

			task.wait(0.1)
		end
	end
	local function v1076(p454, p455, p456)
		local n26 = 0

		if not p454 then
			return n26
		end

		local Sheckles_Shelf = p454:FindFirstChild("Sheckles_Shelf")

		if not Sheckles_Shelf then
			return n26
		end

		local Main_Frame = Sheckles_Shelf:FindFirstChild("Main_Frame")
		local Buttons = Main_Frame and Main_Frame:FindFirstChild("Buttons")

		if not Buttons then
			return n26
		end

		local BuyButton = Buttons:FindFirstChild("BuyButton")

		if BuyButton and v1062(BuyButton, p454, p455, p456) then
			n26 += 1
		end

		return n26
	end
	local function v1082(p457, p458, p459)
		if not GuiController:IsOpen(p457) then
			GuiController:Open(p457)
		end

		local v1083 = v1054(p457)

		if not v1083 then
			return 0
		end

		v1071(v1083, 8)
		v1064(v1083, p457, p458)

		return v1076(v1083, p457, p459)
	end
	local function v1084()
		if u1052 then
			return
		end

		local Networking2 = v486.Networking

		local function v1086(p460, p461, p462)
			if not p460 or p460._gag2GlitchHook then
				return
			end

			local Fire = p460.Fire

			p460.Fire = function(p463, p464, ...)
				if t71[p461] then
					p462(p464)

					return
				end

				return Fire(p463, p464, ...)
			end
			p460._gag2GlitchHook = true
		end

		v1086(Networking2.SeedShop.PurchaseSeed, "SeedShop", function(p465)
			v931(p465, 1)
		end)
		v1086(Networking2.GearShop.PurchaseGear, "GearShop", function(p466)
			v955(p466)
		end)
		v1086(Networking2.CrateShop.PurchaseCrate, "CrateShop", function(p467)
			v961(p467)
		end)
		u1052 = true
	end
	local function v1088()
		v1084()

		local SeedShop = v1082("SeedShop", function(p468)
			return v486.SeedsByName[p468] ~= nil
		end, function(p469)
			v931(p469, 1)
		end)

		v520("Glitch", ("Seed shop: %d buy buttons hooked."):format(SeedShop), SeedShop > 0 and "Success" or "Warning", 3)
	end
	local function v1090()
		v1084()

		local GearShop = v1082("GearShop", function(p470)
			return v486.GearByName[p470] ~= nil
		end, function(p471)
			v955(p471)
		end)

		v520("Glitch", ("Gear shop: %d buy buttons hooked."):format(GearShop), GearShop > 0 and "Success" or "Warning", 3)
	end
	local function v1092()
		v1084()

		local CrateShop = v1082("CrateShop", function(p472)
			return v486.CratesByName[p472] ~= nil
		end, function(p473)
			v961(p473)
		end)

		v520("Glitch", ("Crate shop: %d buy buttons hooked."):format(CrateShop), CrateShop > 0 and "Success" or "Warning", 3)
	end
	local function v1094()
		v1088()
		v1090()
		v1092()
	end
	local function v1095(p474)
		if not (LocalPlayer2:FindFirstChild("PlayerGui") and LocalPlayer2.PlayerGui:FindFirstChild(p474)) then
			v520("Shop", p474 .. " not found.", "Warning", 2)

			return false
		end

		GuiController:Open(p474)
		v520("Shop", p474 .. " opened.", "Success", 2)

		return true
	end
	local function v1096(p475)
		t71[p475] = false

		if GuiController:IsOpen(p475) then
			GuiController:Close()
			v520("Shop", p475 .. " closed.", "Success", 2)

			return true
		end

		local v1097 = LocalPlayer2.PlayerGui:FindFirstChild(p475)

		if v1097 then
			v1097.Enabled = false
		end

		return false
	end

	v501(function()
		if connection then
			connection:Disconnect()
			connection = nil
		end
	end)
	v1015()

	return {
		Selected = t64,
		PreviewFolderName = "PR_GAG2_PREVIEW",
		PreviewCount = n24,
		spawnSeedTool = v931,
		spawnPetTool = v937,
		spawnGenericTool = v948,
		spawnEggTool = v952,
		spawnGearTool = v955,
		spawnCrateTool = v961,
		spawnPropTool = v964,
		spawnFruitTool = v968,
		spawnPreview = v988,
		spawnWildPet = v997,
		spawnWildPetBulk = v1011,
		clearLocalWildPets = v915,
		spinRoll = v1020,
		setWeather = v1031,
		setPhase = v1035,
		spawnAllSeeds = v1039,
		spawnAllGear = v1042,
		glitchSeedShop = v1088,
		glitchGearShop = v1090,
		glitchCrateShop = v1092,
		glitchAllShops = v1094,
		openShopGui = v1095,
		closeShopGui = v1096,
		clearPreviews = v995,
		WeatherValues = WeatherValues
	}
end
local function v1098(p476)
	local Selected = p476.Selected
	local WeatherValues = p476.WeatherValues
	local v1101 = v487:CreateTab({
		Name = "Local spawn"
	})
	local v1102 = v487:CreateTab({
		Name = "Local rolls"
	})
	local v1103 = v487:CreateTab({
		Name = "Preview"
	})
	local v1104 = v487:CreateTab({
		Name = "Local world"
	})
	local v1105 = v487:CreateTab({
		Name = "Client weather"
	})
	local v1106 = v487:CreateTab({
		Name = "Shop glitch"
	})

	local function v1107(p477, p478, p479, p480, p481, p482, p483)
		if #p479 == 0 then
			return
		end

		local v1108 = p477:AddDropdown({
			Text = p478,
			Options = v486.sortNameList(p479, t43.DropdownSort, p482, p483),
			Default = p480,
			Searchable = true,
			Callback = p481
		})

		v790(v1108, p479, p482, p483)

		return v1108
	end
	local function v1109(p484)
		p484:CreateSection({
			Name = "Sort",
			Side = "Right"
		}):AddDropdown({
			Text = "Sort",
			Options = v486.SORT_OPTIONS,
			Default = t43.DropdownSort,
			Callback = function(p485)
				t43.DropdownSort = p485
				v783()
			end
		})
	end

	local v1110 = v1101:CreateSection({
		Name = "Seeds",
		Side = "Left"
	})

	v1101:CreateSection({
		Name = "Info",
		Side = "Right"
	}):AddParagraph({
		Title = "Local only",
		Content = "Marked PR_GAG2_Local. Autofarm ignores them. Pets spawn tool + follower slot. Server tabs use real remotes."
	})

	local v1111 = v1101:CreateSection({
		Name = "Pets",
		Side = "Left"
	})
	local v1112 = v1101:CreateSection({
		Name = "Items",
		Side = "Right"
	})
	local v1113 = v1101:CreateSection({
		Name = "Fruits",
		Side = "Right"
	})

	v1107(v1110, "Seed", v486.SeedOptions, Selected.Seed, function(p486)
		Selected.Seed = p486
	end, v486.SeedsByName, v486.SeedPrices)
	v1110:AddButton({
		Text = "Spawn seed",
		Icon = "sprout",
		Callback = function()
			p476.spawnSeedTool(Selected.Seed, 1)
		end
	})
	v1110:AddButton({
		Text = "Spawn x10",
		Icon = "layers",
		Callback = function()
			p476.spawnSeedTool(Selected.Seed, 10)
		end
	})
	v1110:AddButton({
		Text = "Spawn all seeds",
		Icon = "grid-3x3",
		Callback = p476.spawnAllSeeds
	})
	v1107(v1111, "Pet", v486.PetOptions, Selected.Pet, function(p487)
		Selected.Pet = p487
	end, v486.PetData)
	v1107(v1111, "Size", {
		"Normal",
		"Big",
		"Huge",
		""
	}, "", function(p488)
		local petSize = p488 == "Normal" and ""

		Selected.PetSize = petSize or p488
	end)
	v1107(v1111, "Type", {
		"Normal",
		"Rainbow",
		""
	}, "", function(p489)
		Selected.PetType = p489 == "Normal" and "" or p489
	end)
	v1111:AddButton({
		Text = "Spawn pet",
		Icon = "sparkles",
		Callback = function()
			p476.spawnPetTool(Selected.Pet, Selected.PetSize, Selected.PetType)
		end
	})
	v1107(v1112, "Egg", v486.EggOptions, Selected.Egg, function(p490)
		Selected.Egg = p490
	end, v486.EggsByName)
	v1112:AddButton({
		Text = "Spawn egg",
		Icon = "egg",
		Callback = function()
			p476.spawnEggTool(Selected.Egg)
		end
	})
	v1107(v1112, "Pack", v486.PackOptions, Selected.Pack, function(p491)
		Selected.Pack = p491
	end, v486.PacksByName)
	v1112:AddButton({
		Text = "Spawn pack",
		Icon = "package",
		Callback = function()
			p476.spawnGenericTool(Selected.Pack, "SeedPack", Selected.Pack)
		end
	})
	v1107(v1112, "Gear", v486.GearOptions, Selected.Gear, function(p492)
		Selected.Gear = p492
	end, v486.GearByName, v486.GearPrices)
	v1112:AddButton({
		Text = "Spawn gear",
		Icon = "wrench",
		Callback = function()
			p476.spawnGearTool(Selected.Gear)
		end
	})
	v1112:AddButton({
		Text = "Spawn all gear",
		Icon = "grid-3x3",
		Callback = p476.spawnAllGear
	})
	v1107(v1112, "Crate", v486.CrateOptions, Selected.Crate, function(p493)
		Selected.Crate = p493
	end, v486.CratesByName, v486.CratePrices)
	v1112:AddButton({
		Text = "Spawn crate",
		Icon = "box",
		Callback = function()
			p476.spawnCrateTool(Selected.Crate)
		end
	})
	v1107(v1112, "Prop", v486.PropOptions, Selected.Prop, function(p494)
		Selected.Prop = p494
	end, v486.PropsByName)
	v1112:AddButton({
		Text = "Spawn prop",
		Icon = "home",
		Callback = function()
			p476.spawnPropTool(Selected.Prop)
		end
	})
	v1107(v1113, "Fruit", v486.FruitOptions, Selected.Fruit, function(p495)
		Selected.Fruit = p495
	end, nil, v486.FruitPrices)
	v1107(v1113, "Mutation", v486.MutationOptions, Selected.FruitMutation, function(p496)
		Selected.FruitMutation = p496
	end)
	v1113:AddSlider({
		Text = "Weight",
		Min = 0.1,
		Max = 50,
		Default = 1,
		Increment = 0.1,
		Callback = function(p497)
			Selected.FruitWeight = p497
		end
	})
	v1113:AddButton({
		Text = "Spawn fruit",
		Icon = "apple",
		Callback = function()
			p476.spawnFruitTool(Selected.Fruit, Selected.FruitWeight, Selected.FruitMutation)
		end
	})

	local t72 = {
		Common = Color3.fromRGB(170, 170, 175),
		Uncommon = Color3.fromRGB(100, 190, 100),
		Rare = Color3.fromRGB(90, 155, 255),
		Epic = Color3.fromRGB(175, 90, 255),
		Legendary = Color3.fromRGB(255, 185, 55),
		Mythic = Color3.fromRGB(255, 90, 130),
		Super = Color3.fromRGB(255, 105, 210),
		Secret = Color3.fromRGB(255, 70, 70)
	}
	local Assets = v486.Assets
	local Seeds = Assets:WaitForChild("Seeds")
	local Pets = Assets:FindFirstChild("Pets")
	local Eggs = Assets:WaitForChild("Eggs")
	local SeedPacks = Assets:FindFirstChild("SeedPacks")
	local Props = Assets:FindFirstChild("Props")
	local Plants = Assets:FindFirstChild("Plants")
	local t73 = {
		"Sprinklers",
		"WateringCans",
		"Mushrooms",
		"Gnomes",
		"Teleporters",
		"Wheelbarrows",
		"Trowels",
		"Crowbars",
		"Ladders",
		"FreezeRays",
		"PowerHoses",
		"Rakes",
		"Lanterns",
		"Signs",
		"EmptyPots",
		"Flashbangs",
		"Birds",
		"Crates",
		"Gears"
	}
	local n27 = 1
	local s2 = ""
	local s3 = ""
	local UserInputService = game:GetService("UserInputService")
	local v1128 = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
	local vector2 = v1128 and Vector2.new(96, 116) or Vector2.new(120, 142)

	local function v1130(p498, p499)
		return {
			Items = p498,
			MultiSelect = true,
			SearchBar = true,
			ItemSize = vector2,
			MobileScaledItemSize = v1128,
			HoverRotate = true,
			OnSelectionChanged = p499
		}
	end
	local function v1131()
		if v487 then
			if v487._UpdateStatus then
				pcall(v487._UpdateStatus)
			end
		end
	end
	local function v1132(p500)
		if not p500 or p500 == "" then
			return nil
		end

		if p500:find("rbxassetid://") then
			return p500
		end

		if tonumber(p500) then
			return "rbxassetid://" .. p500
		end

		return p500
	end
	local function v1133(p501)
		local v1134 = p501 or "Common"

		return v1134, t72[v1134] or t72.Common
	end
	local function v1135(p502, p503)
		for _, v in ipairs(p502) do
			for _, v2 in ipairs(p503) do
				if v2 and v2 ~= "" then
					local v1140 = v:FindFirstChild(v2)

					if v1140 then
						return v1140
					end
				end
			end
		end

		return nil
	end
	local function v1141(p504)
		local v1142 = Seeds:FindFirstChild(p504) or Seeds:FindFirstChild(p504 .. " Seed")

		if v1142 then
			return v1142
		end

		local v1143 = v486.SeedsByName[p504]

		if v1143 and typeof(v1143.PlantModel) == "Instance" then
			return v1143.PlantModel
		end

		if Plants then
			return Plants:FindFirstChild(p504)
		end

		return nil
	end
	local function v1144(p505)
		local v1145 = v486.PetModules[p505]
		local AssetName = v1145 and v1145.AssetName or p505

		if Pets then
			local v1147 = Pets:FindFirstChild(AssetName)

			if v1147 then
				return v1147
			end
		end

		return Assets:FindFirstChild(AssetName)
	end
	local function v1148(p506)
		local v1149 = v486.GearByName[p506]

		if not v1149 then
			return nil
		end

		local t74 = { Assets }

		for _, v in ipairs(t73) do
			local v1153 = Assets:FindFirstChild(v)

			if v1153 then
				table.insert(t74, v1153)
			end
		end

		return v1135(t74, {
			v1149.ItemName,
			v1149.ItemType,
			p506
		})
	end
	local function v1154(p507)
		return Eggs:FindFirstChild(p507) or Assets:FindFirstChild(p507)
	end
	local function v1155(p508)
		local v1156 = v486.PacksByName[p508]

		if v1156 and typeof(v1156.Model) == "Instance" then
			return v1156.Model
		end

		if SeedPacks then
			return SeedPacks:FindFirstChild(p508)
		end

		return nil
	end
	local function v1157(p509)
		local v1158 = v486.CratesByName[p509]

		if not v1158 then
			return nil
		end

		local v1159 = Assets:FindFirstChild(p509)

		if not v1159 then
			v1159 = Assets:FindFirstChild(v1158.CrateType or "")
		end

		return v1159
	end
	local function v1160(p510)
		if Props then
			return Props:FindFirstChild(p510)
		end

		return nil
	end
	local function v1161()
		local t75 = {}

		for _, seedOption in ipairs(v486.SeedOptions) do
			local v1165 = v486.SeedsByName[seedOption]
			local v1166, v1167 = v1133(v1165 and v1165.Rarity)

			table.insert(t75, {
				Id = seedOption,
				Name = seedOption,
				Subtitle = v1166,
				Badge = v1166,
				BadgeColor = v1167,
				Model = v1141(seedOption),
				Image = v1132(v486.getSeedImageId(seedOption)),
				_Rarity = v1166,
				_Price = v486.getItemPrice(seedOption, v1165, v486.SeedPrices)
			})
		end

		return v486.sortGridItems(t75, t43.DropdownSort)
	end
	local function v1168()
		local t76 = {}

		for _, petOption in ipairs(v486.PetOptions) do
			local v1172 = v486.getPetSpec(petOption)
			local v1173, v1174 = v1133(v1172 and v1172.Rarity)

			table.insert(t76, {
				Id = petOption,
				Name = petOption,
				Subtitle = v1173,
				Badge = v1173,
				BadgeColor = v1174,
				Model = v1144(petOption),
				Image = v1132(v486.getPetImageId(petOption)),
				_Rarity = v1173,
				_Price = v486.getItemPrice(petOption, v1172)
			})
		end

		return v486.sortGridItems(t76, t43.DropdownSort)
	end
	local function v1175()
		local t77 = {}

		for _, gearOption in ipairs(v486.GearOptions) do
			local v1179 = v486.GearByName[gearOption]
			local v1180, v1181 = v1133(v1179 and v1179.Rarity)

			table.insert(t77, {
				Id = gearOption,
				Name = gearOption,
				Subtitle = v1180,
				Badge = v1180,
				BadgeColor = v1181,
				Model = v1148(gearOption),
				Image = v1132(v1179 and v1179.IMG),
				_Rarity = v1180,
				_Price = v486.getItemPrice(gearOption, v1179, v486.GearPrices)
			})
		end

		return v486.sortGridItems(t77, t43.DropdownSort)
	end
	local function v1182()
		local t78 = {}

		for _, eggOption in ipairs(v486.EggOptions) do
			local v1186 = v486.EggsByName[eggOption]
			local v1187, v1188 = v1133(v1186 and v1186.Rarity)

			table.insert(t78, {
				Id = "egg:" .. eggOption,
				Name = eggOption,
				Subtitle = "Egg",
				Badge = v1187,
				BadgeColor = v1188,
				Model = v1154(eggOption),
				Image = v1132(v1186 and v1186.IMG),
				_Rarity = v1187,
				_Price = v486.getItemPrice(eggOption, v1186)
			})
		end

		for _, packOption in ipairs(v486.PackOptions) do
			local v1191 = v486.PacksByName[packOption]
			local v1192, v1193 = v1133(v1191 and v1191.Rarity)
			local insert = table.insert
			local v1195 = t78

			insert(v1195, {
				Id = "pack:" .. packOption,
				Name = packOption,
				Subtitle = "Pack",
				Badge = v1192,
				BadgeColor = v1193,
				Model = v1155(packOption),
				Image = v1132(v1191 and v1191.IMG),
				_Rarity = v1192,
				_Price = v486.getItemPrice(packOption, v1191)
			})
		end

		for _, crateOption in ipairs(v486.CrateOptions) do
			local v1198 = v486.CratesByName[crateOption]
			local v1199, v1200 = v1133(v1198 and v1198.Rarity)

			table.insert(t78, {
				Id = "crate:" .. crateOption,
				Name = crateOption,
				Subtitle = "Crate",
				Badge = v1199,
				BadgeColor = v1200,
				Model = v1157(crateOption),
				Image = v1132(v1198 and v1198.IMG),
				_Rarity = v1199,
				_Price = v486.getItemPrice(crateOption, v1198, v486.CratePrices)
			})
		end

		for _, propOption in ipairs(v486.PropOptions) do
			local v1203 = v486.PropsByName[propOption]
			local v1204, v1205 = v1133(v1203 and v1203.Rarity)

			table.insert(t78, {
				Id = "prop:" .. propOption,
				Name = propOption,
				Subtitle = "Prop",
				Badge = v1204,
				BadgeColor = v1205,
				Model = v1160(propOption),
				Image = v1132(v486.getPropImageId(propOption)),
				_Rarity = v1204,
				_Price = v486.getItemPrice(propOption, v1203)
			})
		end

		return v486.sortGridItems(t78, t43.DropdownSort)
	end
	local function v1206(p511, p512)
		local selected = p511:GetSelected()

		if #selected ~= 0 then
			task.spawn(function()
				for _, v in ipairs(selected) do
					for i = 1, n27 do
						p512(v)
						task.wait(0.05)
					end
				end
			end)

			return
		end

		v520("Grid", "Nothing selected.", "Warning", 2)
	end

	local v1211 = v487:CreateTab({
		Name = "Grid seeds"
	})

	v1109(v1211)

	local v1212 = v1211:AddItemGrid(v1130(v1161(), function()
		v1131()
	end))

	table.insert(t61, {
		grid = v1212,
		build = v1161
	})
	v1211:SetActionBar({
		Left = {
			{
				Text = "All",
				Callback = function()
					v1212:SelectAll()
				end
			},
			{
				Text = "Clear",
				Callback = function()
					v1212:Clear()
				end
			},
			{
				Text = "Amt -",
				Callback = function()
					n27 = math.max(1, n27 - 1)
					v1131()
				end
			},
			{
				Text = "Amt +",
				Callback = function()
					n27 = math.min(100, n27 + 1)
					v1131()
				end
			}
		},
		Primary = {
			Text = "Spawn",
			Callback = function()
				v1206(v1212, function(p513)
					p476.spawnSeedTool(p513, 1)
				end)
			end
		},
		Status = function()
			return ("%d selected x%d"):format(#v1212:GetSelected(), n27)
		end
	})

	local v1213 = v487:CreateTab({
		Name = "Grid pets"
	})

	v1109(v1213)

	local v1214 = v1213:AddItemGrid(v1130(v1168(), function()
		v1131()
	end))

	table.insert(t61, {
		grid = v1214,
		build = v1168
	})
	v1213:SetActionBar({
		Left = {
			{
				Text = "All",
				Callback = function()
					v1214:SelectAll()
				end
			},
			{
				Text = "Clear",
				Callback = function()
					v1214:Clear()
				end
			},
			{
				Text = "Normal",
				Callback = function()
					s2 = ""
					s3 = ""
					v1131()
				end
			},
			{
				Text = "Big",
				Callback = function()
					s2 = "Big"
					v1131()
				end
			},
			{
				Text = "Rainbow",
				Callback = function()
					s3 = "Rainbow"
					v1131()
				end
			}
		},
		Primary = {
			Text = "Spawn",
			Callback = function()
				v1206(v1214, function(p514)
					p476.spawnPetTool(p514, s2, s3)
				end)
			end
		},
		Status = function()
			local v1215 = s2 == "" and "Normal" or s2
			local v1216 = s3 == "" and "Normal"

			v1216 = v1216 or s3

			return ("%d sel | %s / %s"):format(#v1214:GetSelected(), v1215, v1216)
		end
	})

	local v1217 = v487:CreateTab({
		Name = "Grid gear"
	})

	v1109(v1217)

	local v1218 = v1217:AddItemGrid(v1130(v1175(), function()
		v1131()
	end))

	table.insert(t61, {
		grid = v1218,
		build = v1175
	})
	v1217:SetActionBar({
		Left = {
			{
				Text = "All",
				Callback = function()
					v1218:SelectAll()
				end
			},
			{
				Text = "Clear",
				Callback = function()
					v1218:Clear()
				end
			}
		},
		Primary = {
			Text = "Spawn",
			Callback = function()
				v1206(v1218, function(p515)
					p476.spawnGearTool(p515)
				end)
			end
		},
		Status = function()
			return ("%d selected"):format(#v1218:GetSelected())
		end
	})

	local v1219 = v487:CreateTab({
		Name = "Grid items"
	})

	v1109(v1219)

	local v1220 = v1219:AddItemGrid(v1130(v1182(), function()
		v1131()
	end))

	table.insert(t61, {
		grid = v1220,
		build = v1182
	})
	v1219:SetActionBar({
		Left = {
			{
				Text = "All",
				Callback = function()
					v1220:SelectAll()
				end
			},
			{
				Text = "Clear",
				Callback = function()
					v1220:Clear()
				end
			}
		},
		Primary = {
			Text = "Spawn",
			Callback = function()
				v1206(v1220, function(p516)
					local match, v1222 = p516:match("^(%w+):(.*)$")

					if match == "egg" then
						p476.spawnEggTool(v1222)
					elseif match == "pack" then
						p476.spawnGenericTool(v1222, "SeedPack", v1222)
					elseif match == "crate" then
						p476.spawnCrateTool(v1222)
					elseif match == "prop" then
						p476.spawnPropTool(v1222)
					end
				end)
			end
		},
		Status = function()
			return ("%d selected"):format(#v1220:GetSelected())
		end
	})

	local v1223 = v1102:CreateSection({
		Name = "Seed packs",
		Side = "Left"
	})

	v1102:CreateSection({
		Name = "Info",
		Side = "Right"
	}):AddParagraph({
		Title = "Local rolls",
		Content = "Uses game spinner UI, then spawns local client tools as fake rewards."
	})

	local v1224 = v1102:CreateSection({
		Name = "Eggs",
		Side = "Left"
	})
	local v1225 = v1102:CreateSection({
		Name = "Crates",
		Side = "Right"
	})
	local forcedSeed
	local v1227

	v1107(v1223, "Pack", v486.PackOptions, Selected.Pack, function(p517)
		Selected.Pack = p517
		Selected.PackSeed = v486.pickDefault(v486.getPackSeedDropdownOptions(p517), Selected.PackSeed)

		if forcedSeed then
			local v1228 = v486.getPackSeedDropdownOptions(p517)

			if v1227 then
				v1227.names = v1228
			end

			forcedSeed:SetOptions(v486.sortNameList(v1228, t43.DropdownSort, v486.SeedsByName, v486.SeedPrices))
			forcedSeed:SetValue(Selected.PackSeed)
		end
	end, v486.PacksByName)
	forcedSeed = v1107(v1223, "Forced seed", v486.getPackSeedDropdownOptions(Selected.Pack), Selected.PackSeed, function(p518)
		Selected.PackSeed = p518
	end, v486.SeedsByName, v486.SeedPrices)

	if forcedSeed then
		for _, v in ipairs(t60) do
			if v.dropdown == forcedSeed then
				v1227 = v

				break
			end
		end
	end

	v1223:AddButton({
		Text = "Spin pack",
		Icon = "dice-5",
		Callback = function()
			p476.spinRoll(v486.getPackDropTable(Selected.Pack), Selected.PackSeed, function(p519)
				p476.spawnSeedTool(p519, 1)
			end)
		end
	})

	local forcedPet
	local v1232

	v1107(v1224, "Egg", v486.EggOptions, Selected.Egg, function(p520)
		Selected.Egg = p520
		Selected.EggPet = v486.pickDefault(v486.getEggPetDropdownOptions(p520), Selected.EggPet)

		if forcedPet then
			local v1233 = v486.getEggPetDropdownOptions(p520)

			if v1232 then
				v1232.names = v1233
			end

			forcedPet:SetOptions(v486.sortNameList(v1233, t43.DropdownSort, v486.PetData))
			forcedPet:SetValue(Selected.EggPet)
		end
	end, v486.EggsByName)
	forcedPet = v1107(v1224, "Forced pet", v486.getEggPetDropdownOptions(Selected.Egg), Selected.EggPet, function(p521)
		Selected.EggPet = p521
	end, v486.PetData)

	if forcedPet then
		for _, v in ipairs(t60) do
			if v.dropdown == forcedPet then
				v1232 = v

				break
			end
		end
	end

	v1224:AddButton({
		Text = "Spin egg",
		Icon = "dice-5",
		Callback = function()
			p476.spinRoll(v486.getEggDropTable(Selected.Egg), Selected.EggPet, function(p522)
				p476.spawnPetTool(p522, "", "")
			end)
		end
	})

	if #v486.CrateOptions > 0 then
		Selected.CrateItem = (v486.getCrateDropTable(Selected.Crate)[1] or {}).Name or ""
	end

	local forcedItem
	local v1237

	v1107(v1225, "Crate", v486.CrateOptions, Selected.Crate, function(p523)
		Selected.Crate = p523

		local v1238 = v486.getCrateDropTable(p523)[1]

		Selected.CrateItem = v1238 and v1238.Name or ""

		if forcedItem then
			local v1239 = v486.getCrateItemDropdownOptions(p523)

			if v1237 then
				v1237.names = v1239
			end

			forcedItem:SetOptions(v486.sortNameList(v1239, t43.DropdownSort, v486.GearByName, v486.GearPrices))
			forcedItem:SetValue(Selected.CrateItem)
		end
	end, v486.CratesByName, v486.CratePrices)

	if #v486.getCrateItemDropdownOptions(Selected.Crate) > 0 then
		forcedItem = v1107(v1225, "Forced item", v486.getCrateItemDropdownOptions(Selected.Crate), Selected.CrateItem, function(p524)
			Selected.CrateItem = p524
		end, v486.GearByName, v486.GearPrices)

		if forcedItem then
			for _, v in ipairs(t60) do
				if v.dropdown == forcedItem then
					v1237 = v

					break
				end
			end
		end
	end

	v1225:AddButton({
		Text = "Spin crate",
		Icon = "dice-5",
		Callback = function()
			p476.spinRoll(v486.getCrateDropTable(Selected.Crate), Selected.CrateItem, function(p525)
				if v486.isPropName(p525) then
					p476.spawnPropTool(p525)
				else
					p476.spawnGearTool(p525)
				end
			end)
		end
	})

	local v1242 = v1103:CreateSection({
		Name = "Local preview",
		Side = "Left"
	})
	local v1243 = v1103:CreateSection({
		Name = "Tools",
		Side = "Right"
	})

	v1242:AddParagraph({
		Title = "Preview sandbox",
		Content = "Anchored clones in Workspace.PR_GAG2_PREVIEW. No inventory changes."
	})
	v1107(v1242, "Seed", v486.SeedOptions, Selected.PreviewSeed, function(p526)
		Selected.PreviewSeed = p526
	end, v486.SeedsByName, v486.SeedPrices)
	v1242:AddButton({
		Text = "Preview seed",
		Icon = "eye",
		Callback = function()
			p476.spawnPreview("Seed", Selected.PreviewSeed)
		end
	})
	v1107(v1242, "Plant", v486.SeedOptions, Selected.PreviewPlant, function(p527)
		Selected.PreviewPlant = p527
	end, v486.SeedsByName, v486.SeedPrices)
	v1242:AddButton({
		Text = "Preview plant",
		Icon = "tree-pine",
		Callback = function()
			p476.spawnPreview("Plant", Selected.PreviewPlant)
		end
	})
	v1107(v1242, "Pet", v486.PetOptions, Selected.PreviewPet, function(p528)
		Selected.PreviewPet = p528
	end, v486.PetData)
	v1242:AddButton({
		Text = "Preview pet",
		Icon = "sparkles",
		Callback = function()
			p476.spawnPreview("Pet", Selected.PreviewPet)
		end
	})
	v1107(v1242, "Pack", v486.PackOptions, Selected.PreviewPack, function(p529)
		Selected.PreviewPack = p529
	end, v486.PacksByName)
	v1242:AddButton({
		Text = "Preview pack",
		Icon = "package",
		Callback = function()
			p476.spawnPreview("Pack", Selected.PreviewPack)
		end
	})
	v1243:AddButton({
		Text = "Clear previews",
		Icon = "trash",
		Callback = function()
			p476.clearPreviews()
			v520("Preview", "Cleared.", "Success", 2)
		end
	})

	local v1244 = v1104:CreateSection({
		Name = "Wild pets",
		Side = "Left"
	})
	local v1245 = v1104:CreateSection({
		Name = "Wild settings",
		Side = "Right"
	})

	v1244:AddParagraph({
		Title = "Local wild pets",
		Content = "Full client replica: wander AI, buy prompt, cost + timer billboards, garden spawn. Buy gives local pet tool."
	})
	v1107(v1244, "Pet", v486.PetOptions, Selected.WildPet, function(p530)
		Selected.WildPet = p530
	end, v486.PetData)
	v1107(v1244, "Size", {
		"Normal",
		"Big",
		"Huge",
		""
	}, "", function(p531)
		Selected.WildPetSize = p531 == "Normal" and "" or p531
	end)
	v1107(v1244, "Type", {
		"Normal",
		"Rainbow",
		""
	}, "", function(p532)
		Selected.WildPetType = p532 == "Normal" and "" or p532
	end)
	v1244:AddButton({
		Text = "Spawn wild pet",
		Icon = "map-pin",
		Callback = function()
			p476.spawnWildPet(Selected.WildPet, Selected.WildPetSize, Selected.WildPetType)
		end
	})
	v1244:AddButton({
		Text = "Spawn x5",
		Icon = "layers",
		Callback = function()
			p476.spawnWildPetBulk(Selected.WildPet, Selected.WildPetSize, Selected.WildPetType, 5)
		end
	})
	v1245:AddToggle({
		Text = "Spawn in garden",
		Default = Selected.WildPetInGarden,
		Callback = function(p533)
			Selected.WildPetInGarden = p533
		end
	})
	v1245:AddToggle({
		Text = "Wander",
		Default = Selected.WildPetWander,
		Callback = function(p534)
			Selected.WildPetWander = p534
		end
	})
	v1245:AddSlider({
		Text = "Lifetime",
		Min = 60,
		Max = 600,
		Default = Selected.WildPetLifetime,
		Increment = 30,
		Callback = function(p535)
			Selected.WildPetLifetime = p535
		end
	})
	v1245:AddButton({
		Text = "Clear local wild",
		Icon = "trash",
		Callback = p476.clearLocalWildPets
	})

	local v1246 = v1105:CreateSection({
		Name = "Client weather",
		Side = "Left"
	})
	local v1247 = v1105:CreateSection({
		Name = "Client time",
		Side = "Right"
	})

	v1247:AddParagraph({
		Title = "Client attributes",
		Content = "WeatherValues attrs + ActivePhase/ActiveWeather. Build tools show hammer when held (game default)."
	})
	v1246:AddToggle({
		Text = "All weather",
		Default = false,
		Callback = function(p536)
			for _, weatherOption in ipairs(v486.WeatherOptions) do
				p476.setWeather(weatherOption, p536)
			end
		end
	})

	for _, weatherOption in ipairs(v486.WeatherOptions) do
		v1246:AddToggle({
			Text = weatherOption,
			Default = WeatherValues:GetAttribute(weatherOption .. "_Playing") == true,
			Callback = function(p537)
				p476.setWeather(weatherOption, p537)
			end
		})
	end

	v1107(v1247, "Phase", v486.PhaseOptions, Selected.Phase, function(p538)
		Selected.Phase = p538
		Selected.PhaseWeather = v486.getDefaultPhaseWeather(p538)
	end)
	v1247:AddButton({
		Text = "Apply phase",
		Icon = "moon",
		Callback = function()
			p476.setPhase(Selected.Phase, Selected.PhaseWeather)
			v520("Phase", ("%s / %s"):format(Selected.Phase, Selected.PhaseWeather or "—"), "Success", 2)
		end
	})

	if #(v486.PhaseWeathers[Selected.Phase] or {}) > 0 then
		v1107(v1247, "Phase weather", v486.PhaseWeathers[Selected.Phase], Selected.PhaseWeather, function(p539)
			Selected.PhaseWeather = p539
		end)
	end

	local v1252 = v1106:CreateSection({
		Name = "All shops",
		Side = "Left"
	})

	v1252:AddParagraph({
		Title = "Shop glitch",
		Content = "Select item in shop, buy spawns local tool. No server purchase."
	})
	v1252:AddButton({
		Text = "Enable all shop glitches",
		Icon = "zap",
		Callback = p476.glitchAllShops
	})

	local v1253 = v1106:CreateSection({
		Name = "Seed shop",
		Side = "Left"
	})

	v1253:AddButton({
		Text = "Open seed shop",
		Icon = "shopping-bag",
		Callback = function()
			p476.openShopGui("SeedShop")
		end
	})
	v1253:AddButton({
		Text = "Close seed shop",
		Icon = "x",
		Callback = function()
			p476.closeShopGui("SeedShop")
		end
	})
	v1253:AddButton({
		Text = "Free seed shop glitch",
		Icon = "zap",
		Callback = p476.glitchSeedShop
	})

	local v1254 = v1106:CreateSection({
		Name = "Gear shop",
		Side = "Right"
	})

	v1254:AddButton({
		Text = "Open gear shop",
		Icon = "shopping-bag",
		Callback = function()
			p476.openShopGui("GearShop")
		end
	})
	v1254:AddButton({
		Text = "Close gear shop",
		Icon = "x",
		Callback = function()
			p476.closeShopGui("GearShop")
		end
	})
	v1254:AddButton({
		Text = "Free gear shop glitch",
		Icon = "zap",
		Callback = p476.glitchGearShop
	})

	local v1255 = v1106:CreateSection({
		Name = "Crate shop",
		Side = "Right"
	})

	v1255:AddButton({
		Text = "Open crate shop",
		Icon = "shopping-bag",
		Callback = function()
			p476.openShopGui("CrateShop")
		end
	})
	v1255:AddButton({
		Text = "Close crate shop",
		Icon = "x",
		Callback = function()
			p476.closeShopGui("CrateShop")
		end
	})
	v1255:AddButton({
		Text = "Free crate shop glitch",
		Icon = "zap",
		Callback = p476.glitchCrateShop
	})
end

v791()
v799()

local v1256 = v863()

v857(v1256)
v1098(v1256)
_G.__GAG2_LOCAL_SPAWN = v1256
_G.__GAG2_LOADED = true
_G.__GAG2_UNLOAD = function()
	if not rawget(_G, "__GAG2_LOADED") then
		return
	end

	t53.schedulerRunning = false
	u508 = false
	u509 = false
	u510 = false
	u511 = false
	t43.Noclip = false
	t43.InfiniteJump = false
	t43.LowGraphics = false
	t43.BlackScreen = false
	t43.WhiteScreen = false
	t43.HideNotifications = false
	t43.ShowFruitPrices = false
	t43.ShowPetPrices = false
	t43.ShowDropEsp = false
	pcall(v733)
	v744()
	pcall(function()
		if Folder2 then
			Folder2:Destroy()
		end
	end)

	if rawget(_G, "__GAG2_LOCAL_SPAWN") then
		pcall(function()
			for _, v in ipairs(v486.getWildPetInstances()) do
				if v486.isLocalWildPet(v) then
					v:Destroy()
				end
			end
		end)
	end

	for _, v in ipairs(t53.onUnload) do
		pcall(v)
	end

	for _, connection in ipairs(t53.connections) do
		pcall(function()
			connection:Disconnect()
		end)
	end

	table.clear(t53.connections)
	table.clear(t53.onUnload)
	_G.__GAG2_LOADED = nil
	_G.__GAG2_LOCAL_SPAWN = nil
	_G.__GAG2_APPLY_MOVEMENT = nil
	pcall(function()
		v4:Notify({
			Title = ("GAG2 v%s"):format("1.0.0"),
			Content = "Unloaded.",
			Type = "Info",
			Duration = 3
		})
	end)
end
v4:Notify({
	Title = ("GAG2 v%s"):format("1.0.0"),
	Content = "Loaded.",
	Type = "Success",
	Duration = 4
})
