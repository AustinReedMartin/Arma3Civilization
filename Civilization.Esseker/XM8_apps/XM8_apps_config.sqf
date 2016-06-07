/*
	Improved XM8 apps by vitaly'mind'chizhikov
	Official forum thread: 
	Original idea by Shix.
*/

/*
Example
XM8_apps_app1 = [
	"Deploy Bike", //Text displayed on app button
	"deployBike\bikeIcon.paa", //Icon displayd on app button
	{execVM "deployBike\deploy_bike.sqf";}, //Script executed when app button pressed
	FALSE, //FALSE if this is legacy app. TRUE if this app is compatible with Improved XM8 apps.
	"" //Empty string ("") for legacy apps. Path to scripts init file for applications, compatible with Improved XM8 apps
];
XM8_apps_app2 = [
	"Example app",
	"XM8_apps\apps\XM8_exampleApp\icons\exampleIcon.paa",
	{["exampleSlide_1", 0] call ExileClient_gui_xm8_slide},
	TRUE,
	"XM8_apps\apps\XM8_exampleApp\scripts\XM8_exampleApp_init.sqf"
];
Comment out apps, that you dont use.
If you dont have icon, use default one "XM8_apps\icons\generic_app.paa"
Always use full path from mission root folder
*/

XM8_apps_app1 = [
	"Rules",
	"\exile_assets\texture\ui\xm8_app_cosa_nostra_ca.paa",
	{execVM "XM8_apps\apps\Rules\rules.sqf"},
	false,
	""
];
XM8_apps_app2 = [
	"View Distance",
	(getText (configFile >> "CfgWeapons" >> "Binocular" >> "picture")),
	{execVM "XM8_apps\apps\View\ViewDistance.sqf"},
	false, //Leave this to false for legacy (old) app
	"" //Leave this to empty for legacy (old) app
];
XM8_apps_app3 = [
	"BrArmaRecipe",
	"XM8_apps\apps\BRAmaRecipes\BRAma.paa",
	{execVM "XM8_apps\apps\BRAmaRecipes\init.sqf"},
	false,
	""
];
XM8_apps_app4 = [
	"Exile Security",
	"XM8_apps\apps\ExileSecurity\Images\ExileSecurity.paa",
	{[] spawn ExileSecurity_Territory},
	false,
	""
];
XM8_apps_app5 = [
	"Player Stats",
	"XM8_apps\apps\PlayerStats\Stats_IconWhite.paa",
	{execVM "XM8_apps\apps\PlayerStats\PlayerStats.sqf"},
	false,
	""
];
XM8_apps_app6 = [
	"Useful Information",
	"XM8_apps\apps\Info\info.paa",
	{execVM "XM8_apps\apps\Info\info.sqf"},
	false,
	""
];
/*XM8_apps_app6 = [
	"Repair Mate",
	"XM8_apps\apps\XM8_repairMate\icons\repairMate_icon.paa", //FULL PATH FROM MISSION ROOT
	{call XM8_repairMate_checkNearByVehicles},
	true,
	"XM8_apps\apps\XM8_repairMate\scripts\XM8_repairMate_init.sqf" //FULL PATH FROM MISSION ROOT
];*/
//Dont change whats below :)
XM8_apps_folderPath = _this;