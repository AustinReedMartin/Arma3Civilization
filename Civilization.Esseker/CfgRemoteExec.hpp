class CfgRemoteExec
{
	class Functions
	{
		mode = 1;
		jip = 0;
		class ExileServer_system_network_dispatchIncomingMessage { allowedTargets=2; };
		class AVS_fnc_rearmVehicle                               { allowedTargets=2; };
		class ExileSecurity_AlarmLights 						 { allowedTargets=1; };
		class AdminToolkit_network_receiveRequest 				 { allowedTargets = 2; };
	};
	class Commands
	{
		mode=0;
		jip=0;
	};
};