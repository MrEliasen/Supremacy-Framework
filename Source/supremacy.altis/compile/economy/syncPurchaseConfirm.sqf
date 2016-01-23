/**
 * syncPurchaseConfirm.sqf
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

private["_item","_price","_confirmed","_money","_controller","_priceIndex","_pricelist"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
_confirmed = [_this,1,false,[false]] call BIS_fnc_param;
_money = [_this,2,0,[0]] call BIS_fnc_param;
_controller = [_this,3,0,[0]] call BIS_fnc_param;
_toBackpack = [_this,4,false,[false]] call BIS_fnc_param;
_price = 0;

if (_item != "") then {
    _item = [_item] call SPMC_fnc_getItemCfgDetails;
    _pricelist = ["item_prices"] call SPMC_fnc_config;

    _priceIndex = [(_item select 0), _pricelist] call SPMC_fnc_findIndex;
    if (_priceIndex != -1) then {
        _price = (_pricelist select _priceIndex) select 1;
    };

    if (_confirmed) then {
        // Because these actions cannot be executed (at time of writing) from the server properly, we have to do it here.. sadly.
        switch ((_item select 7)) do {
            case ("CfgWeapons"): {
                switch ((_item select 5)) do {
                    case 1: {
                        if (!_toBackpack) then {
                            player addWeapon (_item select 0);
                            player selectWeapon (_item select 0);
                        };
                    };
                    case 2: {
                        if (!_toBackpack) then {
                            player addWeapon (_item select 0);
                            if ((currentWeapon player) == "") then {
                                player selectWeapon (_item select 0);
                            };
                        };
                    };
                    case 4: {
                        if (!_toBackpack) then {
                            player addWeapon (_item select 0);
                            if ((currentWeapon player) == "") then {
                                player selectWeapon (_item select 0);
                            };
                        };
                    };
                    default {
                        switch((_item select 6)) do {
                            case 101;
                            case 201;
                            case 301;
                            case 302: {
                                if (!_toBackpack) then {
                                    if ((primaryWeapon player) == (currentWeapon player)) then {
                                        player addPrimaryWeaponItem (_item select 0);
                                    } else {
                                        if ((secondaryWeapon player) == (currentWeapon player)) then {
                                            player addSecondaryWeaponItem (_item select 0);
                                        } else {
                                            player addHandgunItem (_item select 0);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };

        hint format["%1 purchased for %2%3!", (_item select 1), ['currency_symbol'] call SPMC_fnc_config, _price];
        player say3D "purchase";
        sleep 0.73;
    } else {
        hint format["%1 purchase failed!", (_item select 1)];
        player say3D "error";
    };
};

SPMC_gbl_money = _money;

switch (true) do {
    case (!isNull (findDisplay 2300) && _controller > 2300 && _controller < 2400): { 
        ctrlEnable[_controller, true];
    };
    case (!isNull (findDisplay 2600) && _controller > 2600 && _controller < 2700): { 
        ctrlEnable[_controller, true];
    }; 
    case (!isNull (findDisplay 2700) && _controller > 2700 && _controller < 2800): { 
        ctrlEnable[_controller, true];
    }; 
};