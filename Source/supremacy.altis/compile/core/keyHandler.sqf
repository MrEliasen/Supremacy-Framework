/**
 * keyHandler.sqf
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
private ["_shift","_alt","_code","_ctrl","_ctrlKey","_veh"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;

//A,S,W,D will interrupt progressbar.
if((player getVariable ["isBusy",false]) && _code in [17,30,31,32]) then {
    SPMC_gbl_interrupt = true;
};

false;