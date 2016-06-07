
	_announceText = [
				"TIPS : You can revive players with a defibrilator",
				"TIPS : Don't forget to pay your territoy every 14 days",
				"TIPS : Territory disapears after 2 weeks if not paid",
				"TIPS : Vehicles disapear after 1 week if not used",
				"TIPS : Vehicles unlock if in safezone after restart",
				"TIPS : Missions now give new weapons",
				"TIPS : NVG will not spawn. You can Buy them",
				"TIPS : Loadouts based on respect",
				"TIPS : Active admins and Update weekly",
				"TIPS : Thermal scope can be obtain on mission",
				"TIPS : 2 hours day / 1 hour fullmoon night",
				"TIPS : Restart every 6H, start at midnight.",
				"TIPS : Don't forget to register on the forums"
				];
				


while {true} do {
	sleep 600;
	_Text = _announceText call BIS_fnc_selectRandom;
	systemChat _Text;
};