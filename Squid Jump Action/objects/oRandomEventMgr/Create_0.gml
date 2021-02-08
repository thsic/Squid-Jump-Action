
function dsSetEventParam(_num, _name, _description, _time){
	dsEventParam[# RANDOMEVENTPARAM.NAME, _num] = _name;
	dsEventParam[# RANDOMEVENTPARAM.DESCRIPTION, _num] = _description;
	dsEventParam[# RANDOMEVENTPARAM.TIME, _num] = _time;
}


randomEventEnable = false;
eventRoulette = false;
randomEventTime = 0;

global.usefulwindow_surface[1] = noone;


dsEventParam = ds_grid_create(4, 10);

dsSetEventParam(0, "ダッシュ加速", "ダッシュするたびに加速します。", 600);
dsSetEventParam(1, "フラッピーイカ", "うにの壁が出現します。", 600);
dsSetEventParam(2, "うにだらけ", "うにしか出現しなくなります。", 600);
dsSetEventParam(3, "さめだらけ", "さめしか出現しなくなります。", 600);
dsSetEventParam(4, "無敵モード", "敵からダメージを受けなくなります。", 600);
dsSetEventParam(5, "倍ダッシュ", "ダッシュ回数が2倍になります。", 1200);

enum RANDOMEVENT{
	DASHACCELERATION,
	URCHINWALL,
	URCHINONLY,
	SHARKONLY,
	INBINCIBLE,
	DOUBLEDASHCOUNT,
	
}


enum RANDOMEVENTPARAM{
	NAME,
	DESCRIPTION,
	TIME,
}