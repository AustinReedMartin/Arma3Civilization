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
_message = _message + "<t align='Center' size='1' shadow='0'><t color='#ffffff'>Server Info</t></align><br />";
_message = _message + "<t color='#ff9900'>Name:</t><a href='xm8_apps/Info/info.sqf (website)'> xm8_apps/Info/info.sqf (sever descrition)</a><br />";
_message = _message + "<t color='#ff9900'>IP:</t> xm8_apps/Info/info.sqf (IP)<br />";
_message = _message + "<t color='#ff9900'>Port:</t> xm8_apps/Info/info.sqf (port)<br />";
_message = _message + "<t color='#ff9900'>Restart Times:</t> xm8_apps/Info/info.sqf (restart times)<br />";
_message = _message + "______________________________________________________________________________________<br />";
_message = _message + "<t align='Center' size='1' shadow='0'><t color='#ffffff'>Keybinds</t></align><br />";
_message = _message + "<t color='#ff9900'>0</t> Auto Run<br />";
_message = _message + "<t color='#ff9900'>1</t> Primary Weapon<br />";
_message = _message + "<t color='#ff9900'>2</t> Handgun<br />";
_message = _message + "<t color='#ff9900'>3</t> Secondary Weapon<br />";
_message = _message + "<t color='#ff9900'>4</t> Holster and Unholster Weapon<br />";
_message = _message + "<t color='#ff9900'>5</t> Earplugs<br />";
_message = _message + "<t color='#ff9900'>6</t> XM8<br />";
_message = _message + "______________________________________________________________________________________<br />";
_message = _message + "<t align='Center' size='1' shadow='0'><t color='#ffffff'>Misc Default Keys(Unless Changed)</t></align><br />";
_message = _message + "<t color='#ff9900'>/</t> Open chat<br />";
_message = _message + "<t color='#ff9900'>, .</t> Change chat channel<br />";
_message = _message + "<t color='#ff9900'>Caps Lock</t> Push to Talk<br />";
_message = _message + "<t color='#ff9900'>P</t> Player Stats<br />";
_message = _message + "______________________________________________________________________________________<br />";
_message = _message + "<t align='Center' size='1' shadow='0'><t color='#ffffff'>Vehicle/Heli Repairs</t></align><br />";
_message = _message + "<t align='left' size='1' shadow='0'><t color='#ff9900'>Repair Tools Needed:</t><br />";
_message = _message + "<t color='#ff9900'>Car Wheel:</t> Toolbox, Wrench, Carwheel<br />";
_message = _message + "<t color='#ff9900'>Car Body:</t> Toolbox, Wrench, Duct Tape, Junk Metal<br />";
_message = _message + "<t color='#ff9900'>Heli Body(Minor Repair):</t> Toolbox, Wrench, Junk Metal, Duct Tape<br />";
_message = _message + "<t color='#ff9900'>Heli Rotors(Full Repair):</t> Toolbox, Wrench, Junk Metal, Duct Tape, Metal Pole, Metal Screws, Metal Wire, Oil Canister<br />";
_message = _message + "______________________________________________________________________________________<br />";
_message = _message + "<t align='center' size='1' shadow='0'><t color='#ffffff'>Metal/Wheel Salvage</t></align><br />";
_message = _message + "<t align='left' size='1' shadow='0'><t color='#ff9900'>Salvage Tools Needed:</t><br />";
_message = _message + "<t color='#ff9900'>Junk Metal:</t> Toolbox, Wrench, Grinder<br />";
_message = _message + "<t color='#ff9900'>Car Wheel:</t> Toolbox, Wrench<br /><br />";
//_message = _message + "______________________________________________________________________________________<br /><br />";
//_message = _message + "Buildings : <br />";
//_message = _message + "- No building across roads, within 500m of towns, militarys stations, industrials zones and traders<br /><br />";
//_message = _message + "- You will construct your base 150m away from others bases";
//_message = _message + "- No base Kamikaze with Aircraft or other Vehicles";
//_message = _message + "- No raid on empty bases";
//_message = _message + "<br /><br />";
//_message = _message + "Safezones : <br />";
//_message = _message + "- No camping nearby safezones, stealing vehicles inside safezones, or harassing people inside safezones<br /><br />";
//_message = _message + "<br /><br />";
//_message = _message + "Chats : <br />";
//_message = _message + "- No racism, arguing over sidechat, talking in sidechat, or general harassment<br /><br />";
//_message = _message + "<br /><br />";
//_message = _message + "<br /><br />";
//_message = _message + " Sincerely, <a color='#ff9900'>Bravo Foxtrot Company Staff</a><br /><br />";

 
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
