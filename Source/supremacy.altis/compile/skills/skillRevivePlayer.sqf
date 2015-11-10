/**
 * skillRevivePlayer.sqf
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
private["_target"];
_target = cursorTarget;

if ((isNull _target)) exitWith {
    hint "Target not found";
};

if (!(_target isKindOf "Man")) exitWith {
    hint "Target is not a player.";
};

if (!(_target getVariable ["revivable",FALSE])) exitWith {
    hint "Target is not unconscious.";
};

// Check if they are medic level 2 or higher.
if (!("medic-2" in SPMC_gbl_learnedSkills)) exitWith {
    hint "You do not have the required skill to revive this player.";
};

// check if the player have a medikit or not
if(!("Medikit" in (items player))) exitWith {
    hint "You need a Medikit in order to revive a player.";
};

_target spawn {
    private ["_skillDetails"];
    for "_i" from 3 to 50 do {
        if (!(format ["medic-%1", _i] in SPMC_gbl_learnedSkills)) exitWith {
            _skillDetails = [format["medic-%1", (_i - 1)]] call SPMC_fnc_getSkillDetails;
        };
    };

    _this setVariable ["beingRevived", profileName, true];

    _handle = ["Attempting revival..", (_skillDetails select 5 select 1),"AinvPknlMstpSnonWnonDr_medic0"] spawn HGF_progressbar;
    waitUntil {scriptDone _handle};

    // if they are alive we assume they where successful
    if ((alive player)) then {
        if (SPMC_gbl_interrupt) then {
            SPMC_gbl_interrupt = false;
            _this setVariable ["beingRevived", "", true];
        } else {
            _this setVariable ["revived", true, true];
            hint "Your revival attempt was successful.";
        };
    };
};