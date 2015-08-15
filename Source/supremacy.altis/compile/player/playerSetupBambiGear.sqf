/**
 * playerSetupBambiGear.sqf
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

private["_spawn_items"];
removeAllAssignedItems player;
removeAllWeapons player;
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
removeAllItems player;
{player removeMagazine _x;} foreach (magazines player);

_spawn_items = (["spawn_items"] call SPMC_fnc_config);

if ((_spawn_items select 0) != "") then {
    player addUniform (_spawn_items select 0);
};

if ((_spawn_items select 1) != "") then {
    player addVest (_spawn_items select 1);
};

if ((_spawn_items select 2) != "") then {
    player addBackpack (_spawn_items select 2);
};

if ((_spawn_items select 3) != "") then {
    player addHeadgear (_spawn_items select 3);
};

{
    player addMagazine _x;
} foreach (_spawn_items select 5);

if ((_spawn_items select 4) != "") then {
    player addWeapon (_spawn_items select 4);
    player selectWeapon (_spawn_items select 4);
};

{
    player addItem _x;
} foreach (_spawn_items select 6);

{
    player addItem _x;
    player assignItem _x;
} foreach (_spawn_items select 7);