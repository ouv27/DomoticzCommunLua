json = (loadfile "/home/pi/domoticz/scripts/lua/SMO_Globals.lua")() 
Script = '*** SMO_Functions : '

function XiaomiGatewayMP3(id)
    commandArray['Variable:XiaomiMP3']=''..id..''
	if(Debug == 'On') then
		print(Script..'XiaomiGatewayMP3 : '..'Xiaomi Gateway will play sound stored on bank '..id)
	end    
    commandArray['Xiaomi Gateway MP3']='On'
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