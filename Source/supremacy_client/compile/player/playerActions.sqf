/**
 * playerActions.sqf
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

// REPAIR VEHICLE MENU
player addAction["<t color='#D1C300'>Repair Vehicle</t>",SPMC_fnc_skillRepairVehicle,cursorTarget,3,false,false,"",'!isNull cursorTarget && ((getText(configFile >> "CfgVehicles" >> (typeOf cursorTarget) >> "vehicleClass")) in ["Armored","Car","Support","Air","Submarine","Ship"]) && player distance cursorTarget < 8 && ("ToolKit" in (items player)) && (damage cursorTarget) > 0.01 && ("mechanic-1" in SPMC_gbl_learnedSkills) && (vehicle player == player)'];

// REVIVE PLAYER
player addAction["<t color='#D1C300'>Attempt Revive</t>",SPMC_fnc_skillRevivePlayer,cursorTarget,6,false,false,"",'!isNull cursorTarget && cursorTarget isKindOf "Man" && (alive cursorTarget) && (cursorTarget getVariable ["revivable",FALSE]) && ("Medikit" in (items player)) && ("medic-2" in SPMC_gbl_learnedSkills) && (vehicle player == player)'];

// HEAL OTHER PLAYER
player addAction["<t color='#D1C300'>Heal Target</t>",SPMC_fnc_skillHealPlayer,cursorTarget,6,false,false,"",'!isNull cursorTarget && cursorTarget isKindOf "Man" && (alive cursorTarget) && (damage cursorTarget) > 0 && !(cursorTarget getVariable ["revivable",FALSE]) && ("medic-1" in SPMC_gbl_learnedSkills) && ("Medikit" in (items player)) && (vehicle player == player)'];

// REPACK MAGAZINES
//player addAction["<t color='#D1C300'>Repack Magazines</t>",SPMC_fnc_skillCombineAmmunition,this,1.5,false,false,"",'!isNull player && (alive player) && (vehicle player == player)'];

// PLAYER MENU
player addAction["<t color='#0075DB'>[Player Menu]</t>",SPMC_fnc_showPlayerMenu,player,0,false,false,"",'!isNull player && (alive player)'];

// DEBUG/ADMIN MENU
if (debugMode) then { 
    player addAction["<t color='#f10000'>[Dev/Debug Menu]</t>",SPMC_fnc_showDevMenu,player,0,false,false,"",'!isNull player && (alive player)'];
};