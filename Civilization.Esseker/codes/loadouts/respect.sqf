
uiSleep 5;

_respect = ExileClientPlayerScore;

switch (true) do 
{
	
	case (_respect < 2500):
	{
		[parseText format["<t size='0.6'>You need to reach 2500 respect to get your first loadout.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;
	};
	
	case (_respect > 2500 && _respect < 4999):
	{
		[parseText format["<t size='0.6'>You need to reach 5000 respect for the next loadout.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;
	};
	
	case (_respect > 5000 && _respect < 9999):
	{
		[parseText format["<t size='0.6'>You need to reach 10000 respect for the next loadout.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

	};
	
	case (_respect > 10000 && _respect < 14999):
	{
		[parseText format["<t size='0.6'>You need to reach 15000 respect for the next loadout.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

	};
	
	case (_respect > 15000 && _respect < 19999):
	{
		[parseText format["<t size='0.6'>You need to reach 20000 respect for the next loadout.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

	};	
	
	case (_respect > 20000 && _respect < 29999):
	{
		[parseText format["<t size='0.6'>You need to reach 30000 respect for the next loadout.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

	};
	
	case (_respect > 30000 && _respect < 39999):
	{
		[parseText format["<t size='0.6'>You need to reach 40000 respect for the next loadout.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

	};
	
	 case (_respect > 40000 && _respect < 59999):
	{
		[parseText format["<t size='0.6'>You need to reach 60000 respect for the next loadout.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

	};	 
	
	 case (_respect > 40000 && _respect < 79999):
	{
		[parseText format["<t size='0.6'>You need to reach 80000 respect for the next loadout.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

	};
	
	case (_respect > 80000):
	{
		[parseText format["<t size='0.6'>You have reach the last loadout. Enjoy it.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;

	};

	default
	{	 
		[parseText format["<t size='0.6'>You need to reach 2,500 respect for the next loadout.</t>"],0,0,10,0] spawn bis_fnc_dynamictext;
	};
};