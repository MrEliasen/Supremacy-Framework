/**
 * initPassiveSkills.sqf
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

 // Survival skill line
[] spawn 
{
    private["_regen","_duration","_belowHp","_curLevel","_seconds","_lastLevel","_c","_skillDetails"];
    _lastLevel = "";
    _regen = 0;
    _duration = 0;
    _belowHp = 0;
    _seconds = 0;

    while {true} do {
        _curLevel = "";
        _c = 0;

        if ((alive player) && !(player getVariable["revivable", false])) then {
            while {_c != -1} do {
                _c = _c + 1;
                if (!(format["survival-%1", _c] in SPMC_gbl_learnedSkills)) then {
                    _c = -1
                } else {
                    _curLevel = format["survival-%1", _c];
                };
            };

            if(_curLevel != _lastLevel) then {
                if (_curLevel != "") then {
                    _skillDetails = [_curLevel] call SPMC_fnc_getSkillDetails;
                    _regen = ((_skillDetails select 5) select 0);
                    _duration = ((_skillDetails select 5) select 1);
                    _belowHp = ((_skillDetails select 5) select 2);
                } else {
                    _regen = 0;
                    _duration = 0;
                    _belowHp = 0;
                };
            };

            // I know we could run this every 1 seconds, but heck, for performance lets just keep it at 2 eh?
            if (_regen > 0) then {
                _seconds = _seconds + 2;
                if (_seconds >= _duration) then {
                    _seconds = 0;
                    if ((damage player) > (1 - (_belowHp / 100))) then {
                        player setDamage ((damage player) - (_regen / 100));
                    };
                };
            };
        };

        sleep 2;
    };
};

//Athlete skill line 
[] spawn
{
    private["_modifier","_curLevel","_lastLevel","_c","_skillDetails"];
    _lastLevel = "";
    _modifier = 0;

    while {true} do {
        _curLevel = "";
        _c = 0;

        if (alive player && !(player getVariable["revivable", false])) then { 
            while {_c != -1} do {
                _c = _c + 1;

                if (!(format["athlete-%1", _c] in SPMC_gbl_learnedSkills)) then {
                    _c = -1
                } else {
                    _curLevel = format["athlete-%1", _c];
                };
            };

            if(_curLevel != _lastLevel) then {
                if (_curLevel != "") then {
                    _skillDetails = [_curLevel] call SPMC_fnc_getSkillDetails;
                    _modifier = ((_skillDetails select 5) select 1);
                } else {
                    _modifier = 0;
                };
            };

            if (_modifier > 0) then {
                player setFatigue ((getFatigue player) - (_modifier / 100));
            };
        };

        sleep 2.9;
    };
};

// Pilot skills. Kick people out who do not have the skill
[] spawn {
    private["_veh","_vehClass","_vehType"];
    // list of boats not requing the captain skill
    _allowedWater = [
        "B_Boat_Transport_01_F",
        "O_Boat_Transport_01_F",
        "I_Boat_Transport_01_F"
    ];
    // list of armored/tanks not requing the tank crew skill
    _allowedLand = [];
    // list of air vehicles not requing the pilot skill
    _allowedAir = [];

    while {true} do {
        if (vehicle player != player && alive player) then {
            _veh = (vehicle player);
            _vehClass = (typeOf _veh);
            _vehType = (getText(configFile >> "CfgVehicles" >> _vehClass >> "vehicleClass"));

            if (_vehType == "Armored" && !(_vehClass in _allowedLand)) then {
                if (!("tank-crew" in SPMC_gbl_learnedSkills) && ((driver _veh) == player OR (gunner _veh) == player)) then {
                    unassignVehicle player;
                    player action["getOut", _veh];
                    player action["eject", _veh];
                    hint "You do not have the required skill to man this vehicle position.";
                };
            } else {
                 if (_vehType == "Air" && !(_vehClass in _allowedAir)) then {
                    if (!("pilot" in SPMC_gbl_learnedSkills) && ((driver _veh) == player OR (gunner _veh) == player)) then {
                        unassignVehicle player;
                        player action["getOut", _veh];
                        player action["eject", _veh];
                        hint "You do not have the required skill to man this vehicle position.";
                    };
                } else {
                    if (_vehType in ["Ship","Submarine"] && !(_vehClass in _allowedWater)) then {
                        if (!("boat-captain" in SPMC_gbl_learnedSkills) && (driver _veh) == player) then {
                            unassignVehicle player;
                            player action["getOut", _veh];
                            player action["eject", _veh];
                            hint "You do not have the required skill to man this boat position.";
                        };
                    };
                };
            };
        };
        
        sleep 2.5;
    };
};

// Air drop proximity warning
[] spawn {
    private["_drop","_lastAlert"];
    _lastAlert = 0;

    while {true} do {
        if (alive player) then { 
            _drop = nearestObject [player, "Box_NATO_AmmoVeh_F"];

            if(!(isNull _drop) && (_drop getVariable["airdrop", FALSE])) then {
                if(_lastAlert < time && (player distance _drop) <= 50) then {
                    _lastAlert = time + 60;
                    ["airdropProxyWarning",["You have entered the potential air drop killzone! (50m)"]] call BIS_fnc_showNotification;
                };
            };
        };
        
        sleep 2.25;
    };
};