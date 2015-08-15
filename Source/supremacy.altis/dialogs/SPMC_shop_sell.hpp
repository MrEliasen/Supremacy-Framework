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
class SPMC_shop_sell
{
    idd = 2400;
    name = "SPMC_shop_sell";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class SPMC_shop_sell_frame: RscFrame
        {
            idc = -1;
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.517 * safezoneH;
        };
        class SPMC_shop_sell_background: Box
        {
            idc = -1;
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.517 * safezoneH;
            colorBackground[] = {0,0,0,0.9};
        };
        class SPMC_shop_sell_inventorytitle: RscText
        {
            idc = -1;
            text = "YOUR EQUIPMENT";
            x = 0.448438 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class SPMC_shop_sell_title: RscText
        {
            idc = -1;
            text = "SELL YOUR ITEMS";
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.871,0.549,0.051,1};
        };
        class SPMC_shop_sell_valuelbl: RscText
        {
            idc = -1;
            text = "Item Value:";
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.687 * safezoneH + safezoneY;
            w = 0.0515625 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };

    class controls
    {
        class SPMC_shop_sell_items: RscListbox
        {
            idc = 2401;
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.139219 * safezoneW;
            h = 0.385 * safezoneH;
            onLBSelChanged = "[] call SPMC_fnc_showSellValue;";
        };
        class SPMC_shop_sell_value: RscText
        {
            idc = 2403;
            text = "0";
            x = 0.469062 * safezoneW + safezoneX;
            y = 0.687 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class SPMC_shop_sell_confirm: RscButton
        {
            idc = 2402;
            text = "SELL ITEM";
            x = 0.4175 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.139219 * safezoneW;
            h = 0.044 * safezoneH;
            onButtonClick = "[] call SPMC_fnc_sellItem;";
        };
    };
};