
instance_create_layer(300, 200, "GameObjects", oPlayer);
global.gameState = GAMESTATE.STAGESTART;
global.nextState = noone;
global.gameStop = true;

if(debug_mode){
	instance_create_layer(0, 0, "Instances", oDebugMgr);
}

enum GAMESTATE{
	MAIN,
	STAGESTART,
	GAMEOVER,
	PAUSE,
}