/**
 * svrLearnSkill.sqf
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
private ["_skill","_player","_playerSkills","_playerExp","_skillDetails","_index","_newSkillArray","_c","_l"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_skill = [_this,1,"",[""]] call BIS_fnc_param;
_skillDetails = [];
_playerSkills = [];
_playerExp = 0;

if (isNull _player || _skill == "") exitWith {};

_index = [getPlayerUID _player, serverPlayerSkills] call SPMC_fnc_findIndex;

if (_index != -1) then {
    _playerExp = (((serverPlayerSkills select _index) select 1) select 0);
    _playerSkills = (((serverPlayerSkills select _index) select 1) select 1);

    if (typeName _playerSkills != "ARRAY") then {
        _playerSkills = [];
    };

    if (typeName _playerExp != "SCALAR") then {
        _playerExp = 0;
    };
};

// get the skill details
_skillDetails = [_skill] call SPMC_fnc_getSkillDetails;

// Skill not found/invalid
if (count _skillDetails == 0) exitWith {};

// check if the user already have that skill
if (_skill in _playerSkills) exitWith {
    [[_skill,"owned",_playerExp,_playerSkills],"SPMC_fnc_learnSkillConfirm",(owner _player),false] spawn BIS_fnc_MP;
};

if ((count _playerSkills) >= (["max_learned_skills"] call SPMC_fnc_config)) exitWith {
    [[_skill,"limit",_playerExp,_playerSkills],"SPMC_fnc_learnSkillConfirm",(owner _player),false] spawn BIS_fnc_MP;
};

// Check if the player have the required skills.
_c = 0;
_l = 0;
{
    _c = _c + 1;
    if (_x in _playerSkills) then {
        _l = _l + 1;
    };
} foreach (_skillDetails select 3);

if (_c != _l) exitWith {
    [[_skill,"requirements",_playerExp,_playerSkills],"SPMC_fnc_learnSkillConfirm",(owner _player),false] spawn BIS_fnc_MP;
};

// check if the user have enough available skill points
if (_playerExp < (_skillDetails select 4)) exitWith {
    [[_skill,"points",_playerExp,_playerSkills],"SPMC_fnc_learnSkillConfirm",(owner _player),false] spawn BIS_fnc_MP;
};

// Update the player's skill array.
serverPlayerSkills set [_index, [
    (getPlayerUID _player),
    [
        (_playerExp - (_skillDetails select 4)),
        (_playerSkills + [_skill])
    ]
]];

[_player, "skills", [(_playerSkills + [_skill])], true] call SPMC_fnc_svrSyncPlayerData;

if(debugMode) then {
    diag_log "------------ player skill array full (LEARN) ------------";
    diag_log format["%1", serverPlayerSkills];
    diag_log "---------------------------------------------------------";
};

[[_skill,"success",(_playerExp - (_skillDetails select 4)),(_playerSkills + [_skill])],"SPMC_fnc_learnSkillConfirm",(owner _player),false] spawn BIS_fnc_MP;