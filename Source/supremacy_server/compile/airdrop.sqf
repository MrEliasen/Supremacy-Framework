/**
 * airdrop.sqf
 *
 * LICENSE: This file is subject to the terms and conditions defined in
 * file "LICENSE.md", which is part of this source code package.
 *
 * @package    Supremacy Framework
 * @author     Mark Eliasen <https://github.com/MrEliasen>
 * @copyright  2015 Mark Eliasen
 * @license    MIT License
 * @link       https://github.com/MrEliasen/SupremacyFramework
 */

SPMC_fnc_initAirDropTimer = compileFinal "
[] spawn {
    private [""_airdropIntval""];
    last_air_drop_marker = """";
    _airdropIntval = ([""airdrop_interval""] call SPMC_fnc_config);

    while{true} do {
        sleep (60 * _airdropIntval);
        [] call SPMC_fnc_callAirDrop;
    };
};";

SPMC_fnc_callAirDrop = compileFinal "
private[""_drop"",""_pos"",""_dropZones"",""_dropZoneArea"",""_inventory"",""_m""];

_dropZones = [];
{
    _dropZones set [count _dropZones, _x];
} foreach ([""drop_zones""] call SPMC_fnc_config);

_dropZoneArea = _dropZones call bis_fnc_selectRandom;
_pos = [_dropZoneArea,0,[]] call SHK_pos;

_drop = ""Box_NATO_AmmoVeh_F"" createVehicle [0,0,0];

[_drop] call SPMC_fnc_setupAirdropCrate;
[_drop, false] call SPMC_fnc_setupAirdropCrate;

_drop setVariable[""airdrop"",TRUE,true];

_drop setDir random 360;
_drop setPos [(_pos select 0), (_pos select 1), 500];
_drop call KK_fnc_paraDrop;

[[""TaskUpdated"",["""",""AIR DROP: New air drop incoming, check your maps!""]],""bis_fnc_showNotification"",true] spawn BIS_fnc_MP;";

KK_fnc_FX = compileFinal "
private ""_veh"";
_veh = _this select 0;
_vel = _this select 1;
for ""_i"" from 1 to 100 do {
    drop [
        [""\A3\data_f\ParticleEffects\Universal\Universal"", 16, 7, 48],
        """",
        ""Billboard"",
        0, 
        1 + random 0.5,
        [0, -2, 1.5],
        [-20 + random 40, -20 + random 40, -15 + _vel],
        1,
        0.05,
        0.04,
        0, 
        [0.5, 10 + random 20],
        [
            [0,0,0,1],
            [0,0,0,0.3],
            [1,1,1,0.1],
            [1,1,1,0.03],
            [1,1,1,0.01],
            [1,1,1,0.003],
            [1,1,1,0.001],
            [1,1,1,0]
        ],
        [1],
        0.1,
        0.1,
        "",
        "",
        _veh,
        random 360,
        true,
        0.1
    ];
};";
"#FX" addPublicVariableEventHandler { _this select 1 spawn KK_fnc_FX };

KK_fnc_paraDrop = compileFinal "
private [""_class"",""_para"",""_paras"",""_p"",""_veh"",""_vel"",""_time"",""_pos""];
_class = ""B_Parachute_02_F"";

_para = createVehicle [_class, [0,0,0], [], 0, ""FLY""];
_para setDir getDir _this;
_para setPos getPos _this;
_paras =  [_para];
_this attachTo [_para, [0,0,0]];

(""SmokeShellRed"" createVehicle [0,0,0]) attachTo [_para, [0,2,0]];
(""SmokeShellOrange"" createVehicle [0,0,0]) attachTo [_para, [0,2,0]];

{
    _p = createVehicle [_class, [0,0,0], [], 0, ""FLY""];
    _paras set [count _paras, _p];
    _p attachTo [_para, [0,0,0]];
    _p setVectorUp _x;
} count [
    [0.5,0.4,0.6],[-0.5,0.4,0.6],[0.5,-0.4,0.6],[-0.5,-0.4,0.6]
];
0 = [_this, _paras] spawn {
    _veh = _this select 0;

    if(last_air_drop_marker != """") then {
        deleteMarker last_air_drop_marker;
    };

    last_air_drop_marker = createMarker [format[""airdrop_%1%2"",(getPos _veh) select 0, (getPos _veh) select 1],(getPos _veh)];
    last_air_drop_marker setmarkerColor ""ColorUNKNOWN"";
    last_air_drop_marker setMarkerShape ""ELLIPSE"";
    last_air_drop_marker setMarkerBrush ""Solid"";
    last_air_drop_marker setMarkerSize [350, 350];

    while {getPos _veh select 2 > 100} do {
        last_air_drop_marker setMarkerPos (getPos _veh);
        sleep 1;
    };

    waitUntil {getPos _veh select 2 < 4};

    _vel = velocity _veh;
    detach _veh;
    _veh setVelocity _vel;
    missionNamespace setVariable [""#FX"", [_veh, _vel select 2]];
    publicVariable ""#FX"";
    for ""_i"" from 1 to 5 do {
        playSound3D [
            ""a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss"",
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

    _veh setVariable[""airdrop"",FALSE, true];

    for ""_i"" from 1 to 10 do {
        createvehicle[""SmokeShellPurple"", (getPosATL _veh), [], 0, ""NONE""];
        createvehicle[""SmokeShellBlue"", (getPosATL _veh), [], 0, ""NONE""];
        sleep 50
    };
};";