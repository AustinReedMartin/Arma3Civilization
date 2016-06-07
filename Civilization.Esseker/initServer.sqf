[8,true,true,19] execFSM "custom\time\timeModule.fsm";


//Side Fixes for AI (Untested, but should work)
EAST setFriend [EAST, 1];
EAST setFriend [CIVILIAN, 1];
CIVILIAN setFriend [EAST, 1];
// EAST setFriend [RESISTANCE, 0];

if (isServer) then {
	execVM "custom\initPostS.sqf";
};