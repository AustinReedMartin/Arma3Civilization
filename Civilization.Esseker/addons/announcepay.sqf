_playerUID = getPlayerUID player;
        {
            _flag = _x;
            _buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
            if (_playerUID in _buildRights) then
            {
			_nextDueDate = _flag getVariable ["ExileTerritoryMaintenanceDue", [0, 0, 0, 0, 0]];
			_name = _flag getVariable ["ExileTerritoryName", ""];
			_dueDate = format 
			[
				"%2/%3/%1",
				_nextDueDate select 0,
				_nextDueDate select 1,
				_nextDueDate select 2
			];
			 ["RestartWarning", format["%2 Due: %1",_dueDate,_name]] call ExileClient_gui_notification_event_addNotification;
            };
        }
        forEach (allMissionObjects "Exile_Construction_Flag_Static");