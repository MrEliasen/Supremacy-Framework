/**
 * briefing.sqf
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
waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules") exitwith {};

player createDiarySubject ["entrysection", "Entry Name"];

player createDiaryRecord[
	"entrysection",
	[
		"Entry Title",
		"Entry Content"
	]
];