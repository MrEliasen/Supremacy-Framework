/*
    Author: HallyG

    Description:
    Draws a progress bar to visualise an action taking place.

    Parameter(s):
    0: [STRING] - Text to display
    1: [SCALAR] - Total Time
    2: [STRING] - Animation name - (Default: "AinvPknlMstpSnonWnonDnon_medic_1")
    
    Returns:
    [NOTHING]
        
    Example:
    _a = ["Eating...",10] spawn HGF_fnc_progressBar;
    waitUntil {scriptDone _a};

    ---------------------------------------
    Slightly modified by Mark Eliasen
    so dont hate on HallyG if it is broken!
*/

private ["_text","_startTime","_totalTime","_progressBar","_progressText","_actionTime","_animation"];
_text = [_this,0,"",[""]] call BIS_fnc_param;
_actionTime = [_this,1,15,[15]] call BIS_fnc_param;
_animation = [_this,2,"AinvPknlMstpSnonWnonDnon_medic_1",["AinvPknlMstpSnonWnonDnon_medic_1"]] call BIS_fnc_param;

if ((player getVariable ["isBusy",false])) exitWith {};
player setVariable ["isBusy",true];

// make sure the interrupt flag is not set before the progress bar actually kicks off.
SPMC_gbl_interrupt = false;

disableSerialization;
("HGF_progressBar" call BIS_fnc_rscLayer) cutRsc ["HGF_ProgressBar", "PLAIN", 0.001, false];

_progressBar = ((uiNamespace getVariable "HGF_ProgressBar") displayCtrl 22202);
_progressBar progressSetPosition 0;
_progressText = ((uiNamespace getVariable "HGF_ProgressBar") displayCtrl 22201);
_progressText ctrlSetText _text;

_startTime = time; 
_totalTime = time + _actionTime; 

while {true} do {
    if ((!alive player) || (time >= _totalTime) || SPMC_gbl_interrupt) exitWith {
        player setVariable ["isBusy",false];
    };

    _progressBar progressSetPosition ((time - _startTime)/_actionTime); 
        
    if ( vehicle player == player ) then {
        if (animationState player != _animation) then {
            player switchMove _animation; 
            player playMoveNow _animation;
        };
    };
};

if (!alive player || SPMC_gbl_interrupt) then {
    hint "Action aborted";
    _progressText ctrlSetText "Action Aborted"; 
    _progressBar progressSetPosition 0;
};

if (alive player) then {
    player playMoveNow "";
};

sleep 0.5;
("HGF_progressBar" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];