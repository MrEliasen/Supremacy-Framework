/**
 * spawnPlayer.sqf
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

private["_pos"];
_pos = (_this select 0);
player enablesimulation true;

player setPos _pos;
0 cutText ["","BLACK IN"];

[] call SPMC_fnc_initHUD;
["everything"] call SPMC_fnc_syncPlayerData;