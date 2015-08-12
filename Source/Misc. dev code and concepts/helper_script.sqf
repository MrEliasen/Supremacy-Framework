_cfgitems = configFile >> "cfgWeapons";
for "_i" from 0 to (count _cfgitems)-1 do {
    private ["_item", "_type"];
    _item = (_cfgitems select _i);
    _type = 0;

    if (isClass (_item >> "ItemInfo")) then {
        _type = getNumber(_item >> "ItemInfo" >> "Type");
    };

    if (_type != 0) then {
        diag_log configName(_item);
        diag_log _type;
    }
};

_cfgitems = configFile >> "cfgWeapons";
for "_i" from 0 to (count _cfgitems)-1 do {
    private ["_item", "_type"];
    _item = (_cfgitems select _i);
    _type = getNumber(_item >> "Type");
    _item = configName(_item);

    if (_type in [1,2,4,5]) then {
        diag_log _item;
    };
};