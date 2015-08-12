/**
 * _master.sqf
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @package    Supremacy Framework
 * @author     Mark Eliasen <https://github.com/MrEliasen>
 * @copyright  2015 Mark Eliasen
 * @license    MIT License
 * @link       https://github.com/MrEliasen/SupremacyFramework
 */
_ch = [] execVM "\supremacy_server\compile\config.sqf";
waitUntil {scriptDone _ch};

_ch = [] execVM "\supremacy_server\compile\core.sqf";
waitUntil {scriptDone _ch};

_ch = [] execVM "\supremacy_server\compile\lootCrate.sqf";
waitUntil {scriptDone _ch};

_ch = [] execVM "\supremacy_server\compile\airdrop.sqf";
waitUntil {scriptDone _ch};