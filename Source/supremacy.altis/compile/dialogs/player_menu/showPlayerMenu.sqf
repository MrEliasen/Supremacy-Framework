/**
 * showPlayerMenu.sqf
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
if (!alive player || dialog) exitWith {};
createDialog "SPMC_player_menu";
disableSerialization;

waitUntil {sleep 0.1; !isNull (findDisplay 1900)};
[] call SPMC_fnc_playerMenuUpdateStats;