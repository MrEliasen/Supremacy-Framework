/**
 * resetSkillsConfirm.sqf
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

private ["_experience","_skilllist"];
_experience = [_this,0,0,[0]] call BIS_fnc_param;

SPMC_gbl_learnedSkills = [];
SPMC_gbl_experience = _experience;

hint "Your skills have been reset.";

[] call SPMC_fnc_updateSkillsMenu;

if (!isNull (findDisplay 2800)) then {
    ctrlEnable[2804, true];
    ctrlEnable[2805, true];
};