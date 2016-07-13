/**
 * syncAnimation.sqf
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @package    Supremacy Framework
 * @author     Mark Eliasen <https://github.com/MrEliasen>
 * @copyright  2016 Mark Eliasen
 * @license    CC BY-NC 3.0 License
 * @link       https://github.com/MrEliasen/SupremacyFramework
 */

private["_unit","_animation","_type"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_animation = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"playMoveNow",["playMoveNow"]] call BIS_fnc_param;

if(isNull _unit) exitWith {};

switch (_type) do { 
    case "switchMove" : {
        _unit switchMove _animation;
    };

    case "playMove" : {
        _unit playMove _animation;
    };

    case "playMoveNow" : {
        _unit playMoveNow _animation;
    };

    case "playAction" : {
        _unit playAction _animation;
    };

    case "playActionNow" : {
        _unit playActionNow _animation;
    };
};