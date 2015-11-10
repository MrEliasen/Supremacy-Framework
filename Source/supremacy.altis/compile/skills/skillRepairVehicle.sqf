/**
 * skillRepairVehicle.sqf
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
private["_vehicle","_repairable"];
_vehicle = cursorTarget;
_repairable = false;

if(isNull _vehicle) exitwith {};

// Make sure the player is not trying to replair from inside the vehicle.
if (vehicle player != player) exitWith {};

// Check if the player have a toolkit or not
if(!("ToolKit" in (items player))) exitwith
{
    hint "You do not have any Tool Kits";
};

// Check if they are mechanic level 1 or higher.
if (!("mechanic-1" in SPMC_gbl_learnedSkills)) exitWith {
    hint "You do not have the required skill to repair this vehicle.";
};

// make sure the target is one of the repairable objects we allow.
{ 
    if(_vehicle isKindOF _x) exitwith {
        _repairable = true;
    }

} forEach ["Armored","Car","Support","Air","Submarine","Ship"];

if (!_repairable) exitwith {
    hint "You are not able to repair this type of object.";
};

_vehicle spawn {
    private ["_skillDetails"];
    for "_i" from 2 to 50 do {
        if (!(format ["mechanic-%1", _i] in SPMC_gbl_learnedSkills)) exitWith {
            _skillDetails = [format["medic-%1", (_i - 1)]] call SPMC_fnc_getSkillDetails;
        };
    };

    _handle = ["Attempting repair..", (_skillDetails select 5 select 0),"AinvPknlMstpSnonWnonDnon_medic_1"] spawn HGF_progressbar;
    waitUntil {(scriptDone _handle || (!alive _this))};

    // if they are alive we assume they where successful
    if ((alive _this) && (alive player)) then {
        if (SPMC_gbl_interrupt) then {
            SPMC_gbl_interrupt = false;
        } else {
            _this setDamage 0;
            hint "You successfully repaired the vehicle.";
        };
    } else {
        hint "This vehicle is destroyed and cannot be repaired.";
    };
};