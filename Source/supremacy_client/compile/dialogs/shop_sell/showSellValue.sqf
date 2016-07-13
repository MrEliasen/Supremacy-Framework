/**
 * showSellValue.sqf
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

private ["_item","_price"];
_price = lbValue [2401, lbCurSel(2401)];
disableSerialization;

ctrlSetText[2403, format["%1%2", ['currency_symbol'] call SPMC_fnc_config, _price]];