/**
 * grantExperience.sqf
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

private["_player","_expReward","_index","_playerExp","_playerSkills"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_expReward = [_this,1,0,[0]] call BIS_fnc_param;
_return = [];

if (isNull _player) exitWith {
    _return;
};

_index = [getPlayerUID _player, serverPlayerSkills] call SPMC_fnc_findIndex;

if (_index == -1) exitWith {
    _return;
};

_playerExp = (((serverPlayerSkills select _index) select 1) select 0);
_playerSkills = (((serverPlayerSkills select _index) select 1) select 1);

serverPlayerSkills set [_index, [
    (getPlayerUID _player),
    [
        (_playerExp + _expReward),
        _playerSkills
    ]
]];

[_player, "experience", [(_playerExp + _expReward)], true] call SPMC_fnc_svrSyncPlayerData;

// return to the caller
_return = [
    _expReward,
    _playerExp,
    _playerSkills
];

_return;