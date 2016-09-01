/**
 * svrGiveExpReward.sqf
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

private["_player","_type","_expReward","_playerExp","_reply"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;

if (isNull _player) exitWith {};

_expReward = 0;

switch (_type) do {
    // how much experience should be granted for as kill.
    case 'kill': {
        _expReward = ["exp_reward_kills"] call SPMC_fnc_config;
    };
};

if(debugMode) then {
    diag_log "------------ Experience Request ------------";
    diag_log format["Type: %1, Amount: %2, Player: %3", _type, _expReward, getPlayerUID _player];
};

_reply = [_player, _expReward] call SPMC_fnc_grantExperience;

if (count _reply < 3) exitWith {
    if(debugMode) then {
        diag_log "------------ Experience Request ------------";
        diag_log format["Status: DENIED, Player: %1", getPlayerUID _player];
    };
};

if(debugMode) then {
    diag_log "------------ Experience Request ------------";
    diag_log format["Status: APPROVED, Player: %1", getPlayerUID _player];
};

[_player, "experience", [((_reply select 0) + (_reply select 1))], true] call SPMC_fnc_svrSyncPlayerData;
[[((_reply select 0) + (_reply select 1)), (_reply select 2)],"SPMC_fnc_syncExperienceConfirm",(owner _player),false] spawn BIS_fnc_MP;