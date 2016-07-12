/**
 * pointSelected.sqf
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

private["_control","_position"];
disableSerialization;

_position = lbData [2102, lbCurSel(2102)];
_control = (findDisplay 2100) displayCtrl 2103;

_control ctrlMapAnimAdd[0.5,0.15,getMarkerPos _position];
ctrlMapAnimCommit _control;