script_name("Farm Bot")
script_author("Miron Diamond")

require("moonloader")

script_version = 2.5

ffi = require("ffi")
https = require 'ssl.https'
dlstatus = require('moonloader').download_status
memory = require "memory"
sampev = require "lib.samp.events"
encoding = require("encoding")
encoding.default = ("CP1251")
u8 = encoding.UTF8

FARM = {
	[1] = {
		teleport = {x = 243.23791503906, y = 1130.6599121094},
		barn = {x = 256.5705, y = 1170.1632, z = 11.8634},
		barrel = {x = 265.6364, y = 1169.2485, z = 10.9427},
		corners = {
			{x = 218.24978637695, y = 1118.3126220703, z = 13.920701980591},
			{x = 267.80545043945, y = 1157.3162841797, z = 10.98282623291}
		},
		run = {
			to_farm = {
				{x = 246.89961242676, y = 1161.2281494141},
				{x = 246.96453857422, y = 1139.3137207031}
			},
			from_farm = {
				{x = 246.96453857422, y = 1139.3137207031},
				{x = 246.89961242676, y = 1161.2281494141}
			},
			to_home = {
				{x = 241.62481689453, y = 1161.3739013672},
				{x = 241.7919921875, y = 1171.4761962891}
			},
			from_home = {
				{x = 241.7919921875, y = 1171.4761962891},
				{x = 241.62481689453, y = 1161.3739013672}
			}
		}
	},

	[2] = {
		teleport = {x = 260.34246826172, y = 1078.6431884766},
		barn = {x = 244.4012, y = 1018.5501, z = 25.5234},
		barrel = {x = 271.0201, y = 1022.5037, z = 26.3266},
		corners = {
			{x = 237.72822570801, y = 1029.7906494141, z = 25.491373062134},
			{x = 283.48553466797, y = 1100.7864990234, z = 11.511716842651}
		},
		run = {
			to_farm = {
				{x = 254.83152770996, y = 1027.6285400391},
				{x = 253.50868225098, y = 1069.2593994141}
			},
			from_farm = {
				{x = 253.50868225098, y = 1069.2593994141},
				{x = 254.83152770996, y = 1027.6285400391}
			},
			to_home = {
				{x = 259.0344543457, y = 1024.3365478516},
				{x = 259.07418823242, y = 1017.1511230469}
			},
			from_home = {
				{x = 259.07418823242, y = 1017.1511230469},
				{x = 259.0344543457, y = 1024.3365478516}
			}
		}
	},

	[3] = {
		teleport = {x = -1034.1192626953, y = -2497.671875},
		barn = {x = -1093.0900, y = -2529.8972, z = 62.3942},
		barrel = {x = -1085.5282, y = -2518.8198, z = 62.5373},
		corners = {
			{x = -1075.0402832031, y = -2523.3872070313, z = 65.230201721191},
			{x = -994.62298583984, y = -2473.0451660156, z = 80.555137634277}
		},
		run = {
			to_farm = {
				{x = -1090.1292724609, y = -2512.126953125},
				{x = -1043.7462158203, y = -2506.2260742188}
			},
			from_farm = {
				{x = -1043.7462158203, y = -2506.2260742188},
				{x = -1090.1292724609, y = -2512.126953125}
			},
			to_home = {
				{x = -1092.5837402344, y = -2513.0617675781},
				{x = -1097.0036621094, y = -2506.4482421875}
			},
			from_home = {
				{x = -1097.0036621094, y = -2506.4482421875},
				{x = -1092.5837402344, y = -2513.0617675781}
			}
		}
	},

	[4] = {
		teleport = {x = -1033.2220458984, y = -2540.40625},
		barn = {x = -1034.0563, y = -2573.7393, z = 79.6866},
		barrel = {x = -1014.4372, y = -2568.0100, z = 81.2644},
		corners = {
			{x = -1079.6032714844, y = -2567.4880371094, z = 72.828239440918},
			{x = -994.09826660156, y = -2522.8913574219, z = 85.263885498047}
		},
		run = {
			to_farm = {
				{x = -1035.1861572266, y = -2558.7761230469},
				{x = -1043.4582519531, y = -2539.6735839844}
			},
			from_farm = {
				{x = -1043.4582519531, y = -2539.6735839844},
				{x = -1035.1861572266, y = -2558.7761230469}
			},
			to_home = {
				{x = -1044.2114257813, y = -2573.119140625},
				{x = -1044.2735595703, y = -2577.3103027344}
			},
			from_home = {
				{x = -1044.2735595703, y = -2577.3103027344},
				{x = -1044.2114257813, y = -2573.119140625}
			}
		}
	},

	[5] = {
		teleport = {x = -423.18817138672, y = -1603.5816650391},
		barn = {x = -496.0988, y = -1614.0940, z = 5.7531},
		barrel = {x = -472.4452, y = -1585.5325, z = 7.7431},
		corners = {
			{x = -462.91900634766, y = -1667.6383056641, z = 11.071342468262},
			{x = -384.56832885742, y = -1565.8736572266, z = 21.964479446411}
		},
		run = {
			to_farm = {
				{x = -481.67385864258, y = -1597.9051513672},
				{x = -452.51742553711, y = -1603.4467773438}
			},
			from_farm = {
				{x = -452.51742553711, y = -1603.4467773438},
				{x = -481.67385864258, y = -1597.9051513672},
			},
			to_home = {
				{x = -489.68350219727, y = -1588.9321289063},
				{x = -495.06951904297, y = -1589.0015869141}
			},
			from_home = {
				{x = -495.06951904297, y = -1589.0015869141},
				{x = -489.68350219727, y = -1588.9321289063}
			}
		}
	}
}

BOT_MODE = 0
CURRENT_FARM = 0
BOT_MODE_SET_ID = -1

ANSWER = {"ну дда бляаяяять", "yes", "нет блять не тут", "да нахуй", "блять тута нахуй ебать", "таа ддддаааааа заебали", "угу нахуй", "типо тута ебать", "нет блять, в школе", "нет лол"}

ffi.cdef [[
    typedef unsigned long HANDLE;
    typedef HANDLE HWND;
    typedef const char *LPCTSTR;

    HWND GetActiveWindow(void);

    bool SetWindowTextA(HWND hWnd, LPCTSTR lpString);
]]

-- Script

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(0) end
	LAST_NICK = sampGetPlayerNickname(MyID())
	LAST_PASSWORD = "Error"
	sampAddChatMessage("[Farm Bot]{FFFFFF} Скрипт успешно активирован! | Автор: {8B008B}Miron Diamond", 0x800080)
	sampAddChatMessage("[Farm Bot]{FFFFFF} Команды: {8B008B}/bot{FFFFFF} | {8B008B}/botstop{FFFFFF} | {8B008B}/botoff{FFFFFF}", 0x800080)
	math.randomseed(os.clock())
	AutoUpdate()
	Register_Thread()
	Register_Commands()
	lua_thread.create(function()
		wait(7000)
		sampProcessChatInput("/fconnect 1 75")
	end)
	T_AutoReconnect:run()
	while true do
		memory.setint8(0xB7CEE4, 1)

		if CURRENT_FARM > 0 then
			if BOT_MODE ~= 0 and (sampGetPlayerSpecialAction(MyID()) ~= 0 or BOT_MODE_SET_ID ~= -1) then
				local mx, my, mz = getCharCoordinates(PLAYER_PED)
				if getDistanceBetweenCoords2d(mx, my, FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y) < 7 then
					Alt()
				end
			end
			if BOT_MODE == 3 and COLLECT_WATER then
				local mx, my, mz = getCharCoordinates(PLAYER_PED)
				if getDistanceBetweenCoords2d(mx, my, FARM[CURRENT_FARM].barrel.x, FARM[CURRENT_FARM].barrel.y) < 7 then
					Alt()
				end
			end
		end
		wait(1000)
	end
end

function AutoUpdate()
	lua_thread.create(function()
		local update_url = "https://raw.githubusercontent.com/MironDiamond/Farm-Bot-2-0/main/update.ini"
		local update_text = https.request(update_url)
		local update_version = update_text:match("version=(.*)")
		local script_url = "https://raw.githubusercontent.com/MironDiamond/Farm-Bot-2-0/main/Farm%20Bot.lua"
		local script_path = thisScript().path
		if tonumber(update_version) > script_version then
			sampAddChatMessage("[Farm Bot]{FFFFFF} Обнаружена новая версия! Обновление..", 0x800080)
			downloadUrlToFile(script_url, script_path, function(id, status)
				if status == dlstatus.STATUS_ENDDOWNLOADDATA then
					sampAddChatMessage("[Farm Bot]{FFFFFF} Обновление завершено.", 0x800080)
					thisScript():reload()
				end
			end)
		end
	end)
end

function Register_Commands()
	sampRegisterChatCommand("bot", function(arg)
		ffi.C.SetWindowTextA(ffi.C.GetActiveWindow(), sampGetCurrentServerName())
		if CURRENT_FARM == 0 then
			if tonumber(arg) then
				arg = tonumber(arg)
				if arg <= 5 and arg >= 1 then
					sampAddChatMessage("[Farm Bot]{FFFFFF} Бот активирован! Ферма {8B008B}№"..arg.."{FFFFFF}.", 0x800080)
					CURRENT_FARM = arg
					T_С_Teleport:run()
				else
					sampAddChatMessage("[Farm Bot]{FFFFFF} Используйте: /bot {8B008B}[1-5]{FFFFFF}.", 0x800080)
				end
			else
				T_Teleport:run()
			end
		else
			sampAddChatMessage("[Farm Bot]{FFFFFF} Ошибка! Бот уже активирован.", 0x800080)
		end
	end)

	sampRegisterChatCommand("botstop", function()
		sampAddChatMessage("[Farm Bot]{FFFFFF} Бот остановлен.", 0x800080)
		T_Search:terminate()
		T_Doctor:terminate()
		T_Teleport:terminate()
		BOT_MODE = 0
		CURRENT_FARM = 0
		BOT_MODE_SET_ID = -1
	end)

	sampRegisterChatCommand("botoff", function()
		sampAddChatMessage("[Farm Bot]{FFFFFF} Бот отключён.", 0x800080)
		thisScript():unload()
	end)
end

function Register_Thread()
	T_Search = lua_thread.create_suspended(Search)

	T_AutoReconnect = lua_thread.create_suspended(function()
		while true do wait(0)
			local chatstring = sampGetChatString(99)
			if chatstring == "Server closed the connection." or chatstring == "You are banned from this server." or chatstring:find("Server wrong password") or chatstring:find("Use /quit to exit or press ESC") then
				T_Search:terminate()
				T_Doctor:terminate()
				T_Teleport:terminate()
				BOT_MODE = 0
				CURRENT_FARM = 0
				BOT_MODE_SET_ID = -1
				sampDisconnectWithReason(false)
				wait(100)
				LAST_NICK = getRPNick()
				sampSetLocalPlayerName(LAST_NICK)
				wait(8000)
				sampSetGamestate(1)
			end

			if sampGetPlayerScore(MyID()) >= 2 and sampIsLocalPlayerSpawned() and CURRENT_FARM > 0 then
				T_Search:terminate()
				T_Doctor:terminate()
				T_Teleport:terminate()
				BOT_MODE = 0
				CURRENT_FARM = 0
				BOT_MODE_SET_ID = -1
				sampDisconnectWithReason(1)
				wait(100)
				LAST_NICK = getRPNick()
				sampSetLocalPlayerName(LAST_NICK)
				wait(8000)
				sampSetGamestate(1)
			end
		end
	end)

	T_Reconnect = lua_thread.create_suspended(function()
		sampDisconnectWithReason(false)
		wait(100)
		LAST_NICK = getRPNick()
		sampSetLocalPlayerName(LAST_NICK)
		wait(8000)
		sampSetGamestate(1)
	end)

	T_Doctor = lua_thread.create_suspended(function()
		local wait_check = 0
		local x, y, z = getCharCoordinates(PLAYER_PED)
		local last_x, last_y, last_z = 0, 0, 0
		while true do wait(1500)
			x, y, z = getCharCoordinates(PLAYER_PED)
			if round(x) ~= round(last_x) or round(y) ~= round(last_y) or round(z) ~= round(last_z) then
				wait_check = 0
				last_x, last_y, last_z = getCharCoordinates(PLAYER_PED)
			else
				wait_check = wait_check + 1
			end

			if wait_check >= 60 then
				if CURRENT_FARM > 0 then
					T_Search:terminate()
					BOT_MODE = 0
					wait_check = 0
					sampAddChatMessage("[Farm Bot]{FFFFFF} Сработала защита от простоя! Перезагрузка..", 0x800080)
					wait(500)
					placeWaypoint(FARM[CURRENT_FARM].teleport.x, FARM[CURRENT_FARM].teleport.y, FARM[CURRENT_FARM].teleport.z)
					wait(1000)
					sampProcessChatInput("/cm")
					while getDistanceBetweenCoords2d(x,y,FARM[CURRENT_FARM].teleport.x, FARM[CURRENT_FARM].teleport.y) > 4 do wait(2000)
						x, y, z = getCharCoordinates(PLAYER_PED)
					end
					T_Search:run()
				end
			end
		end
	end)

	T_Answer_Dialog = lua_thread.create_suspended(function()
		wait(1201)
		sampSendDialogResponse(id, 0, -1, -1)
		wait(2405)
		local ans_number = math.random(1, 8)
		sampSendChat(ANSWER[ans_number])
		wait(45000)
		sampProcessChatInput("/bot")
	end)

	T_С_Teleport = lua_thread.create_suspended(function()
		wait(500)
		placeWaypoint(FARM[CURRENT_FARM].teleport.x, FARM[CURRENT_FARM].teleport.y, FARM[CURRENT_FARM].teleport.z)
		wait(1500)
		sampProcessChatInput("/cm")
		while true do wait(2000)
			if CURRENT_FARM > 0 then
				local x, y, z = getCharCoordinates(PLAYER_PED)
				if getDistanceBetweenCoords2d(x,y,FARM[CURRENT_FARM].teleport.x, FARM[CURRENT_FARM].teleport.y) < 5 then
					break
				else
					x, y, z = getCharCoordinates(PLAYER_PED)
				end
			end
		end
		wait(1000)
		T_Search:run()
	end)

	T_Teleport = lua_thread.create_suspended(function()
		sampSendChat("/gps")
		while CURRENT_FARM > 5 or CURRENT_FARM == 0 do wait(0) end
		placeWaypoint(FARM[CURRENT_FARM].teleport.x, FARM[CURRENT_FARM].teleport.y, FARM[CURRENT_FARM].teleport.z)
		wait(1500)
		sampProcessChatInput("/cm")
		while true do wait(2000)
			if CURRENT_FARM > 0 then
				local x, y, z = getCharCoordinates(PLAYER_PED)
				if getDistanceBetweenCoords2d(x,y,FARM[CURRENT_FARM].teleport.x, FARM[CURRENT_FARM].teleport.y) < 5 then
					break
				else
					x, y, z = getCharCoordinates(PLAYER_PED)
				end
			end
		end
		wait(1000)
		T_Search:run()
	end)
end

-- Events

function sampev.onShowDialog(id, style, title, button1, button2, text)
	if text:find("Админ") and not text:find("получили бан аккаунта") then
		sampAddChatMessage("[Farm Bot]{FFFFFF} Внимание! К вам обратился администратор.", 0x800080)
		T_Search:terminate()
		T_Doctor:terminate()
		T_Teleport:terminate()
		BOT_MODE = 0
		CURRENT_FARM = 0
		BOT_MODE_SET_ID = -1
		if text:find("тут") or text:find("здесь") then
			T_Answer_Dialog:run()
		end
	end

	if BOT_MODE_SET_ID ~= -1 then
		if title:find("Амбар") and text:find("Инструменты для работы") then
			sampSendDialogResponse(id, 1, 1, -1)
			return false
		elseif title:find("Амбар | Инструменты") then
			sampSendDialogResponse(id, 1, BOT_MODE_SET_ID - 1, -1)
			BOT_MODE = BOT_MODE_SET_ID
			BOT_MODE_SET_ID = -1
			return false
		end
	end

	if BOT_MODE == 1 then
		if id == 15184 then
			sampSendDialogResponse(15184, 1, 1, -1)
			return false
		end
	end

	if text:find("Начать работу на ферме") then
		sampSendDialogResponse(id, 1, 0, -1)
		FARM_INVITE = true
		return false
	end

	if title:find("Выберите еду") then
		BUY_EAT = false
		sampSendDialogResponse(id, 1, 6, -1)
		return false
	end

	if text:find("Багажник") then
		sampSendDialogResponse(id, 0, -1, -1)
		return false
	end

	if title:find("GPS Навигатор") then
		sampSendDialogResponse(id, 1, 7, -1)
		return false
	elseif title:find("GPS | Фермы") then
		local quest = 0
		local farm = 0
		local w = 0
		for line in text:gmatch("[^\r\n]+") do
			local q = line:match("Ферма №%d\t(%d+)\t")
			if w == 6 then break end
			w = w + 1
			if q then
				if tonumber(q) > quest then
					farm = w
					quest = tonumber(q)
				end
			end
		end
		if farm > 0 then
			farm = farm - 1
			sampAddChatMessage("[Farm Bot]{FFFFFF} Больше всего заданий на Ферме {8B008B}№"..farm.."{FFFFFF}.", 0x800080)
			CURRENT_FARM = farm
		end
		if farm > 0 then
			sampSendDialogResponse(id, 1, (farm - 1), -1)
			return false
		else
			sampSendDialogResponse(id, 1, 1, -1)
			return false
		end
	end

	if title:find("%(1/4%) Пароль") then
		LAST_PASSWORD = getPassword()
		sampSendDialogResponse(id, 1, -1, LAST_PASSWORD)
		return false
	elseif title:find("%[2/4%] Выберите") then
		sampSendDialogResponse(id, 1, 0, -1)
		return false
	elseif title:find("%[3/4%] Выберите") then
		sampSendDialogResponse(id, 1, 0, -1)
		return false
	elseif title:find('Откуда вы о нас узнали') then
		sampSendDialogResponse(id, 1, 0,'')
		return false
	elseif text:find('ник игрока, пригласившего') or text:find('вас кто%-то пригласил на сервер') or title:find('Система рефералов') or text:find('который пригласил') then
			sampSendDialogResponse(id,1,0,"Carl_Johnson")
			return false
	end

	if title:find("Авторизация") then
		T_Reconnect:run()
		return false
	end

	sampSendDialogResponse(id, 0, -1, -1)
	return false
end

function sampev.onServerMessage(color, text)
	if BOT_MODE ~= 0 then
		if text:find("%[Информация%] {ffffff}Вы вернули в амбар инструмент:") then
			Alt()
		elseif text:find("%[Информация%] {ffffff}Вы вернули в амбар саженец:") then
			Alt()
		end
	end

	if (text:find('Тут еще рано собирать урожай') or text:find('у вас уже есть в руках урожай') or text:find('Тут уже работает другой игрок') or text:find("%[Ошибка%] {ffffff}Сейчас нет заданий") or text:find('У вас нет саженца')) then
		BOT_ERROR = true
	end

	if text:find("%[Ошибка%] {ffffff}Сначала отнесите урожай в амбар%.") then
		RUN_AMBAR = true
	end

	if text:find("%[Ошибка%] {ffffff}У вас должно быть полное ведро воды%. Наберите воды с бочки%.") then
		COLLECT_WATER = true
	end

	if text:find("%[Информация%] {ffffff}Вы набрали полное ведро воды%.") or text:find("У вас итак полное ведро воды%.") then
		COLLECT_WATER = false
	end

	if text:find('Вы не можете выкопать урожай без лопаты') or text:find('Вы не можете выкопать ямку без лопаты') or text:find('Для начала возьмите ведро') or text:find('Для прополки нужны грабли') then
		if BOT_MODE == 1 and (text:find('Вы не можете выкопать урожай без лопаты') or text:find('Вы не можете выкопать ямку без лопаты')) then
			BOT_RELOAD_MODE = true
		elseif BOT_MODE == 2 and text:find('Для прополки нужны грабли') then
			BOT_RELOAD_MODE = true
		elseif BOT_MODE == 3 and text:find('Для начала возьмите ведро') then
			BOT_RELOAD_MODE = true
		else
			BOT_ERROR = true
		end
	end
end

function sampev.onSetPlayerSpecialAction(id)
	if id == 25 then
		RUN_AMBAR = true
	end
end

function sampev.onShowTextDraw(id, data)
	if id == 625 then
		lua_thread.create(function()
			wait(2000)
			sampSendClickTextdraw(625)
			wait(2000)
			sampAddChatMessage("[Farm Bot]{FFFFFF} Успешно зарегистрирован новый аккаунт!", 0x800080)
			sampAddChatMessage("[Farm Bot]{FFFFFF} Ник: {8B008B}"..LAST_NICK.."{FFFFFF} | Пароль: {8B008B}"..LAST_PASSWORD.."", 0x800080)
			sampAddChatMessage("[Farm Bot]{FFFFFF} Сервер: {8B008B}"..sampGetCurrentServerName().."", 0x800080)
			wait(500)
			saveAccount()
			wait(5000)
			sampProcessChatInput("/bot")
		end)
	end
end

function sampev.onPlayerStreamIn() return false end

function sampev.onVehicleStreamIn() return false end

-- Function

function Search()
	T_Doctor:run()
	memory.setuint8(7634870, 1, false)
	memory.setuint8(7635034, 1, false)
	memory.fill(7623723, 144, 8, false)
	memory.fill(5499528, 144, 6, false)
	DeleteFarmObject()
	if CURRENT_FARM ~= 0 then
		if getCharModel(PLAYER_PED) ~= 132 and getCharModel(PLAYER_PED) ~= 198 then
			BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
			BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
			BeginToPoint(FARM[CURRENT_FARM].run.to_home[1].x, FARM[CURRENT_FARM].run.to_home[1].y, 4, true, false)
			BeginToPoint(FARM[CURRENT_FARM].run.to_home[2].x, FARM[CURRENT_FARM].run.to_home[2].y, 0.7, false, false)
			wait(2000)
			Alt()
			wait(8000)
			BeginToPoint(731.36163330078, 1799.9177246094, 0.7, false, false)
			wait(2000)
			Alt()
			while not FARM_INVITE do wait(0) end
			FARM_INVITE = false
			BeginToPoint(728.13708496094, 1799.6501464844, 0.7, false, false)
			wait(4000)
			Alt()
			wait(3000)
			for i, v in ipairs(getAllVehicles()) do deleteCar(v) end
			DeleteFarmObject()
			wait(5000)
			BeginToPoint(FARM[CURRENT_FARM].run.from_home[1].x, FARM[CURRENT_FARM].run.from_home[1].y, 4, true, false)
			BeginToPoint(FARM[CURRENT_FARM].run.from_home[2].x, FARM[CURRENT_FARM].run.from_home[2].y, 4, true, false)
			BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
			BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
		end

		while true do wait(1000)
			if BOT_MODE < 3 then
				BOT_MODE = BOT_MODE + 1
			else
				BOT_MODE = 1
			end

			if RUN_AMBAR or sampGetPlayerSpecialAction(MyID()) ~= 0 then
				RUN_AMBAR = false
				BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
				BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
				while sampGetPlayerSpecialAction(MyID()) ~= 0 do wait(0) end
				BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
			end

			if BOT_MODE == 1 then
				for i = 0, 2048 do
					if sampIs3dTextDefined(i) then
						local check = '[REMOVE COSTUMES]'
						local text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId = sampGet3dTextInfoById(i)
						if (text:find("можно собрать урожай") or text:find("свободное")) and isCoordInArea2d(posX, posY, FARM[CURRENT_FARM].corners[1].x, FARM[CURRENT_FARM].corners[1].y, FARM[CURRENT_FARM].corners[2].x, FARM[CURRENT_FARM].corners[2].y) then
							if RUN_AMBAR or sampGetPlayerSpecialAction(MyID()) ~= 0 then
								RUN_AMBAR = false
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
								while sampGetPlayerSpecialAction(MyID()) ~= 0 do wait(0) end
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
							end
							if getCharHealth(PLAYER_PED) < 50 then
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_home[1].x, FARM[CURRENT_FARM].run.to_home[1].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_home[2].x, FARM[CURRENT_FARM].run.to_home[2].y, 0.7, false, false)
								wait(2000)
								Alt()
								wait(6000)
								BeginToPoint(729.77056884766, 1799.6590576172, 0.7, false, false)
								BeginToPoint(728.35949707031, 1796.3908691406, 0.7, false, false)
								BeginToPoint(729.77056884766, 1799.6590576172, 0.7, false, false)
								BeginToPoint(730.60260009766, 1803.9473876953, 0.7, false, false)
								BeginToPoint(728.91998291016, 1803.9387207031, 0.7, false, false)
								wait(1000)
								Alt()
								BUY_EAT = true
								while BUY_EAT and sampIsDialogActive() do wait(0) end
								BUY_EAT = false
								BeginToPoint(728.91998291016, 1803.9387207031, 0.7, false, false)
								BeginToPoint(730.60260009766, 1803.9473876953, 0.7, false, false)
								BeginToPoint(728.13708496094, 1799.6501464844, 0.7, false, false)
								wait(4000)
								Alt()
								wait(3000)
								for i, v in ipairs(getAllVehicles()) do deleteCar(v) end
								DeleteFarmObject()
								wait(5000)
								BeginToPoint(FARM[CURRENT_FARM].run.from_home[1].x, FARM[CURRENT_FARM].run.from_home[1].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.from_home[2].x, FARM[CURRENT_FARM].run.from_home[2].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
							end
							BeginToPoint(posX, posY, 2.6, true, false)
							while sampGetPlayerAnimationId(MyID()) ~= 1548 and BOT_MODE_SET_ID == -1 do
								if BOT_ERROR then
								 BOT_ERROR = false
								 break
								elseif RUN_AMBAR or sampGetPlayerSpecialAction(MyID()) ~= 0 then
									RUN_AMBAR = false
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
									while sampGetPlayerSpecialAction(MyID()) ~= 0 do wait(0) end
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
								 	break
								elseif BOT_RELOAD_MODE then
								 BOT_RELOAD_MODE = false
								 BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
								 BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
								 BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
								 BOT_MODE_SET_ID = 1
								 while BOT_MODE_SET_ID ~= -1 do wait(0) end
								 BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
								 BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
								 break
								else
								 Alt()
							 	end
								wait(1000)
						  end
							if sampGetPlayerAnimationId(MyID()) == 1548 then
								while sampGetPlayerAnimationId(MyID()) == 1548 do wait(0) end
								wait(1000)
								if sampGetPlayerAnimationId(MyID()) == 368 then
									while sampGetPlayerAnimationId(MyID()) == 368 do wait(0) end
									if RUN_AMBAR or sampGetPlayerSpecialAction(MyID()) ~= 0 then
										RUN_AMBAR = false
										BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
										BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
										BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
										while sampGetPlayerSpecialAction(MyID()) ~= 0 do wait(0) end
										BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
										BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
									end
								end
							end
						end
					end
				end
			elseif BOT_MODE == 2 then
				for i = 0, 2048 do
					if sampIs3dTextDefined(i) then
						local check = '[REMOVE COSTUMES]'
						local text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId = sampGet3dTextInfoById(i)
						if text:find("для начала роста необходимо прополоть") and isCoordInArea2d(posX, posY, FARM[CURRENT_FARM].corners[1].x, FARM[CURRENT_FARM].corners[1].y, FARM[CURRENT_FARM].corners[2].x, FARM[CURRENT_FARM].corners[2].y) then
							if RUN_AMBAR or sampGetPlayerSpecialAction(MyID()) ~= 0 then
								RUN_AMBAR = false
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
								while sampGetPlayerSpecialAction(MyID()) ~= 0 do wait(0) end
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
							end
							if getCharHealth(PLAYER_PED) < 50 then
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_home[1].x, FARM[CURRENT_FARM].run.to_home[1].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_home[2].x, FARM[CURRENT_FARM].run.to_home[2].y, 0.7, false, false)
								wait(2000)
								Alt()
								wait(6000)
								BeginToPoint(729.77056884766, 1799.6590576172, 0.7, false, false)
								BeginToPoint(728.35949707031, 1796.3908691406, 0.7, false, false)
								BeginToPoint(729.77056884766, 1799.6590576172, 0.7, false, false)
								BeginToPoint(730.60260009766, 1803.9473876953, 0.7, false, false)
								BeginToPoint(728.91998291016, 1803.9387207031, 0.7, false, false)
								wait(1000)
								Alt()
								BUY_EAT = true
								while BUY_EAT and sampIsDialogActive() do wait(0) end
								BUY_EAT = false
								BeginToPoint(728.91998291016, 1803.9387207031, 0.7, false, false)
								BeginToPoint(730.60260009766, 1803.9473876953, 0.7, false, false)
								BeginToPoint(728.13708496094, 1799.6501464844, 0.7, false, false)
								wait(4000)
								Alt()
								wait(3000)
								for i, v in ipairs(getAllVehicles()) do deleteCar(v) end
								DeleteFarmObject()
								wait(5000)
								BeginToPoint(FARM[CURRENT_FARM].run.from_home[1].x, FARM[CURRENT_FARM].run.from_home[1].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.from_home[2].x, FARM[CURRENT_FARM].run.from_home[2].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
							end
							BeginToPoint(posX, posY, 2.6, true, false)
							while sampGetPlayerAnimationId(MyID()) ~= 1548 and BOT_MODE_SET_ID == -1 do
								if BOT_ERROR then
									BOT_ERROR = false
									break
							 	elseif BOT_RELOAD_MODE then
									BOT_RELOAD_MODE = false
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
									BOT_MODE_SET_ID = 2
									while BOT_MODE_SET_ID ~= -1 do wait(0) end
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
									break
								elseif RUN_AMBAR or sampGetPlayerSpecialAction(MyID()) ~= 0 then
									RUN_AMBAR = false
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
									while sampGetPlayerSpecialAction(MyID()) ~= 0 do wait(0) end
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
								 	break
								else
								 Alt()
								end
								wait(1000)
							end
							if sampGetPlayerAnimationId(MyID()) == 1548 then
								while sampGetPlayerAnimationId(MyID()) == 1548 do wait(0) end
							end
						end
					end
				end
			elseif BOT_MODE == 3 then
				for i=0, 2048 do
					if sampIs3dTextDefined(i) then
					 local check = '[REMOVE COSTUMES]'
					 local text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId = sampGet3dTextInfoById(i)
						if text:find("для начала роста необходимо полить") and isCoordInArea2d(posX, posY, FARM[CURRENT_FARM].corners[1].x, FARM[CURRENT_FARM].corners[1].y, FARM[CURRENT_FARM].corners[2].x, FARM[CURRENT_FARM].corners[2].y) then
							if RUN_AMBAR or sampGetPlayerSpecialAction(MyID()) ~= 0 then
								RUN_AMBAR = false
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
								while sampGetPlayerSpecialAction(MyID()) ~= 0 do wait(0) end
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
							end
							if getCharHealth(PLAYER_PED) < 50 then
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_home[1].x, FARM[CURRENT_FARM].run.to_home[1].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_home[2].x, FARM[CURRENT_FARM].run.to_home[2].y, 0.7, false, false)
								wait(2000)
								Alt()
								wait(6000)
								BeginToPoint(729.77056884766, 1799.6590576172, 0.7, false, false)
								BeginToPoint(728.35949707031, 1796.3908691406, 0.7, false, false)
								BeginToPoint(729.77056884766, 1799.6590576172, 0.7, false, false)
								BeginToPoint(730.60260009766, 1803.9473876953, 0.7, false, false)
								BeginToPoint(728.91998291016, 1803.9387207031, 0.7, false, false)
								wait(1000)
								Alt()
								BUY_EAT = true
								while BUY_EAT and sampIsDialogActive() do wait(0) end
								BUY_EAT = false
								BeginToPoint(728.91998291016, 1803.9387207031, 0.7, false, false)
								BeginToPoint(730.60260009766, 1803.9473876953, 0.7, false, false)
								BeginToPoint(728.13708496094, 1799.6501464844, 0.7, false, false)
								wait(4000)
								Alt()
								wait(3000)
								for i, v in ipairs(getAllVehicles()) do deleteCar(v) end
								DeleteFarmObject()
								wait(5000)
								BeginToPoint(FARM[CURRENT_FARM].run.from_home[1].x, FARM[CURRENT_FARM].run.from_home[1].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.from_home[2].x, FARM[CURRENT_FARM].run.from_home[2].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
							end
							BeginToPoint(posX, posY, 2.6, true, false)
							while sampGetPlayerAnimationId(MyID()) ~= 532 and BOT_MODE_SET_ID == -1 do
								if BOT_ERROR then
									BOT_ERROR = false
									break
							 	elseif BOT_RELOAD_MODE then
									BOT_RELOAD_MODE = false
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
									BOT_MODE_SET_ID = 3
									while BOT_MODE_SET_ID ~= -1 do wait(0) end
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
									break
								elseif COLLECT_WATER then
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].barrel.x, FARM[CURRENT_FARM].barrel.y, 0.7, false, false)
									while COLLECT_WATER do wait(0) end
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
									break
								elseif RUN_AMBAR or sampGetPlayerSpecialAction(MyID()) ~= 0 then
									RUN_AMBAR = false
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
									while sampGetPlayerSpecialAction(MyID()) ~= 0 do wait(0) end
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
								 	break
								else
								 Alt()
								end
								wait(1000)
							end
							if sampGetPlayerAnimationId(MyID()) == 532 then
								while sampGetPlayerAnimationId(MyID()) == 532 do wait(0) end
							end
						end
					end
				end
			end

			if RUN_AMBAR or sampGetPlayerSpecialAction(MyID()) ~= 0 then
				RUN_AMBAR = false
				BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
				BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
				while sampGetPlayerSpecialAction(MyID()) ~= 0 do wait(0) end
				BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
			end

			if getCharHealth(PLAYER_PED) < 50 then
				BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 2.1, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 2.1, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.to_home[1].x, FARM[CURRENT_FARM].run.to_home[1].y, 4, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.to_home[2].x, FARM[CURRENT_FARM].run.to_home[2].y, 0.7, false, false)
				wait(2000)
				Alt()
				wait(6000)
				BeginToPoint(729.77056884766, 1799.6590576172, 0.7, false, false)
				BeginToPoint(728.35949707031, 1796.3908691406, 0.7, false, false)
				BeginToPoint(729.77056884766, 1799.6590576172, 0.7, false, false)
				BeginToPoint(730.60260009766, 1803.9473876953, 0.7, false, false)
				BeginToPoint(728.91998291016, 1803.9387207031, 0.7, false, false)
				wait(1000)
				Alt()
				BUY_EAT = true
				while BUY_EAT and sampIsDialogActive() do wait(0) end
				BUY_EAT = false
				BeginToPoint(728.91998291016, 1803.9387207031, 0.7, false, false)
				BeginToPoint(730.60260009766, 1803.9473876953, 0.7, false, false)
				BeginToPoint(728.13708496094, 1799.6501464844, 0.7, false, false)
				wait(4000)
				Alt()
				wait(3000)
				for i, v in ipairs(getAllVehicles()) do deleteCar(v) end
				DeleteFarmObject()
				wait(5000)
				BeginToPoint(FARM[CURRENT_FARM].run.from_home[1].x, FARM[CURRENT_FARM].run.from_home[1].y, 4, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.from_home[2].x, FARM[CURRENT_FARM].run.from_home[2].y, 4, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 2.1, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 2.1, true, false)
			end
		end
	end
end

function MyID()
	local _, id = sampGetPlayerIdByCharHandle(playerPed)
	return id
end

function Alt()
	setGameKeyState(21, 255)
end

function saveAccount()
	local all = ""
	local filename = (getGameDirectory().."\\moonloader\\Farm Bot\\"..sampGetCurrentServerName():gsub("|", "-")..".txt")

	if doesFileExist(filename) then
		local file_r = io.open(filename, "r")
		all = file_r:read("*a")
		file_r:close()
	end

	local file = io.open(filename, "w")
	all = all..LAST_NICK..":"..LAST_PASSWORD.."\n"
	file:write(all)
	file:close()
end

function DeleteFarmObject()
	local mapp = {
			969,
			970,
			971,
			972,
			974,
			975,
			976,
			980,
			982,
			983,
			984,
			985,
			986,
			987,
			988,
			989,
			990,
			991,
			992,
			993,
			994,
			995,
			996,
			997,
			998,
			1407,
			1408,
			1410,
			1411,
			1412,
			1413,
			1414,
			1418,
			1419,
			1446,
			1447,
			1456,
			1460,
			1468,
			1552,
			1553,
			1652,
			1653,
			2909,
			2930,
			2933,
			2990,
			3036,
			3049,
			3050,
			3125,
			3275,
			3276,
			3281,
			3282,
			3451,
			3475,
			3550,
			3936,
			3937,
			3945,
			4099,
			4100,
			4189,
			4190,
			4195,
			4196,
			4201,
			4202,
			5001,
			5005,
			5007,
			5030,
			5062,
			5068,
			5070,
			5071,
			5072,
			5073,
			5074,
			5075,
			5076,
			5077,
			5190,
			5268,
			5306,
			5358,
			5363,
			5364,
			5415,
			5469,
			5660,
			5676,
			5677,
			5893,
			5993,
			6046,
			6049,
			6110,
			6253,
			6287,
			6489,
			6960,
			6961,
			6967,
			6968,
			6969,
			6970,
			7014,
			7016,
			7017,
			7018,
			7022,
			7026,
			7028,
			7029,
			7030,
			7031,
			7034,
			7038,
			7039,
			7095,
			7132,
			7191,
			7192,
			7193,
			7194,
			7195,
			7196,
			7197,
			7198,
			7202,
			7204,
			7205,
			7209,
			7210,
			7212,
			7213,
			7223,
			7224,
			7227,
			7243,
			7277,
			7292,
			7295,
			7296,
			7297,
			7298,
			7299,
			7319,
			7349,
			7350,
			7351,
			7352,
			7361,
			7367,
			7368,
			7369,
			7370,
			7371,
			7372,
			7373,
			7374,
			7375,
			7376,
			7377,
			7378,
			7379,
			7380,
			7381,
			7418,
			7423,
			7425,
			7514,
			7517,
			7524,
			7532,
			7538,
			7539,
			7540,
			7560,
			7593,
			7595,
			7611,
			7612,
			7613,
			7614,
			7615,
			7619,
			7623,
			7624,
			7657,
			7662,
			7663,
			7664,
			7665,
			7680,
			7688,
			7831,
			7837,
			7838,
			7839,
			7840,
			7841,
			7842,
			7895,
			7896,
			7897,
			7898,
			7899,
			7919,
			7939,
			7952,
			7953,
			7954,
			7956,
			7959,
			7960,
			8147,
			8148,
			8149,
			8150,
			8151,
			8152,
			8153,
			8154,
			8155,
			8165,
			8167,
			8173,
			8174,
			8175,
			8176,
			8177,
			8178,
			8179,
			8180,
			8181,
			8182,
			8183,
			8184,
			8185,
			8187,
			8190,
			8191,
			8192,
			8194,
			8195,
			8206,
			8207,
			8208,
			8209,
			8210,
			8262,
			8263,
			8266,
			8267,
			8268,
			8269,
			8270,
			8271,
			8272,
			8273,
			8274,
			8275,
			8276,
			8277,
			8278,
			8279,
			8311,
			8312,
			8313,
			8314,
			8315,
			8316,
			8317,
			8318,
			8320,
			8342,
			8366,
			8369,
			8416,
			8426,
			8429,
			8430,
			8549,
			8559,
			8592,
			8636,
			8645,
			8646,
			8647,
			8648,
			8649,
			8650,
			8651,
			8652,
			8653,
			8656,
			8657,
			8658,
			8659,
			8662,
			8673,
			8674,
			8680,
			8681,
			8682,
			8683,
			8684,
			8685,
			8686,
			8825,
			8826,
			8827,
			8828,
			8869,
			8984,
			8985,
			8986,
			8987,
			8988,
			8992,
			8993,
			8994,
			8995,
			8996,
			8997,
			8998,
			9029,
			9030,
			9031,
			9032,
			9033,
			9043,
			9080,
			9081,
			9092,
			9108,
			9109,
			9110,
			9111,
			9112,
			9134,
			9317,
			9318,
			9331,
			9333,
			9334,
			9335,
			9336,
			9339,
			9340,
			9343,
			9344,
			9347,
			9348,
			9349,
			9350,
			9430,
			9431,
			9434,
			9435,
			10252,
			10396,
			10402,
			10437,
			10442,
			10611,
			10662,
			10682,
			10683,
			10716,
			10762,
			10806,
			10807,
			10808,
			10809,
			10835,
			10836,
			10873,
			10874,
			10875,
			10885,
			10886,
			10887,
			11091,
			11101,
			11243,
			11374,
			11383,
			11438,
			11452,
			11473,
			11474,
			11481,
			11482,
			11499,
			11567,
			11568,
			12848,
			12933,
			13016,
			13024,
			13438,
			13445,
			13450,
			13598,
			13622,
			13623,
			13653,
			13659,
			13661,
			13663,
			13665,
			13699,
			13744,
			13878,
			14459,
			14464,
			14501,
			14513,
			14551,
			14843,
			14883,
			16094,
			16136,
			16144,
			16293,
			16294,
			16295,
			16296,
			16297,
			16298,
			16299,
			16300,
			16313,
			16315,
			16320,
			16321,
			16324,
			16369,
			16370,
			16391,
			16392,
			16393,
			16394,
			16627,
			16628,
			16629,
			16630,
			16631,
			16632,
			16633,
			16634,
			16635,
			16636,
			16664,
			16668,
			16669,
			16670,
			16671,
			17018,
			17510,
			17514,
			17516,
			17532,
			17583,
			17871,
			17898,
			17911,
			17912,
			17913,
			17968,
			18202,
			18216,
			18217,
			18218,
			18219,
			18220,
			18221,
			18222,
			18223,
			18224,
			18255,
			18276,
			18277,
			18278,
			18279,
			18280,
			18281,
			18432,
			18433,
			18434,
			18440,
			18441,
			18442,
			18443,
			18444,
			18445,
			18446,
			18551,
			18760,
			19302,
			19303,
			19304,
			19312,
			19313,
			19641,
			19865,
			19866,
			19868,
			19869,
			19870,
			19912,
			19913
	}

	for id, data in ipairs(getAllObjects()) do
		for k, v in pairs(mapp) do
			if v == getObjectModel(data) then
				deleteObject(data)
				break
			end
		end
	end
end

-- Technical Function

function BeginToPoint(tox, toy, radius, is_sprint, is_jumping)
	local x, y, z = getCharCoordinates(PLAYER_PED)
	local angle = getHeadingFromVector2d(tox - x, toy - y)
	local xAngle = math.random(-50, 50)/100
	setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
	while getDistanceBetweenCoords2d(x, y, tox, toy) > radius do wait(1)
		setGameKeyState(1, -255)
		if is_sprint then
			setGameKeyState(16, 1)
		end
		if is_jumping then
			local rand = math.random(0, 12)
			if rand == 5 then
				setGameKeyState(16, 0)
				setGameKeyState(14, 255)
			end
		end
		x, y, z = getCharCoordinates(PLAYER_PED)
		angle = getHeadingFromVector2d(tox - x, toy - y)
		setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
	end
end

function isCoordInArea2d(xW, yW, x1, y1, x2, y2)
  if (xW < x1) and (yW < y1) and (xW > x2) and (yW > y2) then
    return true
  elseif (xW > x1) and (yW > y1) and (xW < x2) and (yW < y2) then
    return true
  else
    return false
  end
end

function getPassword()
	local password = ""
	local p = {'A', 'E', 'I', 'O', 'U', 'B', 'C', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'R', 'S', 'T', 'V', 'W', 'X', 'Z'}

	for i = 0, 8 do
		if math.random(1,2) == 2 then
			password = password..string.upper(p[math.random(1, 24)])
		else
			password = password..string.lower(p[math.random(1, 24)])..math.random(1,9)
		end
	end

	return password
end

function getRPNick()
    return getWord()..'_'..getWord()
end

function getRandomWord(length)
    local word = ''
    for i = 1, length do
        word = word .. string.char(math.random(97, 122))
    end
    return word
end

function getWord()
    local word = ''
    local unspoken = {'A', 'E', 'I', 'O', 'U'}
    local spoken = {'B', 'C', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'R', 'S', 'T', 'V', 'W', 'X', 'Z'}
    local wordLen = math.random(3, 10)
    for i = 0, wordLen do
        if i % 2 == 0 then
            word = word..spoken[math.random(1, 19)]
        else
            word = word..unspoken[math.random(1, 5)]
        end
    end
    word = word:lower()
    return word:gsub("^%l", string.upper)
end

function round(number)
  if (number - (number % 0.1)) - (number - (number % 1)) < 0.5 then
    number = number - (number % 1)
  else
    number = (number - (number % 1)) + 1
  end
 return number
end

-- by Miron Diamond
