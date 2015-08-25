/**
 * vehicleSelected.sqf
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

private["_vehicle","_pricelist","_sellPercentage","_index","_value","_list","_display"];
_list = [_this,0,0,[0]] call BIS_fnc_param;
_display  = [_this,1,0,[0]] call BIS_fnc_param;

disableSerialization;

_vehicle = [lbData [_list, lbCurSel(_list)]] call SPMC_fnc_getItemCfgDetails;
_pricelist = ["item_prices"] call SPMC_fnc_config;
_index = [_vehicle, _pricelist] call SPMC_fnc_findIndex;
_value = 0;

if (_index != -1) then {
    _value = (_pricelist select _index) select 1;

    if (_list == 2602) then {
        _sellPercentage = ["sell_percentage"] call SPMC_fnc_config;
        _value = floor(_value / (_sellPercentage/100));
    };
};


((findDisplay 2600) displayCtrl _display) ctrlSetStructuredText parseText format[
"<img size='9' image='%1'/><br/>
Name: <t color='#ffae2b'>%2</t><br/>
Armor: <t color='#ffae2b'>%3</t><br/>
Max Speed: <t color='#ffae2b'>%4</t><br/>
Fuel Capacity: <t color='#ffae2b'>%5</t><br/>
Engine Power: <t color='#ffae2b'>%6</t><br/>
Price: <t color='#27e640'>$%7</t>",
(_vehicle select 3),
(_vehicle select 1),
(_vehicle select 8),
(_vehicle select 9),
(_vehicle select 10),
(_vehicle select 11),
[_value] call SPMC_fnc_numberToText];