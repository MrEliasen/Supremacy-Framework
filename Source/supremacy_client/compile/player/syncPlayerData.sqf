/**
 * syncPlayerData.sqf
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

private["_type","_silent","_data"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_silent = [_this,1,false,[false]] call BIS_fnc_param;;
_data = [];

if (!isNull (findDisplay 1900)) then {
    ((findDisplay 1900) displayCtrl 1904) ctrlSetStructuredText parseText "<t align='center'>Syncing..</t>";
    ctrlEnable[1905, false];
};

switch (_type) do {
    case "stats": {
        private ["_dmg"];
        _dmg = damage player;

        // if the player is unconsious, treat it as dead.
        if (player getVariable ["revivable", false]) then {
            _dmg = 1.0;
        };

        _data = [[
            _dmg,
            getFatigue player
        ]];
        
        if (captive player) then {
            _data = [[
                1.0,
                getFatigue player
            ]];
        };
    };

    case "location": {
        // this is just to make it sync / get past the if statement at the bottom.
        _data = [1];
    };

    case "equipment": {
        private ["_mag"];
        _mag = primaryWeaponMagazine player;

        _data = [
            [
                [primaryWeapon player, secondaryWeapon player, handgunWeapon player],
                weaponsItems player,
                (headgear player),
                [(uniform player), (uniformItems player)],
                [(vest player), (vestItems player)],
                [(backpack player), (backPackItems player)],
                (assignedItems player),
                (goggles player)
            ]
        ];
    };

    case "everything": {
        private ["_dmg"];
        _dmg = damage player;

        // if the player is unconsious, treat it as dead.
        if (player getVariable ["revivable", false]) then {
            _dmg = 1.0;
        };
        
        _data = [
            profileName,
            [
                _dmg,
                getFatigue player
            ],
            [
                [primaryWeapon player, secondaryWeapon player, handgunWeapon player],
                weaponsItems player,
                (headgear player),
                [(uniform player), (uniformItems player)],
                [(vest player), (vestItems player)],
                [(backpack player), (backPackItems player)],
                (assignedItems player),
                (goggles player)
            ]
        ];
    };
};

if (count _data > 0) then {
    [[player, _type, _data, _silent],"SPMC_fnc_svrSyncPlayerData",false,false] spawn BIS_fnc_MP;

    // We will only reset timers etc when its a full sync.
    if (_type == "everything") then {
        // Reset the last sync timer
        SPMC_gbl_lastSync = 0;

        // Specify when the next automatic sync will happen.
        SPMC_gbl_nextSync = (random 300) + 600;

        if (!isNull (findDisplay 1900)) then {
            [] call SPMC_fnc_playerMenuUpdateStats;
            ctrlEnable[1905, true];
        };
    };
};