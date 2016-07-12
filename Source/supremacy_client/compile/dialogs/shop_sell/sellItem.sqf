/**
 * sellItem.sqf
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @package    Supremacy Framework
 * @author     Mark Eliasen <https://github.com/MrEliasen>
 * @copyright  2016 Mark Eliasen
 * @license    CC BY-NC 3.0 License
 * @link       https://github.com/MrEliasen/SupremacyFramework
 */

private ["_item","_silent","_soldAttachMsg","_errMsg","_sold"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
_silent = [_this,1,false,[false]] call BIS_fnc_param;
_errMsg = "";

if(!_silent) then {
    ctrlEnable[2402, false];
};

if (_item == "" && !_silent) then {
    _item = lbData [2401, lbCurSel(2401)];
};

if (_item == "") exitWith {
    if(!_silent) then {
        ctrlEnable[2402, true];
    };
};

_itemInfo = [_item] call SPMC_fnc_getItemCfgDetails;
_sold = false;
_soldAttachMsg = false;

switch((_itemInfo select 7)) do {
    case "CfgVehicles": {
        if (backpack player == _item) then {
            if (count (backpackItems player) > 0) then {
                _errMsg = "You must empty your backpack before you can sell it.";
            } else {
                _sold = true;
            };
        } else {
            _sold = true;
        };
    };

    case "CfgWeapons": {
        if ((_itemInfo select 5) in [1,2,4,5]) then {
            switch (true) do {
                case (_item in (uniformItems player) );
                case (_item in (vestItems player));
                case (_item in (backpackItems player)): {
                    _sold = true;
                };

                case (primaryWeapon player == _item): {
                    private ["_wpItems","_attchTotal"];
                    _wpItems = (player weaponAccessories primaryWeapon player);
                    _attchTotal = 0;

                    if (count _wpItems > 0) then {
                        {
                            if (_x != "") then {
                                [_x, true] call SPMC_fnc_sellItem;
                                if(!_silent) then {
                                    lbDelete [2401, lbCurSel(2401)+1];
                                };
                            };
                        } forEach _wpItems;

                        _soldAttachMsg = true;
                    };

                    _sold = true;
                };

                case (secondaryWeapon player == _item): {
                    private ["_wpItems","_attchTotal"];
                    _wpItems = (player weaponAccessories secondaryWeapon player);
                    _attchTotal = 0;

                    if (count _wpItems > 0) then {
                        {
                            if (_x != "") then {
                                [_x, true] call SPMC_fnc_sellItem;
                                if(!_silent) then {
                                    lbDelete [2401, lbCurSel(2401)+1];
                                };
                            };
                        } forEach _wpItems;

                        _soldAttachMsg = true;
                    };

                    _sold = true;
                };

                case (handGunweapon player == _item): {
                    private ["_wpItems","_attchTotal"];
                    _wpItems = (player weaponAccessories handGunweapon player);
                    _attchTotal = 0;

                    if (count _wpItems > 0) then {
                        {
                            if (_x != "") then {
                                [_x, true] call SPMC_fnc_sellItem;
                                if(!_silent) then {
                                    lbDelete [2401, lbCurSel(2401)+1];
                                };
                            };
                        } forEach _wpItems;

                        _soldAttachMsg = true;
                    };

                    _sold = true;
                };
            };
        } else {
            switch((_itemInfo select 6)) do {
                case 0;
                case 616;
                case 621: {
                    player unassignItem _item;
                    _sold = true;
                };

                case 605: {
                    _sold = true;
                };
                
                case 701: {
                    if(vest player == _item) then {
                        if (count (vestItems player) > 0) then {
                            _sold = false;
                            _errMsg = "You must empty your vest before you can sell it.";
                        } else {
                            _sold = true;
                        };
                    } else {
                        _sold = true;
                    };
                };

                case 801: {
                    if(uniform player == _item) then {
                        if (count (uniformItems player) > 0) then {
                            _sold = false;
                            _errMsg = "You must empty your uniform before you can sell it.";
                        } else {
                            _sold = true;
                        };
                    } else {
                        _sold = true;
                    };
                };

                default {
                    switch (true) do {
                        case (_item in (primaryWeaponItems player));
                        case (_item in (secondaryWeaponItems player));
                        case (_item in (handgunItems player));
                        case (_item in (uniformItems player) );
                        case (_item in (vestItems player));
                        case (_item in (backpackItems player)): {
                            _sold = true;
                        };
                    };
                };
            };
        };
    };

    case "CfgMagazines": {
        switch (true) do {
            case (_item in (uniformItems player) );
            case (_item in (vestItems player));
            case (_item in (backpackItems player)): {
                _sold = true;
            };
        };
    };
};

if (!_sold) exitWith {
    if (!_silent) then {
        hint _errMsg;
        ctrlEnable[2402, true];
    };

    player say3D "error";
};

if(!_silent) then {
    lbDelete [2401, lbCurSel(2401)];
} else {
    if (debugMode) then {
        diag_log format ["Silently selling a %1", (_itemInfo select 1)];
    };
};

[_item, 2402, _soldAttachMsg] call SPMC_fnc_syncSale;