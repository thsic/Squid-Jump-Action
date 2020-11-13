
function manageGameState(){
	switch(global.gameState){
	case GAMESTATE.STAGESTART:
		changeGameState(GAMESTATE.MAIN);
		global.flySpeed = 2;
		global.gameStop = true;
		
	break
	case GAMESTATE.MAIN:
		global.gameStop = false;
	break
	case GAMESTATE.PAUSE:
		global.gameStop = true;
	break
	case GAMESTATE.GAMEOVER:
		global.gameStop = true;
	break
	}
}

manageGameState();

