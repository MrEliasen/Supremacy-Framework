/**
 * SPMC_shop_arms.hpp
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
class SPMC_shop_arms
{
    idd = 2300;
    name = "SPMC_shop_arms";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class SPMC_shop_frame: RscFrame
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
        class SPMC_shop_ammotitle: RscText
        {
            idc = -1;
            text = "Ammunition";
            x = 0.3311326 * safezoneW + safezoneX;
            y = 0.566 * safezoneH + safezoneY;
            w = 0.0902344 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {0.871,0.549,0.051,1};
            sizeEx = 0.06;
        };
        class SPMC_shop_itemtitle: RscText
        {
            idc = -1;
            text = "Weapons";
            x = 0.340586 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.0661718 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {0.871,0.549,0.051,1};
            sizeEx = 0.06;
        };
        class SPMC_shop_title: RscText
        {
            idc = -1;
            text = "ARMA DEALER";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.871,0.549,0.051,1};
            sizeEx = 0.06;
        };
    };

    class controls
    {
        class SPMC_shop_items: RscListbox
        {
            idc = 2301;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.242 * safezoneH;
            onLBSelChanged = "[] call SPMC_fnc_armsShopWeaponSelected;";
        };
        class SPMC_shop_ammo: RscListbox
        {
            idc = 2302;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.599 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.11 * safezoneH;
        };
        class SPMC_shop_purchaseweapon: RscButton
        {
            idc = 2303;
            text = "PURCHASE WEAPON";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.511 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.044 * safezoneH;
            onButtonClick = "[] call SPMC_fnc_armsShopBuyWeapon;";
        };
        class SPMC_shop_cancel: RscButton
        {
            idc = -1;
            text = "CANCEL";
            x = 0.551562 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.044 * safezoneH;
            onButtonClick = "closeDialog 0;";
        };
        class SPMC_shop_purchaseammo: RscButton
        {
            idc = 2304;
            text = "PURCHASE ANNUNITION";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.044 * safezoneH;
            onButtonClick = "[] call SPMC_fnc_armsShopBuyAmmo;";
        };
        class SPMC_shop_description: RscStructuredText
        {
            idc = 2305;
            text = "Select an item for more details.";
            x = 0.453594 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.462 * safezoneH;
            size = 0.03;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0};
        };
    };
};