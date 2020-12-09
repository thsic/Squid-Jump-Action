function itemManage(){
	
	//バリアアイテム生成
	if(global.makeBarrierCount <= 0){
		instance_create_layer(room_width, irandom(room_height), "GameObjects", oBarrier);
		setBarrierCount();
	}
	
}

/*function heightLimitManage(){
	
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
}*/

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
function createBubble(){
	//泡生成
	var _bubbleCreateRatio = 0.02;
	var _bubbleQuantityMin = 1;
	var _bubbleQuantityMax = 8;
	var _bubbleCreateRange = 20;
	var _random = random(1);
	
	if(_bubbleCreateRatio > _random){
		var _bubbleQuantity = irandom_range(_bubbleQuantityMin, _bubbleQuantityMax);
		var _baseX = irandom_range(0, room_width*1.5);
		var _baseY = irandom_range(0, room_height);
		
		repeat(_bubbleQuantity){
			var _x = irandom_range(_baseX-_bubbleCreateRange, _baseX+_bubbleCreateRange);
			var _y = irandom_range(_baseY-_bubbleCreateRange, _baseY+_bubbleCreateRange);
			instance_create_layer(_x, _y, "Effects", oBubble);
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
		global.nowLevel = 1;
		global.levelPoint = 0;
		global.gameScore = 0;
		global.swimLength = 0;
		
		setBarrierCount();
		instance_create_layer(0, 0, "Instances", oEnemyGenerateMgr);
		
		
	break
	case GAMESTATE.MAIN:
		global.gameStop = false;
		itemManage();
		levelManage();
		scoreManage();
		createBubble();
		
	break
	case GAMESTATE.PAUSE:
		global.gameStop = true;
	break
	case GAMESTATE.GAMEOVER:
		global.gameStop = true;
		if(!instance_exists(oGameoverMgr)){
			instance_create_layer(0, 0, "UI", oGameoverMgr);
		}
		
		gameoverElapsedTime++;
		
		
	break
	}
}



manageGameState();

