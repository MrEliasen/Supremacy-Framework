private ["_building","_lootList","_positions","_pos","_item","_holder","_m","_buildingPos","_ammo","_loot","_rand","_magazines"];
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
    _rand = (random 100);

    switch (true) do { 
        case (_rand >= 80) : {
            // Spawn Vests
            _loot = (((["equip_vests"] call SPMC_fnc_config) call BIS_fnc_arrayShuffle) call bis_fnc_selectRandom);
            _item addItemCargoGlobal [_loot, 1];
        };

        case (_rand < 80 && _rand >= 60) : {
            // Spawn Backpacks
            _loot = (((["equip_backpacks"] call SPMC_fnc_config) call BIS_fnc_arrayShuffle) call bis_fnc_selectRandom);
            _item addBackpackCargoGlobal [_loot, 1];
        };

        case (_rand < 60 && _rand >= 40) : {
            // Spawn Helmet/hat
            _loot = (((["equip_hats"] call SPMC_fnc_config) call BIS_fnc_arrayShuffle) call bis_fnc_selectRandom);
            _item addItemCargoGlobal [_loot, 1];
        };

        case (_rand < 40 && _rand >= 20) : {
            // Spawn Weapon
            _loot = (((["equip_weapons"] call SPMC_fnc_config) call BIS_fnc_arrayShuffle) call bis_fnc_selectRandom);
            _item addItemCargoGlobal [_loot, 1];

            // spawn some mags for the weapon as well
            _magazines = getArray (configFile / "CfgWeapons" / _loot / "magazines");

            if(count _magazines > 0) then 
            {
                _ammo = createVehicle ["groundweaponholder",[(_pos select 0),(_pos select 1),(getposATL _item select 2)], [], 0, "can_Collide"];
                _ammo addMagazineCargoGlobal [(_magazines call bis_fnc_selectRandom), floor(random 3)+1];
            };
        };
        case (_rand < 20) : {
            // Spawn Attachment
            _loot = (((["equip_attachments"] call SPMC_fnc_config) call BIS_fnc_arrayShuffle) call bis_fnc_selectRandom);
            _item addItemCargoGlobal [_loot, 1];
        };
    };
};

if (debugMode) then {
    _m = createMarker [format["mPos%1%2",floor((_pos select 0)),floor((_pos select 1))],[floor((_pos select 0)),floor((_pos select 1))]];
    _m setmarkerColor "ColorYellow";
    _m setMarkerShape "Icon";
    _m setMarkerType "mil_dot";
    _m setMarkerText _loot;
};