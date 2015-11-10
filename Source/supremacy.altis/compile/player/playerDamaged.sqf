/**
 * playerDamaged.sqf
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
private ["_unit","_part","_attacker","_projectile"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_attacker = _this select 3;
_projectile = _this select 4;
_total = 0;

if (SPMC_gbl_dmgTick == -1) then {
    [] spawn {
        SPMC_gbl_dmgTick = 2;
        while {SPMC_gbl_dmgTick >= 0} do {
            SPMC_gbl_dmgTick = SPMC_gbl_dmgTick - 1;
            sleep 1;
        };

        ["stats"] call SPMC_fnc_syncPlayerData;
    };
};

if (!(_part in ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r", ""])) exitWith {
    0.001
};

// if the unit is unconscious, they die when taking damage.
if ((_unit getVariable ["revivable", FALSE]) && (_unit getVariable ["executable", FALSE])) then {
    _damage = 1.0;
} else {
    if (_damage > 0.89 && (alive _unit)) then  {
        _unconsciousChance = 25;

        // If they have the figher skill line, they have a better chance of not dying out right,
        // but go into unconscious mode instead where they can be revived.
        if (("fighter-1" in SPMC_gbl_learnedSkills)) then {
            for "_i" from 2 to 50 do {
                if (!(format ["fighter-%1", _i] in SPMC_gbl_learnedSkills)) exitWith {
                    _unconsciousChance = ((([format ["fighter-%1", (_i - 1)]] call SPMC_fnc_getSkillDetails) select 5) select 0);
                };
            }; 
        };

        if ((random 100) <= _unconsciousChance) then {
            _damage = 0.89;

            if (!(player getVariable["revivable", false])) then {
                _unit call SPMC_fnc_playerUnconscious;
            };
        };
    };
};

_damage;