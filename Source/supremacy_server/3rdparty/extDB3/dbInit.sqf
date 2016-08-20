/*
    File: initDB.sqf
    Author:

    Description:
    Initializes extDB, loads Protocol + options if any + Locks extDB

    Parameters:
        0: STRING Database name, within the [], in extdb-conf.ini
        1: STRING Protocol to enable, SQL_CUSTOM for SPMC.
        2: STRING Optional Protocol Options i.e db_conf name for DB_CUSTOM
*/

private["_database","_protocol","_sql_file","_result","_random_number","_extDB_SQL_CUSTOM_ID"];

_database = [_this,0,"",[""]] call BIS_fnc_param;
_protocol = [_this,1,"",[""]] call BIS_fnc_param;
_sql_file = [_this,2,"",[""]] call BIS_fnc_param;

if ( isNil {uiNamespace getVariable "extDB_SQL_CUSTOM_ID"}) then
{
    // extDB Version
    _result = "extDB3" callExtension "9:VERSION";

    if (debugMode) then {
        diag_log format ["extDB3: Version: %1", _result];
    };
    
    if(_result == "") exitWith {
        if (debugMode) then {
            diag_log "extDB3: Failed to Load";
        };
    };

    // extDB Connect to Database
    _result = call compile ("extDB3" callExtension format["9:ADD_DATABASE:%1", _database]);
    if (_result select 0 isEqualTo 0) exitWith {
        if (debugMode) then {
            diag_log format ["extDB3: Error Database: %1", _result];
        };
    };

    if (debugMode) then {
        diag_log "extDB3: Connected to Database";
    };

    // Generate Randomized Protocol Name
    _random_number = round(random(999999));
    _extDB_SQL_CUSTOM_ID = str(_random_number);
    extDB_SQL_CUSTOM_ID = compileFinal _extDB_SQL_CUSTOM_ID;

    // extDB Load Protocol
    _result = call compile ("extDB3" callExtension format["9:ADD_DATABASE_PROTOCOL:%1:%2:%3:%4", _database, _protocol, _extDB_SQL_CUSTOM_ID, _sql_file]);
    if ((_result select 0) isEqualTo 0) exitWith {
        if (debugMode) then {
            diag_log format ["extDB3: Error Database Setup: %1", _result];
        };
    };
    
    if (debugMode) then {
        diag_log format ["extDB3: Initalized %1 Protocol", _protocol];
    };
    // extDB3 Lock
    "extDB3" callExtension "9:LOCK";
    if (debugMode) then {
        diag_log "extDB3: Locked";
    };

    // Save Randomized ID
    uiNamespace setVariable ["extDB_SQL_CUSTOM_ID", _extDB_SQL_CUSTOM_ID];
}
else
{
    extDB_SQL_CUSTOM_ID = compileFinal str(uiNamespace getVariable "extDB_SQL_CUSTOM_ID");
    if (debugMode) then {
        diag_log "extDB3: Already Setup";
    };
};