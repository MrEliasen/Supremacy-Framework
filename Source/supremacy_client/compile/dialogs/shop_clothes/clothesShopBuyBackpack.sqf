/**
 * clothesShopBuyBackpack.sqf
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @package    Supremacy Framework
 * @author     Mark Eliasen <https://github.com/MrEliasen>
 * @copyright  2016 Mark Eliasen
 * @license    CC BY-NC 3.0 License
 * @link       https://github.com/MrEliasen/Supremacy-Framework
 */

private ["_item","_price","_bought"];
_item = lbData [2705, lbCurSel(2705)];
_price = lbValue [2705, lbCurSel(2705)];

if(_item == "") exitWith {};

if (SPMC_gbl_money < _price) exitWith {
    hint "You do not have enough money to buy this backpack.";
};

ctrlEnable[2715, false];

_bought = false;
if ((backpack player) != "") then {
    switch (true) do {
        case (player canAddItemToUniform _item);
        case (player canAddItemToVest _item);
        case (player canAddItemToBackpack _item): {
            _bought = true;
        };
    };
} else {
    _bought = true;
};

if (!_bought) exitWith {
    player say3D "error";
    Hint "You already have an item of that type equipped, and you do not have enough inventory space to carry it.";
    ctrlEnable[2715, true];
};

[_item,2715] call SPMC_fnc_syncPurchase;