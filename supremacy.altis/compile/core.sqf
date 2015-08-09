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

SPMC_fnc_getItemCfgDetails = compileFinal "
private[""_item"",""_type"",""_config""];
_item = [_this,0,"""",[""""]] call BIS_fnc_param;
_type = [_this,1,"""",[""""]] call BIS_fnc_param;
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
    getText(configFile >> _config >> _item >> ""descriptionshort""),
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
        _data set [count _data, getNumber(configFile >> _config >> _item >> ""initSpeed"")];
    };

    case ""CfgWeapons"": {
        _data set [count _data, getArray(configFile >> _config >> _item >> ""magazines"")];
        _data set [count _data, getArray(configFile >> _config >> _item >> ""modes"")];
    };

    case ""CfgVehicles"": {
        _data set [count _data, getNumber(configFile >> _config >> _item >> ""armor"")];
        _data set [count _data, getNumber(configFile >> _config >> _item >> ""maxSpeed"")];
        _data set [count _data, getNumber(configFile >> _config >> _item >> ""enginePower"")];
        _data set [count _data, getNumber(configFile >> _config >> _item >> ""fuelCapacity"")];
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
_item = _this select 0;
_array = _this select 1;
_index = -1;

{
    if(_item in _x) exitWith {
        _index = _forEachIndex;
    };
} foreach _array;

_index;";