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

_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

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

_damage;