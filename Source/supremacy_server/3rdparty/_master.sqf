/**
 * _master.sqf
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

// Number to text conversion function
SPMC_fnc_numberToText = compileFinal preprocessfilelinenumbers "\supremacy_server\3rdparty\numberToText.sqf";
publicVariable "SPMC_fnc_numberToText";

// SHK_pos
call compile preprocessfile "\supremacy_server\3rdparty\SHK\shk_pos_init.sqf";

// extDB2
SPMC_fnc_dbCall = compileFinal preprocessFileLineNumbers "\supremacy_server\3rdparty\extDB2\dbCall.sqf";

// MRES functions
SPMC_fnc_mresString = compileFinal preprocessFileLineNumbers "\supremacy_server\3rdparty\mres\mresString.sqf";