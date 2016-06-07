/**
 * ExileServer_object_player_network_createPlayerRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_requestingPlayer","_spawnLocationMarkerName","_playerUID","_accountData","_bambiPlayer","_cargoType"];
_sessionID = _this select 0;
_parameters = _this select 1;
_requestingPlayer = _sessionID call ExileServer_system_session_getPlayerObject;
try
{
	if (isNull _requestingPlayer) then 
	{
		throw format ["Session %1 requested a bambi character, but doesn't have a player object. Hacker or Monday?", _sessionID];
	};
	_spawnLocationMarkerName = _parameters select 0;
	_playerUID = getPlayerUID _requestingPlayer;
	if(_playerUID isEqualTo "")then
	{
		throw format ["Player: '%1' has no player UID. Arma/Steam Sucks!.",name _requestingPlayer];
	};
	_accountData = format["getAccountStats:%1", _playerUID] call ExileServer_system_database_query_selectSingle;
	_respect = (_accountData select 1);   // get the players respect from the database
	#include "..\..\addons\donators.sqf" //donator
	_group = createGroup independent;
	_bambiPlayer = _group createUnit ["Exile_Unit_Player", [0,0,0], [], 0, "CAN_COLLIDE"];
	{


if (_playerUID in _SilverDonor) then
{
	
	// Add containers
	_bambiPlayer forceAddUniform "U_O_SpecopsUniform_ocamo";
	for "_i" from 1 to 4 do {_bambiPlayer addItemToVest "CUP_17Rnd_9x19_glock17";};
	_bambiPlayer addHeadgear "H_CrewHelmetHeli_I";
	_bambiPlayer addVest "V_TacVest_blk";
	
	// Add weapons
	_bambiPlayer addWeapon "Exile_Melee_Axe";
	_bambiPlayer addWeapon "glock17_EP1";
	_bambiPlayer addHandgunItem "Optic_MRD";
	_bambiPlayer addHandgunItem "muzzle_snds_L";
	// Add items
	_bambiPlayer linkItem "ItemMap";
	_bambiPlayer linkItem "ItemGPS";
	_bambiPlayer linkItem "ItemCompass";
	_bambiPlayer linkItem "ItemRadio";
	_bambiPlayer linkItem "Exile_Item_XM8";
	
	_bambiPlayer addItemToUniform "Exile_Item_EMRE";
	_bambiPlayer addItemToUniform "Exile_Item_PlasticBottleFreshWater";
	_bambiPlayer addItemToUniform "Exile_Item_Vishpirin";
}
else
{
	
	if (_playerUID in _GoldDonor) then
	{		

		// Add containers
		_bambiPlayer forceAddUniform "U_O_GhillieSuit";
		_bambiPlayer addVest "V_PlateCarrier1_blk";
		_bambiPlayer addBackpack "B_Carryall_ocamo";
		_bambiPlayer addHeadgear "H_Cap_usblack";
		for "_i" from 1 to 5 do {_bambiPlayer addItemToVest "CUP_17Rnd_9x19_glock17";};
		for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "Exile_Item_PlasticBottleFreshWater";};
		for "_i" from 1 to 2 do {_bambiPlayer addItemToBackpack "Exile_Item_EMRE";};
		for "_i" from 1 to 2 do {_bambiPlayer addItemToVest "Exile_Item_Vishpirin";};
		for "_i" from 1 to 3 do {_bambiPlayer addItemToVest "20Rnd_762x51_Mag";};
		for "_i" from 1 to 2 do {_bambiPlayer addItemToBackpack "RPG32_F";};
		for "_i" from 1 to 5 do {_bambiPlayer addItemToBackpack "20Rnd_762x51_Mag";};
		for "_i" from 1 to 2 do {_bambiPlayer addItemToBackpack "Exile_Item_InstaDoc";};
	
		// Add weapons
		_bambiPlayer addWeapon "srifle_EBR_MRCO_LP_BI_F";
		//_bambiPlayer addPrimaryWeaponItem "CUP_optic_Kobra";
		//_bambiPlayer addPrimaryWeaponItem "CUP_acc_Flashlight";
		//_bambiPlayer addPrimaryWeaponItem "CUP_muzzle_PBS4";
		_bambiPlayer addWeapon "CUP_hgun_Glock17";
		_bambiPlayer addHandgunItem "CUP_acc_Glock17_Flashlight";
		_bambiPlayer addHandgunItem "muzzle_snds_L";
		_bambiPlayer addHandgunItem "Optic_MRD";
		_bambiPlayer addWeapon "Laserdesignator_03";
		_bambiplayer addMagazines ["RPG32_F",1];
		_bambiPlayer addWeapon "launch_RPG32_F";
		
		// Add items
		_bambiPlayer linkItem "ItemMap";
		_bambiPlayer linkItem "ItemGPS";
		_bambiPlayer linkItem "ItemCompass";
		_bambiPlayer linkItem "ItemRadio";
		_bambiPlayer linkItem "Exile_Item_XM8";
		_bambiPlayer linkItem "NVGoggles_OPFOR";

	}
	else
	{

		switch (true) do 
		{
			case (_respect < -500 && _respect > -5000):
			{

			};	
			case (_respect > 2500 && _respect < 4999):
			{
				_bambiPlayer forceAddUniform "U_C_Poloshirt_salmon";
				
				_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
				_bambiPlayer addItem "Exile_Item_EMRE";
				_bambiPlayer linkItem "ItemMap";
				_bambiPlayer linkItem "Exile_Item_XM8";
				_bambiPlayer addItem "Chemlight_red";
				_bambiPlayer addItem "Chemlight_red";
				
			};	
			case (_respect > 5000 && _respect < 9999):
			{
				_bambiPlayer forceAddUniform "U_Rangemaster";
				_bambiPlayer addHeadgear "H_Cap_blu";
				
				_bambiPlayer addItem "Exile_Item_Matches";
				_bambiPlayer addItem "Exile_Item_EMRE";
				_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
				_bambiPlayer addMagazine "Exile_Magazine_Swing";
				_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
				_bambiPlayer linkItem "Exile_Item_XM8";
				_bambiPlayer linkItem "ItemMap";
				_bambiPlayer addItem "Chemlight_red";
				_bambiPlayer addItem "Chemlight_red";

			};
			case (_respect > 10000 && _respect < 14999):
			{
			   
				   
				 // Add containers
				_bambiPlayer forceAddUniform "U_BG_Guerilla2_2";
				_bambiPlayer addHeadgear "H_Cap_grn";
				for "_i" from 1 to 1 do {_bambiPlayer addItemToUniform "CUP_17Rnd_9x19_glock17";};
					// Add weapons
				_bambiPlayer addWeapon "Exile_Melee_Axe";
				_bambiPlayer addWeapon "CUP_hgun_Glock17";
				_bambiPlayer addHandgunItem "CUP_acc_Glock17_Flashlight";
					// Add items
				_bambiPlayer linkItem "ItemMap";
				_bambiPlayer linkItem "ItemCompass";
				_bambiPlayer addItem "Chemlight_red";
				_bambiPlayer addItem "Chemlight_red";
				
				_bambiPlayer addItem "Exile_Item_EMRE";
				_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
				_bambiPlayer linkItem "Exile_Item_XM8";
			
			};
			case (_respect > 15000 && _respect < 19999):
			{
				 // Add containers
				_bambiPlayer forceAddUniform "U_BG_Guerilla2_3";
				_bambiPlayer addHeadgear "H_Cap_blk";
				_bambiPlayer addVest "V_TacVest_oli";
				for "_i" from 1 to 2 do {_bambiPlayer addItemToVest "CUP_17Rnd_9x19_glock17";};
				
				// Add weapons
				_bambiPlayer addWeapon "Exile_Melee_Axe";
				_bambiPlayer addWeapon "CUP_hgun_Glock17";
				_bambiPlayer addHandgunItem "CUP_acc_Glock17_Flashlight";
				_bambiPlayer addHandgunItem "Optic_MRD";
					// Add items
				_bambiPlayer linkItem "ItemMap";
				_bambiPlayer linkItem "ItemCompass";
				_bambiPlayer addItem "Chemlight_red";
				_bambiPlayer addItem "Chemlight_red";
				
				_bambiPlayer addItem "Exile_Item_EMRE";
				_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
				_bambiPlayer addItem "Exile_Item_Vishpirin";
				_bambiPlayer linkItem "Exile_Item_XM8";
			};
			case (_respect > 20000 && _respect < 29999):
			{
				 // Add containers
				_bambiPlayer forceAddUniform "U_O_SpecopsUniform_ocamo";
				_bambiPlayer addHeadgear "H_Cap_blk";
				_bambiPlayer addVest "V_TacVest_oli";
				// _bambiPlayer addBackpack "B_HuntingBackpack";
				for "_i" from 1 to 3 do {_bambiPlayer addItemToVest "CUP_17Rnd_9x19_glock17";};
				
				// Add weapons
				_bambiPlayer addWeapon "Exile_Melee_Axe";
				_bambiPlayer addWeapon "CUP_hgun_Glock17";
				_bambiPlayer addHandgunItem "CUP_acc_Glock17_Flashlight";
				_bambiPlayer addHandgunItem "Optic_MRD";
					// Add items
				_bambiPlayer linkItem "ItemMap";
				_bambiPlayer linkItem "ItemGPS";
				_bambiPlayer linkItem "ItemCompass";
				_bambiPlayer addItem "Chemlight_red";
				_bambiPlayer addItem "Chemlight_red";
				
				_bambiPlayer addItem "Exile_Item_EMRE";
				_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
				_bambiPlayer addItem "Exile_Item_Vishpirin";
				_bambiPlayer linkItem "Exile_Item_XM8";
			};  
			case (_respect > 30000 && _respect < 39999):
			{
				 // Add containers
				_bambiPlayer forceAddUniform "U_O_SpecopsUniform_ocamo";
				_bambiPlayer addHeadgear "H_Cap_blk";
				_bambiPlayer addVest "V_TacVest_blk";
				// _bambiPlayer addBackpack "B_HuntingBackpack";
				for "_i" from 1 to 3 do {_bambiPlayer addItemToVest "CUP_17Rnd_9x19_glock17";};
				
				// Add weapons
				_bambiPlayer addWeapon "Exile_Melee_Axe";
				_bambiPlayer addWeapon "CUP_hgun_Glock17";
				_bambiPlayer addHandgunItem "CUP_acc_Glock17_Flashlight";
				_bambiPlayer addHandgunItem "Optic_MRD";
					// Add items
				_bambiPlayer linkItem "ItemMap";
				_bambiPlayer linkItem "ItemGPS";
				_bambiPlayer linkItem "ItemCompass";
				_bambiPlayer linkItem "ItemRadio";
				_bambiPlayer addItem "Chemlight_red";
				_bambiPlayer addItem "Chemlight_red";
				
				_bambiPlayer addItem "Exile_Item_EMRE";
				_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
				_bambiPlayer addItem "Exile_Item_Vishpirin";
				_bambiPlayer linkItem "Exile_Item_XM8";
		   };
			 case (_respect > 40000 && _respect < 59999):
			{
				 // Add containers //
				_bambiPlayer forceAddUniform "U_O_SpecopsUniform_ocamo";
				_bambiPlayer addHeadgear "H_Cap_blk";
				_bambiPlayer addVest "V_TacVest_blk";
				// _bambiPlayer addBackpack "B_HuntingBackpack";
				for "_i" from 1 to 3 do {_bambiPlayer addItemToVest "CUP_17Rnd_9x19_glock17";};
				
				// Add weapons
				_bambiPlayer addWeapon "Exile_Melee_Axe";
				_bambiPlayer addWeapon "CUP_hgun_Glock17";
				_bambiPlayer addHandgunItem "CUP_acc_Glock17_Flashlight";
				_bambiPlayer addHandgunItem "Optic_MRD";
				_bambiPlayer addHandgunItem "muzzle_snds_L";
				// Add items
				_bambiPlayer linkItem "ItemMap";
				_bambiPlayer linkItem "ItemGPS";
				_bambiPlayer linkItem "ItemCompass";
				_bambiPlayer linkItem "ItemRadio";
				_bambiPlayer addItem "Chemlight_red";
				_bambiPlayer addItem "Chemlight_red";
				
				_bambiPlayer addItem "Exile_Item_EMRE";
				_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
				_bambiPlayer addItem "Exile_Item_Vishpirin";
				_bambiPlayer linkItem "Exile_Item_XM8";
		    };
			 case (_respect > 60000 && _respect < 79999):
			{
				 // Add containers //
				_bambiPlayer forceAddUniform "U_O_SpecopsUniform_ocamo";
				_bambiPlayer addHeadgear "H_CrewHelmetHeli_I";
				_bambiPlayer addVest "V_TacVest_blk";
				// _bambiPlayer addBackpack "B_AssaultPack_dgtl";
				for "_i" from 1 to 2 do {_bambiPlayer addItemToVest "CUP_17Rnd_9x19_glock17";};
				for "_i" from 1 to 2 do {_bambiPlayer addItemToVest "CUP_30Rnd_9x19_EVO";};
				for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "Exile_Item_PlasticBottleFreshWater";};
				for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "Exile_Item_EMRE";};
				for "_i" from 1 to 2 do {_bambiPlayer addItemToVest "Exile_Item_Vishpirin";};
				
				// Add weapons
				_bambiPlayer addWeapon "Exile_Melee_Axe";
				_bambiPlayer addWeapon "CUP_hgun_Glock17";
				_bambiPlayer addHandgunItem "CUP_acc_Glock17_Flashlight";
				_bambiPlayer addHandgunItem "Optic_MRD";
				_bambiPlayer addHandgunItem "muzzle_snds_L";
				
				// Add weapons
				_bambiPlayer addWeapon "CUP_smg_EVO";
				// _bambiPlayer addPrimaryWeaponItem "CUP_optic_Kobra";
				// _bambiPlayer addPrimaryWeaponItem "CUP_acc_Flashlight";
				// _bambiPlayer addPrimaryWeaponItem "CUP_muzzle_PBS4";

				// Add items
				_bambiPlayer linkItem "ItemMap";
				_bambiPlayer linkItem "ItemGPS";
				_bambiPlayer linkItem "ItemCompass";
				_bambiPlayer linkItem "ItemRadio";
				_bambiPlayer linkItem "Exile_Item_XM8";
				_bambiPlayer addItem "Chemlight_red";
				_bambiPlayer addItem "Chemlight_red";
			};
			 case (_respect > 80000):
			{
				 // Add containers //
				_bambiPlayer forceAddUniform "U_O_SpecopsUniform_ocamo";
				_bambiPlayer addHeadgear "H_CrewHelmetHeli_I";
				_bambiPlayer addVest "V_TacVest_blk";
				// _bambiPlayer addBackpack "B_AssaultPack_dgtl";
				for "_i" from 1 to 2 do {_bambiPlayer addItemToVest "CUP_17Rnd_9x19_glock17";};
				for "_i" from 1 to 2 do {_bambiPlayer addItemToVest "CUP_30Rnd_9x19_EVO";};
				for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "Exile_Item_PlasticBottleFreshWater";};
				for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "Exile_Item_EMRE";};
				for "_i" from 1 to 2 do {_bambiPlayer addItemToVest "Exile_Item_Vishpirin";};
				
				// Add weapons
				_bambiPlayer addWeapon "Exile_Melee_Axe";
				_bambiPlayer addWeapon "CUP_hgun_Glock17";
				_bambiPlayer addHandgunItem "CUP_acc_Glock17_Flashlight";
				_bambiPlayer addHandgunItem "Optic_MRD";
				_bambiPlayer addHandgunItem "muzzle_snds_L";
				
				// Add weapons
				_bambiPlayer addWeapon "CUP_smg_EVO";
				_bambiPlayer addPrimaryWeaponItem "CUP_optic_HoloBlack";
				_bambiPlayer addPrimaryWeaponItem "acc_flashlight";
				// _bambiPlayer addPrimaryWeaponItem "CUP_muzzle_PBS4";

				// Add items
				_bambiPlayer linkItem "ItemMap";
				_bambiPlayer linkItem "ItemGPS";
				_bambiPlayer linkItem "ItemCompass";
				_bambiPlayer linkItem "ItemRadio";
				_bambiPlayer linkItem "Exile_Item_XM8";
				_bambiPlayer addItem "Chemlight_red";
				_bambiPlayer addItem "Chemlight_red";
			};
			default
			{	
			
			};
		};
		
		};
};
	
		_cargoType = _x call ExileClient_util_cargo_getType;
		switch (_cargoType) do
		{
			case 1: 	{ _bambiPlayer addItem _x; };
			case 2: 	{ _bambiPlayer addWeaponGlobal _x; };
			case 3: 	{ _bambiPlayer addBackpackGlobal _x; };
			case 4:		{ _bambiPlayer linkItem _x; };
			default 	{ _bambiPlayer addItem _x; };
		};
	}
	forEach getArray(configFile >> "CfgSettings" >> "BambiSettings" >> "loadOut");
	[_sessionID, _requestingPlayer, _spawnLocationMarkerName, _bambiPlayer, _accountData] call ExileServer_object_player_createBambi;
}
catch
{
	_exception call ExileServer_util_log;
};