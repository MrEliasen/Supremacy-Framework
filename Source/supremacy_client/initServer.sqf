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
 * @link       https://github.com/MrEliasen/Supremacy-Framework
 */
if (isServer) then {
    private["_boxLogic","_logicCenter","_logicGroup"];

    [] call compile PreprocessFileLineNumbers "\supremacy_server\init.sqf";

    // Initializes the Dynamic Groups framework
    ["Initialize"] call BIS_fnc_dynamicGroups;

    // Apply game logic to lock down the equipment box. This is basically a small "hack" for
    // keeping the equipment boxes in place while still being interactable.
    _logicCenter = createCenter sideLogic;
    _logicGroup = createGroup _logicCenter;
    {
        if (!isNil {missionNamespace getVariable _x}) then {
            _house = (_x splitString "_");
            _house set [1, "arms_house"];
            _house = missionNamespace getVariable (_house joinString "_");

            _box = (_x splitString "_");
            _box set [1, "arms_crate"];
            _box = missionNamespace getVariable (_box joinString "_");

            _boxLogic = _logicGroup createUnit ["Logic", getPos _box, [], 0, "NONE"];
            _boxLogic setDir (getDir _box);

            _box attachTo [_boxLogic,[-1,0.7,1.13]];
            _box allowDamage false;
            clearItemCargoGlobal _box;
        };
    } forEach (["shop_arms_npc_list"] call SPMC_fnc_config);
};