function itemManage(){
	
	//バリアアイテム生成
	if(global.makeBarrierCount <= 0){
		instance_create_layer(room_width, irandom(room_height), "GameObjects", oBarrier);
		setBarrierCount();
	}
	
}

function heightLimitManage(){
	
	if(oPlayer.y < heightLimit){
		//高さ上限ラインを超えている
		overHeightLimitTime++
		if(overHeightLimitTime >= overHeightLimitTimeBase){
			//上限ライン気終えてから一定時間経過
			
		}
	}
	else{
		if(overHeightLimitTime > 0){
			overHeightLimitTime -= 2;
		}
		else{
			overHeightLimitTime = 0;
		}
		
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
		instance_create_layer(0, 0, "Instances", oEnemyGenerateMgr);
		
		
	break
	case GAMESTATE.MAIN:
		global.gameStop = false;
		itemManage();
		heightLimitManage();
		
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

