/**
 * init.sqf
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @package    Supremacy Framework
 * @author     Mark Eliasen <https://github.com/MrEliasen>
 * @copyright  2016 Mark Eliasen
 * @license    CC BY-NC 3.0 License
 * @link       https://github.com/MrEliasen/SupremacyFramework
 */

enableSaving [false, false];
serverIsReady = false;
publicVariable "serverIsReady";
serverStatus = "";
publicVariable "serverStatus";

// Keeps track of all the player's monneh!
// Index:
// 0: Arma PlayerUID
// 1: The money value
serverPlayerMoney = [];
// Keeps track of all the player's skills
// Index:
// 0: Arma PlayerUID
// 1: Array
//   0: Available experience points
//   1: The array of known skills
serverPlayerSkills = [];
// loot crate spawn completion status (0-100%)
serverStatusLootCrates = 0;
// loot vehicle spawn completion status (0-100%)
serverStatusLootVehicle = 0;
// loot stationery spawn completion status (0-100%)
serverStatusLootStationery = 0;
// loot in buildings spawn completion status (0-100%)
serverStatusLootBuildings = -1;
publicVariable "serverStatusLootBuildings";

// delete player bodies when they disconnect to attempt to make it harder to dupe items.
/*["onPlayerDisconnected", {
    private ["_body"];
    _body = missionNamespace getVariable [_uid, objNull];
   
    if (!isNull _body) then 
    {
        deleteVehicle _body;
        missionNamespace setVariable[_uid, nil];
    };
       
}] call BIS_fnc_addStackedEventHandler;*/

addMissionEventHandler ["HandleDisconnect", {
    _this spawn {
        private ["_playerData"];
        diag_log "Logging out.";
        _playerData = ["loadPlayer",[(_this select 2)]] call SPMC_fnc_dbCall;
        diag_log _playerData;

        if (count _playerData == 0) exitWith {
            deleteVehicle (_this select 0);
        };

        if (count (_playerData select 1) == 0) exitWith {
            deleteVehicle (_this select 0);
        };

        if ((_playerData select 1) select 0 < 1) exitWith {
            deleteVehicle (_this select 0);
        };

        diag_log "Did not delete character";
    };
    false
}];

diag_log "SERVER: Compiling compile\_master.sqf";
_handle = [] execVM "\supremacy_server\compile\_master.sqf";
waitUntil {scriptDone _handle};

debugMode = (["debug_mode"] call SPMC_fnc_config);
publicVariable "debugMode";
diag_log format["Debug mode enabled: %1", debugMode];

diag_log "SERVER: Hiding map markers";
_handle = [] execVM "\supremacy_server\server\hideMarkers.sqf";
waitUntil {scriptDone _handle};

diag_log "SERVER: Setting up shops";
_handle = [] execVM "\supremacy_server\server\initShops.sqf";
waitUntil {scriptDone _handle};

diag_log "SERVER: Compiling 3rdparty\_master.sqf";
_handle = [] execVM "\supremacy_server\3rdparty\_master.sqf";
waitUntil {scriptDone _handle};

diag_log "SERVER: Establishing database connection.";
_handle = ["spmc","SQL_CUSTOM","spmc.ini"] execVM "\supremacy_server\3rdparty\extDB3\dbInit.sqf";
waitUntil {scriptDone _handle};

diag_log "SERVER: Running server setup.";
_handle = [] execVM "\supremacy_server\server\setup.sqf";
waitUntil {scriptDone _handle};