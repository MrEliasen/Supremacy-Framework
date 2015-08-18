/**
 * playerMenuShow.sqf
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
private ["_stamina","_sync","_syncMins"];

if (!isNull (findDisplay 1900)) then {
    // Update the health
    ((findDisplay 1900) displayCtrl 1901) ctrlSetStructuredText parseText format[
    "<br/><t align='center' size='4.4' font='PuristaSemiBold'>%1%2</t><br/><t align='center' size='1.8' font='PuristaMedium'>HEALTH</t>",
    (round((1 - (damage player)) * 100)),
    "%"];

    _stamina = "Inf.";
    if ((["fatigue_enabled"] call SPMC_fnc_config)) then {
        _stamina = format["%1%2", (100 - ((round ((getFatigue player) * 3) / (10 ^ 3)) * 100)), "%"];
    };

    // Update the Stamina
    ((findDisplay 1900) displayCtrl 1902) ctrlSetStructuredText parseText format[
    "<br/><t align='center' size='4.4' font='PuristaSemiBold'>%1</t><br/><t align='center' size='1.8' font='PuristaMedium'>STAMINA</t>",
    _stamina];

    // Update the money
    ((findDisplay 1900) displayCtrl 1903) ctrlSetStructuredText parseText format[
    "<br/><t align='center' size='4.4' font='PuristaSemiBold'>%1</t><br/><t align='center' size='1.8' font='PuristaMedium'>MONEY</t>",
    SPMC_gbl_money];

    _sync = "";
    if (SPMC_gbl_lastSync < 60) then {
        _sync = "less than a minute ago.";
    } else {
        _syncMins = floor(SPMC_gbl_lastSync / 60);
        if (_syncMins > 1) then {
            _sync = format["%1 minutes ago.", _syncMins];
        } else {
            _sync = format["%1 minute ago.", _syncMins];
        };
    };

    // Update the last sync timer
    ((findDisplay 1900) displayCtrl 1904) ctrlSetStructuredText parseText format[
    "<t align='center' size='1.25'>Last full sync: %1</t>",
    _sync];
};