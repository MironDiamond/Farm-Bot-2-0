require ("moonloader")

ffi = require("ffi")
https = require 'ssl.https'
dlstatus = require('moonloader').download_status
memory = require "memory"
sampev = require "lib.samp.events"

--[[

Задания:

- Авто-обновление.
- Защита от админа

--]]

FARM = {
	[1] = {
		teleport = {x = 243.23791503906, y = 1130.6599121094},
		barn = {x = 244.4012, y = 1018.5501, z = 25.5234},
		barrel = {x = 271.0201, y = 1022.5037, z = 26.3266},
		corners = {{x = 237.72822570801, y = 1029.7906494141, z = 25.491373062134},{x = 283.48553466797, y = 1100.7864990234, z = 11.511716842651}},
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
		corners = {{x = 237.72822570801, y = 1029.7906494141, z = 25.491373062134},{x = 283.48553466797, y = 1100.7864990234, z = 11.511716842651}},
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
		corners = {{x = -1075.0402832031, y = -2523.3872070313, z = 65.230201721191},{x = -994.62298583984, y = -2473.0451660156, z = 80.555137634277}},
		run = {
			to_farm = {
				{x = -1078.8646240234, y = -2505.5029296875},
				{x = -1043.7462158203, y = -2506.2260742188}
			},
			from_farm = {
				{x = -1043.7462158203, y = -2506.2260742188},
				{x = -1078.8646240234, y = -2505.5029296875}
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
		corners = {{x = -1079.6032714844, y = -2567.4880371094, z = 72.828239440918},{x = -994.09826660156, y = -2522.8913574219, z = 85.263885498047}},
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
		barn = {x = 256.5705, y = 1170.1632, z = 11.8634},
		barrel = {x = 265.6364, y = 1169.2485, z = 10.9427},
		corners = {{x = 218.24978637695, y = 1118.3126220703, z = 13.920701980591},{x = 267.80545043945, y = 1157.3162841797, z = 10.98282623291}},
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

-- Script

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(0) end
	Register_Thread()
	Register_Commands()
	memory.setuint8(7634870, 1, false)
	memory.setuint8(7635034, 1, false)
	memory.fill(7623723, 144, 8, false)
	memory.fill(5499528, 144, 6, false)
	sampAddChatMessage("[Farm Bot]{FFFFFF} Скрипт успешно активирован! | Автор: {DAA520}Miron Diamond", 0xB8860B)
	sampAddChatMessage("[Farm Bot]{FFFFFF} Команды: {DAA520}/bot (ферма){FFFFFF} | {DAA520}/botoff", 0xB8860B)
	while true do
		if (BOT_MODE ~= 0) and (sampGetPlayerSpecialAction(MyID()) ~= 0 or BOT_MODE_SET_ID ~= -1) then
			local mx, my, mz = getCharCoordinates(PLAYER_PED)
			if getDistanceBetweenCoords2d(mx, my, FARM[CURRENT_FARM].barn.x, FARM[CURRENT_FARM].barn.y) < 7 then
				Alt()
			end
		end
		if not BOT_ERROR and BOT_MODE == 3 and COLLECT_WATER then
			local mx, my, mz = getCharCoordinates(PLAYER_PED)
			if getDistanceBetweenCoords2d(mx, my, FARM[CURRENT_FARM].barell.x, FARM[CURRENT_FARM].barrel.y) < 7 then
				Alt()
			end
		end
		wait(1000)
	end
end

-- Register

function Register_Commands()
	sampRegisterChatCommand("bot", function(arg)
		if tonumber(arg) then
			if tonumber(arg) <= 5 or tonumber(arg) >= 1 then
				CURRENT_FARM = arg
				sampAddChatMessage("[Farm Bot]{FFFFFF} Бот активирован! Ферма {DAA520}№"..arg..".", 0xB8860B)
			else
				sampAddChatMessage("[Farm Bot]{FFFFFF} Используйте: {DAA520}/bot [1-5]", 0xB8860B)
			end
		else
			sampAddChatMessage("[Farm Bot]{FFFFFF} Используйте: {DAA520}/bot [1-5]", 0xB8860B)
		end
	end)

	sampRegisterChatCommand("botoff", function()
		sampAddChatMessage("[Farm Bot]{FFFFFF} Бот отключён.", 0xB8860B)
		thisScript():unload()
	end)
end

function Register_Thread()
	T_Search = lua_thread.create_suspended(Search)
end

-- Events

function sampev.onShowDialog(id, style, title, button1, button2, text)
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
end

function sampev.onServerMessage(color, text)
	if BOT_MODE ~= 0 then
		if text:find("%[Информация%] {ffffff}Вы вернули в амбар инструмент:") then
			setGameKeyState(21, 255)
		elseif text:find("%[Информация%] {ffffff}Вы вернули в амбар саженец:") then
			setGameKeyState(21, 255)
		end
	end

	if (text:find('Тут еще рано собирать урожай') or text:find('у вас уже есть в руках урожай') or text:find('Тут уже работает другой игрок')) then
		BOT_ERROR = true
	end

	if text:find("%[Ошибка%] {ffffff}Сначала отнесите урожай в амбар%.") then
		RUN_AMBAR = true
	end

	if text:find("%[Ошибка%] {ffffff}У вас должно быть полное ведро воды%. Наберите воды с бочки%.") then
		COLLECT_WATER = true
	end

	if text:find("%[Информация%] {ffffff}Вы набрали полное ведро воды%.") then
		COLLECT_WATER = false
	end

	if text:find('Вы не можете выкопать урожай без лопаты') or text:find('Вы не можете выкопать ямку без лопаты') or text:find('У вас нет саженца') or text:find('Для начала возьмите ведро') or text:find('Для прополки нужны грабли') or text:find("%[Ошибка%] {ffffff}Сейчас нет заданий") then
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

function sampev.onPlayerStreamIn() if getCharModel(PLAYER_PED) == 132 or getCharModel(PLAYER_PED) == 198 then return false end end

function sampev.onVehicleStreamIn() if getCharModel(PLAYER_PED) == 132 or getCharModel(PLAYER_PED) == 198 then return false end end

-- Function

function Search()
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

			if BOT_MODE == 1 then
				for i = 0, 2048 do
					if sampIs3dTextDefined(i) then
						local check = '[REMOVE COSTUMES]'
						local text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId = sampGet3dTextInfoById(i)
						if (text:find("можно собрать урожай") or text:find("свободное")) and isCoordInArea2d(posX, posY, FARM[CURRENT_FARM].corners[1].x, FARM[CURRENT_FARM].corners[1].y, FARM[CURRENT_FARM].corners[2].x, FARM[CURRENT_FARM].corners[2].y) then
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
								 setGameKeyState(21, 255)
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
							 	else
								 setGameKeyState(21, 255)
								end
								wait(1000)
							end
							while sampGetPlayerAnimationId(MyID()) == 1548 do wait(0) end
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
							 	else
								 setGameKeyState(21, 255)
								end
								wait(1000)
							end
							while sampGetPlayerAnimationId(MyID()) == 532 do wait(0) end
						end
					end
				end
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

-- Technical Function

function BeginToPoint(tox, toy, radius, is_sprint, is_jumping)
	local x, y, z = getCharCoordinates(PLAYER_PED)
	local angle = getHeadingFromVector2d(tox - x, toy - y)
	local xAngle = math.random(-50, 50)/100
	setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
	stopRun = false
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
		if stopRun then
			stopRun = false
			break
		end
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

-- by Miron Diamond
