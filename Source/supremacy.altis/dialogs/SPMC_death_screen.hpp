/**
 * SPMC_death_screen.hpp
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
class SPMC_death_screen
{
    idd = 3100;
    name = "SPMC_death_screen";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class SPMC_death_screen_frame: RscFrame
        {
            idc = -1;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.066 * safezoneH;
        };

        class SPMC_death_screen_background: Box
        {
            idc = -1;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.066 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };
    };

    class controls
    {
        class SPMC_death_screen_respawn: RscButton
        {
            idc = 3101;
            text = "RESPAWN";
            x = 0.618594 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.044 * safezoneH;
            colorBackground[] = {0.75,0.75,0.75,1};
            colorFocused[] = {0.75,0.75,0.75,1};
            colorDisabled[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0.0,0};
            onButtonClick = "[] call SPMC_fnc_playerWantToRespawn;";
        };
        class SPMC_death_screen_revivestatus: RscStructuredText
        {
            idc = 3102;
            text = "";
            x = 0.29400 * safezoneW + safezoneX;
            y = 0.2355 * safezoneH + safezoneY;
            w = 0.3300 * safezoneW;
            h = 0.044 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {1,1,1,0};
            sizeEx = 0.080;
        };

        class SPMC_death_screen_counter: RscText
        {
            idc = 3103;
            text = "";
            x = 0.448238 * safezoneW + safezoneX;
            y = 0.2355 * safezoneH + safezoneY;
            w = 0.0955 * safezoneW;
            h = 0.044 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {1,1,1,0};
            sizeEx = 0.085;
        };
    };
};