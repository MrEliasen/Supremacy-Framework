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