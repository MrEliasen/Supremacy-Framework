/**
 * SPMC_player_menu.hpp
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
            x = 0.396875 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.201094 * safezoneW;
            h = 0.308 * safezoneH;
        };
        class SPMC_player_menu_background: Box
        {
            idc = -1;
            x = 0.396875 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.201094 * safezoneW;
            h = 0.308 * safezoneH;
            colorBackground[] = {0,0,0,0.9};
        };
        class SPMC_player_menu_header: RscText
        {
            idc = -1;
            text = "PLAYER MENU";
            x = 0.396875 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.201094 * safezoneW;
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
            text = "<br><t align='center' size='4.4' font='PuristaSemiBold'>LOADING</t>";
            x = 0.402031 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.121 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.388,0.102,0.102,1};
        };
        class SPMC_player_menu_stamina: RscStructuredText
        {
            idc = 1902;
            text = "<br><t align='center' size='4.4' font='PuristaSemiBold'>LOADING</t>";
            x = 0.5 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.121 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.102,0.137,0.388,1};
        };
        class SPMC_player_menu_money: RscStructuredText
        {
            idc = 1903;
            text = "<br><t align='center' size='4.4' font='PuristaSemiBold'>LOADING</t>";
            x = 0.402031 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.190781 * safezoneW;
            h = 0.121 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.102,0.388,0.153,1};
        };
        class SPMC_player_menu_close: RscButton
        {
            idc = -1;
            text = "CLOSE";
            x = 0.525781 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.033 * safezoneH;
            onButtonClick = "closeDialog 0;";
        };
        class SPMC_player_menu_sync_status: RscStructuredText
        {
            idc = 1904;
            text = "Loading";
            x = 0.402031 * safezoneW + safezoneX;
            y = 0.588 * safezoneH + safezoneY;
            w = 0.190781 * safezoneW;
            h = 0.022 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
        class SPMC_player_menu_sync_action: RscButton
        {
            idc = 1905;
            text = "SYNC NOW";
            x = 0.603125 * safezoneW + safezoneX;
            y = 0.588 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.033 * safezoneH;
            onButtonClick = "[""everything""] call SPMC_fnc_syncPlayerData;";
        };
        class SPMC_player_menu_showskills: RscButton
        {
            idc = 1906;
            text = "SKILLS";
            x = 0.603125 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.033 * safezoneH;
            onButtonClick = "[] spawn SPMC_fnc_showSkillsMenu;";
        };
        class SPMC_player_menu_showgroups: RscButton
        {
            idc = 1907;
            text = "GROUPS";
            x = 0.603125 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.033 * safezoneH;
            onButtonClick = "closeDialog 0; findDisplay 46 createDisplay ""RscDisplayDynamicGroups""";
        };
        class SPMC_player_menu_repack: RscButton
        {
            idc = 1603;
            text = "REPACK MAGS";
            x = 0.603125 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.033 * safezoneH;
            onButtonClick = "[] spawn SPMC_fnc_svrRepack;";
        };
        /*class SPMC_player_menu_btnplaceholder3: RscButton
        {
            idc = 1605;
            x = 0.603125 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class SPMC_player_menu_btnplaceholder4: RscButton
        {
            idc = 1606;
            x = 0.603125 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class SPMC_player_menu_btnplaceholder5: RscButton
        {
            idc = 1614;
            x = 0.603125 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class SPMC_player_menu_btnplaceholder6: RscButton
        {
            idc = 1607;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class SPMC_player_menu_btnplaceholder7: RscButton
        {
            idc = 1608;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class SPMC_player_menu_btnplaceholder8: RscButton
        {
            idc = 1609;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class SPMC_player_menu_btnplaceholder9: RscButton
        {
            idc = 1610;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class SPMC_player_menu_btnplaceholder10: RscButton
        {
            idc = 1611;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class SPMC_player_menu_btnplaceholder11: RscButton
        {
            idc = 1612;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class SPMC_player_menu_btnplaceholder12: RscButton
        {
            idc = 1613;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.588 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.033 * safezoneH;
        };*/
    };
};