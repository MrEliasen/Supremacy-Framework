/**
 * showSpawnMenu.sqf
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

private["_list"];
0 cutText["","BLACK FADED"];
0 cutFadeOut 9999999;
createDialog "SPMC_spawn_menu";
disableSerialization;
waitUntil {sleep 0.1; !isNull (findDisplay 2100)};
(findDisplay 2100) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"]; 
_list = (findDisplay 2100) displayCtrl 2102;
lbClear _list;
{
    _list lbAdd (_x select 1);
    _list lbSetdata [(lbSize _list)-1, (_x select 0)];
} foreach (["spawn_points"] call SPMC_fnc_config);