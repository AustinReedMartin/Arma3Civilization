/**

 * FILE: exileclient_gui_xm8_thread_update.sqf
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 * 
 * Restart and player count by itsatrap / 
 */

private["_display","_leftHeader","_hours","_minutes","_8GImage","_rightHeader","_time","_onlinePlayers"];
disableSerialization;
_display 	= uiNameSpace getVariable ["RscExileXM8", displayNull];

_onlinePlayers = count (allPlayers - allMissionObjects "HeadlessClient_F");
_leftHeader = _display displayCtrl 4003;
_leftHeader ctrlSetStructuredText (parseText (format ["<t align='left'><img image='\A3\ui_f\data\gui\Rsc\RscDisplayMultiplayerSetup\disabledai_ca.paa' shadow='0'/>%2 - %1</t>", mapgridposition player, _onlinePlayers]));

_hours 		= str (date select 3);
_minutes 	= str (date select 4);
// 6*60 = 6 hours, change "6" to the number of hours you have between restarts
//_restart 	= [(round((6*60))-(serverTime)/60),"MM:SS"] call BIS_fnc_secondsToString;
if (count _minutes isEqualTo 1) then
{
  _minutes = "0" + _minutes;
};
if ((player getVariable ["ExileXM8IsOnline", false]) isEqualTo true) then
{
  _8GImage = format ["\exile_assets\texture\ui\xm8_signal_%1_ca.paa", (round (random 4)) + 1];
}
else
{
  _8GImage = "\exile_assets\texture\ui\xm8_signal_0_ca.paa";
};
_rightHeader = _display displayCtrl 4005;
_rightHeader ctrlSetStructuredText (parseText (format ["<t align='right' shadow='0'><img image='%1' shadow='0'/>%2:%3</t>", _8GImage, _hours, _minutes]));