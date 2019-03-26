/* NATO Garrison Force
An over strength platoon is dispatched to hold an objective.
*/

If (!isServer) exitwith {};
Params ["_trigger"];
_trigger spawn {
	_Rally = (getpos _this);
	_G1 = [_Rally, WEST, ["B_Soldier_SL_F","B_Soldier_M_F","B_soldier_LAT_F","B_Soldier_TL_F","B_Soldier_TL_F","B_soldier_AR_F","B_soldier_AR_F","B_Soldier_F","B_Soldier_F"],[],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[],[],[],180] call BIS_fnc_spawnGroup;
	Sleep 1;
	_G2 = [_Rally, WEST, ["B_Soldier_SL_F","B_Soldier_F","B_soldier_LAT2_F","B_Soldier_TL_F","B_Soldier_TL_F","B_soldier_AR_F","B_soldier_AR_F","B_Soldier_F","B_Soldier_F"],[],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[],[],[],180] call BIS_fnc_spawnGroup;
	Sleep 1;
	_G3 = [_Rally, WEST, ["B_Soldier_SL_F","B_Soldier_F","B_soldier_LAT2_F","B_Soldier_TL_F","B_Soldier_TL_F","B_soldier_AR_F","B_soldier_AR_F","B_Soldier_F","B_Soldier_F"],[],["SERGEANT","PRIVATE","PRIVATE","CORPORAL","CORPORAL","PRIVATE","PRIVATE","PRIVATE","PRIVATE"],[],[],[],180] call BIS_fnc_spawnGroup;
	Sleep 1;
	_G4 = [_Rally, WEST, ["B_Soldier_TL_F","B_soldier_AA_F","B_soldier_AT_F","B_HeavyGunner_F"],[],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"],[],[],[],180] call BIS_fnc_spawnGroup;
	Sleep 1;
	_G5 = [_Rally, WEST, ["B_Soldier_TL_F","B_soldier_AA_F","B_soldier_AT_F","B_HeavyGunner_F"],[],["CORPORAL","PRIVATE","PRIVATE","PRIVATE"],[],[],[],180] call BIS_fnc_spawnGroup;
	Sleep 1;
	_G6 = [_Rally, WEST, ["B_Soldier_F","B_medic_F","B_Soldier_F","B_Soldier_F","B_Soldier_SL_F"],[],["LIEUTENANT","PRIVATE","SERGEANT","PRIVATE","SERGEANT"],[],[],[],180] call BIS_fnc_spawnGroup;
	Sleep 1;

	_L1 = leader _G1;
	_L2 = leader _G2;
	_L3 = leader _G3;
	_L4 = leader _G4;
	_L5 = leader _G5;
	_PL = leader _G6;
	Sleep 1;
	/*
	{
		{
			_x execvm "Gear\AAF.sqf";
		} foreach units _x;
		_x setformation "LINE";
		_x setspeedmode "LIMITED";
		_x enabledynamicsimulation true;
	} foreach [_G1, _G2, _G3, _G4, _G5, _G6];
	*/
	Sleep 1;

	_G1 addwaypoint [_PL getpos [80, (getdir _PL) + 060], 5];
	_G4 addwaypoint [_PL getpos [80, (getdir _PL) + 120], 5];
	_G2 addwaypoint [_PL getpos [80, (getdir _PL) + 180], 5];
	_G5 addwaypoint [_PL getpos [80, (getdir _PL) + 240], 5];
	_G3 addwaypoint [_PL getpos [80, (getdir _PL) + 300], 5];

	Sleep 20;

	_L1 dowatch (_PL getpos [1000, (getdir _PL) + 060]);
	_L4 dowatch (_PL getpos [1000, (getdir _PL) + 120]);
	_L2 dowatch (_PL getpos [1000, (getdir _PL) + 180]);
	_L5 dowatch (_PL getpos [1000, (getdir _PL) + 240]);
	_L3 dowatch (_PL getpos [1000, (getdir _PL) + 300]);
	Sleep 1;

	_G6 addwaypoint [_PL getpos [80, (getdir _PL) + 000], 5];
	Sleep 20;

	_PL dowatch (_PL getpos [1000, (getdir _PL) + 000]);
	Sleep 1;

	{
		{
			_x setunitpos selectrandom ["Middle","Down"];
		} foreach units _x;
		_x setformation "LINE";
	} foreach [_G1, _G2, _G3, _G4, _G5, _G6];
};