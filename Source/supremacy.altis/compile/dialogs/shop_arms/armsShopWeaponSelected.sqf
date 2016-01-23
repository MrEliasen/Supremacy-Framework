/**
 * armsShopWeaponSelected.sqf
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

private["_item","_value","_list","_desc","_type","_caliber","_misc","_len","_pricelist","_skillDiscount"];
disableSerialization;
_skillDiscount = 1.0;

// Update the price if the player have the Silver Tongue skill line
if (("silver-1" in SPMC_gbl_learnedSkills)) then {
    for "_i" from 2 to 50 do {
        if (!(format ["silver-%1", _i] in SPMC_gbl_learnedSkills)) exitWith {
            _skillDiscount = ([format["silver-%1", (_i - 1)]] call SPMC_fnc_getSkillDetails select 5) select 0;
        };
    };
};

_skillDiscount = (1.0 - _skillDiscount / 100);

_item = [lbData [2301, lbCurSel(2301)]] call SPMC_fnc_getItemCfgDetails;
_pricelist = ["item_prices"] call SPMC_fnc_config;
_value = (floor(lbValue [2301, lbCurSel(2301)]) * _skillDiscount) * _skillDiscount;

_list = (findDisplay 2300) displayCtrl 2305;
lbClear _list;
{
    private["_itemInfo","_value"];
    _itemInfo = [_x] call SPMC_fnc_getItemCfgDetails;
    _index = [_x, _pricelist] call SPMC_fnc_findIndex;
    _value = 0;

    if (_index != -1) then {
        _value = ((_pricelist select _index) select 1) * _skillDiscount;
    };

    _list lbAdd (_itemInfo select 1);
    _list lbSetData[(lbSize _list) - 1, _x];
    _list lbSetValue[(lbSize _list) - 1, _value];
    _list lbSetPicture[(lbSize _list) - 1, (_itemInfo select 3)];
} foreach (_item select 8);

_list = (findDisplay 2300) displayCtrl 2306;
lbClear _list;
{   
    private ["_y"];
    _y = _x;

    {
        private["_itemInfo","_value"];
        _itemInfo = [_x] call SPMC_fnc_getItemCfgDetails;
        _index = [_x, _pricelist] call SPMC_fnc_findIndex;
        _value = 0;

        if (_index != -1) then {
            _value = ((_pricelist select _index) select 1) * _skillDiscount;
        };

        _list lbAdd (_itemInfo select 1);
        _list lbSetData[(lbSize _list) - 1, _x];
        _list lbSetValue[(lbSize _list) - 1, _value];
        _list lbSetPicture[(lbSize _list) - 1, (_itemInfo select 3)];
    } foreach _y;
} foreach (_item select 10);

_desc = [(_item select 2), ">"] call BIS_fnc_splitString;
_type = (_desc select 0);
_caliber = "";
_misc = "";

if (count _desc > 1) then {
    _len = count (toArray _type) - 1;
    _type = [_type, 0, _len-4] call BIS_fnc_trimString;

    _len = count (toArray _type) - 1;
    if (([_type, _len] call BIS_fnc_trimString) == "<") then {
        _type = [_type, 0, _len - 1] call BIS_fnc_trimString;
    };
    
    if ("Launcher" in ([_type, " "] call BIS_fnc_splitString)) then {
        _caliber = [(_desc select 1), 6] call BIS_fnc_trimString;
    }else {
        _caliber = [(_desc select 1), 9] call BIS_fnc_trimString;
    };

    _len = count (toArray _caliber) - 1;

    if (([_caliber, _len] call BIS_fnc_trimString) == "/") then {
        _caliber = [_caliber, 0, _len - 5] call BIS_fnc_trimString;
    };
    
    _caliber = format["<br/>Caliber: <t color='#ffae2b'>%1</t>", _caliber];

    if (count _desc == 4) then {
        _misc = [(_desc select 2), 0, count (toArray (_desc select 2)) - 6] call BIS_fnc_trimString;
        if (_misc == "Grenade Launcher") then {
            _misc = format[" <t color='#ffae2b' size='0.70'>(%1 %2)</t>", [(_desc select 3), 9] call BIS_fnc_trimString, _misc];
            _caliber = format["%1%2", _caliber, _misc];
        };
    };
};

_type = format["<br/>Type: <t color='#ffae2b'>%1</t>", _type];

((findDisplay 2300) displayCtrl 2314) ctrlSetStructuredText parseText format[
"<img size='8' image='%1'/><br/>Name: <t color='#ffae2b'>%2</t>%3%4<br/>Price: <t color='#27e640'>%5%6</t>",
(_item select 3),
(_item select 1),
_type,
_caliber,
['currency_symbol'] call SPMC_fnc_config,
[_value] call SPMC_fnc_numberToText];