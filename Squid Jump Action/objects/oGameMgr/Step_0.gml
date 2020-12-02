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

function levelManage(){
	if(global.levelPoint > levelUpPointBase){
		//レベル上昇処理
		global.levelPoint -= levelUpPointBase;
		global.nowLevel++;
		
		
		var _cameraWidth = camera_get_view_width(oCamera.camera);
		var _cameraHeight = camera_get_view_height(oCamera.camera);
		var _sqX = camera_get_view_x(oCamera.camera) + _cameraWidth/2;
		var _sqY = camera_get_view_x(oCamera.camera) + _cameraHeight/2;
		createTextEffect(_sqX, _sqY, sqLevelUpEffect, 0, true, "LevelUp!", c_green, noone);
	}
}

function scoreManage(){
	//スコア関連	
}

function manageGameState(){
	switch(global.gameState){
	case GAMESTATE.STAGESTART:
		changeGameState(GAMESTATE.MAIN);
		//global.flySpeed = 2;
		global.gameStop = true;
		global.playerHp = playerHpDefault;
		global.nowLevel = 1;
		global.levelPoint = 0;
		global.gameScore = 0;
		
		setBarrierCount();
		instance_create_layer(0, 0, "Instances", oEnemyGenerateMgr);
		
		
	break
	case GAMESTATE.MAIN:
		global.gameStop = false;
		itemManage();
		heightLimitManage();
		levelManage();
		scoreManage();
		
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

