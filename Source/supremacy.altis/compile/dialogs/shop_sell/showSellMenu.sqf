/**
 * showSellMenu.sqf
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

private ["_list","_inventory","_pricelist"];

if (!alive player || dialog) exitWith {};

_inventory = [];
if(primaryWeapon player != "") then {_inventory set[count _inventory,primaryWeapon player]};
_inventory = _inventory + (primaryWeaponItems player);

if(secondaryWeapon player != "") then {_inventory set[count _inventory,secondaryWeapon player]};
_inventory = _inventory + (secondaryWeaponItems player);

if(handgunWeapon player != "") then {_inventory set[count _inventory,handgunWeapon player]};
_inventory = _inventory + (handgunItems player);

_inventory set [count _inventory, (headgear player)];

_inventory set [count _inventory, (uniform player)];
_inventory = _inventory + (uniformItems player);

_inventory set [count _inventory, (vest player)];
_inventory = _inventory + (vestItems player);

_inventory set [count _inventory, (backpack player)];
_inventory = _inventory + (backPackItems player);

_inventory = _inventory + (assignedItems player);

createDialog "SPMC_shop_sell";
disableSerialization;
waitUntil {sleep 0.1; !isNull (findDisplay 2400)};

_pricelist = ["item_prices"] call SPMC_fnc_config;
_list = (findDisplay 2400) displayCtrl 2401;
lbClear _list;

{
    if (_x != "") then {
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
} foreach _inventory;