/**
 * spawnBuildings.sqf
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

private["_spawnBlock"];

_spawnBlock = createVehicle ["Land_Hangar_F", [0,0,0], [], 0, "NONE"];
_spawnBlock setDir (markerDir "spawn_block_left");
_spawnBlock setPosATL (getMarkerPos "spawn_block_left");
_spawnBlock allowDamage false;

_spawnBlock = createVehicle ["Land_Hangar_F", [0,0,0], [], 0, "NONE"];
_spawnBlock setDir (markerDir "spawn_block_right");
_spawnBlock setPosATL (getMarkerPos "spawn_block_right");
_spawnBlock allowDamage false;