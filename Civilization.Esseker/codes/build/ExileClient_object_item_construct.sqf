/**
 * ExileClient_object_item_construct
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_itemClassName","_minimumDistanceToTraderZones","_minimumDistanceToSpawnZones","_maximumNumberOfTerritoriesPerPlayer","_numberOfTerritories"];
_itemClassName = _this select 0;
_cnt = count nearestLocations [getPosATL player, ["NameVillage","NameCity","NameCityCapital"], 500];
		
		/* PREVENT BUILDING NEAR CERTAIN TYPES OF BUILDING */
		_cantBuildNear = [
			"Land_GH_MainBuilding_entry_F",
			"Land_House_Block_C1",
			"Land_Church_03",
			"Land_A_Stationhouse_ep1",
			"Land_Dome_Big_F",
			"Land_Dome_Small_F",
			"Land_Barracks_ruins_F",
			"Land_i_Barracks_V1_F",
			"Land_i_Barracks_V1_dam_F",
			"Land_i_Barracks_V2_F",
			"Land_i_Barracks_V2_dam_F",
			"Land_u_Barracks_V2_F",
			"Land_Hospital_main_F",
			"Land_Hospital_side1_F",
			"Land_Hospital_side2_F",
			"Land_MilOffices_V1_F",
			"Land_TentHangar_V1_F",
			"Land_Hangar_F",
			"Land_Airport_Tower_F",
			"Land_Cargo_House_V1_F",
			"Land_Cargo_House_V3_F",
			"Land_Cargo_HQ_V1_F",
			"Land_Cargo_HQ_V2_F",
			"Land_Cargo_HQ_V3_F",
			"Land_Cargo_Patrol_V1_F",
			"Land_Cargo_Patrol_V2_F",
			"Land_Cargo_Tower_V1_F",
			"Land_Cargo_Tower_V1_No1_F",
			"Land_Cargo_Tower_V1_No2_F",
			"Land_Cargo_Tower_V1_No3_F",
			"Land_Cargo_Tower_V1_No4_F",
			"Land_Cargo_Tower_V1_No5_F",
			"Land_Cargo_Tower_V1_No6_F",
			"Land_Cargo_Tower_V1_No7_F",
			"Land_Cargo_Tower_V2_F",
			"Land_Cargo_Tower_V3_F",
			"Land_Radar_F"
		];
		_cantBuildDist = 600;
		
		
if( isClass(configFile >> "CfgMagazines" >> _itemClassName >> "Interactions" >> "Constructing") ) then
{
	if (findDisplay 602 != displayNull) then
	{
		(findDisplay 602) closeDisplay 2; 
	};
	try 
	{
		if !((vehicle player) isEqualTo player) then
		{
			throw "ConstructionVehicleWarning";  
		};
		_minimumDistanceToTraderZones = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToTraderZones");
		if ([getPosATL player, _minimumDistanceToTraderZones] call ExileClient_util_world_isTraderZoneInRange) then
		{
			throw "ConstructionTraderZoneWarning";
		};
		_minimumDistanceToSpawnZones = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToSpawnZones");
		if ([getPosATL player, _minimumDistanceToSpawnZones] call ExileClient_util_world_isSpawnZoneInRange) then
		{
			throw "ConstructionSpawnZoneWarning";
		};	
		//Stops Building In Towns
		if (_cnt > 0 ) then {
			_Reason = "You are too near a town"; 
			throw "ConstructionAbortedInformation";
		};

		if ({typeOf _x in _cantBuildNear} count nearestObjects[player, _cantBuildNear, _cantBuildDist] > 0) then {
			_Reason = "You are too near military buildings" ; 
			throw "ConstructionAbortedInformation";
		};

		
		/* PREVENT BUILDING NEAR ROADS */
		_NearRoad = (position player) nearRoads 15;
		_TooNearRoads = _NearRoad select 0;
		if (!isNil "_TooNearRoads") then 
		{ 
			_Reason = "You are too near a road"; 
			throw "ConstructionAbortedInformation"; 		
		}; 
		
		if(_itemClassName isEqualTo "Exile_Item_Flag") then 
		{ 
			_maximumNumberOfTerritoriesPerPlayer = getNumber (missionConfigFile >> "CfgTerritories" >> "maximumNumberOfTerritoriesPerPlayer");
			_numberOfTerritories = player call ExileClient_util_territory_getNumberOfTerritories;
			if (_numberOfTerritories >= _maximumNumberOfTerritoriesPerPlayer) then
			{
				throw "MaximumNumberOfTerritoriesReached";
			};
			call ExileClient_gui_setupTerritoryDialog_show;
		}
		else 
		{
			[_itemClassName] call ExileClient_construction_beginNewObject;
		};
	}
	catch 
	{
			if(_exception isEqualTo "ConstructionAbortedInformation")then{
				[_exception,"Building Permit Denied"] call ExileClient_gui_notification_event_addNotification;
			}else{
				[_exception] call ExileClient_gui_notification_event_addNotification;
			};
	};
};
true