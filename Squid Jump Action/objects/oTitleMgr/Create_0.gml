

var _buttonY = room_height*0.7;
var _playStartButtonX = room_width/2;
var _howToPlayButtonX = _playStartButtonX + room_width*0.2 + sprite_get_width(sHowToPlayButton)/2
var _statsButtonX = _playStartButtonX - room_width*0.2 - sprite_get_width(sStatsButton)/2;

createButton(sPlayStartButton, _playStartButtonX, _buttonY, pressedPlayStartButton, 0, DRAWEVENT.DRAW);
createButton(sHowToPlayButton, _howToPlayButtonX, _buttonY, pressedHowToPlayButton, 1, DRAWEVENT.DRAW);
createButton(sStatsButton, _statsButtonX, _buttonY, pressedStatsButton, 2, DRAWEVENT.DRAW);

buttonActive = false;
pressedButton = noone;

instance_create_layer(0, 0, "Instances", oCamera);

drawHowToPlayWindow = false;
drawStatsWindow = false;
drawWindowTime = 0;
windowAlpha = 0;
windowState = DRAWINGTITLEWINDOW.IDLE;


//バックグラウンド
function titleBackGroundObjectSetStats(_num, _spr, _spd, _spawnRatio, _depth){
	bgObjStats[# TITLEBGSTATS.SPRITE, _num] = _spr;
	bgObjStats[# TITLEBGSTATS.SPEED, _num] = _spd;
	bgObjStats[# TITLEBGSTATS.SPAWNRATIO, _num] = _spawnRatio;
	bgObjStats[# TITLEBGSTATS.DEPTH, _num] = _depth;
}

bgObjStats = ds_grid_create(10, 10);
bgObjParam = ds_grid_create(10, 50);

titleBackGroundObjectSetStats(0, sJellyfish, 0, 0.008, 1);
titleBackGroundObjectSetStats(1, sUrchin, 0, 0.002, 1);
//titleBackGroundObjectSetStats(2, sOctopus, 0, 0.0007, 1);
titleBackGroundObjectSetStats(2, sShark, 5, 0.0001, 0);

enum PRESSEDTITLEBUTTON{
	PLAYGAME,
	HOWTOPLAY,
	STATS,
}

enum DRAWINGTITLEWINDOW{
	DRAWSTART,
	DRAWING,
	DRAWEND,
	IDLE
}

enum TITLEBGSTATS{
	SPRITE,
	SPEED,
	SPAWNRATIO,
	DEPTH,
}
enum TITLEBGPARAM{
	SPRITE,
	X,
	Y,
	SPEED,
	DEPTH,
	ENABLED,
}