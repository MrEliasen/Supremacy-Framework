/**
 * playerUnconscious.sqf
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
private ["_unit","_friendlyFire"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_friendlyFire = false;

if (!(isPlayer _unit)) exitWith {};

if ([_killer] call SPMC_fnc_svrGetUnitSide == [_unit] call SPMC_fnc_svrGetUnitSide && [_killer] call SPMC_fnc_svrGetUnitSide != "GUER") then {
    _friendlyFire = true;
};

if (alive _unit) then {
    _unit allowDamage false;
    _unit setDamage 0.89;
    _unit setVariable ["beingRevived", "", true];
    _unit setVariable ["revived", false, true];
    _unit setVariable ["revivable", true, true];

    // if the player is in a vehicle, eject them
    if ((vehicle _unit) != _unit) then {
        unassignVehicle _unit;
        _unit action ["eject", (vehicle _unit)];

        waitUntil{((vehicle _unit) == _unit)};
    };

    _unit setUnconscious true;

    ["stats"] call SPMC_fnc_syncPlayerData;

    // Add blur effect
    SPMC_gbl_postEffect = ppEffectCreate ["dynamicBlur", 950];
    SPMC_gbl_postEffect ppEffectEnable true; 
    SPMC_gbl_postEffect ppEffectAdjust [5]; 
    SPMC_gbl_postEffect ppEffectCommit 0;

    // Close map and dialog if open.
    if (visibleMap) then {
        openMap false
    };

    closeDialog 0;

    if (isPlayer _unit && isPlayer _killer && _killer != _unit) then {
        [[_unit, _killer, _friendlyFire],"SPMC_fnc_svrInjuryMessage",false,false] spawn BIS_fnc_MP;
    };

    if (["executeable"] call SPMC_fnc_config) then {
        _unit spawn {
            sleep 2;
            _this allowDamage true;
            _this setVariable["executable", true];
        };
    };
};

["stats"] call SPMC_fnc_syncPlayerData;

if (_killer != _unit) then {
    // only grant the killer experience if its a player and if the player killed was not recently revived (within the past 2 minutes).
    if (isPlayer _killer && ((_unit getVariable ["killExpRewarded", 0]) == 0 || (time - (_unit getVariable ["killExpRewarded", 0]) >= ["kill_reward_cooldown"] call SPMC_fnc_config))) then {
        diag_log " :::::::::::::: YOU CAN AWARD EXP! :::::::::::::: ";

        if (!_friendlyFire) then {
            diag_log " :::::::::::::: SENDING REQUEST! :::::::::::::: ";
            _unit setVariable ["killExpRewarded", time];
            [[_killer, "kill", _unit],"SPMC_fnc_svrGiveExpReward",false,false] spawn BIS_fnc_MP;
        }
    };
};

disableSerialization;
createDialog "SPMC_death_screen";

_unit spawn {
    waitUntil {sleep 0.1; !isNull (findDisplay 3100)};
    // disable "esc" key.
    (findDisplay 3100) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];

    while {(alive _this)} do {
        // If the player was revived, end the loop.
        if (_this getVariable ["revived", false]) exitWith {};

        // If the player is being revived, show by who
        if ((_this getVariable ["beingRevived", ""]) != "") then {
            ((findDisplay 3100) displayCtrl 3102) ctrlSetStructuredText parseText format["<t align='center'>BEING REVIVED BY: </t><t color='#0087DB' align='center'>%1</t>", (_this getVariable ["beingRevived", ""])];
        } else {
            ((findDisplay 3100) displayCtrl 3102) ctrlSetStructuredText parseText "<t align='center'>AWAITING REVIVAL..</t>";
        };

        sleep 0.25;
    };

    // If the player was executed, end the loop.
    if (!(alive _this)) then {
        _this setVariable ["revivable", nil, true];

        0 cutText["YOU DIED","BLACK FADED"];
        0 cutFadeOut 9999999;

        if (SPMC_gbl_postEffect != -1) then {
            SPMC_gbl_postEffect ppEffectEnable false;
            ppEffectDestroy SPMC_gbl_postEffect;
            SPMC_gbl_postEffect = -1;
        }
    };

    // Check if the above loop ended because they got revived or not.
    if (!(_this getVariable ["revived", false]) || !(alive _this)) then {
        private ["_t"];
        SPMC_gbl_respawnTimer = time + (["respawn_time"] call SPMC_fnc_config);
        
        if (!(alive _this)) then {
            setPlayerRespawnTime ((["respawn_time"] call SPMC_fnc_config) + 10);
        };

        ctrlSetText [3103, ([30,"MM:SS.MS"] call BIS_fnc_secondsToString)];
        ctrlEnable [3101, false];
        ctrlShow [3101, false];
        ((findDisplay 3100) displayCtrl 3102) ctrlSetStructuredText parseText "";

        while {true} do {
            _t = (SPMC_gbl_respawnTimer - time);

            if (_t <= 0) exitWith {
                setPlayerRespawnTime 2;
            };

            ctrlSetText [3103, ([_t,"MM:SS.MS"] call BIS_fnc_secondsToString)];
            ctrlEnable [3101, false];

            sleep 0.11;
        };
    } else {
        // They got revived, so we reset their medical stats and sync it.
        _this setDamage 0.65;

        [] call SPMC_fnc_resetMedicalVars;
        ["stats"] call SPMC_fnc_syncPlayerData;
    };

    (findDisplay 3100) displayRemoveAllEventHandlers "KeyDown";
    closeDialog 0;
};