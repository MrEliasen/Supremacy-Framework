/**
 * selectSkill.sqf
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

private["_skill","_requiredSkills","_reqStatus","_expStatus","_status"];
disableSerialization;
_skill = lbData [2801, lbCurSel(2801)];
_requiredSkills = "<t size='1.8'>None.</t>";
_reqStatus = true;
_expStatus = true;
_status = "";

if (_skill == "") exitWith {};

_skill = [_skill] call SPMC_fnc_getSkillDetails;

if (SPMC_gbl_experience < (_skill select 4)) then {
    _expStatus = false;
};

if (count (_skill select 3) > 0) then {
    _requiredSkills = "";

    {
        _x = [_x] call SPMC_fnc_getSkillDetails;

        if (_forEachIndex == 0) then {
            _requiredSkills =(_x select 1);
        } else {
            _requiredSkills = format["%1, %2", _requiredSkills, (_x select 1)];
        };
        
        if (!((_x select 0) in SPMC_gbl_learnedSkills)) then {
            _reqStatus = false;
        };
    } foreach (_skill select 3);
};

if (_reqStatus && _expStatus) then {
    _status = "<t size='1.8' color='#20DB16'>You are able to learn this skill.</t>";
} else {
    if (!_reqStatus) then {
        _status = "<t size='1.8' color='#DB1620'>You do not meet the requirements to learn this skill.</t><br/>";
    };
    if (!_expStatus) then {
        _status = format["%1<t size='1.8' color='#DB1620'>You do not have enought experience to learn this skill.</t>", _status];
    };
};

if ((_skill select 0) in SPMC_gbl_learnedSkills) then {
    ctrlEnable[2804, false];
    _status = "<t size='1.8' color='#006BC9'>You have already learned this skill.</t>";
} else {
    ctrlEnable[2804, true];
};

((findDisplay 2800) displayCtrl 2802) ctrlSetStructuredText parseText format[
"<t size='4.2' align='center' color='#ffae2b'>%1</t><br/>
<t size='1.8'>%2</t><br/>
<br/>
<t size='1.8' color='#ffae2b'>EXP Cost:</t> <t size='1.8'>%3</t><br/>
<t size='1.8' color='#ffae2b'>Requirements:</t> <t size='1.8'>%4</t><br/>
<br/>
%5",
(_skill select 1),
format ([(_skill select 2)] + (_skill select 5)),
(_skill select 4),
_requiredSkills,
_status];