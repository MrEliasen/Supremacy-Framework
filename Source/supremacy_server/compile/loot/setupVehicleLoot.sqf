/**
 * setupVehicleLoot.sqf
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

private["_m","_pos","_crate","_extended"];
_crate = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_extended = [_this,1,false,[false]] call BIS_fnc_param;

_chance = floor(random(3));

if (_extended) then {
    if (_chance == 0) then {
        _chance = 1;
    };

    _chance = _chance * 2;
};

if (_chance > 0) then {
    for "_i" from 1 to _chance do
    {
        _weapon = ((["equip_weapons"] call SPMC_fnc_config) call BIS_fnc_arrayShuffle) call bis_fnc_selectRandom;

        _crate addWeaponCargoGlobal [_weapon, 1];
        _magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");

        if(count _magazines > 0) then 
        {
            _magazineClass = _magazines call bis_fnc_selectRandom;
            _crate addMagazineCargoGlobal [_magazineClass, floor(random 3)+1];
        };
    };
};

_chance = floor(random(2));

if (_extended) then {
    if (_chance == 0) then {
        _chance = 1;
    };

    _chance = _chance * 2;
};

if (_chance > 0) then {
    for "_i" from 1 to _chance do
    {
        _item = ((["equip_items"] call SPMC_fnc_config) call BIS_fnc_arrayShuffle) call bis_fnc_selectRandom;
        _crate addItemCargoGlobal [_item, 1];
    };
};

_chance = floor(random(2))+1;
for "_i" from 1 to _chance do
{
    _clothes = ((["equip_clothes"] call SPMC_fnc_config) call BIS_fnc_arrayShuffle) call bis_fnc_selectRandom;
    _crate addItemCargoGlobal [_clothes, 1];
};