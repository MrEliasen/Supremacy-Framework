/**
 * showClothesShop.sqf
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

private["_shopLists","_plist","_skillDiscount"];
if (!alive player || dialog) exitWith {};
_skillDiscount = 1.0;

createDialog "SPMC_shop_clothes";
disableSerialization;

waitUntil {sleep 0.1; !isNull (findDisplay 2700)};

// Update the price if the player have the Silver Tongue skill line
if (("silver-1" in SPMC_gbl_learnedSkills)) then {
    for "_i" from 2 to 50 do {
        if (!(format ["silver-%1", _i] in SPMC_gbl_learnedSkills)) exitWith {
            _skillDiscount = ([format["silver-%1", (_i - 1)]] call SPMC_fnc_getSkillDetails select 5) select 0;
        };
    };
};

_skillDiscount = (1.0 - _skillDiscount / 100);

_plist = ["item_prices"] call SPMC_fnc_config;
_shopLists = [
    [2701, (["equip_clothes"] call SPMC_fnc_config)],
    [2702, (["equip_hats"] call SPMC_fnc_config)],
    [2703, (["equip_glasses"] call SPMC_fnc_config)],
    [2704, (["equip_vests"] call SPMC_fnc_config)],
    [2705, (["equip_backpacks"] call SPMC_fnc_config)]
];

{
    [_plist,_x,_skillDiscount] spawn {
        private["_pricelist","_y","_list","_pricelist","_skillDiscount"];
        _pricelist = [_this,0,[],[[]]] call BIS_fnc_param;
        _y = [_this,1,[],[[]]] call BIS_fnc_param;
        _skillDiscount = [_this,2,1.0,[1.0]] call BIS_fnc_param;
        disableSerialization;

        _list = (findDisplay 2700) displayCtrl (_y select 0);
        lbClear _list;

        {
            private ["_itemInfo","_index","_value"];
            _itemInfo = [_x] call SPMC_fnc_getItemCfgDetails;
            _index = [_x, _pricelist] call SPMC_fnc_findIndex;
            _value = 0;

            if (_index != -1) then {
                _value = ((_pricelist select _index) select 1) * _skillDiscount;
            };

            _list lbAdd (_itemInfo select 1);
            _list lbSetData[(lbSize _list) - 1, _x];
            _list lbSetValue[(lbSize _list) - 1, _value];
            _list lbSetPicture[(lbSize _list) - 1, (_itemInfo select 3)];

        } foreach (_y select 1);
    };
} foreach _shopLists;

// Sync the player gear when the shop window closes.
[] spawn {
    private ["_open"];
    _open = true;

    while {_open} do {
        if (isNull (findDisplay 2700)) then {
            _open = false;
        };

        sleep 1;
    };

    ["equipment", true] spawn SPMC_fnc_syncPlayerData;  
};