/**
 * init.sqf
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @package    Supremacy Framework
 * @author     Mark Eliasen <https://github.com/MrEliasen>
 * @copyright  2015 Mark Eliasen
 * @license    CC BY-NC 3.0 License
 * @link       https://github.com/MrEliasen/SupremacyFramework
 */

enableSaving [false, false];
serverIsReady = false;
publicVariable "serverIsReady";
serverStatus = "";
publicVariable "serverStatus";

// loot crate spawn completion status (0-100%)
serverStatusLootCrates = 0;
// loot vehicle spawn completion status (0-100%)
serverStatusLootVehicle = 0;
// loot stationery spawn completion status (0-100%)
serverStatusLootStationery = 0;
// Keeps track of all the player's monneh!
serverPlayerMoney = [];

diag_log "SERVER: Compiling compile\_master.sqf";
_handle = [] execVM "\supremacy_server\compile\_master.sqf";
waitUntil {scriptDone _handle};

debugMode = (["debug_mode"] call SPMC_fnc_config);
publicVariable "debugMode";
diag_log format["Debug mode enabled: %1", debugMode];

diag_log "SERVER: Hiding map markers";
_handle = [] execVM "\supremacy_server\server\hideMarkers.sqf";
waitUntil {scriptDone _handle};

diag_log "SERVER: Compiling 3rdparty\_master.sqf";
_handle = [] execVM "\supremacy_server\3rdparty\_master.sqf";
waitUntil {scriptDone _handle};

diag_log "SERVER: Establishing database connection.";
_handle = ["spmc","SQL_CUSTOM_V2","spmc"] execVM "\supremacy_server\3rdparty\extDB2\dbInit.sqf";
waitUntil {scriptDone _handle};

diag_log "SERVER: Running server setup.";
_handle = [] execVM "\supremacy_server\server\setup.sqf";
waitUntil {scriptDone _handle};