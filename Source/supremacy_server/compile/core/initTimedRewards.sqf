/**
 * initTimedRewards.sqf
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

[] spawn {
    private ["_interval","_players","_expReward"];
    _interval = ["timed_rewards_interval"] call SPMC_fnc_config;
    _expReward = ["exp_reward_timed"] call SPMC_fnc_config;

    if (debugMode) then {
        diag_log format["Initiating timed rewards, at %1 seconds intervals.", _interval];
    };

    while {true} do {
        sleep _interval;

        if (serverIsReady) then {
            {
                private ["_return"];
                
                if (alive _x) then {
                    if(debugMode) then {
                        diag_log "------------ Timed Experience Request ------------";
                        diag_log format["Type: Timed, Amount: %1, Player: %2", _expReward, getPlayerUID _x];
                    };

                    _return = [_x, _expReward] call SPMC_fnc_grantExperience;

                    if (count _return < 3) exitWith {
                        if(debugMode) then {
                            diag_log "------------ Timed Experience Request ------------";
                            diag_log format["Status: DENIED, Player: %1", getPlayerUID _x];
                        };
                    };

                    if(debugMode) then {
                        diag_log "------------ Timed Experience Request ------------";
                        diag_log format["Status: APPROVED, Player: %1", getPlayerUID _x];
                        diag_log format["Return Data: %1", _return];
                    };

                    [[((_return select 0) + (_return select 1)), (_return select 2)],"SPMC_fnc_syncExperienceConfirm",(owner _x),false] spawn BIS_fnc_MP;
                    [_x, "experience", [((_return select 0) + (_return select 1))], true] spawn SPMC_fnc_svrSyncPlayerData;
                };

            } forEach (allPlayers - entities "HeadlessClient_F");

            [[format ["You have received %1 EXP for playing on the server.", _expReward], "reward"], "SPMC_fnc_serverNotification"] call BIS_fnc_mp;
        };
    };
};