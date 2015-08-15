/**
 * syncPlayerDataConfirm.sqf
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

private["_success","_silent"];
_success = [_this,0,false,[false]] call BIS_fnc_param;
_silent = [_this,1,false,[false]] call BIS_fnc_param;

if (!_silent) then {
    if (_success) then {
        hint "Player data saved.";
    } else {
        hint "Saving of player data failed.";
    };
};