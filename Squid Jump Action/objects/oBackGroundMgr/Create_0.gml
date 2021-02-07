


//バックグラウンドオブジェクトのステータス
function backgroundObjectSetStats(_num, _spr, _ground, _spdMin, _spdMax, _spawnRatio, _depthMin, _depthMax){
	bgObjStats[# BGOBJSTATS.SPRITE, _num] = _spr;
	bgObjStats[# BGOBJSTATS.GROUND, _num] = _ground;
	bgObjStats[# BGOBJSTATS.SPEEDMIN, _num] = _spdMin;
	bgObjStats[# BGOBJSTATS.SPEEDMAX, _num] = _spdMax;
	bgObjStats[# BGOBJSTATS.SPAWNRATIO, _num] = _spawnRatio;
	bgObjStats[# BGOBJSTATS.DEPTHMIN, _num] = _depthMin;
	bgObjStats[# BGOBJSTATS.DEPTHMAX, _num] = _depthMax;
}
maxDepth = 100;
bgObjStats = ds_grid_create(10, 10);
bgObjParam = ds_grid_create(10, 50);


backgroundObjectSetStats(0, sCoral, true, 0, 0, 0.002, 0, maxDepth);
backgroundObjectSetStats(1, sSeaweed, true, 0, 0, 0.002, 0, maxDepth);
backgroundObjectSetStats(2, sBackgroundFish, false, 1, 2, 0.02, 0, 1);
backgroundObjectSetStats(3, sBackGroundRock, true, 0, 0, 0.002, 0, maxDepth);
backgroundObjectSetStats(4, sSeaMount, true, 0, 0, 0.003, 0, maxDepth);

/*background_showcolor = true;
background_color = backGroundColor;
bgId = layer_background_get_id(layer_get_id("BackGround"))
layer_background_blend(bgId, backGroundColor)
*/

//ダッシュ時の線
dsDashEffect = ds_grid_create(7, 50);
dashEffectCount = dashEffectSpan;
dashEffectAlpha = 0;

enum BGOBJSTATS{
	SPRITE,
	GROUND,
	SPEEDMIN,
	SPEEDMAX,
	SPAWNRATIO,
	DEPTHMIN,
	DEPTHMAX,
	
}

enum BGOBJPARAM{
	SPRITE,
	X,
	Y,
	SPEED,
	ENABLED,
	DEPTH,
	SCALE,
}

enum DASHEFFECTPARAM{
	ENABLE,
	X,
	Y,
	SPEED,
	SPRITE,
}