/**
 * shop_menu_actions.sqf
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @package    Supremacy Framework
 * @author     Mark Eliasen <https://github.com/MrEliasen>
 * @copyright  2015 Mark Eliasen
 * @license    MIT License
 * @link       https://github.com/MrEliasen/SupremacyFramework
 */

SPMC_fnc_showArmsShop = compileFinal "
private[""_list"",""_type"",""_pricelist""];
_type = [_this,0,"""",[""""]] call BIS_fnc_param;

if (!alive player || dialog) exitWith {};

createDialog ""SPMC_shop_arms"";
disableSerialization;

waitUntil {sleep 0.1; !isNull (findDisplay 2300)};

_pricelist = [""item_prices""] call SPMC_fnc_config;
_list = (findDisplay 2300) displayCtrl 2301;
lbClear _list;

{
    _itemInfo = [_x] call SPMC_fnc_getItemCfgDetails;
    _index = [_x, _pricelist] call SPMC_fnc_findIndex;
    _value = 0;

    if (_index != -1) then {
        _value = (_pricelist select _index) select 1;
    };

    _list lbAdd (_itemInfo select 1);
    _list lbSetData[(lbSize _list) - 1, _x];
    _list lbSetValue[(lbSize _list) - 1, _value];
    _list lbSetPicture[(lbSize _list) - 1, (_itemInfo select 3)];

} foreach ([""shop_weapons""] call SPMC_fnc_config);";

SPMC_fnc_armsShopWeaponSelected = compileFinal "
private[""_item"",""_value"",""_ctrl"",""_list"",""_desc"",""_type"",""_caliber"",""_len""];
disableSerialization;

_item = [lbData [2301, lbCurSel(2301)]] call SPMC_fnc_getItemCfgDetails;
_value = floor(lbValue [2301, lbCurSel(2301)]);
_ctrl = (findDisplay 2300) displayCtrl 2305;

_list = (findDisplay 2300) displayCtrl 2302;
lbClear _list;

{
    _itemInfo = [_x] call SPMC_fnc_getItemCfgDetails;
    _list lbAdd format[""%1 (%2)"",(_itemInfo select 1),(_value / 10)];
    _list lbSetData[(lbSize _list) - 1, _x];
    _list lbSetValue[(lbSize _list) - 1, (_value / 10)];
    _list lbSetPicture[(lbSize _list) - 1, (_itemInfo select 3)];
} foreach (_item select 8);

_desc = [(_item select 2), "">""] call BIS_fnc_splitString;
_type = (_desc select 0);
_caliber = """";

if (count _desc > 1) then {
    _len = count (toArray _type) - 1;
    _type = [_type, 0, _len-4] call BIS_fnc_trimString;

    _len = count (toArray _type) - 1;
    if (([_type, _len] call BIS_fnc_trimString) == ""<"") then {
        _type = [_type, 0, _len - 1] call BIS_fnc_trimString;
    };

    _caliber = (_desc select 1);
    _caliber = format[""<br/>Caliber: <t color='#ffae2b'>%1</t>"", [_caliber, 9] call BIS_fnc_trimString];
};

_type = format[""<br/>Type: <t color='#ffae2b'>%1</t>"", _type];

_ctrl ctrlSetStructuredText parseText format[
""<img size='13' image='%1'/><br/><br/>Name: <t color='#ffae2b'>%2</t>%3%4<br/><br/>Price: <t color='#27e640'>$%5</t>"",
(_item select 3),
(_item select 1),
_type,
_caliber,
[_value] call fnc_numberToText];";

SPMC_fnc_armsShopBuyWeapon = compileFinal "
private [""_weapon"",""_price"",""_slot"",""_currentWeapon"",""_bought""];
_weapon = lbData [2301, lbCurSel(2301)];

if (_weapon == """") exitWith {};

_weapon = [_weapon] call SPMC_fnc_getItemCfgDetails;
_price = lbValue [2301, lbCurSel(2301)];
_slot = (_weapon select 5);
_bought = true;

if ((_weapon select 7) != ""CfgWeapons"") exitWith {hint ""That item cannot be sold from this type of shop."";};

switch (_slot) do {
    case 1: {
        _currentWeapon = primaryWeapon player;
    };
    case 2: {
        _currentWeapon = handgunWeapon player;
    };
    case 4: {
        _currentWeapon = secondaryWeapon player;
    };
};

if (_currentWeapon == """") then {
    player addWeapon (_weapon select 0);
    player selectWeapon (_weapon select 0);
} else {
    switch (true) do {
        case (player canAddItemToUniform (_weapon select 0)): {
            player addItemToUniform (_weapon select 0);
        };
        case (player canAddItemToVest (_weapon select 0)): {
            player addItemToVest (_weapon select 0);
        };
        case (player canAddItemToBackpack (_weapon select 0)): {
            player addItemToBackpack (_weapon select 0);
        };
        default {
            _bought = false;
        };
    };
};

if (!_bought) exitWith {
    player say3D ""error"";
    Hint ""You do not have enough room for weapon."";
};

player say3D ""purchase"";
hint format[""You have bought an """"%1"""" for $%2!"", (_weapon select 1), _price];";

SPMC_fnc_armsShopBuyAmmo = compileFinal "
private [""_ammo"",""_price"",""_slot"",""_currentWeapon""];
_ammo = lbData [2302, lbCurSel(2302)];

if (_ammo == """") exitWith {};

if (!(player canAddItemToBackpack _ammo) && !(player canAddItemToUniform _ammo) && !(player canAddItemToVest _ammo)) exitWith {
    player say3D ""error"";
    Hint ""You do not have enough room for that."";
};

_ammo = [_ammo] call SPMC_fnc_getItemCfgDetails;
_price = lbValue [2302, lbCurSel(2302)];

player addMagazine (_ammo select 0);

player say3D ""purchase_click"";
hint format[""You have bought """"%1"""" for $%2!"", (_ammo select 1), _price];";