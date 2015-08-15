/**
 * SPMC_hud.hpp
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

class SPMC_hud
{
    idd = -1;
    fadeout = 0;
    fadein = 0;
    duration = 999999999999999;
    name = "SPMC_hud";
    onLoad = "uiNamespace setVariable ['SPMC_hud', _this select 0]";

    class controlsBackground 
    {
        class SPMC_HUD_icon_fps : RscPicture 
        {
            idc = -1;
            text = "icons\fps.paa";
            x = safezoneX + safezoneW - 0.15;
            y = safezoneY + safezoneH - 0.50;
            w = 0.02;
            h = 0.03;
        };
        
        class SPMC_HUD_icon_health : RscPicture
        {
            
            idc = -1;
            text = "icons\health.paa";
            x = safezoneX + safezoneW - 0.15;
            y = safezoneY + safezoneH - 0.445;
            w = 0.02;
            h = 0.03;
        };
        
        class SPMC_HUD_icon_stamina : RscPicture
        {
            
            idc = -1;
            text = "icons\stamina.paa";
            x = safezoneX + safezoneW - 0.15;
            y = safezoneY + safezoneH - 0.397;
            w = 0.02;
            h = 0.03;
        };
        
        class SPMC_HUD_icon_money : RscPicture
        {
            
            idc = -1;
            text = "icons\money.paa";
            x = safezoneX + safezoneW - 0.15;
            y = safezoneY + safezoneH - 0.349;
            w = 0.02;
            h = 0.03;
        };
    };
    
    class controls
    {
        class SPMC_HUD_text_fps: RscText
        {
            idc = 2001;
            text = "";
            x = safeZoneX + safeZoneW - 0.125;
            y = safeZoneY + safeZoneH - 0.502;
            w = 0.3;
            h = 0.05;
            sizeEx = 0.03;
            colorBackground[] = {0,0,0,0};
            colorText[] = {1,1,1,1};
        };
        
        class SPMC_HUD_text_health: RscText
        {
            idc = 2002;
            text = "";
            x = safeZoneX + safeZoneW - 0.125;
            y = safeZoneY + safeZoneH - 0.456;
            w = 0.3;
            h = 0.05;
            sizeEx = 0.03;
            colorBackground[ ]= {0,0,0,0};
            colorText[] = {1,1,1,1};
        };
        
        class SPMC_HUD_text_stamina: RscText
        {
            idc = 2003;
            text = "";
            x = safeZoneX + safeZoneW - 0.125;
            y = safeZoneY + safeZoneH - 0.410;
            w = 0.3;
            h = 0.05;
            sizeEx = 0.03;
            colorBackground[ ]= {0,0,0,0};
            colorText[] = {1,1,1,1};
        };
        
        class SPMC_HUD_text_money: RscText
        {
            idc = 2004;
            text = "";
            x = safeZoneX + safeZoneW - 0.125;
            y = safeZoneY + safeZoneH - 0.364;
            w = 0.3;
            h = 0.05;
            sizeEx = 0.03;
            colorBackground[ ]= {0,0,0,0};
            colorText[] = {1,1,1,1};
        };
    };   
};