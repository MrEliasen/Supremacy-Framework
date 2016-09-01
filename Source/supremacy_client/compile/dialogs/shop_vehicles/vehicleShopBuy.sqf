/**
 * vehicleShopBuy.sqf
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

private["_vehicle","_price","_spawn","_skillDiscount"];
disableSerialization;
ctrlEnable[2605, false];
_vehicle = [lbData [2601, lbCurSel(2601)]] call SPMC_fnc_getItemCfgDetails;
_price = lbValue [2601, lbCurSel(2601)];
_spawn = "";
_skillDiscount = 1.0;

// Update the price if the player have the Silver Tongue skill line
if (("silver-1" in SPMC_gbl_learnedSkills)) then {
    for "_i" from 2 to 50 do {
        if (!(format ["silver-%1", _i] in SPMC_gbl_learnedSkills)) exitWith {
            _skillDiscount = ([format["silver-%1", (_i - 1)]] call SPMC_fnc_getSkillDetails select 5) select 0;
        };
    };

    _skillDiscount = (1.0 - _skillDiscount / 100);
};

_price = _price * _skillDiscount;

if (SPMC_gbl_money < _price) exitWith {
    hint "You do not have enough money to buy this vehicle.";
};

{
    private ["_units"];
    _units = nearestObjects[(getMarkerPos _x),["car","tank","armored","support","truck","air","ship","submarine","man"],8];

    if ((count _units) == 0) exitWith {
        _spawn = _x
    };
} foreach (SPMC_gbl_vehicleShop select 1);

if (_spawn == "") exitWith {
    hint "No free vehicle spawn point. Unable to puchase vehicle.";
    ctrlEnable[2605, true];
};

[(_vehicle select 0),2605,"vehicle",_spawn] call SPMC_fnc_syncPurchase;