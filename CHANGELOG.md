## 0.4.0 (10-11-2015)

Features/Changes:

  - Added item spawn in buildings (careful, can take a long time to init server if you increase % too much).
  - Added comments to each value in the config.
  - Added more configurable options, like sell percentage, to the config.
  - Added skill and experience system.
  - Added names to the loot markers which are visible in debug mode.
  - Added progress bars.
  - Added revival and healing system.
  - Added vehicle repair
  - Added many other passive abilities and functions as part of the skill/experience system.
  - Added ammo to price list.
  - Added ability to synchronise animations.
  - Network optimisations when selling items and vehicles.
  - Network optimisations to saving player data.
  - Updated ExtDB2 to the latest (66) version.
  - Selling vehicles now confirmes server side like equipment (so money saves).

Bugfixes:

  - Fixed some minor issues where final compiled scripts where defined twice, server side.
  - Fixed an issue where the handgun items would not load from the databse.
  - Fixed an issue where the hangun would not equip if you didn't have a primary weapon.
  - Fixed a bug while loading the players money from the database.
  - Fixed an issue where pricing where not checked client side, protentially saving a large number of requests from having to be sent to the server.
  - Fixed an issue in the extdb-conf.ini file not loading the correct database details.
  - Fixed an issue where you would not respawn propperly if deconnecting and rejoining the server.