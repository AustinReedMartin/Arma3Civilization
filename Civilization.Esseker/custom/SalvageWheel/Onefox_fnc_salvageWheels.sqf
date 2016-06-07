/**
 * License: WTFPL
 */
 
private["_canAdd","_workingWheels", "_vehicle","_equippedMagazines","_wheels","_wheelToSalvage"];
_vehicle = _this select 0;

if (vehicle player isEqualTo _vehicle) exitWith 
{
	["RepairFailedWarning", ["Are you serious?"]] call ExileClient_gui_notification_event_addNotification;
};


_wheels = ["HitLF2Wheel","HitLFWheel","HitRFWheel","HitRF2Wheel"];
_workingWheels = [];
{
	if ((_vehicle getHitPointDamage _x) < 0.5) then
	{	
		_damage = _vehicle getHitPointDamage _x;
		_workingWheels = _workingWheels + [_x];
	};
} forEach _wheels;


if (_workingWheels isEqualTo []) exitWith
{
	["RepairFailedWarning", ["The wheels are too damaged!"]] call ExileClient_gui_notification_event_addNotification;
};


_canAdd = [player,"Exile_Item_CarWheel"] call ExileClient_util_playerCargo_canAdd;

_wheelToSalvage = _workingWheels select 0;

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
	if (!(_canAdd)) then
	{
		["InventoryFullWarning"] call ExileClient_gui_notification_event_addNotification;
		sleep 0.7;
	};
	
	if (ExilePlayerInSafezone) then {
		["RepairFailedWarning", ["Please leave the safezone first."]] call ExileClient_gui_notification_event_addNotification;
	};


	if (("Exile_Item_Foolbox" in _equippedMagazines) && ("Exile_Item_Wrench" in _equippedMagazines) && (_canAdd) && (!(ExilePlayerInSafezone))) then {
			player playMove "AinvPknlMstpSnonWnonDr_medic3";
			sleep 10;
			_vehicle setHitPointDamage [_wheelToSalvage,1];
			player addItem "Exile_Item_CarWheel";
			["Success",["You have salvaged a wheel!"]] call ExileClient_gui_notification_event_addNotification;
	};
	if (("Exile_Item_Foolbox" in _equippedMagazines) && ("Exile_Item_Wrench" in _equippedMagazines) && (!(_canAdd)) && (!(ExilePlayerInSafezone))) then {
			player playMove "AinvPknlMstpSnonWnonDr_medic3";
			sleep 10;
			_vehicle setHitPointDamage [_wheelToSalvage,1];
			_holder = createVehicle ["GroundWeaponHolder", getPosATL player, [], 0, "CAN_COLLIDE"];
			_holder addItemCargoGlobal ["Exile_Item_CarWheel",1];
			["Success",["You have salvaged a wheel!"]] call ExileClient_gui_notification_event_addNotification;
	};
	
	};
};
true
