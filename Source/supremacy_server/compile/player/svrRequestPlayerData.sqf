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

private["_player","_index","_money","_stats"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_money = 0;
_stats = [];
_equipment = [];

if (isNull _player) exitWith {};

_playerData = ["loadPlayer",[(getPlayerUID _player)]] call SPMC_fnc_dbCall;

if (count _playerData == 0) then { 
    _money = ["start_money"] call SPMC_fnc_config;
    ["newPlayer",[(getPlayerUID _player), _money, _name]] call SPMC_fnc_dbCall;
} else {
    ["updatePlayerName",[_name, (getPlayerUID _player)]] call SPMC_fnc_dbCall;
    _money = (_playerData select 0);
    _stats = [(_playerData select 1)] call SPMC_fnc_mresToArray;
    _equipment = [(_playerData select 2)] call SPMC_fnc_mresToArray;
};

_index = [(getPlayerUID _player),serverPlayerMoney] call SPMC_fnc_findIndex;
if (_index == -1) then {
    serverPlayerMoney = serverPlayerMoney + [[(getPlayerUID _player), _money]];
} else {
    _money = (serverPlayerMoney select _index);
};

[[_money,_stats,_equipment],"SPMC_fnc_processPlayerData",(owner _player),false] spawn BIS_fnc_MP;