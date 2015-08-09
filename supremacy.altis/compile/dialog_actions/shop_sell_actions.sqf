/**
 * shop_sell_actions.sqf
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

SPMC_fnc_showSellMenu = compileFinal "
private [""_list"",""_inventory"",""_pricelist""];

if (!alive player || dialog) exitWith {};

_inventory = [];
if(primaryWeapon player != """") then {_inventory set[count _inventory,primaryWeapon player]};
_inventory = _inventory + (primaryWeaponItems player);

if(secondaryWeapon player != """") then {_inventory set[count _inventory,secondaryWeapon player]};
_inventory = _inventory + (secondaryWeaponItems player);

if(handgunWeapon player != """") then {_inventory set[count _inventory,handgunWeapon player]};
_inventory = _inventory + (handgunItems player);

_inventory set [count _inventory, (headgear player)];

_inventory set [count _inventory, (uniform player)];
_inventory = _inventory + (uniformItems player);

_inventory set [count _inventory, (vest player)];
_inventory = _inventory + (vestItems player);

_inventory set [count _inventory, (backpack player)];
_inventory = _inventory + (backPackItems player);

_inventory = _inventory + (assignedItems player);

createDialog ""SPMC_shop_sell"";
disableSerialization;
waitUntil {sleep 0.1; !isNull (findDisplay 2400)};

_pricelist = [""item_prices""] call SPMC_fnc_config;
_list = (findDisplay 2400) displayCtrl 2401;
lbClear _list;

{
    if (_x != """") then {
        _itemInfo = [_x] call SPMC_fnc_getItemCfgDetails;
        _index = [_x, _pricelist] call SPMC_fnc_findIndex;
        _value = 0;

        if (_index != -1) then {
            _value = floor(((_pricelist select _index) select 1) / 2);
        };

        _list lbAdd (_itemInfo select 1);
        _list lbSetData[(lbSize _list) - 1, _x];
        _list lbSetValue[(lbSize _list) - 1, _value];
        _list lbSetPicture[(lbSize _list) - 1, (_itemInfo select 3)];
    };
} foreach _inventory;";

SPMC_fnc_showSellValue = compileFinal "
private [""_item"",""_price""];
_price = lbValue [2401, lbCurSel(2401)];
disableSerialization;

ctrlSetText[2403, format[""$%1"", _price]];";

SPMC_fnc_sellItem = compileFinal "
private [""_item"",""_price"",""_sold""];
_item = lbData [2401, lbCurSel(2401)];
_price = lbValue [2401, lbCurSel(2401)];

if (_item == """") exitWith {};

_itemInfo = [_item] call SPMC_fnc_getItemCfgDetails;
_sold = true;

switch((_itemInfo select 7)) do {
    case ""CfgMagazines"": {
        player removeMagazine _item;
    };

    case ""CfgGlasses"": {
        if (goggles player == _item) then {
            removeGoggles player;
        }  else {
            player removeItem _item;
        };
    };

    case ""CfgVehicles"": {
        if (backpack player == _item) then {
            if (count (backpackItems player) > 0) then {
                _sold = false;
                hint ""You must empty your backpack before you can sell it."";
            } else {
                removeBackpack player;
            };
        };
    };

    case ""CfgWeapons"": {
        if ((_itemInfo select 5) in [1,2,4,5]) then {
            switch (true) do {
                case (_item in (uniformItems player));
                case (_item in (vestItems player));
                case (_item in (backpackItems player)): {
                    player removeItem _item;
                };

                case (primaryWeapon player == _item);
                case (secondaryWeapon player == _item);
                case (handGunweapon player == _item): {
                    player removeWeapon _item;
                };

                default {
                    player removeWeapon _item;
                };
            };
        } else {
            switch((_itemInfo select 6)) do {
                case 0;
                case 616;
                case 621: {
                    player unassignItem _item;
                    player removeItem _item;
                };

                case 605: {
                    if(headGear player == _item) then {
                        removeHeadgear player
                    } else {
                        player removeItem _item
                    };
                };
                
                case 701: {
                    if(vest player == _item) then {
                        if (count (vestItems player) > 0) then {
                            _sold = false;
                            hint ""You must empty your vest before you can sell it."";
                        } else {
                            removeVest player;
                        };
                    } else {
                        player removeItem _item
                    };
                };

                case 801: {
                    if(uniform player == _item) then {
                        if (count (uniformItems player) > 0) then {
                            _sold = false;
                            hint ""You must empty your uniform before you can sell it."";
                        } else {
                            removeUniform player;
                        };
                    } else {
                        player removeItem _item
                    };
                };

                default {
                    switch (true) do {
                        case (_item in (primaryWeaponItems player)): {
                            player removePrimaryWeaponItem _item;
                        };
                        case (_item in (secondaryWeaponItems player)): {
                            player removeSecondaryWeaponItem _item;
                        };
                        case (_item in (handgunItems player)): {
                            player removeHandgunItem _item;
                        };

                        default {
                            player removeItem _item;
                        };
                    };
                };
            };
        };
    };
};

if (!_sold) exitWith {
    player say3D ""error"";
};

lbDelete [2401, lbCurSel(2401)];

player say3D ""sold_item"";
hint format[""You have sold a """"%1"""" for $%2!"", (_itemInfo select 1), _price];";