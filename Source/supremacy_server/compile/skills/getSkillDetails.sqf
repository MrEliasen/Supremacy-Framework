/**
 * getSkillDetails.sqf
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
private ["_skill"];
_skill = [_this,0,"",[""]] call BIS_fnc_param;
_skillDetails = [];

{
    if (typeName (_x select 0) == "STRING") then {
        if ((_x select 0) == _skill) exitWith {
            _skillDetails = _x;
        };
    } else {
        private ["_y"];
        _y = _x;

        {
            if ((_x select 0) == _skill) exitWith {
                _skillDetails = _x;
            };
        } foreach _y;
    };

    if (count _skillDetails != 0) exitWith  {};

} foreach ([] call SPMC_fnc_skillsList);

_skillDetails;