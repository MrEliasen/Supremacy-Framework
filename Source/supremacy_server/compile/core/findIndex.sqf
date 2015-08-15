/**
 * findIndex.sqf
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

private["_item","_array"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
_array = [_this,1,[],[[]]] call BIS_fnc_param;
_index = -1;

{
    if (typeName _x != "ARRAY") then {
        _x = [_x];
    };

    if(_item in _x) exitWith {
        _index = _forEachIndex;
    };
} foreach _array;

_index;