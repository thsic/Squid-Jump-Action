
function drawScoreUi(_alpha){
	var _s = oCamera.resScale;
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_set_font(foYasa24A);
	draw_set_alpha(_alpha);
	//drawTextOutline(10, 20, "Score "+string(global.gameScore), c_white, c_black, 1);
	draw_text(10*_s, 20*_s, "Score "+string(global.gameScore));
}
function drawSpeedLevel(_alpha){
	var _s = oCamera.resScale;
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_set_font(foYasa24A);
	draw_set_alpha(_alpha);
	//drawTextOutline(250, 20, "Speed", c_white, c_black, 1);
	draw_text(250*_s, 20*_s, "Speed");
	
	var _sprWidth = sprite_get_width(sSpeedLevelIcon)*_s;
	for(var i=0; i<global.speedLevel; i++){
		var _x = 310*_s + _sprWidth*i;
		draw_sprite_ext(sSpeedLevelIcon, 0*_s, _x, 10*_s, _s, _s, 0, c_white, 1);
	}
}
function drawOutOfScreenItem(){
	//画面外にあるアイテムの位置表示
	var _itemNum = instance_number(oItem);
	var _cameraY = camera_get_view_y(oCamera.camera);
	var _cameraHeight = camera_get_view_height(oCamera.camera);
	var _playerY = oPlayer.y;
	var _balloonSpriteHeight = sprite_get_height(sItemBalloon);
	
	for(var i=0; i<_itemNum; i++){
		var _itemId = instance_find(oItem, i);
		var _itemY = _itemId.y;
		var _itemSprHeight = sprite_get_height(_itemId.sprite_index);
		
		//アイテムが画面内にあるかどうか
		//(カメラyからアイテムのheightを引いた値/2 ~ カメラy+カメラheight+アイテムHeight/2が画面内の範囲)
		if(!isInRange(_cameraY-_itemSprHeight/2, _cameraY+_cameraHeight+_itemSprHeight/2, _itemY)){
			//画面外にないので吹き出しで表示
			var _itemX = _itemId.x;
			var _itemSprite = _itemId.sprite_index;
			
			if(_itemY < _playerY){//上
				var _itemUpside = true;
				var _balloonY = _balloonSpriteHeight/2;
				var _itemSpriteY = _balloonY;
				var _angle = 180;
				var _scale = 1-(_cameraY-_itemY)/(room_height-_cameraHeight);
			}
			else{//下
				var _itemUpside = false;
				var _balloonY = _cameraHeight-_balloonSpriteHeight/2;
				var _itemSpriteY = _balloonY;
				var _angle = 0;
				var _scale = 1-(_itemY-_cameraY-_cameraHeight)/(room_height-_cameraHeight);
			}
			
			//描画
			draw_sprite_ext(sItemBalloon, 0, _itemX, _balloonY, _scale, _scale, _angle, c_white, 1);
			draw_sprite_ext(_itemSprite, 0, _itemX, _itemSpriteY, 0.25*_scale, 0.25*_scale, _angle, c_white, 1);
			
		}
	}
}
function drawLevelBar(_alpha){
	
	var _s = oCamera.resScale;
	draw_set_valign(fa_middle);
	var _barTotalW = 80*_s;
	var _barH = 2*_s;
	var _barX = 140*_s;
	var _barY = 30*_s;
	var _os = 1*_s;
	var _barCol1 = 9233706;
	var _barCol2 = $bcf23f;
	
	var _barW = clamp(_barTotalW * (global.levelPoint / levelUpPoint), 0, _barTotalW);
	var _barCol = merge_color(_barCol1, _barCol2, sin(current_time/300)/2*0.5);
	
	draw_set_color(c_white);
	draw_set_alpha(_alpha);
	draw_text(140*_s, 20*_s, "Level "+string(global.nowLevel));
	draw_set_color($635242);
	draw_rectangle(_barX-_os, _barY-_os, _barX+_barTotalW+_os, _barY+_barH+_os, false);
	draw_set_color(_barCol);
	draw_rectangle(_barX, _barY, _barX+_barW, _barY+_barH, false);
	
	drawSetDefault();
}

function drawBarrierBar(_alpha){
	var _s = oCamera.resScale;
	var _squareW = 12*_s;
	var _squareH = 2*_s;
	var _betweenW = 1*_s;
	var _barX = 10*_s;
	var _barY = 30*_s;
	var _os = 1*_s;
	var _colBack = $6a4c32;
	var _colSquare = $d6c421;
	var _colLightOff = $8a8571;
	
	//何個光らせるか
	var _lightSquareNum = makeBarrierCountBase - global.makeBarrierCount -1;
	
	if(global.playerHp < 2){
		draw_set_alpha(0.7 * _alpha);
	}
	else{
		draw_set_alpha(0.3 * _alpha);//シールドがついてるときはalpha値がかわる
		_lightSquareNum = makeBarrierCountBase -1;//シールドある時は全部光る
	}
	
	if(global.makeBarrierCount = 1){
		_colSquare = $4dec36;//次でバリあ出るときは色が変わる
	}
	
	
	for(var i=0; i<makeBarrierCountBase-1; i++){
		
		var _x = _barX+(_squareW+_betweenW)*i;
		draw_set_color(_colBack);
		if(_lightSquareNum < i){
			draw_rectangle(_x-_os, _barY-_os, _x+_squareW+_os, _barY+_squareH+_os, false);
			draw_set_color(_colLightOff)
			draw_rectangle(_x, _barY, _x+_squareW, _barY+_squareH, false);
		}
		else{
			draw_rectangle(_x-_os, _barY-_os, _x+_squareW+_os, _barY+_squareH+_os, false);
			draw_set_color(_colSquare);
			draw_rectangle(_x, _barY, _x+_squareW, _barY+_squareH, false);
		}
		
		
	}
	drawSetDefault();
}

//プレイヤーがUIとかぶさるとalpha値がかわる
var _s = oCamera.resScale;
var _yPos = oPlayer.y - 30*_s;
var _ratio = clamp(_yPos / 70, 0, 1);
var _uiAlpha = lerp(0.2, 1, _ratio);

drawScoreUi(_uiAlpha);
drawSpeedLevel(_uiAlpha);
drawLevelBar(_uiAlpha);
drawBarrierBar(_uiAlpha);
//drawOutOfScreenItem()
