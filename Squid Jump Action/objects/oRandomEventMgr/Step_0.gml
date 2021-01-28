
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
	}
}

//ランダムイベント実行
if(randomEventEnable){
	randomEventTime--;
	
	if(randomEventTime <= 0){
		randomEventEnable = false;
	}
}


