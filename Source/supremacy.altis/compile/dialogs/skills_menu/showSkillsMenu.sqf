/**
 * showSkillsMenu.sqf
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

private ["_list","_learnedSkills"];
closeDialog 0;

if (!alive player) exitWith {};

disableSerialization;
createDialog "SPMC_skills_menu";
waitUntil {sleep 0.1; !isNull (findDisplay 2800)};

diag_log str SPMC_gbl_learnedSkills;

[] call SPMC_fnc_updateSkillsMenu;
