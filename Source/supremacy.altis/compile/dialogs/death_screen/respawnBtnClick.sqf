/**
 * respawnbtnClick.sqf
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
private [];

if (!(isNull (findDisplay 3100))) then {
    ((findDisplay 3100) displayCtrl 3101) ctrlEnable false;
    
    player setVariable ["respawning", TRUE, true];
};