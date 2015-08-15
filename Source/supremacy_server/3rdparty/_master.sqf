/**
 * _master.sqf
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

// SHK_pos
call compile preprocessfile "\supremacy_server\3rdparty\SHK\shk_pos_init.sqf";

// Number to text conversion function
fnc_numberToText = compileFinal preprocessfilelinenumbers "\supremacy_server\3rdparty\numberToText.sqf";
publicVariable "fnc_numberToText";