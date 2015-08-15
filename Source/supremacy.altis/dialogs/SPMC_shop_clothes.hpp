/**
 * SPMC_shop_clothes.hpp
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
class SPMC_shop_clothes
{
    idd = 2700;
    name = "SPMC_shop_clothes";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class SPMC_shop_clothes_frame: RscFrame
        {
            idc = -1;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.55 * safezoneH;
        };
        class SPMC_shop_clothes_background: Box
        {
            idc = -1;
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.55 * safezoneH;
            colorBackground[] = {0,0,0,0.9};
        };
        class SPMC_shop_clothes_header: RscText
        {
            idc = -1;
            text = "CLOTHING SHOP";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.033 * safezoneH;
            sizeEx = 0.04;
            colorBackground[] = {0.871,0.549,0.051,1};
        };
        class SPMC_shop_clothes_uniforms_title: RscText
        {
            idc = -1;
            text = "UNIFORMS";
            x = 0.340156 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.0515625 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = 0.04;
            colorText[] = {0.871,0.549,0.051,1};
        };
        class SPMC_shop_clothes_hats_title: RscText
        {
            idc = -1;
            text = "HATS/HELMETS";
            x = 0.463906 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = 0.04;
            colorText[] = {0.871,0.549,0.051,1};
        };
        class SPMC_shop_clothes_glasses_title: RscText
        {
            idc = -1;
            text = "GLASSES";
            x = 0.613437 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.0464063 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = 0.04;
            colorText[] = {0.871,0.549,0.051,1};
        };
        class SPMC_shop_clothes_vests_title: RscText
        {
            idc = -1;
            text = "VESTS";
            x = 0.345312 * safezoneW + safezoneX;
            y = 0.522 * safezoneH + safezoneY;
            w = 0.0360937 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = 0.04;
            colorText[] = {0.871,0.549,0.051,1};
        };
        class SPMC_shop_clothes_backpacks_title: RscText
        {
            idc = -1;
            text = "BACKPACKS";
            x = 0.474219 * safezoneW + safezoneX;
            y = 0.522 * safezoneH + safezoneY;
            w = 0.0567187 * safezoneW;
            h = 0.022 * safezoneH;
            sizeEx = 0.04;
            colorText[] = {0.871,0.549,0.051,1};
        };
        class SPMC_shop_clothes_uniforms_pricelbl: RscText
        {
            idc = -1;
            text = "PRICE:";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.011 * safezoneH;
        };
        class SPMC_shop_clothes_hats_pricelbl: RscText
        {
            idc = -1;
            text = "PRICE:";
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.011 * safezoneH;
        };
        class SPMC_shop_clothes_glasses_pricelbl: RscText
        {
            idc = -1;
            text = "PRICE:";
            x = 0.572187 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.011 * safezoneH;
        };
        class SPMC_shop_clothes_vests_pricelbl: RscText
        {
            idc = -1;
            text = "PRICE:";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.011 * safezoneH;
        };
        class SPMC_shop_clothes_backpacks_pricelbl: RscText
        {
            idc = -1;
            text = "PRICE:";
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.011 * safezoneH;
        };
    };

    class controls
    {
        class SPMC_shop_clothes_uniforms_list: RscListbox
        {
            idc = 2701;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.187 * safezoneH;
            onLBSelChanged = "[""uniform""] call SPMC_fnc_clothesShopItemSelected;";
        };
        class SPMC_shop_clothes_hats_list: RscListbox
        {
            idc = 2702;
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.187 * safezoneH;
            onLBSelChanged = "[""hat""] call SPMC_fnc_clothesShopItemSelected;";
        };
        class SPMC_shop_clothes_glasses_list: RscListbox
        {
            idc = 2703;
            x = 0.572187 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.187 * safezoneH;
            onLBSelChanged = "[""glasses""] call SPMC_fnc_clothesShopItemSelected;";
        };
        class SPMC_shop_clothes_vests_list: RscListbox
        {
            idc = 2704;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.154 * safezoneH;
            onLBSelChanged = "[""vest""] call SPMC_fnc_clothesShopItemSelected;";
        };
        class SPMC_shop_clothes_backpacks_list: RscListbox
        {
            idc = 2705;
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.154 * safezoneH;
            onLBSelChanged = "[""backpack""] call SPMC_fnc_clothesShopItemSelected;";
        };


        class SPMC_shop_clothes_uniforms_buy: RscButton
        {
            idc = 2711;
            text = "PURCHASE";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.033 * safezoneH;
            onButtonClick = "[] call SPMC_fnc_clothesShopBuyUniform;";
        };
        class SPMC_shop_clothes_hats_buy: RscButton
        {
            idc = 2712;
            text = "PURCHASE";
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.033 * safezoneH;
            onButtonClick = "[] call SPMC_fnc_clothesShopBuyHat;";
        };
        class SPMC_shop_clothes_glasses_buy: RscButton
        {
            idc = 2713;
            text = "PURCHASE";
            x = 0.572187 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.033 * safezoneH;
            onButtonClick = "[] call SPMC_fnc_clothesShopBuyGlasses;";
        };
        class SPMC_shop_clothes_vests_buy: RscButton
        {
            idc = 2714;
            text = "PURCHASE";
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.731 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.033 * safezoneH;
            onButtonClick = "[] call SPMC_fnc_clothesShopBuyVest;";
        };
        class SPMC_shop_clothes_backpacks_buy: RscButton
        {
            idc = 2715;
            text = "PURCHASE";
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.731 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.033 * safezoneH;
            onButtonClick = "[] call SPMC_fnc_clothesShopBuyBackpack;";
        };


        class SPMC_shop_clothes_uniforms_price: RscText
        {
            idc = 2721;
            text = "0";
            x = 0.329844 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.011 * safezoneH;
            colorText[] = {0.153,0.902,0.251,1};
        };
        class SPMC_shop_clothes_hats_price: RscText
        {
            idc = 2722;
            text = "0";
            x = 0.469062 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.011 * safezoneH;
            colorText[] = {0.153,0.902,0.251,1};
        };
        class SPMC_shop_clothes_glasses_price: RscText
        {
            idc = 2723;
            text = "0";
            x = 0.603125 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.011 * safezoneH;
            colorText[] = {0.153,0.902,0.251,1};
        };
        class SPMC_shop_clothes_vests_price: RscText
        {
            idc = 2724;
            text = "0";
            x = 0.329844 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.011 * safezoneH;
            colorText[] = {0.153,0.902,0.251,1};
        };
        class SPMC_shop_clothes_backpacks_price: RscText
        {
            idc = 2725;
            text = "0";
            x = 0.469062 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.011 * safezoneH;
            colorText[] = {0.153,0.902,0.251,1};
        };
        class SPMC_shop_clothes_close: RscButton
        {
            idc = -1;
            text = "CLOSE";
            x = 0.644376 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.033 * safezoneH;
            onButtonClick = "closeDialog 0;";
        };


        class SPMC_shop_clothes_details: RscStructuredText
        {
            idc = 2726;
            text = "<br/>When you buy a new piece of clothes, the piece it will be replacing will be sold. Backpacks, vests and uniforms must be empty to be replaced/sold."; //--- ToDo: Localize;
            x = 0.572187 * safezoneW + safezoneX;
            y = 0.522 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.242 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
    };
};