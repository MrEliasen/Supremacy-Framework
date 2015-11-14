/**
 * armsShopBuyAttachment.sqf
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

private ["_index","_sp","_item","_bought","_errMsg","_curItem","_price","_toBackpack","_controller"];
_sp = [_this,0,false,[false]] call BIS_fnc_param;
_controller = 0;

if (_sp) then {
    _item = lbData [2306, lbCurSel(2306)];
    _price = lbValue [2306, lbCurSel(2306)];
    ctrlEnable[2313, false];
} else {
    _item = lbData [2303, lbCurSel(2303)];
    _price = lbValue [2303, lbCurSel(2303)];
    ctrlEnable[2309, false];
};

if (_item == "") exitWith {
    if (_sp) then {
        ctrlEnable[2313, true];
    } else {
        ctrlEnable[2309, true];
    };
};

if (SPMC_gbl_money < _price) exitWith {
    hint "You do not have enough money to buy this attachment.";
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
        if ((_curItem select 0) != "") then {
            _toBackpack = true;
        };
    };

    case 201: {
        if ((_curItem select 2) != "") then {
            _toBackpack = true;
        };
    };

    case 301: {
        if ((_curItem select 1) != "") then {
            _toBackpack = true;
        };
    };

    case 302: {
        if ((_curItem select 3) != "") then {
            _toBackpack = true;
        };
    };
};

_bought = false;
_errMsg = "";

_wpDetails = [(currentWeapon player)] call SPMC_fnc_getItemCfgDetails;
_index = [(_item select 0), (_wpDetails select 10)] call SPMC_fnc_findIndex;

if (_index == -1) then {
    _errMsg = " (Item does not fit on your current weapon.)";
};

if (_toBackpack || _index == -1) then {
    switch (true) do {
        case (player canAddItemToUniform (_item select 0));
        case (player canAddItemToVest (_item select 0));
        case (player canAddItemToBackpack (_item select 0)): {
            _bought = true;
        };
        default {
            _errMsg = format ["You do not have enough room for that.%1", _errMsg];
            _bought = false;
        };
    };
} else {
    _bought = true;
};

if (!_bought) exitWith {
    player say3D "error";
    Hint _errMsg;
    if (_sp) then {
        ctrlEnable[2313, true];
    } else {
        ctrlEnable[2309, true];
    };
};

if (_sp) then {
    _controller = 2313;
} else {
    _controller = 2309;
};

[(_item select 0),_controller] call SPMC_fnc_syncPurchase;