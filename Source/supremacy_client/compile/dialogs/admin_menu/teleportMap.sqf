/**
 * teleportMap.sqf
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @package    Supremacy Framework
 * @author     Mark Eliasen <https://github.com/MrEliasen>
 * @copyright  2016 Mark Eliasen
 * @license    CC BY-NC 3.0 License
 * @link       https://github.com/MrEliasen/Supremacy-Framework
 */

if (!debugMode) exitWith {};

[] spawn {
    while {dialog} do {
        closeDialog 0;
        sleep 0.1;
    };
};

openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call SPMC_fnc_teleport";