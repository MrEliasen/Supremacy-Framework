private ["_building","_lootList","_positions","_pos","_item","_holder","_m","_buildingPos","_loot"];
_building = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_lootList = [_this,1,[],[[]]] call BIS_fnc_param;
_positions = [];
_loot = "";

if (isNull _building) exitWith {};

for "_n" from 0 to 50 do {
    _buildingPos = _building buildingpos _n;
    if (str _buildingPos == "[0,0,0]") exitwith {};
    _positions = _positions + [_buildingPos];
};

if (count _positions == 0) exitWith {};

_pos = (_positions call BIS_fnc_selectRandom);

_holder = createVehicle ["Land_BarrelEmpty_F",[(_pos select 0),(_pos select 1),((_pos select 2) + 0.2)], [], 0, "can_Collide"];
sleep 0.15;

_item = createVehicle ["groundweaponholder",[(_pos select 0),(_pos select 1),(getposATL _holder select 2)], [], 0, "can_Collide"];
deletevehicle _holder;

if (count _lootList > 0) then {
    _loot = ([_lootList] call bis_fnc_selectRandom);
    _item addItemCargoGlobal [_loot, 1];
} else {
    if (random 100 > 50) then {
        // Spawn Vests
        _loot = (((["equip_vests"] call SPMC_fnc_config) call BIS_fnc_arrayShuffle) call bis_fnc_selectRandom);
        _item addItemCargoGlobal [_loot, 1];
    } else {
        // Spawn Backpacks
        _loot = (((["equip_backpacks"] call SPMC_fnc_config) call BIS_fnc_arrayShuffle) call bis_fnc_selectRandom);
        _item addBackpackCargoGlobal [_loot, 1];
    };
};

if (debugMode) then {
    _m = createMarker [format["mPos%1%2",floor((_pos select 0)),floor((_pos select 1))],[floor((_pos select 0)),floor((_pos select 1))]];
    _m setmarkerColor "ColorYellow";
    _m setMarkerShape "Icon";
    _m setMarkerType "mil_dot";
    _m setMarkerText _loot;
};