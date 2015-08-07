/**
 * SPMC_spawn_menu.hpp
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @package    Supremacy Framework
 * @author     Mark Eliasen <https://github.com/MrEliasen>
 * @copyright  2015 Mark Eliasen
 * @license    MIT License
 * @link       https://github.com/MrEliasen/SupremacyFramework
 */
class SPMC_spawn_menu
{
    idd = 2100;
    name = "SPMC_spawn_menu";
    movingEnable = false;
    enableSimulation = true;
    controls[] = {
        SPMC_spawn_list
    };

    class SPMC_spawn_frame: RscFrame
    {
        idc = 2101;
        x = 0.4175 * safezoneW + safezoneX;
        y = 0.236 * safezoneH + safezoneY;
        w = 0.154687 * safezoneW;
        h = 0.528 * safezoneH;
    };
    class SPMC_spawn_background: Box
    {
        idc = -1;
        x = 0.4175 * safezoneW + safezoneX;
        y = 0.236 * safezoneH + safezoneY;
        w = 0.154687 * safezoneW;
        h = 0.528 * safezoneH;
        colorBackground[] = {0,0,0,1};
    };
    class SPMC_spawn_title: RscText
    {
        idc = -1;
        text = "SELECT SPAWN";
        x = 0.422656 * safezoneW + safezoneX;
        y = 0.247 * safezoneH + safezoneY;
        w = 0.144375 * safezoneW;
        h = 0.033 * safezoneH;
        colorText[] = {1,1,1,1};
    };
    class SPMC_spawn_list: RscListbox
    {
        idc = 2102;
        x = 0.422656 * safezoneW + safezoneX;
        y = 0.302 * safezoneH + safezoneY;
        w = 0.144375 * safezoneW;
        h = 0.440 * safezoneH;
        colorText[] = {1,1,1,1};
        sizeEx = 0.06;
        onLBSelChanged = "[] call SPMC_fnc_spawnSelected;";
    };
};