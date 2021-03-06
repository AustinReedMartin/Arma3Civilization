/**
 * ExileClient_object_player_stats_updateTemperature
 *
 * Exile Mod
 * www.exilemod.com
 * � 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_timeElapsed","_forcedBodyTemperatureChangePerMinute","_wetnessChangePerMinute","_altitude","_isSwimming","_bodyTemperature","_bodyWetness","_temperatureConfig","_fromDayTimeTemperature","_toDayTimeTemperature","_environmentTemperature","_isFireNearby","_startPosition","_endPosition","_intersections","_isBelowRoof","_clothingColdProtection","_movementInfluence","_regulation","_environmentInfluence"];
_timeElapsed = _this;
_forcedBodyTemperatureChangePerMinute = 0;
_wetnessChangePerMinute = -0.1;
_altitude = ((getPosASL player) select 2) max 0;
_isSwimming = (_altitude < 0.1) || (underwater player);
_bodyTemperature = ExileClientPlayerAttributes select 5;
_bodyWetness = ExileClientPlayerAttributes select 6;
_temperatureConfig = missionConfigFile >> "CfgExileEnvironment" >> worldName >> "Temperature";
_fromDayTimeTemperature = (getArray (_temperatureConfig >> "daytimeTemperature")) select (date select 3);
_toDayTimeTemperature = (getArray (_temperatureConfig >> "daytimeTemperature")) select ((date select 3) + 1); 
_environmentTemperature = [_fromDayTimeTemperature, _toDayTimeTemperature, (date select 4) / 60] call ExileClient_util_math_lerp;
_environmentTemperature = _environmentTemperature + overcast * (getNumber (_temperatureConfig >> "overcast"));
_environmentTemperature = _environmentTemperature + rain * (getNumber (_temperatureConfig >> "rain"));
_environmentTemperature = _environmentTemperature + windStr * (getNumber (_temperatureConfig >> "wind"));
_environmentTemperature = _environmentTemperature + _altitude / 100 * (getNumber (_temperatureConfig >> "altitude"));
if (_isSwimming) then 
{
	_environmentTemperature = _environmentTemperature + (getNumber (_temperatureConfig >> "water"));
};
ExileClientEnvironmentTemperature = _environmentTemperature;
if !((vehicle player) isEqualTo player) then 
{
	if (isEngineOn (vehicle player)) then 
	{
		_forcedBodyTemperatureChangePerMinute = 0.5; 
		_wetnessChangePerMinute = -0.5; 
	}
	else 
	{
		_forcedBodyTemperatureChangePerMinute = 0.1; 
		_wetnessChangePerMinute = -0.2; 
	};
}
else 
{
	if (_isSwimming) then 
	{
		_wetnessChangePerMinute = 99999; 
	}
	else 
	{
		_isFireNearby = [ASLtoAGL (getPosASL player), 5] call ExileClient_util_world_isFireInRange;
		if (_isFireNearby) then 
		{
			_forcedBodyTemperatureChangePerMinute = 1; 
			_wetnessChangePerMinute = -0.5; 
		}
		else 
		{
			if (rain > 0.1) then 
			{
				_startPosition = getPosASL player;
				_endPosition = [_startPosition select 0, _startPosition select 1, (_startPosition select 2 ) + 10];
				_intersections = lineIntersectsSurfaces [_startPosition, _endPosition, player, objNull, false, 1, "GEOM", "VIEW"];
				_isBelowRoof = !(_intersections isEqualTo []);
				if !(_isBelowRoof) then 
				{
					_wetnessChangePerMinute = rain; 
				};
			};
		};
	};
};
_bodyWetness = ((_bodyWetness + _wetnessChangePerMinute / 60 * _timeElapsed) max 0) min 1;
if (ExileClientEnvironmentTemperature > 25) then 
{
	_forcedBodyTemperatureChangePerMinute = 0.5; 
};
if (_forcedBodyTemperatureChangePerMinute > 0) then 
{
	_bodyTemperature = _bodyTemperature + _forcedBodyTemperatureChangePerMinute / 60 *_timeElapsed;
}
else 
{
	// JohnO custom
	// Follow the same format and put different clothing / headgear types inside the relevent categories
	_veryWarmClothing = ["U_B_GhillieSuit","U_B_FullGhillie_lsh","U_B_FullGhillie_sard","U_B_FullGhillie_ard","U_O_FullGhillie_lsh","U_I_FullGhillie_ard","U_IG_Guerilla3_1","U_IG_Guerilla3_2","U_BG_Guerrilla_6_1","U_BG_Guerilla3_1","U_BG_leader","U_IG_leader","U_B_HeliPilotCoveralls","U_B_PilotCoveralls","U_I_HeliPilotCoveralls","U_I_pilotCoveralls","U_O_PilotCoveralls"];
	_midlyWarmClothing = ["Exile_Uniform_Woodland","U_O_SpecopsUniform_ocamo","U_O_SpecopsUniform_blk","U_B_SpecopsUniform_sgg","U_O_OfficerUniform_ocamo","U_O_CombatUniform_oucamo","U_O_CombatUniform_ocamo","U_I_OfficerUniform","U_I_CombatUniform","U_B_CTRG_3","U_B_CTRG_1","U_B_CombatUniform_mcam_worn","U_B_CombatUniform_mcam_vest","U_B_CombatUniform_mcam"];

	_veryWarmHeadGear = ["H_ShemagOpen_tan","H_ShemagOpen_khk","H_Shemag_tan","H_Shemag_olive_hs","H_Shemag_olive","H_Shemag_khk"];
	_midlyWarmHeadGear = ["H_Watchcap_blk","H_Watchcap_camo","H_Watchcap_khk","H_Watchcap_sgg"];

	_clothingColdProtection = 0;

	if !((uniform player) isEqualTo "") then 
	{
		_clothingColdProtection = _clothingColdProtection + 0.05; //Original : 0.25
		

		if ((uniform player) in _midlyWarmClothing) then
		{
			_clothingColdProtection = _clothingColdProtection + 0.10; //15
			
		}
		else
		{
			if ((uniform player) in _veryWarmClothing) then
			{
				_clothingColdProtection = _clothingColdProtection + 0.30; // 35
				
			};	
		};	

	};
	if !((headgear player) isEqualTo "") then 
	{
		_clothingColdProtection = _clothingColdProtection + 0.01; //Original : 0.05
		

		if ((headgear player) in _midlyWarmHeadGear) then
		{	
			_clothingColdProtection = _clothingColdProtection + 0.07; //8
			
		}
		else
		{	
			if ((headgear player) in _veryWarmHeadGear) then
			{
				_clothingColdProtection = _clothingColdProtection + 0.15; // 16
				
			};
		};		

	};
	if !((vest player) isEqualTo "") then 
	{
		_clothingColdProtection = _clothingColdProtection + 0.10; //Original : 0.10
		
	};		

	_clothingColdProtection = ((_clothingColdProtection * (1 - (_bodyWetness * 0.5))) max 0) min 1;
	_movementInfluence = 0;
	if ((getPos player) select 2 < 0.1) then 
	{
		_movementInfluence = (37 - _bodyTemperature) * (1 - (_bodyWetness * 0.5)) * 0.075 * (vectorMagnitude (velocity player))/6.4;
	};
	if (_bodyTemperature < 37) then 
	{
		_regulation = 0.1;
	}
	else 
	{
		_regulation = -0.1; 
	};
	_environmentInfluence = (1 - _clothingColdProtection) * (-0.2 + 0.008 * ExileClientEnvironmentTemperature);
	_bodyTemperature = _bodyTemperature + (_regulation + _movementInfluence + _environmentInfluence) / 60 *_timeElapsed;
};
_bodyTemperature = _bodyTemperature min 37;

// Added camera shaking when under 36 degrees C, increased intensity of shake under 35 (when you are taking damage)

if (_bodyTemperature < 35) then 
{
	player setDamage ((damage player) + 0.1/60*_timeElapsed);
};
ExileClientPlayerAttributes set [6, _bodyWetness];
ExileClientPlayerAttributes set [5, _bodyTemperature];