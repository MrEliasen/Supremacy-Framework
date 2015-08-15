/**
 * init.sqf
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

    // When looting clothes, we set this to the container the user is looting.
    // This is needed so we can check if the container have the clothes they are tryinig to equip, and if something changed.
    // 0: container, 1: current item array, 2: last changed
    SPMC_gbl_container = [objNull, [], 0.0];

    // Keeps track of the current vehicle shop
    // 0: shop type (land, air, water), 1: spawn point marker names (array), 2: the list of supported vehicle types for this shop (array)
    SPMC_gbl_vehicleShop = ["", [], []];

    // Keeps track of the player's monneh!
    SPMC_gbl_money = 0;

    if(debugMode) then {
        diag_log "Loading briefing";
    };
    // Load the briefing
    _handle = [] spawn SPMC_fnc_briefing;
    waitUntil {sleep 0.1; scriptDone _handle};

    if(debugMode) then {
        diag_log "Setting up event handlers";
    };
    // Set event handlers;
    _handle = [] spawn SPMC_fnc_playerEvents;
    waitUntil {sleep 0.1; scriptDone _handle};

    if(debugMode) then {
        diag_log "Setting up player actions";
    };
    // Set player actions;
    _handle = [] spawn SPMC_fnc_playerActions;
    waitUntil {sleep 0.1; scriptDone _handle};

    if(debugMode) then {
        diag_log "Setting up character and inventory";
    };
    // setup the player character + inventory
    _handle = [] spawn SPMC_fnc_playerSetup;
    waitUntil {sleep 0.1; scriptDone _handle};
};