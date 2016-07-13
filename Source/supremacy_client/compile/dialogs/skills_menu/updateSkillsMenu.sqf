/**
 * updateSkillsMenu.sqf
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
private ["_list"];
disableSerialization;

if (isNull (findDisplay 2800)) exitWith {};

_list = (findDisplay 2800) displayCtrl 2801;
lbClear _list;

{
    private ["_y","_c","_skillName"];
    _y = _x;

    if (typeName (_y select 0) == "STRING") then {
        _list lbAdd (_y select 1);
        _list lbSetData[(lbSize _list) - 1, (_y select 0)];
        _list lbSetValue[(lbSize _list) - 1, (_y select 4)];

        if ((_y select 0) in SPMC_gbl_learnedSkills) then {
            _list lbSetColor [(lbSize _list) - 1, [0,0.42,0.788,1]];
            _list lbSetPicture [(lbSize _list) - 1, "\A3\ui_f\data\map\markers\military\objective_CA.paa"];
            //_list lbSetPictureColor [(lbSize _list) - 1, [0,0.42,0.788,1]];
        } else {
            _list lbSetPicture [(lbSize _list) - 1, "\A3\ui_f\data\map\markers\military\circle_CA.paa"];
        };
    } else {
        _c = 0;
        {
            _skillName = (_x select 1);

            if(_c > 0) then {
                for [{_n=1},{_n<=(_c)},{_n=_n+1}] do {
                    _skillName = "--" + _skillName;
                };
            };

            _list lbAdd _skillName;
            _list lbSetData [(lbSize _list) - 1, (_x select 0)];
            _list lbSetValue[(lbSize _list) - 1, (_x select 4)];

            if ((_x select 0) in SPMC_gbl_learnedSkills) then {
                _list lbSetColor [(lbSize _list) - 1, [0,0.42,0.788,1]];
                _list lbSetPicture [(lbSize _list) - 1, "\A3\ui_f\data\map\markers\military\objective_CA.paa"];
                //_list lbSetPictureColor [(lbSize _list) - 1, [0,0.42,0.788,1]];
            } else {
                _list lbSetPicture [(lbSize _list) - 1, "\A3\ui_f\data\map\markers\military\circle_CA.paa"];
            };
            _c = _c + 1;

        } foreach _y;
    };

    //spacer between skills
    _list lbAdd "-----------------------------------";
    _list lbSetData [(lbSize _list)-1, ""];
    _list lbSetColor [(lbSize _list)-1, [1,1,1,0.2]];

} foreach ([] call SPMC_fnc_skillsList);

((findDisplay 2800) displayCtrl 2803) ctrlSetStructuredText parseText format[
"<t size='1.25'>Skills Learned: %1/%2 max.</t><br/><t size='1.25'>Experience Points: %3</t>",
(count SPMC_gbl_learnedSkills),
(["max_learned_skills"] call SPMC_fnc_config),
SPMC_gbl_experience];