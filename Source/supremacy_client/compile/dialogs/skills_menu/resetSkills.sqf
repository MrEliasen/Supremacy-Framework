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
 * @link       https://github.com/MrEliasen/SupremacyFramework
 */

private ["_confirm","_cost","_skillDetails"];

_confirm = [
    "You will NOTE be refunded the EXP you have spend. Are you sure you wish to reset your skills?",
    "RESET SKILLS?",
    "Yes, RESET",
    "Cancel"
] call BIS_fnc_guiMessage;

if (!_confirm) exitWith {};

ctrlEnable[2804, false];
ctrlEnable[2805, false];
hint "Resetting your skills, please wait..";

[[player],"SPMC_fnc_svrResetSkills",false,false] call BIS_fnc_MP;