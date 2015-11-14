/**
 * resetMedicalVars.sqf
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

// Reset any medical variables.
player setVariable ["respawning", nil, true];
player setVariable ["beingRevived", nil, true];
player setVariable ["revived", nil, true];
player setVariable ["revivable", nil, true];
player setVariable ["executable", nil];
//player setVariable ["recentlyRevived", nil];
player setVariable ["isBusy", nil];
player allowDamage true;
player setCaptive false;
player setUnconscious false;

if (!(isNull SPMC_gbl_corpse)) then {
    SPMC_gbl_corpse setVariable ["revivable", nil, true];
    SPMC_gbl_corpse setVariable ["respawning", nil, true];
    SPMC_gbl_corpse setVariable ["beingRevived", nil, true];
    SPMC_gbl_corpse setVariable ["revived", nil, true];
    SPMC_gbl_corpse setVariable ["executable", nil];
    SPMC_gbl_corpse setVariable ["recentlyRevived", nil];
    SPMC_gbl_corpse removeAllEventHandlers "Killed";
    SPMC_gbl_corpse removeAllEventHandlers "HandleDamage";
    removeAllActions SPMC_gbl_corpse;
};