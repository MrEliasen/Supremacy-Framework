/**
 * setup.sqf
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
private ["_spawnBlock","_limit","_debug"];
serverStatus = "SERVER: Generating safe spawn area";
publicVariable "serverStatus";

if (debugMode) then {
    diag_log serverStatus;
};

// create safe spawn by encapsulating it with 2 hangars
_spawnBlock = createVehicle ["Land_Hangar_F", [0,0,0], [], 0, "NONE"];
_spawnBlock setDir (markerDir "spawn_block_left");
_spawnBlock setPosATL (getMarkerPos "spawn_block_left");
_spawnBlock allowDamage false;

_spawnBlock = createVehicle ["Land_Hangar_F", [0,0,0], [], 0, "NONE"];
_spawnBlock setDir (markerDir "spawn_block_right");
_spawnBlock setPosATL (getMarkerPos "spawn_block_right");
_spawnBlock allowDamage false;

[] spawn {
    private ["_complete"];
    _complete = false;

    while {!_complete} do {
        serverStatus = format["SERVER: Running setup - %1%2 Complete.", round ((serverStatusLootVehicle + serverStatusLootCrates + serverStatusLootStationery) / 3), "%"];
        publicVariable "serverStatus";

        if (serverStatusLootVehicle == 100 && serverStatusLootCrates == 100 && serverStatusLootStationery == 100) then {
            _complete = true;
        } else {
            sleep 1;
        };
    };

    serverStatus = "SERVER: Initiating air drop timer";
    publicVariable "serverStatus";

    if (debugMode) then {
        diag_log serverStatus;
    };

    // Init air drops
    [] call SPMC_fnc_initAirDropTimer;

    diag_log "SERVER: Ready!";
    serverIsReady = true;
    publicVariable "serverIsReady";
};

[] spawn {
    private ["_limit","_percent"];
    // Spawn world loot boxes
    _limit = (["loot_crate_limit"] call SPMC_fnc_config);
    _percent = (100/_limit);

    if (debugMode) then {
        diag_log format["SERVER: Spawning %1 world loot", _limit];
    };

    for "_i" from 1 to _limit do
    {
        private["_m","_pos","_holder"];

        _pos = ["world_item_spawn",0,["system_safezone"],450] call SHK_pos;
        _holder = createVehicle ["IG_supplyCrate_F",[(_pos select 0),(_pos select 1),(_pos select 2)+0.2], [], 0, "can_Collide"];
        _holder allowDamage false;
        sleep 0.1;

        [_holder] call SPMC_fnc_setupWorldLootCrate;

        if (debugMode) then {
            _m = createMarker [format["mPos%1%2",(getPos _holder) select 0, (getPos _holder) select 1],(getPos _holder)];
            _m setmarkerColor "ColorRed";
            _m setMarkerShape "Icon";
            _m setMarkerType "mil_dot";
        };

        serverStatusLootCrates = _percent * _i;

        if(_i == _limit) then {
            serverStatusLootCrates = 100;
        }
    };
};

[] spawn {
    private ["_limit","_percent"];
    // Spawn world vehicles
    _limit = (["loot_vehicle_limit"] call SPMC_fnc_config);
    _percent = (100/_limit);

    if (debugMode) then {
        diag_log format["SERVER: Spawning %1 world vehicles", _limit];
    };

    for "_i" from 1 to _limit do
    {
        private["_m","_pos","_holder","_vehicle","_r"];
        _r = random(100);

        if (_r > 10) then {
            _vehicle = (["ground_vehicles"] call SPMC_fnc_config) call bis_fnc_selectRandom;
        } else {
            _vehicle = (["air_vehicles"] call SPMC_fnc_config) call bis_fnc_selectRandom;
        };
        
        _pos = ["world_item_spawn",0,["system_safezone"],450] call SHK_pos;
        _holder = createVehicle [_vehicle,[(_pos select 0),(_pos select 1),(_pos select 2)+0.2], [], 0, "can_Collide"];
        sleep 0.1;

        // only place land vehicles at roads.
        if (getText(configFile >> "CfgVehicles" >> (typeOf _holder) >> "vehicleClass") != "air") then {
            _pos = [_holder,[0,300],random 360,0,[1,350]] call SHK_pos;
            _holder setPosATL [(_pos select 0) + 10,(_pos select 1) + 10,(_pos select 2)-0.2];
        };

        clearBackpackCargoGlobal _holder;
        clearWeaponCargoGlobal _holder;
        clearMagazineCargoGlobal _holder;
        clearItemCargoGlobal _holder;
        [_holder] call SPMC_fnc_setupVehicleLoot;

        if (debugMode) then {
            _m = createMarker [format["mPos%1%2",(getPos _holder) select 0, (getPos _holder) select 1],(getPos _holder)];
            _m setmarkerColor "ColorBlue";
            _m setMarkerShape "Icon";
            _m setMarkerType "mil_dot";
        };

        serverStatusLootVehicle = _percent * _i;

        if(_i == _limit) then {
            serverStatusLootVehicle = 100;
        }
    };
};

[] spawn {
    private ["_limit","_percent"];
    // Spawn world stationaries
    _limit = (["loot_stationery_limit"] call SPMC_fnc_config);
    _percent = (100/_limit);

    if (debugMode) then {
        diag_log format["SERVER: Spawning %1 world stationery items", _limit];
    };

    for "_i" from 1 to _limit do
    {
        private["_m","_pos","_holder","_vehicle"];
        _vehicle = (["stationery_items"] call SPMC_fnc_config) call bis_fnc_selectRandom;
        
        _pos = ["world_item_spawn",0,["system_safezone"],450] call SHK_pos;
        _holder = createVehicle [_vehicle,[(_pos select 0),(_pos select 1),(_pos select 2)], [], 0, "none"];
        sleep 0.1;

        if (debugMode) then {
            _m = createMarker [format["mPos%1%2",(getPos _holder) select 0, (getPos _holder) select 1],(getPos _holder)];
            _m setmarkerColor "ColorBlack";
            _m setMarkerShape "Icon";
            _m setMarkerType "mil_dot";
        };

        serverStatusLootStationery = _percent * _i;

        if(_i == _limit) then {
            serverStatusLootStationery = 100;
        }
    };
};