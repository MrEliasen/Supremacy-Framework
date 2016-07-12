/**
 * initAirDropTimer.sqf
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

[] spawn {
    private ["_airdropIntval"];
    last_air_drop_marker = "";
    _airdropIntval = (["airdrop_interval"] call SPMC_fnc_config);

    while{true} do {
        sleep (60 * _airdropIntval);
        [] call SPMC_fnc_callAirDrop;
    };
};