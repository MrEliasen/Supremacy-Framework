/**
 * briefing.sqf
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

if(player diarySubjectExists "rules") exitwith {};

player createDiarySubject ["rules","Rules"];
player createDiaryRecord ["rules",
[
"Rules",
"1. No cheating of any kind.<br/>
2. Don't be toxic<br/>
3. Don't spam/abuse VON.<br/>
<br/>
Remember, it's just a game."
]
];

player createDiarySubject ["community","Community"];
player createDiaryRecord ["community",
[
"NBS Gaming",
"Teamspeak: ts.nbs-gaming.com<br/>
Website:  www.nbs-gaming.com<br/>
<br/>
To join TeamSpeak, you must be signed up to our website."
]
];

player createDiarySubject ["about", "SPMC Framework"];
player createDiaryRecord ["about",
[
"About",
"Made by Simply of the NBS-Gaming community.<br/>
Source Code: https://github.com/MrEliasen/SupremacyFramework<br/>
<br/>
Released under the CC BY-NC 3.0 License<br/>
Lawyer Text: https://creativecommons.org/licenses/by-nc/3.0/legalcode<br/>
Human Text: https://creativecommons.org/licenses/by-nc/3.0/<br/>
<br/>
The license does NOT apply to, or included, the 3rd party code (fund in the ""\3rdparty"" directories).
I did not create or own any of the 3rd part scripts. Please see their credits below or in their files where possible.<br/>
<br/>
Copyright (c) 2015 Mark ""Simply"" Eliasen - 3rd party scripts are copyrighted by their respective owners."
]
];

player createDiarySubject ["thanks", "3rd Party Scripts"];
player createDiaryRecord ["thanks",
[
"Special Thanks",
"Shuko - SHK_pos<br/>
Killzone_Kid - Original Airdrop script"
]
];