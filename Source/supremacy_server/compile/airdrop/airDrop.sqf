/**
 * airDrop.sqf
 * Original script by Killzone_Kid
 */
private ["_class","_para","_paras","_p","_veh","_vel","_time","_pos"];
_class = "B_Parachute_02_F";

_para = createVehicle [_class, [0,0,0], [], 0, "FLY"];
_para setDir getDir _this;
_para setPos getPos _this;
_paras =  [_para];
_this attachTo [_para, [0,0,0]];

("SmokeShellRed" createVehicle [0,0,0]) attachTo [_para, [0,2,0]];
("SmokeShellOrange" createVehicle [0,0,0]) attachTo [_para, [0,2,0]];

{
    _p = createVehicle [_class, [0,0,0], [], 0, "FLY"];
    _paras set [count _paras, _p];
    _p attachTo [_para, [0,0,0]];
    _p setVectorUp _x;
} count [
    [0.5,0.4,0.6],[-0.5,0.4,0.6],[0.5,-0.4,0.6],[-0.5,-0.4,0.6]
];
0 = [_this, _paras] spawn {
    _veh = _this select 0;

    if(last_air_drop_marker != "") then {
        deleteMarker last_air_drop_marker;
    };

    last_air_drop_marker = createMarker [format["airdrop_%1%2",(getPos _veh) select 0, (getPos _veh) select 1],(getPos _veh)];
    last_air_drop_marker setmarkerColor "ColorUNKNOWN";
    last_air_drop_marker setMarkerShape "ELLIPSE";
    last_air_drop_marker setMarkerBrush "Solid";
    last_air_drop_marker setMarkerSize [350, 350];

    while {getPos _veh select 2 > 100} do {
        last_air_drop_marker setMarkerPos (getPos _veh);
        sleep 1;
    };

    waitUntil {getPos _veh select 2 < 4};

    _vel = velocity _veh;
    detach _veh;
    _veh setVelocity _vel;
    missionNamespace setVariable ["#FX", [_veh, _vel select 2]];
    publicVariable "#FX";
    for "_i" from 1 to 5 do {
        playSound3D [
            "a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss",
            _veh
        ];
        sleep 0.09
    };
    {
        detach _x;
        _x disableCollisionWith _veh;   
    } count (_this select 1);
    _time = time + 5;
    waitUntil {time > _time};
    {
        if (!isNull _x) then {deleteVehicle _x};
    } count (_this select 1);

    _veh setVariable["airdrop",FALSE, true];

    for "_i" from 1 to 5 do {
        createvehicle["SmokeShellPurple", (getPosATL _veh), [], 0, "NONE"];
        createvehicle["SmokeShellBlue", (getPosATL _veh), [], 0, "NONE"];
        sleep 50
    };
};