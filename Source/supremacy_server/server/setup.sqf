/**
 * setup.sqf
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
private ["_spawnBlock","_limit","_debug"];
serverStatus = "SERVER: Generating safe spawn area";
publicVariable "serverStatus";
if (debugMode) then {
    diag_log serverStatus;
};

[] spawn {
    private ["_complete"];
    _complete = false;

    while {!_complete} do {
        serverStatus = format["SERVER: Running setup - %1%2 Complete.", round ((serverStatusLootVehicle + serverStatusLootCrates + serverStatusLootStationery + serverStatusLootBuildings) / 4), "%"];
        publicVariable "serverStatus";

        if (serverStatusLootVehicle == 100 && serverStatusLootCrates == 100 && serverStatusLootStationery == 100 && serverStatusLootBuildings == 100) then {
            _complete = true;
        } else {
            sleep 1.5;
        };
    };

    if ((["airdrop_interval"] call SPMC_fnc_config) > 0) then {
        serverStatus = "SERVER: Initiating air drop timer";
        publicVariable "serverStatus";

        if (debugMode) then {
            diag_log serverStatus;
        };

        // Init air drops
        [] call SPMC_fnc_initAirDropTimer;
    };

    diag_log "SERVER: Ready!";
    serverIsReady = true;
    publicVariable "serverIsReady";
};

[] spawn {
    private ["_limit","_percent"];
    // Spawn world loot boxes
    _limit = (["loot_crate_limit"] call SPMC_fnc_config);

    if (_limit > 0) then {
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
                _m setMarkerText "Supply Crate";
            };

            serverStatusLootCrates = _percent * _i;

            if(_i == _limit) exitWith {
                serverStatusLootCrates = 100;
            };
            
        };
    } else {
        serverStatusLootCrates = 100;

        if (debugMode) then {
            diag_log format["SERVER: Loot crate spawn count: %1, skipping.", _limit];
        };
    };
};

[] spawn {
    private ["_limit","_percent"];
    // Spawn world vehicles
    _limit = (["loot_vehicle_limit"] call SPMC_fnc_config);

    if (_limit > 0) then {
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
                _m setMarkerText _vehicle;
            };

            serverStatusLootVehicle = _percent * _i;

            if(_i == _limit) exitWith {
                serverStatusLootVehicle = 100;
            };
            
        };
    } else {
        serverStatusLootVehicle = 100;

        if (debugMode) then {
            diag_log format["SERVER: Vehicle spawn count: %1, skipping.", _limit];
        };
    };
};

[] spawn {
    private ["_limit","_percent"];
    // Spawn world stationaries
    _limit = (["loot_stationery_limit"] call SPMC_fnc_config);

    if (_limit > 0) then {
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
                _m setMarkerText _vehicle;
            };

            serverStatusLootStationery = _percent * _i;

            if(_i == _limit) exitWith {
                serverStatusLootStationery = 100;
            };
        };
    } else {
        serverStatusLootStationery = 100;

        if (debugMode) then {
            diag_log format["SERVER: Stationary spawn count: %1, skipping.", _limit];
        };
    };
};

[] spawn {
    private ["_buildings","_limit","_percent","_chance"];
    // Spawn loot in buildings
    _chance = ["house_loot_percent"] call SPMC_fnc_config;

    if (_chance > 0) then { 
        _buildings = ((getMarkerPos "world_item_spawn") nearObjects ["House",((getMarkerSize "world_item_spawn") select 0)]);
        _limit = (count _buildings) - 1;
        _percent = (100/_limit);

        if (debugMode) then {
            diag_log format["SERVER: Spawning loot in ~%1 buildings.", ((_limit + 1) * (_chance/100))];
        };

        // wait for the first player to join in - else the items won't be visible to the players for some reason?
        while {serverStatusLootBuildings == -1} do {
            sleep 1.5;
        };

        {
            // n% chance of gear spawning in that building.
            if (random 100 <= _chance) then {
                [_x] spawn SPMC_fnc_spawnBuildingLoot;
            };

            serverStatusLootBuildings = _percent * _forEachIndex;

            if(_forEachIndex == _limit) exitWith {
                serverStatusLootBuildings = 100;
            };
            
        } foreach _buildings;
    } else {
        serverStatusLootBuildings = 100;
        
        if (debugMode) then {
            diag_log format["SERVER: Loot spawn chance: %1, skipping.", _chance];
        };
    };
};