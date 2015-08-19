## 0.3.2 (19-08-2015)

Features/Changes:

  - Removed the MRES functions, turns out they are not needed.
  - Every "Update" query to the database will now update the "last active" field for the player.
  - Moved the money sync query to the "svrSyncPlayerData" function.

Bugfixes:

  - (Thanks B4ngB4ng) Fixed an issue with extDB2 not picking up the .ini file.
  - (Thanks B4ngB4ng) Fixed an issue which would prevent saving of player data.
  - Fixed an issue were ammunition bought for a gun before the gun itself, would remove the ammunition from the player.