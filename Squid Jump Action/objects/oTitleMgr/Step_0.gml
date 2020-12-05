
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

