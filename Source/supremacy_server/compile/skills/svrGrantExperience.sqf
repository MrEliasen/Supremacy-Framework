/**
 * svrGrantExperience.sqf
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

private["_player","_type","_expReward","_index","_playerExp","_playerSkills"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;

if (isNull _player) exitWith {};

_expReward = 0;

switch (_type) do {
    // how much experience should be granted for as kill.
    case 'kill': {
        _expReward = 1;
    };
};

_index = [getPlayerUID _player, serverPlayerSkills] call SPMC_fnc_findIndex;

if (_index == -1) exitWith {};

_playerExp = (((serverPlayerSkills select _index) select 1) select 0);
_playerSkills = (((serverPlayerSkills select _index) select 1) select 1);

serverPlayerSkills set [_index, [
    (getPlayerUID _player),
    [
        (_playerExp + _expReward),
        _playerSkills
    ]
]];

diag_log "------------ player skill array full (EXP) ------------";
diag_log str serverPlayerSkills;
diag_log "-------------------------------------------------------";

[_player, "experience", [(_playerExp + _expReward)], true] call SPMC_fnc_svrSyncPlayerData;
[[(_playerExp + _expReward), _playerSkills],"SPMC_fnc_syncExperienceConfirm",(owner _player),false] spawn BIS_fnc_MP;