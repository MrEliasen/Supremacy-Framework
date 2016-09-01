/**
 * briefing.sqf
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

if(player diarySubjectExists "rules") exitwith {};

player createDiarySubject ["rules","Rules"];
player createDiaryRecord ["rules",
    [
        "Rules",
        "1. No cheating of any kind.<br/>
        2. Don't be toxic.<br/>
        3. Don't spam/abuse VON."
    ]
];

player createDiarySubject ["features", "Features"];
player createDiaryRecord ["features",
    [
        "Features",
        "World loot spawns<br>
        World vehicle spawns<br>
        World stationery spawns<br>
        Dynamic Groups<br>
        Player spawn/respawn (cities, random, world)<br>
        Timed, random placement, airdrops<br>
        Equipment Shops<br>
        Vehicle Shops<br>
        Clothes Shops<br>
        Simple HUD (fps, health and money)<br>
        Persistent player data (MySQL)<br>
        Loot spawn in buildings and world loot spawn (vehicles, crates and stationary)<br>
        Skill & Experience system<br>
        Revival, heal, repair and other skills.<br>
        Ammo repacking<br>
        Air drop events<br>
        Timed Rewards"
    ]
];

player createDiarySubject ["source", "Open Source"];
player createDiaryRecord ["source",
    [
        "Open Source",
        "The whole framework is open source, yup, completely open source.<br>
        You can download the latest version here: https://github.com/MrEliasen/Supremacy-Framework<br>
        <br>
        Just make sure you adhere to the license, thanks!"
    ]
];

player createDiarySubject ["about", "SPMC Framework"];
player createDiaryRecord ["about",
    [
        "About",
        "Made by Simply (SirMrE) - www.SirMrE.com / twitter.com/markeliasen.<br/>
        Source Code: https://github.com/MrEliasen/Supremacy-Framework<br/>
        <br/>
        Released under the CC BY-NC 3.0 License<br/>
        Lawyer Text: https://creativecommons.org/licenses/by-nc/3.0/legalcode<br/>
        Human Text: https://creativecommons.org/licenses/by-nc/3.0/<br/>
        <br/>
        The license does NOT apply to, or included, the 3rd party code (fund in the ""\3rdparty"" directories).
        I did not create or own any of the 3rd part scripts. Please see their credits below or in their files where possible.<br/>
        <br/>
        Copyright (c) 2016 Mark ""SirMrE"" Eliasen - 3rd party scripts are copyrighted by their respective owners."
    ]
];

player createDiarySubject ["Credits", "Credits"];
player createDiaryRecord ["Credits",
    [
        "Credits",
        "Code<br>
        Killzone_Kid (http://killzonekid.com/arma-scripting-tutorials-epic-armour-drop/) for the Original Airdrop script.<br>
        Shuko (http://forums.bistudio.com/showthread.php?t=89376) for SHK_pos.<br>
        Bryan ""Tonic"" Boardwine (http://www.tonic.pw/) for the async extDB2 script.<br>
        Karel Moricky for the ""numberToText"" function.<br>
        HallyG (https://forums.bistudio.com/topic/184551-simple-animation-with-progressbar-and-handling/?p=2909602) for the original progress bar script.<br>
        <br>
        Extensions<br>
        Torndeco (https://bitbucket.org/torndeco/extdb3) for ExtDB3.<br>
        <br>
        Sounds<br>
        pierrecartoons1979 (https://www.freesound.org/people/pierrecartoons1979/sounds/90121/) for the ""purchase"" sound.<br>
        escortmarius (https://www.freesound.org/people/escortmarius/sounds/138096/) for the ""purchase_click"" sound.<br>
        qubodup (https://www.freesound.org/people/qubodup/sounds/140773/) for the original ""error"" sound.<br>
        GameAudio (https://www.freesound.org/people/GameAudio/sounds/220176/) for the original ""sold_item"" sound.<br>
        Gitietor (https://www.freesound.org/people/Gitietor/sounds/275335/) for the original ""skill_learned"" sound.<br>
        EdEditz (https://www.freesound.org/people/EdEditz/sounds/188340/) for the original ""reward"" sound.<br>
        <br>
        Icons<br>
        Paomedia (https://www.iconfinder.com/icons/299107/money_icon) for the ""money"" icon.<br>
        Linh Pham Thi Dieu (https://www.iconfinder.com/icons/283941/camera_device_recorder_video_icon) for the ""fps"" icon.<br>
        Visual Pharm (https://icons8.com/) for the ""health"" icon."
    ]
];