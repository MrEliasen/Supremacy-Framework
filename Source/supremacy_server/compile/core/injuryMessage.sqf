/**
 * InjuryMessage.sqf
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

private["_killer","_victim"];
_victim = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_friendlyFire = [_this,2,false,[false]] call BIS_fnc_param;
_ff = ".";

if (_friendlyFire) then {
    _ff = " (friendly fire).";
};

systemChat format["%1 was injured by %2%3", name _victim, name _killer, _ff];