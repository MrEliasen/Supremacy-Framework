/**
 * skillsList.sqf
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
/*
    Each skill need a unique "KEY". If you change the KEY of a skills, people who have bought that skill will loose it.

    A skill consists of the following:
    [
        "Skill-KEY",
        "Skill-Name",
        "Skill-Description",
        [
            "Skill-KEY of required skill before you can purchase this skill",
            "Skill-KEY of required skill before you can purchase this skill",
            "Skill-KEY of required skill before you can purchase this skill"
        ],
        "Experience Cost",
        [
            "Skill-Modifiers | how you use this/these modifier is up to you."
        ]
    ]

    Example:
    [
        "athlete-1",
        "Athlete Level 3",
        "Your stamina will regenerate quicker and you will be able to run longer before suffering from fatigue.",
        [
            "athlete-1",
            "athlete-2"
        ],
        3,
        [
            0.5
        ]
    ]

    If you want to list the skills together, you just wrap them inside an array.
*/
_skills = [];

// PILOTING SKILL LINE
_skills = _skills + [[
    "pilot",
    "Air Pilot",
    "Allows you to fly planes and helicopters.",
    [],
    30,
    []
]];
_skills = _skills + [[
    "tank-crew",
    "Tank Crew",
    "Allows you to drive, command and use the main weaponry in tanks and heavy armor vehicles.",
    [],
    30,
    []
]];
_skills = _skills + [[
    "boat-captain",
    "Captain",
    "Allows you to sail attack boats, submarines and other heavy sea vehicles.",
    [],
    30,
    []
]];

// SILVER TONGUE SKILLS LINE
_skills = _skills + [[
    [
        "silver-1",
        "Silver Tongue (1)",
        "Reduces the price of everything you buy, by %1 percent.",
        [],
        10,
        [
            3
        ]
    ],
    [
        "silver-2",
        "Silver Tongue (2)",
        "Reduces the price of everything you buy, by %1 percent.",
        [
            "silver-1"
        ],
        20,
        [
            6
        ]
    ],
    [
        "silver-3",
        "Silver Tongue (3)",
        "Reduces the price of everything you buy, by %1 percent.",
        [
            "silver-1",
            "silver-2"
        ],
        30,
        [
            10
        ]
    ]
]];

// MECHANIC SKILL LINE
_skills = _skills + [[
    [
        "mechanic-1",
        "Mechanic (1)",
        "You will be able to repair vehicles (takes %1 seconds).",
        [],
        10,
        [
            35
        ]
    ],
    [
        "mechanic-2",
        "Mechanic (2)",
        "You will be able to repair vehicles (takes %1 seconds).",
        [
            "mechanic-1"
        ],
        20,
        [
            25
        ]
    ],
    [
        "mechanic-3",
        "Mechanic (3)",
        "You will be able to repair vehicles (takes %1 seconds).<br>You are able to repair vehicles without a repair kit.",
        [
            "mechanic-1",
            "mechanic-2"
        ],
        30,
        [
            15
        ]
    ]
]];

// SURVIVAL EXPERT SKILL LINE
_skills = _skills + [[
    [
        "survival-1",
        "Survival Expert(1)",
        "You will regain %1 percent health every %2 seconds, while under %3 percent health.",
        [],
        10,
        [
            1,
            60,
            70
        ]
    ],
    [
        "survival-2",
        "Survival Expert(2)",
        "You will regain %1 percent health every %2 seconds, while under %3 percent health.",
        [
            "survival-1"
        ],
        20,
        [
            1.5,
            45,
            75
        ]
    ],
    [
        "survival-3",
        "Survival Expert(3)",
        "You will regain %1 percent health every %2 seconds, while under %3 percent health.",
        [
            "survival-1",
            "survival-2"
        ],
        30,
        [
            2,
            30,
            80
        ]
    ]
]];

// MEDIC SKILL LINE
_skills = _skills + [[
    [
        "medic-1",
        "Medic (1)",
        "You can heal other players with Medikits (takes %1 seconds).",
        [],
        10,
        [
            20
        ]
    ],
    [
        "medic-2",
        "Medic (2)",
        "You can heal other players with Medikits (takes %1 seconds).<br/>You can revive other players (takes %2 seconds).",
        [
            "medic-1"
        ],
        20,
        [
            15,
            30
        ]
    ],
    [
        "medic-3",
        "Medic (3)",
        "You can heal other players with Medikits (takes %1 seconds).<br/>You can revive other players (takes %2 seconds).",
        [
            "medic-1",
            "medic-2"
        ],
        30,
        [
            10,
            15
        ]
    ]
]];

// FIGHTER SKILL LINE
_skills = _skills + [[
    [
        "fighter-1",
        "Fighter (1)",
        "You have %1 percent chance of becoming unconscious when you would otherwise die (default chance: %2 percent).",
        [],
        10,
        [
            30,
            (["unconscious_chance"] call SPMC_fnc_config)
        ]
    ],
    [
        "fighter-2",
        "Fighter (2)",
        "You have %1 percent chance of becoming unconscious when you would otherwise die (default chance: %2 percent).",
        [
            "fighter-1"
        ],
        20,
        [
            50,
            (["unconscious_chance"] call SPMC_fnc_config)
        ]
    ],
    [
        "fighter-3",
        "Fighter (3)",
        "You have %1 percent chance of becoming unconscious when you would otherwise die (default chance: %2 percent).",
        [
            "fighter-1",
            "fighter-2"
        ],
        30,
        [
            70,
            (["unconscious_chance"] call SPMC_fnc_config)
        ]
    ]
]];

// This skill line is only useful if the fatigue system is enabled.
if ((["fatigue_enabled"] call SPMC_fnc_config)) then {
    // ATHLETRE SKILL LINE
    _skills = _skills + [[
        [
            "athlete-1",
            "Athlete (1)",
            "Your recover %1 percent stamina every 3 seconds, even while moving.",
            [],
            10,
            [
                0.15
            ]
        ],
        [
            "athlete-2",
            "Athlete (2)",
            "Your recover %1 percent stamina every 3 seconds, even while moving.",
            [
                "athlete-1"
            ],
            20,
            [
                0.3
            ]
        ],
        [
            "athlete-3",
            "Athlete (3)",
            "Your recover %1 percent stamina every 3 seconds, even while moving.",
            [
                "athlete-1",
                "athlete-2"
            ],
            30,
            [
                0.6
            ]
        ],
        [
            "athlete-4",
            "Athlete (4)",
            "Your recover %1 percent stamina every 3 seconds, even while moving.",
            [
                "athlete-1",
                "athlete-2",
                "athlete-3"
            ],
            40,
            [
                0.9
            ]
        ],
        [
            "athlete-5",
            "Athlete (5)",
            "Your recover %1 percent stamina every 3 seconds, even while moving.",
            [
                "athlete-1",
                "athlete-2",
                "athlete-3",
                "athlete-4"
            ],
            50,
            [
                1.15
            ]
        ]
    ]];
};

_skills;