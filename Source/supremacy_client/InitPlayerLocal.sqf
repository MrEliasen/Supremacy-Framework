if (!isDedicated) then {
    // Initializes the player/client side Dynamic Groups framework
    ["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
};