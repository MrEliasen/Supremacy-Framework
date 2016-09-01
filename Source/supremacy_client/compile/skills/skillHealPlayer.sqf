/**
 * skillHealPlayer.sqf
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
private["_target"];
_target = cursorTarget;

if ((isNull _target)) exitWith {
    hint "Target not found";
};

if (!(_target isKindOf "Man")) exitWith {
    hint "Target is not a player.";
};

if ((_target getVariable ["revivable",FALSE])) exitWith {};

// Check if they are medic level 1 or higher.
if (!("medic-1" in SPMC_gbl_learnedSkills)) exitWith {
    hint "You do not have the required skill to heal this soldier.";
};

// check if the player have a medikit or not
if(!("Medikit" in (items player))) exitWith {
    hint "You need a Medikit in order to healer others.";
};

_target spawn {
    private ["_skillDetails"];
    for "_i" from 2 to 50 do {
        if (!(format ["medic-%1", _i] in SPMC_gbl_learnedSkills)) exitWith {
            _skillDetails = [format["medic-%1", (_i - 1)]] call SPMC_fnc_getSkillDetails;
        };
    };

    _handle = ["Patching up target..", (_skillDetails select 5 select 0),"AinvPknlMstpSnonWnonDnon_medic_1"] spawn HGF_progressbar;
    waitUntil {(scriptDone _handle || !(alive _this))};

    if ((alive player) && (alive _this)) then {
        if (SPMC_gbl_interrupt) then {
            SPMC_gbl_interrupt = false;
        } else {
            _this setDamage 0;
            hint "You have healed the players wounds.";
        };
    };
};