/**
 * chooseSpawnPoint.sqf
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

private["_data","_pos"];
disableSerialization;

_data = lbData [2102, lbCurSel(2102)];

if (_data == "") exitWith {hint "You must select a place to spawn."};

(findDisplay 2100) displayRemoveAllEventHandlers "KeyDown"; 

_pos = [_data, 0, [], (getMarkerSize _data) select 0, (typeof player)] call SHK_pos;
closeDialog 0;

[_pos] call SPMC_fnc_spawnPlayer;