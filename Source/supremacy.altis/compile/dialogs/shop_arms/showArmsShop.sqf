/**
 * showArmsShop.sqf
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

private["_plist"];
if (!alive player || dialog) exitWith {};

createDialog "SPMC_shop_arms";
disableSerialization;

waitUntil {sleep 0.1; !isNull (findDisplay 2300)};
_plist = ["item_prices"] call SPMC_fnc_config;

[_plist] spawn {
    private["_pricelist","_list"];
    _pricelist = [_this,0,[],[[]]] call BIS_fnc_param;
    disableSerialization;

    _list = (findDisplay 2300) displayCtrl 2302;
    lbClear _list;

    {
        private ["_ammoInfo","_value"];
        _ammoInfo = [_x] call SPMC_fnc_getItemCfgDetails;
        _index = [_x, _pricelist] call SPMC_fnc_findIndex;
        _value = 0;

        if (_index != -1) then {
            _value = (_pricelist select _index) select 1;
        };

        _list lbAdd (_ammoInfo select 1);
        _list lbSetData[(lbSize _list) - 1, _x];
        _list lbSetValue[(lbSize _list) - 1, _value];
        _list lbSetPicture[(lbSize _list) - 1, (_ammoInfo select 3)];

    } foreach (["equip_throwables"] call SPMC_fnc_config);
};


[_plist] spawn {
    private["_pricelist","_list","_ammoC","_temp"];
    _pricelist = [_this,0,[],[[]]] call BIS_fnc_param;
    disableSerialization;

    _list = (findDisplay 2300) displayCtrl 2301;
    _temp = (findDisplay 2300) displayCtrl 2302;
    lbClear _list;
    _ammoC = [];

    {
        private ["_itemInfo","_y","_value"];
        _y = _x;
        _itemInfo = [_y] call SPMC_fnc_getItemCfgDetails;
        _index = [_y, _pricelist] call SPMC_fnc_findIndex;
        _value = 0;

        if (_index != -1) then {
            _value = (_pricelist select _index) select 1;
        };

        _list lbAdd (_itemInfo select 1);
        _list lbSetData[(lbSize _list) - 1, _y];
        _list lbSetValue[(lbSize _list) - 1, _value];
        _list lbSetPicture[(lbSize _list) - 1, (_itemInfo select 3)];

        if ((_itemInfo select 0) == currentWeapon player) then {
            lbSetCurSel[2301, (lbSize _list) - 1];
        };

        {
            private ["_ammoInfo","_value"];
            _ammoInfo = [_x] call SPMC_fnc_getItemCfgDetails;
            _value = 0;

            if (!(_x in _ammoC)) then {
                if (([_x, _pricelist] call SPMC_fnc_findIndex) != -1) then {
                    _value = (_pricelist select _index) select 1;
                };

                _ammoC = _ammoC + [_x];
                _temp lbAdd (_ammoInfo select 1);
                _temp lbSetData[(lbSize _temp) - 1, _x];
                _temp lbSetValue[(lbSize _temp) - 1, _value];
                _temp lbSetPicture[(lbSize _temp) - 1, (_ammoInfo select 3)];
            };
        } foreach (_itemInfo select 8);

    } foreach (["equip_weapons"] call SPMC_fnc_config);
};

[_plist] spawn {
    private["_pricelist","_list","_temp"];
    _pricelist = [_this,0,[],[[]]] call BIS_fnc_param;
    _temp = ["equip_attachments"] call SPMC_fnc_config;
    disableSerialization;

    _list = (findDisplay 2300) displayCtrl 2303;
    lbClear _list;

    {
        private ["_itemInfo","_value"];
        _itemInfo = [_x] call SPMC_fnc_getItemCfgDetails;
        _index = [_x, _pricelist] call SPMC_fnc_findIndex;
        _value = 0;

        if (_index != -1) then {
            _value = (_pricelist select _index) select 1;
        };

        _list lbAdd (_itemInfo select 1);
        _list lbSetData[(lbSize _list) - 1, _x];
        _list lbSetValue[(lbSize _list) - 1, _value];
        _list lbSetPicture[(lbSize _list) - 1, (_itemInfo select 3)];

    } foreach ((_temp select 0) + (_temp select 1) + (_temp select 2) + (_temp select 3));
};

[_plist] spawn {
    private["_pricelist","_list"];
    _pricelist = [_this,0,[],[[]]] call BIS_fnc_param;
    disableSerialization;
    
    _list = (findDisplay 2300) displayCtrl 2304;
    lbClear _list;

    {
        private ["_itemInfo","_value"];
        _itemInfo = [_x] call SPMC_fnc_getItemCfgDetails;
        _index = [_x, _pricelist] call SPMC_fnc_findIndex;
        _value = 0;

        if (_index != -1) then {
            _value = (_pricelist select _index) select 1;
        };

        _list lbAdd (_itemInfo select 1);
        _list lbSetData[(lbSize _list) - 1, _x];
        _list lbSetValue[(lbSize _list) - 1, _value];
        _list lbSetPicture[(lbSize _list) - 1, (_itemInfo select 3)];

    } foreach (["equip_items"] call SPMC_fnc_config);
};

// Sync the player gear when the shop window closes.
[] spawn {
    private ["_open"];
    _open = true;

    while {_open} do {
        if (isNull (findDisplay 2300)) then {
            _open = false;
        };

        sleep 1;
    };

    ["equipment", true] spawn SPMC_fnc_syncPlayerData;  
};