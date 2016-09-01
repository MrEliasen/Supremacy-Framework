/**
 * svrRepack.sqf
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @package    Supremacy Framework
 * @author     Mark Eliasen <https://github.com/MrEliasen>
 * @copyright  2016 Mark Eliasen
 * @license    CC BY-NC 3.0 License
 * @link       https://github.com/MrEliasen/Supremacy-Framework
 */

private ["_magSize","_ammo","_currentMags","_index","_rounds","_max","_roundsLeft","_usedMags"];
_usedMags = [];
_ammo = []; // result example: [["className": <total rounds>], ["className": <total rounds>]]
_currentMags = (magazinesAmmoFull player);

if (debugMode) then {
    diag_log "------Repacking------";
};

{
    // only pack primary and sidearm ammo
    _magSize = getNumber (configFile >> "cfgMagazines" >> (_x select 0) >> "count");

    if (_magSize > (_x select 1)) then {
        _index = [(_x select 0), _usedMags] call SPMC_fnc_findIndex;

        if (_index == -1) then {
            _usedMags set [count _usedMags, [(_x select 0), 0]];
            _index = (count _usedMags) - 1;
        };

        _usedMags set [_index, [(_x select 0), ((_usedMags select _index) select 1) + 1]];
    };
} forEach _currentMags;

if (debugMode) then {
    diag_log "------UsedMags------";
    diag_log _usedMags;
};

{
    _index = [(_x select 0), _usedMags] call SPMC_fnc_findIndex;

    if (_index != -1) then {
        if (((_usedMags select _index) select 1) > 1) then {
            _index = [(_x select 0), _ammo] call SPMC_fnc_findIndex;

            if (_index == -1) then {
                _ammo set [count _ammo, [(_x select 0), 0]];
                _index = (count _ammo) - 1;
            };

            if (debugMode) then {
                diag_log (_x select 1);
            };

            _ammo set [_index, [(_x select 0), ((_ammo select _index) select 1) + (_x select 1)]];

            if (_x select 2) then {
                switch (_x select 3) do { 
                    case 1 : {
                        player setAmmo [primaryWeapon player, 0];
                    }; 
                    
                    case 2 : {
                        player setAmmo [handgunWeapon player, 0];
                    };
                };
            };

            player removeMagazines (_x select 0);
        };
    };
} forEach _currentMags;

if (debugMode) then {
    diag_log "------Ammo------";
    diag_log _ammo;
};

// if there are no repackable ammo we just stop here.
if (count _ammo == 0) exitWith {
    hint "Nothing to repack!";
    playSound "AddItemFailed";
};

// generate the new number of mags, based on the rounds they had, and the number of rounds the mag holds.
{
    _magSize = getNumber (configFile >> "cfgMagazines" >> (_x select 0) >> "count");
    _rounds = (_x select 1);
    _max = floor (_rounds / _magSize);
    _roundsLeft = _rounds - (_magSize * _max);

    player addMagazines [(_x select 0), _max];

    if (_roundsLeft > 0) then
    {
        player addMagazine [(_x select 0), _roundsLeft];
    };
} forEach _ammo;

[] spawn {
    [] spawn { 
        playSound "AddItemOK";   
    }; 
    sleep 0.1; 
    [] spawn { 
        playSound "AddItemOK";   
    }; 
    sleep 0.1; 
    [] spawn { 
        playSound "AddItemOK";   
    };
};

hint "Repacking Completed! (You may need to reload)";