/**
 * armsShopBuyAmmo.sqf
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

private ["_sp","_ammo","_price","_slot","_controller"];
_sp = [_this,0,false,[false]] call BIS_fnc_param;
_controller = 0;

if (_sp) then {
    _ammo = lbData [2305, lbCurSel(2305)];
    _price = lbValue [2305, lbCurSel(2305)];
    ctrlEnable[2312, false];
} else {
    _ammo = lbData [2302, lbCurSel(2302)];
    _price = lbValue [2302, lbCurSel(2302)];
    ctrlEnable[2308, false];
};

if (_ammo == "") exitWith {
    if (_sp) then {
        ctrlEnable[2312, true];
    } else {
        ctrlEnable[2308, true];
    };
};

if (SPMC_gbl_money < _price) exitWith {
    hint "You do not have enough money to buy this ammunition.";
    if (_sp) then {
        ctrlEnable[2312, true];
    } else {
        ctrlEnable[2308, true];
    };
};

if (!(player canAddItemToBackpack _ammo) && !(player canAddItemToUniform _ammo) && !(player canAddItemToVest _ammo)) exitWith {
    player say3D "error";
    Hint "You do not have enough room for that.";
    if (_sp) then {
        ctrlEnable[2312, true];
    } else {
        ctrlEnable[2308, true];
    };
};

if (_sp) then {
    _controller = 2312;
} else {
    _controller = 2308;
};

[_ammo,_controller] call SPMC_fnc_syncPurchase;