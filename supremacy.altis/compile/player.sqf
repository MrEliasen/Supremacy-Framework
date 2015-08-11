/**
 * player.sqf
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
// Thanks to Killzone_Kid for the inventory sound "hack";
SPMC_fnc_playerEvents = compileFinal "
player addEventHandler [""handleDamage"", {}];
player addEventHandler [""Respawn"", {[_this] call SPMC_fnc_playerRespawn;}];
player addEventHandler [""Killed"", {[_this] call SPMC_fnc_playerKilled;}];
player addEventHandler [""InventoryOpened"", {
    if (_this select 1 isKindOf ""Bag_Base"") then {
        playSound3D [""a3\sounds_f\characters\stances\concrete_adjust_prone_left.wss"",objNull, false, _this select 1 modelToWorld [0,0,0]];
    };
}];
player addEventHandler [""InventoryClosed"", {
    if (_this select 1 isKindOf ""Bag_Base"") then {
        playSound3D [""a3\sounds_f\characters\stances\concrete_adjust_prone_right.wss"",objNull, false, _this select 1 modelToWorld [0,0,0]];
    };
}];";

SPMC_fnc_playerActions = compileFinal "
if (debugMode) then { 
    player addAction[""<t color='#f10000'>Dev Menu</t>"",SPMC_fnc_showDevMenu,player,0,false,false,"""",'!isNull player && (alive player)'];
};";

SPMC_fnc_playerRespawn = compileFinal "
private[""_player"", ""_corpse""];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_corpse = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

0 cutText["""",""BLACK FADED""];
0 cutFadeOut 9999999;
[] call SPMC_fnc_playerActions;
[] call SPMC_fnc_playerSetup;";

SPMC_fnc_playerKilled = compileFinal "
private[""_player""];
disableSerialization;
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;";

SPMC_fnc_spawnPlayer = compileFinal "
private[""_pos""];
_pos = (_this select 0);
player enablesimulation true;

player setPos _pos;
0 cutText ["""",""BLACK IN""];";

SPMC_fnc_getPlayerSpawn = compileFinal "
private [""_spawnZone"",""_pos"",""_holder""];

switch (([""spawn_type""] call SPMC_fnc_config)) do {
    case ""random_city"": {
        _spawnZone = (([""spawn_points""] call SPMC_fnc_config) call bis_fnc_selectRandom) select 0;
        [([_spawnZone,0,[],(getMarkerSize _spawnZone) select 0, (typeof player)] call SHK_pos)] call SPMC_fnc_spawnPlayer;
    };

    case ""select_city"": {
        [] spawn SPMC_fnc_showSpawnMenu;
    };

    case ""random_world"": {
        _pos = [""world_item_spawn"",0,([""spawn_excludes""] call SPMC_fnc_config),(getMarkerSize ""world_item_spawn"") select 0, (typeof player)] call SHK_pos;
        _holder = createVehicle [""Land_Can_Dented_F"",[(_pos select 0),(_pos select 1),(_pos select 2)+0.1], [], 0, ""can_Collide""];
        _holder allowDamage false;
        _pos = [_holder,[0,500],random 360,0,[1,500],(typeof player)] call SHK_pos;
        deleteVehicle _holder;

        _pos = [
            (_pos select 0) + random(20-150),
            (_pos select 1) + random(20-150),
            (_pos select 2)
        ];

        [_pos] call SPMC_fnc_spawnPlayer;
    };
};";

SPMC_fnc_playerSetup = compileFinal "
private[""_spawn_items""];

enableSentences false;
player enablesimulation false;
player disableConversation true;
player setVariable [""BIS_noCoreConversations"", true];
player enablefatigue false;

removeAllWeapons player;
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
removeAllItems player;

{
	player removeMagazine _x;
} foreach (magazines player);

{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);

_spawn_items = ([""spawn_items""] call SPMC_fnc_config);

if ((_spawn_items select 0) != """") then {
    player forceAddUniform (_spawn_items select 0);
};

if ((_spawn_items select 1) != """") then {
    player addVest (_spawn_items select 1);
};

if ((_spawn_items select 2) != """") then {
    player addBackpack (_spawn_items select 2);
};

if ((_spawn_items select 3) != """") then {
    player addHeadgear (_spawn_items select 3);
};

{
    player addMagazine _x;
} foreach (_spawn_items select 5);

if ((_spawn_items select 4) != """") then {
    player addWeapon (_spawn_items select 4);
    player selectWeapon (_spawn_items select 4);
};

{
    player addItem _x;
} foreach (_spawn_items select 6);

{
    player addItem _x;
    player assignItem _x;
} foreach (_spawn_items select 7);

player addrating 99999999;

[] call SPMC_fnc_getPlayerSpawn;";