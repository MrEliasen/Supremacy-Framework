/**
 * _master.sqf
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

// Framework Config
SPMC_fnc_config = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\core\config.sqf";
SPMC_fnc_getItemCfgDetails = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\core\getItemCfgDetails.sqf";
SPMC_fnc_spawnBuildings = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\core\spawnBuildings.sqf";
publicVariable "SPMC_fnc_config";
publicVariable "SPMC_fnc_spawnBuildings";
publicVariable "SPMC_fnc_getItemCfgDetails";

// Core scripts
SPMC_fnc_findIndex = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\core\findIndex.sqf";
SPMC_fnc_getItemCfgDetails = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\core\getItemCfgDetails.sqf";
SPMC_fnc_spawnBuildings = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\core\spawnBuildings.sqf";
publicVariable "SPMC_fnc_findIndex";
publicVariable "SPMC_fnc_getItemCfgDetails";
publicVariable "SPMC_fnc_spawnBuildings";

// Economy
SPMC_fnc_svrConfirmSale = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\economy\svrConfirmSale.sqf";
SPMC_fnc_svrSyncPurchase = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\economy\svrSyncPurchase.sqf";
SPMC_fnc_svrSyncMoney = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\economy\svrSyncMoney.sqf";

// Loot creates
SPMC_fnc_setupWorldLootCrate = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\lootcrate\setupVehicleLoot.sqf";
SPMC_fnc_setupVehicleLoot = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\lootcrate\setupWorldLootCrate.sqf";
SPMC_fnc_setupAirDropLoot = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\lootcrate\setupAirDropLoot.sqf";

// Air drop scripts
SPMC_fnc_callAirDrop = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\airdrop\callAirDrop.sqf";
SPMC_fnc_airDrop = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\airdrop\airDrop.sqf";
SPMC_fnc_airDropFX = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\airdrop\airDropFX.sqf";
SPMC_fnc_initAirDropTimer = compileFinal preprocessfilelinenumbers "\supremacy_server\compile\airdrop\initAirDropTimer.sqf";
"#FX" addPublicVariableEventHandler { _this select 1 spawn SPMC_fnc_airDropFX };