/**
 * showShopMenu.sqf
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

private["_type", "_shop"];
_type = (_this select 3) select 0;

if (!alive player || dialog) exitWith {};

_shop = (format["%1", ((_this select 3) select 1)] splitString "_");
_shop set [1, "arms_crate"];
SPMC_gbl_currentShop = missionNamespace getVariable (_shop joinString "_");

switch (_type) do {
    case "arms": {
        [] call SPMC_fnc_showArmsShop;
    };
    case "clothes": {
        [] call SPMC_fnc_showClothesShop;
    };
};
