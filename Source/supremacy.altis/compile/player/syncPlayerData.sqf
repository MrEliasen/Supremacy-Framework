/**
 * syncPlayerData.sqf
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

private["_type","_silent","_data"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_silent = [_this,1,false,[false]] call BIS_fnc_param;;
_data = [];

switch (_type) do {
    case "stats": {
        _data = [
            damage player,
            getFatigue player
        ];
    };

    case "equipment": {
        _data = [
            [primaryWeapon player, (primaryWeaponItems player)],
            [secondaryWeapon player, (secondaryWeaponItems player)],
            [handgunWeapon player, (handgunItems player)],
            (headgear player),
            [(uniform player), (uniformItems player)],
            [(vest player), (vestItems player)],
            [(backpack player), (backPackItems player)],
            (assignedItems player)
        ];
    };

    case "everything": {
        _data = [
            profileName,
            [
                damage player,
                getFatigue player
            ],
            [
                [primaryWeapon player, (primaryWeaponItems player)],
                [secondaryWeapon player, (secondaryWeaponItems player)],
                [handgunWeapon player, (handgunItems player)],
                (headgear player),
                [(uniform player), (uniformItems player)],
                [(vest player), (vestItems player)],
                [(backpack player), (backPackItems player)],
                (assignedItems player)
            ]
        ];
    };
};

if (count _data > 0) then {
    [[player, _type, _data, _silent],"SPMC_fnc_svrSyncPlayerData",false,false] spawn BIS_fnc_MP;
};