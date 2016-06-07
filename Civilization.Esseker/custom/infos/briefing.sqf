uiSleep 10;
if (!hasInterface) exitWith {};

waitUntil {!isNil "ExileClientLoadedIn"};
 // Waits for Exile to finish up

player createDiarySubject ["rules", "Server Rules"];
player createDiarySubject ["website", "Website"];
player createDiarySubject ["Server", "Server"];
player createDiarySubject ["credits", "Credits"];
player createDiarySubject ["infos", "Useful Info"];
player createDiarySubject ["infos2", "Loadouts"];
player createDiarySubject ["infos3", "Coming Soon"];

    player createDiaryRecord ["Server",
            [
                "Dev Road Map",
                                "
                                <br/>
                                <br/>----- Changelog -----
                                <br/>Version : 0.20.10
                                <br/>
                                <br/>
                                <br/>
                                <br/> Informations updated
                                <br/> New zombies implanted
                                <br/>  ----------------------
                                <br/> Revive implanted
                                <br/> Creepy fog implanted for night
                                <br/> Spawned vehicles get items inside
                                <br/> Adding random spawn
                                <br/>  ----------------------
                                <br/> Back to 3h restart
                                <br/> Add some improvements
                                <br/> Changing hosting hardware
                                <br/> Fix the death loop at spawn
                                <br/>  ----------------------
                                <br/> Update Exile in 0.9.41
                                <br/>  ----------------------
                                <br/> Implanted hordes and new missions
                                <br/> Reducing restart to 2h, prevent crash
                                <br/> Removed TRYK causing bug
                                <br/>  ----------------------
                                <br/> Reactivate desactivated function from exile 0.9.4 update
                                <br/> Removed load cargo script
                                <br/> Restarts back to 4h
                                <br/> ----------------------
                                <br/> Adding some stuffs and weapons
                                <br/> Rework Prices and some vehicles added
                                <br/> Changing some scripts
                                <br/> Missions now run with Headless client
                                <br/> ----------------------
                                <br/> Hordes in town now
                                <br/> New Missions system
                                <br/> ----------------------
                                <br/> Restarts come back to 3h
                                <br/> ----------------------
                                <br/> Reducing Maximum players to 50
                                <br/> New Donation Box implanted
                                <br/> ----------------------
                                <br/> Change zombies spawn method
                                <br/> IgiLoad Implanted
                                <br/> ----------------------
                                <br/> weapon Desactivate for all heli
                                <br/> Adding New GhostHawk
                                <br/> ----------------------
                                <br/> Changed Loot spawns
                                <br/> Changed zombies spawns
                                <br/> Add a lot of items to traders
                                <br/> Changed some price
                                <br/> ----------------------
                                <br/> Refull/Repair/Rearm At fuelpump
                                <br/> Add New Armed Vehicles
                                <br/> ----------------------
                                <br/>Add pics on screen load
                                <br/>Add some hats to traders
                                <br/>Remove IgiLoad
                                <br/>Add MAS Loots
                                <br/> ----------------------
                                <br/>Doors Problems fixed
                                <br/>Lags Problems fixed
                                <br/>Restart all 4h now
                                <br/> ----------------------
                                <br/>New tips message
                                <br/>Implant silver donator status
                                <br/>Implant gold donator status
                                <br/>Update DMS mission
                                <br/> ----------------------
                                <br/>Augmented loot spawn
                                <br/>More Vehicles on restart
                                <br/>Zombies Loot and give respect on death
                                <br/> ----------------------
								<br/>Donation Box Implanted
                                <br/>Restriction for base building implanted
								<br/> ----------------------
								<br/>Fullmoon in Night implanted
								<br/>Custom Loadouts Implanted
                                <br/>TRYK's Multi-Play Uniforms Implanted
								<br/>SF Nato and Russion Spetsnaz Weapons Implanted
								<br/>SF Nato and Russion Spetsnaz Vehicules Implanted
								<br/>  ----------------------
								<br/>  ----  BIG UPDATE  ----
								<br/>  ----------------------
                                <br/>New zombies spawns settings
                                <br/>Vehicles in safezones unlock at restarts
                                <br/>Day/Night cylce (2h/1h) Working now
                                <br/>Teamspeak Started
                                <br/>Add improvements
                                <br/>Server installed in 0.9.35 Exile mod
                                <br/>  ----------------------
								<br/>  ----  Working ON  ----
								<br/>  ----------------------
                                <br/>   Mas weapons on AI missions
                                <br/>   Problems with zombies
                                <br/>  ----------------------
                                <br/>  ----------------------
                                "
            ]

];

    player createDiaryRecord ["Server",
            [
                "Donate",
                                "
                                <br/>
                                <br/> 
                                <br/> 
                                "
            ]

];

    player createDiaryRecord ["Server Rules",
            [
                "In maintenance",
                                "
                                <br/>
                                <br/>
                                <br/>
                                "
            ]

];

    player createDiaryRecord ["website",
            [
                "Informations",
                                "
                                <br/>
                               <br/> Website : 
                                <br/> 
                                <br/> http://www.bravofoxtrotcompany.com/
                                <br/>
                                "
            ]

];

    player createDiaryRecord ["infos",
            [
                "In maintenance",
                                "
                                <br/>
                                <br/>
                                <br/>
                                "
            ]

];

    player createDiaryRecord ["infos",
            [
                "Base building",
                                "
                                <br/> 
                                <br/> recasting of base building
                                <br/>
                                <br/> Base protection : 14 days
                                <br/>
                                <br/> Items now limited by flag level
                                <br/>
                                <br/>
                                <br/> You cannot build your flag 750m around a town 
                                <br/> and 500m around a military station.
                                <br/>
                                <br/> 
                                <br/>
                                "
            ]

];

    player createDiaryRecord ["credits",
    [
                "Credits",
                                "
                                <br/> Enhancements by Dr.Khyz:
                                "
    ]

];

    player createDiaryRecord ["infos2",
    [
                "Loadouts",
                                "
                                <br/> Loadouts are now based on your respect by bearing :
                                <br/> 
                                <br/> 0 to 5k
                                <br/> 5k to 10k
                                <br/> 10k to 20k
                                <br/> 20k to 30k
                                <br/> 30k to 40k
                                <br/> 40k to 50k
                                <br/> 50k +
                                <br/> 
                                <br/> Bearing will add you stuff, gun, and new skins when starting.
                                <br/> 
                                <br/> 
								"
    ]
    
];

    player createDiaryRecord ["infos3",
    [
                "Coming Soon",
                                "
                                <br/> Coming Soon.
                                
                                "
    ]
    
];