
function generateSeaMount(){
	var _sprite = sSeaMount;
	var _sprW = sprite_get_width(_sprite);
	var _sprH = sprite_get_height(_sprite);
	var _generateSpanMax = _sprW;
	
}

//生成
function generateBgObj(){
	var _bgobjNum = ds_grid_height(bgObjStats);
	
	for(var i=0; i<_bgobjNum; i++){
		
		var _random = random(1);
		var _spawnRatio = bgObjStats[# BGOBJSTATS.SPAWNRATIO, i]*global.flySpeed;
		if(_random < _spawnRatio){
			
			//生成処理
			var _objectNumber = -1;
			//空いている所さがす
			for(var j=0; j<ds_grid_height(bgObjParam); j++){
				if(!bgObjParam[# BGOBJPARAM.ENABLED, j]){
					_objectNumber = j;
					break;
				}
			}
			
			//パラメータ入れる
			if(_objectNumber != -1){
				var _sprite = bgObjStats[# BGOBJSTATS.SPRITE, i];
				var _spdMin = bgObjStats[# BGOBJSTATS.SPEEDMIN, i];
				var _spdMax = bgObjStats[# BGOBJSTATS.SPEEDMAX, i];
				var _grounded = bgObjStats[# BGOBJSTATS.GROUND, i];
				
				var _x = room_width+sprite_get_width(_sprite);
				if(_grounded){
					var _y = GROUNDPOS - sprite_get_height(_sprite)/2;
				}
				else{
					var _y = random_range(0, GROUNDPOS - 32);
				}
				var _speed = random_range(_spdMin, _spdMax);
				
				bgObjParam[# BGOBJPARAM.X, _objectNumber] = _x;
				bgObjParam[# BGOBJPARAM.Y, _objectNumber] = _y;
				bgObjParam[# BGOBJPARAM.SPEED, _objectNumber] = _speed;
				bgObjParam[# BGOBJPARAM.SPRITE, _objectNumber] = _sprite;
				bgObjParam[# BGOBJPARAM.ENABLED, _objectNumber] = true;
				
			}
		}
	}
}

function moveBgObj(){
	for(var i=0; i<ds_grid_height(bgObjParam); i++){
		if(bgObjParam[# BGOBJPARAM.ENABLED, i]){
			//移動させる
			bgObjParam[# BGOBJPARAM.X, i] -= global.flySpeed;
			bgObjParam[# BGOBJPARAM.X, i] -= bgObjParam[# BGOBJPARAM.SPEED, i];
			
			//端に到達したら消える
			if(bgObjParam[# BGOBJPARAM.X, i] < -sprite_get_width((bgObjParam[# BGOBJPARAM.SPRITE, i]))){
				bgObjParam[# BGOBJPARAM.ENABLED, i] = false;
			}
		}
	}
}

if(!global.gameStop){
	generateBgObj();
	moveBgObj();
}
