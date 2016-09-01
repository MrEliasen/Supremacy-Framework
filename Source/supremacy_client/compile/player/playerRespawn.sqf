/**
 * playerRespawn.sqf
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

private["_player", "_corpse"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_corpse = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

0 cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

[] call SPMC_fnc_resetMedicalVars;
[] call SPMC_fnc_playerActions;
[] call SPMC_fnc_playerSetup;