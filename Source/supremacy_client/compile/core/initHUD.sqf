/**
 * initHUD.hpp
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @package    Supremacy Framework
 * @author     Mark Eliasen <https://github.com/MrEliasen>
 * @copyright  2016 Mark Eliasen
 * @license    CC BY-NC 3.0 License
 * @link       https://github.com/MrEliasen/SupremacyFramework
 */

[] spawn
{
    private["_display"];
    disableSerialization;
    0 cutRsc ["SPMC_hud", "PLAIN"];

    _display = uiNameSpace getVariable ["SPMC_hud", displayNull];

    while {!(isNull _display)} do
    {
        (_display displayCtrl 2001) ctrlSetText format["%1", (round diag_fps)];
        (_display displayCtrl 2002) ctrlSetText format["%1", (round((1 - (damage player)) * 100))];
        (_display displayCtrl 2004) ctrlSetText format["%1", ([SPMC_gbl_money] call SPMC_fnc_numberToText)];
        sleep 0.25;
    };
};