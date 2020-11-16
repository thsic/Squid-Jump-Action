function itemManage(){
	
	//バリアアイテム生成
	if(global.makeBarrierCount <= 0){
		instance_create_layer(room_width, irandom(room_height), "GameObjects", oBarrier);
		setBarrierCount();
	}
	
}

function manageGameState(){
	switch(global.gameState){
	case GAMESTATE.STAGESTART:
		changeGameState(GAMESTATE.MAIN);
		//global.flySpeed = 2;
		global.gameStop = true;
		global.playerHp = playerHpDefault;
		setBarrierCount();
		
		
	break
	case GAMESTATE.MAIN:
		global.gameStop = false;
		itemManage();
		
	break
	case GAMESTATE.PAUSE:
		global.gameStop = true;
	break
	case GAMESTATE.GAMEOVER:
		global.gameStop = true;
		
		if(mouse_check_button(mb_left)){
			room_restart();
		}
		gameoverElapsedTime++;
		
		
	break
	}
}


manageGameState();

