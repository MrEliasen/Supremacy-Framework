/**
 * spawn_menu_actions.sqf
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
SPMC_fnc_showLootClothesMenu = compileFinal "
private[""_container"",""_list"",""_items""];
_container = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if (isNull _container) exitWith {closeDialog 0;};
SPMC_gbl_container = [_container, [], 0.0];

createDialog ""SPMC_loot_clothes"";
disableSerialization;

waitUntil {sleep 0.1; !isNull (findDisplay 2500)};

[] spawn {
    if (isNull (SPMC_gbl_container select 0) || isNull (findDisplay 2500)) exitWith {};
    if (player distance (SPMC_gbl_container select 0) > 8) exitWith {if (!(isNull (findDisplay 2500))) then {closeDialog 0;}};

    [] call SPMC_fnc_checkLootClothesChanges;
    sleep 1;
}";

SPMC_fnd_updateLootClothesList = compileFinal "
private[""_list"",""_items""];
if (isNull (findDisplay 2500)) exitWith {};
if (isNull (SPMC_gbl_container select 0)) exitWith {};

_list = (findDisplay 2500) displayCtrl 2501;
lbClear _list;

_items = [];
{
    _itemInfo = [_x] call SPMC_fnc_getItemCfgDetails;
    if ((_itemInfo select 6) == 801) then {
        _list lbAdd (_itemInfo select 1);
        _list lbSetData[(lbSize _list) - 1, _x];
        _list lbSetPicture[(lbSize _list) - 1, (_itemInfo select 3)];

        _items set [count _items, _x];
    };
} foreach (getItemCargo (SPMC_gbl_container select 0));

_items = (_items call BIS_fnc_sortAlphabetically);

SPMC_gbl_container = [(SPMC_gbl_container select 0), _items, time];";

SPMC_fnc_checkLootClothesChanges = compileFinal "
private [""_items""];
_items = [];

if (isNull (SPMC_gbl_container select 0)) exitWith {};

if ((SPMC_gbl_container select 2) == 0.0) then {
    SPMC_gbl_container = [(SPMC_gbl_container select 0), [], time];
    [] call SPMC_fnd_updateLootClothesList;
} else {
    {
        if ((([_x] call SPMC_fnc_getItemCfgDetails) select 6) == 801) then {
            _items set [count _items, _x];
        };

    } foreach (getItemCargo (SPMC_gbl_container select 0));

    _items = (_items call BIS_fnc_sortAlphabetically);

    if (!([(SPMC_gbl_container select 1), _items] call BIS_fnc_areEqual)) exitWith {
        [] call SPMC_fnd_updateLootClothesList;
    };
};";

SPMC_fnc_lootClothesEquip = compileFinal "
private [""_uniform"",""_oldUniform""];
_uniform = lbData [2501, lbCurSel(2501)];
_oldUniform = (uniform player);

if (isNull (SPMC_gbl_container select 0)) exitWith {closeDialog 0;};

if (_uniform in (getItemCargo (SPMC_gbl_container select 0))) exitWith {
    lbDelete [2501, lbCurSel(2501)];
    Hint ""That uniform is no longer in this container."";
};

if (_oldUniform != """") then {
    SPMC_gbl_container addItemCargoGlobal [_oldUniform, 1];
    removeUniform player;

    _itemInfo = [_oldUniform] call SPMC_fnc_getItemCfgDetails;
    if ((_itemInfo select 6) == 801) then {
        _list lbAdd (_itemInfo select 1);
        _list lbSetData[(lbSize _list) - 1, _oldUniform];
        _list lbSetPicture[(lbSize _list) - 1, (_itemInfo select 3)];
    };
};

lbDelete [2501, lbCurSel(2501)];
player forceAddUniform _uniform;";