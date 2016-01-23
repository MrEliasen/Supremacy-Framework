@echo off 
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "D:\Dropbox\Github Repositories\SupremacyFramework\Source\supremacy.altis" "D:\Arma 3 Server\mpmissions\supremacy.altis.pbo"
ping 127.0.0.1 -n 2 > nul
"C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe" -pack "D:\Dropbox\Github Repositories\SupremacyFramework\Source\supremacy_server" "D:\Arma 3 Server\@supremacy_server\addons\supremacy_server.pbo"

ping 127.0.0.1 -n 2 > nul

del "D:\Arma 3 Server\mpmissions\supremacy.altis.pbo.bak"
del "D:\Arma 3 Server\@supremacy_server\addons\supremacy_server.pbo.bak"

cd "D:\Arma 3 Server"
start arma3server  -port=2302 "-config=D:\Arma 3 Server\TADST\supremacy\TADST_config.cfg" "-cfg=D:\Arma 3 Server\TADST\supremacy\TADST_basic.cfg" "-profiles=D:\Arma 3 Server\TADST\supremacy" -name=supremacy "-mod=heli;mark;@extDB2;@supremacy_server" -enableHT
@exit