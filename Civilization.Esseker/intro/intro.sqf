waitUntil{!isNull (findDisplay 46)};
sleep 10;

playsound "intro";

_role1 = "Welcome to (intro/intro name goes here) Exile Zombies";
_role1names = ["(intro\intro website goes here"];
_role2 = "Bugs/Suggestions:";
_role2names = ["Please report all bug/suggestions on the forums."];
_role3 = "Zombie Hint:";
_role3names = ["Take Zombies down with headshots!"];
_role4 = "Vehicle Rearm:";
_role4names = ["Look for heli pads around the map to rearm for a price"];
_onScreenTime = 6;

{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.50' color='#EC0118' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.75' color='#FFFFFF' align='right'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5);
	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],	//DEFAULT: 0.5,0.35
		[safezoneY + safezoneH - 0.8,0.7], 	//DEFAULT: 0.8,0.7
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach [
	//The list below should have exactly the same amount of roles as the list above
	[_role1, _role1names],
	[_role2, _role2names],
	[_role3, _role3names],
	[_role4, _role4names]					//make SURE the last one here does NOT have a , at the end
];