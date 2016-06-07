   [] execVM "intro\intro.sqf";

	[] execVM "AVS\AVS_fnc_init.sqf";
	[] execVM "XM8_apps\apps\ExileSecurity\init.sqf";	
	
	
if (!isDedicated && hasInterface) then {
	[] execVM "addons\ZCP.sqf";								// zcp notification
	call compileFinal preprocessFileLineNumbers "addons\statusBar\statusbar.sqf"; //Status Bar
	execVM "voiceControl.sqf"; 								// voice canal camp
	[] execVM "custom\KillMessages.sqf";					// Kill Messages By GR8
}; 

[] execVM "Custom\EnigmaRevive\init.sqf";					//revive
NETmonkey_fnc_Hidebody = compileFinal preprocessFileLineNumbers "addons\Hide\HideBody.sqf"; //hide body

// Extended Repairs
JohnO_fnc_repairWheels = compileFinal preprocessFileLineNumbers "Custom\ExtendedRepairs\JohnO_fnc_repairWheels.sqf"; JohnO_fnc_repairchopper = compileFinal preprocessFileLineNumbers "Custom\ExtendedRepairs\JohnO_fnc_repairchopper.sqf"; JohnO_fnc_repairchopperhalf = compileFinal preprocessFileLineNumbers "Custom\ExtendedRepairs\JohnO_fnc_repairchopperhalf.sqf"; JohnO_fnc_vehicleRepairCar = compile preprocessFileLineNumbers "Custom\ExtendedRepairs\JohnO_fnc_vehicleRepairCar.sqf";

// Salvage Wheels
Onefox_fnc_salvageWheels = compileFinal preprocessFileLineNumbers "Custom\SalvageWheel\Onefox_fnc_salvageWheels.sqf";

// Salvage Metal
Kuplion_fnc_salvageMetal = compileFinal preprocessFileLineNumbers "Custom\SalvageMetal\Kuplion_fnc_salvageMetal.sqf";

// bAdmin Exile by Biabock

#define DEBUG false

[DEBUG] call compile preprocessFileLineNumbers "badmin\globalCompile.sqf";

if (!isDedicated) then
{
	if (hasInterface) then // Normal player
	{
		execVM "badmin\client\init.sqf";
	}
};

if (isServer) then
{
	diag_log "bAdmin - Initializing";
	[] execVM "badmin\server\init.sqf";
};

OPEN_bADMIN_FNC = {
	switch (_this) do {
		//Key U
		case 22: {
			nul = [] execVM "badmin\client\systems\adminPanel\checkAdmin.sqf";
		};
	};
};

(createTrigger ["EmptyDetector", [0,0,0]]) setTriggerStatements
[
    "!triggerActivated thisTrigger", 
    "thisTrigger setTriggerTimeout [5,5,5,false]",
    "{if (markerShape _x == 'POLYLINE') then {deleteMarker _x}} forEach allMapMarkers"
];

waituntil {!isnull (finddisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call OPEN_bADMIN_FNC;false;"];

call ExileClient_system_map_initialize;
/*
* Added by [TWC] jayman. Simple whitlisting check if a player can play as blufor. Simply add 
* their playerUID to the _whitelisted array. This is not intended to be permanent.
*/
if(side player == west) then{
	_whiteListed = ["_SP_PLAYER_"];
	if((getPlayerUID player) in _whiteListed) then{
		hint "You are whiteListed to play as Blufor PeaceKeepers";
	}else{
		["End1", false, 0] call BIS_fnc_endMission
	};
};
