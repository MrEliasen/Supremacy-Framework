/**
 * config.sqf
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
SPMC_fnc_config = compileFinal "
switch (_this select 0) do {
    case ""debug_mode"": {
        true;
    };

    case ""spawn_type"": {
        ""city"";
    };

    case ""spawn_excludes"": {
        [
            ""system_safezone"",
            ""spawn_exclude_1"",
            ""spawn_exclude_2"",
            ""spawn_exclude_3"",
            ""spawn_exclude_4"",
            ""spawn_exclude_5"",
            ""spawn_exclude_6""
        ];
    };

    case ""spawn_points"": {
        [
            [
                ""spawn_1"",
                ""Molos""
            ],
            [
                ""spawn_2"",
                ""Sofia""
            ],
            [
                ""spawn_3"",
                ""Paros/Kalochori""
            ],
            [
                ""spawn_4"",
                ""Rodopoli""
            ],
            [
                ""spawn_5"",
                ""Charkia""
            ],
            [
                ""spawn_6"",
                ""Pyrgos""
            ],
            [
                ""spawn_7"",
                ""Chalkela""
            ],
            [
                ""spawn_8"",
                ""Panagia""
            ],
            [
                ""spawn_9"",
                ""Feres""
            ],
            [
                ""spawn_10"",
                ""Selakano""
            ],
            [
                ""spawn_11"",
                ""Loannia/Delfinaki""
            ],
            [
                ""spawn_12"",
                ""Athira""
            ],
            [
                ""spawn_13"",
                ""Telos""
            ],
            [
                ""spawn_14"",
                ""Frini""
            ],
            [
                ""spawn_15"",
                ""Gravia""
            ],
            [
                ""spawn_16"",
                ""Galati""
            ],
            [
                ""spawn_17"",
                ""Agios Dionysios""
            ],
            [
                ""spawn_18"",
                ""Lakka/Stavros/Neochori""
            ],
            [
                ""spawn_19"",
                ""Alikampos/Poliakko/Katalaki""
            ],
            [
                ""spawn_20"",
                ""Therisa""
            ],
            [
                ""spawn_21"",
                ""Zaros""
            ],
            [
                ""spawn_22"",
                ""Syrta""
            ],
            [
                ""spawn_23"",
                ""Kore""
            ],
            [
                ""spawn_24"",
                ""Negades""
            ],
            [
                ""spawn_25"",
                ""Panochori""
            ],
            [
                ""spawn_26"",
                ""Neri""
            ],
            [
                ""spawn_27"",
                ""Ifestiona""
            ],
            [
                ""spawn_28"",
                ""Abdera""
            ],
            [
                ""spawn_29"",
                ""Dorlda""
            ],
            [
                ""spawn_30"",
                ""Oreokastro""
            ]
        ];
    };

    case ""drop_zones"": {
        [
            ""drop_zone_1"",
            ""drop_zone_2"",
            ""drop_zone_3"",
            ""drop_zone_4"",
            ""drop_zone_5"",
            ""drop_zone_6"",
            ""drop_zone_7"",
            ""drop_zone_8"",
            ""drop_zone_9"",
            ""drop_zone_10""
        ];
    };

    case ""spawn_items"": {
        [
            ""U_IG_Guerilla1_1"",
            ""V_BandollierB_khk"",
            ""B_Kitbag_rgr"",
            ""H_Beret_grn"",
            ""hgun_ACPC2_F"",
            [
                ""9Rnd_45ACP_Mag"",
                ""9Rnd_45ACP_Mag"",
                ""9Rnd_45ACP_Mag""
            ],
            [
                ""FirstAidKit"",
                ""HandGrenade""
            ],
            [
                ""ItemMap"",
                ""ItemCompass"",
                ""ItemGPS"",
                ""ItemWatch"",
                ""NVGoggles""
            ]
        ];
    };

    case ""loot_items"": {
        [
            ""Binocular"",
            ""ToolKit"",
            ""FirstAidKit"",
            ""Chemlight_red"",
            ""Chemlight_yellow"",
            ""Chemlight_green"",
            ""Chemlight_blue"",
            ""SmokeShell"",
            ""SmokeShellGreen"",
            ""SmokeShellYellow"",
            ""SmokeShellPurple"",
            ""SmokeShellBlue"",
            ""optic_Aco_smg"",
            ""optic_ACO_grn_smg"",
            ""optic_Aco"",
            ""optic_ACO_grn"",
            ""optic_Holosight"",
            ""optic_Holosight_smg"",
            ""optic_MRCO"",
            ""optic_DMS""
        ];
    };

    case ""loot_clothes"": {
        [
            ""H_Hat_camo"",
            ""H_HelmetB_light"",
            ""U_I_pilotCoveralls"",
            ""H_Bandanna_camo"",
            ""U_B_CombatUniform_mcam"",
            ""U_B_CombatUniform_mcam_tshirt"",
            ""U_BG_Guerilla1_1"",
            ""U_BG_Guerilla2_1"",
            ""U_C_Poloshirt_burgundy"",
            ""U_I_CombatUniform"",
            ""U_C_Poor_2"",
            ""U_IG_Guerilla2_2"",
            ""U_IG_Guerilla3_1"",
            ""U_IG_Guerilla2_3"",
            ""U_C_HunterBody_grn"",
            ""U_C_WorkerCoveralls"",
            ""U_OrestesBody"",
            ""U_NikosBody"",
            ""U_C_Journalist"",
            ""U_NikosAgedBody"",
            ""U_C_Poor_2"",
            ""U_Competitor"",
            ""H_Bandanna_gry"",
            ""H_Bandanna_cbr"",
            ""H_Bandanna_khk"",
            ""H_Bandanna_sgg"",
            ""H_BandMask_blk"",
            ""H_Hat_checker"",
            ""H_Hat_grey"",
            ""H_Hat_tan"",
            ""H_Cap_blu"",
            ""H_Cap_grn"",
            ""H_Cap_oli"",
            ""H_Cap_red"",
            ""H_Cap_tan"",
            ""H_Booniehat_khk"",
            ""H_Booniehat_indp"",
            ""H_Beret_blk"",
            ""H_Beret_red"",
            ""H_Beret_grn"",
            ""H_Beret_ocamo"",
            ""I_ghillie_lsh_F"",
            ""I_ghillie_sard_F"",
            ""I_ghillie_ard_F""
        ];
    };

    case ""loot_vests"": {
        [
            ""V_BandollierB_cbr"",
            ""V_BandollierB_khk"",
            ""V_BandollierB_rgr"",
            ""V_Chestrig_khk"",
            ""V_Press_F"",
            ""V_TacVest_brn"",
            ""V_TacVest_oli"",
            ""V_TacVest_blk"",
            ""V_TacVest_camo"",
            ""V_TacVestIR_blk"",
            ""V_HarnessOGL_brn"",
            ""V_HarnessOGL_gry""
        ];
    };

    case ""loot_backpacks"": {
        [
            ""B_AssaultPack_cbr"",
            ""B_Kitbag_mcamo"",
            ""B_TacticalPack_oli"",
            ""B_FieldPack_oucamo"",
            ""B_FieldPack_ocamo"",
            ""B_FieldPack_oli"",
            ""B_Bergen_sgg"",
            ""B_Kitbag_cbr"",
            ""B_Carryall_oli"",
            ""B_Carryall_khk"",
            ""B_Carryall_khk"",
            ""B_OutdoorPack_tan"",
            ""B_OutdoorPack_blu"",
            ""B_HuntingBackpack""
        ];
    };

    case ""loot_rare_items"": {
        [
            ""optic_AMS"",
            ""optic_KHS_blk"",
            ""bipod_03_F_blk"",
            ""bipod_03_F_oli"",
            ""Laserdesignator_03"",
            ""optic_SOS"",
            ""optic_NVS"",
            ""optic_tws"",
            ""optic_LRPS""
        ];
    };

    case ""loot_rare_weapons"": {
        [
            ""srifle_LRR_F"",
            ""srifle_GM6_F"",
            ""MMG_02_camo_F"",
            ""MMG_01_tan_F"",
            ""srifle_DMR_03_F"",
            ""srifle_DMR_05_tan_f"",
            ""srifle_DMR_04_F"",
            ""srifle_DMR_02_F"",
            ""srifle_DMR_06_camo_F""
        ];
    };

    case ""loot_rare_clothes"": {
        [
            ""I_ghillie_lsh_F"",
            ""I_ghillie_sard_F"",
            ""I_ghillie_ard_F"",
            ""V_PlateCarrierL_CTRG"",
            ""V_PlateCarrierH_CTRG"",
            ""V_TacVest_blk"",
            ""H_CrewHelmetHeli_B"",
            ""U_I_FullGhillie_ard"",
            ""U_I_FullGhillie_lsh"",
            ""U_I_FullGhillie_sard"",
            ""V_PlateCarrierSpec_blk"",
            ""V_PlateCarrierGL_blk""
        ];
    };

    case ""loot_weapons"": {
        [
            ""launch_NLAW_F"",
            ""launch_RPG32_F"",
            ""arifle_Katiba_F"",
            ""arifle_SDAR_F"",
            ""arifle_TRG21_F"",
            ""arifle_TRG20_F"",
            ""arifle_Mk20_F"",
            ""srifle_DMR_01_F"",
            ""hgun_P07_F"",
            ""hgun_Rook40_F"",
            ""hgun_ACPC2_F"",
            ""hgun_Pistol_heavy_02_F"",
            ""hgun_PDW2000_F"",
            ""SMG_02_F""
        ];
    };

    case ""airdrop_weapons"": {
        [
            ""launch_Titan_short_F"",
            ""srifle_EBR_F"",
            ""arifle_MXM_Black_F"",
            ""arifle_MX_Black_F"",
            ""LMG_Mk200_F"",
            ""LMG_Zafir_F"",
            ""hgun_Rook40_snds_F"",
            ""SMG_01_F""
        ];
    };

    case ""loot_vehicles"": {
        [
            ""I_Quadbike_01_F"",
            ""I_G_Quadbike_01_F"",
            ""I_G_Offroad_01_F"",
            ""B_G_Van_01_transport_F"",
            ""O_Truck_02_covered_F"",
            ""O_Truck_02_transport_F""
        ];
    };

    case ""loot_rare_vehicles"": {
        [
            ""B_Heli_Light_01_F"",
            ""B_Heli_Transport_03_unarmed_F"",
            ""B_MRAP_01_F""
        ];
    };

    case ""loot_very_rare_vehicles"": {
        [
            ""I_G_Offroad_01_armed_F"",
            ""B_MRAP_01_hmg_F"",
            ""B_MRAP_01_gmg_F"",
            ""O_MRAP_02_hmg_F"",
            ""O_MRAP_02_gmg_F"",
            ""I_MRAP_03_hmg_F"",
            ""I_MRAP_03_gmg_F"",
            ""B_APC_Tracked_01_rcws_F"",
            ""B_Heli_Transport_01_F"",
            ""B_Heli_Light_01_armed_F"",
            ""I_APC_Wheeled_03_cannon_F"",
            ""I_MBT_03_cannon_F""
        ];
    };

    case ""loot_crate_limit"": {
        10;
    };

    case ""loot_vehicle_limit"": {
        10;
    };

    case ""airdrop_interval"": {
        30;
    };

    case ""shop_weapons"": {
        [
            ""launch_NLAW_F"",
            ""launch_RPG32_F"",
            ""arifle_Katiba_F"",
            ""arifle_SDAR_F"",
            ""arifle_TRG21_F"",
            ""arifle_TRG20_F"",
            ""arifle_Mk20_F"",
            ""srifle_DMR_01_F"",
            ""hgun_P07_F"",
            ""hgun_Rook40_F"",
            ""hgun_ACPC2_F"",
            ""hgun_Pistol_heavy_02_F"",
            ""hgun_PDW2000_F"",
            ""SMG_02_F""
        ];
    };

    case ""shop_uniforms"": {
        [
            ""U_I_pilotCoveralls"",
            ""U_B_CombatUniform_mcam"",
            ""U_B_CombatUniform_mcam_tshirt"",
            ""U_BG_Guerilla1_1"",
            ""U_BG_Guerilla2_1"",
            ""U_C_Poloshirt_burgundy"",
            ""U_I_CombatUniform"",
            ""U_C_Poor_2"",
            ""U_IG_Guerilla2_2"",
            ""U_IG_Guerilla3_1"",
            ""U_IG_Guerilla2_3"",
            ""U_C_HunterBody_grn"",
            ""U_C_WorkerCoveralls"",
            ""U_OrestesBody"",
            ""U_NikosBody"",
            ""U_C_Journalist"",
            ""U_NikosAgedBody"",
            ""U_C_Poor_2"",
            ""U_Competitor"",
            ""I_ghillie_lsh_F"",
            ""I_ghillie_sard_F"",
            ""I_ghillie_ard_F""
        ];
    };

    case ""shop_hats"": {
        [
            ""H_Hat_camo"",
            ""H_HelmetB_light"",
            ""H_Bandanna_camo"",
            ""H_Bandanna_gry"",
            ""H_Bandanna_cbr"",
            ""H_Bandanna_khk"",
            ""H_Bandanna_sgg"",
            ""H_BandMask_blk"",
            ""H_Hat_checker"",
            ""H_Hat_grey"",
            ""H_Hat_tan"",
            ""H_Cap_blu"",
            ""H_Cap_grn"",
            ""H_Cap_oli"",
            ""H_Cap_red"",
            ""H_Cap_tan"",
            ""H_Booniehat_khk"",
            ""H_Booniehat_indp"",
            ""H_Beret_blk"",
            ""H_Beret_red"",
            ""H_Beret_grn"",
            ""H_Beret_ocamo""
        ];
    };

    case ""shop_vests"": {
        [
            ""V_BandollierB_cbr"",
            ""V_BandollierB_khk"",
            ""V_BandollierB_rgr"",
            ""V_Chestrig_khk"",
            ""V_Press_F"",
            ""V_TacVest_brn"",
            ""V_TacVest_oli"",
            ""V_TacVest_blk"",
            ""V_TacVest_camo"",
            ""V_TacVestIR_blk"",
            ""V_HarnessOGL_brn"",
            ""V_HarnessOGL_gry""
        ];
    };

    case ""shop_backpacks"": {
        [
            ""B_AssaultPack_cbr"",
            ""B_Kitbag_mcamo"",
            ""B_TacticalPack_oli"",
            ""B_FieldPack_oucamo"",
            ""B_FieldPack_ocamo"",
            ""B_FieldPack_oli"",
            ""B_Bergen_sgg"",
            ""B_Kitbag_cbr"",
            ""B_Carryall_oli"",
            ""B_Carryall_khk"",
            ""B_Carryall_khk"",
            ""B_OutdoorPack_tan"",
            ""B_OutdoorPack_blu"",
            ""B_HuntingBackpack""
        ];
    };

    case ""item_prices"": {
        [
            [""arifle_Katiba_F"", 2500],
            [""arifle_Mk20_F"", 2500],
            [""arifle_MX_Black_F"", 2500],
            [""arifle_MXM_Black_F"", 2500],
            [""arifle_SDAR_F"", 2500],
            [""arifle_TRG20_F"", 2500],
            [""arifle_TRG21_F"", 2500],
            [""B_APC_Tracked_01_rcws_F"", 25000],
            [""B_AssaultPack_cbr"", 350],
            [""B_Bergen_sgg"", 350],
            [""B_Carryall_khk"", 350],
            [""B_Carryall_oli"", 350],
            [""B_FieldPack_ocamo"", 350],
            [""B_FieldPack_oli"", 350],
            [""B_FieldPack_oucamo"", 350],
            [""B_G_Van_01_transport_F"", 35000],
            [""B_Heli_Light_01_armed_F"", 35000],
            [""B_Heli_Light_01_F"", 35000],
            [""B_Heli_Transport_01_F"", 35000],
            [""B_Heli_Transport_03_unarmed_F"", 35000],
            [""B_HuntingBackpack"", 350],
            [""B_Kitbag_cbr"", 350],
            [""B_Kitbag_mcamo"", 350],
            [""B_MRAP_01_F"", 25000],
            [""B_MRAP_01_gmg_F"", 25000],
            [""B_MRAP_01_hmg_F"", 25000],
            [""B_OutdoorPack_blu"", 350],
            [""B_OutdoorPack_tan"", 350],
            [""B_TacticalPack_oli"", 350],
            [""Binocular"", 100],
            [""bipod_03_F_blk"", 350],
            [""bipod_03_F_oli"", 350],
            [""Chemlight_blue"", 25],
            [""Chemlight_green"", 25],
            [""Chemlight_red"", 25],
            [""Chemlight_yellow"", 25],
            [""FirstAidKit"", 100],
            [""H_Bandanna_camo"", 50],
            [""H_Bandanna_cbr"", 50],
            [""H_Bandanna_gry"", 50],
            [""H_Bandanna_khk"", 50],
            [""H_Bandanna_sgg"", 50],
            [""H_BandMask_blk"", 50],
            [""H_Beret_blk"", 50],
            [""H_Beret_grn"", 50],
            [""H_Beret_ocamo"", 50],
            [""H_Beret_red"", 50],
            [""H_Booniehat_indp"", 50],
            [""H_Booniehat_khk"", 50],
            [""H_Cap_blu"", 50],
            [""H_Cap_grn"", 50],
            [""H_Cap_oli"", 50],
            [""H_Cap_red"", 50],
            [""H_Cap_tan"", 50],
            [""H_CrewHelmetHeli_B"", 50],
            [""H_Hat_camo"", 50],
            [""H_Hat_checker"", 50],
            [""H_Hat_grey"", 50],
            [""H_Hat_tan"", 50],
            [""H_HelmetB_light"", 50],
            [""hgun_ACPC2_F"", 750],
            [""hgun_P07_F"", 750],
            [""hgun_PDW2000_F"", 1500],
            [""hgun_Pistol_heavy_02_F"", 750],
            [""hgun_Rook40_F"", 750],
            [""hgun_Rook40_snds_F"", 750],
            [""I_APC_Wheeled_03_cannon_F"", 25000],
            [""I_G_Offroad_01_armed_F"", 25000],
            [""I_G_Offroad_01_F"", 25000],
            [""I_G_Quadbike_01_F"", 25000],
            [""I_ghillie_ard_F"", 500],
            [""I_ghillie_lsh_F"", 500],
            [""I_ghillie_sard_F"", 500],
            [""I_MBT_03_cannon_F"", 25000],
            [""I_MRAP_03_gmg_F"", 25000],
            [""I_MRAP_03_hmg_F"", 25000],
            [""I_Quadbike_01_F"", 25000],
            [""Laserdesignator_03"", 350],
            [""launch_NLAW_F"", 5000],
            [""launch_RPG32_F"", 5000],
            [""launch_Titan_short_F"", 5000],
            [""LMG_Mk200_F"", 3000],
            [""LMG_Zafir_F"", 3000],
            [""MMG_01_tan_F"", 3000],
            [""MMG_02_camo_F"", 3000],
            [""O_MRAP_02_gmg_F"", 25000],
            [""O_MRAP_02_hmg_F"", 25000],
            [""O_Truck_02_covered_F"", 25000],
            [""O_Truck_02_transport_F"", 25000],
            [""optic_Aco"", 350],
            [""optic_ACO_grn"", 350],
            [""optic_ACO_grn_smg"", 350],
            [""optic_Aco_smg"", 350],
            [""optic_AMS"", 350],
            [""optic_DMS"", 350],
            [""optic_Holosight"", 350],
            [""optic_Holosight_smg"", 350],
            [""optic_KHS_blk"", 350],
            [""optic_LRPS"", 350],
            [""optic_MRCO"", 350],
            [""optic_NVS"", 350],
            [""optic_SOS"", 350],
            [""optic_tws"", 350],
            [""SMG_01_F"", 1500],
            [""SMG_02_F"", 1500],
            [""SmokeShell"", 75],
            [""SmokeShellBlue"", 75],
            [""SmokeShellGreen"", 75],
            [""SmokeShellPurple"", 75],
            [""SmokeShellYellow"", 75],
            [""srifle_DMR_01_F"", 3500],
            [""srifle_DMR_02_F"", 3500],
            [""srifle_DMR_03_F"", 3500],
            [""srifle_DMR_04_F"", 3500],
            [""srifle_DMR_05_tan_f"", 3500],
            [""srifle_DMR_06_camo_F"", 3500],
            [""srifle_EBR_F"", 3500],
            [""srifle_GM6_F"", 3500],
            [""srifle_LRR_F"", 3500],
            [""ToolKit"", 350],
            [""U_B_CombatUniform_mcam"", 650],
            [""U_B_CombatUniform_mcam_tshirt"", 650],
            [""U_BG_Guerilla1_1"", 650],
            [""U_BG_Guerilla2_1"", 650],
            [""U_C_HunterBody_grn"", 650],
            [""U_C_Journalist"", 650],
            [""U_C_Poloshirt_burgundy"", 650],
            [""U_C_Poor_2"", 650],
            [""U_C_WorkerCoveralls"", 650],
            [""U_Competitor"", 650],
            [""U_I_CombatUniform"", 650],
            [""U_I_FullGhillie_ard"", 650],
            [""U_I_FullGhillie_lsh"", 650],
            [""U_I_FullGhillie_sard"", 650],
            [""U_I_pilotCoveralls"", 650],
            [""U_IG_Guerilla2_2"", 650],
            [""U_IG_Guerilla2_3"", 650],
            [""U_IG_Guerilla3_1"", 650],
            [""U_NikosAgedBody"", 650],
            [""U_NikosBody"", 650],
            [""U_OrestesBody"", 650],
            [""V_BandollierB_cbr"", 400],
            [""V_BandollierB_khk"", 400],
            [""V_BandollierB_rgr"", 400],
            [""V_Chestrig_khk"", 400],
            [""V_HarnessOGL_brn"", 400],
            [""V_HarnessOGL_gry"", 400],
            [""V_PlateCarrierGL_blk"", 400],
            [""V_PlateCarrierH_CTRG"", 400],
            [""V_PlateCarrierL_CTRG"", 400],
            [""V_PlateCarrierSpec_blk"", 400],
            [""V_Press_F"", 400],
            [""V_TacVest_blk"", 400],
            [""V_TacVest_brn"", 400],
            [""V_TacVest_camo"", 400],
            [""V_TacVest_oli"", 400],
            [""V_TacVestIR_blk"", 400]
        ];
    };
};";
publicVariable "SPMC_fnc_config";