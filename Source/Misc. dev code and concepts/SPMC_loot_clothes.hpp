/**
 * SPMC_loot_clothes.hpp
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @package    Supremacy Framework
 * @author     Mark Eliasen <https://github.com/MrEliasen>
 * @copyright  2016 Mark Eliasen
 * @license    CC BY-NC 3.0 License
 * @link       https://github.com/MrEliasen/SupremacyFramework
 */
class SPMC_loot_clothes
{
    idd = 2500;
    name = "SPMC_loot_clothes";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground
    {
        class SPMC_loot_clothes_frame: RscFrame
        {
            idc = -1;
            x = 0.396875 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.201094 * safezoneW;
            h = 0.55 * safezoneH;
        };
        class SPMC_shop_background: Box
        {
            idc = -1;
            x = 0.396875 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.201094 * safezoneW;
            h = 0.55 * safezoneH;
            colorBackground[] = {0,0,0,0.9};
        };
        class SPMC_loot_clothes_title: RscText
        {
            idc = -1;
            text = "Loot Clothes | Pick Up Clothes | Equip Clothes";
            x = 0.396875 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.201094 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.871,0.549,0.051,1};
        };
    };

    class controls
    {
        class SPMC_loot_clothes_list: RscListbox
        {
            idc = 2501;
            x = 0.402031 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.190781 * safezoneW;
            h = 0.473 * safezoneH;
        };
        class SPMC_loot_clothes_confirm: RscButton
        {
            idc = 2502;
            text = "EQUIP / SWAP UNIFORM";
            x = 0.402031 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.139219 * safezoneW;
            h = 0.044 * safezoneH;
            onButtonClick = "[] call SPMC_fnc_lootClothesEquip;";
        };
        class SPMC_loot_clothes_close: RscButton
        {
            idc = 2503;
            text = "CLOSE";
            x = 0.546406 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.0464063 * safezoneW;
            h = 0.044 * safezoneH;
            onButtonClick = "closeDialog 0; SPMC_gbl_container = [objNull, [], 0.0];";
        };
    };
};