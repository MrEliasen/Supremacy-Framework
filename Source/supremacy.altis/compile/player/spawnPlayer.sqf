/**
 * spawnPlayer.sqf
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

private["_pos"];
_pos = (_this select 0);
player enablesimulation true;

if (!(isNull SPMC_gbl_camera)) then {
    SPMC_gbl_camera cameraEffect ["TERMINATE","BACK"];
    camDestroy SPMC_gbl_camera;
};

if (debugMode) then {
    diag_log format["Set Pos: %1", _pos];
};

player setPos _pos;

if (dialog) then {
    closeDialog 0;
};

sleep 1;

[] call SPMC_fnc_initHUD;
player setPos _pos;

0 cutText ["","BLACK IN"];

["everything"] call SPMC_fnc_syncPlayerData;

if (debugMode) then {
    diag_log "Player Spawned.";
};