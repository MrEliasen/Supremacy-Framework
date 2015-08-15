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


private["_player","_wpitem","_moneyIndex","_priceIndex","_money","_price","_pricelist","_controller","_attachments"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,1,"",[""]] call BIS_fnc_param;
_controller = [_this,2,0,[0]] call BIS_fnc_param;
_attachments = [_this,3,false,[false]] call BIS_fnc_param;

_pricelist = ["item_prices"] call SPMC_fnc_config;
_money = 0;
_price = 0;
_wpitem = false;

if (isNull _player || _item == "") exitWith {};

_moneyIndex = [(getPlayerUID _player), serverPlayerMoney] call SPMC_fnc_findIndex;
if (_moneyIndex != -1) then {
    _money = (serverPlayerMoney select _moneyIndex) select 1;
};

_priceIndex = [_item, _pricelist] call SPMC_fnc_findIndex;
if (_priceIndex != -1) then {
    _price = (_pricelist select _priceIndex) select 1;
};

_itemInfo = [_item] call SPMC_fnc_getItemCfgDetails;

switch((_itemInfo select 7)) do {
    case "CfgMagazines": {
        player removeMagazineGlobal _item;
    };

    case "CfgGlasses": {
        if (goggles player == _item) then {
            removeGoggles player;
        }  else {
            player removeItem _item;
        };
    };

    case "CfgVehicles": {
        if (backpack player == _item) then {
            removeBackpack player;
        };
    };

    case "CfgWeapons": {
        if ((_itemInfo select 5) in [1,2,4,5]) then {
            switch (true) do {
                case (_item in (uniformItems player));
                case (_item in (vestItems player));
                case (_item in (backpackItems player)): {
                    player removeItem _item;
                };

                case (handGunweapon player == _item);
                case (secondaryWeapon player == _item);
                case (primaryWeapon player == _item): {
                    player removeWeaponGlobal _item;
                };

                default {
                    player removeWeaponGlobal _item;
                };
            };
        } else {
            switch((_itemInfo select 6)) do {
                case 0;
                case 616;
                case 621: {
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
                        removeVest player;
                    } else {
                        player removeItem _item
                    };
                };

                case 801: {
                    if(uniform player == _item) then {
                        removeUniform player;
                    } else {
                        player removeItem _item
                    };
                };

                default {
                    switch (true) do {
                        case (_item in (handgunItems player));
                        case (_item in (secondaryWeaponItems player));
                        case (_item in (primaryWeaponItems player)): {
                            _wpitem = true;
                        };

                        default {
                            player removeItem _item;
                        };
                    };
                };
            };
        };
    };
    
    default {
        player removeItem _item;
    };
};

_money = _money + _price;
serverPlayerMoney set [_moneyIndex, [(getPlayerUID _player), _money]];

[[(_item select 0),_money,_controller,_wpitem,_attachments],"SPMC_fnc_syncSaleConfirm",(owner _player),false] spawn BIS_fnc_MP;