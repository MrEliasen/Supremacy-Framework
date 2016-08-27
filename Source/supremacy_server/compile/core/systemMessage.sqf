/**
 * systemMessage.sqf
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

private["_killer","_victim"];
_killer = [_this,0,"",[""]] call BIS_fnc_param;
_victim = [_this,1,"",[""]] call BIS_fnc_param;

if (damage _victim <= 0) exitWith {};

systemChat format["%1 was injured by %2", name _victim, name _killer];