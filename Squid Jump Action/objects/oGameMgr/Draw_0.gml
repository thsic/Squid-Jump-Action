
function drawHeightLimit(){
	//height上限描画
	if(oPlayer.y < drawHeightLimitLine){
		//ライン描画
		
		var _borderLineWidth = sprite_get_width(sHeightLimitLine);
		var _distanceBitween = 16;
		var _borderLineNumber = ceil(room_width / _borderLineWidth + _distanceBitween);
		var _borderLineAlpha = 1-(oPlayer.y - heightLimit) / (drawHeightLimitLine - heightLimit);
		
		//ラインが横に流れる感じに描画させる
		var _borderLineX = -(current_time/4 % (_borderLineWidth+_distanceBitween));
		
		for(var i=0; i<_borderLineNumber; i++){
			draw_sprite_ext(sHeightLimitLine, 0, _borderLineX, heightLimit, 1, 1, 0, c_white, _borderLineAlpha);
			_borderLineX += _borderLineWidth + _distanceBitween;
			
		}
		
		
		
	}
	//高さ上限を超えた時間によって赤くする
	if(overHeightLimitTime > 0){
		var _alphaLimit = 0.5;
		var _rectangleAlpha = overHeightLimitTime / overHeightLimitTimeBase * _alphaLimit;
		if(_rectangleAlpha >= _alphaLimit){
			_rectangleAlpha = _alphaLimit;
		}
			
		draw_set_color(c_red);
		draw_set_alpha(_rectangleAlpha);
		draw_rectangle(0, 0, room_width, heightLimit, false);
		drawSetDefault();
			
	}
}

//drawHeightLimit();

function drawGround(){
	var _spriteWidth = sprite_get_width(sGround);
	var _spriteQuantity = ceil(room_height/_spriteWidth)+1;
	var _spriteY = room_height - sprite_get_height(sGround);
	var _leftX = global.swimLength mod _spriteWidth;
	
	for(var i=0; i<_spriteQuantity; i++){
		var _spriteX = i * _spriteWidth - _leftX;
		draw_sprite(sGround, 0, _spriteX, _spriteY);
		
	}
	
	
}

drawGround();
