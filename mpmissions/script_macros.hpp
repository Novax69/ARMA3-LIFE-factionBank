// Add 
#define BLUBANK blufor_cash
#define INDEBANK inde_cash

// Add if not exist
#define NOV_PARAMS(TYPE,SETTING) TYPE(missionConfigFile >> "NovConfig" >> SETTING)
