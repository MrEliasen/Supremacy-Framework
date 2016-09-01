/**
 * getItemCfgDetails.sqf
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

/*
    Index
    0: class name
    1: display name
    2: description
    3: picture
    4: icon
    5: type id
    6: itemInfo type id
    7: config name

    Magazines
    8: initSpeed
    9: bullet count

    Weapons
    8: Compatible magazines
    9: Fire Modes
    10: Compatible Items
        0: scopes
        1: pointers
        2: muzzels
        3: under barrel
    11: armor

    Vehicles
    8: armor
    9: maxSpeed
    10: enginePower
    11: fuelCapacity
    12: maximumLoad
*/

private["_item","_config","_misc","_mags"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
_config = "";
_data = [];

if(_item == "") exitWith {
    _data;
};

switch (true) do
{
    case (isClass (configFile >> "CfgMagazines" >> _item)) : {
        _config = "CfgMagazines";
    };
    case (isClass (configFile >> "CfgWeapons" >> _item)) : {
        _config = "CfgWeapons";
    };
    case (isClass (configFile >> "CfgVehicles" >> _item)) : {
        _config = "CfgVehicles";
    };
    case (isClass (configFile >> "CfgGlasses" >> _item)) : {
        _config = "CfgGlasses";
    };
};

_data = [
    _item,
    getText(configFile >> _config >> _item >> "displayName"),
    "",
    getText(configFile >> _config >> _item >> "picture"),
    getText(configFile >> _config >> _item >> "icon"),
    getNumber(configFile >> _config >> _item >> "type")
];

if (isClass (configFile >> _config >> _item >> "ItemInfo")) then {
    _data set [count _data, getNumber(configFile >> _config >> _item >> "ItemInfo" >> "Type")];
} else {
    _data set [count _data, -1];
};

_data set [count _data, _config];

switch (_config) do {
    case "CfgMagazines": {
        _data set [2, getText(configFile >> _config >> _item >> "descriptionshort")];
        _data set [count _data, getNumber(configFile >> _config >> _item >> "initSpeed")];
        _data set [count _data, getNumber(configFile >> _config >> _item >> "count")];
    };

    case "CfgWeapons": {
        _data set [2, getText(configFile >> _config >> _item >> "descriptionshort")];
        _mags = getArray(configFile >> _config >> _item >> "magazines");

        // If the weapon has a GL, add the GL rounds to the ammo array
        /*if ((["_GL_", _item, true] call BIS_fnc_inString)) then {
            _mags = _mags + [
                "Rnd_HE_Grenade_shell",
                "UGL_FlareWhite_F",
                "UGL_FlareGreen_F",
                "UGL_FlareRed_F",
                "UGL_FlareYellow_F",
                "UGL_FlareCIR_F",
                "Rnd_Smoke_Grenade_shell",
                "Rnd_SmokeRed_Grenade_shell",
                "Rnd_SmokeGreen_Grenade_shell",
                "Rnd_SmokeYellow_Grenade_shell",
                "Rnd_SmokePurple_Grenade_shell",
                "Rnd_SmokeBlue_Grenade_shell",
                "Rnd_SmokeOrange_Grenade_shell"
            ];
        };*/

        _data set [count _data, _mags];
        _data set [count _data, getArray(configFile >> _config >> _item >> "modes")];

        _misc = [[],[],[],[]];
        if (isClass ((configFile >> _config >> _item >> "WeaponSlotsInfo"))) then {
            if (isClass((configFile >> _config >> _item >> "WeaponSlotsInfo" >> "CowsSlot"))) then {
                _misc set [0, getArray(configFile >> _config >> _item >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems")];
            };

            if (isClass((configFile >> _config >> _item >> "WeaponSlotsInfo" >> "PointerSlot"))) then {
                _misc set [1, getArray(configFile >> _config >> _item >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems")];
            };

            if (isClass((configFile >> _config >> _item >> "WeaponSlotsInfo" >> "MuzzleSlot"))) then {
                _misc set [2, getArray(configFile >> _config >> _item >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")];
            };

            if (isClass((configFile >> _config >> _item >> "WeaponSlotsInfo" >> "UnderBarrelSlot"))) then {
                _misc set [3, getArray(configFile >> _config >> _item >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems")];
            };
        };
        
        _data set [count _data, _misc];
        _data set [count _data, (configFile >> _config >> _item >> "ItemInfo" >> "armor")];
    };

    case "CfgVehicles": {
        _data set [count _data, getNumber(configFile >> _config >> _item >> "armor")];
        _data set [count _data, getNumber(configFile >> _config >> _item >> "maxSpeed")];
        _data set [count _data, getNumber(configFile >> _config >> _item >> "enginePower")];
        _data set [count _data, getNumber(configFile >> _config >> _item >> "fuelCapacity")];
        _data set [count _data, getNumber(configFile >> _config >> _item >> "maximumLoad")];
    };
};

_data;
