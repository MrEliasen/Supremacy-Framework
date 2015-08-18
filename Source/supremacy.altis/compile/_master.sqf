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

// Core
SPMC_fnc_briefing = compileFinal preprocessfilelinenumbers "compile\core\briefing.sqf";
SPMC_fnc_showShopMenu = compileFinal preprocessfilelinenumbers "compile\core\showShopMenu.sqf";
SPMC_fnc_initHUD = compileFinal preprocessfilelinenumbers "compile\core\initHUD.sqf";

// Player
SPMC_fnc_getPlayerSpawn = compileFinal preprocessfilelinenumbers "compile\player\getPlayerSpawn.sqf";
SPMC_fnc_playerActions = compileFinal preprocessfilelinenumbers "compile\player\playerActions.sqf";
SPMC_fnc_playerEvents = compileFinal preprocessfilelinenumbers "compile\player\playerEvents.sqf";
SPMC_fnc_playerKilled = compileFinal preprocessfilelinenumbers "compile\player\playerKilled.sqf";
SPMC_fnc_playerDamaged = compileFinal preprocessfilelinenumbers "compile\player\playerDamaged.sqf";
SPMC_fnc_playerRespawn = compileFinal preprocessfilelinenumbers "compile\player\playerRespawn.sqf";
SPMC_fnc_playerSetup = compileFinal preprocessfilelinenumbers "compile\player\playerSetup.sqf";
SPMC_fnc_playerSetupBambiGear = compileFinal preprocessfilelinenumbers "compile\player\playerSetupBambiGear.sqf";
SPMC_fnc_processPlayerData = compileFinal preprocessfilelinenumbers "compile\player\processPlayerData.sqf";
SPMC_fnc_spawnPlayer = compileFinal preprocessfilelinenumbers "compile\player\spawnPlayer.sqf";
SPMC_fnc_syncPlayerData = compileFinal preprocessfilelinenumbers "compile\player\syncPlayerData.sqf";
SPMC_fnc_syncPlayerDataConfirm = compileFinal preprocessfilelinenumbers "compile\player\syncPlayerDataConfirm.sqf";

// Economy
SPMC_fnc_syncSale = compileFinal preprocessfilelinenumbers "compile\economy\syncSale.sqf";
SPMC_fnc_syncSaleConfirm = compileFinal preprocessfilelinenumbers "compile\economy\syncSaleConfirm.sqf";
SPMC_fnc_syncPurchase = compileFinal preprocessfilelinenumbers "compile\economy\syncPurchase.sqf";
SPMC_fnc_syncPurchaseConfirm = compileFinal preprocessfilelinenumbers "compile\economy\syncPurchaseConfirm.sqf";
SPMC_fnc_syncMoney = compileFinal preprocessfilelinenumbers "compile\economy\syncMoney.sqf";
SPMC_fnc_syncMoneyConfirm = compileFinal preprocessfilelinenumbers "compile\economy\syncMoneyConfirm.sqf";

// Dialog: Admin menu
SPMC_fnc_showDevMenu = compileFinal preprocessfilelinenumbers "compile\dialogs\admin_menu\showDevMenu.sqf";
SPMC_fnc_teleport = compileFinal preprocessfilelinenumbers "compile\dialogs\admin_menu\teleport.sqf";
SPMC_fnc_teleportMap = compileFinal preprocessfilelinenumbers "compile\dialogs\admin_menu\teleportMap.sqf";

// Dialog: Arms Shop
SPMC_fnc_showArmsShop = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_arms\showArmsShop.sqf";
SPMC_fnc_armsShopWeaponSelected = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_arms\armsShopWeaponSelected.sqf";
SPMC_fnc_armsShopItemSelected = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_arms\armsShopItemSelected.sqf";
SPMC_fnc_armsShopBuyWeapon = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_arms\armsShopBuyWeapon.sqf";
SPMC_fnc_armsShopBuyAmmo = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_arms\armsShopBuyAmmo.sqf";
SPMC_fnc_armsShopBuyAttachment = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_arms\armsShopBuyAttachment.sqf";
SPMC_fnc_armsShopBuyAccessory = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_arms\armsShopBuyAccessory.sqf";

// Dialog: Clothes Shop
SPMC_fnc_showClothesShop = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_clothes\showClothesShop.sqf";
SPMC_fnc_clothesShopItemSelected = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_clothes\clothesShopItemSelected.sqf";
SPMC_fnc_clothesShopBuyUniform = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_clothes\clothesShopBuyUniform.sqf";
SPMC_fnc_clothesShopBuyHat = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_clothes\clothesShopBuyHat.sqf";
SPMC_fnc_clothesShopBuyGlasses = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_clothes\clothesShopBuyGlasses.sqf";
SPMC_fnc_clothesShopBuyVest = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_clothes\clothesShopBuyVest.sqf";
SPMC_fnc_clothesShopBuyBackpack = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_clothes\clothesShopBuyBackpack.sqf";

// Dialog: Vehicle Shop
SPMC_fnc_showVehicleMenu = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_vehicles\showVehicleMenu.sqf";
SPMC_fnc_vehicleSelected = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_vehicles\vehicleSelected.sqf";
SPMC_fnc_vehicleShopBuy = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_vehicles\vehicleShopBuy.sqf";
SPMC_fnc_vehicleShopSell = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_vehicles\vehicleShopSell.sqf";

// Dialog: Spawn Menu
SPMC_fnc_chooseSpawnPoint = compileFinal preprocessfilelinenumbers "compile\dialogs\spawn_menu\chooseSpawnPoint.sqf";
SPMC_fnc_showSpawnMenu = compileFinal preprocessfilelinenumbers "compile\dialogs\spawn_menu\showSpawnMenu.sqf";
SPMC_fnc_pointSelected = compileFinal preprocessfilelinenumbers "compile\dialogs\spawn_menu\pointSelected.sqf";

// Dialog: Sell Menu
SPMC_fnc_showSellMenu = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_sell\showSellMenu.sqf";
SPMC_fnc_showSellValue = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_sell\showSellValue.sqf";
SPMC_fnc_sellItem = compileFinal preprocessfilelinenumbers "compile\dialogs\shop_sell\sellItem.sqf";

// Dialog: Player Menu
SPMC_fnc_showPlayerMenu = compileFinal preprocessfilelinenumbers "compile\dialogs\player_menu\showPlayerMenu.sqf";
SPMC_fnc_playerMenuUpdateStats = compileFinal preprocessfilelinenumbers "compile\dialogs\player_menu\playerMenuUpdateStats.sqf";