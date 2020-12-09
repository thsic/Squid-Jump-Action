


//バックグラウンドオブジェクトのステータス
function backgroundObjectSetStats(_num, _spr, _ground, _spdMin, _spdMax, _spawnRatio){
	bgObjStats[# BGOBJSTATS.SPRITE, _num] = _spr;
	bgObjStats[# BGOBJSTATS.GROUND, _num] = _ground;
	bgObjStats[# BGOBJSTATS.SPEEDMIN, _num] = _spdMin;
	bgObjStats[# BGOBJSTATS.SPEEDMAX, _num] = _spdMax;
	bgObjStats[# BGOBJSTATS.SPAWNRATIO, _num] = _spawnRatio;
}

bgObjStats = ds_grid_create(6, 10);
bgObjParam = ds_grid_create(6, 50);

backgroundObjectSetStats(0, sCoral, true, 0, 0, 0.002);
backgroundObjectSetStats(1, sSeaweed, true, 0, 0, 0.002);
backgroundObjectSetStats(2, sBackgroundFish, false, 1, 2, 0.05);



enum BGOBJSTATS{
	SPRITE,
	GROUND,
	SPEEDMIN,
	SPEEDMAX,
	SPAWNRATIO,
}

enum BGOBJPARAM{
	SPRITE,
	X,
	Y,
	SPEED,
	ENABLED,
}