["Initialize"] call BIS_fnc_dynamicGroups;

private _objectiveMarkers = allMapMarkers select { ["sector_", _x] call BIS_fnc_inString };

private _objectiveMarkersHandle = [_objectiveMarkers] spawn {
    params [
        ["_markers", [], [[""]]]
    ];

    while {true} do {
        {
            private _marker = _x;
            private _pos = getMarkerPos _marker;
            private _east = [];
            private _west = [];

            {
                if (side _x == west) then {
                    _west pushBack _x;
                };
                if (side _x == east) then {
                    _east pushBack _x;
                };
            } forEach (allUnits select { _x distance2d _pos <= 200 });

            private _countWest = count _west;
            private _countEast = count _east;
            if (_countWest > 0 && {_countEast == 0}) then {
                /*private _newMarker = _marker + "_nato";

                if (isNil getMarkerType _newMarker) then {
                    createMarker [_newMarker, _pos];
                };*/
                if (markerShape _marker != "ICON") then {
                    _marker setMarkerShape "ICON";
                };
                if (markerType _marker != "flag_NATO") then {
                    _marker setMarkerType "flag_NATO";
                };
            };
            if (_countEast > 0 && {_countWest == 0}) then {
                if (markerShape _marker != "ICON") then {
                    _marker setMarkerShape "ICON";
                };
                if (markerType _marker != "flag_CSAT") then {
                    _marker setMarkerType "flag_CSAT";
                };
            };
            if (_countWest > 0 && _countEast > 0) then {
                if (markerShape _marker != "ICON") then {
                    _marker setMarkerShape "ICON";
                };
                if (markerType _marker != "EMPTY") then {
                    _marker setMarkerType "Empty";
                };
            };
        } forEach _markers;

        sleep 5;
    };
};
