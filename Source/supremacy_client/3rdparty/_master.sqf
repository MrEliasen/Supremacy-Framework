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

call compile preprocessfile "3rdparty\SHK\shk_pos_init.sqf";
HGF_progressbar = compileFinal preprocessfilelinenumbers "3rdparty\HGF_progressbar\fnc_progressbar.sqf";