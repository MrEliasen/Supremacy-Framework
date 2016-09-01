Supremacy Framework
========
I wanted to learn more about how ARMA 3 modding worked, and there is really no better way than "code to learn". Everything is coded from the ground up, except for the below mentioned 3rd party scripts.

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
 * Air drop events
 * Ammo repacking
 * Timed Rewards
 
## Maps
 * Altis
 * Tanoa

## Usage/Installation
It uses strictly "vanilla" (including expansions) content. No client-side mods required - and I want to keep it that way.

1. Upload the content of the "Dist" folder to your ARMA 3 dedicated server root (where the arma3server.exe file is).
2. Edit the "LaunchServer.bat" files launch parameters to suit your needs.
3. Edit the "@extDB3\extdb-conf.ini" file, adding your database connection details.
4. Import the "@extDB3\spmc_server.sql" to your database.
    * If upgrading, import any "@extDB3\spmc_server - x.x.x to x.x.x update.sql" files in the correct order (by version).
5. Run the "LaunchServer.bat" file.

You can modify the "\Source\supremacy_server\compile\core\config*.sqf" to make changes to a lot of the elements in the framework.
There is no wiki yet.

## Using This Framework or some of it's Code?
If you do not mind, please let me know! I would love to see what others have made using this framework or some of it's code!

## 0.6.0 (02-09-2016)

Features/Changes:

 * Updated configs to include all (hopefully) new vehicle, items and weapons from APEX.
 * Updated price list, now include all (hopefully) items and vehicles from APEX.
 * Updated clothing shops, so they only sell items for the faction of the player (Config updated).
 * Updated the unconscious system, removing animations and relying more on ARMA 3 official methods.
 * Updated the (long overdue) mission briefing.
 * Updated the github url in all files.
 * Updated all loot scripts.
 * Updated vehicle sell distance from 10 to 25m.
 * Added location saving and spawning. You can now choose players to spawn where the logged out (Config, DB and ExtDB ini - updated).
 * Added magazine repacking (see player menu).
 * Added "<player> was injured ny <player>" when becoming unconscious.
 * Added option to enable/disable the abillity to get executed while unconscious.
 * Added blur effect to players who are unconcious.
 * Added black out when killed.
 * Added timed EXP rewards (EXP granting scipt updated, Config updated).
 * Added "reward" sound, used for timed rewards.
 * Added a Zeus menu detection (client side), with server logging.
 * Added a few extra items from APEX to the configs.
 * Changed the air drop smoke duration from 10 to 5 minutes.
 * Changed the UI update interval from 0.25 sec to 1 second.
 * Removed obsolete code from several files.

Bugfixes:

 * Fixed various debug logging in files so they only log when debug mode is on.
 * Fixed desk and nato crate not getting removed from unavailable shops.
 * Fixed cloths menu prices being cut off.
 * Fixed bug in playerUnconscious script, potentially breaking the script.
 * Fixed an issue in dbCalls returning data without needing to.
 * Fixed some event handlers not getting removed from corpses.
 * Fixed setting placeables, loot crates, vehicles etc to 0 in the config, will now properly skip it during server initialisation.
 * Fixed "LineMarker" errors.
 * Fixed relogging while unconsious would save your gear.
 * Fixed issue where you would never die form grenades.
 * Fixed bug where player would not eject from vehicle when unconsious.
 * Fixed goggles not saving with gear.
 * Fixed secondary weapon adding a rangefinder on certain occations.
 * Fixed rangefinder not equipping on character load.

Known Issues:

 * None.

## Support / Feedback / Issues
If you need help, have feedback, requests or like, please post it here on the [The Forums](https://forums.bistudio.com/topic/184027-spmc-supremacy-framework-multiplayer-sandbox-framework/), or via Github.   

## Copyright & License
Code released under [CC BY-NC 3.0 License](https://creativecommons.org/licenses/by-nc/3.0/legalcode).  
To read the human-readable summary of the CC BY-NC 3.0 License, [click here](https://creativecommons.org/licenses/by-nc/3.0/).  

The license do NOT apply to or included any of the 3rd party material (sounds, code, icons etc). All 3rd party material can be found in the "\3rdparty" directory in the client and server source code.

I did not create or own any of the 3rd party material. Please see their credits below and in their files were applicable.

Copyright (c) 2016 Mark Eliasen - 3rd party material are copyrighted by their respective owners.

## Arma Server Monetization
You have permission to use this framework on monetised arma server(s).

**IMPORTANT NOTE:** This does NOT apply to any of the 3rd party material (sounds, code, icons etc). All 3rd party material can be found in the "\3rdparty" directory in the client and server source code.

## 3rd Party Credits
A big thanks to the following people for their scripts, icons, sounds and extensions which are required/used to make this framework tick.
A special thanks to Kilzone_Kid and Tonic for inspiration and code/resources which I have learned a lot from.

####Code
 * [Killzone_Kid](http://killzonekid.com/arma-scripting-tutorials-epic-armour-drop/) for the Original Airdrop script.  
 * [Shuko](http://forums.bistudio.com/showthread.php?t=89376) for SHK_pos.
 * [Bryan "Tonic" Boardwine](http://www.tonic.pw/) for the async extDB3 script.
 * Karel Moricky for the "numberToText" function.
 * [HallyG](https://forums.bistudio.com/topic/184551-simple-animation-with-progressbar-and-handling/?p=2909602) for the original progress bar script.

###Extensions
 * [Torndeco](https://bitbucket.org/torndeco/extdb3) for ExtDB3.

###Testing
 * [Hallreaver](https://forums.bistudio.com/user/1131216-hallreaver/) for helping me test all the things!
 
####Sounds
 * [pierrecartoons1979](https://www.freesound.org/people/pierrecartoons1979/sounds/90121/) for the "purchase" sound.
 * [escortmarius](https://www.freesound.org/people/escortmarius/sounds/138096/) for the "purchase_click" sound.
 * [qubodup](https://www.freesound.org/people/qubodup/sounds/140773/) for the original "error" sound.
 * [GameAudio](https://www.freesound.org/people/GameAudio/sounds/220176/) for the original "sold_item" sound.
 * [Gitietor](https://www.freesound.org/people/Gitietor/sounds/275335/) for the original "skill_learned" sound.
 * [EdEditz](https://www.freesound.org/people/EdEditz/sounds/188340/) for the original "reward" sound.
 
####Icons
 * [Paomedia](https://www.iconfinder.com/icons/299107/money_icon) for the "money" icon.
 * [Linh Pham Thi Dieu](https://www.iconfinder.com/icons/283941/camera_device_recorder_video_icon) for the "fps" icon.
 * [Visual Pharm](https://icons8.com/) for the "health" icon.