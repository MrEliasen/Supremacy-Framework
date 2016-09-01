/**
 * SPMC_shop_vehicle.hpp
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
class SPMC_shop_vehicle
{
    idd = 2600;
    name = "SPMC_shop_vehicle";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class SPMC_shop_vehicle_frame: RscFrame
        {
            idc = -1;
            x = 0.335 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.324844 * safezoneW;
            h = 0.55 * safezoneH;
        };
        class SPMC_shop_vehicle_background: Box
        {
            idc = -1;
            x = 0.335 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.324844 * safezoneW;
            h = 0.55 * safezoneH;
            colorBackground[] = {0,0,0,0.9};
        };
        class SPMC_shop_vehicle_header: RscText
        {
            idc = -1;
            text = "VEHICLE SHOP";
            x = 0.335 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.324844 * safezoneW;
            h = 0.033 * safezoneH;
            sizeEx = 0.04;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.871,0.549,0.051,1};
        };
        class SPMC_shop_vehicle_buy_title: RscText
        {
            idc = -1;
            text = "VEHICLES (BUY)";
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {0.871,0.549,0.051,1};
            sizeEx = 0.04;
        };
        class SPMC_shop_vehicle_sell_title: RscText
        {
            idc = -1;
            text = "VEHICLES (SELL)";
            x = 0.54125 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {0.871,0.549,0.051,1};
            sizeEx = 0.04;
        };
    };

    class controls
    {
        class SPMC_shop_vehicle_buy_list: RscListbox
        {
            idc = 2601;
            x = 0.340156 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.22 * safezoneH;
            sizeEx = 0.022;
            onLBSelChanged = "[2601,2603] call SPMC_fnc_vehicleSelected;";
        };
        class SPMC_shop_vehicle_sell_list: RscListbox
        {
            idc = 2602;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.22 * safezoneH;
            sizeEx = 0.022;
            onLBSelChanged = "[2602,2604] call SPMC_fnc_vehicleSelected;";
        };
        class SPMC_shop_vehicle_buy_details: RscStructuredText
        {
            idc = 2603;
            x = 0.340156 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.22 * safezoneH;
        };
        class SPMC_shop_vehicle_sell_details: RscStructuredText
        {
            idc = 2604;
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.22 * safezoneH;
        };
        class SPMC_shop_vehicle_buy_confirm: RscButton
        {
            idc = 2605;
            text = "PURCHASE VEHICLE";
            x = 0.340156 * safezoneW + safezoneX;
            y = 0.489 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.044 * safezoneH;
            colorBackground[] = {0.75,0.75,0.75,1};
            colorFocused[] = {0.75,0.75,0.75,1};
            onButtonClick = "[] call SPMC_fnc_vehicleShopBuy;";
        };
        class SPMC_shop_vehicle_sell_confirm: RscButton
        {
            idc = 2606;
            text = "SELL VEHICLE";
            x = 0.505156 * safezoneW + safezoneX;
            y = 0.489 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.044 * safezoneH;
            colorBackground[] = {0.75,0.75,0.75,1};
            colorFocused[] = {0.75,0.75,0.75,1};
            onButtonClick = "[] call SPMC_fnc_vehicleShopSell;";
        };
        class SPMC_shop_vehicle_close: RscButton
        {
            idc = -1;
            text = "CLOSE";
            x = 0.597969 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0.75,0.75,0.75,1};
            colorFocused[] = {0.75,0.75,0.75,1};
            onButtonClick = "closeDialog 0;";
        };
    };
};