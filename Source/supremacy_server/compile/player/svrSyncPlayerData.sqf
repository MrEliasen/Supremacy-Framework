/**
 * svrSyncPlayerData.sqf
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

private["_player","_type","_data","_index","_money","_success","_silent","_call"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;
_data = [_this,2,[],[[]]] call BIS_fnc_param;
_silent = [_this,3,false,[false]] call BIS_fnc_param;
_call = "";
_success = false;

if (isNull _player || _type == "" || count _data == 0) exitWith {};

_data = [_data];

_call = switch (_type) do {
    case "stats": {
        "savePlayerStats";
    };

    case "equipment": {
        "savePlayerEquipment";
    };

    case "everything": {
        _index = [(getPlayerUID _player), serverPlayerMoney] call SPMC_fnc_findIndex;
        _money = 0;

        if (_index != -1) then {
            _money = ((serverPlayerMoney select _index) select 1);
        };

        _data set [count _data, _money];

        "savePlayerFull";
    };
    
    default {
        "";
    };
};

if (_call != "") then {
    _data set [count _data, (getPlayerUID _player)];
    [_call,_data] call SPMC_fnc_dbCall;
    _success = true;
};

[[_success,_silent],"SPMC_fnc_syncPlayerDataConfirm",(owner _player),false] spawn BIS_fnc_MP;