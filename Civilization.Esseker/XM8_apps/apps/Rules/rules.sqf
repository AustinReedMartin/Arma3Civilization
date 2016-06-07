/*
	File: rules.sqf
	For exile edited by Repentz
*/
disableSerialization;
[
	"",
	0,
	0.2,
	10,
	0,
	0,
	8
] spawn BIS_fnc_dynamicText;

createDialog "RscDisplayWelcome";

_display = findDisplay 999999;
_text1 = _display displayCtrl 1100;
_buttonSpoiler = _display displayctrl 2400;
_textSpoiler = _display displayctrl 1101;
_text2 = _display displayCtrl 1102;

_message = "";
_message = _message + "<t align='center' size='8' shadow='0'></t><br />";
_message = _message + "<t align='center' size='1' shadow='0'>Welcome to <a href='xm8_apps/Rules/rules.init (website)' color='#ff9900'>xm8_apps/Rules/rules.init (Name) Exile Zombies</a></t><br />";
_message = _message + "______________________________________________________________________________________<br /><br />";
_message = _message + "Click this link to visit our website: <a href= 'xm8_apps/Rules/rules.init (website)' color='#ff9900'>Website</a><br />";
_message = _message + "Click this link to report any bugs/suggestions: <a href= 'xm8_apps/Rules/rules.init (forums)' color='#ff9900'>Bugs/Suggestions</a> Helps us make the server better for you!<br />";
_message = _message + "______________________________________________________________________________________<br /><br />";
_message = _message + "<t align='Center' size='1' shadow='0'><t color='#ffffff'>Rules</t></align><br />";
_message = _message + "<t color='#ff9900'>Exploits</t><br />";
_message = _message + "- You will not exploit, duplicate, abuse, glitch, hack any mechanism on the server.<br />";
_message = _message + "- You will report any exploitation, abuse, hacking, glitches, errors and/or bugs encountered on the server to the appropriate party.<br />";
_message = _message + "- You understand that failure to report any breach in the rules of the server of another player makes you just as responsible as the offender.";
_message = _message + "<br />";
_message = _message + "<t color='#ff9900'>Buildings</t><br />";
_message = _message + "- No building across roads, within 500m of towns, militarys stations, industrials zones and traders<br />";
_message = _message + "- You will construct your base 150m away from others bases";
_message = _message + "- No base Kamikaze with Aircraft or other Vehicles";
_message = _message + "<br />";
_message = _message + "<t color='#ff9900'>Safezones</t><br />";
_message = _message + "- No camping nearby safezones, stealing vehicles inside safezones, or harassing people inside safezones<br />";
_message = _message + "<t color='#ff9900'>Chats</t><br />";
_message = _message + "- No racism, arguing over sidechat, talking in sidechat, or general harassment<br /><br />";
_message = _message + "<a color='#ff9900'>xm8_apps/Rules/rules.init (Name) Staff</a><br /><br />";



 
//Fill only the first text
_text1 ctrlSetStructuredText (parseText _message);

//Resize StructuredText component to display the scrollbar if needed
_positionText1 = ctrlPosition _text1;
_yText1 = _positionText1 select 1;
_hText1 = ctrlTextHeight _text1;
_text1 ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1];
_text1 ctrlcommit 0;
//Hide second text, spoiler text and button
_buttonSpoiler ctrlSetFade 1;
_buttonSpoiler ctrlCommit 0;
_buttonSpoiler ctrlEnable false;
_textSpoiler ctrlSetFade 1;
_textSpoiler ctrlCommit 0;
_text2 ctrlSetFade 1;
_text2 ctrlCommit 0;
