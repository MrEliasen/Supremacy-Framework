/**
 * config.sqf
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

switch (_this select 0) do {
    /**
     * Toggle "debug mode" on  or off. When enabled, loot makers will be visible on the map, and the dev menu will be available.
     * @return boolean
     */
    case "debug_mode": {
        true;
    };

    /**
     * The currency symbol to use throughout the framework
     * @return boolean
     */
    case "currency_symbol": {
        "$";
    };

    /**
     * Whether to put purchases from arms shops in the equipment box or directly to player iventory
     * @return boolean
     */
    case "purchase_to_inventory": {
        false;
    };

    /**
     * Toggle the arma 3 fatigue system on/off.
     * @return boolean
     */
    case "fatigue_enabled": {
        true;
    };
    
    /**
     * Toggle player communication on/off
     * @return boolean
     */
    case "communication_enabled": {
        true;
    };
    
    /**
     * the % chance of loot spawning in a given building. 8 = ~1450 buildings.
     * @return integer
     */
    case "house_loot_percent": {
        1;
    };
    
    /**
     * the % chance to go unconscious when you would otherwise die.
     * @return integer
     */
    case "unconscious_chance": {
        15;
    };

    /**
     * Choose the spawn method. If the option is invalid, the game will default to "select_city".
     * "random_city" = spawn the play in a random city.
     * "select_city" = The player can choose which city to spawn in.
     * "random_world" = spawn the play in a random spot throughout the whole island, within 200 meters of a road if possible.
     * 
     * @return string
     */
    case "spawn_type": {
        "random_city";
    };

    /**
     * The start money for new players.
     * @return integer
     */
    case "start_money": {
        5000;
    };
    
    /**
     * The number of seconds from when the player clicks respawn til they respawn.
     * @return integer
     */
    case "respawn_time": {
        30;
    };
    
    /**
     * The number of arms shops to have in the map (cannot exceed the number of shops placed in the map).
     * @return integer
     */
    case "spawn_arms_shops": {
        15;
    };
    
    /**
     * The number of ground vehicle shops to have in the map (cannot exceed the number of shops placed in the map).
     * @return integer
     */
    case "spawn_ground_shops": {
        10;
    };

    /**
     * The number of air vehicle shops to have in the map (cannot exceed the number of shops placed in the map).
     * @return integer
     */
    case "spawn_air_shops": {
        3;
    };
    
    /**
     * The percentage of the purchase price an item will sell for.
     * @return integer
     */
    case "sell_percentage": {
        50;
    };

    /**
     * How mant loot create to spawn on the island during startup. 
     * @return integer
     */
    case "loot_crate_limit": {
        10;
    };

    /**
     * How mant vehicles to spawn on the island during startup. 
     * @return integer
     */
    case "loot_vehicle_limit": {
        10;
    };

    /**
     * How mant stationery weapons to spawn on the island during startup. 
     * @return integer
     */
    case "loot_stationery_limit": {
        10;
    };

    /**
     * How long (in minutes) between Air Drops.
     * @return integer
     */
    case "airdrop_interval": {
        20;
    };

    /**
     * The maximum number of skills a player can learn.
     * @return integer
     */
    case "max_learned_skills": {
        10;
    };

    /**
     * Markers (must be circle markers) in which players will not be able to spawn when "random_world" spawn type is selected
     * @return array
     */
    case "spawn_excludes": {
        [
            "system_safezone",
            "spawn_exclude_1",
            "spawn_exclude_2",
            "spawn_exclude_3",
            "spawn_exclude_4",
            "spawn_exclude_5",
            "spawn_exclude_6"
        ];
    };

    /**
     * Arms shop NPC list
     * @return array
     */
    case "shop_arms_npc_list": {
        [
            "shop_arms_character_1",
            "shop_arms_character_2",
            "shop_arms_character_3",
            "shop_arms_character_4",
            "shop_arms_character_5",
            "shop_arms_character_6",
            "shop_arms_character_7",
            "shop_arms_character_8",
            "shop_arms_character_9",
            "shop_arms_character_10",
            "shop_arms_character_11",
            "shop_arms_character_12",
            "shop_arms_character_13",
            "shop_arms_character_14",
            "shop_arms_character_15",
            "shop_arms_character_16",
            "shop_arms_character_17",
            "shop_arms_character_18",
            "shop_arms_character_19",
            "shop_arms_character_20",
            "shop_arms_character_21",
            "shop_arms_character_22",
            "shop_arms_character_23",
            "shop_arms_character_24",
            "shop_arms_character_25",
            "shop_arms_character_26",
            "shop_arms_character_27",
            "shop_arms_character_28",
            "shop_arms_character_29",
            "shop_arms_character_30",
            "shop_arms_character_31",
            "shop_arms_character_32",
            "shop_arms_character_33",
            "shop_arms_character_34",
            "shop_arms_character_35",
            "shop_arms_character_36",
            "shop_arms_character_37",
            "shop_arms_character_38",
            "shop_arms_character_39",
            "shop_arms_character_40"
        ];
    };

    /**
     * Ground vehicle shop NPC list
     * @return array
     */
    case "shop_ground_vehicle_npc_list": {
        [
            "shop_vehicle_character_1",
            "shop_vehicle_character_8",
            "shop_vehicle_character_9",
            "shop_vehicle_character_10",
            "shop_vehicle_character_11",
            "shop_vehicle_character_12",
            "shop_vehicle_character_13",
            "shop_vehicle_character_14",
            "shop_vehicle_character_15",
            "shop_vehicle_character_16",
            "shop_vehicle_character_17",
            "shop_vehicle_character_18",
            "shop_vehicle_character_19",
            "shop_vehicle_character_20",
            "shop_vehicle_character_21",
            "shop_vehicle_character_22",
            "shop_vehicle_character_23",
            "shop_vehicle_character_24",
            "shop_vehicle_character_25",
            "shop_vehicle_character_26",
            "shop_vehicle_character_27",
            "shop_vehicle_character_28",
            "shop_vehicle_character_29",
            "shop_vehicle_character_30",
            "shop_vehicle_character_31",
            "shop_vehicle_character_32",
            "shop_vehicle_character_33",
            "shop_vehicle_character_34",
            "shop_vehicle_character_35",
            "shop_vehicle_character_36",
            "shop_vehicle_character_37",
            "shop_vehicle_character_38",
            "shop_vehicle_character_39",
            "shop_vehicle_character_40",
            "shop_vehicle_character_41",
            "shop_vehicle_character_42",
            "shop_vehicle_character_43",
            "shop_vehicle_character_44",
            "shop_vehicle_character_45"
        ];
    };

    /**
     * Air vehicle shop NPC list
     * @return array
     */
    case "shop_air_vehicle_npc_list": {
        [
            "shop_vehicle_character_6",
            "shop_vehicle_character_2",
            "shop_vehicle_character_3",
            "shop_vehicle_character_4",
            "shop_vehicle_character_5",
            "shop_vehicle_character_7"
        ];
    };

    /**
     * List of available spawn points (must be circles) and their name.
        [
           "marker_name",
           "Spawn Point Name the player will see"
        ]
     * @return array
     */
    case "spawn_points": {
        [
            [
                "spawn_1",
                "Molos"
            ],
            [
                "spawn_2",
                "Sofia"
            ],
            [
                "spawn_3",
                "Paros/Kalochori"
            ],
            [
                "spawn_4",
                "Rodopoli"
            ],
            [
                "spawn_5",
                "Charkia"
            ],
            [
                "spawn_6",
                "Pyrgos"
            ],
            [
                "spawn_7",
                "Chalkela"
            ],
            [
                "spawn_8",
                "Panagia"
            ],
            [
                "spawn_9",
                "Feres"
            ],
            [
                "spawn_10",
                "Selakano"
            ],
            [
                "spawn_11",
                "Loannia/Delfinaki"
            ],
            [
                "spawn_12",
                "Athira"
            ],
            [
                "spawn_13",
                "Telos"
            ],
            [
                "spawn_14",
                "Frini"
            ],
            [
                "spawn_15",
                "Gravia"
            ],
            [
                "spawn_16",
                "Galati"
            ],
            [
                "spawn_17",
                "Agios Dionysios"
            ],
            [
                "spawn_18",
                "Lakka/Stavros/Neochori"
            ],
            [
                "spawn_19",
                "Alikampos/Poliakko/Katalaki"
            ],
            [
                "spawn_20",
                "Therisa"
            ],
            [
                "spawn_21",
                "Zaros"
            ],
            [
                "spawn_22",
                "Syrta"
            ],
            [
                "spawn_23",
                "Kore"
            ],
            [
                "spawn_24",
                "Negades"
            ],
            [
                "spawn_25",
                "Panochori"
            ],
            [
                "spawn_26",
                "Neri"
            ],
            [
                "spawn_27",
                "Ifestiona"
            ],
            [
                "spawn_28",
                "Abdera"
            ],
            [
                "spawn_29",
                "Dorlda"
            ],
            [
                "spawn_30",
                "Oreokastro"
            ],
            [
                "spawn_31",
                "Anthrakia"
            ]
        ];
    };

    /**
     * Markers (must be circle markers) where the airdrop can spawn within.
     * @return array
     */
    case "drop_zones": {
        [
            "drop_zone_1",
            "drop_zone_2",
            "drop_zone_3",
            "drop_zone_4",
            "drop_zone_5",
            "drop_zone_6",
            "drop_zone_7",
            "drop_zone_8",
            "drop_zone_9",
            "drop_zone_10"
        ];
    };

    /**
     * The default loadout for respawns and new players.
     * @return array
     */
    case "spawn_items": {
        [
            [ // GUER
                "U_IG_Guerilla1_1", //uniform
                "V_BandollierB_khk", //vest
                "B_Kitbag_rgr", //backpack
                "", // helmet/hat
                "hgun_ACPC2_F", //sidearm
                [ //mags
                    "9Rnd_45ACP_Mag",
                    "30Rnd_556x45_Stanag_Tracer_Red",
                    "30Rnd_556x45_Stanag_Tracer_Red"
                ],
                [ //misc inventory items
                    "FirstAidKit",
                    "HandGrenade"
                ],
                [ // misc gear
                    "ItemMap",
                    "ItemCompass",
                    "ItemGPS",
                    "ItemWatch",
                    "NVGoggles"
                ],
                "arifle_Mk20_plain_F", //primary
                "" //launcher
            ],
            [ // WEST
                "U_BG_Guerilla2_3", //uniform
                "V_BandollierB_khk", //vest
                "B_Kitbag_rgr", //backpack
                "H_Beret_grn", // helmet/hat
                "hgun_ACPC2_F", //sidearm
                [ //mags
                    "9Rnd_45ACP_Mag",
                    "30Rnd_65x39_caseless_mag_Tracer",
                    "30Rnd_65x39_caseless_mag_Tracer"
                ],
                [ //misc inventory items
                    "FirstAidKit",
                    "HandGrenade"
                ],
                [ // misc gear
                    "ItemMap",
                    "ItemCompass",
                    "ItemGPS",
                    "ItemWatch",
                    "NVGoggles"
                ],
                "arifle_MXC_F", //primary
                "" //launcher
            ],
            [ // EAST
                "U_BG_Guerilla1_1", //uniform
                "V_BandollierB_khk", //vest
                "B_Kitbag_rgr", //backpack
                "H_Beret_grn", // helmet/hat
                "hgun_ACPC2_F", //sidearm
                [ //mags
                    "9Rnd_45ACP_Mag",
                    "30Rnd_556x45_Stanag_Tracer_Red",
                    "30Rnd_556x45_Stanag_Tracer_Red"
                ],
                [ //misc inventory items
                    "FirstAidKit",
                    "HandGrenade"
                ],
                [ // misc gear
                    "ItemMap",
                    "ItemCompass",
                    "ItemGPS",
                    "ItemWatch",
                    "NVGoggles"
                ],
                "arifle_TRG21_F", //primary
                "" //launcher
            ],
            [ // Default 
                "U_I_G_Story_Protagonist_F", //uniform
                "", //vest
                "", //backpack
                "", // helmet/hat
                "", //sidearm
                [], //mags,
                [], //misc inventory items
                [ // misc gear
                    "ItemMap",
                    "ItemCompass",
                    "ItemGPS",
                    "ItemWatch",
                    "NVGoggles"
                ],
                "", //primary
                "" //launcher
            ]
        ];
    };

    /**
     * General items available in the game shops and loot.
     * @return array
     */
    case "equip_items": {
        [
            "Binocular",
            "ToolKit",
            "FirstAidKit",
            "Medikit",
            "ItemWatch",
            "ItemCompass",
            "ItemGPS",
            "ItemRadio",
            "ItemMap",
            "Rangefinder",
            "NVGoggles"
        ];
    };

    /**
     * The weapons available in the game shops and loot.
     * @return array
     */
    case "airdrop_weapons";
    case "equip_weapons": {
        [
            "arifle_Katiba_C_F",
            "arifle_Katiba_F",
            "arifle_Katiba_GL_F",
            "arifle_Mk20C_F",
            "arifle_Mk20C_plain_F",
            "arifle_Mk20_F",
            "arifle_Mk20_GL_F",
            "arifle_Mk20_GL_plain_F",
            "arifle_Mk20_plain_F",
            "arifle_MXC_Black_F",
            "arifle_MXC_F",
            "arifle_MXM_Black_F",
            "arifle_MXM_F",
            "arifle_MX_Black_F",
            "arifle_MX_F",
            "arifle_MX_GL_Black_F",
            "arifle_MX_GL_F",
            "arifle_SDAR_F",
            "arifle_TRG20_F",
            "arifle_TRG21_F",
            "arifle_TRG21_GL_F",
            "hgun_ACPC2_F",
            "hgun_P07_F",
            "hgun_PDW2000_F",
            "hgun_Pistol_heavy_01_F",
            "hgun_Pistol_heavy_02_F",
            "hgun_Pistol_Signal_F",
            "hgun_Rook40_F",
            "launch_B_Titan_F",
            "launch_B_Titan_short_F",
            "launch_I_Titan_F",
            "launch_I_Titan_short_F",
            "launch_NLAW_F",
            "launch_O_Titan_F",
            "launch_O_Titan_short_F",
            "launch_RPG32_F",
            "launch_Titan_F",
            "launch_Titan_short_F",
            "LMG_Mk200_F",
            "LMG_Zafir_F",
            "MMG_01_hex_F",
            "MMG_01_tan_F",
            "MMG_02_black_F",
            "MMG_02_camo_F",
            "MMG_02_sand_F",
            "SMG_01_F",
            "SMG_02_F",
            "srifle_DMR_01_F",
            "srifle_DMR_02_camo_F",
            "srifle_DMR_02_F",
            "srifle_DMR_02_sniper_F",
            "srifle_DMR_03_F",
            "srifle_DMR_03_khaki_F",
            "srifle_DMR_03_multicam_F",
            "srifle_DMR_03_tan_F",
            "srifle_DMR_03_woodland_F",
            "srifle_DMR_04_F",
            "srifle_DMR_04_Tan_F",
            "srifle_DMR_05_blk_F",
            "srifle_DMR_05_hex_F",
            "srifle_DMR_05_tan_f",
            "srifle_DMR_06_camo_F",
            "srifle_DMR_06_camo_khs_F",
            "srifle_DMR_06_olive_F",
            "srifle_EBR_F",
            "srifle_GM6_camo_F",
            "srifle_GM6_F",
            "srifle_LRR_camo_F",
            "srifle_LRR_F"
        ];
    };

    /**
     * Throwable objects available in the shops and loot.
     * @return array
     */
    case "equip_throwables": {
        [
            "HandGrenade",
            "MiniGrenade",
            "SmokeShell",
            "SmokeShellYellow",
            "SmokeShellGreen",
            "SmokeShellRed",
            "SmokeShellPurple",
            "SmokeShellOrange",
            "SmokeShellBlue",
            "Chemlight_green",
            "Chemlight_red",
            "Chemlight_yellow",
            "Chemlight_blue",
            "I_IR_Grenade"
        ];
    };

    /**
     * Uniforms available in the shops and loot.
     * @return array
     */
    case "equip_clothes": {
        [
            "U_I_CombatUniform",
            "U_I_pilotCoveralls",
            "U_I_CombatUniform_tshirt",
            "U_I_CombatUniform_shortsleeve",
            "U_I_HeliPilotCoveralls",
            "U_I_OfficerUniform",
            "U_I_Wetsuit",
            "U_KerryBody",
            "U_AttisBody",
            "U_AntigonaBody",
            "U_C_Novak",
            "U_OI_Scientist",
            "U_IG_Guerilla1_1",
            "U_IG_Guerilla2_1",
            "U_IG_Guerilla2_2",
            "U_IG_Guerilla2_3",
            "U_IG_Guerilla3_1",
            "U_IG_Guerilla3_2",
            "U_IG_leader",
            "U_IG_Guerrilla_6_1",
            "U_I_FullGhillie_ard",
            "U_I_FullGhillie_lsh",
            "U_I_FullGhillie_sard",
            "U_I_GhillieSuit"
        ];
    };


    /**
     * Hats available in the shops and loot.
     * @return array
     */
    case "equip_hats": {
        [
            "H_HelmetB",
            "H_HelmetB_camo",
            "H_HelmetB_paint",
            "H_HelmetB_light",
            "H_Booniehat_khk",
            "H_Booniehat_oli",
            "H_Booniehat_indp",
            "H_Booniehat_mcamo",
            "H_Booniehat_grn",
            "H_Booniehat_tan",
            "H_Booniehat_dirty",
            "H_Booniehat_dgtl",
            "H_Booniehat_khk_hs",
            "H_HelmetB_plain_mcamo",
            "H_HelmetB_plain_blk",
            "H_HelmetSpecB",
            "H_HelmetSpecB_paint1",
            "H_HelmetSpecB_paint2",
            "H_HelmetSpecB_blk",
            "H_HelmetSpecB_snakeskin",
            "H_HelmetSpecB_sand",
            "H_HelmetIA",
            "H_HelmetIA_net",
            "H_HelmetIA_camo",
            "H_Helmet_Kerry",
            "H_HelmetB_grass",
            "H_HelmetB_snakeskin",
            "H_HelmetB_desert",
            "H_HelmetB_black",
            "H_HelmetB_sand",
            "H_Cap_red",
            "H_Cap_blu",
            "H_Cap_oli",
            "H_Cap_headphones",
            "H_Cap_tan",
            "H_Cap_blk",
            "H_Cap_blk_CMMG",
            "H_Cap_brn_SPECOPS",
            "H_Cap_tan_specops_US",
            "H_Cap_khaki_specops_UK",
            "H_Cap_grn",
            "H_Cap_grn_BI",
            "H_Cap_blk_Raven",
            "H_Cap_blk_ION",
            "H_Cap_oli_hs",
            "H_Cap_press",
            "H_Cap_usblack",
            "H_Cap_surfer",
            "H_Cap_police",
            "H_HelmetCrew_B",
            "H_HelmetCrew_O",
            "H_HelmetCrew_I",
            "H_PilotHelmetFighter_B",
            "H_PilotHelmetFighter_O",
            "H_PilotHelmetFighter_I",
            "H_PilotHelmetHeli_B",
            "H_PilotHelmetHeli_O",
            "H_PilotHelmetHeli_I",
            "H_CrewHelmetHeli_B",
            "H_CrewHelmetHeli_O",
            "H_CrewHelmetHeli_I",
            "H_HelmetO_ocamo",
            "H_HelmetLeaderO_ocamo",
            "H_MilCap_ocamo",
            "H_MilCap_mcamo",
            "H_MilCap_oucamo",
            "H_MilCap_rucamo",
            "H_MilCap_gry",
            "H_MilCap_dgtl",
            "H_MilCap_blue",
            "H_HelmetB_light_grass",
            "H_HelmetB_light_snakeskin",
            "H_HelmetB_light_desert",
            "H_HelmetB_light_black",
            "H_HelmetB_light_sand",
            "H_BandMask_blk",
            "H_BandMask_khk",
            "H_BandMask_reaper",
            "H_BandMask_demon",
            "H_HelmetO_oucamo",
            "H_HelmetLeaderO_oucamo",
            "H_HelmetSpecO_ocamo",
            "H_HelmetSpecO_blk",
            "H_Bandanna_surfer",
            "H_Bandanna_khk",
            "H_Bandanna_khk_hs",
            "H_Bandanna_cbr",
            "H_Bandanna_sgg",
            "H_Bandanna_sand",
            "H_Bandanna_surfer_blk",
            "H_Bandanna_surfer_grn",
            "H_Bandanna_gry",
            "H_Bandanna_blu",
            "H_Bandanna_camo",
            "H_Bandanna_mcamo",
            "H_Shemag_khk",
            "H_Shemag_tan",
            "H_Shemag_olive",
            "H_Shemag_olive_hs",
            "H_ShemagOpen_khk",
            "H_ShemagOpen_tan",
            "H_Beret_blk",
            "H_Beret_blk_POLICE",
            "H_Beret_red",
            "H_Beret_grn",
            "H_Beret_grn_SF",
            "H_Beret_brn_SF",
            "H_Beret_ocamo",
            "H_Beret_02",
            "H_Beret_Colonel",
            "H_Watchcap_blk",
            "H_Watchcap_cbr",
            "H_Watchcap_khk",
            "H_Watchcap_camo",
            "H_Watchcap_sgg",
            "H_TurbanO_blk",
            "H_StrawHat",
            "H_StrawHat_dark",
            "H_Hat_blue",
            "H_Hat_brown",
            "H_Hat_camo",
            "H_Hat_grey",
            "H_Hat_checker",
            "H_Hat_tan",
            "H_Cap_marshal"
        ];
    };

    /**
     * Glasses available in the shops and loot.
     * @return array
     */
    case "equip_glasses": {
        [
            "G_Spectacles",
            "G_Spectacles_Tinted",
            "G_Combat",
            "G_Lowprofile",
            "G_Shades_Black",
            "G_Shades_Green",
            "G_Shades_Red",
            "G_Squares",
            "G_Squares_Tinted",
            "G_Sport_BlackWhite",
            "G_Sport_Blackyellow",
            "G_Sport_Greenblack",
            "G_Sport_Checkered",
            "G_Sport_Red",
            "G_Tactical_Black",
            "G_Aviator",
            "G_Lady_Mirror",
            "G_Lady_Dark",
            "G_Lady_Red",
            "G_Lady_Blue",
            "G_Diving",
            "G_B_Diving",
            "G_O_Diving",
            "G_I_Diving",
            "G_Balaclava_blk",
            "G_Balaclava_oli",
            "G_Balaclava_combat",
            "G_Balaclava_lowprofile",
            "G_Bandanna_blk",
            "G_Bandanna_oli",
            "G_Bandanna_khk",
            "G_Bandanna_tan",
            "G_Bandanna_beast",
            "G_Bandanna_shades",
            "G_Bandanna_sport",
            "G_Bandanna_aviator",
            "G_Shades_Blue",
            "G_Sport_Blackred",
            "G_Tactical_Clear"
        ];
    };

    /**
     * Vests available in the shops and loot.
     * @return array
     */
    case "equip_vests": {
        [
            "V_Rangemaster_belt",
            "V_BandollierB_khk",
            "V_BandollierB_cbr",
            "V_BandollierB_rgr",
            "V_BandollierB_blk",
            "V_BandollierB_oli",
            "V_Chestrig_khk",
            "V_Chestrig_rgr",
            "V_Chestrig_blk",
            "V_Chestrig_oli",
            "V_TacVest_khk",
            "V_TacVest_brn",
            "V_TacVest_oli",
            "V_TacVest_blk",
            "V_TacVest_camo",
            "V_TacVest_blk_POLICE",
            "V_TacVestIR_blk",
            "V_TacVestCamo_khk",
            "V_HarnessO_brn",
            "V_HarnessOGL_brn",
            "V_HarnessO_gry",
            "V_HarnessOGL_gry",
            "V_HarnessOSpec_brn",
            "V_HarnessOSpec_gry",
            "V_I_G_resistanceLeader_F",
            "V_Press_F",
            "V_PlateCarrier_Kerry",
            "V_PlateCarrierL_CTRG",
            "V_PlateCarrierH_CTRG",
            "V_PlateCarrierIA1_dgtl",
            "V_PlateCarrierIA2_dgtl",
            "V_PlateCarrierIAGL_dgtl",
            "V_PlateCarrierIAGL_oli",
            "V_PlateCarrier1_rgr",
            "V_PlateCarrier2_rgr",
            "V_PlateCarrier2_blk",
            "V_PlateCarrier3_rgr",
            "V_PlateCarrierGL_rgr",
            "V_PlateCarrierGL_blk",
            "V_PlateCarrierGL_mtp",
            "V_PlateCarrier1_blk",
            "V_PlateCarrierSpec_rgr",
            "V_PlateCarrierSpec_blk",
            "V_PlateCarrierSpec_mtp"
        ];
    };

    /**
     * Backpacks available in the shops and loot.
     * @return array
     */
    case "equip_backpacks": {
        [
            "B_AssaultPack_khk",
            "B_AssaultPack_dgtl",
            "B_AssaultPack_rgr",
            "B_AssaultPack_sgg",
            "B_AssaultPack_blk",
            "B_AssaultPack_cbr",
            "B_AssaultPack_mcamo",
            "B_Kitbag_rgr",
            "B_Kitbag_mcamo",
            "B_Kitbag_sgg",
            "B_Kitbag_cbr",
            "B_TacticalPack_rgr",
            "B_TacticalPack_mcamo",
            "B_TacticalPack_ocamo",
            "B_TacticalPack_blk",
            "B_TacticalPack_oli",
            "B_FieldPack_khk",
            "B_FieldPack_ocamo",
            "B_FieldPack_oucamo",
            "B_FieldPack_cbr",
            "B_FieldPack_blk",
            "B_FieldPack_oli",
            "B_Carryall_ocamo",
            "B_Carryall_oucamo",
            "B_Carryall_mcamo",
            "B_Carryall_khk",
            "B_Carryall_cbr",
            "B_Carryall_oli",
            "B_Bergen_sgg",
            "B_Bergen_mcamo",
            "B_Bergen_rgr",
            "B_Bergen_blk",
            "B_OutdoorPack_blk",
            "B_OutdoorPack_tan",
            "B_OutdoorPack_blu",
            "B_HuntingBackpack"
        ];
    };

    /**
     * Attachments available in the shops and loot.
     * indexes:
     * 0: optics
     * 1: Bipods
     * 2: Muzzles
     * 3: accesories
     *
     * @return array
     */
    case "equip_attachments": {
        [
            [
                "optic_Arco",
                "optic_Hamr",
                "optic_Aco",
                "optic_ACO_grn",
                "optic_Aco_smg",
                "optic_ACO_grn_smg",
                "optic_Holosight",
                "optic_Holosight_smg",
                "optic_SOS",
                "optic_MRCO",
                "optic_NVS",
                "optic_Nightstalker",
                "optic_tws",
                "optic_tws_mg",
                "optic_DMS",
                "optic_Yorris",
                "optic_MRD",
                "optic_LRPS",
                "optic_AMS",
                "optic_AMS_khk",
                "optic_AMS_snd",
                "optic_KHS_blk",
                "optic_KHS_hex",
                "optic_KHS_old",
                "optic_KHS_tan"
            ],
            [
                "bipod_01_F_snd",
                "bipod_01_F_blk",
                "bipod_01_F_mtp",
                "bipod_02_F_blk",
                "bipod_02_F_tan",
                "bipod_02_F_hex",
                "bipod_03_F_blk",
                "bipod_03_F_oli"
            ],
            [
                "muzzle_snds_H",
                "muzzle_snds_L",
                "muzzle_snds_M",
                "muzzle_snds_B",
                "muzzle_snds_H_MG",
                "muzzle_snds_acp",
                "muzzle_snds_338_black",
                "muzzle_snds_338_green",
                "muzzle_snds_338_sand",
                "muzzle_snds_93mmg",
                "muzzle_snds_93mmg_tan"
            ],
            [
                "acc_flashlight",
                "acc_pointer_IR"
            ]
        ];
    };

    /**
     * Ground vehicles available in the shops and loot.
     * @return array
     */
    case "ground_vehicles": {
        [
            "B_APC_Tracked_01_rcws_F",
            "B_APC_Tracked_01_CRV_F",
            "B_APC_Tracked_01_AA_F",
            "B_MBT_01_cannon_F",
            "B_MBT_01_arty_F",
            "B_MBT_01_mlrs_F",
            "B_MRAP_01_F",
            "B_MRAP_01_gmg_F",
            "B_MRAP_01_hmg_F",
            "B_G_Offroad_01_F",
            "B_G_Offroad_01_armed_F",
            "B_Quadbike_01_F",
            "B_G_Quadbike_01_F",
            "B_G_Van_01_fuel_F",
            "B_G_Van_01_transport_F",
            "B_APC_Wheeled_01_cannon_F",
            "B_MBT_01_TUSK_F",
            "O_APC_Tracked_02_AA_F",
            "O_APC_Tracked_02_cannon_F",
            "O_MBT_02_cannon_F",
            "O_MBT_02_arty_F",
            "O_MRAP_02_F",
            "O_MRAP_02_hmg_F",
            "O_MRAP_02_gmg_F",
            "O_G_Offroad_01_armed_F",
            "O_G_Offroad_01_F",
            "O_Truck_02_covered_F",
            "O_Truck_02_transport_F",
            "O_Truck_02_fuel_F",
            "O_Truck_02_medical_F",
            "O_APC_Wheeled_02_rcws_F",
            "I_APC_tracked_03_cannon_F",
            "I_MBT_03_cannon_F",
            "I_MRAP_03_F",
            "I_MRAP_03_hmg_F",
            "I_MRAP_03_gmg_F",
            "I_Truck_02_ammo_F",
            "I_APC_Wheeled_03_cannon_F",
            "C_Offroad_01_F",
            "C_Hatchback_01_F",
            "C_Hatchback_01_sport_F",
            "C_SUV_01_F",
            "C_Van_01_box_F"
        ];
    };

    /**
     * Air vehicles available in the shops and loot.
     * @return array
     */
    case "air_vehicles": {
        [
            "B_Heli_Light_01_F",
            "B_Heli_Light_01_armed_F",
            "O_Heli_Light_02_F",
            "O_Heli_Light_02_unarmed_F",   
            "B_Heli_Attack_01_F",   
            "O_Heli_Attack_02_F",
            "O_Heli_Attack_02_black_F",
            "B_Heli_Transport_01_F",
            "B_Heli_Transport_01_camo_F",
            "I_Heli_Transport_02_F", 
            "I_Heli_light_03_unarmed_F",
            "I_Heli_light_03_F",
            "B_Plane_CAS_01_F",  
            "O_Plane_CAS_02_F",
            "I_Plane_Fighter_03_CAS_F",
            "I_Plane_Fighter_03_AA_F"
        ];
    };

    /**
     * Water vehicles available in the shops and loot.
     * @return array
     */
    case "water_vehicles": {
        [
            "C_Boat_Civil_01_F",
            "C_Rubberboat",
            "O_Boat_Transport_01_F",
            "O_Boat_Armed_01_hmg_F",
            "O_G_Boat_Transport_01_F",
            "B_Boat_Armed_01_minigun_F",
            "B_Boat_Transport_01_F",
            "I_Boat_Armed_01_minigun_F",
            "I_Boat_Transport_01_F",
            "I_G_Boat_Transport_01_F"
        ];
    };

    /**
     * Stationary weapons which will spawn in the world.
     * @return array
     */
    case "stationery_items": {
        [
            "O_static_AA_F",
            "O_static_AT_F",
            "O_HMG_01_high_F",
            "O_GMG_01_high_F"
        ];
    };

    /**
     * List of all the items in this config, with their purchase price.
     * Sell price is defined in the "sell_percentage" config entry further up.
     *
     * ["class_name", price]
     *
     * @return array
     */
    case "item_prices": {
        [
            ["Binocular", 1000],
            ["ToolKit", 1000],
            ["FirstAidKit", 1000],
            ["Medikit", 1000],
            ["ItemWatch", 1000],
            ["ItemCompass", 1000],
            ["ItemGPS", 1000],
            ["ItemRadio", 1000],
            ["ItemMap", 1000],
            ["Rangefinder", 1000],
            ["NVGoggles", 1000],
            ["arifle_Katiba_C_F", 1000],
            ["arifle_Katiba_F", 1000],
            ["arifle_Katiba_GL_F", 1000],
            ["arifle_Mk20C_F", 1000],
            ["arifle_Mk20C_plain_F", 1000],
            ["arifle_Mk20_F", 1000],
            ["arifle_Mk20_GL_F", 1000],
            ["arifle_Mk20_GL_plain_F", 1000],
            ["arifle_Mk20_plain_F", 1000],
            ["arifle_MXC_Black_F", 1000],
            ["arifle_MXC_F", 1000],
            ["arifle_MXM_Black_F", 1000],
            ["arifle_MXM_F", 1000],
            ["arifle_MX_Black_F", 1000],
            ["arifle_MX_F", 1000],
            ["arifle_MX_GL_Black_F", 1000],
            ["arifle_MX_GL_F", 1000],
            ["arifle_SDAR_F", 1000],
            ["arifle_TRG20_F", 1000],
            ["arifle_TRG21_F", 1000],
            ["arifle_TRG21_GL_F", 1000],
            ["hgun_ACPC2_F", 1000],
            ["hgun_P07_F", 1000],
            ["hgun_PDW2000_F", 1000],
            ["hgun_Pistol_heavy_01_F", 1000],
            ["hgun_Pistol_heavy_02_F", 1000],
            ["hgun_Pistol_Signal_F", 1000],
            ["hgun_Rook40_F", 1000],
            ["launch_B_Titan_F", 1000],
            ["launch_B_Titan_short_F", 1000],
            ["launch_I_Titan_F", 1000],
            ["launch_I_Titan_short_F", 1000],
            ["launch_NLAW_F", 1000],
            ["launch_O_Titan_F", 1000],
            ["launch_O_Titan_short_F", 1000],
            ["launch_RPG32_F", 1000],
            ["launch_Titan_F", 1000],
            ["launch_Titan_short_F", 1000],
            ["LMG_Mk200_F", 1000],
            ["LMG_Zafir_F", 1000],
            ["MMG_01_hex_F", 1000],
            ["MMG_01_tan_F", 1000],
            ["MMG_02_black_F", 1000],
            ["MMG_02_camo_F", 1000],
            ["MMG_02_sand_F", 1000],
            ["SMG_01_F", 1000],
            ["SMG_02_F", 1000],
            ["srifle_DMR_01_F", 1000],
            ["srifle_DMR_02_camo_F", 1000],
            ["srifle_DMR_02_F", 1000],
            ["srifle_DMR_02_sniper_F", 1000],
            ["srifle_DMR_03_F", 1000],
            ["srifle_DMR_03_khaki_F", 1000],
            ["srifle_DMR_03_multicam_F", 1000],
            ["srifle_DMR_03_tan_F", 1000],
            ["srifle_DMR_03_woodland_F", 1000],
            ["srifle_DMR_04_F", 1000],
            ["srifle_DMR_04_Tan_F", 1000],
            ["srifle_DMR_05_blk_F", 1000],
            ["srifle_DMR_05_hex_F", 1000],
            ["srifle_DMR_05_tan_f", 1000],
            ["srifle_DMR_06_camo_F", 1000],
            ["srifle_DMR_06_camo_khs_F", 1000],
            ["srifle_DMR_06_olive_F", 1000],
            ["srifle_EBR_F", 1000],
            ["srifle_GM6_camo_F", 1000],
            ["srifle_GM6_F", 1000],
            ["srifle_LRR_camo_F", 1000],
            ["srifle_LRR_F", 1000],
            ["HandGrenade", 1000],
            ["MiniGrenade", 1000],
            ["SmokeShell", 1000],
            ["SmokeShellYellow", 1000],
            ["SmokeShellGreen", 1000],
            ["SmokeShellRed", 1000],
            ["SmokeShellPurple", 1000],
            ["SmokeShellOrange", 1000],
            ["SmokeShellBlue", 1000],
            ["Chemlight_green", 1000],
            ["Chemlight_red", 1000],
            ["Chemlight_yellow", 1000],
            ["Chemlight_blue", 1000],
            ["I_IR_Grenade", 1000],
            ["U_I_CombatUniform", 1000],
            ["U_I_FullGhillie_ard", 1000],
            ["U_I_FullGhillie_lsh", 1000],
            ["U_I_FullGhillie_sard", 1000],
            ["U_I_pilotCoveralls", 1000],
            ["U_I_CombatUniform_tshirt", 1000],
            ["U_I_CombatUniform_shortsleeve", 1000],
            ["U_I_HeliPilotCoveralls", 1000],
            ["U_I_OfficerUniform", 1000],
            ["U_I_Wetsuit", 1000],
            ["U_KerryBody", 1000],
            ["U_AttisBody", 1000],
            ["U_AntigonaBody", 1000],
            ["U_C_Novak", 1000],
            ["U_OI_Scientist", 1000],
            ["U_IG_Guerilla1_1", 1000],
            ["U_IG_Guerilla2_1", 1000],
            ["U_IG_Guerilla2_2", 1000],
            ["U_IG_Guerilla2_3", 1000],
            ["U_IG_Guerilla3_1", 1000],
            ["U_IG_Guerilla3_2", 1000],
            ["U_IG_leader", 1000],
            ["U_IG_Guerrilla_6_1", 1000],
            ["U_I_GhillieSuit", 1000],
            ["H_HelmetB", 1000],
            ["H_HelmetB_camo", 1000],
            ["H_HelmetB_paint", 1000],
            ["H_HelmetB_light", 1000],
            ["H_Booniehat_khk", 1000],
            ["H_Booniehat_oli", 1000],
            ["H_Booniehat_indp", 1000],
            ["H_Booniehat_mcamo", 1000],
            ["H_Booniehat_grn", 1000],
            ["H_Booniehat_tan", 1000],
            ["H_Booniehat_dirty", 1000],
            ["H_Booniehat_dgtl", 1000],
            ["H_Booniehat_khk_hs", 1000],
            ["H_HelmetB_plain_mcamo", 1000],
            ["H_HelmetB_plain_blk", 1000],
            ["H_HelmetSpecB", 1000],
            ["H_HelmetSpecB_paint1", 1000],
            ["H_HelmetSpecB_paint2", 1000],
            ["H_HelmetSpecB_blk", 1000],
            ["H_HelmetSpecB_snakeskin", 1000],
            ["H_HelmetSpecB_sand", 1000],
            ["H_HelmetIA", 1000],
            ["H_HelmetIA_net", 1000],
            ["H_HelmetIA_camo", 1000],
            ["H_Helmet_Kerry", 1000],
            ["H_HelmetB_grass", 1000],
            ["H_HelmetB_snakeskin", 1000],
            ["H_HelmetB_desert", 1000],
            ["H_HelmetB_black", 1000],
            ["H_HelmetB_sand", 1000],
            ["H_Cap_red", 1000],
            ["H_Cap_blu", 1000],
            ["H_Cap_oli", 1000],
            ["H_Cap_headphones", 1000],
            ["H_Cap_tan", 1000],
            ["H_Cap_blk", 1000],
            ["H_Cap_blk_CMMG", 1000],
            ["H_Cap_brn_SPECOPS", 1000],
            ["H_Cap_tan_specops_US", 1000],
            ["H_Cap_khaki_specops_UK", 1000],
            ["H_Cap_grn", 1000],
            ["H_Cap_grn_BI", 1000],
            ["H_Cap_blk_Raven", 1000],
            ["H_Cap_blk_ION", 1000],
            ["H_Cap_oli_hs", 1000],
            ["H_Cap_press", 1000],
            ["H_Cap_usblack", 1000],
            ["H_Cap_surfer", 1000],
            ["H_Cap_police", 1000],
            ["H_HelmetCrew_B", 1000],
            ["H_HelmetCrew_O", 1000],
            ["H_HelmetCrew_I", 1000],
            ["H_PilotHelmetFighter_B", 1000],
            ["H_PilotHelmetFighter_O", 1000],
            ["H_PilotHelmetFighter_I", 1000],
            ["H_PilotHelmetHeli_B", 1000],
            ["H_PilotHelmetHeli_O", 1000],
            ["H_PilotHelmetHeli_I", 1000],
            ["H_CrewHelmetHeli_B", 1000],
            ["H_CrewHelmetHeli_O", 1000],
            ["H_CrewHelmetHeli_I", 1000],
            ["H_HelmetO_ocamo", 1000],
            ["H_HelmetLeaderO_ocamo", 1000],
            ["H_MilCap_ocamo", 1000],
            ["H_MilCap_mcamo", 1000],
            ["H_MilCap_oucamo", 1000],
            ["H_MilCap_rucamo", 1000],
            ["H_MilCap_gry", 1000],
            ["H_MilCap_dgtl", 1000],
            ["H_MilCap_blue", 1000],
            ["H_HelmetB_light_grass", 1000],
            ["H_HelmetB_light_snakeskin", 1000],
            ["H_HelmetB_light_desert", 1000],
            ["H_HelmetB_light_black", 1000],
            ["H_HelmetB_light_sand", 1000],
            ["H_BandMask_blk", 1000],
            ["H_BandMask_khk", 1000],
            ["H_BandMask_reaper", 1000],
            ["H_BandMask_demon", 1000],
            ["H_HelmetO_oucamo", 1000],
            ["H_HelmetLeaderO_oucamo", 1000],
            ["H_HelmetSpecO_ocamo", 1000],
            ["H_HelmetSpecO_blk", 1000],
            ["H_Bandanna_surfer", 1000],
            ["H_Bandanna_khk", 1000],
            ["H_Bandanna_khk_hs", 1000],
            ["H_Bandanna_cbr", 1000],
            ["H_Bandanna_sgg", 1000],
            ["H_Bandanna_sand", 1000],
            ["H_Bandanna_surfer_blk", 1000],
            ["H_Bandanna_surfer_grn", 1000],
            ["H_Bandanna_gry", 1000],
            ["H_Bandanna_blu", 1000],
            ["H_Bandanna_camo", 1000],
            ["H_Bandanna_mcamo", 1000],
            ["H_Shemag_khk", 1000],
            ["H_Shemag_tan", 1000],
            ["H_Shemag_olive", 1000],
            ["H_Shemag_olive_hs", 1000],
            ["H_ShemagOpen_khk", 1000],
            ["H_ShemagOpen_tan", 1000],
            ["H_Beret_blk", 1000],
            ["H_Beret_blk_POLICE", 1000],
            ["H_Beret_red", 1000],
            ["H_Beret_grn", 1000],
            ["H_Beret_grn_SF", 1000],
            ["H_Beret_brn_SF", 1000],
            ["H_Beret_ocamo", 1000],
            ["H_Beret_02", 1000],
            ["H_Beret_Colonel", 1000],
            ["H_Watchcap_blk", 1000],
            ["H_Watchcap_cbr", 1000],
            ["H_Watchcap_khk", 1000],
            ["H_Watchcap_camo", 1000],
            ["H_Watchcap_sgg", 1000],
            ["H_TurbanO_blk", 1000],
            ["H_StrawHat", 1000],
            ["H_StrawHat_dark", 1000],
            ["H_Hat_blue", 1000],
            ["H_Hat_brown", 1000],
            ["H_Hat_camo", 1000],
            ["H_Hat_grey", 1000],
            ["H_Hat_checker", 1000],
            ["H_Hat_tan", 1000],
            ["H_Cap_marshal", 1000],
            ["G_Spectacles", 1000],
            ["G_Spectacles_Tinted", 1000],
            ["G_Combat", 1000],
            ["G_Lowprofile", 1000],
            ["G_Shades_Black", 1000],
            ["G_Shades_Green", 1000],
            ["G_Shades_Red", 1000],
            ["G_Squares", 1000],
            ["G_Squares_Tinted", 1000],
            ["G_Sport_BlackWhite", 1000],
            ["G_Sport_Blackyellow", 1000],
            ["G_Sport_Greenblack", 1000],
            ["G_Sport_Checkered", 1000],
            ["G_Sport_Red", 1000],
            ["G_Tactical_Black", 1000],
            ["G_Aviator", 1000],
            ["G_Lady_Mirror", 1000],
            ["G_Lady_Dark", 1000],
            ["G_Lady_Red", 1000],
            ["G_Lady_Blue", 1000],
            ["G_Diving", 1000],
            ["G_B_Diving", 1000],
            ["G_O_Diving", 1000],
            ["G_I_Diving", 1000],
            ["G_Balaclava_blk", 1000],
            ["G_Balaclava_oli", 1000],
            ["G_Balaclava_combat", 1000],
            ["G_Balaclava_lowprofile", 1000],
            ["G_Bandanna_blk", 1000],
            ["G_Bandanna_oli", 1000],
            ["G_Bandanna_khk", 1000],
            ["G_Bandanna_tan", 1000],
            ["G_Bandanna_beast", 1000],
            ["G_Bandanna_shades", 1000],
            ["G_Bandanna_sport", 1000],
            ["G_Bandanna_aviator", 1000],
            ["G_Shades_Blue", 1000],
            ["G_Sport_Blackred", 1000],
            ["G_Tactical_Clear", 1000],
            ["V_Rangemaster_belt", 1000],
            ["V_BandollierB_khk", 1000],
            ["V_BandollierB_cbr", 1000],
            ["V_BandollierB_rgr", 1000],
            ["V_BandollierB_blk", 1000],
            ["V_BandollierB_oli", 1000],
            ["V_Chestrig_khk", 1000],
            ["V_Chestrig_rgr", 1000],
            ["V_Chestrig_blk", 1000],
            ["V_Chestrig_oli", 1000],
            ["V_TacVest_khk", 1000],
            ["V_TacVest_brn", 1000],
            ["V_TacVest_oli", 1000],
            ["V_TacVest_blk", 1000],
            ["V_TacVest_camo", 1000],
            ["V_TacVest_blk_POLICE", 1000],
            ["V_TacVestIR_blk", 1000],
            ["V_TacVestCamo_khk", 1000],
            ["V_HarnessO_brn", 1000],
            ["V_HarnessOGL_brn", 1000],
            ["V_HarnessO_gry", 1000],
            ["V_HarnessOGL_gry", 1000],
            ["V_HarnessOSpec_brn", 1000],
            ["V_HarnessOSpec_gry", 1000],
            ["V_I_G_resistanceLeader_F", 1000],
            ["V_Press_F", 1000],
            ["V_PlateCarrier_Kerry", 1000],
            ["V_PlateCarrierL_CTRG", 1000],
            ["V_PlateCarrierH_CTRG", 1000],
            ["V_PlateCarrierIA1_dgtl", 1000],
            ["V_PlateCarrierIA2_dgtl", 1000],
            ["V_PlateCarrierIAGL_dgtl", 1000],
            ["V_PlateCarrierIAGL_oli", 1000],
            ["V_PlateCarrier1_rgr", 1000],
            ["V_PlateCarrier2_rgr", 1000],
            ["V_PlateCarrier2_blk", 1000],
            ["V_PlateCarrier3_rgr", 1000],
            ["V_PlateCarrierGL_rgr", 1000],
            ["V_PlateCarrierGL_blk", 1000],
            ["V_PlateCarrierGL_mtp", 1000],
            ["V_PlateCarrier1_blk", 1000],
            ["V_PlateCarrierSpec_rgr", 1000],
            ["V_PlateCarrierSpec_blk", 1000],
            ["V_PlateCarrierSpec_mtp", 1000],
            ["B_AssaultPack_khk", 1000],
            ["B_AssaultPack_dgtl", 1000],
            ["B_AssaultPack_rgr", 1000],
            ["B_AssaultPack_sgg", 1000],
            ["B_AssaultPack_blk", 1000],
            ["B_AssaultPack_cbr", 1000],
            ["B_AssaultPack_mcamo", 1000],
            ["B_Kitbag_rgr", 1000],
            ["B_Kitbag_mcamo", 1000],
            ["B_Kitbag_sgg", 1000],
            ["B_Kitbag_cbr", 1000],
            ["B_TacticalPack_rgr", 1000],
            ["B_TacticalPack_mcamo", 1000],
            ["B_TacticalPack_ocamo", 1000],
            ["B_TacticalPack_blk", 1000],
            ["B_TacticalPack_oli", 1000],
            ["B_FieldPack_khk", 1000],
            ["B_FieldPack_ocamo", 1000],
            ["B_FieldPack_oucamo", 1000],
            ["B_FieldPack_cbr", 1000],
            ["B_FieldPack_blk", 1000],
            ["B_FieldPack_oli", 1000],
            ["B_Carryall_ocamo", 1000],
            ["B_Carryall_oucamo", 1000],
            ["B_Carryall_mcamo", 1000],
            ["B_Carryall_khk", 1000],
            ["B_Carryall_cbr", 1000],
            ["B_Carryall_oli", 1000],
            ["B_Bergen_sgg", 1000],
            ["B_Bergen_mcamo", 1000],
            ["B_Bergen_rgr", 1000],
            ["B_Bergen_blk", 1000],
            ["B_OutdoorPack_blk", 1000],
            ["B_OutdoorPack_tan", 1000],
            ["B_OutdoorPack_blu", 1000],
            ["B_HuntingBackpack", 1000],
            ["B_Parachute", 1000],
            ["optic_Arco", 1000],
            ["optic_Hamr", 1000],
            ["optic_Aco", 1000],
            ["optic_ACO_grn", 1000],
            ["optic_Aco_smg", 1000],
            ["optic_ACO_grn_smg", 1000],
            ["optic_Holosight", 1000],
            ["optic_Holosight_smg", 1000],
            ["optic_SOS", 1000],
            ["optic_MRCO", 1000],
            ["optic_NVS", 1000],
            ["optic_Nightstalker", 1000],
            ["optic_tws", 1000],
            ["optic_tws_mg", 1000],
            ["optic_DMS", 1000],
            ["optic_Yorris", 1000],
            ["optic_MRD", 1000],
            ["optic_LRPS", 1000],
            ["optic_AMS", 1000],
            ["optic_AMS_khk", 1000],
            ["optic_AMS_snd", 1000],
            ["optic_KHS_blk", 1000],
            ["optic_KHS_hex", 1000],
            ["optic_KHS_old", 1000],
            ["optic_KHS_tan", 1000],
            ["bipod_01_F_snd", 1000],
            ["bipod_01_F_blk", 1000],
            ["bipod_01_F_mtp", 1000],
            ["bipod_02_F_blk", 1000],
            ["bipod_02_F_tan", 1000],
            ["bipod_02_F_hex", 1000],
            ["bipod_03_F_blk", 1000],
            ["bipod_03_F_oli", 1000],
            ["muzzle_snds_H", 1000],
            ["muzzle_snds_L", 1000],
            ["muzzle_snds_M", 1000],
            ["muzzle_snds_B", 1000],
            ["muzzle_snds_H_MG", 1000],
            ["muzzle_snds_acp", 1000],
            ["muzzle_snds_338_black", 1000],
            ["muzzle_snds_338_green", 1000],
            ["muzzle_snds_338_sand", 1000],
            ["muzzle_snds_93mmg", 1000],
            ["muzzle_snds_93mmg_tan", 1000],
            ["acc_flashlight", 1000],
            ["acc_pointer_IR", 1000],
            ["B_APC_Tracked_01_rcws_F", 1000],
            ["B_APC_Tracked_01_CRV_F", 1000],
            ["B_APC_Tracked_01_AA_F", 1000],
            ["B_MBT_01_cannon_F", 1000],
            ["B_MBT_01_arty_F", 1000],
            ["B_MBT_01_mlrs_F", 1000],
            ["B_MRAP_01_F", 1000],
            ["B_MRAP_01_gmg_F", 1000],
            ["B_MRAP_01_hmg_F", 1000],
            ["B_G_Offroad_01_F", 1000],
            ["B_G_Offroad_01_armed_F", 1000],
            ["B_Quadbike_01_F", 1000],
            ["B_G_Quadbike_01_F", 1000],
            ["B_G_Van_01_fuel_F", 1000],
            ["B_G_Van_01_transport_F", 1000],
            ["B_APC_Wheeled_01_cannon_F", 1000],
            ["B_MBT_01_TUSK_F", 1000],
            ["O_APC_Tracked_02_AA_F", 1000],
            ["O_APC_Tracked_02_cannon_F", 1000],
            ["O_MBT_02_cannon_F", 1000],
            ["O_MBT_02_arty_F", 1000],
            ["O_MRAP_02_F", 1000],
            ["O_MRAP_02_hmg_F", 1000],
            ["O_MRAP_02_gmg_F", 1000],
            ["O_G_Offroad_01_armed_F", 1000],
            ["O_G_Offroad_01_F", 1000],
            ["O_Truck_02_covered_F", 1000],
            ["O_Truck_02_transport_F", 1000],
            ["O_Truck_02_fuel_F", 1000],
            ["O_Truck_02_medical_F", 1000],
            ["O_APC_Wheeled_02_rcws_F", 1000],
            ["I_APC_tracked_03_cannon_F", 1000],
            ["I_MBT_03_cannon_F", 1000],
            ["I_MRAP_03_F", 1000],
            ["I_MRAP_03_hmg_F", 1000],
            ["I_MRAP_03_gmg_F", 1000],
            ["I_Truck_02_ammo_F", 1000],
            ["I_APC_Wheeled_03_cannon_F", 1000],
            ["C_Offroad_01_F", 1000],
            ["C_Hatchback_01_F", 1000],
            ["C_Hatchback_01_sport_F", 1000],
            ["C_SUV_01_F", 1000],
            ["C_Van_01_box_F", 1000],
            ["B_Heli_Light_01_F", 1000],
            ["B_Heli_Light_01_armed_F", 1000],
            ["O_Heli_Light_02_F", 1000],
            ["O_Heli_Light_02_unarmed_F", 1000],
            ["B_Heli_Attack_01_F", 1000],
            ["O_Heli_Attack_02_F", 1000],
            ["O_Heli_Attack_02_black_F", 1000],
            ["B_Heli_Transport_01_F", 1000],
            ["B_Heli_Transport_01_camo_F", 1000],
            ["I_Heli_Transport_02_F", 1000],
            ["I_Heli_light_03_unarmed_F", 1000],
            ["I_Heli_light_03_F", 1000],
            ["B_Plane_CAS_01_F", 1000],
            ["O_Plane_CAS_02_F", 1000],
            ["I_Plane_Fighter_03_CAS_F", 1000],
            ["I_Plane_Fighter_03_AA_F", 1000],
            ["C_Boat_Civil_01_F", 1000],
            ["C_Rubberboat", 1000],
            ["O_Boat_Transport_01_F", 1000],
            ["O_Boat_Armed_01_hmg_F", 1000],
            ["O_G_Boat_Transport_01_F", 1000],
            ["B_Boat_Armed_01_minigun_F", 1000],
            ["B_Boat_Transport_01_F", 1000],
            ["I_Boat_Armed_01_minigun_F", 1000],
            ["I_Boat_Transport_01_F", 1000],
            ["I_G_Boat_Transport_01_F", 1000],
            ["30Rnd_65x39_caseless_green", 100],
            ["30Rnd_65x39_caseless_green_mag_Tracer", 100],
            ["30Rnd_556x45_Stanag", 100],
            ["30Rnd_556x45_Stanag_Tracer_Red", 100],
            ["30Rnd_556x45_Stanag_Tracer_Green", 100],
            ["30Rnd_556x45_Stanag_Tracer_Yellow", 100],
            ["30Rnd_556x45_Stanag_red", 100],
            ["30Rnd_556x45_Stanag_green", 100],
            ["30Rnd_65x39_caseless_mag", 100],
            ["30Rnd_65x39_caseless_mag_Tracer", 100],
            ["20Rnd_556x45_UW_mag", 100],
            ["9Rnd_45ACP_Mag", 100],
            ["16Rnd_9x21_Mag", 100],
            ["30Rnd_9x21_Mag", 100],
            ["30Rnd_9x21_Red_Mag", 100],
            ["30Rnd_9x21_Yellow_Mag", 100],
            ["30Rnd_9x21_Green_Mag", 100],
            ["16Rnd_9x21_red_Mag", 100],
            ["16Rnd_9x21_green_Mag", 100],
            ["16Rnd_9x21_yellow_Mag", 100],
            ["11Rnd_45ACP_Mag", 100],
            ["6Rnd_45ACP_Cylinder", 100],
            ["6Rnd_GreenSignal_F", 100],
            ["6Rnd_RedSignal_F", 100],
            ["Titan_AA", 100],
            ["Titan_AT", 100],
            ["Titan_AP", 100],
            ["NLAW_F", 100],
            ["RPG32_F", 100],
            ["RPG32_HE_F", 100],
            ["200Rnd_65x39_cased_Box", 100],
            ["200Rnd_65x39_cased_Box_Tracer", 100],
            ["150Rnd_762x54_Box", 100],
            ["150Rnd_762x54_Box_Tracer", 100],
            ["150Rnd_93x64_Mag", 100],
            ["130Rnd_338_Mag", 100],
            ["30Rnd_45ACP_Mag_SMG_01", 100],
            ["30Rnd_45ACP_Mag_SMG_01_tracer_green", 100],
            ["30Rnd_45ACP_Mag_SMG_01_Tracer_Red", 100],
            ["30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow", 100],
            ["10Rnd_762x54_Mag", 100],
            ["10Rnd_338_Mag", 100],
            ["20Rnd_762x51_Mag", 100],
            ["10Rnd_127x54_Mag", 100],
            ["10Rnd_93x64_DMR_05_Mag", 100],
            ["5Rnd_127x108_Mag", 100],
            ["5Rnd_127x108_APDS_Mag", 100],
            ["7Rnd_408_Mag", 100]
        ];
    };

    default {
        "INVALID";
    };
};