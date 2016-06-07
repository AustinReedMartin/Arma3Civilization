/**
 * License: WTFPL
 * Wheel Salvage Script by Onefox. Modified by kuplion 24/05/16
 */
 
private["_canAdd","_workingMetalParts", "_vehicle","_equippedMagazines","_metalParts","_metalToSalvage"];
_vehicle = _this select 0;

if (vehicle player isEqualTo _vehicle) exitWith 
{
	["RepairFailedWarning", ["Are you serious?"]] call ExileClient_gui_notification_event_addNotification;
};


_metalParts = ["HitBody","HitFuel","HitEngine"];
_workingMetalParts = [];
{
	if ((_vehicle getHitPointDamage _x) < 0.5) then
	{	
		_damage = _vehicle getHitPointDamage _x;
		_workingMetalParts = _workingMetalParts + [_x];
	};
} forEach _metalParts;


if (_workingMetalParts isEqualTo []) exitWith
{
	["RepairFailedWarning", ["The vehicle is too damaged!"]] call ExileClient_gui_notification_event_addNotification;
};


_canAdd = [player,"Exile_Item_JunkMetal"] call ExileClient_util_playerCargo_canAdd;

_metalToSalvage = _workingMetalParts select 0;

if (!local _vehicle) then
{
	["RepairFailedWarning", ["Please get in as driver first."]] call ExileClient_gui_notification_event_addNotification;
}
else 
{

	if (ExilePlayerInSafezone) then {
		["RepairFailedWarning", ["Please leave the safezone first."]] call ExileClient_gui_notification_event_addNotification;
	}
	
	else
	
	{
	
	_equippedMagazines = magazines player;
	if (!("Exile_Item_Foolbox" in _equippedMagazines)) then
	{
		["RepairFailedWarning", ["You need a toolbox."]] call ExileClient_gui_notification_event_addNotification;
		sleep 0.7;
	};
	if (!("Exile_Item_Wrench" in _equippedMagazines)) then
	{
		["RepairFailedWarning", ["You need a wrench."]] call ExileClient_gui_notification_event_addNotification;
		sleep 0.7;
	};
	if (!("Exile_Item_Grinder" in _equippedMagazines)) then
	{
		["RepairFailedWarning", ["You need a grinder."]] call ExileClient_gui_notification_event_addNotification;
		sleep 0.7;
	};
	if (!(_canAdd)) then
	{
		["InventoryFullWarning"] call ExileClient_gui_notification_event_addNotification;
		sleep 0.7;
	};
	
	if (ExilePlayerInSafezone) then {
		["RepairFailedWarning", ["Please leave the safezone first."]] call ExileClient_gui_notification_event_addNotification;
	};


	if (("Exile_Item_Foolbox" in _equippedMagazines) && ("Exile_Item_Wrench" in _equippedMagazines) && ("Exile_Item_Grinder" in _equippedMagazines) && (_canAdd) && (!(ExilePlayerInSafezone))) then {
			player playMove "AinvPknlMstpSnonWnonDr_medic3";
			sleep 10;
			_vehicle setHitPointDamage [_metalToSalvage,0.9];
			player addItem "Exile_Item_JunkMetal";
			["Success",["You have salvaged some metal!"]] call ExileClient_gui_notification_event_addNotification;
	};
	if (("Exile_Item_Foolbox" in _equippedMagazines) && ("Exile_Item_Wrench" in _equippedMagazines) && ("Exile_Item_Grinder" in _equippedMagazines) && (!(_canAdd)) && (!(ExilePlayerInSafezone))) then {
			player playMove "AinvPknlMstpSnonWnonDr_medic3";
			sleep 10;
			_vehicle setHitPointDamage [_metalToSalvage,0.9];
			_holder = createVehicle ["GroundWeaponHolder", getPosATL player, [], 0, "CAN_COLLIDE"];
			_holder addItemCargoGlobal ["Exile_Item_JunkMetal",1];
			["Success",["You have salvaged some metal!"]] call ExileClient_gui_notification_event_addNotification;
	};
	
	};
};
true
