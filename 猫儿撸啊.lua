-- ============================================================
-- Ohio 模块 - 使用 Moonui.lua UI 库
-- ============================================================

-- 1. 加载 Moonui 库
local success, result = pcall(function()
	local raw = readfile("Moonui.lua")
	return loadstring(raw)()
end)

local Library

if success and typeof(result) ~= "boolean" and result ~= nil then
	Library = result
else
	Library = getgenv().Library or getgenv().Moon or getgenv().UI
end

if not Library or type(Library) ~= "table" then
	warn("[Ohio] UI 库加载失败，请确认 Moonui.lua 存在且返回了 UI 库对象")
	return
end

-- 2. 全局环境别名（ohio 代码依赖原脚本定义的大量别名）
pcall(setfpscap, 2000)

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
EmptyFunction = function() end
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

repeat
	Wait()
until game:IsLoaded()

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
	if arg == nil then return nil end
	return arg:GetAttribute(arg2)
end

SetAttribute = function(arg, arg2, arg3)
	if arg == nil then return end
	arg:SetAttribute(arg2, arg3)
end

Disconnect = function(arg)
	if arg == nil then return end
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

FindFirstAncestorOfClass = function(D,H)if D==nil then return nil;end;return D:FindFirstAncestorOfClass(H);end
IsAncestorOf = function(D,H)if D==nil or H==nil then return false;end;return D:IsAncestorOf(H);end
RaycastWorkspace = function(D,H,m)return Raycast(Workspace,D,H,m);end
WorldToViewport = function(...) return CurrentCamera:WorldToViewportPoint(...) end
LookAngle = function(D,H,m)local h=m-H;if h.Magnitude<0.001 then return 0;end;return Acos(Clamp(Dot(D,h.Unit),-1,1))*2;end
GetPlayerList = function()return GetPlayers(Players);end
MouseLocation = function()return GetMouseLocation(UserInputService);end

-- 3. 使用 Moonui 库创建窗口（保留 Translations 表，因为 UI 库内部会通过它做翻译）
local v14 = Library:CreateWindow({
	Title = "Moon",
	Version = "Lua",
	Theme = "Gothic",
	SearchTab = { Id = "tab-search", Name = "搜索", Kind = "Search" },
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
		["Blade Ball"] = "Blade Ball",
		["Block Spin"] = "Block Spin",
		["block-spin-move"] = "移动",
		["block-spin-rage"] = "暴力",
		["bullet-speed"] = "子弹速度",
		["Candy → Blue Candy"] = "糖果棒 → 蓝糖果棒",
		["carry-abuse"] = "携带滥用",
		["combat-switch"] = "允许战斗换角色",
		["damage-boost"] = "伤害加强",
		["dash-patch"] = "冲刺修补",
		Defusal = "Defusal",
		["defusal-auto-defuse"] = "自动拆弹",
		["defusal-auto-plant"] = "自动下包",
		["defusal-bomb-alarm"] = "炸弹警报",
		["defusal-bomb-esp"] = "炸弹透视",
		["defusal-buy-menu"] = "购买菜单",
		["defusal-fast-defuse"] = "快速拆弹",
		["defusal-fast-plant"] = "快速下包",
		["defusal-no-flash"] = "无闪光",
		["defusal-no-smoke"] = "无烟雾",
		["defusal-silent-aim"] = "静默自瞄",
		["endless-ult"] = "延长大招",
		["fake-lag"] = "虚假延迟",
		["fake-lag-interval"] = "虚假延迟间隔",
		["fast-attack"] = "快速攻击",
		Gakuran = "Gakuran",
		["gakuran-aim-assist"] = "辅助瞄准",
		["gakuran-auto-block"] = "自动格挡",
		["gakuran-auto-dodge"] = "自动闪避",
		["gakuran-auto-parry"] = "自动招架",
		["gakuran-combat-log"] = "战斗日志",
		["gakuran-hitbox"] = "范围",
		["gakuran-kill-aura"] = "杀戮光环",
		["gakuran-legit"] = "合法化",
		["gakuran-misc"] = "杂项",
		["gakuran-rage"] = "暴力",
		["gakuran-silent-aim"] = "静默自瞄",
		["gakuran-spin"] = "旋转",
		["gakuran-ultimate"] = "大招",
		["gakuran-visualize"] = "可视化",
		["gakuran-wall-abuse"] = "墙打滥用",
		["Gun Grounds FFA"] = "Gun Grounds FFA",
		["gun-grounds-rage"] = "暴力",
		["hit-sound"] = "命中音效",
		["instant-respawn"] = "秒复活",
		["instant-ult"] = "大招秒变",
		["kill-all"] = "杀全服",
		["kill-all-delay"] = "杀全服延迟",
		["kill-all-method"] = "杀全服方式",
		["kill-all-method-gun"] = "枪",
		["kill-all-method-knife"] = "刀",
		["kill-all-method-punch"] = "拳",
		["kill-all-method-rpg"] = "RPG",
		["kill-all-method-trident"] = "三叉戟",
		["kill-all-whitelist"] = "杀全服白名单",
		["Legit"] = "合法化",
		["manual-load"] = "手动加载",
		["Misc"] = "杂项",
		["misc-anti-afk"] = "防挂机",
		["misc-anti-fling"] = "防甩飞",
		["misc-auto-clicker"] = "自动点击",
		["misc-auto-parry"] = "自动招架",
		["misc-chat-spy"] = "聊天间谍",
		["misc-esp"] = "透视",
		["misc-fly"] = "飞行",
		["misc-freecam"] = "自由视角",
		["misc-gun-mod"] = "枪械修改",
		["misc-hitbox"] = "范围",
		["misc-infinite-jump"] = "无限跳跃",
		["misc-noclip"] = "穿墙",
		["misc-server-hop"] = "换服",
		["misc-silent-aim"] = "静默自瞄",
		["misc-speed"] = "速度",
		["misc-spin"] = "旋转",
		["misc-teleport"] = "传送",
		["misc-trigger-bot"] = "触发机器人",
		["misc-wallbang"] = "穿墙射击",
		["multi-ult"] = "大招多用",
		["no-dash-cd"] = "冲刺无冷却",
		["no-hitstun"] = "无僵直",
		["no-jump-fatigue"] = "无跳跃疲劳",
		["no-slow"] = "无减速",
		["no-smoke"] = "无烟雾",
		["one-punch"] = "一拳超人",
		["prevent-respawn"] = "阻止重生光环",
		["ragebot"] = "愤怒机器人",
		["ragebot-keybind"] = "按键",
		["ragebot-nextbot"] = "Nextbot",
		["Rage"] = "暴力",
		["silent-block"] = "静默防御",
		["size-x"] = "大小X",
		["size-y"] = "大小Y",
		["size-z"] = "大小Z",
		["tab-config"] = "配置",
		["tab-language"] = "语言",
		["tab-misc"] = "杂项",
		["tab-movement"] = "移动",
		["tab-player-list"] = "玩家列表",
		["tab-render"] = "视觉",
		["tab-search"] = "搜索",
		["tab-settings"] = "设置",
		["tab-themes"] = "主题",
		["tp-all"] = "传送全服",
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
		["wanted-silent-aim-priority"] = "命中优先级",
		["wanted-silent-aim-visualize-fov"] = "显示视野",
		ohio_farm_aura_jewelrycase = "珠宝柜",
		farm_task_jewelrycase = "珠宝柜",
	},
})

if not v14 then
	warn("[Ohio] 窗口创建失败")
	return
end

-- 4. 通知函数（ohio 代码内部使用 fn7 显示提示）
local fn7
fn7 = function(H, m, h)
	v14:Notify({ Title = H, Content = m, Duration = h or 3 })
end

-- 5. Ohio 主逻辑
local Ohio = function()
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

		local v35 = v14:CreateTab({ Id = "ohio-legit", Name = "合法化" })

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
				Name = "状态",
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
				Name = "静默防御",
				Default = tbl32.SilentBlock,
				Callback = function(silentBlock)
					tbl32.SilentBlock = silentBlock
				end,
			})

			v41:CreateToggle({
				Id = "allow-block-stomp",
				Name = "允许格挡踩踏",
				Default = tbl32.AllowBlockStomp,
				Callback = function(allowBlockStomp)
					tbl32.AllowBlockStomp = allowBlockStomp
				end,
			})

			v41:CreateToggle({
				Id = "anti-ragdoll",
				Name = "防布娃娃",
				Default = tbl32.AntiRagdoll,
				Callback = function(antiRagdoll)
					tbl32.AntiRagdoll = antiRagdoll
				end,
			})

			v41:CreateToggle({
				Id = "no-sit",
				Name = "禁止坐下",
				Default = tbl32.NoSit,
				Callback = function(noSit)
					tbl32.NoSit = noSit
				end,
			})

			v41:CreateToggle({
				Id = "no-in-combat",
				Name = "无战斗状态",
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
				Name = "辅助瞄准",
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
				Name = "部位",
				Options = { { Value = "Head" }, { Value = "Body" } },
				Default = tbl31.AimAssist.Part,
				Callback = function(part)
					tbl31.AimAssist.Part = part
				end,
			})

			tbl31.AimAssist.Module:CreateSlider({
				Id = "ohio-aim-assist-x-speed",
				Name = "水平速度",
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
				Name = "垂直速度",
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
				Name = "动画",
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
				Name = "预判 X",
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
				Name = "预判 Y",
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
				Name = "范围",
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
				Name = "使用范围",
				Default = tbl31.AimAssist.UseFov,
				Callback = function(useFov)
					tbl31.AimAssist.UseFov = useFov
				end,
			})

			tbl31.AimAssist.Module:CreateSlider({
				Id = "ohio-aim-assist-fov",
				Name = "视野",
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
				Name = "颜色",
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
						fn7("静默自瞄", "挂钩射击失败", 4)
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
					Name = "静默自瞄",
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
					Name = "最大视野",
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
					Name = "命中率",
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
					Name = "精度",
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
					Name = "点位缩放",
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
					Name = "命中优先级",
					Options = { { Value = "Closest" }, { Value = "Head" }, { Value = "Body" } },
					Default = tbl31.SilentAim.Priority,
					Callback = function(priority)
						tbl31.SilentAim.Priority = priority
					end,
				})

				tbl31.SilentAim.Module:CreateToggle({
					Id = "ohio-silent-aim-hitbox-head",
					Name = "头部",
					Default = tbl31.SilentAim.Hitboxes.Head,
					Callback = function(arg)
						tbl31.SilentAim.Hitboxes.Head = arg == true
					end,
				})

				tbl31.SilentAim.Module:CreateToggle({
					Id = "ohio-silent-aim-hitbox-body",
					Name = "身体",
					Default = tbl31.SilentAim.Hitboxes.Body,
					Callback = function(arg)
						tbl31.SilentAim.Hitboxes.Body = arg == true
					end,
				})

				tbl31.SilentAim.Module:CreateToggle({
					Id = "ohio-silent-aim-hitbox-arms",
					Name = "手臂",
					Default = tbl31.SilentAim.Hitboxes.Arms,
					Callback = function(arg)
						tbl31.SilentAim.Hitboxes.Arms = arg == true
					end,
				})

				tbl31.SilentAim.Module:CreateToggle({
					Id = "ohio-silent-aim-hitbox-legs",
					Name = "腿部",
					Default = tbl31.SilentAim.Hitboxes.Legs,
					Callback = function(arg)
						tbl31.SilentAim.Hitboxes.Legs = arg == true
					end,
				})

				tbl31.SilentAim.Module:CreateSlider({
					Id = "ohio-silent-aim-prediction-x",
					Name = "预判 X",
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
					Name = "预判 Y",
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
					Name = "显示视野",
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
					Name = "忽略倒地",
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
				Name = "枪械修改",
				Default = false,
				Callback = function(arg)
					tbl31.GunMod.Enabled = arg == true
					fn133()
				end,
			})

			v52:CreateSlider({
				Id = "ohio-gun-mod-recoil",
				Name = "后坐力",
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
				Name = "扩散",
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
				Name = "开火延迟",
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
				Name = "子弹速度",
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
				Name = "子弹存活时间",
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
				Name = "无限咖啡",
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
		local v36 = v14:CreateTab({ Id = "ohio-rage", Name = "Ohio 愤怒" })

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
				Name = "命中框",
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
				Name = "按键",
				Callback = function()
					tbl31.Hitbox.Module:Set(not tbl31.Hitbox.Module:Get())
				end,
			})

			tbl31.Hitbox.Module:CreateSelector({
				Id = "ohio-hitbox-part",
				Name = "部位",
				Options = { { Value = "Head" }, { Value = "Body" }, { Value = "Random" } },
				Default = tbl31.Hitbox.Part,
				Callback = function(part)
					tbl31.Hitbox.Part = part
				end,
			})

			tbl31.Hitbox.Module:CreateSlider({
				Id = "ohio-hitbox-hit-chance",
				Name = "命中率",
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
				Name = "大小",
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
				Name = "透明度",
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
				Name = "颜色",
				Default = tbl31.Hitbox.Color,
				Callback = function(color)
					tbl31.Hitbox.Color = color
					fn115()
				end,
			})

			tbl31.MeleeAura.Module = v36:CreateModule({
				Id = "ohio-melee-aura",
				Name = "近战光环",
				Callback = function()
					fn130()
				end,
			})

			tbl31.MeleeAura.Module:CreateToggle({
				Id = "ohio-melee-aura-vehicles",
				Name = "载具",
				Default = tbl31.MeleeAura.Vehicles,
				Callback = function(vehicles)
					tbl31.MeleeAura.Vehicles = vehicles
					fn130()
				end,
			})

			tbl31.MeleeAura.Module:CreateToggle({
				Id = "ohio-melee-aura-break-vest",
				Name = "破甲",
				Default = tbl31.BreakVest,
				Callback = function(breakVest)
					tbl31.BreakVest = breakVest
				end,
			})

			tbl31.StompAuraModule = v36:CreateModule({
				Id = "ohio-stomp-aura",
				Name = "踩踏光环",
				Callback = function()
					fn130()
				end,
			})

			tbl31.StompAuraModule:CreateKeybind({
				Id = "ohio-stomp-aura-keybind",
				Name = "按键",
				Callback = function()
					tbl31.StompAuraModule:Set(not tbl31.StompAuraModule:Get())
				end,
			})

			tbl31.GrabAuraModule = v36:CreateModule({
				Id = "ohio-grab-aura",
				Name = "抓取光环",
				Callback = function()
					fn130()
				end,
			})

			tbl31.GrabAuraModule:CreateKeybind({
				Id = "ohio-grab-aura-keybind",
				Name = "按键",
				Callback = function()
					tbl31.GrabAuraModule:Set(not tbl31.GrabAuraModule:Get())
				end,
			})

			tbl31.GrabAuraModule:CreateToggle({
				Id = "ohio-grab-aura-drop",
				Name = "丢弃",
				Default = tbl31.GrabAuraDrop,
				Callback = function(grabAuraDrop)
					tbl31.GrabAuraDrop = grabAuraDrop
				end,
			})

			tbl31.HandcuffAuraModule = v36:CreateModule({
				Id = "ohio-handcuff-aura",
				Name = "手铐光环",
				Callback = function()
					fn130()
				end,
			})

			tbl31.HandcuffAuraModule:CreateKeybind({
				Id = "ohio-handcuff-aura-keybind",
				Name = "按键",
				Callback = function()
					tbl31.HandcuffAuraModule:Set(not tbl31.HandcuffAuraModule:Get())
				end,
			})

			local v39 = nil
			local v40 = nil
			local n8 = 3

			local v41 = v36:CreateModule({
				Id = "ohio-shake-aura",
				Name = "抖动光环",
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
				Name = "按键",
				Callback = function()
					v41:Set(not v41:Get())
				end,
			})

			v41:CreateSlider({
				Id = "ohio-shake-aura-max-target",
				Name = "最大目标",
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
				Name = "自动防弹衣",
				Callback = function(arg)
					fn131()

					if arg then
						fn93(tbl31.AutoVest.Vest)
					end
				end,
			})

			tbl31.AutoVest.Module:CreateKeybind({
				Id = "ohio-auto-vest-keybind",
				Name = "按键",
				Callback = function()
					tbl31.AutoVest.Module:Set(not tbl31.AutoVest.Module:Get())
				end,
			})

			tbl31.AutoVest.Module:CreateSelector({
				Id = "ohio-auto-vest-vest",
				Name = "防弹衣",
				Options = { { Value = "Light Vest" }, { Value = "Medium Vest" }, { Value = "Heavy Vest" } },
				Default = tbl31.AutoVest.Vest,
				Callback = function(vest)
					tbl31.AutoVest.Vest = vest
				end,
			})

			tbl31.AutoHealModule = v36:CreateModule({
				Id = "ohio-auto-heal",
				Name = "自动治疗",
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
				Name = "按键",
				Callback = function()
					tbl31.AutoHealModule:Set(not tbl31.AutoHealModule:Get())
				end,
			})

			tbl31.Ragebot.Module = v36:CreateModule({
				Id = "ohio-ragebot",
				Name = "愤怒机器人",
				Callback = function()
					fn130()
				end,
			})

			tbl31.Ragebot.Module:CreateKeybind({
				Id = "ohio-ragebot-keybind",
				Name = "按键",
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
				Name = "RPG/三叉戟全服",
				Callback = function()
					fn130()
				end,
			})

			tbl31.RPG_TridentAll.Module:CreateKeybind({
				Id = "ohio-rpg-trident-all-keybind",
				Name = "按键",
				Callback = function()
					tbl31.RPG_TridentAll.Module:Set(not tbl31.RPG_TridentAll.Module:Get())
				end,
			})

			tbl31.RPG_TridentAll.Module:CreateSlider({
				Id = "ohio-rpg-trident-all-delay",
				Name = "延迟",
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
				Name = "火焰/酸液最近",
				Callback = function()
					fn130()
				end,
			})

			tbl31.Flame_AcidKillNearest:CreateKeybind({
				Id = "ohio-flame-acid-kill-nearest-keybind",
				Name = "按键",
				Callback = function()
					tbl31.Flame_AcidKillNearest:Set(not tbl31.Flame_AcidKillNearest:Get())
				end,
			})

			tbl31.SprayNearest = v36:CreateModule({
				Id = "ohio-spray-nearest",
				Name = "喷射最近",
				Callback = function()
					fn130()
				end,
			})

			tbl31.SprayNearest:CreateKeybind({
				Id = "ohio-spray-nearest-keybind",
				Name = "按键",
				Callback = function()
					tbl31.SprayNearest.Module:Set(not tbl31.SprayNearest.Module:Get())
				end,
			})
		end

		fn112()
		local v37 = v14:CreateTab({ Id = "ohio-target", Name = "目标" })

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
				Name = "自动反击",
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
				Name = "按键",
				Callback = function()
					v41:Set(not v41:Get())
				end,
			})

			v41:CreateToggle({
				Id = "ohio-auto-counter-on-attack",
				Name = "受击时",
				Default = TargetState.AutoCounterOnAttack,
				Callback = function(autoCounterOnAttack)
					TargetState.AutoCounterOnAttack = autoCounterOnAttack
				end,
			})

			local v42 = v37:CreateModule({
				Id = "ohio-auto-kill-all",
				Name = "自动杀全服",
				Default = TargetState.AutoKlAll,
				Callback = function(autoKlAll)
					TargetState.AutoKlAll = autoKlAll
					fn123()
				end,
			})

			v42:CreateKeybind({
				Id = "ohio-auto-kill-all-keybind",
				Name = "按键",
				Callback = function()
					v42:Set(not v42:Get())
				end,
			})

			autoKillBlacklistModule = v37:CreateModule({
				Id = "ohio-auto-kill-blacklist",
				Name = "自动杀黑名单",
				Default = TargetState.AutoKlBlacklist,
				Callback = function(autoKlBlacklist)
					TargetState.AutoKlBlacklist = autoKlBlacklist
					fn123()
				end,
			})

			autoKillBlacklistModule:CreateKeybind({
				Id = "ohio-auto-kill-blacklist-keybind",
				Name = "按键",
				Callback = function()
					autoKillBlacklistModule:Set(not autoKillBlacklistModule:Get())
				end,
			})

			autoKillBlacklistModule:CreateSlider({
				Id = "ohio-auto-kill-blacklist-hide-interval-ms",
				Name = "隐藏间隔(毫秒)",
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

			v37:CreateModule({ Id = "ohio-target-kill-method", Name = "击杀方式" }):CreateSelector({
				Id = "ohio-kill-method",
				Name = "方式",
				Options = { "Melee", "Gun" },
				Default = TargetState.Method,
				Callback = function(arg)
					TargetState.Method = fn116(arg)
					fn123()
				end,
			})

			local v43 = v37:CreateModule({
				Id = "ohio-ignore-force-field",
				Name = "忽略无敌",
				Default = TargetState.IFF,
				Callback = function(iff)
					TargetState.IFF = iff
				end,
			})

			v43:CreateKeybind({
				Id = "ohio-iff-keybind",
				Name = "按键",
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

		local v38 = v14:CreateTab({ Id = "ohio-farm", Name = "Ohio 农场" })

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
				Name = "管理员检测",
				Default = tbl31.AdminCheck,
				Callback = function(adminCheck)
					tbl31.AdminCheck = adminCheck
					fn120()
				end,
			}):CreateToggle({
				Id = "ohio-farm-auto-leave",
				Name = "自动离开",
				Default = tbl31.AutoLeave,
				Callback = function(autoLeave)
					tbl31.AutoLeave = autoLeave
				end,
			})

			v38:CreateModule({
				Id = "ohio-farm-auto-rewards",
				Name = "自动奖励",
				Default = tbl31.AutoRewards,
				Callback = function(autoRewards)
					tbl31.AutoRewards = autoRewards
					fn122()
				end,
			})

			v38:CreateModule({
				Id = "ohio-farm-auto-mask",
				Name = "自动面具",
				Default = tbl31.AutoMask.Enabled,
				Callback = function(enabled)
					tbl31.AutoMask.Enabled = enabled
					fn123()
				end,
			}):CreateSelector({
				Id = "ohio-farm-mask",
				Name = "面具",
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
				Name = "农场光环",
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
				Name = "自动农场",
				Default = tbl31.AutoFarm.Enabled,
				Callback = function(enabled)
					tbl31.AutoFarm.Enabled = enabled
					fn155()
				end,
			})

			v48:CreateSlider({
				Id = "ohio-farm-min-stash-price",
				Name = "最低仓库价格",
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
				Name = "最低农场价格",
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
				Name = "最低农场现金",
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
				Name = "自动出售",
				Default = tbl31.AutoSell.Enabled,
				Callback = function(enabled)
					tbl31.AutoSell.Enabled = enabled
					fn156()
				end,
			})

			v49:CreateToggle({
				Id = "ohio-farm-use-ignore",
				Name = "使用忽略",
				Default = tbl31.AutoSell.UseIgnore,
				Callback = function(useIgnore)
					tbl31.AutoSell.UseIgnore = useIgnore
				end,
			})

			v49:CreateSlider({
				Id = "ohio-farm-max-sell",
				Name = "最大出售",
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
				Name = "自动使用",
				Default = tbl31.AutoUse,
				Callback = function(autoUse)
					tbl31.AutoUse = autoUse
					fn156()
				end,
			})

			v38:CreateModule({
				Id = "ohio-farm-auto-disassemble",
				Name = "自动拆解",
				Default = tbl31.AutoDisassemble,
				Callback = function(autoDisassemble)
					tbl31.AutoDisassemble = autoDisassemble
					fn156()
				end,
			})

			v38:CreateModule({
				Id = "ohio-farm-auto-remove",
				Name = "自动移除",
				Default = tbl31.AutoRemove,
				Callback = function(autoRemove)
					tbl31.AutoRemove = autoRemove
					fn156()
				end,
			})

			v38:CreateModule({
				Id = "ohio-farm-auto-dumbell",
				Name = "自动哑铃",
				Default = tbl31.AutoDumbell,
				Callback = function(autoDumbell)
					tbl31.AutoDumbell = autoDumbell
					fn157()
				end,
			})
		end

		fn115()
		local v39 = v14:CreateTab({ Id = "ohio-misc", Name = "Ohio 杂项" })

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
				Name = "防粘滞卡顿",
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

			v39:CreateModule({ Id = "ohio-misc-join-server", Name = "加入服务器" }):CreateButton({
				Id = "ohio-misc-join-vc-server",
				Name = "语音服",
				Callback = function()
					FireServer("teleportVC")
				end,
			})

			local v40 = v39:CreateModule({ Id = "ohio-misc-join-player", Name = "加入玩家" })

			v40:CreateInput({
				Id = "ohio-misc-join-plr-input",
				Name = "玩家名称/ID",
				Default = tbl31.JoinPlr,
				Placeholder = "用户名/用户ID",
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
				Name = "加入",
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
				Name = "无镜头抖动",
				Default = tbl31.NoCameraShake,
				Callback = function(noCameraShake)
					tbl31.NoCameraShake = noCameraShake
					fn118(noCameraShake)
				end,
			})

			local v41 = v39:CreateModule({ Id = "ohio-misc-block-vfx", Name = "屏蔽特效" })

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

			local v42 = v39:CreateModule({ Id = "ohio-misc-spawn-cash", Name = "生成现金" })

			v42:CreateInput({
				Id = "ohio-misc-spawn-cash-input",
				Name = "数量",
				Default = tbl31.SpawnCash,
				Placeholder = "数字",
				Callback = function(arg)
					tbl31.SpawnCash = tonumber(arg) or tbl31.SpawnCash
				end,
			})

			v42:CreateButton({
				Id = "ohio-misc-spawn-cash-btn",
				Name = "生成",
				Callback = function()
					fn88(tbl31.SpawnCash)
				end,
			})

			v39:CreateModule({
				Id = "ohio-misc-fake-cash",
				Name = "假现金",
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
				Name = "数量",
				Default = tbl31.FakeCash.Cash,
				Placeholder = "数字",
				Callback = function(arg)
					tbl31.FakeCash.Cash = tonumber(arg) or tbl31.FakeCash.Cash
				end,
			})

			v39:CreateModule({ Id = "ohio-misc-unlock-skin", Name = "解锁皮肤" }):CreateButton({
				Id = "ohio-misc-unlock-skin",
				Name = "解锁皮肤",
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

			v39:CreateModule({ Id = "ohio-misc-fake-wallet", Name = "假钱包" }):CreateSelector({
				Id = "ohio-misc-fake-wallet",
				Name = "假钱包",
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
				Name = "美化物品",
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
				Name = "苦无 → 灵魂苦无",
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
				Name = "糖果棒 → 蓝糖果棒",
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
				Name = "镰刀 → 幽灵镰刀",
				Callback = function()
					tbl26.Scythe = true
					tbl31.Beautify.Scythe = true

					if flag then
						fn91(true, true)
					end
				end,
			})

			local v46 = v39:CreateModule({ Id = "ohio-misc-get-gun", Name = "获取枪支" })

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

			local v47 = v39:CreateModule({ Id = "ohio-misc-buy-gun", Name = "购买枪支" })

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

			local v48 = v39:CreateModule({ Id = "ohio-misc-get-balloon", Name = "获取气球" })

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

			local v49 = v39:CreateModule({ Id = "ohio-misc-get-kunai", Name = "获取苦无" })

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
end

-- 6. 执行 Ohio 模块
local ohioOk, ohioErr = pcall(Ohio)
if not ohioOk then
	warn("[Ohio] 执行失败: " .. tostring(ohioErr))
end

-- 7. 加载完成提示
fn7("Moon Lua", "Ohio 模块已加载", 5)