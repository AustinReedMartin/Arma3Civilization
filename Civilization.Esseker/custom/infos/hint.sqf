waitUntil {!dialog};

[] spawn {
   sleep 20;
	_att = format["[Hi %1!]",name player];
	_att hintC [
	parseText "<t align='center'>All informations are in XM8</t><br/>
	<t align='center'><t color='#cf2e4e'>You can register on forum</t></t><br/>
	<t align='center'><t color='#cf2e4e'>Website</t> : <a href='http://www.bravofoxtrotcompany.com'>www.BravoFoxtrotCompany.com</a></t><br/>"
];

hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _this spawn {
		_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];

sleep 30;
};
