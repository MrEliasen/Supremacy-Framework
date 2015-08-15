/**
 * vehicleShopSell.sqf
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

private["_vehicle","_pricelist","_index","_spawn","_empty"];
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
    _price;
};

_pricelist = ["item_prices"] call SPMC_fnc_config;
_index = [_x, _pricelist] call SPMC_fnc_findIndex;
if (_index != -1) then {
    _price = (((_pricelist select _index) select 1) / 2);
} else {
    _price = 0;
};

deleteVehicle _veh;
lbDelete [2602, lbCurSel(2602)];

hint format["%1 sold for $%2!", (_vehicle select 1), _price];

[] spawn {
    player say3D "sold_item";
    sleep 0.2;
    ctrlEnable[2606, true];
};

_price;