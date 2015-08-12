/**
 * config.sqf
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @package    Supremacy Framework
 * @author     Mark Eliasen <https://github.com/MrEliasen>
 * @copyright  2015 Mark Eliasen
 * @license    MIT License
 * @link       https://github.com/MrEliasen/SupremacyFramework
 */

SPMC_fnc_showVehicleMenu = compileFinal "
private[""_type"",""_spawns"",""_pricelist"",""_typeList""];
_type = [_this,0,"""",[""""]] call BIS_fnc_param;
_spawns = [_this,1,[],[[]]] call BIS_fnc_param;
_pricelist = [""item_prices""] call SPMC_fnc_config;
_typeList = [];

if (!(alive player) || _type == """" || (count _spawns) == 0) exitWith {};

createDialog ""SPMC_shop_vehicle"";
disableSerialization;

waitUntil {sleep 0.1; !isNull (findDisplay 2600)};

switch (_type) do {
    case ""land"";
    case ""ground"": {
        _typeList set [count _typeList, ([""ground_vehicles""] call SPMC_fnc_config)];
        _typeList set [count _typeList, [""Car"",""Tank"",""Armored"",""Support"",""Truck""]];
    };
    case ""air"": {
        _typeList set [count _typeList, ([""air_vehicles""] call SPMC_fnc_config)];
        _typeList set [count _typeList, [""air""]];
    };
    case ""water"": {
        _typeList set [count _typeList, ([""water_vehicles""] call SPMC_fnc_config)];
        _typeList set [count _typeList, [""ship"",""submarine""]];
    };
};

if ((count _typeList) == 0) exitWith {closeDialog 0;};

_list = (findDisplay 2600) displayCtrl 2601;
lbClear _list;

{
    private [""_vehInfo"",""_value""];
    _vehInfo = [_x] call SPMC_fnc_getItemCfgDetails;
    _index = [_x, _pricelist] call SPMC_fnc_findIndex;
    _value = 0;

    if (_index != -1) then {
        _value = (_pricelist select _index) select 1;
    };

    _list lbAdd (_vehInfo select 1);
    _list lbSetData[(lbSize _list) - 1, _x];
    _list lbSetValue[(lbSize _list) - 1, _value];
    _list lbSetPicture[(lbSize _list) - 1, (_vehInfo select 3)];

} foreach (_typeList select 0);


_list = (findDisplay 2600) displayCtrl 2602;
lbClear _list;

{
    private [""_vehInfo"",""_value"",""_empty""];
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
            _value = (_pricelist select _index) select 1;
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
];";

SPMC_fnc_vehicleShopBuyVehicleSelected = compileFinal "
private[""_vehicle"",""_pricelist"",""_index"",""_value""];
disableSerialization;

_vehicle = [lbData [2601, lbCurSel(2601)]] call SPMC_fnc_getItemCfgDetails;
_pricelist = [""item_prices""] call SPMC_fnc_config;
_index = [_x, _pricelist] call SPMC_fnc_findIndex;
_value = 0;

if (_index != -1) then {
    _value = (_pricelist select _index) select 1;
};

((findDisplay 2600) displayCtrl 2603) ctrlSetStructuredText parseText format[
""<img size='9' image='%1'/><br/>
Name: <t color='#ffae2b'>%2</t><br/>
Armor: <t color='#ffae2b'>%3</t><br/>
Max Speed: <t color='#ffae2b'>%4</t><br/>
Fuel Capacity: <t color='#ffae2b'>%5</t><br/>
Engine Power: <t color='#ffae2b'>%6</t><br/>
Price: <t color='#27e640'>$%7</t>"",
(_vehicle select 3),
(_vehicle select 1),
(_vehicle select 8),
(_vehicle select 9),
(_vehicle select 10),
(_vehicle select 11),
[_value] call fnc_numberToText];";

SPMC_fnc_vehicleShopSellVehicleSelected = compileFinal "
private[""_vehicle"",""_pricelist"",""_index"",""_value""];
disableSerialization;

_vehicle = [lbData [2602, lbCurSel(2602)]] call SPMC_fnc_getItemCfgDetails;
_pricelist = [""item_prices""] call SPMC_fnc_config;
_index = [_x, _pricelist] call SPMC_fnc_findIndex;
_value = 0;

if (_index != -1) then {
    _value = (((_pricelist select _index) select 1) / 2);
};

((findDisplay 2600) displayCtrl 2604) ctrlSetStructuredText parseText format[
""<img size='9' image='%1'/><br/>
Name: <t color='#ffae2b'>%2</t><br/>
Armor: <t color='#ffae2b'>%3</t><br/>
Max Speed: <t color='#ffae2b'>%4</t><br/>
Fuel Capacity: <t color='#ffae2b'>%5</t><br/>
Engine Power: <t color='#ffae2b'>%6</t><br/>
Price: <t color='#27e640'>$%7</t>"",
(_vehicle select 3),
(_vehicle select 1),
(_vehicle select 8),
(_vehicle select 9),
(_vehicle select 10),
(_vehicle select 11),
[_value] call fnc_numberToText];";

SPMC_fnc_vehicleShopBuy = compileFinal "
private[""_vehicle"",""_pricelist"",""_index"",""_spawn""];
disableSerialization;
ctrlEnable[2605, false];
_vehicle = [lbData [2601, lbCurSel(2601)]] call SPMC_fnc_getItemCfgDetails;
_price = -1;
_spawn = """";

{
    private [""_units""];
    _units = nearestObjects[(getMarkerPos _x),[""car"",""tank"",""armored"",""support"",""truck"",""air"",""ship"",""submarine"",""man""],8];

    if ((count _units) == 0) exitWith {
        _spawn = _x
    };
} foreach (SPMC_gbl_vehicleShop select 1);

if (_spawn == """") exitWith {
    hint ""No free vehicle spawn point. Unable to puchase vehicle."";
    ctrlEnable[2605, true];
    _price;
};

_pricelist = [""item_prices""] call SPMC_fnc_config;
_index = [_x, _pricelist] call SPMC_fnc_findIndex;
if (_index != -1) then {
    _price = (_pricelist select _index) select 1;
} else {
    _price = 0;
};

_holder = createVehicle [(_vehicle select 0), (getMarkerPos _spawn), [], 0, ""none""];
_holder allowDamage false;
_holder setVectorUp (surfaceNormal (getMarkerPos _spawn));
_holder setDir (markerDir _spawn);
_holder setPos (getMarkerPos _spawn);
_holder allowDamage true;

hint format[""%1 purchased for $%2!"", (_vehicle select 1), _price];

[] spawn {
    player say3D ""purchase"";
    sleep 0.73;
    ctrlEnable[2605, true];
};

_price;";

SPMC_fnc_vehicleShopSell = compileFinal "
private[""_vehicle"",""_pricelist"",""_index"",""_spawn"",""_empty""];
disableSerialization;
ctrlEnable[2606, false];
_vehicle = [lbData [2602, lbCurSel(2602)]] call SPMC_fnc_getItemCfgDetails;
_price = -1;
_veh = objNull;

{
    if (typeOf _x == (_vehicle select 0)) exitWith {
        _veh = _x;
    };
} foreach (nearestObjects[player,(SPMC_gbl_vehicleShop select 2),10]);

if (isNull _veh) exitWith {
    ctrlEnable[2606, true];
};

_empty = true;
{
    if (alive _x) exitWith {
        _empty = false;
    };
} forEach (crew _veh);

if (!_empty) exitWith {
    ctrlEnable[2606, true];
    hint ""You cannot sell a vehicle while its occupied."";
    _price;
};

_pricelist = [""item_prices""] call SPMC_fnc_config;
_index = [_x, _pricelist] call SPMC_fnc_findIndex;
if (_index != -1) then {
    _price = (((_pricelist select _index) select 1) / 2);
} else {
    _price = 0;
};

deleteVehicle _veh;
lbDelete [2602, lbCurSel(2602)];

hint format[""%1 sold for $%2!"", (_vehicle select 1), _price];

[] spawn {
    player say3D ""sold_item"";
    sleep 0.2;
    ctrlEnable[2606, true];
};

_price;";