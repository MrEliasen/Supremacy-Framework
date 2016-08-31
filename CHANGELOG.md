## 0.6.0 (31-08-2016)

Features/Changes:

 * Updated configs to include all (hopefully) new vehicle, items and weapons from APEX.
 * Updated price list, now include all (hopefully) items and vehicles from APEX.
 * Updated clothing shops, so they only sell items for the faction of the player (Config updated).
 * Updated the unconscious system, removing animations and relying more on ARMA 3 official methods.
 * Added location saving and spawning. You can now choose players to spawn where the logged out (Config, DB and ExtDB ini - updated).
 * Added magazine repacking (see player menu).
 * Added "<player> was injured ny <player>" when becoming unconscious.
 * Added option to enable/disable the abillity to get executed while unconscious.
 * Added blur effect to players who are unconcious.
 * Added timed EXP rewards (EXP granting scipt updated, Config updated).
 * Added "reward" sound, used for timed rewards.
 * Added a Zeus menu detection (client side), with server logging.
 * Changed the air drop smoke duration from 10 to 5 minutes.

Bugfixes:

 * Fixed various debug logging in files so they only log when debug mode is on.
 * Fixed desk and nato crate not getting removed from unavailable shops.
 * Fixed cloths menu prices being cut off.
 * Fixed bug in playerUnconscious script, potentially breaking the script.
 * Fixed an issue in dbCalls returning data without needing to.
 * Removed obsolete code for spawn protection buildings.
 * Setting placeables, loot crates, vehicles etc to 0 in the config, will now properly skip it during server initialisation.

Known Issues:

 * None.


## 0.5.2 (20-08-2016)

Features/Changes:

 * Added Water vehicle shops (new configuration options).
 * Updated drop zone layout on Tanoa (config updated).
 * Updated ExtDB2 to extDB3-1010 (new ExtDB ini files).

Bugfixes:

 * Fixed map not completing the load when building loot is set to 0.
 * Fixed vehicles shop dialog not showing.
 * Fixed shops not removing the cash desk and NATO box.
 * Fixed attachements not spawning in world loot.

Known Issues:

 * None.


## 0.5.1 (17-08-2016)

Features/Changes:

 * Changed building spawn to include weapons, helmets and attachments.

Bugfixes:

 * Fixed Altis map. Should now work exactly like Tanoa (shops etc.).
 * Fixed issue in initShops.sqf (altis), preventing server from loading.


## 0.5.0 (13-07-2016)

Features/Changes:

 * Tanoa map compatibility added.
 * Added the BIS group system (https://community.bistudio.com/wiki/Dynamic_Groups). Can be accessed by pressin U or via the player menu.
 * Shops updated (map file)
 * Only X number of each shop type will spawn (config setting). Which once are determined by random on server init.
 * Added starter gear setting for GUER, WEST, EAST and default.
 * Added the ability to add both sidearm, launcher and primary starter weapons.
 * Removed stamina indicator since the game now have its own way of showing it.
 * Added option to place puchased equipment and items in a box next to shops.

Bugfixes:

 * Fixed issue with player body is removed when logging out after being killed.
 * Fixed starter gear not being added properly on spawn.
 * Fixed issue with saving gear not including ammo and inventory items.

Known Issues:

 * The new shop system with equipment crates is not implemented on the Altis map yet.

Thanks

 * "das attorney" on the BIS forums for help with the 0.5.0 release.


## 0.4.1 (23-01-2016)

Features/Changes:

 * Added the ability to update the currency symbol used throughout the framework, via the config.

Bugfixes:

 * Fixed the issue with sell prices now showing the currect amount.
 * Fixed experience output data from displaying without debug enabled.
 * Fixed issue with vehicles sales not confirming.