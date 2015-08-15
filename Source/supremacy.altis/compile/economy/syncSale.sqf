/**
 * syncSale.sqf
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

private["_item","_controller"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
_controller = [_this,1,0,[0]] call BIS_fnc_param;
_attachments = [_this,2,false,[false]] call BIS_fnc_param;

if (_item == "") exitWith {};

hint "Confirming Sale, please wait..";
[[player,_item,_controller,_attachments],"SPMC_fnc_svrSyncSale",false,false] call BIS_fnc_MP;