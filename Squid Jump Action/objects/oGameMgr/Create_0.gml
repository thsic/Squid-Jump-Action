
instance_create_layer(100, 200, "GameObjects", oPlayer);
instance_create_layer(0, 0, "Instances", oCamera);
instance_create_layer(0, 0, "Instances", oBackGroundMgr);
global.gameState = GAMESTATE.STAGESTART;
global.nextState = noone;
global.gameStop = true;


overHeightLimitTime = 0;
levelUpSequenceElement = noone;
damagedTime = 0;
damagedTimeSlowRatio = 1;

//usefulwindow
global.usefulwindow_surface[0] = noone


enum GAMESTATE{
	MAIN,
	STAGESTART,
	GAMEOVER,
	PAUSE,
}