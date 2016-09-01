/**
 * learnSkill.sqf
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

private ["_skill","_cost","_skillDetails","_c","_l"];
_skill = lbData [2801, lbCurSel(2801)];
_cost = lbValue [2801, lbCurSel(2801)];

if (_skill == "") exitWith {};

ctrlEnable[2804, false];

// get the skill details
_skillDetails = [_skill] call SPMC_fnc_getSkillDetails;

// Skill not found/invalid
if ((count _skillDetails) == 0) exitWith {
    ctrlEnable[2804, true];
};

// check if the user already have that skill
if (_skill in SPMC_gbl_learnedSkills) exitWith {
    [_skill,"owned",SPMC_gbl_experience,SPMC_gbl_learnedSkills] spawn SPMC_fnc_learnSkillConfirm;
};

if ((count SPMC_gbl_learnedSkills) >= (["max_learned_skills"] call SPMC_fnc_config)) exitWith {
    [_skill,"limit",SPMC_gbl_experience,SPMC_gbl_learnedSkills] spawn SPMC_fnc_learnSkillConfirm;
};

// Check if the player have the required skills.
_c = 0;
_l = 0;
{
    _c = _c + 1;
    if (_x in SPMC_gbl_learnedSkills) then {
        _l = _l + 1;
    };

} foreach (_skillDetails select 3);

if (_c != _l) exitWith {
    [_skill,"requirements",SPMC_gbl_experience,SPMC_gbl_learnedSkills] spawn SPMC_fnc_learnSkillConfirm;
};

// check if the user have enough available skill points
if (SPMC_gbl_experience < _cost) exitWith {
    [_skill,"points",SPMC_gbl_experience,SPMC_gbl_learnedSkills] spawn SPMC_fnc_learnSkillConfirm;
};

hint "Learning skill, please wait..";
[[player,_skill],"SPMC_fnc_svrLearnSkill",false,false] call BIS_fnc_MP;