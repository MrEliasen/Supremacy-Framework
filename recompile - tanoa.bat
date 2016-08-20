@echo off 

taskkill /im arma3server.exe

copy /y "C:\Users\Simply\Documents\Arma 3\missions\supremacy.Tanoa\mission.sqm" "D:\Dropbox\Github Repositories\SupremacyFramework\Source\supremacy.Tanoa\mission.sqm"
copy /y "C:\Users\Simply\Documents\Arma 3\missions\supremacy.Tanoa\mission.sqm" "D:\Dropbox\Github Repositories\SupremacyFramework\Source\supremacy_client\mission.sqm"
copy /y "D:\Dropbox\Github Repositories\SupremacyFramework\Source\supremacy_server\compile\core\config (tanoa).sqf" "D:\Dropbox\Github Repositories\SupremacyFramework\Source\supremacy_server\compile\core\config.sqf"

REM 3 seconds delay, emulated with ping
ping 127.0.0.1 -n 2 > nul
ping 127.0.0.1 -n 2 > nul
ping 127.0.0.1 -n 2 > nul

"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "D:\Dropbox\Github Repositories\SupremacyFramework\Source\supremacy_client" "C:\Arma_3_Server\mpmissions\supremacy.Tanoa.pbo"

REM 3 seconds delay, emulated with ping
ping 127.0.0.1 -n 2 > nul

"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "D:\Dropbox\Github Repositories\SupremacyFramework\Source\supremacy_server" "C:\Arma_3_Server\@supremacy_server\addons\supremacy_server.pbo"

REM 3 seconds delay, emulated with ping
ping 127.0.0.1 -n 2 > nul

del "C:\Arma_3_Server\mpmissions\supremacy.Tanoa.pbo.bak"
del "C:\Arma_3_Server\@supremacy_server\addons\supremacy_server.pbo.bak"

start C:\Arma_3_Server\arma3server -port=2302 "-config=C:\Arma_3_Server\TADST\supremacy\TADST_config.cfg" "-cfg=C:\Arma_3_Server\TADST\supremacy\TADST_basic.cfg" "-profiles=C:\Arma_3_Server\TADST\supremacy" -name=supremacy "-mod=heli;mark;@extDB3;@supremacy_server" -enableHT
@exit