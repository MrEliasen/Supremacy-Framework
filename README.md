Supremacy Framework
========
I wanted to learn more about how ARMA 3 modding worked, and there is really no better way than "code to learn". Everything is coded from the groud up, except for the below mentioned 3rd part scripts.

I don't know much about "best practises" in this language yet, or how I should or shouldn't code things, so feedback is absolutely more than welcome (feedback is still more than welcome even if I did/do know :))!

## Features 
 * World loot spawns
 * World vehicle spawns
 * World stationery spawns
 * Player spawn/respawn (cities, random, world)
 * Timed, random placement, airdrops
 * Equipment Shops
 * Vehicle Shops
 * Clothes Shops

There are many planned features, like persistent data (eg. character save/load) and shop/economy system. But I want the core system to work really well before I move on to adding more stuff on top of it.

## Usage/Installation
It uses strictly "vanilla" (including expansions) content. No client-side mods required.

1. Upload the "\Dist\@supremacy_server" folder to your ARMA 3 dedicated server root (where the arma3server.exe file is).
2. Upload the "\Dist\mpmissions\supremacy.altis.pbo" file to your dedicated server "\mpmissions" directory.
3. Upload the "\Dist\LaunchServer.bat" file your ARMA 3 dedicated server root.
4. Edit the "LaunchServer.bat" files launch parameters to suit your needs.
5. Run the "LaunchServer.bat" file.

## Copyright & License
Code released under [CC BY-NC 3.0 License](https://creativecommons.org/licenses/by-nc/3.0/legalcode).  
To read thehuman-readable summary of the CC BY-NC 3.0 License, [click here](https://creativecommons.org/licenses/by-nc/3.0/).  

The license does NOT apply to, or included, the 3rd party code (fund in the "\3rdparty" directories) or any of the sounds (found in the "\sounds" directory).   
I did not create or own any of the 3rd part scripts or sounds. Please see their credits below or in their files where possible.

Copyright (c) 2015 Mark Eliasen - 3rd party scripts and sounds are copyrighted by their respective owners.

## 3rd Party Credits

####Code
 * [Killzone_Kid](http://killzonekid.com/arma-scripting-tutorials-epic-armour-drop/) for the Original Airdrop script.  
 * [Shuko](http://forums.bistudio.com/showthread.php?t=89376) for SHK_pos.
 * Karel Moricky for the "numberToText" function.
 
####Sounds
 * [pierrecartoons1979](https://www.freesound.org/people/pierrecartoons1979/sounds/90121/) for the "purchase" sound.
 * [escortmarius](https://www.freesound.org/people/escortmarius/sounds/138096/) for the "purchase_click" sound.
 * [qubodup](https://www.freesound.org/people/qubodup/sounds/140773/) for the original "error" sound.
 * [GameAudio](https://www.freesound.org/people/GameAudio/sounds/220176/) for the original "sold_item" sound.

####Icons
 * [Paomedia](https://www.iconfinder.com/icons/299107/money_icon) for the "money" icon.
 * [Aha-Soft Team](https://www.iconfinder.com/icons/328013/america_online_aol_run_icon) for the "stamina" icon.
 * [Linh Pham Thi Dieu](https://www.iconfinder.com/icons/283941/camera_device_recorder_video_icon) for the "fps" icon.
 * [Visual Pharm](https://icons8.com/) for the "health" icon.