/**
 * init.sqf
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
enableSaving [false, false];

if(!isDedicated) then {
    waitUntil {!(isNull player)};
    player enablesimulation false;

    _handle = [] execVM "compile\_master.sqf";
    waitUntil {scriptDone _handle};

    _handle = [] execVM "3rdparty\_master.sqf";
    waitUntil {scriptDone _handle};

    0 cutText["Server initiating, please wait.","BLACK FADED"];
    0 cutFadeOut 9999999;

    waitUntil {sleep 0.25; !(isNil "serverIsReady")};

    [] spawn {
        while {!serverIsReady} do {
            0 cutText [serverStatus,"BLACK FADED"];
            sleep 0.25;
        };
    };
    
    waitUntil {sleep 0.25; serverIsReady};

    0 cutText["Client initiating, please wait..","BLACK FADED"];
    0 cutFadeOut 9999999;

    // Set event handlers;
    _handle = [] spawn SPMC_fnc_playerEvents;
    waitUntil {sleep 0.1; scriptDone _handle};

    // Set player actions;
    _handle = [] spawn SPMC_fnc_playerActions;
    waitUntil {sleep 0.1; scriptDone _handle};

    // setup the player character + inventory
    _handle = [] spawn SPMC_fnc_playerSetup;
    waitUntil {sleep 0.1; scriptDone _handle};

    // Load the briefing
    _handle = [] spawn SPMC_fnc_briefing;
    waitUntil {sleep 0.1; scriptDone _handle};
};