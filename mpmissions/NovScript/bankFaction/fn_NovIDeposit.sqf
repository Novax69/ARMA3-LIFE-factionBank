#include "..\..\script_macros.hpp"

/*
	file : fn_NovIDeposit.sqf
	author : Novax

	github : https://github.com/Novax69 <== Find my other scripts for arma here
	Date : 18/01/2022

	Description : 
		Deposit money on independent account.
*/


private["_value"];
_value = parseNumber(ctrlText 2702);
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > CASH) exitWith {hint localize "STR_ATM_NotEnoughCash"};

CASH = CASH - _value;
INDEBANK = INDEBANK + _value;
publicVariable "inde_cash";
[1,INDEBANK] remoteExecCall ["NOVDB_fnc_updateFac",RSERV]; // A modifier correctement
["NovInfoMessage",[localize "STR_NOV_bankFac_InfoNotif","NovScript\NovTextures\wireTransfer.paa",format[(localize "STR_NOV_bankFac_DepositBudgetSuccess"),[_value] call life_fnc_numberText]]] call BIS_fnc_showNotification;
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;