/**
 * playerEvents.sqf
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

player addEventHandler ["Respawn", {
    _this call SPMC_fnc_playerRespawn;
}];
player addEventHandler ["Killed", {
    _this call SPMC_fnc_playerKilled;
}];

// Thanks to Killzone_Kid for the inventory sound "hack";
player addEventHandler ["InventoryOpened", {
    if (_this select 1 isKindOf "Bag_Base") then {
        playSound3D ["a3\sounds_f\characters\stances\concrete_adjust_prone_left.wss",objNull, false, _this select 1 modelToWorld [0,0,0]];
    };
}];
player addEventHandler ["InventoryClosed", {
    if (_this select 1 isKindOf "Bag_Base") then {
        playSound3D ["a3\sounds_f\characters\stances\concrete_adjust_prone_right.wss",objNull, false, _this select 1 modelToWorld [0,0,0]];
    };
}];

player addEventHandler ["HandleDamage", {
    _this call SPMC_fnc_playerDamaged;
}];