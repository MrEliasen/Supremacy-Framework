/**
 * getPlayerSpawn.sqf
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

private ["_spawnZone","_pos","_holder"];

if (debugMode) then {
    diag_log (["spawn_type"] call SPMC_fnc_config);;
};

switch ((["spawn_type"] call SPMC_fnc_config)) do {
    case "random_city": {
        _spawnZone = ((["spawn_points"] call SPMC_fnc_config) call bis_fnc_selectRandom) select 0;
        _pos = ([_spawnZone,0,[],(getMarkerSize _spawnZone) select 0, (typeof player)] call SHK_pos);

        if (debugMode) then {
            diag_log format["ZONE: %1", _spawnZone];
            diag_log format["POS: %1", _pos];
        };

        [_pos] spawn SPMC_fnc_spawnPlayer;
    };

    case "random_world": {
        _pos = ["world_item_spawn",0,(["spawn_excludes"] call SPMC_fnc_config),(getMarkerSize "world_item_spawn") select 0, (typeof player)] call SHK_pos;

        if (debugMode) then {
            diag_log format["%1", _pos];
        };

        _holder = createVehicle ["Land_Can_Dented_F",[(_pos select 0),(_pos select 1),(_pos select 2)+0.1], [], 0, "can_Collide"];
        _holder allowDamage false;
        _pos = [_holder,[0,500],random 360,0,[1,500],(typeof player)] call SHK_pos;
        deleteVehicle _holder;

        _pos = [
            (_pos select 0) + random(20-150),
            (_pos select 1) + random(20-150),
            (_pos select 2)
        ];

        [_pos] spawn SPMC_fnc_spawnPlayer;
    };

    default {
        [] spawn SPMC_fnc_showSpawnMenu;
    };
};