/**
 * showShopMenu.sqf
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

private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;

if (!alive player || dialog) exitWith {};

switch (_type) do {
    case "arms": {
        [] call SPMC_fnc_showArmsShop;
    };
    case "clothes": {
        [] call SPMC_fnc_showClothesShop;
    };
};