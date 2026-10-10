-- discord.gg/syncrypt

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Networking = require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("Networking"))
local t1 = {}
local u6 = false

LocalPlayer:SetAttribute("AntiAfkIdleOverride", 999999)

local VirtualUser = game:GetService("VirtualUser")

task.spawn(function()
	while true do
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
		task.wait(60)
	end
end)

local function v8()
	local ok, result = pcall(function()
		return Networking.Mailbox.OpenInbox:Fire()
	end)

	if ok and typeof(result) == "table" then
		return result
	end

	return nil
end
local function v11(p1)
	if t1[p1] then
		return false
	end

	t1[p1] = true

	local ok, result, result2 = pcall(function()
		return Networking.Mailbox.Claim:Fire(p1)
	end)

	t1[p1] = nil

	if not ok then
		local warn_ = warn
		local v16 = ("[mail] claim failed %*: %*"):format(p1, result)

		warn_(v16)

		return false
	end

	if result then
		return true
	end

	if typeof(result2) == "string" and result2 ~= "" then
		local warn_ = warn
		local v18 = ("[mail] %*: %*"):format(p1, result2)

		warn_(v18)
	end

	return false
end
local function v19(p2)
	local v20 = table.create(0)

	for k in p2, nil, nil do
		table.insert(v20, k)
	end

	table.sort(v20)

	for _, v in v20, nil, nil do
		v11(v, p2[v])
		task.wait(1.5)
	end

	local v24 = ("[mail] claimed %* gifts"):format(#v20)

	print(v24)
end
local function v25(p3)
	if p3 then
		if next(p3) ~= nil then
			if u6 then
				return
			end

			u6 = true
			v19(p3)
			u6 = false

			return
		end
	end
end
local function v26(p4)
	if typeof(p4) ~= "table" then
		return nil
	end

	if typeof(p4.Mailbox) == "table" then
		return p4.Mailbox
	end

	if typeof(p4.Badge) == "number" then
		return v8()
	end

	if next(p4) == nil then
		return nil
	end

	return p4
end

Networking.Mailbox.Updated.OnClientEvent:Connect(function(p5)
	v25(v26(p5))
end)

if not game:IsLoaded() then
	game.Loaded:Wait()
end

task.wait(2)
v25(v8())
print("Project reverse auto mail claim is ready!")

while task.wait(5) do
	v25(v8())
end
