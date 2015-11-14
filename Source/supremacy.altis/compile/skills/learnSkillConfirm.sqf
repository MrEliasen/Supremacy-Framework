/**
 * learnSkillConfirm.sqf
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

private ["_skill","_status","_experience","_skilllist"];
_skill = [_this,0,"",[""]] call BIS_fnc_param;
_status = [_this,1,"",[""]] call BIS_fnc_param;
_experience = [_this,2,0,[0]] call BIS_fnc_param;
_skilllist = [_this,3,[],[[]]] call BIS_fnc_param;

if (_skill == "" || _status == "") exitWith {
    if (!isNull (findDisplay 2800)) then { 
        ctrlEnable[2804, true];
    };
};

// get the skill details
_skillDetails = [_skill] call SPMC_fnc_getSkillDetails;

SPMC_gbl_learnedSkills = _skilllist;
SPMC_gbl_experience = _experience;

// Skill not found/invalid
if (count _skillDetails == 0) exitWith {
    if (!isNull (findDisplay 2800)) then {
        ctrlEnable[2804, true];
    };
};

[] call SPMC_fnc_updateSkillsMenu;

switch (_status) do {
    case "owned": {
        hint format["You have already learned the ""%1"" skill.", (_skillDetails select 1)];
        player say3D "error";
    };

    case "requirements": {
        hint format["You do not meet the requirements to learn the ""%1"" skill.", (_skillDetails select 1)];
        player say3D "error";
    };
    
    case "points": {
        hint format["You do not have enough experience to learn the ""%1"" skill.", (_skillDetails select 1)];
        player say3D "error";
    };
    
    case "limit": {
        hint format["You have learned the maximum number of skills allowed (%1). You cannot learn any more skills.", (["max_learned_skills"] call SPMC_fnc_config)];
        player say3D "error";
    };
    
    case "success": {
        hint format["You learned the ""%1""skill.", (_skillDetails select 1)];
        player say3D "skill_learned";
        sleep 1.2;
    };
};

if (!isNull (findDisplay 2800)) then { 
    ctrlEnable[2804, true];
};