
if(eventRoulette){
	if(rouletteTimeBase = rouletteTime){
		//アイテム取った瞬間にイベント決める
		eventId = irandom(eventNumber-1);
		rouletteView = irandom(eventNumber-1);
	}
	
	rouletteTime--;
	
	//ルーレットに表示するアイコン決める
	if(rouletteTime mod 5 = 0){
		
		//ルーレットに表示されるアイコンは直前のアイコンと実行されるイベント以外のアイコンになる
		repeat(10){
			var _tempView = irandom(eventNumber-1);
			if(_tempView != rouletteTime and _tempView != eventId){
				rouletteView = _tempView;
				break;
			}
		}
	}
	
	if(rouletteTime <= 0){
		randomEventEnable = true;
		eventRoulette = false;
		//ランダムイベントの初期設定
		randomEventTime = dsEventParam[# RANDOMEVENTPARAM.TIME, eventId];
		
		switch(eventId){
			//生成率変更、無限ジャンプ時間設定
		case RANDOMEVENT.URCHINWALL:
			oEnemyGenerateMgr.insideUrchinGenerateSpan = 120;
			oEnemyGenerateMgr.outsideUrchinGenerateSpan = 90;
			
			oEnemyGenerateMgr.insideUrchinGenerateCount = 120;
			oEnemyGenerateMgr.outsideUrchinGenerateCount = 90;
			
			oPlayer.infiniteJumpTime = randomEventTime+120;
			
		break
		case RANDOMEVENT.URCHINONLY:
			oEnemyGenerateMgr.insideUrchinGenerateSpan = 120;
			oEnemyGenerateMgr.outsideUrchinGenerateSpan = 90;
			
			oEnemyGenerateMgr.insideUrchinGenerateCount = 120;
			oEnemyGenerateMgr.outsideUrchinGenerateCount = 90;
			
			oPlayer.infiniteJumpTime = randomEventTime+120;
			
		break
		case RANDOMEVENT.SHARKONLY:
			oEnemyGenerateMgr.sharkGenerateSpan = 240;
			oEnemyGenerateMgr.sharkGenerateCount = 240;
			oPlayer.infiniteJumpTime = randomEventTime+120;
		break
		case RANDOMEVENT.DOUBLEDASHCOUNT:
			oPlayer.dashTimeBase = oPlayer.dashTimeDefault/2;//ダッシュ速度半減
		break
		}
		
	}
}

//ランダムイベント実行
if(randomEventEnable){
	randomEventTime--;
	global.randomEventId = eventId;
	
	if(randomEventTime <= 0){
		randomEventEnable = false;
	}
}
else{
	switch(global.randomEventId){
	case RANDOMEVENT.SHARKONLY:
		if(global.nowLevel >= oEnemyGenerateMgr.sharkGenerateLevel){
			oEnemyGenerateMgr.sharkGenerateCount = oEnemyGenerateMgr.sharkGenerateSpan;
		}
	break
	case RANDOMEVENT.DOUBLEDASHCOUNT:
		//ダッシュ速度戻す
		oPlayer.dashTimeBase = oPlayer.dashTimeDefault;
	break
	}
	
	
	global.randomEventId = noone;
	setEnemyGenerateSpan();
	
	
}


