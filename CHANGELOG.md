## 0.3.0 (12-08-2015)

Features/Changes:

  - Added clothing shop (added to all arms shops on the map).
  - Added default sell prices to all items in the config.
  - Reduced server setup time by A LOT as each setup process now runs in its own thread.
  - All shops now populate faster, as each list loop now runs in its own thread.
  - The arms shop will now show a preview and more details about a selected item from any of the lists.
  - Made all scripts compileFinal with preprocessfilelinenumbers.
  - Added health, stamina, money and fps HUD elements.
  - Added "economy". Money is now stored and purchases and sales are comfirmed by the server.

Bugfixes:

  - Fixed an issue where vehicles would not spawn if ANYTHING was too close to the spawn point.
  - Fixed a bug where selling would not pull in the price properly and break the script.
  - Fixed a bug where selling an item with attachments would leave the attachments on the list.
  - Updated the "license" in each file to the correct license.