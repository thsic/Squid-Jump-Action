
switch(pressedButton){
case PRESSEDTITLEBUTTON.PLAYGAME:
	
	var _camera = oCamera.camera;
	if(!buttonActive){
		createFade(MAINROOM, 30, 30, 2, 3, 4, acFadeIn, 0, 
		camera_get_view_height(_camera), 0, camera_get_view_width(_camera), c_black);
	}
	buttonActive = true;
	
	
break


case PRESSEDTITLEBUTTON.HOWTOPLAY:
//遊び方ウィンドウ表示
	switch(windowState){
	case DRAWINGTITLEWINDOW.DRAWSTART:
		if(!buttonActive){//一番最初だけの処理
			drawWindowTime = 0;
			buttonActive = true;
			drawHowToPlayWindow = true;
		}
	
		//ウィンドウ表示処理
		var _howToPlayWindowDrawTime = 30;
		if(drawWindowTime < _howToPlayWindowDrawTime){
			windowAlpha = drawWindowTime / _howToPlayWindowDrawTime;
			drawWindowTime++;
		}
		else{
			windowState = DRAWINGTITLEWINDOW.DRAWING;
			windowAlpha = 1;
		}
	
		
	break
	case DRAWINGTITLEWINDOW.DRAWING:
		windowAlpha = 1;
		//ウィンドウが完全に表示されている時にどっかタップされると消える
		if(mouse_check_button_pressed(mb_left)){
			windowState = DRAWINGTITLEWINDOW.DRAWEND;
			drawWindowTime = 0;
			//sdm(camera_get_view_width(oCamera.camera))
		}
		
	break
	case DRAWINGTITLEWINDOW.DRAWEND:
		var _howToPlayWindowDrawTime = 30;
		if(drawWindowTime < _howToPlayWindowDrawTime){
			windowAlpha = 1-drawWindowTime / _howToPlayWindowDrawTime;
			drawWindowTime++;
		}
		else{
			windowState = DRAWINGTITLEWINDOW.IDLE;
			buttonActive = false;
			drawHowToPlayWindow = false;
		}
	
	break
	}
	
break
case PRESSEDTITLEBUTTON.STATS:
	
	buttonActive = true;
	
break
case noone:

break
}



//バックグラウンド
function generateTitleBgObj(){
	var _bgobjNum = ds_grid_height(bgObjStats);
	
	for(var i=0; i<_bgobjNum; i++){
		
		var _random = random(1);
		var _spawnRatio = bgObjStats[# TITLEBGSTATS.SPAWNRATIO, i]*bgScrollSpeed;
		if(_random < _spawnRatio){
			
			//生成処理
			var _objectNumber = -1;
			//空いている所さがす
			for(var j=0; j<ds_grid_height(bgObjParam); j++){
				if(!bgObjParam[# TITLEBGPARAM.ENABLED, j]){
					_objectNumber = j;
					break;
				}
			}
			
			//パラメータ入れる
			if(_objectNumber != -1){
				var _sprite = bgObjStats[# TITLEBGSTATS.SPRITE, i];
				var _spd = bgObjStats[# TITLEBGSTATS.SPEED, i];
				var _spawnRatio = bgObjStats[# TITLEBGSTATS.SPAWNRATIO, i];
				var _depth = bgObjStats[# TITLEBGSTATS.DEPTH, i];

				var _x = room_width+sprite_get_width(_sprite);
				var _y = random_range(0,room_height);
								
				bgObjParam[# TITLEBGPARAM.X, _objectNumber] = _x;
				bgObjParam[# TITLEBGPARAM.Y, _objectNumber] = _y;
				bgObjParam[# TITLEBGPARAM.SPEED, _objectNumber] = _spd;
				bgObjParam[# TITLEBGPARAM.SPRITE, _objectNumber] = _sprite;
				bgObjParam[# TITLEBGPARAM.ENABLED, _objectNumber] = true;
				bgObjParam[# TITLEBGPARAM.DEPTH, _objectNumber] = _depth;
			}
		}
	}
}

function moveTitleBgObj(){
	for(var i=0; i<ds_grid_height(bgObjParam); i++){
		if(bgObjParam[# TITLEBGPARAM.ENABLED, i]){
			//移動させる
			bgObjParam[# TITLEBGPARAM.X, i] -= bgScrollSpeed;
			bgObjParam[# TITLEBGPARAM.X, i] -= bgObjParam[# TITLEBGPARAM.SPEED, i];
			
			//端に到達したら消える
			if(bgObjParam[# TITLEBGPARAM.X, i] < -sprite_get_width((bgObjParam[# TITLEBGPARAM.SPRITE, i]))){
				bgObjParam[# TITLEBGPARAM.ENABLED, i] = false;
			}
		}
	}
}

generateTitleBgObj();
moveTitleBgObj()
