/**
 * init.sqf
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @package    Supremacy Framework
 * @author     Mark Eliasen <https://github.com/MrEliasen>
 * @copyright  2015 Mark Eliasen
 * @license    MIT License
 * @link       https://github.com/MrEliasen/SupremacyFramework
 */

enableSaving [false, false];
serverIsReady = false;
publicVariable "serverIsReady";

serverStatus = "";
publicVariable "serverStatus";

diag_log "SERVER: Compiling compile\_master.sqf";
_handle = [] execVM "\supremacy_server\compile\_master.sqf";
waitUntil {scriptDone _handle};

debugMode = (["debug_mode"] call SPMC_fnc_config);
publicVariable "debugMode";

diag_log "SERVER: Hiding map markers";
_handle = [] execVM "\supremacy_server\server\hideMarkers.sqf";
waitUntil {scriptDone _handle};

diag_log "SERVER: Compiling 3rdparty\_master.sqf";
_handle = [] execVM "\supremacy_server\3rdparty\_master.sqf";
waitUntil {scriptDone _handle};

diag_log "SERVER: Running server setup.";
_handle = [] execVM "\supremacy_server\server\setup.sqf";
waitUntil {scriptDone _handle};

diag_log "SERVER: Ready!";
serverIsReady = true;
publicVariable "serverIsReady";