/**
 * SPMC_shop_arms.hpp
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
class SPMC_shop_arms
{
    idd = 2300;
    name = "SPMC_shop_arms";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class SPMC_shop_arms_frame: RscFrame
        {
            idc = -1;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.55 * safezoneH;
        };
        class SPMC_shop_background: Box
        {
            idc = -1;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.55 * safezoneH;
            colorBackground[] = {0,0,0,0.9};
        };
        class SPMC_shop_arms_header: RscText
        {
            idc = -1;
            text = "WEAPONS | AMMUNITION | ACCESORIES | GRENADES";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.033 * safezoneH;
            sizeEx = 0.04;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.871,0.549,0.051,1};
        };
        class SPMC_shop_arms_firearms_title: RscText
        {
            idc = -1;
            text = "FIREARMS";
            x = 0.329844 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.0464063 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {0.871,0.549,0.051,1};
            sizeEx = 0.04;
        };
        class SPMC_shop_arms_attch_title: RscText
        {
            idc = -1;
            text = "ATTACHMENTS";
            x = 0.520625 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {0.871,0.549,0.051,1};
            sizeEx = 0.04;
        };
        class SPMC_shop_arms_acc_title: RscText
        {
            idc = -1;
            text = "ACCESSORIES";
            x = 0.618594 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {0.871,0.549,0.051,1};
            sizeEx = 0.04;
        };
        class SPMC_shop_arms_sp_attch_title: RscText
        {
            idc = -1;
            text = "WEAPON SPECIFIC ITEMS";
            x = 0.587656 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {0.871,0.549,0.051,1};
            sizeEx = 0.04;
        };
        class SPMC_shop_arms_sp_ammo_title: RscText
        {
            idc = -1;
            text = "WEAPON SPECIFIC AMMO";
            x = 0.45875 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {0.871,0.549,0.051,1};
            sizeEx = 0.04;
        };
        class SPMC_shop_arms_ammo_title: RscText
        {
            idc = -1;
            text = "AMMUNITION";
            x = 0.432969 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.0567187 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {0.871,0.549,0.051,1};
            sizeEx = 0.04;
        };
    };

    class controls
    {
        class SPMC_shop_arms_firearms_list: RscListbox
        {
            idc = 2301;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.242 * safezoneH;
            sizeEx = 0.022;
            onLBSelChanged = "[] call SPMC_fnc_armsShopWeaponSelected;";
        };
        class SPMC_shop_arms_ammo_list: RscListbox
        {
            idc = 2302;
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.242 * safezoneH;
            sizeEx = 0.022;
            onLBSelChanged = "[""ammo""] call SPMC_fnc_armsShopItemSelected;";
        };
        class SPMC_shop_arms_attch_list: RscListbox
        {
            idc = 2303;
            x = 0.510312 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.242 * safezoneH;
            sizeEx = 0.022;
            onLBSelChanged = "[""attach""] call SPMC_fnc_armsShopItemSelected;";
        };
        class SPMC_shop_arms_acc_list: RscListbox
        {
            idc = 2304;
            x = 0.60828 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.242 * safezoneH;
            sizeEx = 0.022;
            onLBSelChanged = "[""acc""] call SPMC_fnc_armsShopItemSelected;";
        };
        class SPMC_shop_arms_sp_ammo_list: RscListbox
        {
            idc = 2305;
            x = 0.45875 * safezoneW + safezoneX;
            y = 0.577 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.143 * safezoneH;
            sizeEx = 0.022;
            onLBSelChanged = "[""spammo""] call SPMC_fnc_armsShopItemSelected;";
        };
        class SPMC_shop_arms_sp_attch_list: RscListbox
        {
            idc = 2306;
            x = 0.5825 * safezoneW + safezoneX;
            y = 0.577 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.143 * safezoneH;
            sizeEx = 0.022;
            onLBSelChanged = "[""spattach""] call SPMC_fnc_armsShopItemSelected;";
        };

        
        class SPMC_shop_arms_firearms_buy: RscButton
        {
            idc = 2307;
            text = "BUY FIREARM";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.511 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0.75,0.75,0.75,1};
            colorFocused[] = {0.75,0.75,0.75,1};
            onButtonClick = "[] call SPMC_fnc_armsShopBuyWeapon;";
        };
        class SPMC_shop_arms_ammo_buy: RscButton
        {
            idc = 2308;
            text = "BUY AMMUNITION";
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.511 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0.75,0.75,0.75,1};
            colorFocused[] = {0.75,0.75,0.75,1};
            onButtonClick = "[] call SPMC_fnc_armsShopBuyAmmo;";
        };
        class SPMC_shop_arms_attch_buy: RscButton
        {
            idc = 2309;
            text = "BUY ATTACHMENT";
            x = 0.510312 * safezoneW + safezoneX;
            y = 0.511 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0.75,0.75,0.75,1};
            colorFocused[] = {0.75,0.75,0.75,1};
            onButtonClick = "[] call SPMC_fnc_armsShopBuyAttachment;";
        };
        class SPMC_shop_arms_acc_buy: RscButton
        {
            idc = 2310;
            text = "BUY ACCESSORY";
            x = 0.60828 * safezoneW + safezoneX;
            y = 0.511 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0.75,0.75,0.75,1};
            colorFocused[] = {0.75,0.75,0.75,1};
            onButtonClick = "[] call SPMC_fnc_armsShopBuyAccessory;";
        };
        class SPMC_shop_arms_close: RscButton
        {
            idc = 2311;
            text = "CLOSE";
            x = 0.659844 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.0464063 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0.75,0.75,0.75,1};
            colorFocused[] = {0.75,0.75,0.75,1};
            onButtonClick = "closeDialog 0;";
        };
        class SPMC_shop_arms_sp_ammo_buy: RscButton
        {
            idc = 2312;
            text = "BUY AMMUNITION";
            x = 0.45875 * safezoneW + safezoneX;
            y = 0.731 * safezoneH + safezoneY;
            w = 0.113437 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0.75,0.75,0.75,1};
            colorFocused[] = {0.75,0.75,0.75,1};
            onButtonClick = "[true] call SPMC_fnc_armsShopBuyAmmo;";
        };
        class SPMC_shop_arms_sp_attch_buy: RscButton
        {
            idc = 2313;
            text = "BUY ATTACHMENT";
            x = 0.5825 * safezoneW + safezoneX;
            y = 0.731 * safezoneH + safezoneY;
            w = 0.118594 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0.75,0.75,0.75,1};
            colorFocused[] = {0.75,0.75,0.75,1};
            onButtonClick = "[true] call SPMC_fnc_armsShopBuyAttachment;";
        };
        class SPMC_shop_arms_details: RscStructuredText
        {
            idc = 2314;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.154687 * safezoneW;
            h = 0.219 * safezoneH;
            size = 0.03;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0};
        };
    };
};