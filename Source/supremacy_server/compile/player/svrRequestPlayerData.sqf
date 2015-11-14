/**
 * svrRequestPlayerData.sqf
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

private["_player","_index","_money","_stats","_skills","_experience"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_money = 0;
_skills = [];
_stats = [];
_experience = 0;
_equipment = [];

if (isNull _player) exitWith {};

_playerData = ["loadPlayer",[(getPlayerUID _player)]] call SPMC_fnc_dbCall;

if (count _playerData == 0) then { 
    _money = ["start_money"] call SPMC_fnc_config;
    ["newPlayer",[(getPlayerUID _player), _money, _name]] call SPMC_fnc_dbCall;
} else {
    ["updatePlayerName",[_name, (getPlayerUID _player)]] call SPMC_fnc_dbCall;
    _money = (_playerData select 0);
    _stats = (_playerData select 1);
    _equipment = (_playerData select 2);
    _skills = (_playerData select 3);
    _experience = (_playerData select 4);
};

// Because the player might be so cheeky to disconnect before a save can occure, we will overwrite what we get from the database with what the server currently tracks, since the server will be more accurate.
_index = [(getPlayerUID _player),serverPlayerMoney] call SPMC_fnc_findIndex;
if (_index == -1) then {
    serverPlayerMoney = serverPlayerMoney + [[(getPlayerUID _player), _money]];
} else {
    if (_money != ((serverPlayerMoney select _index) select 1)) then {
        [_player, "money", [((serverPlayerMoney select _index) select 1)], true] call SPMC_fnc_svrSyncPlayerData;
    };

    _money = (serverPlayerMoney select _index) select 1;
};

_index = [(getPlayerUID _player),serverPlayerSkills] call SPMC_fnc_findIndex;
if (_index == -1) then {
    serverPlayerSkills = serverPlayerSkills + [[(getPlayerUID _player), [_experience, _skills]]];
} else {
    _playerSkillData = ((serverPlayerSkills select _index) select 1);
    _skills = (_playerSkillData select 1);

    if (_experience != (_playerSkillData select 0)) then {
        [_player, "experience", [(_playerSkillData select 0)], true] call SPMC_fnc_svrSyncPlayerData;
    };

    _experience = (_playerSkillData select 0);
};

[[_money,_stats,_equipment,_experience,_skills],"SPMC_fnc_processPlayerData",(owner _player),false] spawn BIS_fnc_MP;