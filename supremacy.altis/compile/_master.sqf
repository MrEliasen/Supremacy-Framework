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
_ch = [] execVM "compile\player.sqf";
waitUntil {scriptDone _ch};

_ch = [] execVM "compile\admin.sqf";
waitUntil {scriptDone _ch};

_ch = [] execVM "compile\dialogs.sqf";
waitUntil {scriptDone _ch};

_ch = [] execVM "compile\core.sqf";
waitUntil {scriptDone _ch};