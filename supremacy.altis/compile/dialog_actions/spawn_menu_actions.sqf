/**
 * spawn_menu_actions.sqf
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
private[""_list""];

0 cutText["""",""BLACK FADED""];
0 cutFadeOut 9999999;

createDialog ""SPMC_spawn_menu"";
disableSerialization;

waitUntil {sleep 0.1; !isNull (findDisplay 2100)};
(findDisplay 2100) displayAddEventHandler [""KeyDown"", ""if ((_this select 1) == 1) then { true }""]; 

_list = (findDisplay 2100) displayCtrl 2102;

lbClear _list;

{
	_list lbAdd (_x select 1);
	_list lbSetdata [(lbSize _list)-1, (_x select 0)];

} foreach ([""spawn_points""] call SPMC_fnc_config);";

// Will change the map position on the spawn menu to the point selected on the list
SPMC_fnc_pointSelected = compileFinal "
private[""_control"",""_position""];
disableSerialization;

_position = lbData [2102, lbCurSel(2102)];
_control = (findDisplay 2100) displayCtrl 2103;

_control ctrlMapAnimAdd[0.5,0.15,getMarkerPos _position];
ctrlMapAnimCommit _control;";

// Will spawn the player randomly within the spawn marker area
SPMC_fnc_chooseSpawnPoint = compileFinal "
private[""_data"",""_pos""];
disableSerialization;

_data = lbData [2102, lbCurSel(2102)];

if (_data == """") exitWith {hint ""You must select a place to spawn.""};

(findDisplay 2100) displayRemoveAllEventHandlers ""KeyDown""; 

_pos = [_data, 0, [], (getMarkerSize _data) select 0, (typeof player)] call SHK_pos;
closeDialog 0;

[_pos] call SPMC_fnc_spawnPlayer;";