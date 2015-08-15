/**
 * syncSaleConfirm.sqf
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

private["_item","_itemdetails","_price","_money","_controller","_wpitem","_attachments","_confirmed","_priceIndex","_pricelist"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
_money = [_this,1,0,[0]] call BIS_fnc_param;
_controller = [_this,2,0,[0]] call BIS_fnc_param;
_wpitem = [_this,3,false,[false]] call BIS_fnc_param;
_attachments = [_this,4,false,[false]] call BIS_fnc_param;
_confirmed = [_this,5,false,[false]] call BIS_fnc_param;
_price = 0;

if (_item != "") then {
    _itemdetails = [_item] call SPMC_fnc_getItemCfgDetails;
    _pricelist = ["item_prices"] call SPMC_fnc_config;

    _priceIndex = [_item, _pricelist] call SPMC_fnc_findIndex;
    if (_priceIndex != -1) then {
        _price = (_pricelist select _priceIndex) select 1;
    };

    if (_confirmed) then {
        if (_wpitem) then {
            switch (true) do {
                case (_item in (primaryWeaponItems player)): {
                    player removePrimaryWeaponItem _item;
                };
                case (_item in (secondaryWeaponItems player)): {
                    player removeSecondaryWeaponItem _item;
                };
                case (_item in (handgunItems player)): {
                    player removeHandgunItem _item;
                };

                default {
                    player removeItem _item;
                };
            };
        };

        if (_attachments) then {
            hint format["%1%2 sold for $%3!", (_itemdetails select 1), " (the attachment(s) where sold in the background)", _price];
        } else {
            hint format["%1 sold for $%2!", (_itemdetails select 1), _price];
        };

        hint format["%1 sold for $%2!", (_itemdetails select 1), _price];
        player say3D "sold_item";
        sleep 0.73;
    } else {
        hint format["Sale of the %1 failed!", (_itemdetails select 1)];
        player say3D "error";
    };
};

SPMC_gbl_money = _money;

if (!isNull (findDisplay 2400) && _controller == 2402) then { 
    ctrlEnable[2402, true];
};