
instance_create_layer(300, 200, "GameObjects", oPlayer);
instance_create_layer(0, 0, "Instances", oCamera);
global.gameState = GAMESTATE.STAGESTART;
global.nextState = noone;
global.gameStop = true;

if(debug_mode){
	instance_create_layer(0, 0, "Instances", oDebugMgr);
}

overHeightLimitTime = 0;
levelUpSequenceElement = noone;

//usefulwindow
global.usefulwindow_surface[0] = noone


enum GAMESTATE{
	MAIN,
	STAGESTART,
	GAMEOVER,
	PAUSE,
}