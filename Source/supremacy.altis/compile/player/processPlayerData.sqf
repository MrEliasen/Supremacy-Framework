/**
 * processPlayerData.sqf
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

private["_money","_stats","_equipment"];
_money = [_this,0,0,[0]] call BIS_fnc_param;
_stats = [_this,1,[],[[]]] call BIS_fnc_param;
_equipment = [_this,2,[],[[]]] call BIS_fnc_param;
_experience = [_this,3,0,[0]] call BIS_fnc_param;
_skills = [_this,4,[],[[]]] call BIS_fnc_param;

SPMC_gbl_experience = _experience;
SPMC_gbl_learnedSkills = _skills;
SPMC_gbl_money = _money;

if (count _stats != 2) exitwith {
    [] call SPMC_fnc_playerSetupBambiGear;
};

if ((_stats select 0) >= 1) exitWith {
    [] call SPMC_fnc_playerSetupBambiGear;
}; 

// only process the player data if they are actually still alive.
player setDamage (_stats select 0);
player setFatigue (_stats select 1);

if (count _equipment > 0) then {
    removeAllAssignedItems player;
    removeAllWeapons player;
    removeUniform player;
    removeVest player;
    removeBackpack player;
    removeGoggles player;
    removeHeadGear player;
    removeAllItems player;

    // Add headgear
    if ((_equipment select 3) != "") then {
        player addHeadgear (_equipment select 3);
    };

    // Add uniform 
    if (((_equipment select 4) select 0) != "") then {
        player addUniform ((_equipment select 4) select 0);

        {
            if (_x != "") then {
                 player addItemToUniform _x;
            };
        } foreach ((_equipment select 4) select 1);
    };

    // Add vest 
    if (((_equipment select 5) select 0) != "") then {
        player addVest ((_equipment select 5) select 0);

        {
            if (_x != "") then {
                 player addItemToVest _x;
            };
        } foreach ((_equipment select 5) select 1);
    };

    // Add backpack 
    if (((_equipment select 6) select 0) != "") then {
        player addBackpack ((_equipment select 6) select 0);

        {
            if (_x != "") then {
                 player addItemToBackpack _x;
            };
        } foreach ((_equipment select 6) select 1);
    };

    // Add assigned items
    if (count (_equipment select 7) > 0) then {
        {
            if (_x != "") then {
                 player addItem _x;
                 player assignItem _x;
            };
        } foreach (_equipment select 7);
    };

    // Add primary weapon
    if (((_equipment select 0) select 0) != "") then {
        player addWeapon ((_equipment select 0) select 0);
        player selectWeapon ((_equipment select 0) select 0);

        {
            if (_x != "") then {
                 player addPrimaryWeaponItem _x;
            };
        } foreach ((_equipment select 0) select 1);
    };

    // Add secondary weapon
    if (((_equipment select 1) select 0) != "") then {
        player addWeapon ((_equipment select 1) select 0);

        {
            if (_x != "") then {
                 player addSecondaryWeaponItem _x;
            };
        } foreach ((_equipment select 1) select 1);
    };

    // Add handgun weapon
    if (((_equipment select 2) select 0) != "") then {
        player addWeapon ((_equipment select 2) select 0);
        
        if (((_equipment select 0) select 0) == "") then {
            player selectWeapon ((_equipment select 2) select 0);
        };
        
        {
            if (_x != "") then {
                 player addHandgunItem _x;
            };
        } foreach ((_equipment select 2) select 1);
    };
};