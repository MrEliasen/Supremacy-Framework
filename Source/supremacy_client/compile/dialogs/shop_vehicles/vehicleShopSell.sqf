/**
 * vehicleShopSell.sqf
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

private["_vehicle","_empty"];
disableSerialization;
ctrlEnable[2606, false];
_vehicle = [lbData [2602, lbCurSel(2602)]] call SPMC_fnc_getItemCfgDetails;
_price = -1;
_veh = objNull;

{
    if (typeOf _x == (_vehicle select 0)) exitWith {
        _veh = _x;
    };
} foreach (nearestObjects[player,(SPMC_gbl_vehicleShop select 2),10]);

if (isNull _veh) exitWith {
    ctrlEnable[2606, true];
};

_empty = true;
{
    if (alive _x) exitWith {
        _empty = false;
    };
} forEach (crew _veh);

if (!_empty) exitWith {
    ctrlEnable[2606, true];
    hint "You cannot sell a vehicle while its occupied.";
};

[_veh, 2606] call SPMC_fnc_syncSale;