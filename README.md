Supremacy Framework
========
I wanted to learn more about how ARMA 3 modding worked, and there is really no better way than "code to learn". Everything is coded from the ground up, except for the below mentioned 3rd part scripts.

I don't know much about "best practises" in this language yet, or how I should or shouldn't code things, so feedback is absolutely more than welcome (constructive feedback please, thanks!).

## Current Features
 * World loot spawns
 * World vehicle spawns
 * World stationery spawns
 * Dynamic Groups
 * Player spawn/respawn (cities, random, world)
 * Timed, random placement, airdrops
 * Equipment Shops
 * Vehicle Shops
 * Clothes Shops
 * Simple HUD (fps, health and money)
 * Persistent player data (MySQL)
 * Loot spawn in buildings and world loot spawn (vehicles, crates and stationary)
 * Skill & Experience system
 * Revival, heal, repair and other skills.
 * BIS Dynamic Groups

## Maps
 * Altis
 * Tanoa

## Usage/Installation
It uses strictly "vanilla" (including expansions) content. No client-side mods required.

1. Upload the content of the "Dist" folder to your ARMA 3 dedicated server root (where the arma3server.exe file is).
2. Edit the "LaunchServer.bat" files launch parameters to suit your needs.
3. Edit the "@extDB2\extdb-conf.ini" file, adding your database connection details.
4. Import the "@extDB2\spmc_server.sql" to your database.
    * If upgrading, import any "spmc_server - x.x.x to x.x.X update.sql" files in the correct order (by version).
5. Run the "LaunchServer.bat" file.

You can modify the "\Source\supremacy_server\compile\core\config*.sqf" to make changes to a lot of the elements in the framework.
There is no wiki yet, but I hope to get working on that soon(tm).

## 0.5.1 (17-08-2016)

Features/Changes:

 * Changed building spawn to include weapons, helmets and attachments.

Bugfixes:

 * Fixed Altis map. Should now work exactly like Tanoa (shops etc.).
 * Fixed issue in initShops.sqf (altis), preventing server from loading.

## Support / Feedback / Issues
If you need help, have feedback, requests or like, please post it here (or via GitHub) [The Forums](https://forums.bistudio.com/topic/184027-spmc-supremacy-framework-multiplayer-sandbox-framework/).   

## Copyright & License
Code released under [CC BY-NC 3.0 License](https://creativecommons.org/licenses/by-nc/3.0/legalcode).  
To read the human-readable summary of the CC BY-NC 3.0 License, [click here](https://creativecommons.org/licenses/by-nc/3.0/).  

The license does NOT apply to or included any of the 3rd party material (sounds, code, icons etc). All 3rd party material can be found in the "\3rdparty" directory in the client and server source code.

I did not create or own any of the 3rd party material. Please see their credits below and in their files were applicable.

Copyright (c) 2016 Mark Eliasen - 3rd party material are copyrighted by their respective owners.

## Arma Server Monetization
You have permission to use this framework on a monetised arma server(s).

**IMPORTANT NOTE:** This does NOT apply to any of the 3rd party material (sounds, code, icons etc). All 3rd party material can be found in the "\3rdparty" directory in the client and server source code.

## 3rd Party Credits
A big thanks to the following people for their scripts, icons, sounds and extensions which are required to make the SPMC framework tick.
A special thanks to Kilzone_Kid and Tonic for inspiration and code/resources which I have learn a lot from.

####Code
 * [Killzone_Kid](http://killzonekid.com/arma-scripting-tutorials-epic-armour-drop/) for the Original Airdrop script.  
 * [Shuko](http://forums.bistudio.com/showthread.php?t=89376) for SHK_pos.
 * [Bryan "Tonic" Boardwine](http://www.tonic.pw/) for the async extDB2 script.
 * Karel Moricky for the "numberToText" function.
 * [HallyG](https://forums.bistudio.com/topic/184551-simple-animation-with-progressbar-and-handling/) for the original progress bar script.

###Extensions
 * [Torndeco](https://bitbucket.org/torndeco/extdb3) for extDB2 (Arma3 Extension DB2).
 
####Sounds
 * [pierrecartoons1979](https://www.freesound.org/people/pierrecartoons1979/sounds/90121/) for the "purchase" sound.
 * [escortmarius](https://www.freesound.org/people/escortmarius/sounds/138096/) for the "purchase_click" sound.
 * [qubodup](https://www.freesound.org/people/qubodup/sounds/140773/) for the original "error" sound.
 * [GameAudio](https://www.freesound.org/people/GameAudio/sounds/220176/) for the original "sold_item" sound.
 * [Gitietor](https://www.freesound.org/people/Gitietor/sounds/275335/) for the original "skill_learned" sound.

####Icons
 * [Paomedia](https://www.iconfinder.com/icons/299107/money_icon) for the "money" icon.
 * [Aha-Soft Team](https://www.iconfinder.com/icons/328013/america_online_aol_run_icon) for the "stamina" icon.
 * [Linh Pham Thi Dieu](https://www.iconfinder.com/icons/283941/camera_device_recorder_video_icon) for the "fps" icon.
 * [Visual Pharm](https://icons8.com/) for the "health" icon.