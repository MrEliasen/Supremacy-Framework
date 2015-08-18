/**
 * SPMC_player_menu.hpp
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
class SPMC_player_menu
{
    idd = 1900;
    name = "SPMC_player_menu";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class SPMC_player_menu_frame: RscFrame
        {
            idc = -1;
            x = 0.407187 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.190781 * safezoneW;
            h = 0.352 * safezoneH;
        };
        class SPMC_player_menu_background: Box
        {
            idc = -1;
            x = 0.407187 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.190781 * safezoneW;
            h = 0.352 * safezoneH;
            colorBackground[] = {0,0,0,0.9};
        };
        class SPMC_player_menu_header: RscText
        {
            idc = -1;
            text = "PLAYER MENU";
            x = 0.407187 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.190781 * safezoneW;
            h = 0.033 * safezoneH;
            sizeEx = 0.04;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.871,0.549,0.051,1};
        };
    };
    
    class controls
    {
        class SPMC_player_menu_health: RscStructuredText
        {
            idc = 1901;
            text = "LOADING";
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.121 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.388,0.102,0.102,1};
        };
        class SPMC_player_menu_stamina: RscStructuredText
        {
            idc = 1902;
            text = "LOADING";
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.121 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.102,0.137,0.388,1};
        };
        class SPMC_player_menu_money: RscStructuredText
        {
            idc = 1903;
            text = "LOADING";
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.467 * safezoneH + safezoneY;
            w = 0.180469 * safezoneW;
            h = 0.121 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.102,0.388,0.153,1};
        };
        class SPMC_player_menu_sync_status: RscStructuredText
        {
            idc = 1904;
            text = "Loading";
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.180469 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
        class SPMC_player_menu_sync_action: RscButton
        {
            idc = 1905;
            text = "SYNC NOW";
            x = 0.453594 * safezoneW + safezoneX;
            y = 0.632 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.033 * safezoneH;
            onButtonClick = "[""everything""] call SPMC_fnc_syncPlayerData;";
        };
        class SPMC_player_menu_close: RscButton
        {
            idc = -1;
            text = "CLOSE";
            x = 0.54125 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.0567187 * safezoneW;
            h = 0.033 * safezoneH;
            onButtonClick = "closeDialog 0;";
        };
    };
};