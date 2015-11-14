/**
 * svrSyncSale.sqf
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


private["_player","_item","_wpitem","_moneyIndex","_priceIndex","_money","_price","_pricelist","_isVehicle","_sellPercentage","_controller","_attachments","_confirm","_empty","_sale"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = _this select 1;
_controller = [_this,2,0,[0]] call BIS_fnc_param;
_attachments = [_this,3,false,[false]] call BIS_fnc_param;
_confirm = false;
_isVehicle = false;
_sale = false;

_sellPercentage = ["sell_percentage"] call SPMC_fnc_config;
_pricelist = ["item_prices"] call SPMC_fnc_config;
_money = 0;
_price = 0;
_wpitem = false;

if (isNull _player) exitWith {};

switch (typeName _item) do {
    case "STRING": {
        if (_item != "") then {
            _sale = true;
        };
    };
    case "OBJECT": {
        if (!(isNull _item)) then {
            _sale = true;
            _isVehicle = true;
        };
    };
};

if (!_sale) exitWith {};

_moneyIndex = [(getPlayerUID _player), serverPlayerMoney] call SPMC_fnc_findIndex;
if (_moneyIndex != -1) then {
    _money = (serverPlayerMoney select _moneyIndex) select 1;
};


if (!_isVehicle) then {
    _priceIndex = [_item, _pricelist] call SPMC_fnc_findIndex;
    if (_priceIndex != -1) then {
        _price = floor(((_pricelist select _priceIndex) select 1) * (_sellPercentage/100));
    };

    _itemInfo = [_item] call SPMC_fnc_getItemCfgDetails;

    switch((_itemInfo select 7)) do {
        case "CfgMagazines": {
            _confirm = true;
            _player removeMagazineGlobal _item;
        };

        case "CfgGlasses": {
            if (goggles _player == _item) then {
                removeGoggles _player;
            }  else {
                _player removeItem _item;
            };

            _confirm = true;
        };

        case "CfgVehicles": {
            if (backpack _player == _item) then {
                removeBackpack _player;
                _confirm = true;
            };
        };

        case "CfgWeapons": {
            if ((_itemInfo select 5) in [1,2,4,5]) then {
                switch (true) do {
                    case (_item in (uniformItems _player));
                    case (_item in (vestItems _player));
                    case (_item in (backpackItems _player)): {
                        _player removeItem _item;
                        _confirm = true;
                    };

                    case (handGunweapon _player == _item);
                    case (secondaryWeapon _player == _item);
                    case (primaryWeapon _player == _item): {
                        _player removeWeaponGlobal _item;
                        _confirm = true;
                    };

                    default {
                        _player removeWeaponGlobal _item;
                        _confirm = true;
                    };
                };
            } else {
                switch((_itemInfo select 6)) do {
                    case 0;
                    case 616;
                    case 621: {
                        _player removeItem _item;
                        _confirm = true;
                    };

                    case 605: {
                        if(headGear _player == _item) then {
                            removeHeadgear _player
                        } else {
                            _player removeItem _item
                        };

                        _confirm = true;
                    };
                    
                    case 701: {
                        if(vest _player == _item) then {
                            removeVest _player;
                        } else {
                            _player removeItem _item
                        };

                        _confirm = true;
                    };

                    case 801: {
                        if(uniform _player == _item) then {
                            removeUniform _player;
                        } else {
                            _player removeItem _item
                        };

                        _confirm = true;
                    };

                    default {
                        switch (true) do {
                            case (_item in (handgunItems _player));
                            case (_item in (secondaryWeaponItems _player));
                            case (_item in (primaryWeaponItems _player)): {
                                _wpitem = true;
                                _confirm = true;
                            };

                            default {
                                _player removeItem _item;
                                _confirm = true;
                            };
                        };
                    };
                };
            };
        };
        
        default {
            _player removeItem _item;
        };
    };
} else {
    _itemInfo = [(typeof _item)] call SPMC_fnc_getItemCfgDetails;
    _priceIndex = [(_itemInfo select 0), _pricelist] call SPMC_fnc_findIndex;
    if (_priceIndex != -1) then {
        _price = floor(((_pricelist select _priceIndex) select 1) * (_sellPercentage/100));
    };

    _confirm = true;
    _item = (_itemInfo select 0);
    deleteVehicle _item;
};

if (_confirm) then {
    _money = _money + _price;
    serverPlayerMoney set [_moneyIndex, [(getPlayerUID _player), _money]];
    [_player, true] call SPMC_fnc_svrSyncMoney;
};

[[_item,_money,_controller,_wpitem,_attachments,_confirm,_isVehicle],"SPMC_fnc_syncSaleConfirm",(owner _player),false] spawn BIS_fnc_MP;