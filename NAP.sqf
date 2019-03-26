/* NATO Platoon Attack
Platoon in wedge, squads in wedge, the infantry platoon attacks a known objective, with intent to secure it.

To do:
- Patrol withdraws to friendly territory if defeated.
*/

If (!isserver) exitwith {};
Params ["_trigger"];
_trigger spawn {
	_Base = (getmarkerpos "NCSG");
//	_Rally = (_this getpos [2200, (_this getdir _Base) -60 + round random 120]);
	_Rally = (_this getpos [2200, (_this getdir _Base)]);
	_G1 = [_Rally, WEST, ["B_Soldier_SL_F","B_Soldier_M_F","B_soldier_LAT_F","B_Soldier_TL_F","B_Soldier_TL_F","B_soldier_AR_F","B_soldier_AR_F","B_Soldier_F","B_Soldier_F"],[],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[],[],[],180] call BIS_fnc_spawnGroup;
	Sleep 1;
	_G2 = [_Rally, WEST, ["B_Soldier_SL_F","B_Soldier_F","B_soldier_LAT2_F","B_Soldier_TL_F","B_Soldier_TL_F","B_soldier_AR_F","B_soldier_AR_F","B_Soldier_F","B_Soldier_F"],[],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[],[],[],180] call BIS_fnc_spawnGroup;
	Sleep 1;
	_G3 = [_Rally, WEST, ["B_Soldier_SL_F","B_Soldier_F","B_soldier_LAT2_F","B_Soldier_TL_F","B_Soldier_TL_F","B_soldier_AR_F","B_soldier_AR_F","B_Soldier_F","B_Soldier_F"],[],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[],[],[],180] call BIS_fnc_spawnGroup;
	Sleep 1;
	_G4 = [_Rally, WEST, ["B_Soldier_TL_F","B_HeavyGunner_F","B_soldier_AT_F","B_soldier_AA_F"],[],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"],[],[],[],180] call BIS_fnc_spawnGroup;
	Sleep 1;
	_G5 = [_Rally, WEST, ["B_Soldier_TL_F","B_soldier_AA_F","B_HeavyGunner_F","B_soldier_AT_F"],[],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"],[],[],[],180] call BIS_fnc_spawnGroup;
	Sleep 1;
	_G6 = [_Rally, WEST, ["B_Soldier_F","B_medic_F","B_Soldier_F","B_Soldier_F","B_Soldier_SL_F"],[],["LIEUTENANT","PRIVATE","SERGEANT","PRIVATE","SERGEANT"],[],[],[],180] call BIS_fnc_spawnGroup;
	Sleep 1;

	_L1 = leader _G1;

	_G1 addwaypoint [_this getpos [-1200, (getpos _L1 getdir _this)], 0];

	Sleep 5;

	_G4 copywaypoints _G1;
	_G5 copywaypoints _G1;
	_G6 copywaypoints _G1;

	Sleep 5;

	_G2 copywaypoints _G1;
	_G3 copywaypoints _G1;

	Sleep 5;

	{
		Private _waypoint = _x;
		Private _wpposition = waypointposition _waypoint;
		_wpposition = _wpposition getpos [100, (getdir _L1) + 240];
		_waypoint setWPPos _wpposition;
	} foreach waypoints _G4;

	{
		Private _waypoint = _x;
		Private _wpposition = waypointposition _waypoint;
		_wpposition = _wpposition getpos [100, (getdir _L1) + 120];
		_waypoint setwppos _wpposition;
	} foreach waypoints _G5;

	{
		Private _waypoint = _x;
		Private _wpposition = waypointposition _waypoint;
		_wpposition = _wpposition getpos [50, (getdir _L1) + 180];
		_waypoint setWPPos _wpposition;
	} foreach waypoints _G6;

	{
		Private _waypoint = _x;
		Private _wpposition = waypointposition _waypoint;
		_wpposition = _wpposition getpos [200, (getdir _L1) + 240];
		_waypoint setWPPos _wpposition;
	} foreach waypoints _G2;

	{
		Private _waypoint = _x;
		Private _wpposition = waypointposition _waypoint;
		_wpposition = _wpposition getpos [200, (getdir _L1) + 120];
		_waypoint setwppos _wpposition;
	} foreach waypoints _G3;

	_G1 addwaypoint [_this getpos [50, (getpos _L1 getdir _this)], 0];

	_G4 copywaypoints _G1;
	_G5 copywaypoints _G1;
	_G6 copywaypoints _G1;
	_G2 copywaypoints _G1;
	_G3 copywaypoints _G1;

	{
		Private _waypoint = _x;
		Private _wpposition = waypointposition _waypoint;
		_wpposition = _wpposition getpos [100, (getdir _L1) + 260];
		_waypoint setWPPos _wpposition;
	} foreach waypoints _G4;

	{
		Private _waypoint = _x;
		Private _wpposition = waypointposition _waypoint;
		_wpposition = _wpposition getpos [100, (getdir _L1) + 100];
		_waypoint setwppos _wpposition;
	} foreach waypoints _G5;

	{
		Private _waypoint = _x;
		Private _wpposition = waypointposition _waypoint;
		_wpposition = _wpposition getpos [50, (getdir _L1) + 180];
		_waypoint setWPPos _wpposition;
	} foreach waypoints _G6;

	{
		Private _waypoint = _x;
		Private _wpposition = waypointposition _waypoint;
		_wpposition = _wpposition getpos [200, (getdir _L1) + 260];
		_waypoint setWPPos _wpposition;
	} foreach waypoints _G2;

	{
		Private _waypoint = _x;
		Private _wpposition = waypointposition _waypoint;
		_wpposition = _wpposition getpos [200, (getdir _L1) + 100];
		_waypoint setwppos _wpposition;
	} foreach waypoints _G3;
};