/**
 * svrConfirmSale.sqf
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
private["_player","_index","_money","_price"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_price = [_this,0,0,[0]] call BIS_fnc_param;
_money = 0;

if (isNull _player) exitWith {};

_index = [_item, serverPlayerMoney] call SPMC_fnc_findIndex;

if (_index != -1) then {
    _money = (serverPlayerMoney select _index) select 1;
};

if (_money < _price) then {
    
};

[[_money],"SPMC_fnc_syncPlayerMoneyReply",(owner _player),false] spawn BIS_fnc_MP;