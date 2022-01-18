#include "\life_server\script_macros.hpp"
/*
	file : fn_NovUpdateFac.sqf
	author : Novax

	github : https://github.com/Novax69 <== Find my other scripts for arma here

	Date : 18/01/2022
*/
private["_faction","_value","_valueForDb","_query"];

_faction = _this select 0;
_value = _this select 1;
_valueForDb = [_value] call BIS_fnc_param;
_valueForDb = [_valueForDb] call DB_fnc_numberSafe;
switch(_faction) do {
	case 0: {
		_query = format["UPDATE bankFaction SET bankBLUFOR='%1' WHERE id=1",_valueForDb];
	};
	case 1: {
		_query = format["UPDATE bankFaction SET bankINDE='%1' WHERE id=1",_valueForDb];
	};
};
if(_query isEqualTo "") exitWith {
	diag_log "ERROR NOV = Fichier fn_updateFac -- Query empty";
};
[_query,1] call DB_fnc_asyncCall;