/**
 * callAirDrop.sqf
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @package    Supremacy Framework
 * @author     Mark Eliasen <https://github.com/MrEliasen>
 * @copyright  2016 Mark Eliasen
 * @license    CC BY-NC 3.0 License
 * @link       https://github.com/MrEliasen/Supremacy-Framework
 */
private["_drop","_pos","_dropZones","_dropZoneArea","_inventory","_m"];

_dropZones = [];
{
    _dropZones set [count _dropZones, _x];
} foreach (["drop_zones"] call SPMC_fnc_config);

_dropZoneArea = _dropZones call bis_fnc_selectRandom;
_pos = [_dropZoneArea,0,[]] call SHK_pos;

_drop = "Box_NATO_AmmoVeh_F" createVehicle [0,0,0];

[_drop] call SPMC_fnc_setupAirDropLoot;

_drop setVariable["airdrop",TRUE,true];

_drop setDir random 360;
_drop setPos [(_pos select 0), (_pos select 1), 500];
_drop call SPMC_fnc_airDrop;

[["TaskUpdated",["","AIR DROP: New air drop incoming, check your maps!"]],"bis_fnc_showNotification",true] spawn BIS_fnc_MP;