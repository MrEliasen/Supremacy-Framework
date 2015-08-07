/**
 * dialogs.sqf
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
SPMC_fnc_showSpawnMenu = compileFinal "
private[""_list"",""_dialog""];

disableSerialization;
_dialog = createDialog ""SPMC_spawn_menu"";

waitUntil {sleep 0.1; !isNull (findDisplay 2100)};
(findDisplay 2100) displayAddEventHandler [""KeyDown"", ""if ((_this select 1) == 1) then { true }""]; 

_list = (findDisplay 2100) displayCtrl 2102;

lbClear _list;

{
	_list lbAdd (_x select 1);
	_list lbSetdata [(lbSize _list)-1, (_x select 0)];

} foreach ([""spawn_points""] call SPMC_fnc_config);";

SPMC_fnc_spawnSelected = compileFinal "
private[""_data"",""_pos""];
_data = lbData [2102, lbCurSel(2102)];

(findDisplay 2100) displayRemoveAllEventHandlers ""KeyDown""; 

_pos = [_data, 0, [], (getMarkerSize _data) select 0, (typeof player)] call SHK_pos;
closeDialog 0;

[_pos] call SPMC_fnc_spawnPlayer;";

SPMC_fnc_showDevMenu = compileFinal "
if (!alive player || dialog) exitWith {};
createDialog ""SPMC_admin_menu"";
disableSerialization;";