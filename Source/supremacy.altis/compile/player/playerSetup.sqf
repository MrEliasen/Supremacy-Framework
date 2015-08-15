/**
 * playerSetup.sqf
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

private["_spawn_items"];
enableSentences false;
player enablesimulation false;

if (!(["communication_enabled"] call SPMC_fnc_config)) then {
    player disableConversation true;
    player setVariable ["BIS_noCoreConversations", true];
};

player enablefatigue (["fatigue_enabled"] call SPMC_fnc_config);

removeAllAssignedItems player;
removeAllWeapons player;
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
removeAllItems player;
{player removeMagazine _x;} foreach (magazines player);

if (SPMC_gbl_money == -1) then {
    [[player,profileName],"SPMC_fnc_svrRequestPlayerData",false,false] spawn BIS_fnc_MP;

    // wait until the player data has been received and loaded.
    while {SPMC_gbl_money == -1} do {
        sleep 0.5;
    };
} else {
    [] call SPMC_fnc_playerSetupBambiGear;
    [] call SPMC_fnc_syncMoney;
};

[] call SPMC_fnc_getPlayerSpawn;