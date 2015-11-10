/**
 * showVehicleMenu.sqf
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

private["_type","_spawns","_pricelist","_typeList","_skillDiscount"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_spawns = [_this,1,[],[[]]] call BIS_fnc_param;
_pricelist = ["item_prices"] call SPMC_fnc_config;
_typeList = [];
_skillDiscount = 1.0;

if (!(alive player) || _type == "" || (count _spawns) == 0) exitWith {};

createDialog "SPMC_shop_vehicle";
disableSerialization;

waitUntil {sleep 0.1; !isNull (findDisplay 2600)};

// Update the price if the player have the Silver Tongue skill line
if (("silver-1" in SPMC_gbl_learnedSkills)) then {
    for "_i" from 2 to 50 do {
        if (!(format ["silver-%1", _i] in SPMC_gbl_learnedSkills)) exitWith {
            _skillDiscount = ([format["silver-%1", (_i - 1)]] call SPMC_fnc_getSkillDetails select 5) select 0;
        };
    };
};

_skillDiscount = (1.0 - _skillDiscount / 100);

switch (_type) do {
    case "land";
    case "ground": {
        _typeList set [count _typeList, (["ground_vehicles"] call SPMC_fnc_config)];
        _typeList set [count _typeList, ["Car","Tank","Armored","Support","Truck"]];
    };
    case "air": {
        _typeList set [count _typeList, (["air_vehicles"] call SPMC_fnc_config)];
        _typeList set [count _typeList, ["air"]];
    };
    case "water": {
        _typeList set [count _typeList, (["water_vehicles"] call SPMC_fnc_config)];
        _typeList set [count _typeList, ["ship","submarine"]];
    };
};

if ((count _typeList) == 0) exitWith {closeDialog 0;};

_list = (findDisplay 2600) displayCtrl 2601;
lbClear _list;

{
    private ["_vehInfo","_value"];
    _vehInfo = [_x] call SPMC_fnc_getItemCfgDetails;
    _index = [_x, _pricelist] call SPMC_fnc_findIndex;
    _value = 0;

    if (_index != -1) then {
        _value = ((_pricelist select _index) select 1) * _skillDiscount;
    };

    _list lbAdd (_vehInfo select 1);
    _list lbSetData[(lbSize _list) - 1, _x];
    _list lbSetValue[(lbSize _list) - 1, _value];
    _list lbSetPicture[(lbSize _list) - 1, (_vehInfo select 3)];

} foreach (_typeList select 0);


_list = (findDisplay 2600) displayCtrl 2602;
lbClear _list;

{
    private ["_vehInfo","_value","_empty"];
    _empty = true;
    {
        if (alive _x) exitWith {
            _empty = false;
        };
    } forEach (crew _x);

    if (_empty) then {
        _vehInfo = [(typeOf _x)] call SPMC_fnc_getItemCfgDetails;
        _index = [(_vehInfo select 0), _pricelist] call SPMC_fnc_findIndex;
        _value = 0;

        if (_index != -1) then {
            _value = ((_pricelist select _index) select 1) * _skillDiscount;
        };

        _list lbAdd (_vehInfo select 1);
        _list lbSetData[(lbSize _list) - 1, (_vehInfo select 0)];
        _list lbSetValue[(lbSize _list) - 1, _value];
        _list lbSetPicture[(lbSize _list) - 1, (_vehInfo select 3)];
    };
} foreach (nearestObjects [player, (_typeList select 1), 10]);

SPMC_gbl_vehicleShop = [
    _type,
    _spawns,
    (_typeList select 1)
];