/**
 * initShops.sqf
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

private ["_arms","_ground","_air","_shopCount"];

// ARMS SHOPS
_list = ["shop_arms_npc_list"] call SPMC_fnc_config;

for "_i" from 1 to (["spawn_arms_shops"] call SPMC_fnc_config) do {
    private["_selection","_shop"];
    _selection = (_list call bis_fnc_selectRandom);
    _list = _list - [_selection];
    _pos = getPos (missionNamespace getVariable _selection);

    _m = createMarker [format["arms%1%2", _pos select 0, _pos select 1], _pos];
    _m setmarkerColor "ColorGreen";
    _m setMarkerShape "Icon";
    _m setMarkerType "n_unknown";
    _m setMarkerText "GUN SHOP";
};

{
    _y = (missionNamespace getVariable _x);
    deleteVehicle (nearestObject [_y, "Land_Research_house_V1_F"]);
    deleteVehicle _y;
} forEach _list;


// GROUND VEHICLE SHOPS
_list = ["shop_ground_vehicle_npc_list"] call SPMC_fnc_config;

for "_i" from 1 to (["spawn_ground_shops"] call SPMC_fnc_config) do {
    private["_selection"];
    _selection = (_list call bis_fnc_selectRandom);
    _list = _list - [_selection];
    _pos = getPos (missionNamespace getVariable _selection);

    _m = createMarker [format["ground%1%2", _pos select 0, _pos select 1], _pos];
    _m setmarkerColor "ColorOrange";
    _m setMarkerShape "Icon";
    _m setMarkerType "c_car";
    _m setMarkerText "GROUND VEHICLE SHOP"
};

{
    _y = (missionNamespace getVariable _x);
    deleteVehicle (nearestObject [_y, "Land_Research_house_V1_F"]);
    { deleteVehicle _x; } forEach (nearestObjects [_y, ["Land_JumpTarget_F"], 125]);
    deleteVehicle _y;
} forEach _list;



// AIR VEHICLE SHOPS
_list = ["shop_air_vehicle_npc_list"] call SPMC_fnc_config;

for "_i" from 1 to (["spawn_air_shops"] call SPMC_fnc_config) do {
    private["_selection"];
    _selection = (_list call bis_fnc_selectRandom);
    _list = _list - [_selection];
    _pos = getPos (missionNamespace getVariable _selection);

    _m = createMarker [format["arms%1%2", _pos select 0, _pos select 1], _pos];
    _m setmarkerColor "ColorBlue";
    _m setMarkerShape "Icon";
    _m setMarkerType "c_air";
    _m setMarkerText "AIR VEHICLE SHOP"
};

{
    _y = (missionNamespace getVariable _x);
    deleteVehicle (nearestObject [_y, "Land_Research_house_V1_F"]);
    { deleteVehicle _x; } forEach (nearestObjects [_y, ["Land_JumpTarget_F"], 125]);
    deleteVehicle _y;
} forEach _list;