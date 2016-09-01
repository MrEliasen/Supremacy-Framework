/**
 * SPMC_skills_menu.hpp
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
class SPMC_skills_menu
{
    idd = 2800;
    name = "SPMC_skills_menu";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class SPMC_skills_menu_frame: RscFrame
        {
            idc = -1;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.55 * safezoneH;
        };
        class SPMC_skills_menu_background: Box
        {
            idc = -1;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.55 * safezoneH;
            colorBackground[] = {0,0,0,0.9};
        };
        class SPMC_skills_menu_header: RscText
        {
            idc = -1;
            text = "YOUR SKILLS";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0.871,0.549,0.051,1};
        };
    };

    class controls
    {
        class SPMC_skills_menu_list: RscListbox
        {
            idc = 2801;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.418 * safezoneH;
            sizeEx = 0.044;
            onLBSelChanged = "[] call SPMC_fnc_selectSkill;";
        };
        class SPMC_skills_menu_details: RscStructuredText
        {
            idc = 2802;
            x = 0.453594 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.473 * safezoneH;
        };
        class SPMC_skills_menu_info: RscStructuredText
        {
            idc = 2803;
            text = "";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.665 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.044 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
        class SPMC_skills_menu_learn: RscButton
        {
            idc = 2804;
            text = "LEARN SKILL";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.044 * safezoneH;
            colorBackground[] = {0.75,0.75,0.75,1};
            colorFocused[] = {0.75,0.75,0.75,1};
            onButtonClick = "[] call SPMC_fnc_learnSkill;";
        };
        class SPMC_skills_menu_reset: RscButton
        {
            idc = 2805;
            text = "RESET SKILLS";
            x = 0.453594 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.0825 * safezoneW;
            h = 0.044 * safezoneH;
            colorBackground[] = {0.75,0.75,0.75,1};
            colorFocused[] = {0.75,0.75,0.75,1};
            onButtonClick = "[] spawn SPMC_fnc_resetSkills;";
        };
        class SPMC_skills_menu_close: RscButton
        {
            idc = -1;
            text = "CLOSE";
            x = 0.639219 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0.75,0.75,0.75,1};
            colorFocused[] = {0.75,0.75,0.75,1};
            onButtonClick = "closeDialog 0;";
        };
    };
};