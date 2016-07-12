/**
 * initServer.sqf
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
if (isDedicated) then {
    [] call compile PreprocessFileLineNumbers "\supremacy_server\init.sqf";

    // Initializes the Dynamic Groups framework
    ["Initialize"] call BIS_fnc_dynamicGroups;

    {
        if (!isNil {missionNamespace getVariable _x}) then {
            // Apply game logic to lock down the equipment box
            _house = (_x splitString "_");
            _house set [1, "arms_house"];
            _house = missionNamespace getVariable (_house joinString "_");

            _box = (_x splitString "_");
            _box set [1, "arms_crate"];
            _box = missionNamespace getVariable (_box joinString "_");

            _box attachTo [_house,[0,1,0.4]];
            _box allowDamage false;
            clearItemCargoGlobal _box;
        };
    } forEach (["shop_arms_npc_list"] call SPMC_fnc_config);
};