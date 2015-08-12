/**
 * shop_clothes_actions.sqf
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

SPMC_fnc_showClothesShop = compileFinal "
private[""_shopLists"",""_pricelist""];
if (!alive player || dialog) exitWith {};

createDialog ""SPMC_shop_clothes"";
disableSerialization;

waitUntil {sleep 0.1; !isNull (findDisplay 2700)};

_pricelist = [""item_prices""] call SPMC_fnc_config;
_shopLists = [
    [2701, ([""equip_clothes""] call SPMC_fnc_config)],
    [2702, ([""equip_hats""] call SPMC_fnc_config)],
    [2703, ([""equip_glasses""] call SPMC_fnc_config)],
    [2704, ([""equip_vests""] call SPMC_fnc_config)],
    [2705, ([""equip_backpacks""] call SPMC_fnc_config)]
];

{
    private [""_y"",""_list""];
    _y = _x;

    _list = (findDisplay 2700) displayCtrl (_y select 0);
    lbClear _list;

    {
        private [""_itemInfo"",""_index"",""_value""];
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

    } foreach (_y select 1);
} foreach _shopLists;";

SPMC_fnc_clothesShopItemSelected = compileFinal "
private[""_item"",""_pricelist"",""_index"",""_value"",""_listNo"",""_section"",""_infoText""];
_section = [_this,0,"""",[""""]] call BIS_fnc_param;
_listNo = [];
_infoText = ["""",""""];

if(_section == """") exitWith {};

switch (_section) do {
    case ""uniform"": {
        _listNo = [2701,2721];
    };
    case ""hat"": {
        _listNo = [2702,2722];
    };
    case ""glasses"": {
        _listNo = [2703,2723];
    };
    case ""vest"": {
        _listNo = [2704,2724];
    };
    case ""backpack"": {
        _listNo = [2705,2725];
    };
};

if(count _listNo == 0) exitWith {};

disableSerialization;

_item = [lbData [(_listNo select 0), lbCurSel(_listNo select 0)]] call SPMC_fnc_getItemCfgDetails;
_pricelist = [""item_prices""] call SPMC_fnc_config;
_index = [_x, _pricelist] call SPMC_fnc_findIndex;
_value = 0;

if (_index != -1) then {
    _value = (_pricelist select _index) select 1;
};

ctrlSetText[(_listNo select 1), format[""$%1"", [_value] call fnc_numberToText]];

switch (_section) do {
    case ""uniform"": {
        _infoText = [
            format[""<br/>Protection: <t color='#ffae2b'>None</t>"", (_itemInfo select 11)],
            """"
        ];
    };
    case ""hat"": {
        _infoText = [
            format[""<br/>Protection: <t color='#ffae2b'>None</t>"", (_itemInfo select 11)],
            """"
        ];
    };
    case ""glasses"": {
        _infoText = [
            """",
            """"
        ];
    };
    case ""vest"": {
        _infoText = [
            format[""<br/>Protection: <t color='#ffae2b'>None</t>"", (_itemInfo select 11)],
            """"
        ];
    };
    case ""backpack"": {
        _infoText = [
            """",
            format[""<br/>Capacity: <t color='#ffae2b'>%2</t>"", (_itemInfo select 12)]
        ]
    };
};

((findDisplay 2700) displayCtrl 2726) ctrlSetStructuredText parseText format[
""<img size='6' image='%1'/><br/>
Name: <t color='#ffae2b'>%2</t>%3%4"",
(_item select 3),
(_item select 1),
(_infoText select 0),
(_infoText select 1)];";

SPMC_fnc_clothesShopBuyUniform = compileFinal "
private [""_pricelist"",""_item"",""_price"",""_index"",""_bought""];
_item = lbData [2701, lbCurSel(2701)];

if(_item == """") exitWith {};

ctrlEnable[2711, false];
_item = [_item] call SPMC_fnc_getItemCfgDetails;
_pricelist = [""item_prices""] call SPMC_fnc_config;
_index = [(_item select 0), _pricelist] call SPMC_fnc_findIndex;
_price = 0;

if (_index != -1) then {
    _price = (_pricelist select _index) select 1;
};

_bought = true;
if ((uniform player) != """") then {
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
            _bought = false;
        };
    };
} else {
    player addUniform (_item select 0);
};

if (!_bought) exitWith {
    player say3D ""error"";
    Hint ""You already have an item of that type equipped, and you do not have enough inventory space to carry it."";
    ctrlEnable[2711, true];
};

hint format[""You have bought """"%1"""" for $%2!"", (_item select 1), _price];

[] spawn {
    player say3D ""purchase_click"";
    sleep 0.2;
    ctrlEnable[2711, true];
};";

SPMC_fnc_clothesShopBuyHat = compileFinal "
private [""_pricelist"",""_item"",""_price"",""_index"",""_bought""];
_item = lbData [2702, lbCurSel(2702)];

if(_item == """") exitWith {};

ctrlEnable[2712, false];
_item = [_item] call SPMC_fnc_getItemCfgDetails;
_pricelist = [""item_prices""] call SPMC_fnc_config;
_index = [(_item select 0), _pricelist] call SPMC_fnc_findIndex;
_price = 0;

if (_index != -1) then {
    _price = (_pricelist select _index) select 1;
};

_bought = true;
if ((headgear player) != """") then {
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
            _bought = false;
        };
    };
} else {
    player addHeadgear (_item select 0);
};

if (!_bought) exitWith {
    player say3D ""error"";
    Hint ""You already have an item of that type equipped, and you do not have enough inventory space to carry it."";
    ctrlEnable[2712, true];
};

hint format[""You have bought """"%1"""" for $%2!"", (_item select 1), _price];

[] spawn {
    player say3D ""purchase_click"";
    sleep 0.2;
    ctrlEnable[2712, true];
};";

SPMC_fnc_clothesShopBuyGlasses = compileFinal "
private [""_pricelist"",""_item"",""_price"",""_index"",""_bought""];
_item = lbData [2703, lbCurSel(2703)];

if(_item == """") exitWith {};

ctrlEnable[2713, false];
_item = [_item] call SPMC_fnc_getItemCfgDetails;
_pricelist = [""item_prices""] call SPMC_fnc_config;
_index = [(_item select 0), _pricelist] call SPMC_fnc_findIndex;
_price = 0;

if (_index != -1) then {
    _price = (_pricelist select _index) select 1;
};

_bought = true;
if ((goggles player) != """") then {
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
            _bought = false;
        };
    };
} else {
    player addGoggles (_item select 0);
};

if (!_bought) exitWith {
    player say3D ""error"";
    Hint ""You already have an item of that type equipped, and you do not have enough inventory space to carry it."";
    ctrlEnable[2713, true];
};

hint format[""You have bought """"%1"""" for $%2!"", (_item select 1), _price];

[] spawn {
    player say3D ""purchase_click"";
    sleep 0.2;
    ctrlEnable[2713, true];
};";

SPMC_fnc_clothesShopBuyVest = compileFinal "
private [""_pricelist"",""_item"",""_price"",""_index"",""_bought""];
_item = lbData [2704, lbCurSel(2704)];

if(_item == """") exitWith {};

ctrlEnable[2714, false];
_item = [_item] call SPMC_fnc_getItemCfgDetails;
_pricelist = [""item_prices""] call SPMC_fnc_config;
_index = [(_item select 0), _pricelist] call SPMC_fnc_findIndex;
_price = 0;

if (_index != -1) then {
    _price = (_pricelist select _index) select 1;
};

_bought = true;
if ((vest player) != """") then {
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
            _bought = false;
        };
    };
} else {
    player addVest (_item select 0);
};

if (!_bought) exitWith {
    player say3D ""error"";
    Hint ""You already have an item of that type equipped, and you do not have enough inventory space to carry it."";
    ctrlEnable[2714, true];
};

hint format[""You have bought """"%1"""" for $%2!"", (_item select 1), _price];

[] spawn {
    player say3D ""purchase_click"";
    sleep 0.2;
    ctrlEnable[2714, true];
};";

SPMC_fnc_clothesShopBuyBackpack = compileFinal "
private [""_pricelist"",""_item"",""_price"",""_index"",""_bought""];
_item = lbData [2705, lbCurSel(2705)];

if(_item == """") exitWith {};

ctrlEnable[2715, false];
_item = [_item] call SPMC_fnc_getItemCfgDetails;
_pricelist = [""item_prices""] call SPMC_fnc_config;
_index = [(_item select 0), _pricelist] call SPMC_fnc_findIndex;
_price = 0;

if (_index != -1) then {
    _price = (_pricelist select _index) select 1;
};

_bought = true;
if ((backpack player) != """") then {
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
            _bought = false;
        };
    };
} else {
    player addBackpack (_item select 0);
};

if (!_bought) exitWith {
    player say3D ""error"";
    Hint ""You already have an item of that type equipped, and you do not have enough inventory space to carry it."";
    ctrlEnable[2715, true];
};

hint format[""You have bought """"%1"""" for $%2!"", (_item select 1), _price];

[] spawn {
    player say3D ""purchase_click"";
    sleep 0.2;
    ctrlEnable[2715, true];
};";