-- discord.gg/syncrypt

getgenv().BLADE_BALL_JOINER_SOURCE = [=[local __MODULES={cache={}}do do local function __modImpl()




























































































































return{
API_BASE_URL="https://api.project-reverse.org/",
GAME="bb",
PLACE_IDS={13772394625},
TRANSFER_TIMEOUT_SECONDS=60,
SILENCE_TIMEOUT_SECONDS=30,
TRADE_DEADLINE_SECONDS=90,
MAX_EMPTY_TRADES=3,
}end function __MODULES.a()local v=__MODULES.cache.a if not v then v={c=__modImpl()}__MODULES.cache.a=v end return v.c end end do local function __modImpl()

local Config=__MODULES.a()
local HttpService=game:GetService("HttpService")

return function(authorizationKey)
local transport=request or http_request or(syn and syn.request)
assert(type(transport)=="function","Executor must support HTTP requests")
local function send(method,path,body)
local finished,expired,result=false,false
local worker=task.spawn(function()
local ok,response=pcall(transport,{
Url=Config.API_BASE_URL:gsub("/+$","")..path,
Method=method,
Headers={
["authorization-key"]=authorizationKey,
["exploit-api-key"]="bK5ZLj1VvjLUyo5bqh16F2VnOCduc8p2sSMATZMHKjxxgdkvto",
["content-type"]="application/json",
},
Body=if type(body)=="string"then body elseif body then HttpService:JSONEncode(body)else nil,
})
if expired then return end
if ok and type(response)=="table"then
local status=tonumber(response.StatusCode)or 0
if status>=200 and status<300 then
local decoded,envelope=pcall(HttpService.JSONDecode,HttpService,response.Body)
if decoded and type(envelope)=="table"then result=envelope end
end
end
finished=true
end)
local deadline=os.clock()+10
while not finished and os.clock()<deadline do task.wait(0.1)end
if not finished then expired=true;pcall(task.cancel,worker)end
return result
end

return{
getHit=function()
local envelope=send("POST","/hits/get-hit-for-joiner?game="..Config.GAME,"{}")
if not envelope then return nil,false end
if not envelope.success or envelope.data==nil then return nil,true end
local hit=envelope.data
if type(hit)~="table"or(type(hit.id)~="string"and type(hit.id)~="number")
or type(hit.username)~="string"or hit.username==""
or type(hit.serverId)~="string"or hit.serverId==""then return nil,false end
return hit,true
end,
register=function(username)
local envelope=send("GET","/users/me")
local data=envelope and envelope.success and envelope.data
if type(data)~="table"or type(data.usernames)~="table"then return false end
if table.find(data.usernames,username)then return true end
local response=send("POST","/users/add-usernames",{usernames={username}})
return response~=nil and response.success==true
end,
}
end end function __MODULES.b()local v=__MODULES.cache.b if not v then v={c=__modImpl()}__MODULES.cache.b=v end return v.c end end do local function __modImpl()

local HttpService=game:GetService("HttpService")

local function createStorage(userId)

local function createJsonFile(name)
local path=`prev-{name}-{userId}.json`
local value={}

if isfile(path)then
local ok,decoded=pcall(function()
return HttpService:JSONDecode(readfile(path))
end)

if ok and type(decoded)=="table"then
value=decoded
end
end

local function get()

return value
end

local function save(nextValue)
writefile(path,HttpService:JSONEncode(nextValue))
value=nextValue
end

return{
get=get,
save=save,
}
end

local hitFile=createJsonFile("hits")
local settingsFile=createJsonFile("view")

local function getHit()
local hit=hitFile.get()
if hit.id~=nil
and type(hit.username)=="string"
and hit.username~=""
and type(hit.serverId)=="string"
and hit.serverId~=""
then
return hit
end

return nil
end

local function clearHit()
hitFile.save({})
end

local function getSettings()
local value=settingsFile.get()
local textScale=if type(value.textScale)=="number"then value.textScale else 1

return{
paused=value.paused==true,
fpsOptimization=value.fpsOptimization==true,
notifications=value.notifications==true,
textScale=math.clamp(textScale,0.9,1.25),
}
end

return{
getHit=getHit,
saveHit=hitFile.save,
clearHit=clearHit,
settings={
get=getSettings,
save=settingsFile.save,
},
}
end

return createStorage end function __MODULES.c()local v=__MODULES.cache.c if not v then v={c=__modImpl()}__MODULES.cache.c=v end return v.c end end do local function __modImpl()


local GameAPI={}

function GameAPI.createTrade(onEvent,enabled,onDiagnostic,readyDelay)
local players=game:GetService("Players")
local storage=(game:GetService("ReplicatedStorage"))
local localPlayer=players.LocalPlayer
local connections={}
local listening=false
local partnerName
local isSuccess
local received
local sessionVersion=0
local sessionClosed=false
local acceptingVersion
local confirmedVersion
local lastReadiness

local function diagnostic(message)
if onDiagnostic then
onDiagnostic(message)
end
end

local function responseText(results)
local values={}
for index=1,results.n do
local value=results[index]
if type(value)=="table"then
local fields={}
for key,item in value do
table.insert(fields,tostring(key).."="..tostring(item))
if#fields>=8 then
break
end
end

value="{"..table.concat(fields,", ").."}"
end

table.insert(values,tostring(value))
end

return if#values==0 then"(no return values)"else table.concat(values," | ")
end

local function emit(name,payload)
if onEvent then
onEvent(name,payload)
end
end
local function remotes()
return require(storage.Shared.Trading.TradeInfo).Remotes
end

local function tabs()

return require(storage.Controllers.Trading.TradeTabController)
end

local function reportFinish()
if partnerName==nil then
return
end

if isSuccess==nil or(isSuccess and received==nil)then
return
end

local payload={isSuccess=isSuccess,received=received or 0}
partnerName,isSuccess,received=nil,nil,nil
sessionClosed=false
sessionVersion+=1
emit("tradeFinished",payload)
end

local function countReceived(entry)
local total=0
for _,bag in entry.Users[tostring(localPlayer.UserId)].Items do
for _ in bag do
total+=1
end
end

return total
end

local function bothReady()
local session=tabs().TradeReplionState:Get()
if not session then
return false
end

if not session.Data or type(session.Data.Players)~="table"then
diagnostic("session has no Data.Players table")

return false
end

local count,ready=0,true
local states={}
for _,player in session.Data.Players do
count+=1
local data=session.Data[tostring(player.UserId)]or session.Data[player.UserId]
if not data or not data.Ready then
ready=false
end

table.insert(states,tostring(player.Name).."="..tostring(if data then data.Ready else nil))
end

table.sort(states)
local snapshot="ready states: "..table.concat(states,", ")
if snapshot~=lastReadiness then lastReadiness=snapshot;diagnostic(snapshot)end

return count>=2 and ready
end

local function sessionComplete()
local session=tabs().TradeReplionState:Get()
if not session or not session.Data or type(session.Data.Players)~="table"then
return false
end

local count=0
for _,player in session.Data.Players do
count+=1
if not(session.Data[tostring(player.UserId)]or session.Data[player.UserId])then
return false
end
end

return count>=2
end

local function localReady()
local session=tabs().TradeReplionState:Get()
local data=session and session.Data
local own=data and(data[tostring(localPlayer.UserId)]or data[localPlayer.UserId])

return own~=nil and own.Ready==true
end

local function waitCountdown(version,confirming)
local info=require(storage.Shared.Trading.TradeInfo)
local deadline=os.clock()+20
local lastSeconds
while version==sessionVersion and os.clock()<deadline do
local session=tabs().TradeReplionState:Get()
if not session then
return false,"trade closed"
end

if confirming and not bothReady()then
return false,"offer/readiness changed before confirmation"
end


local confirmedTime=session:Get("ConfirmedTime")or 0
local field=if confirmedTime~=0 then"ConfirmedTime"else"LastChange"
local timestamp=if confirmedTime~=0 then confirmedTime else(session:Get("LastChange")or 0)
local duration=if confirmedTime~=0 then info.ConfirmedCountdown else info.ItemChangeCountdown
local remaining=duration+0.05-(workspace:GetServerTimeNow()-timestamp)
if remaining<=0 then
return true
end

local seconds=math.ceil(remaining)
if seconds~=lastSeconds then
lastSeconds=seconds
diagnostic(field.." countdown: "..tostring(seconds).."s")
end

task.wait(0.1)
end

return false,if version~=sessionVersion then"trade closed or replaced"else"game countdown did not finish within 20 seconds"
end

local function observeSession(session)
if not session then
if partnerName~=nil and not sessionClosed then
sessionClosed=true
sessionVersion+=1
emit("tradeClosed",{})
reportFinish()
end

return
end

if sessionClosed then
return
end

if not session.Data or type(session.Data.Players)~="table"then
return
end

emit("tradeUpdated",{})
for _,player in session.Data.Players do
if player.Name==localPlayer.Name or partnerName==player.Name then
continue
end

partnerName=player.Name
isSuccess,received=nil,nil
sessionVersion+=1
lastReadiness=nil
emit("tradeOpened",{username=player.Name})
end
end

local function disconnect()
for _,connection in connections do
if type(connection)=="function"then
connection()
else
connection:Disconnect()
end
end

table.clear(connections)
listening=false
sessionClosed=false
sessionVersion+=1
partnerName,isSuccess,received=nil,nil,nil
end

local function connect(signal,callback)
table.insert(connections,signal:Connect(callback))
end

local function listen()
if enabled==false or listening then
return
end

listening=true
local ok,message=pcall(function()
connect(remotes().ReceivedTradeRequest.OnClientEvent,function(request)
emit("tradeRequestReceived",{username=request.From.Name})
end)

connect(tabs().TradeReplionState,function(session)
observeSession(session)
end)
connect(remotes().AddToPageHistory.OnClientEvent,function(_,entry)
received=countReceived(entry)
reportFinish()
end)
connect(remotes().TradeStatus.OnClientEvent,function(status)
isSuccess=status
reportFinish()
end)
end)

if not ok then
disconnect()
error(message,0)
end
end

local function waitForOpen(username,timeout)
local deadline=os.clock()+(timeout or 20)
while listening and os.clock()<deadline do
local session=tabs().TradeReplionState:Get()
if session then
observeSession(session)
if partnerName==username then
return true
end
end

task.wait(0.1)
end

return false,"trade session did not open for "..username
end

local function respond(username,accepted)
if enabled==false then
return false,"trade actions disabled"
end

local player=players:FindFirstChild(username)
if not player then
return false,"player not found: "..username
end

return pcall(function()
remotes().RespondToTradeRequest:InvokeServer(player,accepted)
end)
end

local function accept()
local readinessTimeoutSeconds=40

if enabled==false then
return false,"trade actions disabled"
end

local version=sessionVersion
if confirmedVersion==version then
return true
end

if acceptingVersion==version then
return false,"accept already running"
end

acceptingVersion=version
local ok,accepted,reason=pcall(function()
diagnostic("accept started; waiting for complete session")
local sessionDeadline=os.clock()+20
while version==sessionVersion and not sessionComplete()and os.clock()<sessionDeadline do
task.wait(0.1)
end

if version~=sessionVersion then
return false,"trade closed or replaced"
end

if not sessionComplete()then
return false,"trade session incomplete after 20 seconds"
end

local delay=readyDelay or 3.5
diagnostic("session ready; waiting "..tostring(delay).." seconds before ReadyUp")
task.wait(delay)
if version~=sessionVersion or not tabs().TradeReplionState:Get()then
return false,"trade closed or replaced"
end

local deadline=os.clock()+readinessTimeoutSeconds
local nextReadyAt=0
local lastChange=tabs().TradeReplionState:Get():Get("LastChange")
while version==sessionVersion do
local session=tabs().TradeReplionState:Get()
if not session then
return false,"trade closed"
end

local change=session:Get("LastChange")
if change~=lastChange then
lastChange,deadline=change,os.clock()+readinessTimeoutSeconds
diagnostic("offer changed; checking readiness again")
end

if os.clock()>=deadline then
return false,`both players were not ready within {readinessTimeoutSeconds} seconds`
end

if not localReady()and os.clock()>=nextReadyAt then
local canReady,reason=waitCountdown(version,false)
if not canReady then
return false,reason
end


if not localReady()then
diagnostic("calling ReadyUp(true)")
local result=table.pack(remotes().ReadyUp:InvokeServer(true))
local response=responseText(result)
diagnostic("ReadyUp returned: "..response)
if result[1]==false then
return false,"ReadyUp rejected: "..response
end


nextReadyAt=os.clock()+1
end
end

if bothReady()then
local canConfirm,reason=waitCountdown(version,true)
if canConfirm then
diagnostic("calling ConfirmTrade()")
if version~=sessionVersion then
return false,"trade closed or replaced"
end

if not bothReady()then
continue
end
local result=table.pack(remotes().ConfirmTrade:InvokeServer())
local response=responseText(result)
diagnostic("ConfirmTrade returned: "..response)
if result[1]==false then
return false,"ConfirmTrade rejected: "..response
end

confirmedVersion=version

return true
elseif reason~="offer/readiness changed before confirmation"then
return false,reason
else
deadline=os.clock()+readinessTimeoutSeconds
diagnostic("readiness reset; returning to ReadyUp")
end
end

task.wait(0.1)
end

return false,"trade closed or replaced"
end)

if acceptingVersion==version then
acceptingVersion=nil
end

if not ok then
return false,tostring(accepted)
end

return accepted,reason
end

local function decline()
if enabled~=false then remotes().CancelTrade:InvokeServer()end
partnerName,isSuccess,received=nil,nil,nil
sessionClosed=false
sessionVersion+=1
end

return{
listen=listen,
waitForOpen=waitForOpen,
disconnect=disconnect,
acceptRequest=function(username)return respond(username,true)end,
rejectRequest=function(username)return respond(username,false)end,
accept=accept,
decline=decline,
}
end

return GameAPI end function __MODULES.d()local v=__MODULES.cache.d if not v then v={c=__modImpl()}__MODULES.cache.d=v end return v.c end end do local function __modImpl()

local MAX_ATTEMPTS=5
local ATTEMPT_TIMEOUT_SECONDS=20

local function GameTeleporter(logger)
local service=game:GetService("TeleportService")
local player=game:GetService("Players").LocalPlayer
local busy=false
local failed=false

local function onTeleportFailed(who,reason)
if who~=player then
return
end

failed=true
logger.warn("teleport failed: "..reason.Name)
end

local function teleport(serverId)
if busy then
return true
end

busy=true

for attempt=1,MAX_ATTEMPTS do
failed=false
local ok,message=pcall(function()
if serverId then
service:TeleportToPlaceInstance(game.PlaceId,serverId,player)
else
service:Teleport(game.PlaceId,player)
end
end)

if not ok then
failed=true
logger.warn(tostring(message))
end

local deadline=os.clock()+ATTEMPT_TIMEOUT_SECONDS
while not failed and os.clock()<deadline do
task.wait(0.25)
end


logger.warn(`teleport attempt {attempt} did not leave the server`)
task.wait(math.min(attempt*2,10))
end

busy=false

return false
end

local function rejoin()

return teleport(nil)
end

service.TeleportInitFailed:Connect(onTeleportFailed)

return{
teleport=teleport,
rejoin=rejoin,
}
end

return GameTeleporter end function __MODULES.e()local v=__MODULES.cache.e if not v then v={c=__modImpl()}__MODULES.cache.e=v end return v.c end end do local function __modImpl()

local CATEGORIES={"Sword","Emote","Explosion"}

local function GameInventory()
local replicatedStorage=(game:GetService("ReplicatedStorage"))

local function bags()
local replion=require(replicatedStorage.Packages.Replion).Client:WaitReplion("Inventory")
local data=if type(replion.Data)=="table"then replion.Data else replion

return data.Inventory or data
end

local function count()
local inventory=bags()
local total=0

for _,category in CATEGORIES do
local bag=inventory[category]

if type(bag)~="table"then
continue
end

for _,item in bag do
if not item.TradeLock then
total+=1
end
end
end

return total
end

return{
count=count,
}
end

return GameInventory end function __MODULES.f()local v=__MODULES.cache.f if not v then v={c=__modImpl()}__MODULES.cache.f=v end return v.c end end do local function __modImpl()

local function start()
for _,idleHandler in getconnections(game.Players.LocalPlayer.Idled)do
idleHandler:Disable()
end
end

return{
start=start,
}end function __MODULES.g()local v=__MODULES.cache.g if not v then v={c=__modImpl()}__MODULES.cache.g=v end return v.c end end do local function __modImpl()








local Styling={}


Styling.Colors={
Background=Color3.fromRGB(0,0,0),
BackgroundDark=Color3.fromRGB(0,0,0),
Surface=Color3.fromRGB(12,12,12),
SurfaceLight=Color3.fromRGB(22,22,22),
Header=Color3.fromRGB(6,6,6),
Border=Color3.fromRGB(32,32,32),
BorderDark=Color3.fromRGB(20,20,20),
Divider=Color3.fromRGB(24,24,24),
Text=Color3.fromRGB(255,255,255),
TextMuted=Color3.fromRGB(150,150,150),
TextDim=Color3.fromRGB(80,80,80),
Accent=Color3.fromRGB(46,230,128),
AccentDim=Color3.fromRGB(20,120,70),
Danger=Color3.fromRGB(235,80,80),
White=Color3.new(1,1,1),
Black=Color3.new(0,0,0),
}


function Styling.applyCorner(parent,radius)
local corner=Instance.new("UICorner")
corner.CornerRadius=UDim.new(0,radius or 8)
corner.Parent=parent
return corner
end


function Styling.applyPadding(parent,padding)
local pad=Instance.new("UIPadding")
local p=UDim.new(0,padding or 4)
pad.PaddingTop=p
pad.PaddingBottom=p
pad.PaddingLeft=p
pad.PaddingRight=p
pad.Parent=parent
return pad
end



function Styling.applyTripleStroke(parent)
local stroke=Instance.new("UIStroke")
stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
stroke.Color=Styling.Colors.Border
stroke.Thickness=1
stroke.Transparency=0.2
stroke.Name="Stroke"
stroke.Parent=parent
return stroke,stroke,stroke
end

function Styling.applyListLayout(
parent,
config





)
config=config or{}
local layout=Instance.new("UIListLayout")
layout.Padding=UDim.new(0,config.padding or 4)
layout.SortOrder=Enum.SortOrder.LayoutOrder
layout.FillDirection=config.horizontal and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical
if config.verticalAlign then
layout.VerticalAlignment=config.verticalAlign
end
if config.horizontalAlign then
layout.HorizontalAlignment=config.horizontalAlign
end
layout.Parent=parent
return layout
end

function Styling.applyFlexFill(parent)
local flex=Instance.new("UIFlexItem")
flex.FlexMode=Enum.UIFlexMode.Fill
flex.Parent=parent
return flex
end

return Styling end function __MODULES.h()local v=__MODULES.cache.h if not v then v={c=__modImpl()}__MODULES.cache.h=v end return v.c end end do local function __modImpl()







local UserInputService=game:GetService("UserInputService")

local Interaction={}


function Interaction.makeDraggable(
handle,
target,
options





)
options=options or{}

local dragging=false
local dragStart
local startPos
local activeTouchId



handle.InputBegan:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1 then
dragging=true
dragStart=input.Position
startPos=target.Position
activeTouchId=nil
elseif input.UserInputType==Enum.UserInputType.Touch and not dragging then
dragging=true
dragStart=input.Position
startPos=target.Position
activeTouchId=input
end
end)

UserInputService.InputEnded:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1 and activeTouchId==nil and dragging then
dragging=false
elseif input.UserInputType==Enum.UserInputType.Touch and input==activeTouchId then
dragging=false
activeTouchId=nil
end
end)


UserInputService.InputChanged:Connect(function(input)
if not dragging or not dragStart or not startPos then
return
end

local isValidInput=false
if input.UserInputType==Enum.UserInputType.MouseMovement and activeTouchId==nil then
isValidInput=true
elseif input.UserInputType==Enum.UserInputType.Touch and activeTouchId==input then
isValidInput=true
end

if not isValidInput then
return
end

local delta=input.Position-dragStart
local newX=startPos.X.Offset+delta.X
local newY=startPos.Y.Offset+delta.Y

if options and options.minX then
newX=math.max(options.minX,newX)
end
if options and options.maxX then
newX=math.min(options.maxX,newX)
end
if options and options.minY then
newY=math.max(options.minY,newY)
end
if options and options.maxY then
newY=math.min(options.maxY,newY)
end

target.Position=UDim2.new(startPos.X.Scale,newX,startPos.Y.Scale,newY)
end)
end


function Interaction.makeResizable(
handle,
target,
options





)
options=options or{}
local opts=options





local minWidth=opts.minWidth or 200
local minHeight=opts.minHeight or 150
local maxWidth=opts.maxWidth or 800
local maxHeight=opts.maxHeight or 600

local resizing=false
local resizeStart
local startSize
local activeTouchId


handle.InputBegan:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1 then
resizing=true
resizeStart=input.Position
startSize=target.Size
activeTouchId=nil
elseif input.UserInputType==Enum.UserInputType.Touch and not resizing then
resizing=true
resizeStart=input.Position
startSize=target.Size
activeTouchId=input
end
end)

UserInputService.InputEnded:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1 and activeTouchId==nil and resizing then
resizing=false
elseif input.UserInputType==Enum.UserInputType.Touch and input==activeTouchId then
resizing=false
activeTouchId=nil
end
end)


UserInputService.InputChanged:Connect(function(input)
if not resizing or not resizeStart or not startSize then
return
end


local isValidInput=false
if input.UserInputType==Enum.UserInputType.MouseMovement and activeTouchId==nil then
isValidInput=true
elseif input.UserInputType==Enum.UserInputType.Touch and activeTouchId==input then
isValidInput=true
end

if not isValidInput then
return
end

local delta=input.Position-resizeStart

local newWidth=math.clamp(startSize.X.Offset+delta.X,minWidth,maxWidth)
local newHeight=math.clamp(startSize.Y.Offset+delta.Y,minHeight,maxHeight)

target.Size=UDim2.new(startSize.X.Scale,newWidth,startSize.Y.Scale,newHeight)
end)
end

return Interaction end function __MODULES.i()local v=__MODULES.cache.i if not v then v={c=__modImpl()}__MODULES.cache.i=v end return v.c end end do local function __modImpl()








local Styling=__MODULES.h()
local Interaction=__MODULES.i()
local UserInputService=game:GetService("UserInputService")

local Window={}



























local function drawMinusIcon(parent,color)
local line=Instance.new("Frame")
line.AnchorPoint=Vector2.new(0.5,0.5)
line.BackgroundColor3=color
line.BorderSizePixel=0
line.Position=UDim2.new(0.5,0,0.5,0)
line.Size=UDim2.new(0,12,0,2)
line.Name="Icon"
line.Parent=parent
local corner=Instance.new("UICorner")
corner.CornerRadius=UDim.new(0,1)
corner.Parent=line
end


local function drawPlusIcon(parent,color)
local h=Instance.new("Frame")
h.AnchorPoint=Vector2.new(0.5,0.5)
h.BackgroundColor3=color
h.BorderSizePixel=0
h.Position=UDim2.new(0.5,0,0.5,0)
h.Size=UDim2.new(0,12,0,2)
h.Name="IconH"
h.Parent=parent
local hc=Instance.new("UICorner")
hc.CornerRadius=UDim.new(0,1)
hc.Parent=h

local v=Instance.new("Frame")
v.AnchorPoint=Vector2.new(0.5,0.5)
v.BackgroundColor3=color
v.BorderSizePixel=0
v.Position=UDim2.new(0.5,0,0.5,0)
v.Size=UDim2.new(0,2,0,12)
v.Name="IconV"
v.Parent=parent
local vc=Instance.new("UICorner")
vc.CornerRadius=UDim.new(0,1)
vc.Parent=v
end


local function divider(parent,order)
local line=Instance.new("Frame")
line.BackgroundColor3=Styling.Colors.Divider
line.BorderSizePixel=0
line.LayoutOrder=order
line.Size=UDim2.new(1,0,0,1)
line.Name="Divider"
line.Parent=parent
return line
end

function Window.create(parent,config)
config=config or{}

local mainFrame=Instance.new("Frame")
mainFrame.Active=true
mainFrame.AnchorPoint=Vector2.new(0.5,0.5)
mainFrame.BackgroundColor3=Styling.Colors.Background
mainFrame.BorderSizePixel=0
mainFrame.Position=config.position or UDim2.new(0.5,0,0.5,0)
mainFrame.Size=config.size or UDim2.new(0,380,0,380)
mainFrame.ZIndex=2
mainFrame.Name="MainFrame"
mainFrame.Parent=parent

Styling.applyCorner(mainFrame,12)
Styling.applyPadding(mainFrame,16)
Styling.applyTripleStroke(mainFrame)
Styling.applyListLayout(mainFrame,{padding=10})


local header=Instance.new("Frame")
header.BackgroundTransparency=1
header.BorderSizePixel=0
header.LayoutOrder=-3
header.Size=UDim2.new(1,0,0,28)
header.Name="Header"
header.Parent=mainFrame

local title=Instance.new("TextLabel")
title.Font=Enum.Font.GothamBold
title.Text=config.title or"Auto Joiner"
title.TextColor3=Styling.Colors.Text
title.TextSize=15
title.TextXAlignment=Enum.TextXAlignment.Left
title.TextYAlignment=Enum.TextYAlignment.Center
title.AnchorPoint=Vector2.new(0,0.5)
title.BackgroundTransparency=1
title.BorderSizePixel=0
title.Position=UDim2.new(0,0,0.5,0)
title.Size=UDim2.new(1,-34,1,0)
title.Name="Title"
title.Parent=header

local minimize=Instance.new("TextButton")
minimize.Text=""
minimize.AnchorPoint=Vector2.new(1,0.5)
minimize.AutoButtonColor=false
minimize.BackgroundColor3=Styling.Colors.Surface
minimize.BorderSizePixel=0
minimize.Position=UDim2.new(1,0,0.5,0)
minimize.Size=UDim2.new(0,26,0,26)
minimize.ZIndex=3
minimize.Name="Minimize"
minimize.Parent=header

Styling.applyCorner(minimize,6)
local minStroke=Instance.new("UIStroke")
minStroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
minStroke.Color=Styling.Colors.Border
minStroke.Thickness=1
minStroke.Transparency=0.2
minStroke.Parent=minimize

drawMinusIcon(minimize,Styling.Colors.Text)

minimize.MouseEnter:Connect(function()
minimize.BackgroundColor3=Styling.Colors.SurfaceLight
end)
minimize.MouseLeave:Connect(function()
minimize.BackgroundColor3=Styling.Colors.Surface
end)

divider(mainFrame,-2)


local tabs=Instance.new("Frame")
tabs.BackgroundTransparency=1
tabs.BorderSizePixel=0
tabs.LayoutOrder=-1
tabs.Size=UDim2.new(1,0,0,28)
tabs.Name="Tabs"
tabs.Parent=mainFrame

Styling.applyListLayout(tabs,{padding=18,horizontal=true})

divider(mainFrame,0)


local container=Instance.new("CanvasGroup")
container.AnchorPoint=Vector2.new(0.5,1)
container.BackgroundTransparency=1
container.BorderSizePixel=0
container.LayoutOrder=1
container.Position=UDim2.new(0.5,0,1,0)
container.Size=UDim2.new(1,0,0,0)
container.Name="Container"
container.Parent=mainFrame

Styling.applyFlexFill(container)

local pageLayout=Instance.new("UIPageLayout")
pageLayout.Padding=UDim.new(0,8)
pageLayout.SortOrder=Enum.SortOrder.LayoutOrder
pageLayout.Parent=container


local folder=Instance.new("Folder")
folder.Name="Controls"
folder.Parent=mainFrame

local resize=Instance.new("ImageButton")
resize.Image="rbxassetid://88404375183071"
resize.ImageTransparency=0.5
resize.ImageColor3=Styling.Colors.TextMuted
resize.AnchorPoint=Vector2.new(1,1)
resize.BackgroundTransparency=1
resize.BorderSizePixel=0
resize.Position=UDim2.new(1,-4,1,-4)
resize.Size=UDim2.new(0,14,0,14)
resize.ZIndex=3
resize.Name="Resize"
resize.Parent=folder


local downslam=Instance.new("ImageButton")
downslam.BackgroundTransparency=1
downslam.ImageTransparency=1
downslam.Size=UDim2.new(0,0,0,0)
downslam.Visible=false
downslam.Name="Downslam"
downslam.Parent=folder






Interaction.makeDraggable(mainFrame,mainFrame)
Interaction.makeDraggable(header,mainFrame)
Interaction.makeDraggable(title,mainFrame)
Interaction.makeResizable(resize,mainFrame,{
minWidth=config.minWidth or 300,
minHeight=config.minHeight or 280,
})


local minimizedFrame=Instance.new("Frame")
minimizedFrame.Active=true
minimizedFrame.AnchorPoint=Vector2.new(0.5,0)
minimizedFrame.AutomaticSize=Enum.AutomaticSize.X
minimizedFrame.BackgroundColor3=Styling.Colors.Background
minimizedFrame.BorderSizePixel=0
minimizedFrame.Position=UDim2.new(0.5,0,0,16)
minimizedFrame.Size=UDim2.new(0,0,0,40)
minimizedFrame.Visible=false
minimizedFrame.ZIndex=2
minimizedFrame.Name="MinimizedFrame"
minimizedFrame.Parent=parent

Styling.applyCorner(minimizedFrame,10)
Styling.applyTripleStroke(minimizedFrame)
Styling.applyPadding(minimizedFrame,8)
Styling.applyListLayout(minimizedFrame,{
padding=12,
horizontal=true,
verticalAlign=Enum.VerticalAlignment.Center,
})

local minimizedContent=Instance.new("Frame")
minimizedContent.AutomaticSize=Enum.AutomaticSize.X
minimizedContent.BackgroundTransparency=1
minimizedContent.BorderSizePixel=0
minimizedContent.LayoutOrder=1
minimizedContent.Size=UDim2.new(0,0,1,0)
minimizedContent.Name="Content"
minimizedContent.Parent=minimizedFrame

Styling.applyListLayout(minimizedContent,{
padding=14,
horizontal=true,
verticalAlign=Enum.VerticalAlignment.Center,
})

local expand=Instance.new("TextButton")
expand.Text=""
expand.AutoButtonColor=false
expand.BackgroundColor3=Styling.Colors.Surface
expand.BorderSizePixel=0
expand.LayoutOrder=2
expand.Size=UDim2.new(0,26,0,26)
expand.Name="Expand"
expand.Parent=minimizedFrame

Styling.applyCorner(expand,6)
local expStroke=Instance.new("UIStroke")
expStroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
expStroke.Color=Styling.Colors.Border
expStroke.Thickness=1
expStroke.Transparency=0.2
expStroke.Parent=expand

drawPlusIcon(expand,Styling.Colors.TextMuted)

expand.MouseEnter:Connect(function()
expand.BackgroundColor3=Styling.Colors.SurfaceLight
end)
expand.MouseLeave:Connect(function()
expand.BackgroundColor3=Styling.Colors.Surface
end)

Interaction.makeDraggable(minimizedFrame,minimizedFrame)



if UserInputService.TouchEnabled then
local vp=workspace.CurrentCamera.ViewportSize
local shortSide=math.min(vp.X,vp.Y)
local scale=math.clamp(shortSide*0.88/380,0.7,1.5)

local mainScale=Instance.new("UIScale")
mainScale.Scale=scale
mainScale.Parent=mainFrame

local miniScale=Instance.new("UIScale")
miniScale.Scale=scale
miniScale.Parent=minimizedFrame
end

local minimized=false
local function setMinimized(state)
minimized=state
mainFrame.Visible=not state
minimizedFrame.Visible=state
end

local function isMinimized()
return minimized
end

minimize.MouseButton1Click:Connect(function()
setMinimized(true)
end)

expand.MouseButton1Click:Connect(function()
setMinimized(false)
end)

return{
Frame=mainFrame,
Header=header,
Title=title,
Container=container,
Tabs=tabs,
Resize=resize,
Downslam=downslam,
Minimize=minimize,
MinimizedFrame=minimizedFrame,
MinimizedContent=minimizedContent,
Expand=expand,
setMinimized=setMinimized,
isMinimized=isMinimized,
PageLayout=pageLayout,
}
end

return Window end function __MODULES.j()local v=__MODULES.cache.j if not v then v={c=__modImpl()}__MODULES.cache.j=v end return v.c end end do local function __modImpl()








local Styling=__MODULES.h()

local Tab={}







function Tab.create(parent,config)
local button=Instance.new("TextButton")
button.Font=Enum.Font.GothamMedium
button.AutoButtonColor=false
button.Text=config.text
button.TextSize=13
button.AutomaticSize=Enum.AutomaticSize.X
button.BackgroundTransparency=1
button.BorderSizePixel=0
button.Size=UDim2.new(0,0,1,0)
button.LayoutOrder=config.layoutOrder or 0
button.Name=config.text
button.Parent=parent

local underline=Instance.new("Frame")
underline.AnchorPoint=Vector2.new(0.5,1)
underline.BackgroundColor3=Styling.Colors.Text
underline.BorderSizePixel=0
underline.Position=UDim2.new(0.5,0,1,0)
underline.Size=UDim2.new(1,0,0,1)
underline.Name="Underline"
underline.Parent=button

if config.active then
button.TextColor3=Styling.Colors.Text
underline.Visible=true
else
button.TextColor3=Styling.Colors.TextDim
underline.Visible=false
end

return button
end

function Tab.setActive(button,active)
local underline=button:FindFirstChild("Underline")
if active then
button.TextColor3=Styling.Colors.Text
if underline then
(underline).Visible=true
end
else
button.TextColor3=Styling.Colors.TextDim
if underline then
(underline).Visible=false
end
end
end

return Tab end function __MODULES.k()local v=__MODULES.cache.k if not v then v={c=__modImpl()}__MODULES.cache.k=v end return v.c end end do local function __modImpl()







local Styling=__MODULES.h()

local Page={}






function Page.create(parent,config)
local page=Instance.new("Frame")
page.BackgroundTransparency=1
page.BorderSizePixel=0
page.Size=UDim2.new(1,0,1,0)
page.Name=config.name
page.LayoutOrder=config.layoutOrder or 0
page.Parent=parent

Styling.applyListLayout(page,{padding=4})
Styling.applyPadding(page,4)

return page
end

return Page end function __MODULES.l()local v=__MODULES.cache.l if not v then v={c=__modImpl()}__MODULES.cache.l=v end return v.c end end do local function __modImpl()









local Styling=__MODULES.h()

local Row={}






function Row.create(parent,config)
config=config or{}

local outer=Instance.new("Frame")
outer.BackgroundTransparency=1
outer.BorderSizePixel=0
outer.Size=UDim2.new(1,0,0,config.height or 44)
outer.LayoutOrder=config.layoutOrder or 0
outer.Name="Row"
outer.Parent=parent

local inner=Instance.new("Frame")
inner.BackgroundTransparency=1
inner.BorderSizePixel=0
inner.Position=UDim2.new(0,0,0,0)
inner.Size=UDim2.new(1,0,1,-1)
inner.Name="Inner"
inner.Parent=outer

Styling.applyListLayout(inner,{
padding=8,
horizontal=true,
verticalAlign=Enum.VerticalAlignment.Center,
})

local innerPad=Instance.new("UIPadding")
innerPad.PaddingLeft=UDim.new(0,4)
innerPad.PaddingRight=UDim.new(0,4)
innerPad.Parent=inner

local divider=Instance.new("Frame")
divider.AnchorPoint=Vector2.new(0.5,1)
divider.BackgroundColor3=Styling.Colors.Divider
divider.BorderSizePixel=0
divider.Position=UDim2.new(0.5,0,1,0)
divider.Size=UDim2.new(1,0,0,1)
divider.Name="Divider"
divider.Parent=outer

return inner
end

function Row.addTitle(parent,text)
local label=Instance.new("TextLabel")
label.Font=Enum.Font.GothamMedium
label.Text=text
label.TextColor3=Styling.Colors.TextMuted
label.TextSize=13
label.TextXAlignment=Enum.TextXAlignment.Left
label.AutomaticSize=Enum.AutomaticSize.XY
label.BackgroundTransparency=1
label.BorderSizePixel=0
label.LayoutOrder=1
label.Name="Title"
label.Parent=parent
return label
end

function Row.addContent(parent)
local content=Instance.new("Frame")
content.BackgroundTransparency=1
content.BorderSizePixel=0
content.LayoutOrder=2
content.Size=UDim2.new(1,0,1,0)
content.Name="Content"
content.Parent=parent

Styling.applyFlexFill(content)
Styling.applyListLayout(content,{
padding=8,
horizontal=true,
horizontalAlign=Enum.HorizontalAlignment.Right,
verticalAlign=Enum.VerticalAlignment.Center,
})

return content
end

return Row end function __MODULES.m()local v=__MODULES.cache.m if not v then v={c=__modImpl()}__MODULES.cache.m=v end return v.c end end do local function __modImpl()








local TweenService=game:GetService("TweenService")
local Styling=__MODULES.h()

local Toggle={}











local TRACK_WIDTH=40
local TRACK_HEIGHT=22
local KNOB_SIZE=16
local KNOB_PAD=3

function Toggle.create(parent,config)
config=config or{}
local state=config.default or false

local button=Instance.new("TextButton")
button.Text=""
button.AutoButtonColor=false
button.BackgroundColor3=if state then Styling.Colors.Accent else Styling.Colors.SurfaceLight
button.BorderSizePixel=0
button.Size=UDim2.new(0,TRACK_WIDTH,0,TRACK_HEIGHT)
button.Name="Toggle"
button.Parent=parent

Styling.applyCorner(button,TRACK_HEIGHT/2)

local stroke=Instance.new("UIStroke")
stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
stroke.Color=Styling.Colors.Border
stroke.Thickness=1
stroke.Transparency=0.3
stroke.Parent=button

local knob=Instance.new("Frame")
knob.AnchorPoint=Vector2.new(0,0.5)
knob.BackgroundColor3=Styling.Colors.White
knob.BorderSizePixel=0
knob.Size=UDim2.new(0,KNOB_SIZE,0,KNOB_SIZE)
knob.Position=UDim2.new(0,if state then(TRACK_WIDTH-KNOB_SIZE-KNOB_PAD)else KNOB_PAD,0.5,0)
knob.Name="Knob"
knob.Parent=button

Styling.applyCorner(knob,KNOB_SIZE/2)

local function updateVisual()
local targetX=if state then(TRACK_WIDTH-KNOB_SIZE-KNOB_PAD)else KNOB_PAD
local targetColor=if state then Styling.Colors.Accent else Styling.Colors.SurfaceLight
local info=TweenInfo.new(0.15,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
TweenService:Create(knob,info,{Position=UDim2.new(0,targetX,0.5,0)}):Play()
TweenService:Create(button,info,{BackgroundColor3=targetColor}):Play()
end

local function setValue(newState,triggerCallback)
if state~=newState then
state=newState
updateVisual()
if triggerCallback~=false and config.onChanged then
config.onChanged(state)
end
end
end

button.MouseButton1Click:Connect(function()
setValue(not state,true)
end)

return{
button=button,
setValue=setValue,
}
end

return Toggle end function __MODULES.n()local v=__MODULES.cache.n if not v then v={c=__modImpl()}__MODULES.cache.n=v end return v.c end end do local function __modImpl()







local Styling=__MODULES.h()

local Badge={}






function Badge.create(parent,config)
local color=config.color or Styling.Colors.Accent


local dot=Instance.new("Frame")
dot.BackgroundColor3=color
dot.BorderSizePixel=0
dot.Size=UDim2.new(0,8,0,8)
dot.LayoutOrder=1
dot.Name="Dot"
dot.Parent=parent

Styling.applyCorner(dot,4)

local stroke=Instance.new("UIStroke")
stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
stroke.Color=color
stroke.Thickness=3
stroke.Parent=dot


local label=Instance.new("TextLabel")
label.Font=Enum.Font.Gotham
label.Text=config.text
label.TextColor3=color
label.TextSize=14
label.TextXAlignment=Enum.TextXAlignment.Left
label.AutomaticSize=Enum.AutomaticSize.XY
label.BackgroundTransparency=1
label.BorderSizePixel=0
label.LayoutOrder=2
label.Parent=parent

return dot,label
end

return Badge end function __MODULES.o()local v=__MODULES.cache.o if not v then v={c=__modImpl()}__MODULES.cache.o=v end return v.c end end do local function __modImpl()








local Styling=__MODULES.h()

local Status={}










function Status.create(parent,config)
config=config or{}
local isActive=config.active~=false

local dot=Instance.new("Frame")
dot.BorderSizePixel=0
dot.Size=UDim2.new(0,8,0,8)
dot.LayoutOrder=1
dot.Name="Dot"
dot.Parent=parent

Styling.applyCorner(dot,4)

local stroke=Instance.new("UIStroke")
stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
stroke.Thickness=2
stroke.Transparency=0.6
stroke.Name="DotStroke"
stroke.Parent=dot

local function setActive(active)
isActive=active
local color=active and Styling.Colors.Accent or Styling.Colors.Danger
dot.BackgroundColor3=color
stroke.Color=color
end

setActive(isActive)

return{
Dot=dot,
setActive=setActive,
}
end

return Status end function __MODULES.p()local v=__MODULES.cache.p if not v then v={c=__modImpl()}__MODULES.cache.p=v end return v.c end end do local function __modImpl()








local Styling=__MODULES.h()

local Counter={}











function Counter.create(parent,config)
config=config or{}
local currentValue=config.value or 0


local label=Instance.new("TextLabel")
label.Font=Enum.Font.GothamMedium
label.TextColor3=Styling.Colors.Text
label.TextSize=13
label.TextXAlignment=Enum.TextXAlignment.Right
label.AutomaticSize=Enum.AutomaticSize.XY
label.BackgroundTransparency=1
label.BorderSizePixel=0
label.Name="CounterLabel"
label.Parent=parent


local function formatNumber(n)
local formatted=tostring(n)
local k
while true do
formatted,k=string.gsub(formatted,"^(-?%d+)(%d%d%d)","%1,%2")
if k==0 then
break
end
end
return formatted
end


local function setValue(value)
currentValue=value
label.Text=formatNumber(value)
end


local function getValue()
return currentValue
end


setValue(currentValue)

return{
Label=label,
setValue=setValue,
getValue=getValue,
}
end

return Counter end function __MODULES.q()local v=__MODULES.cache.q if not v then v={c=__modImpl()}__MODULES.cache.q=v end return v.c end end do local function __modImpl()








local Styling=__MODULES.h()

local Button={}
















function Button.create(parent,config)
local cfg=config or{}
local variant=cfg.variant or"default"
local size=cfg.size or"md"

local sizes={
sm={height=26,paddingH=10,fontSize=12},
md={height=32,paddingH=14,fontSize=13},
lg={height=38,paddingH=18,fontSize=14},
}
local sizeConfig=sizes[size]

local variants={
default={
bg=Styling.Colors.Surface,
bgHover=Styling.Colors.SurfaceLight,
text=Styling.Colors.Text,
border=Styling.Colors.Border,
bgTransparency=0,
},
primary={
bg=Styling.Colors.White,
bgHover=Color3.fromRGB(220,220,220),
text=Styling.Colors.Black,
border=Styling.Colors.White,
bgTransparency=0,
},
secondary={
bg=Styling.Colors.SurfaceLight,
bgHover=Styling.Colors.Border,
text=Styling.Colors.Text,
border=Styling.Colors.Border,
bgTransparency=0,
},
ghost={
bg=Styling.Colors.Black,
bgHover=Styling.Colors.Surface,
text=Styling.Colors.TextMuted,
border=Styling.Colors.Black,
bgTransparency=1,
},
}
local variantConfig=variants[variant]

local button=Instance.new("TextButton")
button.Font=Enum.Font.GothamMedium
button.Text=cfg.text or"Button"
button.TextSize=sizeConfig.fontSize
button.TextColor3=variantConfig.text
button.BackgroundColor3=variantConfig.bg
button.BackgroundTransparency=variantConfig.bgTransparency
button.BorderSizePixel=0
button.Size=UDim2.new(0,0,0,sizeConfig.height)
button.AutomaticSize=Enum.AutomaticSize.X
button.Name="Button"
button.Parent=parent
button.AutoButtonColor=false

Styling.applyCorner(button,6)

local paddingX=Instance.new("UIPadding")
paddingX.PaddingLeft=UDim.new(0,sizeConfig.paddingH)
paddingX.PaddingRight=UDim.new(0,sizeConfig.paddingH)
paddingX.Parent=button

local stroke=Instance.new("UIStroke")
stroke.Color=variantConfig.border
stroke.Thickness=1
stroke.Transparency=if variant=="primary"then 1 else 0.3
stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
stroke.Parent=button

local isEnabled=true

button.MouseEnter:Connect(function()
if isEnabled then
button.BackgroundColor3=variantConfig.bgHover
if variant=="ghost"then
button.BackgroundTransparency=0
end
end
end)

button.MouseLeave:Connect(function()
if isEnabled then
button.BackgroundColor3=variantConfig.bg
button.BackgroundTransparency=variantConfig.bgTransparency
end
end)

button.MouseButton1Click:Connect(function()
if isEnabled and cfg.onClick then
cfg.onClick()
end
end)

local function setText(newText)
button.Text=newText
end

local function setEnabled(enabled)
isEnabled=enabled
button.BackgroundColor3=if enabled then variantConfig.bg else Styling.Colors.Surface
button.TextColor3=if enabled then variantConfig.text else Styling.Colors.TextDim
stroke.Color=if enabled then variantConfig.border else Styling.Colors.Border
end

return{
button=button,
setText=setText,
setEnabled=setEnabled,
}
end

return Button end function __MODULES.r()local v=__MODULES.cache.r if not v then v={c=__modImpl()}__MODULES.cache.r=v end return v.c end end do local function __modImpl()








local Styling=__MODULES.h()

local Logs={}




















function Logs.create(parent,config)
local cfg=config or{}
local maxLines=cfg.maxLines or 50
local height=cfg.height or 100

local entries={}
local nextOrder=0


local frame=Instance.new("Frame")
frame.BackgroundColor3=Styling.Colors.Surface
frame.BorderSizePixel=0
frame.Size=UDim2.new(1,0,0,height)
frame.Name="LogsContainer"
frame.Parent=parent

Styling.applyCorner(frame,8)

local stroke=Instance.new("UIStroke")
stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
stroke.Color=Styling.Colors.Border
stroke.Thickness=1
stroke.Transparency=0.3
stroke.Parent=frame


local scrollFrame=Instance.new("ScrollingFrame")
scrollFrame.BackgroundTransparency=1
scrollFrame.BorderSizePixel=0
scrollFrame.Size=UDim2.new(1,-8,1,-8)
scrollFrame.Position=UDim2.new(0,4,0,4)
scrollFrame.ScrollBarThickness=4
scrollFrame.ScrollBarImageColor3=Styling.Colors.TextMuted
scrollFrame.CanvasSize=UDim2.new(0,0,0,0)
scrollFrame.AutomaticCanvasSize=Enum.AutomaticSize.Y
scrollFrame.Name="LogsScroll"
scrollFrame.Parent=frame

local layout=Instance.new("UIListLayout")
layout.FillDirection=Enum.FillDirection.Vertical
layout.SortOrder=Enum.SortOrder.LayoutOrder
layout.Padding=UDim.new(0,2)
layout.Parent=scrollFrame


local levelColors={
info=Styling.Colors.TextMuted,
warn=Color3.fromRGB(255,193,7),
error=Color3.fromRGB(244,67,54),
success=Styling.Colors.Accent,
}


local function formatTime(timestamp)
local timeData=os.date("*t",timestamp)
return string.format("%02d:%02d:%02d",timeData.hour,timeData.min,timeData.sec)
end


local function addLog(message,level)
level=level or"info"
local timestamp=os.time()

local entry={
message=message,
timestamp=timestamp,
level=level,
}
table.insert(entries,entry)


while#entries>maxLines do
table.remove(entries,1)

local firstChild
for _,child in scrollFrame:GetChildren()do
if child:IsA("TextLabel")then
if firstChild==nil or child.LayoutOrder<firstChild.LayoutOrder then
firstChild=child
end
end
end
if firstChild then
firstChild:Destroy()
end
end


local logLabel=Instance.new("TextLabel")
logLabel.Font=Enum.Font.Code
logLabel.TextColor3=levelColors[level]or Styling.Colors.TextMuted
logLabel.TextSize=11
logLabel.TextXAlignment=Enum.TextXAlignment.Left
logLabel.Text=string.format("[%s] %s",formatTime(timestamp),message)
logLabel.AutomaticSize=Enum.AutomaticSize.Y
logLabel.Size=UDim2.new(1,-4,0,0)
logLabel.TextWrapped=true
logLabel.BackgroundTransparency=1
logLabel.BorderSizePixel=0
nextOrder+=1
logLabel.LayoutOrder=nextOrder
logLabel.RichText=false
logLabel.Name="LogEntry_"..#entries
logLabel.Parent=scrollFrame


task.defer(function()
scrollFrame.CanvasPosition=Vector2.new(0,scrollFrame.AbsoluteCanvasSize.Y)
end)
end


local function clear()
entries={}
for _,child in scrollFrame:GetChildren()do
if child:IsA("TextLabel")then
child:Destroy()
end
end
end


local function getEntries()
return entries
end

return{
Frame=frame,
ScrollFrame=scrollFrame,
addLog=addLog,
clear=clear,
getEntries=getEntries,
}
end

return Logs end function __MODULES.s()local v=__MODULES.cache.s if not v then v={c=__modImpl()}__MODULES.cache.s=v end return v.c end end do local function __modImpl()








local Styling=__MODULES.h()

local Timer={}

















function Timer.create(parent,config)
local cfg=config or{}
local isCountdown=cfg.countdown or false
local initialTime=cfg.startTime or 0
local autoStart=cfg.autoStart or false

local currentTime=initialTime
local running=false
local connection
local lastTick=0


local label=Instance.new("TextLabel")
label.Font=Enum.Font.Code
label.TextColor3=Styling.Colors.Text
label.TextSize=13
label.TextXAlignment=Enum.TextXAlignment.Right
label.AutomaticSize=Enum.AutomaticSize.XY
label.BackgroundTransparency=1
label.BorderSizePixel=0
label.Name="TimerLabel"
label.Parent=parent


local function formatTime(seconds)
local hours=math.floor(seconds/3600)
local mins=math.floor((seconds%3600)/60)
local secs=math.floor(seconds%60)

if hours>0 then
return string.format("%02d:%02d:%02d",hours,mins,secs)
else
return string.format("%02d:%02d",mins,secs)
end
end


local function updateDisplay()
label.Text=formatTime(currentTime)


if isCountdown then
if currentTime<=10 then
label.TextColor3=Color3.fromRGB(244,67,54)
elseif currentTime<=30 then
label.TextColor3=Color3.fromRGB(255,193,7)
else
label.TextColor3=Styling.Colors.Text
end
end
end


local function stop()
running=false
if connection then
connection:Disconnect()
connection=nil
end
end


local function start()
if running then
return
end
running=true
lastTick=tick()

connection=game:GetService("RunService").Heartbeat:Connect(function()
local now=tick()
local delta=now-lastTick
lastTick=now

if isCountdown then
currentTime=math.max(0,currentTime-delta)
if currentTime<=0 then
stop()
end
else
currentTime=currentTime+delta
end

updateDisplay()
end)
end


local function reset()
stop()
currentTime=initialTime
updateDisplay()
end


local function setTime(seconds)
currentTime=seconds
initialTime=seconds
updateDisplay()
end


local function getTime()
return currentTime
end


local function isRunningFn()
return running
end


updateDisplay()


if autoStart then
start()
end

return{
Label=label,
start=start,
stop=stop,
reset=reset,
setTime=setTime,
getTime=getTime,
isRunning=isRunningFn,
}
end

return Timer end function __MODULES.t()local v=__MODULES.cache.t if not v then v={c=__modImpl()}__MODULES.cache.t=v end return v.c end end do local function __modImpl()



























local UI={

Styling=__MODULES.h(),
Interaction=__MODULES.i(),


Window=__MODULES.j(),
Tab=__MODULES.k(),
Page=__MODULES.l(),
Row=__MODULES.m(),
Toggle=__MODULES.n(),
Badge=__MODULES.o(),
Status=__MODULES.p(),
Counter=__MODULES.q(),
Button=__MODULES.r(),
Logs=__MODULES.s(),
Timer=__MODULES.t(),
}

return UI end function __MODULES.u()local v=__MODULES.cache.u if not v then v={c=__modImpl()}__MODULES.cache.u=v end return v.c end end do local function __modImpl()

local RunService=game:GetService("RunService")
local Lighting=game:GetService("Lighting")

local function apply(enabled)
RunService:Set3dRenderingEnabled(not enabled)
setfpscap(if enabled then 30 else 60)
end

local function applyInitial(enabled)
if enabled then
settings().Rendering.QualityLevel=1
settings().Rendering.MeshCacheSize=32
settings().Rendering.EnableFRM=false

Lighting.GlobalShadows=false
Lighting.FogEnd=10
Lighting.Brightness=0

for _,instance in workspace:GetDescendants()do
if instance:IsA("ParticleEmitter")or instance:IsA("Trail")then
instance.Enabled=false
end
end
end

apply(enabled)
end

return{
applyInitial=applyInitial,
apply=apply,
}end function __MODULES.v()local v=__MODULES.cache.v if not v then v={c=__modImpl()}__MODULES.cache.v=v end return v.c end end do local function __modImpl()

local UI=__MODULES.u()

local Players=game:GetService("Players")
local STAGE_NAMES={POLLING="Searching",TELEPORTING="Teleporting",TRANSFERING="Trading"}
local MAX_LOGS=50

local function label(parent,value)
local caption=Instance.new("TextLabel")
caption.BackgroundTransparency=1
caption.Font=Enum.Font.GothamMedium
caption.TextSize=13
caption.TextColor3=UI.Styling.Colors.Text
caption.Text=value
caption.AutomaticSize=Enum.AutomaticSize.XY
caption.Size=UDim2.fromOffset(0,0)
caption.Parent=parent

return caption
end

local function row(parent,title,order)
local inner=UI.Row.create(parent,{layoutOrder=order,height=36})
UI.Row.addTitle(inner,title)

return UI.Row.addContent(inner)
end

local function View(configuration,state)
local settings=configuration.get()
local screenGui
local isBuilt=false
local logs
local pendingLogs={}
local pendingNotifications={}
local update=function()end

local function renderNotification(message,duration)
if not settings.notifications or not isBuilt then
return
end

local toast=Instance.new("Frame")
toast.BackgroundColor3=UI.Styling.Colors.Background
toast.BorderSizePixel=0
toast.AnchorPoint=Vector2.new(1,0)
toast.Position=UDim2.new(1,-16,0,16)
toast.Size=UDim2.fromOffset(280,0)
toast.AutomaticSize=Enum.AutomaticSize.Y
toast.ZIndex=10
toast.Parent=screenGui
UI.Styling.applyCorner(toast,10)
UI.Styling.applyTripleStroke(toast)
UI.Styling.applyPadding(toast,12)
local caption=label(toast,message)
caption.AutomaticSize=Enum.AutomaticSize.Y
caption.Size=UDim2.new(1,0,0,0)
caption.TextWrapped=true
caption.ZIndex=11
task.delay(math.max(0,duration),function()toast:Destroy()end)
end

local function flush()
local messages=pendingLogs
pendingLogs={}
for _,message in messages do
logs.addLog(message)
end

local notifications=pendingNotifications
pendingNotifications={}
for _,notification in notifications do
renderNotification(notification.message,notification.duration)
end
end

local function saveSettings()
configuration.save(settings)
end

local function buildUI()
screenGui=Instance.new("ScreenGui")
screenGui.Name="BladeBallAutoJoiner"
screenGui.IgnoreGuiInset=false
screenGui.ResetOnSpawn=false
screenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
screenGui.Parent=gethui()

local window=UI.Window.create(screenGui,{title="Auto Joiner",size=UDim2.fromOffset(380,450),minHeight=450})

local scales={}
for _,frame in{window.Frame,window.MinimizedFrame}do
local scale=frame:FindFirstChildOfClass("UIScale")or Instance.new("UIScale")
scale.Parent=frame
table.insert(scales,{instance=scale,base=scale.Scale})
end

local function applyScale()
for _,entry in scales do
entry.instance.Scale=entry.base*settings.textScale
end
end

applyScale()

local statsTab=UI.Tab.create(window.Tabs,{text="Stats",active=true,layoutOrder=0})
local settingsTab=UI.Tab.create(window.Tabs,{text="Settings",layoutOrder=1})
local statsPage=UI.Page.create(window.Container,{name="Stats",layoutOrder=0})
local settingsPage=UI.Page.create(window.Container,{name="Settings",layoutOrder=1})
window.PageLayout.TouchInputEnabled=false
window.PageLayout.ScrollWheelInputEnabled=false
window.PageLayout.GamepadInputEnabled=false

local function selectPage(showStats)
UI.Tab.setActive(statsTab,showStats)
UI.Tab.setActive(settingsTab,not showStats)
window.PageLayout:JumpTo(if showStats then statsPage else settingsPage)
end

statsTab.MouseButton1Click:Connect(function()selectPage(true)end)
settingsTab.MouseButton1Click:Connect(function()selectPage(false)end)
selectPage(true)

local statusContent=row(statsPage,"API Status:",0)
local mainStatus=UI.Status.create(statusContent,{active=false})
local statusText=label(statusContent,"Disconnected")
statusText.LayoutOrder=2
local mainItems=UI.Counter.create(row(statsPage,"Items in Inventory:",1),{value=state.inventory})
local stageText=label(row(statsPage,"Stage:",2),"Searching")
local targetText=label(row(statsPage,"Target:",3),"No target yet")
targetText.AutomaticSize=Enum.AutomaticSize.None
targetText.Size=UDim2.new(1,0,1,0)
targetText.TextXAlignment=Enum.TextXAlignment.Right
targetText.TextTruncate=Enum.TextTruncate.AtEnd
local stageTimer=UI.Timer.create(row(statsPage,"Stage timer:",4))
local miniStatus=UI.Status.create(window.MinimizedContent,{active=false})
local miniItems=UI.Counter.create(window.MinimizedContent,{value=state.inventory})
local miniTimer=UI.Timer.create(window.MinimizedContent)
miniItems.Label.LayoutOrder=2
miniTimer.Label.LayoutOrder=3
logs=UI.Logs.create(statsPage,{maxLines=MAX_LOGS,height=100})
logs.Frame.LayoutOrder=5

UI.Styling.applyFlexFill(logs.Frame)

UI.Toggle.create(row(settingsPage,"Allow Hits",0),{
default=not settings.paused,
onChanged=function(enabled)
settings.paused=not enabled
state.paused=settings.paused
saveSettings()
update()
end,
})
UI.Toggle.create(row(settingsPage,"FPS Optimization",1),{
default=settings.fpsOptimization,
onChanged=function(enabled)
settings.fpsOptimization=enabled
saveSettings()
local Performance=__MODULES.v()
Performance.apply(enabled)
end,
})
UI.Toggle.create(row(settingsPage,"Notifications",2),{
default=settings.notifications,
onChanged=function(enabled)
settings.notifications=enabled
saveSettings()
end,
})
local scaleContent=row(settingsPage,"Text size",3)
local scaleButtons={}

local function renderScaleButtons()
for value,button in scaleButtons do
button.button.TextColor3=if math.abs(settings.textScale-value)<0.001
then UI.Styling.Colors.Text else UI.Styling.Colors.TextMuted
end
end

for index,option in{{"S",0.9},{"M",1},{"L",1.25}}do
local value=option[2]
local button=UI.Button.create(scaleContent,{
text=option[1],size="sm",
onClick=function()
settings.textScale=value
saveSettings()
applyScale()
renderScaleButtons()
end,
})
button.button.LayoutOrder=index
scaleButtons[value]=button
end

renderScaleButtons()
UI.Button.create(row(settingsPage,"Rejoin",4),{
text="Click",variant="primary",size="sm",
onClick=function()
game:GetService("TeleportService"):Teleport(game.PlaceId)
end,
})

local lastStage=state.stage
local stageEnteredAt=os.clock()
update=function()
if state.stage~=lastStage then
lastStage=state.stage
stageEnteredAt=os.clock()
end

mainStatus.setActive(state.connected)
miniStatus.setActive(state.connected and not state.paused)
statusText.Text=if state.connected then"Connected"else"Disconnected"
mainItems.setValue(state.inventory)
miniItems.setValue(state.inventory)
stageText.Text=if state.paused then"Paused"else(STAGE_NAMES[state.stage]or state.stage)
targetText.Text=if state.hit then state.hit.username else"No target yet"
local elapsed=os.clock()-stageEnteredAt
stageTimer.setTime(elapsed)
miniTimer.setTime(elapsed)
end
end

local function log(message)

table.insert(pendingLogs,message)
if#pendingLogs>MAX_LOGS then
table.remove(pendingLogs,1)
end
end

local function notify(message,duration)
if not settings.notifications then
return
end

table.insert(pendingNotifications,{message=message,duration=duration})
if#pendingNotifications>10 then
table.remove(pendingNotifications,1)
end
end

local function start()
if isBuilt then
return
end

state.paused=settings.paused
buildUI()
isBuilt=true
flush()
update()
local Performance=__MODULES.v()
Performance.applyInitial(settings.fpsOptimization)
task.spawn(function()
while screenGui.Parent do
task.wait(1)
if screenGui.Parent then
local ok,message=pcall(function()
flush()
update()
end)

if not ok then
warn("[ui] refresh failed: "..tostring(message))
end
end
end
end)
end

return{start=start,log=log,notify=notify}
end

return View end function __MODULES.w()local v=__MODULES.cache.w if not v then v={c=__modImpl()}__MODULES.cache.w=v end return v.c end end do local function __modImpl()

repeat
task.wait()
until workspace:GetAttribute("ClientStarted")

task.wait(1)

local Config=__MODULES.a()
local Trade=__MODULES.d()
local Teleport=__MODULES.e()
local Inventory=__MODULES.f()
local AntiAfk=__MODULES.g()
local UI=__MODULES.w()

return function(api,storage)
local players=game:GetService("Players")
local state={
stage="POLLING",
hit=nil,
paused=false,
connected=false,

inventory=0,
tradeOpen=false,
emptyTrades=0,

activityAt=os.clock(),
answerAt=os.clock(),
tradeUpdatedAt=os.clock(),
}
local view=UI(storage.settings,state)

local function log(message)
print("[joiner] "..message)
local ok,reason=pcall(view.log,message)
if not ok then
warn("[ui] log failed: "..tostring(reason))
end
end

local teleport=Teleport({info=log,warn=log,error=log})
local inventory=Inventory()
local trade
local tradeGeneration=0
local awaitingResult=false
local hasSuccessfulTrade=false

local function every(seconds,callback)
task.spawn(function()
while true do
local ok,message=pcall(callback)
if not ok then
log(tostring(message))
end

task.wait(seconds)
end
end)
end

local function complete()
hasSuccessfulTrade=false
state.hit,state.tradeOpen,state.emptyTrades=nil,false,0
state.stage,state.answerAt="POLLING",os.clock()
local ok,reason=pcall(storage.clearHit)
if not ok then
log("could not clear saved target: "..tostring(reason))
end
end

local function failedTrade(reason)
state.tradeOpen=false
state.emptyTrades+=1
state.activityAt=os.clock()
log(reason)
if state.emptyTrades>=Config.MAX_EMPTY_TRADES then
complete()
end
end

local function cancelTrade(reason)
local generation,hit=tradeGeneration,state.hit

state.tradeOpen=false
local ok,message=pcall(trade.decline)
if not ok then
log(tostring(message))
end

if tradeGeneration==generation and state.hit==hit then
failedTrade(reason)
end
end

local function activate(hit)
hasSuccessfulTrade=false
state.hit,state.emptyTrades=hit,0
state.activityAt=os.clock()
if hit.serverId==game.JobId then
state.stage="TRANSFERING"
log("waiting for "..hit.username)
else
state.stage="TELEPORTING"
log("teleporting to "..hit.username)
if teleport.teleport(hit.serverId)==false and state.hit==hit then
log("teleport attempts exhausted")
complete()
end
end
end

local function onTrade(event,data)
if event=="tradeUpdated"then
state.activityAt,state.tradeUpdatedAt=os.clock(),os.clock()
elseif event=="tradeRequestReceived"then
if state.tradeOpen then
return
end

if not state.hit or state.hit.username~=data.username then
trade.rejectRequest(data.username)

return
end

state.activityAt=os.clock()
local ok,reason=trade.acceptRequest(data.username)
if ok then
ok,reason=trade.waitForOpen(data.username,20)
end
if not ok then log("request failed: "..tostring(reason))end
elseif event=="tradeOpened"then
local hit=state.hit
if not hit or hit.username~=data.username then trade.decline();return end
if state.tradeOpen then
return
end

tradeGeneration+=1
local generation=tradeGeneration
awaitingResult=false
state.tradeOpen=true
state.activityAt,state.tradeUpdatedAt=os.clock(),os.clock()
local ok,reason=trade.accept()
if not ok and state.hit==hit and state.tradeOpen and tradeGeneration==generation and not awaitingResult then
cancelTrade("ready/confirm failed: "..tostring(reason))
end
elseif event=="tradeClosed"then
awaitingResult=true
elseif event=="tradeFinished"then
if not state.tradeOpen or not state.hit then
return
end

if data.isSuccess and data.received>0 then
hasSuccessfulTrade=true
log(`trade complete: {data.received} items received`)
state.tradeOpen,state.emptyTrades=false,0
state.stage="TRANSFERING"
state.activityAt,state.tradeUpdatedAt=os.clock(),os.clock()
else
failedTrade("trade failed or brought no items")
end
end
end

trade=Trade.createTrade(function(event,data)
task.spawn(function()
local ok,message=pcall(onTrade,event,data)
if not ok then
log("trade event failed: "..tostring(message))
end
end)
end,true,log,5)

AntiAfk.start()
view.start()
local replicated=game:GetService("ReplicatedStorage")
replicated:WaitForChild("Shared"):WaitForChild("Trading"):WaitForChild("TradeInfo")
replicated:WaitForChild("Controllers"):WaitForChild("Trading"):WaitForChild("TradeTabController")
replicated:WaitForChild("Packages"):WaitForChild("Replion")
local saved=storage.getHit()
if saved then
activate(saved)
end

trade.listen()

task.spawn(function()
if not api.register(players.LocalPlayer.Name)then log("account registration failed")end
end)

every(0.8,function()
if state.paused or state.stage~="POLLING"then
return
end
local hit,connected=api.getHit()
state.connected=connected
if connected then
state.answerAt=os.clock()
end

if hit then storage.saveHit(hit);activate(hit)end
end)

every(1,function()
local now=os.clock()
if state.paused or state.stage~="POLLING"then
state.answerAt=now
elseif now-state.answerAt>Config.SILENCE_TIMEOUT_SECONDS then
state.answerAt=now
log("backend silent, rejoining")
teleport.rejoin()
state.answerAt=os.clock()
end

if state.tradeOpen then
if now-state.tradeUpdatedAt>Config.TRADE_DEADLINE_SECONDS then
cancelTrade("trade went quiet")
end
elseif state.stage=="TRANSFERING"and state.hit then
local elapsed=now-state.activityAt
local targetAbsent=elapsed>15 and not players:FindFirstChild(state.hit.username)
local initialTradeTimedOut=not hasSuccessfulTrade and elapsed>Config.TRANSFER_TIMEOUT_SECONDS

if targetAbsent or initialTradeTimedOut then
log(if targetAbsent then"target left the server"else"first trade timed out")
complete()
end
end
end)

every(1,function()state.inventory=inventory.count()end)

return state
end end function __MODULES.x()local v=__MODULES.cache.x if not v then v={c=__modImpl()}__MODULES.cache.x=v end return v.c end end end

if getgenv().executed then return end
getgenv().executed=true

local Config=__MODULES.a()
local API=__MODULES.b()
local Storage=__MODULES.c()
local start=__MODULES.x()

if not game:IsLoaded()then game.Loaded:Wait()end
if not table.find(Config.PLACE_IDS,game.PlaceId)then return end
assert(type(AUTHORIZATION_KEY)=="string"and#AUTHORIZATION_KEY>0,"Set AUTHORIZATION_KEY before running Joiner")
local players=game:GetService("Players")
while not players.LocalPlayer do task.wait()end

local source=getgenv().BLADE_BALL_JOINER_SOURCE
local queue=queue_on_teleport or(syn and syn.queue_on_teleport)
assert(type(source)=="string","Run the built out/joiner.luau")
assert(type(queue)=="function","Executor must support queue_on_teleport")
queue(string.format(
[[getgenv().AUTHORIZATION_KEY = %q; getgenv().BLADE_BALL_JOINER_SOURCE = %q; assert(loadstring(getgenv().BLADE_BALL_JOINER_SOURCE))()]],
AUTHORIZATION_KEY,source
))

start(API(AUTHORIZATION_KEY),Storage(tostring(players.LocalPlayer.UserId)))
]=]
assert(loadstring([=[local __MODULES={cache={}}do do local function __modImpl()




























































































































return{
API_BASE_URL="https://api.project-reverse.org/",
GAME="bb",
PLACE_IDS={13772394625},
TRANSFER_TIMEOUT_SECONDS=60,
SILENCE_TIMEOUT_SECONDS=30,
TRADE_DEADLINE_SECONDS=90,
MAX_EMPTY_TRADES=3,
}end function __MODULES.a()local v=__MODULES.cache.a if not v then v={c=__modImpl()}__MODULES.cache.a=v end return v.c end end do local function __modImpl()

local Config=__MODULES.a()
local HttpService=game:GetService("HttpService")

return function(authorizationKey)
local transport=request or http_request or(syn and syn.request)
assert(type(transport)=="function","Executor must support HTTP requests")
local function send(method,path,body)
local finished,expired,result=false,false
local worker=task.spawn(function()
local ok,response=pcall(transport,{
Url=Config.API_BASE_URL:gsub("/+$","")..path,
Method=method,
Headers={
["authorization-key"]=authorizationKey,
["exploit-api-key"]="bK5ZLj1VvjLUyo5bqh16F2VnOCduc8p2sSMATZMHKjxxgdkvto",
["content-type"]="application/json",
},
Body=if type(body)=="string"then body elseif body then HttpService:JSONEncode(body)else nil,
})
if expired then return end
if ok and type(response)=="table"then
local status=tonumber(response.StatusCode)or 0
if status>=200 and status<300 then
local decoded,envelope=pcall(HttpService.JSONDecode,HttpService,response.Body)
if decoded and type(envelope)=="table"then result=envelope end
end
end
finished=true
end)
local deadline=os.clock()+10
while not finished and os.clock()<deadline do task.wait(0.1)end
if not finished then expired=true;pcall(task.cancel,worker)end
return result
end

return{
getHit=function()
local envelope=send("POST","/hits/get-hit-for-joiner?game="..Config.GAME,"{}")
if not envelope then return nil,false end
if not envelope.success or envelope.data==nil then return nil,true end
local hit=envelope.data
if type(hit)~="table"or(type(hit.id)~="string"and type(hit.id)~="number")
or type(hit.username)~="string"or hit.username==""
or type(hit.serverId)~="string"or hit.serverId==""then return nil,false end
return hit,true
end,
register=function(username)
local envelope=send("GET","/users/me")
local data=envelope and envelope.success and envelope.data
if type(data)~="table"or type(data.usernames)~="table"then return false end
if table.find(data.usernames,username)then return true end
local response=send("POST","/users/add-usernames",{usernames={username}})
return response~=nil and response.success==true
end,
}
end end function __MODULES.b()local v=__MODULES.cache.b if not v then v={c=__modImpl()}__MODULES.cache.b=v end return v.c end end do local function __modImpl()

local HttpService=game:GetService("HttpService")

local function createStorage(userId)

local function createJsonFile(name)
local path=`prev-{name}-{userId}.json`
local value={}

if isfile(path)then
local ok,decoded=pcall(function()
return HttpService:JSONDecode(readfile(path))
end)

if ok and type(decoded)=="table"then
value=decoded
end
end

local function get()

return value
end

local function save(nextValue)
writefile(path,HttpService:JSONEncode(nextValue))
value=nextValue
end

return{
get=get,
save=save,
}
end

local hitFile=createJsonFile("hits")
local settingsFile=createJsonFile("view")

local function getHit()
local hit=hitFile.get()
if hit.id~=nil
and type(hit.username)=="string"
and hit.username~=""
and type(hit.serverId)=="string"
and hit.serverId~=""
then
return hit
end

return nil
end

local function clearHit()
hitFile.save({})
end

local function getSettings()
local value=settingsFile.get()
local textScale=if type(value.textScale)=="number"then value.textScale else 1

return{
paused=value.paused==true,
fpsOptimization=value.fpsOptimization==true,
notifications=value.notifications==true,
textScale=math.clamp(textScale,0.9,1.25),
}
end

return{
getHit=getHit,
saveHit=hitFile.save,
clearHit=clearHit,
settings={
get=getSettings,
save=settingsFile.save,
},
}
end

return createStorage end function __MODULES.c()local v=__MODULES.cache.c if not v then v={c=__modImpl()}__MODULES.cache.c=v end return v.c end end do local function __modImpl()


local GameAPI={}

function GameAPI.createTrade(onEvent,enabled,onDiagnostic,readyDelay)
local players=game:GetService("Players")
local storage=(game:GetService("ReplicatedStorage"))
local localPlayer=players.LocalPlayer
local connections={}
local listening=false
local partnerName
local isSuccess
local received
local sessionVersion=0
local sessionClosed=false
local acceptingVersion
local confirmedVersion
local lastReadiness

local function diagnostic(message)
if onDiagnostic then
onDiagnostic(message)
end
end

local function responseText(results)
local values={}
for index=1,results.n do
local value=results[index]
if type(value)=="table"then
local fields={}
for key,item in value do
table.insert(fields,tostring(key).."="..tostring(item))
if#fields>=8 then
break
end
end

value="{"..table.concat(fields,", ").."}"
end

table.insert(values,tostring(value))
end

return if#values==0 then"(no return values)"else table.concat(values," | ")
end

local function emit(name,payload)
if onEvent then
onEvent(name,payload)
end
end
local function remotes()
return require(storage.Shared.Trading.TradeInfo).Remotes
end

local function tabs()

return require(storage.Controllers.Trading.TradeTabController)
end

local function reportFinish()
if partnerName==nil then
return
end

if isSuccess==nil or(isSuccess and received==nil)then
return
end

local payload={isSuccess=isSuccess,received=received or 0}
partnerName,isSuccess,received=nil,nil,nil
sessionClosed=false
sessionVersion+=1
emit("tradeFinished",payload)
end

local function countReceived(entry)
local total=0
for _,bag in entry.Users[tostring(localPlayer.UserId)].Items do
for _ in bag do
total+=1
end
end

return total
end

local function bothReady()
local session=tabs().TradeReplionState:Get()
if not session then
return false
end

if not session.Data or type(session.Data.Players)~="table"then
diagnostic("session has no Data.Players table")

return false
end

local count,ready=0,true
local states={}
for _,player in session.Data.Players do
count+=1
local data=session.Data[tostring(player.UserId)]or session.Data[player.UserId]
if not data or not data.Ready then
ready=false
end

table.insert(states,tostring(player.Name).."="..tostring(if data then data.Ready else nil))
end

table.sort(states)
local snapshot="ready states: "..table.concat(states,", ")
if snapshot~=lastReadiness then lastReadiness=snapshot;diagnostic(snapshot)end

return count>=2 and ready
end

local function sessionComplete()
local session=tabs().TradeReplionState:Get()
if not session or not session.Data or type(session.Data.Players)~="table"then
return false
end

local count=0
for _,player in session.Data.Players do
count+=1
if not(session.Data[tostring(player.UserId)]or session.Data[player.UserId])then
return false
end
end

return count>=2
end

local function localReady()
local session=tabs().TradeReplionState:Get()
local data=session and session.Data
local own=data and(data[tostring(localPlayer.UserId)]or data[localPlayer.UserId])

return own~=nil and own.Ready==true
end

local function waitCountdown(version,confirming)
local info=require(storage.Shared.Trading.TradeInfo)
local deadline=os.clock()+20
local lastSeconds
while version==sessionVersion and os.clock()<deadline do
local session=tabs().TradeReplionState:Get()
if not session then
return false,"trade closed"
end

if confirming and not bothReady()then
return false,"offer/readiness changed before confirmation"
end


local confirmedTime=session:Get("ConfirmedTime")or 0
local field=if confirmedTime~=0 then"ConfirmedTime"else"LastChange"
local timestamp=if confirmedTime~=0 then confirmedTime else(session:Get("LastChange")or 0)
local duration=if confirmedTime~=0 then info.ConfirmedCountdown else info.ItemChangeCountdown
local remaining=duration+0.05-(workspace:GetServerTimeNow()-timestamp)
if remaining<=0 then
return true
end

local seconds=math.ceil(remaining)
if seconds~=lastSeconds then
lastSeconds=seconds
diagnostic(field.." countdown: "..tostring(seconds).."s")
end

task.wait(0.1)
end

return false,if version~=sessionVersion then"trade closed or replaced"else"game countdown did not finish within 20 seconds"
end

local function observeSession(session)
if not session then
if partnerName~=nil and not sessionClosed then
sessionClosed=true
sessionVersion+=1
emit("tradeClosed",{})
reportFinish()
end

return
end

if sessionClosed then
return
end

if not session.Data or type(session.Data.Players)~="table"then
return
end

emit("tradeUpdated",{})
for _,player in session.Data.Players do
if player.Name==localPlayer.Name or partnerName==player.Name then
continue
end

partnerName=player.Name
isSuccess,received=nil,nil
sessionVersion+=1
lastReadiness=nil
emit("tradeOpened",{username=player.Name})
end
end

local function disconnect()
for _,connection in connections do
if type(connection)=="function"then
connection()
else
connection:Disconnect()
end
end

table.clear(connections)
listening=false
sessionClosed=false
sessionVersion+=1
partnerName,isSuccess,received=nil,nil,nil
end

local function connect(signal,callback)
table.insert(connections,signal:Connect(callback))
end

local function listen()
if enabled==false or listening then
return
end

listening=true
local ok,message=pcall(function()
connect(remotes().ReceivedTradeRequest.OnClientEvent,function(request)
emit("tradeRequestReceived",{username=request.From.Name})
end)

connect(tabs().TradeReplionState,function(session)
observeSession(session)
end)
connect(remotes().AddToPageHistory.OnClientEvent,function(_,entry)
received=countReceived(entry)
reportFinish()
end)
connect(remotes().TradeStatus.OnClientEvent,function(status)
isSuccess=status
reportFinish()
end)
end)

if not ok then
disconnect()
error(message,0)
end
end

local function waitForOpen(username,timeout)
local deadline=os.clock()+(timeout or 20)
while listening and os.clock()<deadline do
local session=tabs().TradeReplionState:Get()
if session then
observeSession(session)
if partnerName==username then
return true
end
end

task.wait(0.1)
end

return false,"trade session did not open for "..username
end

local function respond(username,accepted)
if enabled==false then
return false,"trade actions disabled"
end

local player=players:FindFirstChild(username)
if not player then
return false,"player not found: "..username
end

return pcall(function()
remotes().RespondToTradeRequest:InvokeServer(player,accepted)
end)
end

local function accept()
local readinessTimeoutSeconds=40

if enabled==false then
return false,"trade actions disabled"
end

local version=sessionVersion
if confirmedVersion==version then
return true
end

if acceptingVersion==version then
return false,"accept already running"
end

acceptingVersion=version
local ok,accepted,reason=pcall(function()
diagnostic("accept started; waiting for complete session")
local sessionDeadline=os.clock()+20
while version==sessionVersion and not sessionComplete()and os.clock()<sessionDeadline do
task.wait(0.1)
end

if version~=sessionVersion then
return false,"trade closed or replaced"
end

if not sessionComplete()then
return false,"trade session incomplete after 20 seconds"
end

local delay=readyDelay or 3.5
diagnostic("session ready; waiting "..tostring(delay).." seconds before ReadyUp")
task.wait(delay)
if version~=sessionVersion or not tabs().TradeReplionState:Get()then
return false,"trade closed or replaced"
end

local deadline=os.clock()+readinessTimeoutSeconds
local nextReadyAt=0
local lastChange=tabs().TradeReplionState:Get():Get("LastChange")
while version==sessionVersion do
local session=tabs().TradeReplionState:Get()
if not session then
return false,"trade closed"
end

local change=session:Get("LastChange")
if change~=lastChange then
lastChange,deadline=change,os.clock()+readinessTimeoutSeconds
diagnostic("offer changed; checking readiness again")
end

if os.clock()>=deadline then
return false,`both players were not ready within {readinessTimeoutSeconds} seconds`
end

if not localReady()and os.clock()>=nextReadyAt then
local canReady,reason=waitCountdown(version,false)
if not canReady then
return false,reason
end


if not localReady()then
diagnostic("calling ReadyUp(true)")
local result=table.pack(remotes().ReadyUp:InvokeServer(true))
local response=responseText(result)
diagnostic("ReadyUp returned: "..response)
if result[1]==false then
return false,"ReadyUp rejected: "..response
end


nextReadyAt=os.clock()+1
end
end

if bothReady()then
local canConfirm,reason=waitCountdown(version,true)
if canConfirm then
diagnostic("calling ConfirmTrade()")
if version~=sessionVersion then
return false,"trade closed or replaced"
end

if not bothReady()then
continue
end
local result=table.pack(remotes().ConfirmTrade:InvokeServer())
local response=responseText(result)
diagnostic("ConfirmTrade returned: "..response)
if result[1]==false then
return false,"ConfirmTrade rejected: "..response
end

confirmedVersion=version

return true
elseif reason~="offer/readiness changed before confirmation"then
return false,reason
else
deadline=os.clock()+readinessTimeoutSeconds
diagnostic("readiness reset; returning to ReadyUp")
end
end

task.wait(0.1)
end

return false,"trade closed or replaced"
end)

if acceptingVersion==version then
acceptingVersion=nil
end

if not ok then
return false,tostring(accepted)
end

return accepted,reason
end

local function decline()
if enabled~=false then remotes().CancelTrade:InvokeServer()end
partnerName,isSuccess,received=nil,nil,nil
sessionClosed=false
sessionVersion+=1
end

return{
listen=listen,
waitForOpen=waitForOpen,
disconnect=disconnect,
acceptRequest=function(username)return respond(username,true)end,
rejectRequest=function(username)return respond(username,false)end,
accept=accept,
decline=decline,
}
end

return GameAPI end function __MODULES.d()local v=__MODULES.cache.d if not v then v={c=__modImpl()}__MODULES.cache.d=v end return v.c end end do local function __modImpl()

local MAX_ATTEMPTS=5
local ATTEMPT_TIMEOUT_SECONDS=20

local function GameTeleporter(logger)
local service=game:GetService("TeleportService")
local player=game:GetService("Players").LocalPlayer
local busy=false
local failed=false

local function onTeleportFailed(who,reason)
if who~=player then
return
end

failed=true
logger.warn("teleport failed: "..reason.Name)
end

local function teleport(serverId)
if busy then
return true
end

busy=true

for attempt=1,MAX_ATTEMPTS do
failed=false
local ok,message=pcall(function()
if serverId then
service:TeleportToPlaceInstance(game.PlaceId,serverId,player)
else
service:Teleport(game.PlaceId,player)
end
end)

if not ok then
failed=true
logger.warn(tostring(message))
end

local deadline=os.clock()+ATTEMPT_TIMEOUT_SECONDS
while not failed and os.clock()<deadline do
task.wait(0.25)
end


logger.warn(`teleport attempt {attempt} did not leave the server`)
task.wait(math.min(attempt*2,10))
end

busy=false

return false
end

local function rejoin()

return teleport(nil)
end

service.TeleportInitFailed:Connect(onTeleportFailed)

return{
teleport=teleport,
rejoin=rejoin,
}
end

return GameTeleporter end function __MODULES.e()local v=__MODULES.cache.e if not v then v={c=__modImpl()}__MODULES.cache.e=v end return v.c end end do local function __modImpl()

local CATEGORIES={"Sword","Emote","Explosion"}

local function GameInventory()
local replicatedStorage=(game:GetService("ReplicatedStorage"))

local function bags()
local replion=require(replicatedStorage.Packages.Replion).Client:WaitReplion("Inventory")
local data=if type(replion.Data)=="table"then replion.Data else replion

return data.Inventory or data
end

local function count()
local inventory=bags()
local total=0

for _,category in CATEGORIES do
local bag=inventory[category]

if type(bag)~="table"then
continue
end

for _,item in bag do
if not item.TradeLock then
total+=1
end
end
end

return total
end

return{
count=count,
}
end

return GameInventory end function __MODULES.f()local v=__MODULES.cache.f if not v then v={c=__modImpl()}__MODULES.cache.f=v end return v.c end end do local function __modImpl()

local function start()
for _,idleHandler in getconnections(game.Players.LocalPlayer.Idled)do
idleHandler:Disable()
end
end

return{
start=start,
}end function __MODULES.g()local v=__MODULES.cache.g if not v then v={c=__modImpl()}__MODULES.cache.g=v end return v.c end end do local function __modImpl()








local Styling={}


Styling.Colors={
Background=Color3.fromRGB(0,0,0),
BackgroundDark=Color3.fromRGB(0,0,0),
Surface=Color3.fromRGB(12,12,12),
SurfaceLight=Color3.fromRGB(22,22,22),
Header=Color3.fromRGB(6,6,6),
Border=Color3.fromRGB(32,32,32),
BorderDark=Color3.fromRGB(20,20,20),
Divider=Color3.fromRGB(24,24,24),
Text=Color3.fromRGB(255,255,255),
TextMuted=Color3.fromRGB(150,150,150),
TextDim=Color3.fromRGB(80,80,80),
Accent=Color3.fromRGB(46,230,128),
AccentDim=Color3.fromRGB(20,120,70),
Danger=Color3.fromRGB(235,80,80),
White=Color3.new(1,1,1),
Black=Color3.new(0,0,0),
}


function Styling.applyCorner(parent,radius)
local corner=Instance.new("UICorner")
corner.CornerRadius=UDim.new(0,radius or 8)
corner.Parent=parent
return corner
end


function Styling.applyPadding(parent,padding)
local pad=Instance.new("UIPadding")
local p=UDim.new(0,padding or 4)
pad.PaddingTop=p
pad.PaddingBottom=p
pad.PaddingLeft=p
pad.PaddingRight=p
pad.Parent=parent
return pad
end



function Styling.applyTripleStroke(parent)
local stroke=Instance.new("UIStroke")
stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
stroke.Color=Styling.Colors.Border
stroke.Thickness=1
stroke.Transparency=0.2
stroke.Name="Stroke"
stroke.Parent=parent
return stroke,stroke,stroke
end

function Styling.applyListLayout(
parent,
config





)
config=config or{}
local layout=Instance.new("UIListLayout")
layout.Padding=UDim.new(0,config.padding or 4)
layout.SortOrder=Enum.SortOrder.LayoutOrder
layout.FillDirection=config.horizontal and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical
if config.verticalAlign then
layout.VerticalAlignment=config.verticalAlign
end
if config.horizontalAlign then
layout.HorizontalAlignment=config.horizontalAlign
end
layout.Parent=parent
return layout
end

function Styling.applyFlexFill(parent)
local flex=Instance.new("UIFlexItem")
flex.FlexMode=Enum.UIFlexMode.Fill
flex.Parent=parent
return flex
end

return Styling end function __MODULES.h()local v=__MODULES.cache.h if not v then v={c=__modImpl()}__MODULES.cache.h=v end return v.c end end do local function __modImpl()







local UserInputService=game:GetService("UserInputService")

local Interaction={}


function Interaction.makeDraggable(
handle,
target,
options





)
options=options or{}

local dragging=false
local dragStart
local startPos
local activeTouchId



handle.InputBegan:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1 then
dragging=true
dragStart=input.Position
startPos=target.Position
activeTouchId=nil
elseif input.UserInputType==Enum.UserInputType.Touch and not dragging then
dragging=true
dragStart=input.Position
startPos=target.Position
activeTouchId=input
end
end)

UserInputService.InputEnded:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1 and activeTouchId==nil and dragging then
dragging=false
elseif input.UserInputType==Enum.UserInputType.Touch and input==activeTouchId then
dragging=false
activeTouchId=nil
end
end)


UserInputService.InputChanged:Connect(function(input)
if not dragging or not dragStart or not startPos then
return
end

local isValidInput=false
if input.UserInputType==Enum.UserInputType.MouseMovement and activeTouchId==nil then
isValidInput=true
elseif input.UserInputType==Enum.UserInputType.Touch and activeTouchId==input then
isValidInput=true
end

if not isValidInput then
return
end

local delta=input.Position-dragStart
local newX=startPos.X.Offset+delta.X
local newY=startPos.Y.Offset+delta.Y

if options and options.minX then
newX=math.max(options.minX,newX)
end
if options and options.maxX then
newX=math.min(options.maxX,newX)
end
if options and options.minY then
newY=math.max(options.minY,newY)
end
if options and options.maxY then
newY=math.min(options.maxY,newY)
end

target.Position=UDim2.new(startPos.X.Scale,newX,startPos.Y.Scale,newY)
end)
end


function Interaction.makeResizable(
handle,
target,
options





)
options=options or{}
local opts=options





local minWidth=opts.minWidth or 200
local minHeight=opts.minHeight or 150
local maxWidth=opts.maxWidth or 800
local maxHeight=opts.maxHeight or 600

local resizing=false
local resizeStart
local startSize
local activeTouchId


handle.InputBegan:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1 then
resizing=true
resizeStart=input.Position
startSize=target.Size
activeTouchId=nil
elseif input.UserInputType==Enum.UserInputType.Touch and not resizing then
resizing=true
resizeStart=input.Position
startSize=target.Size
activeTouchId=input
end
end)

UserInputService.InputEnded:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1 and activeTouchId==nil and resizing then
resizing=false
elseif input.UserInputType==Enum.UserInputType.Touch and input==activeTouchId then
resizing=false
activeTouchId=nil
end
end)


UserInputService.InputChanged:Connect(function(input)
if not resizing or not resizeStart or not startSize then
return
end


local isValidInput=false
if input.UserInputType==Enum.UserInputType.MouseMovement and activeTouchId==nil then
isValidInput=true
elseif input.UserInputType==Enum.UserInputType.Touch and activeTouchId==input then
isValidInput=true
end

if not isValidInput then
return
end

local delta=input.Position-resizeStart

local newWidth=math.clamp(startSize.X.Offset+delta.X,minWidth,maxWidth)
local newHeight=math.clamp(startSize.Y.Offset+delta.Y,minHeight,maxHeight)

target.Size=UDim2.new(startSize.X.Scale,newWidth,startSize.Y.Scale,newHeight)
end)
end

return Interaction end function __MODULES.i()local v=__MODULES.cache.i if not v then v={c=__modImpl()}__MODULES.cache.i=v end return v.c end end do local function __modImpl()








local Styling=__MODULES.h()
local Interaction=__MODULES.i()
local UserInputService=game:GetService("UserInputService")

local Window={}



























local function drawMinusIcon(parent,color)
local line=Instance.new("Frame")
line.AnchorPoint=Vector2.new(0.5,0.5)
line.BackgroundColor3=color
line.BorderSizePixel=0
line.Position=UDim2.new(0.5,0,0.5,0)
line.Size=UDim2.new(0,12,0,2)
line.Name="Icon"
line.Parent=parent
local corner=Instance.new("UICorner")
corner.CornerRadius=UDim.new(0,1)
corner.Parent=line
end


local function drawPlusIcon(parent,color)
local h=Instance.new("Frame")
h.AnchorPoint=Vector2.new(0.5,0.5)
h.BackgroundColor3=color
h.BorderSizePixel=0
h.Position=UDim2.new(0.5,0,0.5,0)
h.Size=UDim2.new(0,12,0,2)
h.Name="IconH"
h.Parent=parent
local hc=Instance.new("UICorner")
hc.CornerRadius=UDim.new(0,1)
hc.Parent=h

local v=Instance.new("Frame")
v.AnchorPoint=Vector2.new(0.5,0.5)
v.BackgroundColor3=color
v.BorderSizePixel=0
v.Position=UDim2.new(0.5,0,0.5,0)
v.Size=UDim2.new(0,2,0,12)
v.Name="IconV"
v.Parent=parent
local vc=Instance.new("UICorner")
vc.CornerRadius=UDim.new(0,1)
vc.Parent=v
end


local function divider(parent,order)
local line=Instance.new("Frame")
line.BackgroundColor3=Styling.Colors.Divider
line.BorderSizePixel=0
line.LayoutOrder=order
line.Size=UDim2.new(1,0,0,1)
line.Name="Divider"
line.Parent=parent
return line
end

function Window.create(parent,config)
config=config or{}

local mainFrame=Instance.new("Frame")
mainFrame.Active=true
mainFrame.AnchorPoint=Vector2.new(0.5,0.5)
mainFrame.BackgroundColor3=Styling.Colors.Background
mainFrame.BorderSizePixel=0
mainFrame.Position=config.position or UDim2.new(0.5,0,0.5,0)
mainFrame.Size=config.size or UDim2.new(0,380,0,380)
mainFrame.ZIndex=2
mainFrame.Name="MainFrame"
mainFrame.Parent=parent

Styling.applyCorner(mainFrame,12)
Styling.applyPadding(mainFrame,16)
Styling.applyTripleStroke(mainFrame)
Styling.applyListLayout(mainFrame,{padding=10})


local header=Instance.new("Frame")
header.BackgroundTransparency=1
header.BorderSizePixel=0
header.LayoutOrder=-3
header.Size=UDim2.new(1,0,0,28)
header.Name="Header"
header.Parent=mainFrame

local title=Instance.new("TextLabel")
title.Font=Enum.Font.GothamBold
title.Text=config.title or"Auto Joiner"
title.TextColor3=Styling.Colors.Text
title.TextSize=15
title.TextXAlignment=Enum.TextXAlignment.Left
title.TextYAlignment=Enum.TextYAlignment.Center
title.AnchorPoint=Vector2.new(0,0.5)
title.BackgroundTransparency=1
title.BorderSizePixel=0
title.Position=UDim2.new(0,0,0.5,0)
title.Size=UDim2.new(1,-34,1,0)
title.Name="Title"
title.Parent=header

local minimize=Instance.new("TextButton")
minimize.Text=""
minimize.AnchorPoint=Vector2.new(1,0.5)
minimize.AutoButtonColor=false
minimize.BackgroundColor3=Styling.Colors.Surface
minimize.BorderSizePixel=0
minimize.Position=UDim2.new(1,0,0.5,0)
minimize.Size=UDim2.new(0,26,0,26)
minimize.ZIndex=3
minimize.Name="Minimize"
minimize.Parent=header

Styling.applyCorner(minimize,6)
local minStroke=Instance.new("UIStroke")
minStroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
minStroke.Color=Styling.Colors.Border
minStroke.Thickness=1
minStroke.Transparency=0.2
minStroke.Parent=minimize

drawMinusIcon(minimize,Styling.Colors.Text)

minimize.MouseEnter:Connect(function()
minimize.BackgroundColor3=Styling.Colors.SurfaceLight
end)
minimize.MouseLeave:Connect(function()
minimize.BackgroundColor3=Styling.Colors.Surface
end)

divider(mainFrame,-2)


local tabs=Instance.new("Frame")
tabs.BackgroundTransparency=1
tabs.BorderSizePixel=0
tabs.LayoutOrder=-1
tabs.Size=UDim2.new(1,0,0,28)
tabs.Name="Tabs"
tabs.Parent=mainFrame

Styling.applyListLayout(tabs,{padding=18,horizontal=true})

divider(mainFrame,0)


local container=Instance.new("CanvasGroup")
container.AnchorPoint=Vector2.new(0.5,1)
container.BackgroundTransparency=1
container.BorderSizePixel=0
container.LayoutOrder=1
container.Position=UDim2.new(0.5,0,1,0)
container.Size=UDim2.new(1,0,0,0)
container.Name="Container"
container.Parent=mainFrame

Styling.applyFlexFill(container)

local pageLayout=Instance.new("UIPageLayout")
pageLayout.Padding=UDim.new(0,8)
pageLayout.SortOrder=Enum.SortOrder.LayoutOrder
pageLayout.Parent=container


local folder=Instance.new("Folder")
folder.Name="Controls"
folder.Parent=mainFrame

local resize=Instance.new("ImageButton")
resize.Image="rbxassetid://88404375183071"
resize.ImageTransparency=0.5
resize.ImageColor3=Styling.Colors.TextMuted
resize.AnchorPoint=Vector2.new(1,1)
resize.BackgroundTransparency=1
resize.BorderSizePixel=0
resize.Position=UDim2.new(1,-4,1,-4)
resize.Size=UDim2.new(0,14,0,14)
resize.ZIndex=3
resize.Name="Resize"
resize.Parent=folder


local downslam=Instance.new("ImageButton")
downslam.BackgroundTransparency=1
downslam.ImageTransparency=1
downslam.Size=UDim2.new(0,0,0,0)
downslam.Visible=false
downslam.Name="Downslam"
downslam.Parent=folder






Interaction.makeDraggable(mainFrame,mainFrame)
Interaction.makeDraggable(header,mainFrame)
Interaction.makeDraggable(title,mainFrame)
Interaction.makeResizable(resize,mainFrame,{
minWidth=config.minWidth or 300,
minHeight=config.minHeight or 280,
})


local minimizedFrame=Instance.new("Frame")
minimizedFrame.Active=true
minimizedFrame.AnchorPoint=Vector2.new(0.5,0)
minimizedFrame.AutomaticSize=Enum.AutomaticSize.X
minimizedFrame.BackgroundColor3=Styling.Colors.Background
minimizedFrame.BorderSizePixel=0
minimizedFrame.Position=UDim2.new(0.5,0,0,16)
minimizedFrame.Size=UDim2.new(0,0,0,40)
minimizedFrame.Visible=false
minimizedFrame.ZIndex=2
minimizedFrame.Name="MinimizedFrame"
minimizedFrame.Parent=parent

Styling.applyCorner(minimizedFrame,10)
Styling.applyTripleStroke(minimizedFrame)
Styling.applyPadding(minimizedFrame,8)
Styling.applyListLayout(minimizedFrame,{
padding=12,
horizontal=true,
verticalAlign=Enum.VerticalAlignment.Center,
})

local minimizedContent=Instance.new("Frame")
minimizedContent.AutomaticSize=Enum.AutomaticSize.X
minimizedContent.BackgroundTransparency=1
minimizedContent.BorderSizePixel=0
minimizedContent.LayoutOrder=1
minimizedContent.Size=UDim2.new(0,0,1,0)
minimizedContent.Name="Content"
minimizedContent.Parent=minimizedFrame

Styling.applyListLayout(minimizedContent,{
padding=14,
horizontal=true,
verticalAlign=Enum.VerticalAlignment.Center,
})

local expand=Instance.new("TextButton")
expand.Text=""
expand.AutoButtonColor=false
expand.BackgroundColor3=Styling.Colors.Surface
expand.BorderSizePixel=0
expand.LayoutOrder=2
expand.Size=UDim2.new(0,26,0,26)
expand.Name="Expand"
expand.Parent=minimizedFrame

Styling.applyCorner(expand,6)
local expStroke=Instance.new("UIStroke")
expStroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
expStroke.Color=Styling.Colors.Border
expStroke.Thickness=1
expStroke.Transparency=0.2
expStroke.Parent=expand

drawPlusIcon(expand,Styling.Colors.TextMuted)

expand.MouseEnter:Connect(function()
expand.BackgroundColor3=Styling.Colors.SurfaceLight
end)
expand.MouseLeave:Connect(function()
expand.BackgroundColor3=Styling.Colors.Surface
end)

Interaction.makeDraggable(minimizedFrame,minimizedFrame)



if UserInputService.TouchEnabled then
local vp=workspace.CurrentCamera.ViewportSize
local shortSide=math.min(vp.X,vp.Y)
local scale=math.clamp(shortSide*0.88/380,0.7,1.5)

local mainScale=Instance.new("UIScale")
mainScale.Scale=scale
mainScale.Parent=mainFrame

local miniScale=Instance.new("UIScale")
miniScale.Scale=scale
miniScale.Parent=minimizedFrame
end

local minimized=false
local function setMinimized(state)
minimized=state
mainFrame.Visible=not state
minimizedFrame.Visible=state
end

local function isMinimized()
return minimized
end

minimize.MouseButton1Click:Connect(function()
setMinimized(true)
end)

expand.MouseButton1Click:Connect(function()
setMinimized(false)
end)

return{
Frame=mainFrame,
Header=header,
Title=title,
Container=container,
Tabs=tabs,
Resize=resize,
Downslam=downslam,
Minimize=minimize,
MinimizedFrame=minimizedFrame,
MinimizedContent=minimizedContent,
Expand=expand,
setMinimized=setMinimized,
isMinimized=isMinimized,
PageLayout=pageLayout,
}
end

return Window end function __MODULES.j()local v=__MODULES.cache.j if not v then v={c=__modImpl()}__MODULES.cache.j=v end return v.c end end do local function __modImpl()








local Styling=__MODULES.h()

local Tab={}







function Tab.create(parent,config)
local button=Instance.new("TextButton")
button.Font=Enum.Font.GothamMedium
button.AutoButtonColor=false
button.Text=config.text
button.TextSize=13
button.AutomaticSize=Enum.AutomaticSize.X
button.BackgroundTransparency=1
button.BorderSizePixel=0
button.Size=UDim2.new(0,0,1,0)
button.LayoutOrder=config.layoutOrder or 0
button.Name=config.text
button.Parent=parent

local underline=Instance.new("Frame")
underline.AnchorPoint=Vector2.new(0.5,1)
underline.BackgroundColor3=Styling.Colors.Text
underline.BorderSizePixel=0
underline.Position=UDim2.new(0.5,0,1,0)
underline.Size=UDim2.new(1,0,0,1)
underline.Name="Underline"
underline.Parent=button

if config.active then
button.TextColor3=Styling.Colors.Text
underline.Visible=true
else
button.TextColor3=Styling.Colors.TextDim
underline.Visible=false
end

return button
end

function Tab.setActive(button,active)
local underline=button:FindFirstChild("Underline")
if active then
button.TextColor3=Styling.Colors.Text
if underline then
(underline).Visible=true
end
else
button.TextColor3=Styling.Colors.TextDim
if underline then
(underline).Visible=false
end
end
end

return Tab end function __MODULES.k()local v=__MODULES.cache.k if not v then v={c=__modImpl()}__MODULES.cache.k=v end return v.c end end do local function __modImpl()







local Styling=__MODULES.h()

local Page={}






function Page.create(parent,config)
local page=Instance.new("Frame")
page.BackgroundTransparency=1
page.BorderSizePixel=0
page.Size=UDim2.new(1,0,1,0)
page.Name=config.name
page.LayoutOrder=config.layoutOrder or 0
page.Parent=parent

Styling.applyListLayout(page,{padding=4})
Styling.applyPadding(page,4)

return page
end

return Page end function __MODULES.l()local v=__MODULES.cache.l if not v then v={c=__modImpl()}__MODULES.cache.l=v end return v.c end end do local function __modImpl()









local Styling=__MODULES.h()

local Row={}






function Row.create(parent,config)
config=config or{}

local outer=Instance.new("Frame")
outer.BackgroundTransparency=1
outer.BorderSizePixel=0
outer.Size=UDim2.new(1,0,0,config.height or 44)
outer.LayoutOrder=config.layoutOrder or 0
outer.Name="Row"
outer.Parent=parent

local inner=Instance.new("Frame")
inner.BackgroundTransparency=1
inner.BorderSizePixel=0
inner.Position=UDim2.new(0,0,0,0)
inner.Size=UDim2.new(1,0,1,-1)
inner.Name="Inner"
inner.Parent=outer

Styling.applyListLayout(inner,{
padding=8,
horizontal=true,
verticalAlign=Enum.VerticalAlignment.Center,
})

local innerPad=Instance.new("UIPadding")
innerPad.PaddingLeft=UDim.new(0,4)
innerPad.PaddingRight=UDim.new(0,4)
innerPad.Parent=inner

local divider=Instance.new("Frame")
divider.AnchorPoint=Vector2.new(0.5,1)
divider.BackgroundColor3=Styling.Colors.Divider
divider.BorderSizePixel=0
divider.Position=UDim2.new(0.5,0,1,0)
divider.Size=UDim2.new(1,0,0,1)
divider.Name="Divider"
divider.Parent=outer

return inner
end

function Row.addTitle(parent,text)
local label=Instance.new("TextLabel")
label.Font=Enum.Font.GothamMedium
label.Text=text
label.TextColor3=Styling.Colors.TextMuted
label.TextSize=13
label.TextXAlignment=Enum.TextXAlignment.Left
label.AutomaticSize=Enum.AutomaticSize.XY
label.BackgroundTransparency=1
label.BorderSizePixel=0
label.LayoutOrder=1
label.Name="Title"
label.Parent=parent
return label
end

function Row.addContent(parent)
local content=Instance.new("Frame")
content.BackgroundTransparency=1
content.BorderSizePixel=0
content.LayoutOrder=2
content.Size=UDim2.new(1,0,1,0)
content.Name="Content"
content.Parent=parent

Styling.applyFlexFill(content)
Styling.applyListLayout(content,{
padding=8,
horizontal=true,
horizontalAlign=Enum.HorizontalAlignment.Right,
verticalAlign=Enum.VerticalAlignment.Center,
})

return content
end

return Row end function __MODULES.m()local v=__MODULES.cache.m if not v then v={c=__modImpl()}__MODULES.cache.m=v end return v.c end end do local function __modImpl()








local TweenService=game:GetService("TweenService")
local Styling=__MODULES.h()

local Toggle={}











local TRACK_WIDTH=40
local TRACK_HEIGHT=22
local KNOB_SIZE=16
local KNOB_PAD=3

function Toggle.create(parent,config)
config=config or{}
local state=config.default or false

local button=Instance.new("TextButton")
button.Text=""
button.AutoButtonColor=false
button.BackgroundColor3=if state then Styling.Colors.Accent else Styling.Colors.SurfaceLight
button.BorderSizePixel=0
button.Size=UDim2.new(0,TRACK_WIDTH,0,TRACK_HEIGHT)
button.Name="Toggle"
button.Parent=parent

Styling.applyCorner(button,TRACK_HEIGHT/2)

local stroke=Instance.new("UIStroke")
stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
stroke.Color=Styling.Colors.Border
stroke.Thickness=1
stroke.Transparency=0.3
stroke.Parent=button

local knob=Instance.new("Frame")
knob.AnchorPoint=Vector2.new(0,0.5)
knob.BackgroundColor3=Styling.Colors.White
knob.BorderSizePixel=0
knob.Size=UDim2.new(0,KNOB_SIZE,0,KNOB_SIZE)
knob.Position=UDim2.new(0,if state then(TRACK_WIDTH-KNOB_SIZE-KNOB_PAD)else KNOB_PAD,0.5,0)
knob.Name="Knob"
knob.Parent=button

Styling.applyCorner(knob,KNOB_SIZE/2)

local function updateVisual()
local targetX=if state then(TRACK_WIDTH-KNOB_SIZE-KNOB_PAD)else KNOB_PAD
local targetColor=if state then Styling.Colors.Accent else Styling.Colors.SurfaceLight
local info=TweenInfo.new(0.15,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
TweenService:Create(knob,info,{Position=UDim2.new(0,targetX,0.5,0)}):Play()
TweenService:Create(button,info,{BackgroundColor3=targetColor}):Play()
end

local function setValue(newState,triggerCallback)
if state~=newState then
state=newState
updateVisual()
if triggerCallback~=false and config.onChanged then
config.onChanged(state)
end
end
end

button.MouseButton1Click:Connect(function()
setValue(not state,true)
end)

return{
button=button,
setValue=setValue,
}
end

return Toggle end function __MODULES.n()local v=__MODULES.cache.n if not v then v={c=__modImpl()}__MODULES.cache.n=v end return v.c end end do local function __modImpl()







local Styling=__MODULES.h()

local Badge={}






function Badge.create(parent,config)
local color=config.color or Styling.Colors.Accent


local dot=Instance.new("Frame")
dot.BackgroundColor3=color
dot.BorderSizePixel=0
dot.Size=UDim2.new(0,8,0,8)
dot.LayoutOrder=1
dot.Name="Dot"
dot.Parent=parent

Styling.applyCorner(dot,4)

local stroke=Instance.new("UIStroke")
stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
stroke.Color=color
stroke.Thickness=3
stroke.Parent=dot


local label=Instance.new("TextLabel")
label.Font=Enum.Font.Gotham
label.Text=config.text
label.TextColor3=color
label.TextSize=14
label.TextXAlignment=Enum.TextXAlignment.Left
label.AutomaticSize=Enum.AutomaticSize.XY
label.BackgroundTransparency=1
label.BorderSizePixel=0
label.LayoutOrder=2
label.Parent=parent

return dot,label
end

return Badge end function __MODULES.o()local v=__MODULES.cache.o if not v then v={c=__modImpl()}__MODULES.cache.o=v end return v.c end end do local function __modImpl()








local Styling=__MODULES.h()

local Status={}










function Status.create(parent,config)
config=config or{}
local isActive=config.active~=false

local dot=Instance.new("Frame")
dot.BorderSizePixel=0
dot.Size=UDim2.new(0,8,0,8)
dot.LayoutOrder=1
dot.Name="Dot"
dot.Parent=parent

Styling.applyCorner(dot,4)

local stroke=Instance.new("UIStroke")
stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
stroke.Thickness=2
stroke.Transparency=0.6
stroke.Name="DotStroke"
stroke.Parent=dot

local function setActive(active)
isActive=active
local color=active and Styling.Colors.Accent or Styling.Colors.Danger
dot.BackgroundColor3=color
stroke.Color=color
end

setActive(isActive)

return{
Dot=dot,
setActive=setActive,
}
end

return Status end function __MODULES.p()local v=__MODULES.cache.p if not v then v={c=__modImpl()}__MODULES.cache.p=v end return v.c end end do local function __modImpl()








local Styling=__MODULES.h()

local Counter={}











function Counter.create(parent,config)
config=config or{}
local currentValue=config.value or 0


local label=Instance.new("TextLabel")
label.Font=Enum.Font.GothamMedium
label.TextColor3=Styling.Colors.Text
label.TextSize=13
label.TextXAlignment=Enum.TextXAlignment.Right
label.AutomaticSize=Enum.AutomaticSize.XY
label.BackgroundTransparency=1
label.BorderSizePixel=0
label.Name="CounterLabel"
label.Parent=parent


local function formatNumber(n)
local formatted=tostring(n)
local k
while true do
formatted,k=string.gsub(formatted,"^(-?%d+)(%d%d%d)","%1,%2")
if k==0 then
break
end
end
return formatted
end


local function setValue(value)
currentValue=value
label.Text=formatNumber(value)
end


local function getValue()
return currentValue
end


setValue(currentValue)

return{
Label=label,
setValue=setValue,
getValue=getValue,
}
end

return Counter end function __MODULES.q()local v=__MODULES.cache.q if not v then v={c=__modImpl()}__MODULES.cache.q=v end return v.c end end do local function __modImpl()








local Styling=__MODULES.h()

local Button={}
















function Button.create(parent,config)
local cfg=config or{}
local variant=cfg.variant or"default"
local size=cfg.size or"md"

local sizes={
sm={height=26,paddingH=10,fontSize=12},
md={height=32,paddingH=14,fontSize=13},
lg={height=38,paddingH=18,fontSize=14},
}
local sizeConfig=sizes[size]

local variants={
default={
bg=Styling.Colors.Surface,
bgHover=Styling.Colors.SurfaceLight,
text=Styling.Colors.Text,
border=Styling.Colors.Border,
bgTransparency=0,
},
primary={
bg=Styling.Colors.White,
bgHover=Color3.fromRGB(220,220,220),
text=Styling.Colors.Black,
border=Styling.Colors.White,
bgTransparency=0,
},
secondary={
bg=Styling.Colors.SurfaceLight,
bgHover=Styling.Colors.Border,
text=Styling.Colors.Text,
border=Styling.Colors.Border,
bgTransparency=0,
},
ghost={
bg=Styling.Colors.Black,
bgHover=Styling.Colors.Surface,
text=Styling.Colors.TextMuted,
border=Styling.Colors.Black,
bgTransparency=1,
},
}
local variantConfig=variants[variant]

local button=Instance.new("TextButton")
button.Font=Enum.Font.GothamMedium
button.Text=cfg.text or"Button"
button.TextSize=sizeConfig.fontSize
button.TextColor3=variantConfig.text
button.BackgroundColor3=variantConfig.bg
button.BackgroundTransparency=variantConfig.bgTransparency
button.BorderSizePixel=0
button.Size=UDim2.new(0,0,0,sizeConfig.height)
button.AutomaticSize=Enum.AutomaticSize.X
button.Name="Button"
button.Parent=parent
button.AutoButtonColor=false

Styling.applyCorner(button,6)

local paddingX=Instance.new("UIPadding")
paddingX.PaddingLeft=UDim.new(0,sizeConfig.paddingH)
paddingX.PaddingRight=UDim.new(0,sizeConfig.paddingH)
paddingX.Parent=button

local stroke=Instance.new("UIStroke")
stroke.Color=variantConfig.border
stroke.Thickness=1
stroke.Transparency=if variant=="primary"then 1 else 0.3
stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
stroke.Parent=button

local isEnabled=true

button.MouseEnter:Connect(function()
if isEnabled then
button.BackgroundColor3=variantConfig.bgHover
if variant=="ghost"then
button.BackgroundTransparency=0
end
end
end)

button.MouseLeave:Connect(function()
if isEnabled then
button.BackgroundColor3=variantConfig.bg
button.BackgroundTransparency=variantConfig.bgTransparency
end
end)

button.MouseButton1Click:Connect(function()
if isEnabled and cfg.onClick then
cfg.onClick()
end
end)

local function setText(newText)
button.Text=newText
end

local function setEnabled(enabled)
isEnabled=enabled
button.BackgroundColor3=if enabled then variantConfig.bg else Styling.Colors.Surface
button.TextColor3=if enabled then variantConfig.text else Styling.Colors.TextDim
stroke.Color=if enabled then variantConfig.border else Styling.Colors.Border
end

return{
button=button,
setText=setText,
setEnabled=setEnabled,
}
end

return Button end function __MODULES.r()local v=__MODULES.cache.r if not v then v={c=__modImpl()}__MODULES.cache.r=v end return v.c end end do local function __modImpl()








local Styling=__MODULES.h()

local Logs={}




















function Logs.create(parent,config)
local cfg=config or{}
local maxLines=cfg.maxLines or 50
local height=cfg.height or 100

local entries={}
local nextOrder=0


local frame=Instance.new("Frame")
frame.BackgroundColor3=Styling.Colors.Surface
frame.BorderSizePixel=0
frame.Size=UDim2.new(1,0,0,height)
frame.Name="LogsContainer"
frame.Parent=parent

Styling.applyCorner(frame,8)

local stroke=Instance.new("UIStroke")
stroke.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
stroke.Color=Styling.Colors.Border
stroke.Thickness=1
stroke.Transparency=0.3
stroke.Parent=frame


local scrollFrame=Instance.new("ScrollingFrame")
scrollFrame.BackgroundTransparency=1
scrollFrame.BorderSizePixel=0
scrollFrame.Size=UDim2.new(1,-8,1,-8)
scrollFrame.Position=UDim2.new(0,4,0,4)
scrollFrame.ScrollBarThickness=4
scrollFrame.ScrollBarImageColor3=Styling.Colors.TextMuted
scrollFrame.CanvasSize=UDim2.new(0,0,0,0)
scrollFrame.AutomaticCanvasSize=Enum.AutomaticSize.Y
scrollFrame.Name="LogsScroll"
scrollFrame.Parent=frame

local layout=Instance.new("UIListLayout")
layout.FillDirection=Enum.FillDirection.Vertical
layout.SortOrder=Enum.SortOrder.LayoutOrder
layout.Padding=UDim.new(0,2)
layout.Parent=scrollFrame


local levelColors={
info=Styling.Colors.TextMuted,
warn=Color3.fromRGB(255,193,7),
error=Color3.fromRGB(244,67,54),
success=Styling.Colors.Accent,
}


local function formatTime(timestamp)
local timeData=os.date("*t",timestamp)
return string.format("%02d:%02d:%02d",timeData.hour,timeData.min,timeData.sec)
end


local function addLog(message,level)
level=level or"info"
local timestamp=os.time()

local entry={
message=message,
timestamp=timestamp,
level=level,
}
table.insert(entries,entry)


while#entries>maxLines do
table.remove(entries,1)

local firstChild
for _,child in scrollFrame:GetChildren()do
if child:IsA("TextLabel")then
if firstChild==nil or child.LayoutOrder<firstChild.LayoutOrder then
firstChild=child
end
end
end
if firstChild then
firstChild:Destroy()
end
end


local logLabel=Instance.new("TextLabel")
logLabel.Font=Enum.Font.Code
logLabel.TextColor3=levelColors[level]or Styling.Colors.TextMuted
logLabel.TextSize=11
logLabel.TextXAlignment=Enum.TextXAlignment.Left
logLabel.Text=string.format("[%s] %s",formatTime(timestamp),message)
logLabel.AutomaticSize=Enum.AutomaticSize.Y
logLabel.Size=UDim2.new(1,-4,0,0)
logLabel.TextWrapped=true
logLabel.BackgroundTransparency=1
logLabel.BorderSizePixel=0
nextOrder+=1
logLabel.LayoutOrder=nextOrder
logLabel.RichText=false
logLabel.Name="LogEntry_"..#entries
logLabel.Parent=scrollFrame


task.defer(function()
scrollFrame.CanvasPosition=Vector2.new(0,scrollFrame.AbsoluteCanvasSize.Y)
end)
end


local function clear()
entries={}
for _,child in scrollFrame:GetChildren()do
if child:IsA("TextLabel")then
child:Destroy()
end
end
end


local function getEntries()
return entries
end

return{
Frame=frame,
ScrollFrame=scrollFrame,
addLog=addLog,
clear=clear,
getEntries=getEntries,
}
end

return Logs end function __MODULES.s()local v=__MODULES.cache.s if not v then v={c=__modImpl()}__MODULES.cache.s=v end return v.c end end do local function __modImpl()








local Styling=__MODULES.h()

local Timer={}

















function Timer.create(parent,config)
local cfg=config or{}
local isCountdown=cfg.countdown or false
local initialTime=cfg.startTime or 0
local autoStart=cfg.autoStart or false

local currentTime=initialTime
local running=false
local connection
local lastTick=0


local label=Instance.new("TextLabel")
label.Font=Enum.Font.Code
label.TextColor3=Styling.Colors.Text
label.TextSize=13
label.TextXAlignment=Enum.TextXAlignment.Right
label.AutomaticSize=Enum.AutomaticSize.XY
label.BackgroundTransparency=1
label.BorderSizePixel=0
label.Name="TimerLabel"
label.Parent=parent


local function formatTime(seconds)
local hours=math.floor(seconds/3600)
local mins=math.floor((seconds%3600)/60)
local secs=math.floor(seconds%60)

if hours>0 then
return string.format("%02d:%02d:%02d",hours,mins,secs)
else
return string.format("%02d:%02d",mins,secs)
end
end


local function updateDisplay()
label.Text=formatTime(currentTime)


if isCountdown then
if currentTime<=10 then
label.TextColor3=Color3.fromRGB(244,67,54)
elseif currentTime<=30 then
label.TextColor3=Color3.fromRGB(255,193,7)
else
label.TextColor3=Styling.Colors.Text
end
end
end


local function stop()
running=false
if connection then
connection:Disconnect()
connection=nil
end
end


local function start()
if running then
return
end
running=true
lastTick=tick()

connection=game:GetService("RunService").Heartbeat:Connect(function()
local now=tick()
local delta=now-lastTick
lastTick=now

if isCountdown then
currentTime=math.max(0,currentTime-delta)
if currentTime<=0 then
stop()
end
else
currentTime=currentTime+delta
end

updateDisplay()
end)
end


local function reset()
stop()
currentTime=initialTime
updateDisplay()
end


local function setTime(seconds)
currentTime=seconds
initialTime=seconds
updateDisplay()
end


local function getTime()
return currentTime
end


local function isRunningFn()
return running
end


updateDisplay()


if autoStart then
start()
end

return{
Label=label,
start=start,
stop=stop,
reset=reset,
setTime=setTime,
getTime=getTime,
isRunning=isRunningFn,
}
end

return Timer end function __MODULES.t()local v=__MODULES.cache.t if not v then v={c=__modImpl()}__MODULES.cache.t=v end return v.c end end do local function __modImpl()



























local UI={

Styling=__MODULES.h(),
Interaction=__MODULES.i(),


Window=__MODULES.j(),
Tab=__MODULES.k(),
Page=__MODULES.l(),
Row=__MODULES.m(),
Toggle=__MODULES.n(),
Badge=__MODULES.o(),
Status=__MODULES.p(),
Counter=__MODULES.q(),
Button=__MODULES.r(),
Logs=__MODULES.s(),
Timer=__MODULES.t(),
}

return UI end function __MODULES.u()local v=__MODULES.cache.u if not v then v={c=__modImpl()}__MODULES.cache.u=v end return v.c end end do local function __modImpl()

local RunService=game:GetService("RunService")
local Lighting=game:GetService("Lighting")

local function apply(enabled)
RunService:Set3dRenderingEnabled(not enabled)
setfpscap(if enabled then 30 else 60)
end

local function applyInitial(enabled)
if enabled then
settings().Rendering.QualityLevel=1
settings().Rendering.MeshCacheSize=32
settings().Rendering.EnableFRM=false

Lighting.GlobalShadows=false
Lighting.FogEnd=10
Lighting.Brightness=0

for _,instance in workspace:GetDescendants()do
if instance:IsA("ParticleEmitter")or instance:IsA("Trail")then
instance.Enabled=false
end
end
end

apply(enabled)
end

return{
applyInitial=applyInitial,
apply=apply,
}end function __MODULES.v()local v=__MODULES.cache.v if not v then v={c=__modImpl()}__MODULES.cache.v=v end return v.c end end do local function __modImpl()

local UI=__MODULES.u()

local Players=game:GetService("Players")
local STAGE_NAMES={POLLING="Searching",TELEPORTING="Teleporting",TRANSFERING="Trading"}
local MAX_LOGS=50

local function label(parent,value)
local caption=Instance.new("TextLabel")
caption.BackgroundTransparency=1
caption.Font=Enum.Font.GothamMedium
caption.TextSize=13
caption.TextColor3=UI.Styling.Colors.Text
caption.Text=value
caption.AutomaticSize=Enum.AutomaticSize.XY
caption.Size=UDim2.fromOffset(0,0)
caption.Parent=parent

return caption
end

local function row(parent,title,order)
local inner=UI.Row.create(parent,{layoutOrder=order,height=36})
UI.Row.addTitle(inner,title)

return UI.Row.addContent(inner)
end

local function View(configuration,state)
local settings=configuration.get()
local screenGui
local isBuilt=false
local logs
local pendingLogs={}
local pendingNotifications={}
local update=function()end

local function renderNotification(message,duration)
if not settings.notifications or not isBuilt then
return
end

local toast=Instance.new("Frame")
toast.BackgroundColor3=UI.Styling.Colors.Background
toast.BorderSizePixel=0
toast.AnchorPoint=Vector2.new(1,0)
toast.Position=UDim2.new(1,-16,0,16)
toast.Size=UDim2.fromOffset(280,0)
toast.AutomaticSize=Enum.AutomaticSize.Y
toast.ZIndex=10
toast.Parent=screenGui
UI.Styling.applyCorner(toast,10)
UI.Styling.applyTripleStroke(toast)
UI.Styling.applyPadding(toast,12)
local caption=label(toast,message)
caption.AutomaticSize=Enum.AutomaticSize.Y
caption.Size=UDim2.new(1,0,0,0)
caption.TextWrapped=true
caption.ZIndex=11
task.delay(math.max(0,duration),function()toast:Destroy()end)
end

local function flush()
local messages=pendingLogs
pendingLogs={}
for _,message in messages do
logs.addLog(message)
end

local notifications=pendingNotifications
pendingNotifications={}
for _,notification in notifications do
renderNotification(notification.message,notification.duration)
end
end

local function saveSettings()
configuration.save(settings)
end

local function buildUI()
screenGui=Instance.new("ScreenGui")
screenGui.Name="BladeBallAutoJoiner"
screenGui.IgnoreGuiInset=false
screenGui.ResetOnSpawn=false
screenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
screenGui.Parent=gethui()

local window=UI.Window.create(screenGui,{title="Auto Joiner",size=UDim2.fromOffset(380,450),minHeight=450})

local scales={}
for _,frame in{window.Frame,window.MinimizedFrame}do
local scale=frame:FindFirstChildOfClass("UIScale")or Instance.new("UIScale")
scale.Parent=frame
table.insert(scales,{instance=scale,base=scale.Scale})
end

local function applyScale()
for _,entry in scales do
entry.instance.Scale=entry.base*settings.textScale
end
end

applyScale()

local statsTab=UI.Tab.create(window.Tabs,{text="Stats",active=true,layoutOrder=0})
local settingsTab=UI.Tab.create(window.Tabs,{text="Settings",layoutOrder=1})
local statsPage=UI.Page.create(window.Container,{name="Stats",layoutOrder=0})
local settingsPage=UI.Page.create(window.Container,{name="Settings",layoutOrder=1})
window.PageLayout.TouchInputEnabled=false
window.PageLayout.ScrollWheelInputEnabled=false
window.PageLayout.GamepadInputEnabled=false

local function selectPage(showStats)
UI.Tab.setActive(statsTab,showStats)
UI.Tab.setActive(settingsTab,not showStats)
window.PageLayout:JumpTo(if showStats then statsPage else settingsPage)
end

statsTab.MouseButton1Click:Connect(function()selectPage(true)end)
settingsTab.MouseButton1Click:Connect(function()selectPage(false)end)
selectPage(true)

local statusContent=row(statsPage,"API Status:",0)
local mainStatus=UI.Status.create(statusContent,{active=false})
local statusText=label(statusContent,"Disconnected")
statusText.LayoutOrder=2
local mainItems=UI.Counter.create(row(statsPage,"Items in Inventory:",1),{value=state.inventory})
local stageText=label(row(statsPage,"Stage:",2),"Searching")
local targetText=label(row(statsPage,"Target:",3),"No target yet")
targetText.AutomaticSize=Enum.AutomaticSize.None
targetText.Size=UDim2.new(1,0,1,0)
targetText.TextXAlignment=Enum.TextXAlignment.Right
targetText.TextTruncate=Enum.TextTruncate.AtEnd
local stageTimer=UI.Timer.create(row(statsPage,"Stage timer:",4))
local miniStatus=UI.Status.create(window.MinimizedContent,{active=false})
local miniItems=UI.Counter.create(window.MinimizedContent,{value=state.inventory})
local miniTimer=UI.Timer.create(window.MinimizedContent)
miniItems.Label.LayoutOrder=2
miniTimer.Label.LayoutOrder=3
logs=UI.Logs.create(statsPage,{maxLines=MAX_LOGS,height=100})
logs.Frame.LayoutOrder=5

UI.Styling.applyFlexFill(logs.Frame)

UI.Toggle.create(row(settingsPage,"Allow Hits",0),{
default=not settings.paused,
onChanged=function(enabled)
settings.paused=not enabled
state.paused=settings.paused
saveSettings()
update()
end,
})
UI.Toggle.create(row(settingsPage,"FPS Optimization",1),{
default=settings.fpsOptimization,
onChanged=function(enabled)
settings.fpsOptimization=enabled
saveSettings()
local Performance=__MODULES.v()
Performance.apply(enabled)
end,
})
UI.Toggle.create(row(settingsPage,"Notifications",2),{
default=settings.notifications,
onChanged=function(enabled)
settings.notifications=enabled
saveSettings()
end,
})
local scaleContent=row(settingsPage,"Text size",3)
local scaleButtons={}

local function renderScaleButtons()
for value,button in scaleButtons do
button.button.TextColor3=if math.abs(settings.textScale-value)<0.001
then UI.Styling.Colors.Text else UI.Styling.Colors.TextMuted
end
end

for index,option in{{"S",0.9},{"M",1},{"L",1.25}}do
local value=option[2]
local button=UI.Button.create(scaleContent,{
text=option[1],size="sm",
onClick=function()
settings.textScale=value
saveSettings()
applyScale()
renderScaleButtons()
end,
})
button.button.LayoutOrder=index
scaleButtons[value]=button
end

renderScaleButtons()
UI.Button.create(row(settingsPage,"Rejoin",4),{
text="Click",variant="primary",size="sm",
onClick=function()
game:GetService("TeleportService"):Teleport(game.PlaceId)
end,
})

local lastStage=state.stage
local stageEnteredAt=os.clock()
update=function()
if state.stage~=lastStage then
lastStage=state.stage
stageEnteredAt=os.clock()
end

mainStatus.setActive(state.connected)
miniStatus.setActive(state.connected and not state.paused)
statusText.Text=if state.connected then"Connected"else"Disconnected"
mainItems.setValue(state.inventory)
miniItems.setValue(state.inventory)
stageText.Text=if state.paused then"Paused"else(STAGE_NAMES[state.stage]or state.stage)
targetText.Text=if state.hit then state.hit.username else"No target yet"
local elapsed=os.clock()-stageEnteredAt
stageTimer.setTime(elapsed)
miniTimer.setTime(elapsed)
end
end

local function log(message)

table.insert(pendingLogs,message)
if#pendingLogs>MAX_LOGS then
table.remove(pendingLogs,1)
end
end

local function notify(message,duration)
if not settings.notifications then
return
end

table.insert(pendingNotifications,{message=message,duration=duration})
if#pendingNotifications>10 then
table.remove(pendingNotifications,1)
end
end

local function start()
if isBuilt then
return
end

state.paused=settings.paused
buildUI()
isBuilt=true
flush()
update()
local Performance=__MODULES.v()
Performance.applyInitial(settings.fpsOptimization)
task.spawn(function()
while screenGui.Parent do
task.wait(1)
if screenGui.Parent then
local ok,message=pcall(function()
flush()
update()
end)

if not ok then
warn("[ui] refresh failed: "..tostring(message))
end
end
end
end)
end

return{start=start,log=log,notify=notify}
end

return View end function __MODULES.w()local v=__MODULES.cache.w if not v then v={c=__modImpl()}__MODULES.cache.w=v end return v.c end end do local function __modImpl()

repeat
task.wait()
until workspace:GetAttribute("ClientStarted")

task.wait(1)

local Config=__MODULES.a()
local Trade=__MODULES.d()
local Teleport=__MODULES.e()
local Inventory=__MODULES.f()
local AntiAfk=__MODULES.g()
local UI=__MODULES.w()

return function(api,storage)
local players=game:GetService("Players")
local state={
stage="POLLING",
hit=nil,
paused=false,
connected=false,

inventory=0,
tradeOpen=false,
emptyTrades=0,

activityAt=os.clock(),
answerAt=os.clock(),
tradeUpdatedAt=os.clock(),
}
local view=UI(storage.settings,state)

local function log(message)
print("[joiner] "..message)
local ok,reason=pcall(view.log,message)
if not ok then
warn("[ui] log failed: "..tostring(reason))
end
end

local teleport=Teleport({info=log,warn=log,error=log})
local inventory=Inventory()
local trade
local tradeGeneration=0
local awaitingResult=false
local hasSuccessfulTrade=false

local function every(seconds,callback)
task.spawn(function()
while true do
local ok,message=pcall(callback)
if not ok then
log(tostring(message))
end

task.wait(seconds)
end
end)
end

local function complete()
hasSuccessfulTrade=false
state.hit,state.tradeOpen,state.emptyTrades=nil,false,0
state.stage,state.answerAt="POLLING",os.clock()
local ok,reason=pcall(storage.clearHit)
if not ok then
log("could not clear saved target: "..tostring(reason))
end
end

local function failedTrade(reason)
state.tradeOpen=false
state.emptyTrades+=1
state.activityAt=os.clock()
log(reason)
if state.emptyTrades>=Config.MAX_EMPTY_TRADES then
complete()
end
end

local function cancelTrade(reason)
local generation,hit=tradeGeneration,state.hit

state.tradeOpen=false
local ok,message=pcall(trade.decline)
if not ok then
log(tostring(message))
end

if tradeGeneration==generation and state.hit==hit then
failedTrade(reason)
end
end

local function activate(hit)
hasSuccessfulTrade=false
state.hit,state.emptyTrades=hit,0
state.activityAt=os.clock()
if hit.serverId==game.JobId then
state.stage="TRANSFERING"
log("waiting for "..hit.username)
else
state.stage="TELEPORTING"
log("teleporting to "..hit.username)
if teleport.teleport(hit.serverId)==false and state.hit==hit then
log("teleport attempts exhausted")
complete()
end
end
end

local function onTrade(event,data)
if event=="tradeUpdated"then
state.activityAt,state.tradeUpdatedAt=os.clock(),os.clock()
elseif event=="tradeRequestReceived"then
if state.tradeOpen then
return
end

if not state.hit or state.hit.username~=data.username then
trade.rejectRequest(data.username)

return
end

state.activityAt=os.clock()
local ok,reason=trade.acceptRequest(data.username)
if ok then
ok,reason=trade.waitForOpen(data.username,20)
end
if not ok then log("request failed: "..tostring(reason))end
elseif event=="tradeOpened"then
local hit=state.hit
if not hit or hit.username~=data.username then trade.decline();return end
if state.tradeOpen then
return
end

tradeGeneration+=1
local generation=tradeGeneration
awaitingResult=false
state.tradeOpen=true
state.activityAt,state.tradeUpdatedAt=os.clock(),os.clock()
local ok,reason=trade.accept()
if not ok and state.hit==hit and state.tradeOpen and tradeGeneration==generation and not awaitingResult then
cancelTrade("ready/confirm failed: "..tostring(reason))
end
elseif event=="tradeClosed"then
awaitingResult=true
elseif event=="tradeFinished"then
if not state.tradeOpen or not state.hit then
return
end

if data.isSuccess and data.received>0 then
hasSuccessfulTrade=true
log(`trade complete: {data.received} items received`)
state.tradeOpen,state.emptyTrades=false,0
state.stage="TRANSFERING"
state.activityAt,state.tradeUpdatedAt=os.clock(),os.clock()
else
failedTrade("trade failed or brought no items")
end
end
end

trade=Trade.createTrade(function(event,data)
task.spawn(function()
local ok,message=pcall(onTrade,event,data)
if not ok then
log("trade event failed: "..tostring(message))
end
end)
end,true,log,5)

AntiAfk.start()
view.start()
local replicated=game:GetService("ReplicatedStorage")
replicated:WaitForChild("Shared"):WaitForChild("Trading"):WaitForChild("TradeInfo")
replicated:WaitForChild("Controllers"):WaitForChild("Trading"):WaitForChild("TradeTabController")
replicated:WaitForChild("Packages"):WaitForChild("Replion")
local saved=storage.getHit()
if saved then
activate(saved)
end

trade.listen()

task.spawn(function()
if not api.register(players.LocalPlayer.Name)then log("account registration failed")end
end)

every(0.8,function()
if state.paused or state.stage~="POLLING"then
return
end
local hit,connected=api.getHit()
state.connected=connected
if connected then
state.answerAt=os.clock()
end

if hit then storage.saveHit(hit);activate(hit)end
end)

every(1,function()
local now=os.clock()
if state.paused or state.stage~="POLLING"then
state.answerAt=now
elseif now-state.answerAt>Config.SILENCE_TIMEOUT_SECONDS then
state.answerAt=now
log("backend silent, rejoining")
teleport.rejoin()
state.answerAt=os.clock()
end

if state.tradeOpen then
if now-state.tradeUpdatedAt>Config.TRADE_DEADLINE_SECONDS then
cancelTrade("trade went quiet")
end
elseif state.stage=="TRANSFERING"and state.hit then
local elapsed=now-state.activityAt
local targetAbsent=elapsed>15 and not players:FindFirstChild(state.hit.username)
local initialTradeTimedOut=not hasSuccessfulTrade and elapsed>Config.TRANSFER_TIMEOUT_SECONDS

if targetAbsent or initialTradeTimedOut then
log(if targetAbsent then"target left the server"else"first trade timed out")
complete()
end
end
end)

every(1,function()state.inventory=inventory.count()end)

return state
end end function __MODULES.x()local v=__MODULES.cache.x if not v then v={c=__modImpl()}__MODULES.cache.x=v end return v.c end end end

if getgenv().executed then return end
getgenv().executed=true

local Config=__MODULES.a()
local API=__MODULES.b()
local Storage=__MODULES.c()
local start=__MODULES.x()

if not game:IsLoaded()then game.Loaded:Wait()end
if not table.find(Config.PLACE_IDS,game.PlaceId)then return end
assert(type(AUTHORIZATION_KEY)=="string"and#AUTHORIZATION_KEY>0,"Set AUTHORIZATION_KEY before running Joiner")
local players=game:GetService("Players")
while not players.LocalPlayer do task.wait()end

local source=getgenv().BLADE_BALL_JOINER_SOURCE
local queue=queue_on_teleport or(syn and syn.queue_on_teleport)
assert(type(source)=="string","Run the built out/joiner.luau")
assert(type(queue)=="function","Executor must support queue_on_teleport")
queue(string.format(
[[getgenv().AUTHORIZATION_KEY = %q; getgenv().BLADE_BALL_JOINER_SOURCE = %q; assert(loadstring(getgenv().BLADE_BALL_JOINER_SOURCE))()]],
AUTHORIZATION_KEY,source
))

start(API(AUTHORIZATION_KEY),Storage(tostring(players.LocalPlayer.UserId)))
]=]))()
