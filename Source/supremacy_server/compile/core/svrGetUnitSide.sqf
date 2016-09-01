/**
 * svrGetUnitSide.sqf
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
private ["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_return = "";

if (isNull _unit) exitWith {
    _return;
};

if (_unit == player) then {
    _return = str playerSide;
} else {
    _return = str (side _unit);
};

_return;