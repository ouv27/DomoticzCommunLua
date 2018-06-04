Debug = 'On'
Script = '*** script_time_Portail : '
if(Debug == 'On') then
               print(Script.."Debug On")
end
commandArray = {}
	sPortailState = otherdevices['Portail Door Sensor']
	print(sPortailState)
	time = uservariables["PortailTimer"]
	if(Debug == 'On') then
		print(Script.."sPortailState = "..sPortailState)
		print(Script.."uservariables[PortailTimer] = "..time)
	end
	if (sPortailState == 'Open' or sPortailState == 'On') then
		if(time == nil or time == '' or time == "0") then
			commandArray['Variable:PortailTimer'] = tostring(os.time(now))
			time = tostring(os.time(now))
			if(Debug == 'On') then
				print(Script.."time not set")
				print(Script.."new time = "..time)
			end
		end
		if(Debug == 'On') then
			print (Script.."time = "..time)
			print (Script.."time + 5 minutes = "..time + 5*60-1)
			print (Script.."now = "..os.time(now))
		end
		if(time + 5*60-1 < os.time(now) ) then
			if(Debug == 'On') then
			   print(Script.."Alerte")
			end
			commandArray['Variable:XiaomiMP3']='10012'
			if(Debug == 'On') then
				print(Script..'Xiaomi Gateway will play sound stored on bank 10012')
			end    
			commandArray['Xiaomi Gateway MP3']='On'
		end
		elseif(time ~= "0") then 
			commandArray['Variable:PortailTimer'] = "0"
			if(Debug == 'On') then
				print (Script.."Portail Closed, reset timer")
			end
	end
return commandArray

