#include "..\..\script_macros.hpp"
/*
    File: fn_atmMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens and manages the bank menu.

	Edit by Novax
	github : https://github.com/Novax69 <== Find my other scripts for arma here
	Date : 18/01/2022
	Description of edition :
		Add buttons for bankFaction.



*/
private ["_units","_type","_side"];

_side = playerSide;

if (!life_use_atm) exitWith {
    hint format [localize "STR_Shop_ATMRobbed",(LIFE_SETTINGS(getNumber,"noatm_timer"))];
};

if (!dialog) then {
    if (!(createDialog "Life_atm_management")) exitWith {};
};

disableSerialization;
_units = CONTROL(2700,2703);

lbClear _units;
CONTROL(2700,2701) ctrlSetStructuredText parseText format ["<img size='1.7' image='icons\ico_bank.paa'/> $%1<br/><img size='1.6' image='icons\ico_money.paa'/> $%2",[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];

{
    _name = _x getVariable ["realname",name _x];
    if (alive _x && (!(_name isEqualTo profileName))) then {
        switch (side _x) do {
            case west: {_type = "Cop"};
            case civilian: {_type = "Civ"};
            case independent: {_type = "EMS"};
        };
        _units lbAdd format ["%1 (%2)",_x getVariable ["realname",name _x],_type];
        _units lbSetData [(lbSize _units)-1,str(_x)];
    };
} forEach playableUnits;

lbSetCurSel [2703,0];

switch(_side) do {

    case civilian: { 
        ctrlShow[2707,false];
        ctrlShow[2708,false];
        ctrlShow[2710,false];
        ctrlShow[2711,false];
        ctrlShow[2709,false];
        if (isNil {(group player getVariable "gang_bank")}) then {
            (CONTROL(2700,2705)) ctrlEnable false;
            (CONTROL(2700,2706)) ctrlEnable false;
        };
    };
    case west : 
    {
        CONTROL(2700,2709) ctrlSetStructuredText parseText format["<img size='1.7' image='icons\ico_bank.paa'/> $%1",[BLUBANK] call life_fnc_numberText];
        ctrlShow[2705,false];
        ctrlShow[2706,false];
        ctrlShow[2710,false];
        ctrlShow[2711,false];
        if(FETCH_CONST(life_coplevel) < NOV_PARAMS(getNumber,"Nov_BankWithdrawLevelCop")) then {
            (CONTROL(2700,2708)) ctrlEnable false;
        };


    };

    case independent:
    {
        CONTROL(2700,2709) ctrlSetStructuredText parseText format["<img size='1.7' image='icons\ico_bank.paa'/> $%1",[INDEBANK] call life_fnc_numberText];
        ctrlShow[2705,false];
        ctrlShow[2706,false];
        ctrlShow[2707,false];
        ctrlShow[2708,false];
        if(FETCH_CONST(life_medicLevel) < NOV_PARAMS(getNumber,"Nov_BankWithdrawLevelInde")) then {
            (CONTROL(2700,2711)) ctrlEnable false;
        };
        //ctrlsetTex
    };


};