
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
