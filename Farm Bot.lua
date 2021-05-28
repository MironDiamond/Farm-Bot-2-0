require ("moonloader")

script_version = 1.5

ffi = require("ffi")
https = require 'ssl.https'
effil = require("effil")
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

VK_USER = "238033416"
VK_GROUP = "204756711"
VK_TOKEN = "547c5b821b17f085a449042dff96427d557e84e049e81787f5d45dbef28b353c7ce7cdc341bd3bc8bf1e8"

BOT_MODE = 0
CURRENT_FARM = 0
BOT_MODE_SET_ID = -1

CHATLOG = false

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
	sampProcessChatInput("/fconnect 1 75")
	sampAddChatMessage("[Farm Bot]{FFFFFF} Скрипт успешно активирован! | Автор: {8B008B}Miron Diamond", 0x800080)
	sampAddChatMessage("[Farm Bot]{FFFFFF} Команды: {8B008B}/bot{FFFFFF} | {8B008B}/botstop{FFFFFF} | {8B008B}/botoff{FFFFFF}", 0x800080)
	math.randomseed(os.clock())
	AutoUpdate()
	Register_Thread()
	Register_Commands()
	VK_CONNECT()
	while not key do wait(10) end
	loop_async_http_request(server .. '?act=a_check&key=' .. key .. '&ts=' .. ts .. '&wait=25', '')
	while true do
		local chatstring = sampGetChatString(99)
  	if chatstring == "Server closed the connection." or chatstring == "You are banned from this server." then
			sampDisconnectWithReason(false)
			wait(100)
			LAST_NICK = getRPNick()
			sampSetLocalPlayerName(LAST_NICK)
      wait(20000)
      sampSetGamestate(1)
  	end

		if sampGetPlayerScore(MyID()) >= 2 then
			sampDisconnectWithReason(false)
			wait(100)
			LAST_NICK = getRPNick()
			sampSetLocalPlayerName(LAST_NICK)
			wait(20000)
			sampSetGamestate(1)
		end

		if CURRENT_FARM > 0 then
			if BOT_MODE ~= 0 and (sampGetPlayerSpecialAction(MyID()) ~= 0 or BOT_MODE_SET_ID ~= -1) then
				local mx, my, mz = getCharCoordinates(PLAYER_PED)
				if getDistanceBetweenCoords2d(mx, my, FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y) < 7 then
					Alt()
				end
			end
			if not BOT_ERROR and BOT_MODE == 3 and COLLECT_WATER then
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
		if tonumber(arg) then
			arg = tonumber(arg)
			if arg <= 5 and arg >= 1 then
				sampAddChatMessage("[Farm Bot]{FFFFFF} Бот активирован! Ферма {8B008B}№"..arg.."{FFFFFF}.", 0x800080)
				CURRENT_FARM = arg
				T_Search:run()
			else
				sampAddChatMessage("[Farm Bot]{FFFFFF} Используйте: /bot {8B008B}[1-5]{FFFFFF}.", 0x800080)
			end
		else
			lua_thread.create(function()
				CURRENT_FARM = 0
				sampSendChat("/gps")
				while CURRENT_FARM == 0 do wait(0) end
				placeWaypoint(FARM[CURRENT_FARM].teleport.x, FARM[CURRENT_FARM].teleport.y, FARM[CURRENT_FARM].teleport.z)
				wait(1500)
				sampProcessChatInput("/cm")
				local x, y, z = getCharCoordinates(PLAYER_PED)
				while getDistanceBetweenCoords2d(x,y,FARM[CURRENT_FARM].teleport.x, FARM[CURRENT_FARM].teleport.y) > 4 do wait(2000)
					x, y, z = getCharCoordinates(PLAYER_PED)
				end
				T_Search:run()
			end)
		end
	end)

	sampRegisterChatCommand("botstop", function()
		sampAddChatMessage("[Farm Bot]{FFFFFF} Бот остановлен.", 0x800080)
		T_Search:terminate()
		T_Doctor:terminate()
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

	T_Reconnect = lua_thread.create_suspended(function()
		sampDisconnectWithReason(false)
		wait(100)
		LAST_NICK = getRPNick()
		sampSetLocalPlayerName(LAST_NICK)
		wait(20000)
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
					wait_check = 0
					sampAddChatMessage("[Farm Bot]{FFFFFF} Сработала защита от простоя! Перезагрузка..", 0x800080)
					wait(500)
					VK_SEND("Сработала защита от простоя! Перезагрузка..")
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

	T_Answer_Msg = lua_thread.create_suspended(function()
		local ans_number = math.random(1, 9)
		wait(2405)
		sampSendChat(ANSWER[ans_number])
	end)

	T_Answer_Dialog = lua_thread.create_suspended(function()
		wait(1201)
		sampSendDialogResponse(id, 0, -1, -1)
		wait(2405)
		local ans_number = math.random(1, 8)
		sampSendChat(ANSWER[ans_number])
	end)
end

-- VK

function VK_SEND(msg)
	msg = msg:gsub('{......}', '')
	msg = u8(msg)
	msg = url_encode(msg)
	local keyboard = VK_KEYBOARD()
	keyboard = u8(keyboard)
	keyboard = url_encode(keyboard)
	msg = msg .. '&keyboard=' .. keyboard
	async_http_request('https://api.vk.com/method/messages.send', 'user_id=' .. VK_USER .. '&message=' .. msg .. '&access_token=' .. VK_TOKEN .. '&v=5.80',	function (result)
		local t = decodeJson(result)
		if not t then
			return
		end
	end)
end

function VK_READ(result)
	if result then
		local t = decodeJson(result)
		if t.ts then
			ts = t.ts
		end
		for k, v in ipairs(t.updates) do
			if v.type == 'message_new' and v.object.text then
				local text = v.object.text .. ' '
				local user_id = tostring(v.object.from_id)
				text = u8:decode(text)
				if user_id == VK_USER then
					if text:find("/chatlog") then
						CHATLOG = not CHATLOG
						if CHATLOG then
							VK_SEND("Команда распознана! Мониторинг действий активирован.")
						else
							VK_SEND("Команда распознана! Мониторинг действий деактивирован.")
						end
					elseif text:find("/stats") then
						VK_SEND("Команда распознана! Высылаю статистику персонажа:\n[1] Сервер: "..sampGetCurrentServerName().."\n[2] Ник: "..sampGetPlayerNickname(MyID()).."("..MyID()..")\n[3] Здоровье: "..sampGetPlayerHealth(MyID()).."%\n[4] Деньги: "..getPlayerMoney(PLAYER_CHAR).."$")
					elseif text:find("Включить") then
						local x, y = getCharCoordinates(PLAYER_PED)
						for id, data in ipairs(FARM) do
							if isCoordInArea2d(x, y, FARM[id].corners[1].x, FARM[id].corners[1].y, FARM[id].corners[2].x, FARM[id].corners[2].y) then
								VK_SEND("Команда распознана! Бот начал работать на ферме №"..id..".")
								CURRENT_FARM = id
								T_Search:run()
								break
							elseif id == 5 then
								VK_SEND("Ошибка! Вы находитесь не на ферме.")
							end
						end
					elseif text:find("Остановить") then
						VK_SEND("Команда распознана! Бот остановлен.")
						T_Search:terminate()
						T_Doctor:terminate()
					elseif text:find("Выключить") then
						VK_SEND("Команда распознана! Бот отключен.")
						thisScript():unload()
					elseif text:find("/send (.+)") then
						local text = text:match("/send (.+)")
						if text then
							sampProcessChatInput(text)
							VK_SEND("Сообщение отправлено на сервер!")
						else
							VK_SEND("Введите сообщение которе нужно отправить на сервер.")
						end
					else
						VK_SEND("Команды бота:\n1. /stats\n2. /chatlog\n3. /send")
					end
				end
			end
		end
	end
end

function VK_CONNECT()
	async_http_request('https://api.vk.com/method/groups.getLongPollServer?group_id=' .. VK_GROUP .. '&access_token=' .. VK_TOKEN .. '&v=5.80', '', function (result)
		if result then
			if not result:sub(1,1) == '{' then
				return
			end
			local t = decodeJson(result)
			if t.error then
				return
			end
			server = t.response.server
			ts = t.response.ts
			key = t.response.key
		end
	end)
end

function VK_KEYBOARD()
	local keyboard = {}
	keyboard.one_time = false
	keyboard.buttons = {}
	keyboard.buttons[1] = {}
	local row = keyboard.buttons[1]
	row[1] = {}
	row[1].action = {}
	row[1].color = 'positive'
	row[1].action.type = 'text'
	row[1].action.payload = '{"button": "status"}'
	row[1].action.label = 'Включить'
	row[2] = {}
	row[2].action = {}
	row[2].color = 'primary'
	row[2].action.type = 'text'
	row[2].action.payload = '{"button": "status"}'
	row[2].action.label = 'Остановить'
	row[3] = {}
	row[3].action = {}
	row[3].color = 'negative'
	row[3].action.type = 'text'
	row[3].action.payload = '{"button": "status"}'
	row[3].action.label = 'Выключить'
	return encodeJson(keyboard)
end

-- Events

function sampev.onShowDialog(id, style, title, button1, button2, text)
	if text:find("Админ") then
		VK_SEND("ВНИМАНИЕ! К вам обратился администратор, бот остановлен.\nСервер: "..sampGetCurrentServerName())
		T_Search:terminate()
		T_Doctor:terminate()
		T_Answer_Dialog:run()
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
		BUY_EAT = true
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
	if CHATLOG then
		if text:find("%[Информация%] {ffffff}Вы выполнили задание") or text:find("Администратор") or text:find("%[Информация%] {ffffff}") then
			VK_SEND("[Чат]: "..text)
		end
	end

	if text:find("%[Ошибка%] {ffffff}Сначала отнесите урожай в амбар%.") then
		RUN_AMBAR = true
	end

	if text:find("телепортировал вас") then
		VK_SEND("ВНИМАНИЕ! К вам обратился администратор, бот остановлен.\nСервер: "..sampGetCurrentServerName())
		T_Search:terminate()
		T_Doctor:terminate()
		lua_thread.create(function()
			wait(2000)
			sampSendChat("эээээээээээээээ")
		end)
	end

	if (text:find("тут") or text:find("здесь")) and text:find("Администратор") and text:find("%?") then
		VK_SEND("ВНИМАНИЕ! К вам обратился администратор, бот остановлен.\nСервер: "..sampGetCurrentServerName())
		T_Search:terminate()
		T_Doctor:terminate()
		T_Answer_Msg:run()
	end

	if BOT_MODE ~= 0 then
		if text:find("%[Информация%] {ffffff}Вы вернули в амбар инструмент:") then
			Alt()
		elseif text:find("%[Информация%] {ffffff}Вы вернули в амбар саженец:") then
			Alt()
		end
	end

	if (text:find('Тут еще рано собирать урожай') or text:find('у вас уже есть в руках урожай') or text:find('Тут уже работает другой игрок') or text:find("%[Ошибка%] {ffffff}Сейчас нет заданий")) then
		BOT_ERROR = true
	end

	if text:find("%[Ошибка%] {ffffff}У вас должно быть полное ведро воды%. Наберите воды с бочки%.") then
		COLLECT_WATER = true
	end

	if text:find("%[Информация%] {ffffff}Вы набрали полное ведро воды%.") then
		COLLECT_WATER = false
	end

	if text:find('Вы не можете выкопать урожай без лопаты') or text:find('Вы не можете выкопать ямку без лопаты') or text:find('У вас нет саженца') or text:find('Для начала возьмите ведро') or text:find('Для прополки нужны грабли') then
		BOT_RELOAD_MODE = true
	end
end

function sampev.onSetPlayerSpecialAction(id)
	if id == 25 then
		RUN_AMBAR = true
	end
end

function sampev.onDisplayGameText(style, time, text)
	if text:find("hungry") then
		HUNGRY_MODE = true
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
			wait(100)
			VK_SEND("Успешно зарегистрирован новый аккаунт!\nНик: "..LAST_NICK.." | Пароль: "..LAST_PASSWORD.."\nСервер: "..sampGetCurrentServerName().."")
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
	if CURRENT_FARM ~= 0 then
		if getCharModel(PLAYER_PED) ~= 132 and getCharModel(PLAYER_PED) ~= 198 then
			BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 4, true, false)
			BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 4, true, false)
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
			for i, v in ipairs(getAllVehicles()) do deleteCar(v) end
			wait(8000)
			BeginToPoint(FARM[CURRENT_FARM].run.from_home[1].x, FARM[CURRENT_FARM].run.from_home[1].y, 4, true, false)
			BeginToPoint(FARM[CURRENT_FARM].run.from_home[2].x, FARM[CURRENT_FARM].run.from_home[2].y, 4, true, false)
			BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 4, true, false)
			BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 4, true, false)
		end

		while true do wait(1000)
			if HUNGRY_MODE then
				BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 4, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 4, true, false)
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
				HUNGRY_MODE = false
				BeginToPoint(728.91998291016, 1803.9387207031, 0.7, false, false)
				BeginToPoint(730.60260009766, 1803.9473876953, 0.7, false, false)
				BeginToPoint(728.13708496094, 1799.6501464844, 0.7, false, false)
				wait(4000)
				Alt()
				for i, v in ipairs(getAllVehicles()) do deleteCar(v) end
				wait(8000)
				BeginToPoint(FARM[CURRENT_FARM].run.from_home[1].x, FARM[CURRENT_FARM].run.from_home[1].y, 4, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.from_home[2].x, FARM[CURRENT_FARM].run.from_home[2].y, 4, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 4, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 4, true, false)
			end

			if BOT_MODE < 3 then
				BOT_MODE = BOT_MODE + 1
			else
				BOT_MODE = 1
			end

			if RUN_AMBAR then
				RUN_AMBAR = false
				BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 4, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 4, true, false)
				BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
				while sampGetPlayerSpecialAction(MyID()) ~= 0 do wait(0) end
				BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 4, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 4, true, false)
			end
			if BOT_MODE == 1 then
				for i = 0, 2048 do
					if sampIs3dTextDefined(i) then
						local check = '[REMOVE COSTUMES]'
						local text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId = sampGet3dTextInfoById(i)
						if (text:find("можно собрать урожай") or text:find("свободное")) and isCoordInArea2d(posX, posY, FARM[CURRENT_FARM].corners[1].x, FARM[CURRENT_FARM].corners[1].y, FARM[CURRENT_FARM].corners[2].x, FARM[CURRENT_FARM].corners[2].y) then
							if RUN_AMBAR then
								RUN_AMBAR = false
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
								while sampGetPlayerSpecialAction(MyID()) ~= 0 do wait(0) end
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 4, true, false)
							end
							BeginToPoint(posX, posY, 2.6, true, false)
							while sampGetPlayerAnimationId(MyID()) ~= 1548 and BOT_MODE_SET_ID == -1 do
								if BOT_ERROR then
								 BOT_ERROR = false
								 break
								elseif RUN_AMBAR then
								 break
								elseif BOT_RELOAD_MODE then
								 BOT_RELOAD_MODE = false
								 BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 4, true, false)
								 BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 4, true, false)
								 BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
								 BOT_MODE_SET_ID = 1
								 while BOT_MODE_SET_ID ~= -1 do wait(0) end
								 BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 4, true, false)
								 BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 4, true, false)
								 break
								else
								 Alt()
							 end
							 wait(1000)
						  end
							if RUN_AMBAR then
								RUN_AMBAR = false
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
								while sampGetPlayerSpecialAction(MyID()) ~= 0 do wait(0) end
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 4, true, false)
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
							BeginToPoint(posX, posY, 2.6, true, false)
							while sampGetPlayerAnimationId(MyID()) ~= 1548 and BOT_MODE_SET_ID == -1 do
								if BOT_ERROR then
									BOT_ERROR = false
									break
							 	elseif BOT_RELOAD_MODE then
									BOT_RELOAD_MODE = false
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 4, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 4, true, false)
									BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
									BOT_MODE_SET_ID = 2
									while BOT_MODE_SET_ID ~= -1 do wait(0) end
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 4, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 4, true, false)
									break
								elseif RUN_AMBAR then
								 break
								else
								 Alt()
								end
								wait(1000)
							end
							while sampGetPlayerAnimationId(MyID()) == 1548 do wait(0) end
							if RUN_AMBAR then
								RUN_AMBAR = false
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
								while sampGetPlayerSpecialAction(MyID()) ~= 0 do wait(0) end
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 4, true, false)
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
							BeginToPoint(posX, posY, 2.6, true, false)
							while sampGetPlayerAnimationId(MyID()) ~= 532 and BOT_MODE_SET_ID == -1 do
								if BOT_ERROR then
									BOT_ERROR = false
									break
							 	elseif BOT_RELOAD_MODE then
									BOT_RELOAD_MODE = false
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 4, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 4, true, false)
									BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
									BOT_MODE_SET_ID = 3
									while BOT_MODE_SET_ID ~= -1 do wait(0) end
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 4, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 4, true, false)
									break
								elseif COLLECT_WATER then
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 4, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 4, true, false)
									BeginToPoint(FARM[CURRENT_FARM].barrel.x, FARM[CURRENT_FARM].barrel.y, 0.7, false, false)
									while COLLECT_WATER do wait(0) end
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 4, true, false)
									BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 4, true, false)
									break
								elseif RUN_AMBAR then
								 break
								else
								 Alt()
								end
								wait(1000)
							end
							while sampGetPlayerAnimationId(MyID()) == 532 do wait(0) end
							if RUN_AMBAR then
								RUN_AMBAR = false
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
								while sampGetPlayerSpecialAction(MyID()) ~= 0 do wait(0) end
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 4, true, false)
								BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 4, true, false)
							end
						end
					end
				end
			end
			if RUN_AMBAR then
				RUN_AMBAR = false
				BeginToPoint(FARM[CURRENT_FARM].run.from_farm[1].x, FARM[CURRENT_FARM].run.from_farm[1].y, 4, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.from_farm[2].x, FARM[CURRENT_FARM].run.from_farm[2].y, 4, true, false)
				BeginToPoint(FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y, 0.5, false, false)
				while sampGetPlayerSpecialAction(MyID()) ~= 0 do wait(0) end
				BeginToPoint(FARM[CURRENT_FARM].run.to_farm[1].x, FARM[CURRENT_FARM].run.to_farm[1].y, 4, true, false)
				BeginToPoint(FARM[CURRENT_FARM].run.to_farm[2].x, FARM[CURRENT_FARM].run.to_farm[2].y, 4, true, false)
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

function requestRunner()
	return effil.thread(function(u, a)
		local https = require 'ssl.https'
		local ok, result = pcall(https.request, u, a)
		if ok then
			return {true, result}
		else
			return {false, result}
		end
	end)
end

function threadHandle(runner, url, args, resolve, reject)
	local t = runner(url, args)
	local r = t:get(0)
	while not r do
		r = t:get(0)
		wait(0)
	end
	local status = t:status()
	if status == 'completed' then
		local ok, result = r[1], r[2]
		if ok then resolve(result) else reject(result) end
	elseif err then
		reject(err)
	elseif status == 'canceled' then
		reject(status)
	end
	t:cancel(0)
end

function async_http_request(url, args, resolve, reject)
	local runner = requestRunner()
	if not reject then reject = function() end end
	lua_thread.create(function()
		threadHandle(runner, url, args, resolve, reject)
	end)
end

function loop_async_http_request(url, args, reject)
	local runner = requestRunner()
	if not reject then reject = function() end end
	lua_thread.create(function()
		while true do
			while not key do wait(0) end
			url = server .. '?act=a_check&key=' .. key .. '&ts=' .. ts .. '&wait=25'
			threadHandle(runner, url, args, VK_READ, reject)
		end
	end)
end

function char_to_hex(str)
  return string.format("%%%02X", string.byte(str))
end

function url_encode(str)
  local str = string.gsub(str, "\\", "\\")
  local str = string.gsub(str, "([^%w])", char_to_hex)
  return str
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
