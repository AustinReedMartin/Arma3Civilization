class CfgExileCustomCode 
{
	ExileServer_system_rcon_setupEvents = "codes\ExileServer_system_rcon_setupEvents.sqf"; // restart adjust
	
	ExileServer_object_vehicle_network_unlockVehicleRequest = "codes\ExileServer_object_vehicle_network_unlockVehicleRequest.sqf"; // godmode off
	
	exileclient_gui_xm8_thread_update = "codes\exileclient_gui_xm8_thread_update.sqf"; //  xm8 custom
	
	ExileServer_object_player_network_createPlayerRequest = "codes\loadouts\ExileServer_object_player_network_createPlayerRequest.sqf"; //loadouts
	ExileClient_object_player_bambiStateBegin = "codes\loadouts\ExileClient_object_player_bambiStateBegin.sqf";		//announce respect needed
	
	ExileServer_world_spawnVehicles = "codes\ExileServer_world_spawnVehicles.sqf";		//vehicles spawns outside map fix
	ExileClient_object_item_construct = "codes\build\ExileClient_object_item_construct.sqf";		//restricted aera

	ExileServer_object_vehicle_database_load = "codes\ExileServer_object_vehicle_database_load.sqf"; //godmode

	
	//Extra Logging files Player + Vehicle + Container history log
	ExileServer_object_player_event_onMpKilled = "Logging\ExileServer_object_player_event_onMpKilled.sqf";
	ExileServer_object_vehicle_event_onMPKilled = "Logging\ExileServer_object_vehicle_event_onMPKilled.sqf";
	ExileServer_object_container_event_onMPKilled = "Logging\ExileServer_object_container_event_onMPKilled.sqf";
	ExileServer_system_trading_network_sellItemRequest = "Logging\ExileServer_system_trading_network_sellItemRequest.sqf";
	//ExileServer_system_trading_network_purchaseVehicleRequest = "Logging\ExileServer_system_trading_network_purchaseVehicleRequest.sqf";
	ExileServer_system_trading_network_purchaseItemRequest = "Logging\ExileServer_system_trading_network_purchaseItemRequest.sqf";
	ExileServer_object_construction_database_delete = "Logging\ExileServer_object_construction_database_delete.sqf";
	ExileServer_system_trading_network_sendMoneyRequest = "Logging\ExileServer_system_trading_network_sendMoneyRequest.sqf";
	
	
	ExileClient_object_player_thread_safeZone = 			"SecureSafezones\GG_safeZone.sqf";
    ExileClient_object_player_event_onEnterSafezone = 		"SecureSafezones\GG_onEnterSafezone.sqf";
    ExileClient_object_player_event_onLeaveSafezone = 		"SecureSafezones\GG_onLeaveSafezone.sqf";
    ExileServer_system_trading_network_wasteDumpRequest = 	"SecureSafezones\GG_wasteDumpRequest.sqf";
    ExileClient_object_player_event_onInventoryOpened = 	"SecureSafezones\GG_onInventoryOpened.sqf";
	
	ExileClient_gui_map_event_onDraw = "codes\map\ExileClient_gui_map_event_onDraw.sqf"; //on map gps
	
	ExileClient_util_gear_getCompatibleWeaponItems  =  "codes\fix\ExileClient_util_gear_getCompatibleWeaponItems.sqf";  //scope list
	ExileClient_util_item_getCompatibleWeaponItems  =  "codes\fix\ExileClient_util_item_getCompatibleWeaponItems.sqf";  //scope list
	

	//revive system
	ExileClient_object_player_death_startBleedingOut = "custom\EnigmaRevive\ExileClient_object_player_death_startBleedingOut.sqf"; //Happys Revive
    
	//XM8APP
	
	ExileClient_gui_xm8_show = "XM8_apps\scripts\ExileClient_gui_xm8_show.sqf";
	ExileClient_gui_xm8_slide_apps_onOpen = "XM8_apps\scripts\ExileClient_gui_xm8_slide_apps_onOpen.sqf";
	ExileClient_gui_xm8_slide = "XM8_apps\scripts\ExileClient_gui_xm8_slide.sqf";
	
	//Trader Spawn locations
	ExileServer_system_trading_network_purchaseVehicleRequest = "codes\ExileServer_system_trading_network_purchaseVehicleRequest.sqf";
	
	//Custom Temperature
	ExileClient_object_player_stats_updateTemperature = "codes\ExileClient_object_player_stats_updateTemperature.sqf";
	
		//Darkness
	//ExileClient_system_process_postInit = "codes\ExileClient_system_process_postInit.sqf";
	
	//Attach Chemlights
	ExileClient_object_player_initialize = "codes\ExileClient_object_player_initialize.sqf";
		
};