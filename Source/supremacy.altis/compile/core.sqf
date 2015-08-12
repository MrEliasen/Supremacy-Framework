/**
 * core.sqf
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
SPMC_fnc_spawnBuildings = compileFinal "
private[""_spawnBlock""];

_spawnBlock = createVehicle [""Land_Hangar_F"", [0,0,0], [], 0, ""NONE""];
_spawnBlock setDir (markerDir ""spawn_block_left"");
_spawnBlock setPosATL (getMarkerPos ""spawn_block_left"");
_spawnBlock allowDamage false;

_spawnBlock = createVehicle [""Land_Hangar_F"", [0,0,0], [], 0, ""NONE""];
_spawnBlock setDir (markerDir ""spawn_block_right"");
_spawnBlock setPosATL (getMarkerPos ""spawn_block_right"");
_spawnBlock allowDamage false;";

SPMC_fnc_briefing = compileFinal "
if(player diarySubjectExists ""rules"") exitwith {};

player createDiarySubject [""rules"",""Rules""];
player createDiaryRecord [""rules"",
[
""Rules"",
""1. No cheating of any kind.<br/>
2. Don't be toxic<br/>
3. Don't spam/abuse VON.<br/>
<br/>
Remember, it's just a game.""
]
];

player createDiarySubject [""community"",""Community""];
player createDiaryRecord [""community"",
[
""NBS Gaming"",
""Teamspeak: ts.nbs-gaming.com<br/>
Website:  www.nbs-gaming.com<br/>
<br/>
To join TeamSpeak, you must be signed up to our website.""
]
];

player createDiarySubject [""about"", ""SPMC Framework""];
player createDiaryRecord [""about"",
[
""About"",
""Made by Simply of the NBS-Gaming community.<br/>
Source Code: https://github.com/MrEliasen/SupremacyFramework<br/>
<br/>
Released under the CC BY-NC 3.0 License<br/>
Lawyer Text: https://creativecommons.org/licenses/by-nc/3.0/legalcode<br/>
Human Text: https://creativecommons.org/licenses/by-nc/3.0/<br/>
<br/>
The license does NOT apply to, or included, the 3rd party code (fund in the """"\3rdparty"""" directories).
I did not create or own any of the 3rd part scripts. Please see their credits below or in their files where possible.<br/>
<br/>
Copyright (c) 2015 Mark """"Simply"""" Eliasen - 3rd party scripts are copyrighted by their respective owners.""
]
];

player createDiarySubject [""thanks"", ""3rd Party Scripts""];
player createDiaryRecord [""thanks"",
[
""Special Thanks"",
""Shuko - SHK_pos<br/>
Killzone_Kid - Original Airdrop script""
]
];";

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
SPMC_fnc_getItemCfgDetails = compileFinal "
private[""_item"",""_config""];
_item = [_this,0,"""",[""""]] call BIS_fnc_param;
_config = """";

switch (true) do
{
    case (isClass (configFile >> ""CfgMagazines"" >> _item)) : {
        _config = ""CfgMagazines"";
    };
    case (isClass (configFile >> ""CfgWeapons"" >> _item)) : {
        _config = ""CfgWeapons"";
    };
    case (isClass (configFile >> ""CfgVehicles"" >> _item)) : {
        _config = ""CfgVehicles"";
    };
    case (isClass (configFile >> ""CfgGlasses"" >> _item)) : {
        _config = ""CfgGlasses"";
    };
};

_data =[
    _item,
    getText(configFile >> _config >> _item >> ""displayName""),
    """",
    getText(configFile >> _config >> _item >> ""picture""),
    getText(configFile >> _config >> _item >> ""icon""),
    getNumber(configFile >> _config >> _item >> ""type"")
];

if (isClass (configFile >> _config >> _item >> ""ItemInfo"")) then {
    _data set [count _data, getNumber(configFile >> _config >> _item >> ""ItemInfo"" >> ""Type"")];
} else {
    _data set [count _data, -1];
};

_data set [count _data, _config];

switch (_config) do {
    case ""CfgMagazines"": {
        _data set [2, getText(configFile >> _config >> _item >> ""descriptionshort"")];
        _data set [count _data, getNumber(configFile >> _config >> _item >> ""initSpeed"")];
    };

    case ""CfgWeapons"": {
        _data set [2, getText(configFile >> _config >> _item >> ""descriptionshort"")];
        _data set [count _data, getArray(configFile >> _config >> _item >> ""magazines"")];
        _data set [count _data, getArray(configFile >> _config >> _item >> ""modes"")];

        private [""_misc""];
        _misc = [];
        if (isClass ((configFile >> _config >> _item >> ""WeaponSlotsInfo""))) then {
            if (isClass((configFile >> _config >> _item >> ""WeaponSlotsInfo"" >> ""CowsSlot""))) then {
                _misc set [count _misc, getArray(configFile >> _config >> _item >> ""WeaponSlotsInfo"" >> ""CowsSlot"" >> ""compatibleItems"")];
            };
            if (isClass((configFile >> _config >> _item >> ""WeaponSlotsInfo"" >> ""PointerSlot""))) then {
                _misc set [count _misc, getArray(configFile >> _config >> _item >> ""WeaponSlotsInfo"" >> ""PointerSlot"" >> ""compatibleItems"")];
            };
            if (isClass((configFile >> _config >> _item >> ""WeaponSlotsInfo"" >> ""MuzzleSlot""))) then {
                _misc set [count _misc, getArray(configFile >> _config >> _item >> ""WeaponSlotsInfo"" >> ""MuzzleSlot"" >> ""compatibleItems"")];
            };
            if (isClass((configFile >> _config >> _item >> ""WeaponSlotsInfo"" >> ""UnderBarrelSlot""))) then {
                _misc set [count _misc, getArray(configFile >> _config >> _item >> ""WeaponSlotsInfo"" >> ""UnderBarrelSlot"" >> ""compatibleItems"")];
            };
        };
        
        _data set [count _data, _misc];
        _data set [count _data, (configFile >> _config >> _item >> ""ItemInfo"" >> ""armor"")];
    };

    case ""CfgVehicles"": {
        _data set [count _data, getNumber(configFile >> _config >> _item >> ""armor"")];
        _data set [count _data, getNumber(configFile >> _config >> _item >> ""maxSpeed"")];
        _data set [count _data, getNumber(configFile >> _config >> _item >> ""enginePower"")];
        _data set [count _data, getNumber(configFile >> _config >> _item >> ""fuelCapacity"")];
        _data set [count _data, getNumber(configFile >> _config >> _item >> ""maximumLoad"")];
    };
};

_data;";

SPMC_fnc_showShopMenu = compileFinal "
private[""_type""];
_type = [_this,0,"""",[""""]] call BIS_fnc_param;

if (!alive player || dialog) exitWith {};

switch (_type) do {
    case ""arms"": {
        [] call SPMC_fnc_showArmsShop;
    };
};";

SPMC_fnc_findIndex  = compileFinal "
private[""_item"",""_array""];
_item = [_this,0,"""",[""""]] call BIS_fnc_param;
_array = [_this,1,[],[[]]] call BIS_fnc_param;
_index = -1;

{
    if (typeName _x != ""ARRAY"") then {
        _x = [_x];
    };

    if(_item in _x) exitWith {
        _index = _forEachIndex;
    };
} foreach _array;

_index;";