
function generateEnemy(_enemy, _x, _y){
	instance_create_layer(_x, _y, "GameObjects", _enemy);
}

function generateTimeManage(){
	octopusGenerateTime -= global.flySpeed;
	insideUrchinGenerateTime -= global.flySpeed;
	outsideUrchinGenerateTime -= global.flySpeed;
	
}

function generateEnemyRightside(_enemy, _minY, _maxY){
	//右側に敵を生成 ランダムなy
	var _spriteWidth = sprite_get_width(object_get_sprite(_enemy));
	var _max = (_maxY - _minY) / generateSpaceInterval;
	var _generateY = irandom(_max)*generateSpaceInterval + _minY;
	generateEnemy(_enemy, room_width+_spriteWidth, _generateY);
}

function octopusGenerateManage(){
	//たこ
	if(octopusGenerateTime <= 0){
		
		var _spriteHeight = sprite_get_height(object_get_sprite(oOctopus));
		octopusGenerateTime = octopusGenerateSpan + octopusGenerateTime;
		generateEnemyRightside(oOctopus, heightLimit, GROUNDPOS - _spriteHeight/2);
	}
}

function urchinGenerateManage(){
	//うに
	if(insideUrchinGenerateTime <= 0){
		//カメラ内にうに生成
		insideUrchinGenerateTime = insideUrchinGenerateSpan + insideUrchinGenerateTime;
		
		var _spriteHeight = sprite_get_height(object_get_sprite(oUrchin));
		var _minY = camera_get_view_y(oCamera.camera);
		var _maxY = clamp(camera_get_view_height(oCamera.camera) + _minY, 0, GROUNDPOS - _spriteHeight/2);
		
		generateEnemyRightside(oUrchin, _minY, _maxY);
	}
	
	if(outsideUrchinGenerateTime <= 0){
		//カメラ外にうに生成
		outsideUrchinGenerateTime = outsideUrchinGenerateSpan + insideUrchinGenerateTime;
		var _cameraHeight = camera_get_view_height(oCamera.camera);
		var _cameraY = camera_get_view_y(oCamera.camera);
		
		//生成できる範囲上側 0より小さくはならない
		var _upsideRange = clamp(_cameraY-heightLimit, 0, room_height);
		//下側範囲 clamp無しでも0より小さくならない
		var _downsideRange = room_height - (_cameraY+_cameraHeight);
		
		var _generatePosition = random(1);//どっちに出すか乱数できめる 範囲が広いと確率が高く
		var _upsidePositionRatio = _upsideRange / (_upsideRange+_downsideRange);
		if(_upsidePositionRatio - _generatePosition > 0){
			//カメラより上に生成する
			generateEnemyRightside(oUrchin, heightLimit, _cameraY);
		}
		else{
			//カメラ範囲より下に生成する
			var _spriteHeight = sprite_get_height(object_get_sprite(oUrchin));
			generateEnemyRightside(oUrchin, _cameraY+_cameraHeight, GROUNDPOS - _spriteHeight/2);
		}
	}
}


if(!global.gameStop){
	octopusGenerateManage();
	urchinGenerateManage();
	generateTimeManage();
}

