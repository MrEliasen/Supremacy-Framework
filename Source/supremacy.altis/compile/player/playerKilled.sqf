/**
 * playerKilled.sqf
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

private["_player","_killer"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

["stats"] call SPMC_fnc_syncPlayerData;

// only grant the killer experience if its a player and if the player killed was not recently revived.
if (isPlayer _killer && !(_player getVariable ["recentlyRevived", false])) then {
    [[_killer, "kill", _player],"SPMC_fnc_svrGrantExperience",false,false] spawn BIS_fnc_MP;
};

disableSerialization;
createDialog "SPMC_death_screen";

while {isNull (findDisplay 3100)} do {
    sleep 0.1;
};

(findDisplay 3100) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"]; 

// Create death cam
SPMC_gbl_camera  = "CAMERA" camCreate (getPosATL _player);
showCinemaBorder true;
SPMC_gbl_camera cameraEffect ["Internal","Back"];
SPMC_gbl_camera camSetTarget _player;
SPMC_gbl_camera camSetRelPos [0,3.5,4.5];
SPMC_gbl_camera camSetFOV .5;
SPMC_gbl_camera camSetFocus [50,0];
SPMC_gbl_camera camCommit 0;

//Create a thread for something?
_player spawn {
    private ["_respawning","_player"];
    _player = _this;
    _respawning = (_player getVariable ["respawning", FALSE]);

    while {!_respawning} do {
        if ((_player getVariable ["beingRevived", ""]) != "") then {
            ((findDisplay 3100) displayCtrl 3102) ctrlSetStructuredText parseText format["<t align='center'>BEING REVIVED BY: </t><t color='#0087DB' align='center'>%1</t>", (_player getVariable ["beingRevived", ""])];
        } else {
            ((findDisplay 3100) displayCtrl 3102) ctrlSetStructuredText parseText "";
        };

        sleep 1;
        _respawning = (_player getVariable ["respawning", FALSE]);
    };

    // disable the spawn btn.
    ((findDisplay 3100) displayCtrl 3101) ctrlEnable false;

    // show and begin the countdown.
    ((findDisplay 3100) displayCtrl 3103) ctrlSetTextColor [1,1,1,1];

    _respawnTime = time + ["respawn_time"] call SPMC_fnc_config;

    while {true} do {
        private ["_t"];
        _t = (_respawnTime - time);

        ((findDisplay 3100) displayCtrl 3103) ctrlSetText [_t,"MM:SS.MS"] call BIS_fnc_secondsToString;
    };
};