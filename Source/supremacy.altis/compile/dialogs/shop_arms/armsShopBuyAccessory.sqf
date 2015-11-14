/**
 * armsShopBuyAccessory.sqf
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

private ["_item","_price","_bought"];
_item = lbData [2304, lbCurSel(2304)];
_price = lbValue [2304, lbCurSel(2304)];
ctrlEnable[2310, false];

if (_item == "") exitWith {
    ctrlEnable[2310, true];
};

if (SPMC_gbl_money < _price) exitWith {
    hint "You do not have enough money to buy this item.";
    ctrlEnable[2310, true];
};

_bought = false;

switch (true) do {
    case (player canAddItemToUniform _item);
    case (player canAddItemToVest _item);
    case (player canAddItemToBackpack _item): {
        _bought = true;
    };
};

if (!_bought) exitWith {
    player say3D "error";
    Hint "You do not have enough room for that.";
    ctrlEnable[2310, true];
};

[_item,2310] call SPMC_fnc_syncPurchase;
