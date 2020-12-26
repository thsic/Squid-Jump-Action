
function generateEnemy(_enemy, _x, _y, _layer){
	instance_create_layer(_x, _y, _layer, _enemy);
}

function generateTimeManage(){
	octopusGenerateCount -= global.flySpeed;
	insideUrchinGenerateCount -= global.flySpeed;
	outsideUrchinGenerateCount -= global.flySpeed;
	jellyfishGenerateCount -= global.flySpeed;
	sharkGenerateCount -= global.flySpeed;
	planktonGenerateCount -= global.flySpeed;
}

function generateEnemyRightside(_enemy, _minY, _maxY, _layer){
	//右側に敵を生成 ランダムなy
	var _spriteWidth = sprite_get_width(object_get_sprite(_enemy));
	var _max = (_maxY - _minY) / generateSpaceInterval;
	var _generateY = irandom(_max)*generateSpaceInterval + _minY;
	generateEnemy(_enemy, room_width+_spriteWidth, _generateY, _layer);
}

function jellyfishGenerateManage(){
	//くらげ
	if(jellyfishGenerateCount <= 0 and jellyfishGenerateSpan != -1){
		
		jellyfishGenerateCount = jellyfishGenerateSpan + jellyfishGenerateCount;
		generateEnemyRightside(oJellyfish, heightLimit, GROUNDPOS, "GameObjects");
		
	}
}

function octopusGenerateManage(){
	//たこ
	if(octopusGenerateCount <= 0 and octopusGenerateSpan != -1){
		
		octopusGenerateCount = octopusGenerateSpan + octopusGenerateCount;
		generateEnemyRightside(oOctopus, heightLimit, GROUNDPOS, "GameObjects");
	}
}

function sharkRandomGenerateManage(){
	//さめ
	if(sharkGenerateCount <= 0 and sharkGenerateSpan != -1){
		
		sharkGenerateCount = sharkGenerateSpan + sharkGenerateCount;
		generateEnemyRightside(oShark, heightLimit, GROUNDPOS, "GameObjects");
		
	}
}

function urchinGenerateManage(){
	//うに
	if(insideUrchinGenerateCount <= 0 and insideUrchinGenerateSpan != -1){
		//中央らへんのうに生成
		insideUrchinGenerateCount = insideUrchinGenerateSpan;
		
		var _sprHeightHalf = sprite_get_height(object_get_sprite(oUrchin))/2;
		var _minY = insideLineMin + _sprHeightHalf;
		var _maxY = insideLineMax;
		
		generateEnemyRightside(oUrchin, _minY, _maxY, "SpikeObjects");
	}
	
	if(outsideUrchinGenerateCount <= 0 and outsideUrchinGenerateSpan != -1){
		//外側らへんのうに生成
		outsideUrchinGenerateCount = outsideUrchinGenerateSpan;
		var _insideArea = insideLineMax - insideLineMin;
		var _insideLineMin = insideLineMin;
		//生成できる範囲上側 0より小さくはならない
		var _upsideRange = clamp(_insideLineMin-heightLimit, 0, room_height);
		//下側範囲 clamp無しでも0より小さくならない
		var _downsideRange = room_height - (_insideLineMin+_insideArea);
		
		
		var _generatePosition = random(1);//どっちに出すか乱数できめる 範囲が広いと確率が高く
		var _upsidePositionRatio = _upsideRange / (_upsideRange+_downsideRange);//スプライトの高さの半分
		
		if(_upsidePositionRatio - _generatePosition > 0){
			//カメラより上に生成する
			generateEnemyRightside(oUrchin, heightLimit, _insideLineMin, "SpikeObjects");
		}
		else{
			//カメラ範囲より下に生成する
			var _sprHeightHalf = sprite_get_height(object_get_sprite(oUrchin))/2;
			generateEnemyRightside(oUrchin, _insideLineMin+_insideArea+_sprHeightHalf, GROUNDPOS+_sprHeightHalf, "SpikeObjects");
		}
		
	}
}

function planktonGenerateManage(){
	//プランクトン
	if(planktonGenerateCount <= 0 and planktonGenerateSpan != -1){
		
		planktonGenerateCount = planktonGenerateSpan + planktonGenerateCount;
		generateEnemyRightside(oPlankton, heightLimit, GROUNDPOS, "GameObjects");
	}
}


if(!global.gameStop){
	jellyfishGenerateManage();
	octopusGenerateManage();
	urchinGenerateManage();
	generateTimeManage();
	sharkRandomGenerateManage();
	planktonGenerateManage()
}

