/**
 * svrLearnSkill.sqf
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
private ["_skill","_player","_playerSkills","_skillDetails","_index","_newSkillArray","_c"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (isNull _player) exitWith {};

_index = [getPlayerUID _player, serverPlayerSkills] call SPMC_fnc_findIndex;

if (_index == -1) exitWith {};

_playerSkills = ((serverPlayerSkills select _index) select 1);

// Update the player's skill array.
serverPlayerSkills set [_index, [
    (getPlayerUID _player),
    [
        (_playerSkills select 0),
        []
    ]
]];

[_player, "skills", [[]], true] call SPMC_fnc_svrSyncPlayerData;

diag_log "------------ player skill array full (RESET) ------------";
diag_log format["%1", serverPlayerSkills];
diag_log "---------------------------------------------------------";

[[(_playerSkills select 0)],"SPMC_fnc_resetSkillsConfirm",(owner _player),false] spawn BIS_fnc_MP;