/**
 * playerActions.sqf
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

player addAction["<t color='#0075DB'>[Player Menu]</t>",SPMC_fnc_showPlayerMenu,player,0,false,false,"",'!isNull player && (alive player)'];

if (debugMode) then { 
    player addAction["<t color='#f10000'>Dev/Debug Menu</t>",SPMC_fnc_showDevMenu,player,0,false,false,"",'!isNull player && (alive player)'];
};