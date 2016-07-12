/**
 * hideMarkers.sqf
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
// hide spawn markers
{
    (_x select 0) setmarkerAlpha 0;
} forEach (["spawn_points"] call SPMC_fnc_config);

// hide airdrop markers
{
    _x setmarkerAlpha 0;
} forEach (["drop_zones"] call SPMC_fnc_config);

// hide exclude markers
{
    _x setmarkerAlpha 0;
} forEach (["spawn_excludes"] call SPMC_fnc_config);

// hide world item spawn marker
"world_item_spawn" setmarkerAlpha 0;