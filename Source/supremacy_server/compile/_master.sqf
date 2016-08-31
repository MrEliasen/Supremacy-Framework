/**
 * _master.sqf
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

// Framework Core scripts
SPMC_fnc_config = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\core\config.sqf";
SPMC_fnc_findIndex = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\core\findIndex.sqf";
SPMC_fnc_getItemCfgDetails = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\core\getItemCfgDetails.sqf";
SPMC_fnc_spawnBuildings = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\core\spawnBuildings.sqf";
SPMC_fnc_initWorldLoot = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\core\initWorldLoot.sqf";
SPMC_fnc_svrSystemMessage = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\core\systemMessage.sqf";
SPMC_fnc_initTimedRewards = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\core\initTimedRewards.sqf";
publicVariable "SPMC_fnc_config";
publicVariable "SPMC_fnc_findIndex";
publicVariable "SPMC_fnc_getItemCfgDetails";
publicVariable "SPMC_fnc_spawnBuildings";

// Player
SPMC_fnc_svrRequestPlayerData = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\player\svrRequestPlayerData.sqf";
SPMC_fnc_svrSyncPlayerData = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\player\svrSyncPlayerData.sqf";
SPMC_fnc_svrRepack = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\player\svrRepack.sqf";
publicVariable "SPMC_fnc_svrRepack";

// Economy
SPMC_fnc_svrSyncSale = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\economy\svrSyncSale.sqf";
SPMC_fnc_svrSyncPurchase = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\economy\svrSyncPurchase.sqf";
SPMC_fnc_svrSyncMoney = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\economy\svrSyncMoney.sqf";

// Loot creates
SPMC_fnc_setupWorldLootCrate = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\loot\setupWorldLootCrate.sqf";
SPMC_fnc_setupVehicleLoot = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\loot\setupVehicleLoot.sqf";
SPMC_fnc_setupAirDropLoot = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\loot\setupAirDropLoot.sqf";
SPMC_fnc_spawnBuildingLoot = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\loot\spawnBuildingLoot.sqf";

// Air drop scripts
SPMC_fnc_callAirDrop = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\airdrop\callAirDrop.sqf";
SPMC_fnc_airDrop = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\airdrop\airDrop.sqf";
SPMC_fnc_airDropFX = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\airdrop\airDropFX.sqf";
SPMC_fnc_initAirDropTimer = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\airdrop\initAirDropTimer.sqf";
"#FX" addPublicVariableEventHandler { _this select 1 spawn SPMC_fnc_airDropFX };

// Skills
SPMC_fnc_skillsList = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\skills\skillsList.sqf";
SPMC_fnc_svrLearnSkill = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\skills\svrLearnSkill.sqf";
SPMC_fnc_svrResetSkills = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\skills\svrResetSkills.sqf";
SPMC_fnc_getSkillDetails = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\skills\getSkillDetails.sqf";
SPMC_fnc_svrGiveExpReward = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\skills\svrGiveExpReward.sqf";
SPMC_fnc_grantExperience = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\skills\grantExperience.sqf";
publicVariable "SPMC_fnc_skillsList";
publicVariable "SPMC_fnc_getSkillDetails";