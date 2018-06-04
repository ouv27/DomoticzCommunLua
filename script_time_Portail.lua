-- Raspbian path
json = (loadfile "/home/pi/domoticz/scripts/lua/SMO_Functions.lua")()
-- Windows path
-- json = (loadfile "C:\\Program Files (x86)\\Domoticz\\scripts\\lua\\SMO_Functions.lua")()

Version = "V1.0"
Script = '*** script_time_Portail2('..Version..') : '

if(Debug == 'On') then
               print(Script.."Debug On")
end
commandArray = {}
	timenow = os.time()
	s = otherdevices_lastupdate['Portail Door Sensor']
	RtnTime = lastupdateToTime(s)
	sPortailState = otherdevices['Portail Door Sensor']
	if ((sPortailState == 'Open' or sPortailState == 'On') and (timenow+DelaisNotificationPortailOuvert>RtnTime)) then
		SendNotification("XIAOMIGW","10009");
	end
	if(Debug == 'On') then
		print(Script.."timenow:"..tostring(timenow))
		print(Script.."Portail Door Sensor:"..s)
		print(Script.."RtnTime:"..tostring(RtnTime))
		print(Script.."DelaisNotificationPortailOuvert:"..tostring(DelaisNotificationPortailOuvert))
		print(Script.."sPortailState:"..tostring(sPortailState))
	end
return commandArray

