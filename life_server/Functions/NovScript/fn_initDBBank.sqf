/*
	file : fn_initDBBank.sqf
	author : Novax

	github : https://github.com/Novax69 <== Find my other scripts for arma here

	Date : 18/01/2022
*/

private["_query","_queryResult"];

_query = "SELECT bankBLUFOR FROM bankfaction WHERE id='1'";
_queryResult = [_query,2] call DB_fnc_asyncCall;
blufor_cash = _queryResult select 0;
publicVariable "blufor_cash";

_query = "SELECT bankINDE FROM bankfaction WHERE id='1'";
_queryResult = [_query,2] call DB_fnc_asyncCall;
inde_cash = _queryResult select 0;
publicVariable "inde_cash";

diag_log "================ Novax Faction Bank Script ================";
diag_log format ["BLUFOR = %1",blufor_cash];
diag_log format ["INDEPENDENT = %1", inde_cash];
diag_log "================ Novax Faction Bank Script ================";