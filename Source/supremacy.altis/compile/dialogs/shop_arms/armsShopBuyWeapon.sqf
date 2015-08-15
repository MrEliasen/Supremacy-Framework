/**
 * armsShopBuyWeapon.sqf
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

private ["_weapon","_price","_slot","_currentWeapon","_bought"];
_weapon = lbData [2301, lbCurSel(2301)];

if (_weapon == "") exitWith {};

ctrlEnable[2307, false];

_weapon = [_weapon] call SPMC_fnc_getItemCfgDetails;
_price = lbValue [2301, lbCurSel(2301)];
_slot = (_weapon select 5);
_bought = false;

if ((_weapon select 7) != "CfgWeapons") exitWith {
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

if (_currentWeapon != "") then {
    switch (true) do {
        case (player canAddItemToUniform (_weapon select 0));
        case (player canAddItemToVest (_weapon select 0));
        case (player canAddItemToBackpack (_weapon select 0)): {
            _bought = true;
        };
        default {
            _bought = false;
        };
    };
} else {
    _bought = true;
};

if (!_bought) exitWith {
    player say3D "error";
    Hint "You do not have enough room for weapon.";
    ctrlEnable[2307, true];
};

[(_weapon select 0),2307] call SPMC_fnc_syncPurchase;