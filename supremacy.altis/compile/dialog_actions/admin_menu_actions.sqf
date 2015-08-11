/**
 * admin_menu_actions.sqf
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

SPMC_fnc_showDevMenu = compileFinal "
if (!alive player || dialog) exitWith {};
createDialog ""SPMC_admin_menu"";
disableSerialization;";

SPMC_admin_teleport = compileFinal "
if (!debugMode) exitWith {};

private [""_pos""];
_pos = [_this select 0, _this select 1, _this select 2];
(vehicle player) setpos [_pos select 0, _pos select 1, 0];
onMapSingleClick """";
openMap [false, false];";

SPMC_admin_teleportMap = compileFinal "
if (!debugMode) exitWith {};

[] spawn {
    while {dialog} do {
        closeDialog 0;
        sleep 0.1;
    };
};

openMap [true, false];
onMapSingleClick ""[_pos select 0, _pos select 1, _pos select 2] call SPMC_admin_teleport"";";