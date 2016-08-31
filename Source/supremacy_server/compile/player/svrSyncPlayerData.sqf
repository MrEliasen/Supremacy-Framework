/**
 * svrSyncPlayerData.sqf
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

private["_player","_type","_data","_index","_money","_skills","_exp","_success","_silent","_call"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;
_data = [_this,2,[],[[]]] call BIS_fnc_param;
_silent = [_this,3,false,[false]] call BIS_fnc_param;
_call = "";
_success = false;

if (isNull _player || _type == "" || count _data == 0) exitWith {};

_call = switch (_type) do {
    case "stats": {
        "saveplayerstats";
    };

    case "equipment": {
        _data set [count _data, (getPos _player)];

        "saveplayerequipment";
    };

    case "money" : {
        "savemoney";
    };

    case "location" : {
        _data = [(getPos _player)];
        
        "savelocation";
    };

    case "experience" : {
        "saveexperience";
    };

    // also saves experience
    case "skills" : {
        "saveskills";
    };

    case "everything": {
        _money = 0;
        _exp = 0;
        _skills = [];

        _index = [(getPlayerUID _player), serverPlayerMoney] call SPMC_fnc_findIndex;
        if (_index != -1) then {
            _money = ((serverPlayerMoney select _index) select 1);
        };
        
        _index = [(getPlayerUID _player), serverPlayerSkills] call SPMC_fnc_findIndex;
        if (_index != -1) then {
            _exp = (((serverPlayerSkills select _index) select 1) select 0);
            _skills = (((serverPlayerSkills select _index) select 1) select 1);
        };

        _data set [count _data, _money];
        _data set [count _data, _skills];
        _data set [count _data, _exp];
        _data set [count _data, (getPos _player)];

        "savePlayerFull";
    };
    
    default {
        "";
    };
};

if (_call != "") then {
    _data set [count _data, (getPlayerUID _player)];
    [_call,_data,false] call SPMC_fnc_dbCall;
    _success = true;
};

if (!_silent) then {
    [[_success],"SPMC_fnc_syncPlayerDataConfirm",(owner _player),false] spawn BIS_fnc_MP;
};