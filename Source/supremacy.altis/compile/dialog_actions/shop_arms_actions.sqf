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
private[""_plist""];
if (!alive player || dialog) exitWith {};

createDialog ""SPMC_shop_arms"";
disableSerialization;

waitUntil {sleep 0.1; !isNull (findDisplay 2300)};
_plist = [""item_prices""] call SPMC_fnc_config;

[_plist] spawn {
    private[""_pricelist"",""_list""];
    _pricelist = [_this,0,[],[[]]] call BIS_fnc_param;
    disableSerialization;

    _list = (findDisplay 2300) displayCtrl 2302;
    lbClear _list;

    {
        private [""_ammoInfo"",""_value""];
        _ammoInfo = [_x] call SPMC_fnc_getItemCfgDetails;
        _index = [_x, _pricelist] call SPMC_fnc_findIndex;
        _value = 0;

        if (_index != -1) then {
            _value = (_pricelist select _index) select 1;
        };

        _list lbAdd (_ammoInfo select 1);
        _list lbSetData[(lbSize _list) - 1, _x];
        _list lbSetValue[(lbSize _list) - 1, _value];
        _list lbSetPicture[(lbSize _list) - 1, (_ammoInfo select 3)];

    } foreach ([""equip_throwables""] call SPMC_fnc_config);
};


[_plist] spawn {
    private[""_pricelist"",""_list"",""_ammoC"",""_temp""];
    _pricelist = [_this,0,[],[[]]] call BIS_fnc_param;
    disableSerialization;

    _list = (findDisplay 2300) displayCtrl 2301;
    _temp = (findDisplay 2300) displayCtrl 2302;
    lbClear _list;
    _ammoC = [];

    {
        private [""_itemInfo"",""_y"",""_value""];
        _y = _x;
        _itemInfo = [_y] call SPMC_fnc_getItemCfgDetails;
        _index = [_y, _pricelist] call SPMC_fnc_findIndex;
        _value = 0;

        if (_index != -1) then {
            _value = (_pricelist select _index) select 1;
        };

        _list lbAdd (_itemInfo select 1);
        _list lbSetData[(lbSize _list) - 1, _y];
        _list lbSetValue[(lbSize _list) - 1, _value];
        _list lbSetPicture[(lbSize _list) - 1, (_itemInfo select 3)];

        if ((_itemInfo select 0) == currentWeapon player) then {
            lbSetCurSel[2301, (lbSize _list) - 1];
        };

        {
            private [""_ammoInfo"",""_value""];
            _ammoInfo = [_x] call SPMC_fnc_getItemCfgDetails;
            _value = 0;

            if (!(_x in _ammoC)) then {
                if (([_x, _pricelist] call SPMC_fnc_findIndex) != -1) then {
                    _value = (_pricelist select _index) select 1;
                };

                _ammoC = _ammoC + [_x];
                _temp lbAdd (_ammoInfo select 1);
                _temp lbSetData[(lbSize _temp) - 1, _x];
                _temp lbSetValue[(lbSize _temp) - 1, _value];
                _temp lbSetPicture[(lbSize _temp) - 1, (_ammoInfo select 3)];
            };
        } foreach (_itemInfo select 8);

    } foreach ([""equip_weapons""] call SPMC_fnc_config);
};

[_plist] spawn {
    private[""_pricelist"",""_list"",""_temp""];
    _pricelist = [_this,0,[],[[]]] call BIS_fnc_param;
    _temp = [""equip_attachments""] call SPMC_fnc_config;
    disableSerialization;

    _list = (findDisplay 2300) displayCtrl 2303;
    lbClear _list;

    {
        private [""_itemInfo"",""_value""];
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

    } foreach ((_temp select 0) + (_temp select 1) + (_temp select 2) + (_temp select 3));
};

[_plist] spawn {
    private[""_pricelist"",""_list""];
    _pricelist = [_this,0,[],[[]]] call BIS_fnc_param;
    disableSerialization;
    
    _list = (findDisplay 2300) displayCtrl 2304;
    lbClear _list;

    {
        private [""_itemInfo"",""_value""];
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

    } foreach ([""equip_items""] call SPMC_fnc_config);
};";

SPMC_fnc_armsShopWeaponSelected = compileFinal "
private[""_item"",""_value"",""_list"",""_desc"",""_type"",""_caliber"",""_misc"",""_len"",""_pricelist""];
disableSerialization;

_item = [lbData [2301, lbCurSel(2301)]] call SPMC_fnc_getItemCfgDetails;
_pricelist = [""item_prices""] call SPMC_fnc_config;
_value = floor(lbValue [2301, lbCurSel(2301)]);

_list = (findDisplay 2300) displayCtrl 2305;
lbClear _list;
{
    private[""_itemInfo"",""_value""];
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
} foreach (_item select 8);

_list = (findDisplay 2300) displayCtrl 2306;
lbClear _list;
{   
    private [""_y""];
    _y = _x;

    {
        private[""_itemInfo"",""_value""];
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
    } foreach _y;
} foreach (_item select 10);

_desc = [(_item select 2), "">""] call BIS_fnc_splitString;
_type = (_desc select 0);
_caliber = """";
_misc = """";

if (count _desc > 1) then {
    _len = count (toArray _type) - 1;
    _type = [_type, 0, _len-4] call BIS_fnc_trimString;

    _len = count (toArray _type) - 1;
    if (([_type, _len] call BIS_fnc_trimString) == ""<"") then {
        _type = [_type, 0, _len - 1] call BIS_fnc_trimString;
    };
    
    if (""Launcher"" in ([_type, "" ""] call BIS_fnc_splitString)) then {
        _caliber = [(_desc select 1), 6] call BIS_fnc_trimString;
    }else {
        _caliber = [(_desc select 1), 9] call BIS_fnc_trimString;
    };

    _len = count (toArray _caliber) - 1;

    if (([_caliber, _len] call BIS_fnc_trimString) == ""/"") then {
        _caliber = [_caliber, 0, _len - 5] call BIS_fnc_trimString;
    };
    
    _caliber = format[""<br/>Caliber: <t color='#ffae2b'>%1</t>"", _caliber];

    if (count _desc == 4) then {
        _misc = [(_desc select 2), 0, count (toArray (_desc select 2)) - 6] call BIS_fnc_trimString;
        if (_misc == ""Grenade Launcher"") then {
            _misc = format["" <t color='#ffae2b' size='0.70'>(%1 %2)</t>"", [(_desc select 3), 9] call BIS_fnc_trimString, _misc];
            _caliber = format[""%1%2"", _caliber, _misc];
        };
    };
};

_type = format[""<br/>Type: <t color='#ffae2b'>%1</t>"", _type];

((findDisplay 2300) displayCtrl 2314) ctrlSetStructuredText parseText format[
""<img size='8' image='%1'/><br/>Name: <t color='#ffae2b'>%2</t>%3%4<br/>Price: <t color='#27e640'>$%5</t>"",
(_item select 3),
(_item select 1),
_type,
_caliber,
[_value] call fnc_numberToText];";


SPMC_fnc_armsShopItemSelected = compileFinal "
private[""_item"",""_pricelist"",""_index"",""_value"",""_listNo"",""_section""];
_section = [_this,0,"""",[""""]] call BIS_fnc_param;
_listNo = 0;

if(_section == """") exitWith {};

switch (_section) do {
    case ""ammo"": {
        _listNo = 2302;
    };
    case ""attach"": {
        _listNo = 2303;
    };
    case ""acc"": {
        _listNo = 2304;
    };
    case ""spammo"": {
        _listNo = 2305;
    };
    case ""spattach"": {
        _listNo = 2306;
    };
};

if(_listNo == 0) exitWith {};

disableSerialization;

_item = [lbData [_listNo, lbCurSel _listNo]] call SPMC_fnc_getItemCfgDetails;
_pricelist = [""item_prices""] call SPMC_fnc_config;
_index = [(_item select 0), _pricelist] call SPMC_fnc_findIndex;
_value = 0;

if (_index != -1) then {
    _value = (_pricelist select _index) select 1;
};

((findDisplay 2300) displayCtrl 2314) ctrlSetStructuredText parseText format[
""<img size='8' image='%1'/><br/>
Name: <t color='#ffae2b'>%2</t><br/>
Price: <t color='#27e640'>$%3</t>"",
(_item select 3),
(_item select 1),
[_value] call fnc_numberToText];";

SPMC_fnc_armsShopBuyWeapon = compileFinal "
private [""_weapon"",""_price"",""_slot"",""_currentWeapon"",""_bought""];
_weapon = lbData [2301, lbCurSel(2301)];

if (_weapon == """") exitWith {};

ctrlEnable[2307, false];

_weapon = [_weapon] call SPMC_fnc_getItemCfgDetails;
_price = lbValue [2301, lbCurSel(2301)];
_slot = (_weapon select 5);
_bought = true;

if ((_weapon select 7) != ""CfgWeapons"") exitWith {
    ctrlEnable[2307, true];
};

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
    ctrlEnable[2307, true];
};

hint format[""You have bought an """"%1"""" for $%2!"", (_weapon select 1), _price];

[] spawn {
    player say3D ""purchase"";
    sleep 0.73;
    ctrlEnable[2307, true];
};";

SPMC_fnc_armsShopBuyAmmo = compileFinal "
private [""_sp"",""_ammo"",""_price"",""_slot"",""_currentWeapon""];
_sp = [_this,0,false,[false]] call BIS_fnc_param;

if (_sp) then {
    _ammo = lbData [2305, lbCurSel(2305)];
    ctrlEnable[2312, false];
} else {
    _ammo = lbData [2302, lbCurSel(2302)];
    ctrlEnable[2308, false];
};

if (_ammo == """") exitWith {
    if (_sp) then {
        ctrlEnable[2312, true];
    } else {
        ctrlEnable[2308, true];
    };
};

if (!(player canAddItemToBackpack _ammo) && !(player canAddItemToUniform _ammo) && !(player canAddItemToVest _ammo)) exitWith {
    player say3D ""error"";
    Hint ""You do not have enough room for that."";
    if (_sp) then {
        ctrlEnable[2312, true];
    } else {
        ctrlEnable[2308, true];
    };
};

_ammo = [_ammo] call SPMC_fnc_getItemCfgDetails;
if (_sp) then {
    _price = lbValue [2305, lbCurSel(2305)];
} else {
    _price = lbValue [2302, lbCurSel(2302)];
};

player addMagazine (_ammo select 0);
hint format[""You have bought """"%1"""" for $%2!"", (_ammo select 1), _price];

[_sp] spawn {
    _sp = [_this,0,false,[false]] call BIS_fnc_param;
    player say3D ""purchase_click"";
    sleep 0.2;
    if (_sp) then {
        ctrlEnable[2312, true];
    } else {
        ctrlEnable[2308, true];
    };
};";

SPMC_fnc_armsShopBuyAttachment = compileFinal "
private [""_index"",""_sp"",""_item"",""_bought"",""_errMsg"",""_curItem"",""_price"",""_toBackpack""];
_sp = [_this,0,false,[false]] call BIS_fnc_param;

if (_sp) then {
    _item = lbData [2306, lbCurSel(2306)];
    ctrlEnable[2313, false];
} else {
    _item = lbData [2303, lbCurSel(2303)];
    ctrlEnable[2309, false];
};

if (_item == """") exitWith {
    if (_sp) then {
        ctrlEnable[2313, true];
    } else {
        ctrlEnable[2309, true];
    };
};

_item = [_item] call SPMC_fnc_getItemCfgDetails;
_curItem = (player weaponAccessories (currentWeapon player));
_toBackpack = false;

switch (_item select 6) do {
    case 101: {
        if ((_curItem select 0) != """") then {
            _toBackpack = true;
        };
    };

    case 201: {
        if ((_curItem select 2) != """") then {
            _toBackpack = true;
        };
    };

    case 301: {
        if ((_curItem select 1) != """") then {
            _toBackpack = true;
        };
    };

    case 302: {
        if ((_curItem select 3) != """") then {
            _toBackpack = true;
        };
    };
};

_bought = true;
_errMsg = """";

_wpDetails = [(currentWeapon player)] call SPMC_fnc_getItemCfgDetails;
_index = [(_item select 0), (_wpDetails select 10)] call SPMC_fnc_findIndex;

if (_index == -1) then {
    _errMsg = "" (Item does not fit on your current weapon.)"";
};

if (_toBackpack || _index == -1) then {
    switch (true) do {
        case (player canAddItemToUniform (_item select 0)): {
            player addItemToUniform (_item select 0);
        };
        case (player canAddItemToVest (_item select 0)): {
            player addItemToVest (_item select 0);
        };
        case (player canAddItemToBackpack (_item select 0)): {
            player addItemToBackpack (_item select 0);
        };
        default {
            _errMsg = format [""You do not have enough room for that.%1"", _errMsg];
            _bought = false;
        };
    };
} else {
    if ((primaryWeapon player) == (currentWeapon player)) then {
        player addPrimaryWeaponItem (_item select 0);
    } else {
        if ((secondaryWeapon player) == (currentWeapon player)) then {
            player addSecondaryWeaponItem (_item select 0);
        } else {
            player addHandgunItem (_item select 0);
        };
    };
};

if (!_bought) exitWith {
    player say3D ""error"";
    Hint _errMsg;
    if (_sp) then {
        ctrlEnable[2313, true];
    } else {
        ctrlEnable[2309, true];
    };
};

if (_sp) then {
    _price = lbValue [2306, lbCurSel(2306)];
} else {
    _price = lbValue [2303, lbCurSel(2303)];
};

hint format[""You have bought a """"%1"""" for $%2!"", (_item select 1), _price];

[_sp] spawn {
    _sp = [_this,0,false,[false]] call BIS_fnc_param;
    player say3D ""purchase_click"";
    sleep 0.2;
    if (_sp) then {
        ctrlEnable[2313, true];
    } else {
        ctrlEnable[2309, true];
    };
};";