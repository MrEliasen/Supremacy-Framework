/**
 * vehicleShopBuy.sqf
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

private["_vehicle","_spawn"];
disableSerialization;
ctrlEnable[2605, false];
_vehicle = [lbData [2601, lbCurSel(2601)]] call SPMC_fnc_getItemCfgDetails;
_spawn = "";

{
    private ["_units"];
    _units = nearestObjects[(getMarkerPos _x),["car","tank","armored","support","truck","air","ship","submarine","man"],8];

    if ((count _units) == 0) exitWith {
        _spawn = _x
    };
} foreach (SPMC_gbl_vehicleShop select 1);

if (_spawn == "") exitWith {
    hint "No free vehicle spawn point. Unable to puchase vehicle.";
    ctrlEnable[2605, true];
};

[(_vehicle select 0),2605,"vehicle",_spawn] call SPMC_fnc_syncPurchase;