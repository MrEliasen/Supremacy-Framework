/**
 * setupAirDropLoot.sqf
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

private["_m","_pos","_crate","_reset"];
_crate = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_reset = [_this,1,TRUE,[TRUE]] call BIS_fnc_param;

if(_reset) then
{
    clearBackpackCargoGlobal _crate;
    clearWeaponCargoGlobal _crate;
    clearItemCargoGlobal _crate;
    clearMagazineCargoGlobal _crate;
    clearBackpackCargoGlobal _crate;
};

_crate allowDamage false;

_chance = floor(random(4))+1;
for "_i" from 1 to _chance do
{
    _weapon = (["airdrop_weapons"] call SPMC_fnc_config) call bis_fnc_selectRandom;

    _crate addWeaponCargoGlobal [_weapon, 1];
    _magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");

    if(count _magazines > 0) then 
    {
        _magazineClass = _magazines call bis_fnc_selectRandom;
        _crate addMagazineCargoGlobal [_magazineClass, floor(random 2)+1];
    };
};

_chance = floor(random(3))+1;
for "_i" from 1 to _chance do
{
    _weapon = (["equip_weapons"] call SPMC_fnc_config) call bis_fnc_selectRandom;
    _crate addWeaponCargoGlobal [_weapon, 1];
    _magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");

    if(count _magazines > 0) then 
    {
        _magazineClass = _magazines call bis_fnc_selectRandom;
        _crate addMagazineCargoGlobal [_magazineClass, floor(random 2)+1];
    };
};

_chance = floor(random(4))+1;
for "_i" from 1 to _chance do
{
    _item = (["equip_items"] call SPMC_fnc_config) call bis_fnc_selectRandom;
    _crate addItemCargoGlobal [_item, 1];
};

_chance = floor(random(2)+1);
for "_i" from 1 to _chance do
{
    _item = (["equip_attachments"] call SPMC_fnc_config) call bis_fnc_selectRandom;
    _item = _item call bis_fnc_selectRandom;
    _crate addItemCargoGlobal [_item, 1];
};

_chance = floor(random(4))+1;
for "_i" from 1 to _chance do
{
    if(floor(random(2)) == 1) then
    {
        _backpack = (["equip_backpacks"] call SPMC_fnc_config) call bis_fnc_selectRandom;
        _crate addBackpackCargoGlobal [_backpack, 1];
    }
    else
    {
        _vest = (["equip_vests"] call SPMC_fnc_config) call bis_fnc_selectRandom;
        _crate addItemCargoGlobal [_vest, 1];
    };
};

_chance = ceil(random(5))+1;
for "_i" from 1 to _chance do
{
    _clothes = (["equip_clothes"] call SPMC_fnc_config) call bis_fnc_selectRandom;
    _crate addItemCargoGlobal [_clothes, 1];
};