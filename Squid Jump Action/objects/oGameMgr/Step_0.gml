function itemManage(){
	
	//バリアアイテム生成
	if(global.makeBarrierCount <= 0){
		createItem(oBarrier, true);
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
	if(global.levelPoint > levelUpPoint){
		//レベル上昇処理
		global.levelPoint -= levelUpPoint;
		gameLevelUp();
		
		//アイテム生成
		//createItem(oInfiniteJumpItem, false);
		createItem(oSpeedUpItem, true);
		
		//ドッジ回復
		addDodgeCount(1);
	}
}

function sharkGenerateManage(){//サメ生成
	
	var _playerY = oPlayer.y;
	sharkPoint += abs(_playerY - playerYPrev);//まえのフレームと比較して違いが大きいほどサメがでにくい
	sharkPoint -= sharkPointPerFrame;
	sharkPoint = clamp(sharkPoint, -100, sharkPointBase)
	
	
	if(sharkPoint <= 0){
		sharkPoint = sharkPointBase;
		var _sprWidth = sprite_get_width(object_get_sprite(oCaution));
		instance_create_layer(room_width - _sprWidth/2, oPlayer.y, "GameObjects", oCaution);
	}
	playerYPrev = _playerY;
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

function drawSwipeSprite(){
	//一定時間スワイプされないとswipe!って表示する
	
	/*if(swipeSpriteTime = 0){
		swipeSpriteEnable = true;
		swipeSpriteTime = -1;
		swipeSequence = layer_sequence_create("UI", oPlayer.x+100, oPlayer.y, sqSwipe);
	}
	else{
		swipeSpriteTime--;
		swipeSpriteEnable = false
	}
	if(swipeSpriteEnable){
		if(mouse_check_button_pressed(mb_left)){
			layer_sequence_destroy(swipeSequence);
		}
	}*/
}


function manageGameState(){
	switch(global.gameState){
	case GAMESTATE.STAGESTART:
		changeGameState(GAMESTATE.MAIN);
		global.gameStop = true;
		global.playerHp = playerHpDefault;
		global.nowLevel = 1;
		global.levelPoint = 0;
		global.gameScore = 0;
		global.swimLength = 0;
		global.squidCoin = 0;
		global.flySpeed = 0;
		global.speedLevel = 1;
		global.throughSpeedUpCount = 0;
		global.scoreRatio = 1;
		global.randomEventId = noone;
		global.tempSpeedLevel = 0;
		
		sharkPoint = sharkPointBase;
		playerYPrev = oPlayer.y;
		levelUpPoint = levelUpPointBase;
		swipeSpriteTime = 120;
		makeBarrierCountBase = makeBarrierCountDefault;
		decreaseTempSpeedTime = DECREASETEMPSPEEDTIME;
		
		setBarrierCount();
		instance_create_layer(0, 0, "Instances", oEnemyGenerateMgr);
		instance_create_layer(0, 0, "Instances", oRandomEventMgr);
		//ドッジボタン生成
		//createButton(sDodgeButton, 36, room_height-36, playerDodgeStart, 3, DRAWEVENT.DRAW);
		
		
	break
	case GAMESTATE.MAIN:
		global.gameStop = false;
		itemManage();
		levelManage();
		scoreManage();
		createBubble();
		sharkGenerateManage()
		drawSwipeSprite();
		if(keyboard_check_pressed(vk_space)){
			changeGameState(GAMESTATE.PAUSE);
		}
		
		//プレイヤーがダメージくらったあとゲームスピードが遅くなる時間
		if(damagedTime > 0){
			damagedTime--;
			var _channel = animcurve_get_channel(acGameSpeedAfterDamage, 0);
			damagedTimeSlowRatio = animcurve_channel_evaluate(_channel, 1-damagedTime / DAMAGEDTIMEBASE);
		}
		
		//仮スピードの減少 (一定時間ごとに仮スピードは減少していく)
		if(global.tempSpeedLevel > 0){
			decreaseTempSpeedTime--;
			if(decreaseTempSpeedTime <= 0){
				//仮スピードレベルの減少
				global.tempSpeedLevel--;
				decreaseTempSpeedTime = DECREASETEMPSPEEDTIME;
			}
		}
		
	break
	case GAMESTATE.PAUSE:
		global.gameStop = true;
		if(keyboard_check_pressed(vk_space)){
			changeGameState(GAMESTATE.MAIN);
		}
	break
	case GAMESTATE.GAMEOVER:
		global.gameStop = true;
		global.flySpeed = 0;
		if(!instance_exists(oGameoverMgr)){
			instance_create_layer(0, 0, "UI", oGameoverMgr);
		}
		
		gameoverElapsedTime++;
		
		
	break
	}
}



manageGameState();

