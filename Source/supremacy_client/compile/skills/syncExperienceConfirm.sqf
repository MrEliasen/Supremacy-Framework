/**
 * syncExperienceConfirm.sqf
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

private ["_experience","_skills"];
_experience = [_this,0,0,[0]] call BIS_fnc_param;
_skills = [_this,1,[],[[]]] call BIS_fnc_param;

SPMC_gbl_experience = _experience;
SPMC_gbl_learnedSkills = _skills;