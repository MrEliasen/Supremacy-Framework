/**
 * svrSyncPurchase.sqf
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


private["_player","_misc","_moneyIndex","_priceIndex","_purchaseType","_money","_price","_pricelist","_controller","_toBackpack","_currentWeapon","_assesories","_holder"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,1,"",[""]] call BIS_fnc_param;
_controller = [_this,2,0,[0]] call BIS_fnc_param;
_purchaseType = [_this,3,"",[""]] call BIS_fnc_param;
_misc = [_this,4,"",[""]] call BIS_fnc_param;

_pricelist = ["item_prices"] call SPMC_fnc_config;
_confirmed = false;
_money = 0;
_price = 0;

if (isNull _player || _item == "") exitWith {};

_moneyIndex = [(getPlayerUID _player), serverPlayerMoney] call SPMC_fnc_findIndex;
if (_moneyIndex != -1) then {
    _money = (serverPlayerMoney select _moneyIndex) select 1;
};

_priceIndex = [_item, _pricelist] call SPMC_fnc_findIndex;
if (_priceIndex != -1) then {
    _price = (_pricelist select _priceIndex) select 1;
};

_item = [_item] call SPMC_fnc_getItemCfgDetails;

if (_money >= _price) then {
    _money = _money - _price;
    serverPlayerMoney set [_moneyIndex, [(getPlayerUID _player), _money]];

    _confirmed = true;
    _toBackpack = true;

    switch (_purchaseType) do {
        case "equipment": {
            switch (_item select 7) do
            {
                case "CfgWeapons":
                {
                    switch ((_item select 5)) do
                    {
                        case 1: {
                            if ((primaryWeapon _player) == "") then {
                                _toBackpack = false;
                            };
                        };
                        case 2: {
                            if ((handgunWeapon _player) == "") then {
                                _toBackpack = false;
                            };
                        };
                        case 4: {
                            if ((secondaryWeapon _player) == "") then {
                                _toBackpack = false;
                            };
                        };

                        default {
                            switch((_item select 6)) do {
                                case 101: {
                                    private ["_currentWeapon"];
                                    _currentWeapon = [(currentWeapon _player)] call SPMC_fnc_getItemCfgDetails;

                                    if (count _currentWeapon != 0) then {
                                        _assesories = (_player weaponAccessories (currentWeapon _player));

                                        if ((_assesories select 0) == "") then {
                                            if((_item select 0) in ((_currentWeapon select 10) select 2)) then {
                                                _toBackpack = false;
                                            };
                                        };
                                    };
                                };
                                case 201: {
                                    private ["_currentWeapon"];
                                    _currentWeapon = [(currentWeapon _player)] call SPMC_fnc_getItemCfgDetails;

                                    if (count _currentWeapon != 0) then {
                                        _assesories = (_player weaponAccessories (currentWeapon _player));

                                        if ((_assesories select 2) == "") then {
                                            if((_item select 0) in ((_currentWeapon select 10) select 0)) then {
                                                _toBackpack = false;
                                            };
                                        };
                                    };
                                };
                                case 301: {
                                    private ["_currentWeapon"];
                                    _currentWeapon = [(currentWeapon _player)] call SPMC_fnc_getItemCfgDetails;
                                    
                                    if (count _currentWeapon != 0) then {
                                        _assesories = (_player weaponAccessories (currentWeapon _player));

                                        if ((_assesories select 1) == "") then {
                                            if((_item select 0) in ((_currentWeapon select 10) select 1)) then {
                                                _toBackpack = false;
                                            };
                                        };
                                    };
                                };
                                case 302: {
                                    private ["_currentWeapon"];
                                    _currentWeapon = [(currentWeapon _player)] call SPMC_fnc_getItemCfgDetails;
                                    
                                    if (count _currentWeapon != 0) then {
                                        _assesories = (_player weaponAccessories (currentWeapon _player));
                                        
                                        if ((_assesories select 3) == "") then {
                                            if((_item select 0) in ((_currentWeapon select 10) select 3)) then {
                                                _toBackpack = false;
                                            };
                                        };
                                    };
                                };

                                case 605: {
                                    if ((headgear _player) == "") then {
                                        _toBackpack = false;
                                    };
                                };

                                case 701: {
                                    if ((vest _player) == "") then {
                                        _toBackpack = false;
                                    };
                                };

                                case 801: {
                                    if ((uniform _player) == "") then {
                                        _toBackpack = false;
                                    };
                                };
                            };
                        };
                    };
                };

                case "CfgVehicles": {
                    if ((backpack _player) == "") then {
                        _toBackpack = false;
                    };
                };

                case "CfgGlasses": {
                    if ((goggles _player) == "") then {
                        _toBackpack = false;
                    };
                };

                case "CfgMagazines": {
                    _toBackpack = true;
                };
            };

            if (_toBackpack) then {
                if((_item select 7) == "CfgMagazines") then {
                    _player addMagazine [(_item select 0), (_item select 9)];
                } else {
                    private ["_added"];
                    _added = false;

                    switch (true) do {
                        case (_player canAddItemToUniform (_item select 0)): {
                            _player addItemToUniform (_item select 0);
                            _added = true;
                        };
                        case (_player canAddItemToVest (_item select 0)): {
                            _player addItemToVest (_item select 0);
                            _added = true;
                        };
                        case (_player canAddItemToBackpack (_item select 0)): {
                            _player addItemToBackpack (_item select 0);
                            _added = true;
                        };
                    };

                    if (_added) then {
                        switch (true) do {
                            case ((_item select 7) == "CfgGlasses");
                            case ((_item select 0) == "NVGoggles");
                            case ((_item select 0) == "NVGoggles_OPFOR");
                            case ((_item select 0) == "NVGoggles_INDEP");
                            case ((_item select 0) == "ItemWatch");
                            case ((_item select 0) == "ItemCompass");
                            case ((_item select 0) == "ItemGPS");
                            case ((_item select 0) == "ItemRadio");
                            case ((_item select 0) == "ItemMap"): {
                                if ((_item select 0) in (assignedItems _player)) then {
                                    _player assignItem (_item select 0);
                                };
                            };
                        };
                    };
                };
            } else {
                switch (_item select 7) do
                {
                    case "CfgWeapons":
                    {
                        switch ((_item select 5)) do
                        {
                            case 1: {
                                _player removeWeaponGlobal (primaryWeapon _player);
                                _player addWeaponGlobal (_item select 0);
                            };
                            case 2: {
                                _player removeWeaponGlobal (handgunWeapon _player);
                                _player addWeaponGlobal (_item select 0);
                            };
                            case 4: {
                                _player removeWeaponGlobal (secondaryWeapon _player);
                                _player addWeaponGlobal (_item select 0);
                            };

                            default {
                                switch((_item select 6)) do {
                                    case 605: {
                                        _player addHeadgear (_item select 0);
                                    };

                                    case 701: {
                                        _player addVest (_item select 0);
                                    };

                                    case 801: {
                                        _player addUniform (_item select 0)
                                    };
                                };
                            };
                        };
                    };

                    case "CfgVehicles":
                    {
                        _player addBackpackGlobal (_item select 0);
                    };

                    case "CfgGlasses":
                    {
                        _player addGoggles (_item select 0);
                    };
                };
            };
        };

        case "vehicle": {
            _holder = createVehicle [(_item select 0), (getMarkerPos _misc), [], 0, "none"];
            _holder allowDamage false;
            _holder setVectorUp (surfaceNormal (getMarkerPos _misc));
            _holder setDir (markerDir _misc);
            _holder setPos (getMarkerPos _misc);
            _holder allowDamage true;
        };
    };
};

[[(_item select 0),_confirmed,_money,_controller],"SPMC_fnc_syncPurchaseConfirm",(owner _player),false] spawn BIS_fnc_MP;