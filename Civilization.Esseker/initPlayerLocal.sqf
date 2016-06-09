/*
* Edited by [TWC] jayman.
* Made traders work in SP and removed vehicles and SP traders
*/
///////////////////////////////////////////////////////////////////////////////
// Static Objects
///////////////////////////////////////////////////////////////////////////////
#include "initServer.sqf"
 
#include "logo\logo.sqf"
"" execVM "XM8_apps\scripts\XM8_apps_init.sqf";
[] execVM "SecureSafezones\config.sqf";

//if (!hasInterface || isServer) exitWith {};
//Edited by jayman so it works in the editor:
if (!hasInterface || isDedicated) exitWith {};
 
///////////////////////////////////////////////////////////////////////////
// Petlov Hardware Trader
///////////////////////////////////////////////////////////////////////////
_workBench = "Land_Workbench_01_F" createVehicleLocal [0,0,0];
_workBench setDir 45.4546;
_workBench setPosATL [3670.9,3106.48,0.118195];

_trader =
[
    "Exile_Trader_Hardware",
    "WhiteHead_17",
    ["InBaseMoves_sitHighUp1"],
    [0, 0, -0.5],
    162.727,
    _workBench
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Hardware"];

///////////////////////////////////////////////////////////////////////////
// Petlov Fast Food Trader
///////////////////////////////////////////////////////////////////////////
_cashDesk = "Land_CashDesk_F" createVehicleLocal [0,0,0];
_cashDesk setDir 131.818;
_cashDesk setPosATL [3698.43,3084.23,0.118195];

_microwave = "Land_Microwave_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _microwave;         
_microwave disableCollisionWith _cashDesk; 
_microwave attachTo [_cashDesk, [-0.6, 0.2, 1.1]];

_ketchup = "Land_Ketchup_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _ketchup;         
_ketchup disableCollisionWith _cashDesk; 
_ketchup attachTo [_cashDesk, [-0.6, 0, 1.1]];

_mustard = "Land_Mustard_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _mustard;         
_mustard disableCollisionWith _cashDesk; 
_mustard attachTo [_cashDesk, [-0.5, -0.05, 1.1]];

{private _object = createVehicle [_x select 0,[0,0,0],[],0,'CAN_COLLIDE'];if (surfaceIsWater (_x select 1)) then [{_object setPosASL (_x select 1)},{_object setPosATL (_x select 1)}];_object setVectorDirAndUp (_x select 2)} forEach [["Land_cargo_addon02_V1_F",[3698.42,3084.84,0.999939],[[-0.777757,0.628565,0],[0,0,1]]],["Exile_Sign_Food_Small",[3699.66,3085.61,-0.200012],[[0.802963,-0.596029,0],[0,0,1]]]];

_trader =
[
    "Exile_Trader_Food",
    "GreekHead_A3_01",
    ["InBaseMoves_table1"],
    [0.1, 0.5, 0.2],
    238.636,
    _cashDesk
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Food"];

///////////////////////////////////////////////////////////////////////////
// Petlov Armory Trader
///////////////////////////////////////////////////////////////////////////
_chair = "Land_CampingChair_V2_F" createVehicleLocal [0,0,0];
_chair setDir 259.812;    
_chair setPosATL [3660.02,3099.33,-0.000244141];
{private _object = createVehicle [_x select 0,[0,0,0],[],0,'CAN_COLLIDE'];if (surfaceIsWater (_x select 1)) then [{_object setPosASL (_x select 1)},{_object setPosATL (_x select 1)}];_object setVectorDirAndUp (_x select 2)} forEach [["Exile_Sign_Armory_Small",[3658.79,3100.52,0],[[-0.998421,-0.0561695,0],[0,0,1]]],["CUP_A2_covering_hut_big_ep1",[3659.72,3099.57,0.00466919],[[0.0250979,-0.997709,-0.062823],[0.0515974,-0.0614662,0.996775]]]];

_trader =
[
    "Exile_Trader_Armory",
    "PersianHead_A3_02",
    ["InBaseMoves_SittingRifle1"],
    [0, -0.15, -0.45],
    259.812,
    _chair
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Armory"];

///////////////////////////////////////////////////////////////////////////
// Petlov Equipment Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Equipment",
    "WhiteHead_19",
    ["InBaseMoves_Lean1"],
    [3699.52,3095.43,0],
    238.636
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Equipment"];
/*
///////////////////////////////////////////////////////////////////////////
// Petlov Specops Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_SpecialOperations",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [3654.85,3077.34,0],
    91.401
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_SpecialOperations"];
*/
///////////////////////////////////////////////////////////////////////////
// Petlov Office Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Office",
    "GreekHead_A3_04",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [3654.15,3085.86,0],
    86.495
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Office"];

///////////////////////////////////////////////////////////////////////////
// Petlov Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [3654.03,3107.15,0],
    95.102
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_WasteDump"];
/*
///////////////////////////////////////////////////////////////////////////
// Petlov Aircraft Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Aircraft",
    "WhiteHead_17",
    ["LHD_krajPaluby"],
    [3694.59,3110.95,0],
    200.952
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Aircraft"];

///////////////////////////////////////////////////////////////////////////
// Petlov Aircraft Customs Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_AircraftCustoms",
    "GreekHead_A3_07",
    ["HubStandingUC_idle1", "HubStandingUC_idle2", "HubStandingUC_idle3", "HubStandingUC_move1", "HubStandingUC_move2"],
    [3686.23,3109.69,0],
    187.198
]
call ExileClient_object_trader_create;


///////////////////////////////////////////////////////////////////////////
//Petlov Vehicle Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [3652,3080.32,0],
    96.582
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Vehicle"];


///////////////////////////////////////////////////////////////////////////
// Petlov Vehicle Customs Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_VehicleCustoms",
    "WhiteHead_11",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [3653.03,3088.48,0],
    84.266
]
call ExileClient_object_trader_create;


*/
///////////////////////////////////////////////////////////////////////////
// Es Petrol Office Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Office",
    "GreekHead_A3_04",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [3969.72,9299.18,0.420807],141.364
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Office"];

///////////////////////////////////////////////////////////////////////////
// Es Petrol Hardware Trader
///////////////////////////////////////////////////////////////////////////
_workBench = "Land_Workbench_01_F" createVehicleLocal [0,0,0];
_workBench setDir 132.727;
_workBench setPosATL [3927.36,9299.22,0.236069];

_trader =
[
    "Exile_Trader_Hardware",
    "WhiteHead_17",
    ["InBaseMoves_sitHighUp1"],
    [0, 0, -0.5],
    132.727,
    _workBench
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Hardware"];
/*
///////////////////////////////////////////////////////////////////////////
// Es Petrol Specops Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_SpecialOperations",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [3939.15,9312.72,0.236069],132.727
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_SpecialOperations"];

///////////////////////////////////////////////////////////////////////////
//Es Petrol Vehicle Customs Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_VehicleCustoms",
    "WhiteHead_11",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [3973.56,9255.6,0],202.273
]
call ExileClient_object_trader_create;


///////////////////////////////////////////////////////////////////////////
// Es Petrol Aircraft Customs Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_AircraftCustoms",
    "GreekHead_A3_07",
    ["HubStandingUC_idle1", "HubStandingUC_idle2", "HubStandingUC_idle3", "HubStandingUC_move1", "HubStandingUC_move2"],
    [3923.65,9231.71,0],16.8182
]
call ExileClient_object_trader_create;


///////////////////////////////////////////////////////////////////////////
// Es Petrol Aircraft Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Aircraft",
    "WhiteHead_17",
    ["LHD_krajPaluby"],
    [3913.66,9238.3,0.169693],27.2728
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Aircraft"];

///////////////////////////////////////////////////////////////////////////
// Es Petrol Vehicle Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["InBaseMoves_repairVehicleKnl", "InBaseMoves_repairVehiclePne"],
    [3969.09,9286.46,0.312027],36.016
]
call ExileClient_object_trader_create;


_trader setVariable ["ExileTraderType", "Exile_Trader_Vehicle"];
*/
///////////////////////////////////////////////////////////////////////////
// Es Petrol Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [3927.9,9259.93,0.409836],114.091
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_WasteDump"];

///////////////////////////////////////////////////////////////////////////
// Es Petrol Fast Food Trader
///////////////////////////////////////////////////////////////////////////
_cashDesk = "Land_CashDesk_F" createVehicleLocal [0,0,0];
_cashDesk setDir 313.748;
_cashDesk setPosATL [3962.08,9309.81,0.287003];

_microwave = "Land_Microwave_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _microwave;         
_microwave disableCollisionWith _cashDesk; 
_microwave attachTo [_cashDesk, [-0.6, 0.2, 1.1]];

_ketchup = "Land_Ketchup_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _ketchup;         
_ketchup disableCollisionWith _cashDesk; 
_ketchup attachTo [_cashDesk, [-0.6, 0, 1.1]];

_mustard = "Land_Mustard_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _mustard;         
_mustard disableCollisionWith _cashDesk; 
_mustard attachTo [_cashDesk, [-0.5, -0.05, 1.1]];

_trader = 
[
    "Exile_Trader_Food",
    "GreekHead_A3_01",
    ["InBaseMoves_table1"],
    [0.1, 0.5, 0.2],
    170,
    _cashDesk
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Food"];

///////////////////////////////////////////////////////////////////////////
// Es Petrol Equipment Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Equipment",
    "WhiteHead_19",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [3981.66,9279.51,0.154358],202.273
]
call ExileClient_object_trader_create;


_trader setVariable ["ExileTraderType", "Exile_Trader_Equipment"];

///////////////////////////////////////////////////////////////////////////
// Es Petrol Armory Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Armory",
    "PersianHead_A3_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [3917.78,9290.38,0.186356],101.364
]
call ExileClient_object_trader_create;


_trader setVariable ["ExileTraderType", "Exile_Trader_Armory"];

///////////////////////////////////////////////////////////////////////////
// Fast Food Trader
// Mill Traderzone
///////////////////////////////////////////////////////////////////////////
_cashDesk = "Land_CashDesk_F" createVehicleLocal [0,0,0];
_cashDesk setDir 274.100;
_cashDesk setPosATL [9054.75,7886.07,0.785385];

_microwave = "Land_Microwave_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _microwave;         
_microwave disableCollisionWith _cashDesk; 
_microwave attachTo [_cashDesk, [-0.6, 0.2, 1.1]];

_ketchup = "Land_Ketchup_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _ketchup;         
_ketchup disableCollisionWith _cashDesk; 
_ketchup attachTo [_cashDesk, [-0.6, 0, 1.1]];

_mustard = "Land_Mustard_01_F" createVehicleLocal [0,0,0];
_cashDesk disableCollisionWith _mustard;         
_mustard disableCollisionWith _cashDesk; 
_mustard attachTo [_cashDesk, [-0.5, -0.05, 1.1]];

_trader = 
[
    "Exile_Trader_Food",
    "GreekHead_A3_01",
    ["InBaseMoves_table1"],
    [0.1, 0.5, 0.2],
    170,
    _cashDesk
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Food"];

///////////////////////////////////////////////////////////////////////////
// Armory Trader
// Mill Traderzone
///////////////////////////////////////////////////////////////////////////
_chair = "Land_CampingChair_V2_F" createVehicleLocal [0,0,0];
_chair setDir 314.871;
_chair setPosATL [9056.92,7923.34,0];

_trader = 
[
    "Exile_Trader_Armory",
    "PersianHead_A3_02",
    ["InBaseMoves_SittingRifle1"],
    [0, -0.15, -0.45],
    180,
    _chair
]  call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Armory"];

///////////////////////////////////////////////////////////////////////////
// Office Trader
// Mill Traderzone
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Office",
    "GreekHead_A3_04",
    ["HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"],
    [9078.67,7882.18,0.194016],
    308.234
]
call ExileClient_object_trader_create;
/*
///////////////////////////////////////////////////////////////////////////
// Vehicle Trader
// Mill Traderzone
///////////////////////////////////////////////////////////////////////////

_trader =
[
    "Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["InBaseMoves_repairVehicleKnl", "InBaseMoves_repairVehiclePne"],
    [9001.35,7920.15,1.38602],
    17.4267
]
call ExileClient_object_trader_create;



_trader setVariable ["ExileTraderType", "Exile_Trader_Vehicle"];

///////////////////////////////////////////////////////////////////////////
// Vehicle Customs Trader
// Mill Traderzone
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_VehicleCustoms",
    "WhiteHead_11",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [8994.98,7913.78,1.34],
    88.670
]
call ExileClient_object_trader_create;
*/
///////////////////////////////////////////////////////////////////////////
// Waste Dump Trader
// Mill Traderzone
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [9083.3,7913.51,0],
    171.145
]
call ExileClient_object_trader_create;
/*
///////////////////////////////////////////////////////////////////////////
// Specops Trader
// Mill Traderzone
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_SpecialOperations",
    "AfricanHead_02",
    ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"],
    [9071.85,7925.63,0.137772],
    187.613
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_SpecialOperations"];
*/
///////////////////////////////////////////////////////////////////////////
// Equipment Trader
// Mill Traderzone
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Equipment",
    "WhiteHead_19",
    ["InBaseMoves_Lean1"],
    [9046.11,7861.12,0.869476],
    296.407
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Equipment"];
///////////////////////////////////////////////////////////////////////////
// Hardware Trader
// Mill Traderzone
///////////////////////////////////////////////////////////////////////////
_workBench = "Land_Workbench_01_F" createVehicleLocal [0,0,0];
_workBench setDir 356.659;
_workBench setPosATL [9025.06,7869.41,0.51001];

_trader = 
[
    "Exile_Trader_Hardware",
    "WhiteHead_17",
    ["InBaseMoves_sitHighUp1"],
    [0, 0, -0.5],
    170,
    _workBench
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Hardware"];
/*
///////////////////////////////////////////////////////////////////////////
// Aircraft Trader
// Mill Traderzone
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Aircraft",
    "WhiteHead_17",
    ["LHD_krajPaluby"],
    [8970.84,7906.38,0],
    178.399
]
call ExileClient_object_trader_create;

_trader setVariable ["ExileTraderType", "Exile_Trader_Aircraft"];

///////////////////////////////////////////////////////////////////////////
// Aircraft Customs Trader
// Mill Traderzone
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_AircraftCustoms",
    "GreekHead_A3_07",
    ["HubStandingUC_idle1", "HubStandingUC_idle2", "HubStandingUC_idle3", "HubStandingUC_move1", "HubStandingUC_move2"],
    [8942.24,7891.71,0],
    92.671
]
call ExileClient_object_trader_create;
*/
execVM "custom\initPostC.sqf";