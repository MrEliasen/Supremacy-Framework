/**
 * SPMC_admin_menu.hpp
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
class SPMC_admin_menu
{
    idd = 2200;
    name = "SPMC_admin_menu";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class SPMC_admin_frame: RscFrame
        {
            idc = -1;
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.39 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.132 * safezoneH;
        };
        class SPMC_admin_background: Box
        {
            idc = -1;
            x = 0.422656 * safezoneW + safezoneX;
            y = 0.39 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.132 * safezoneH;
            colorBackground[] = {0,0,0,0.9};
        };
        class SPMC_admin_title: RscText
        {
            idc = -1;
            text = "DEBUG MENU";
            x = 0.427812 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.055 * safezoneH;
        };
    };
    
    class controls
    {
        class SPMC_admin_teleport: RscButton
        {
            idc = 1600;
            text = "TELEPORT";
            x = 0.427812 * safezoneW + safezoneX;
            y = 0.467 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.055 * safezoneH;
            onButtonClick = "closeDialog 0; [] call SPMC_fnc_teleportMap;";
        };
    };
};