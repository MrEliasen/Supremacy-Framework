/**
 * armsShopItemSelected.sqf
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

private["_item","_pricelist","_index","_value","_listNo","_section"];
_section = [_this,0,"",[""]] call BIS_fnc_param;
_listNo = 0;

if(_section == "") exitWith {};

switch (_section) do {
    case "ammo": {
        _listNo = 2302;
    };
    case "attach": {
        _listNo = 2303;
    };
    case "acc": {
        _listNo = 2304;
    };
    case "spammo": {
        _listNo = 2305;
    };
    case "spattach": {
        _listNo = 2306;
    };
};

if(_listNo == 0) exitWith {};

disableSerialization;

_item = [lbData [_listNo, lbCurSel _listNo]] call SPMC_fnc_getItemCfgDetails;
_pricelist = ["item_prices"] call SPMC_fnc_config;
_index = [(_item select 0), _pricelist] call SPMC_fnc_findIndex;
_value = 0;

if (_index != -1) then {
    _value = (_pricelist select _index) select 1;
};

((findDisplay 2300) displayCtrl 2314) ctrlSetStructuredText parseText format[
"<img size='8' image='%1'/><br/>
Name: <t color='#ffae2b'>%2</t><br/>
Price: <t color='#27e640'>$%3</t>",
(_item select 3),
(_item select 1),
[_value] call fnc_numberToText];