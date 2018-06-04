-- Raspbian path
json = (loadfile "/home/pi/domoticz/scripts/lua/SMO_Globals.lua")()
-- Windows path
-- json = (loadfile "C:\\Program Files (x86)\\Domoticz\\scripts\\lua\\SMO_Globals.lua")()

Version = "V1.0"
Script = '*** SMO_Functions('..Version..') : '


function SendNotification(media,msg)
	if(media=="XIAOMIGW") then
		XiaomiGatewayMP3(msg)
	elseif(media=="EMAIL") then

	elseif(media=="PUSHBULLET") then
	
	end
end

-- 10003 : Au lit
-- 10004 : A toi
-- 10005 : Grouille
-- 10006 : Pas touche
-- 10007 : Les fauteuils massant sont hyper confortable
-- 10008 : Les collègues peuvent avoir une bonne écoute
-- 10009 : Oh Year
-- 10010 : Ouverture du portail
-- 10011 : 
-- 10012 : Le portail est resté ouvert
function XiaomiGatewayMP3(id)
    commandArray['Variable:XiaomiMP3']=''..id..''
	if(Debug == 'On') then
		print(Script..'XiaomiGatewayMP3 : '..'Xiaomi Gateway will play sound stored on bank '..id)
	end    
    commandArray['Xiaomi Gateway MP3']='On'
end


-- Convert a date time like 2013-07-11 17:23:12 to os.time format
function lastupdateToTime(last)
	year = string.sub(last, 1, 4)
	month = string.sub(last, 6, 7)
	day = string.sub(last, 9, 10)
	hour = string.sub(last, 12, 13)
	minutes = string.sub(last, 15, 16)
	seconds = string.sub(last, 18, 19)
	rtnTime = os.time{year=year, month=month, day=day, hour=hour, min=minutes, sec=seconds}
	return rtnTime
end

function os.capture(cmd, raw)
	local f = assert(io.popen(cmd, 'r'))
	local s = assert(f:read('*a'))
	f:close()
	if raw then return s end
	s = string.gsub(s, '^%s+', '')
	s = string.gsub(s, '%s+$', '')
	s = string.gsub(s, '[\n\r]+', '')
	return s
end

function split(s, delimiter)
   local result = {}
   for match in (s..delimiter):gmatch('(.-)'..delimiter) do
      table.insert(result, match)
   end
   return result
end

function HelloWorld()
        print "Hello World"
end

function GroupState(sArray)
        -- v1.0. 2016-01-18
        -- Checks the state of a group of swithces.
        -- USAGE   : GroupState({'Switch1','Switch2','Switch3','Switch4','Switch5',more switches})
        -- RETURNS : 'On'       if all switches are on.
        --         : 'Off'      if all switches are off.
        --         : 'Mixed"    if one or more, but not all switches are on.
        --
        local iState = 0
        local iCount = 0
        local sState = ''
        for i,light in pairs(sArray) do
                if (otherdevices[light] == 'On') then
                        iState = iState + 1
                end
        iCount = iCount + 1
        end
        if(iState == 0) then sState = "Off" end
        if(iState > 0) then sState = 'Mixed' end
        if(iState == iCount) then sState = 'On' end
--      print("iCount   : " .. iCount)
--      print("iState   : " .. iState)
--      print("sState   : " .. sState)
        print "LIBS LUA"
        return sState
end