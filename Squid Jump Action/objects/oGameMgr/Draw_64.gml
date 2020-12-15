
function drawScoreUi(){
	draw_set_color(c_white);
	draw_text(10, 10, "Score "+string(global.gameScore));
}
function drawSpeedLevel(){
	draw_set_color(c_white);
	draw_text(130, 10, "Speed");
	
	var _sprWidth = sprite_get_width(sSpeedLevelIcon);
	for(var i=0; i<global.speedLevel; i++){
		var _x = 210 + _sprWidth*i
		draw_sprite(sSpeedLevelIcon, 0, _x, 10);
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

drawScoreUi()
drawSpeedLevel();
drawOutOfScreenItem()
