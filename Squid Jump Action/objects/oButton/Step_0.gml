//カメラに追従
if(instance_exists(oCamera)){
	x = camera_get_view_x(oCamera.camera) + buttonScreenX;
	y = camera_get_view_y(oCamera.camera) + buttonScreenY;
}
else{
	x = buttonScreenX;
	y = buttonScreenY;
}

//ボタンの範囲にマウスがあるかどうか
switch(buttonDrawEvent){
	case DRAWEVENT.DRAW:
	case DRAWEVENT.DRAWBEGIN:
	case DRAWEVENT.DRAWEND:
	
		var _mx = mouse_x;
		var _my = mouse_y;
		var _sprW = sprite_get_width(buttonSprite);
		var _sprH = sprite_get_height(buttonSprite);
	break
	
	case DRAWEVENT.DRAWGUI:
	case DRAWEVENT.DRAWGUIBEGIN:
	case DRAWEVENT.DRAWGUIEND:
		var _s = oCamera.resScale;
		var _mx = window_mouse_get_x();
		var _my = window_mouse_get_y();
		var _sprW = sprite_get_width(buttonSprite) * _s;
		var _sprH = sprite_get_height(buttonSprite) * _s;
	break
	
}

switch(buttonState){
case BUTTONSTATE.IDLE:
	subimage = 0;
	if(isInPlace(x, y, x+_sprW, y+_sprH, _mx, _my)
	and mouse_check_button_pressed(mb_left)){
		buttonState = BUTTONSTATE.PRESSED;
	}
break

case BUTTONSTATE.PRESSED:
	subimage = 1;
	if(mouse_check_button_released(mb_left)){//ボタンが離された時
		if(isInPlace(x, y, x+_sprW, y+_sprH, _mx, _my)){
			buttonState = BUTTONSTATE.RELEASED;//ボタン範囲内で離されたらスクリプト実行
		}
		else{
			buttonState = BUTTONSTATE.IDLE;//ボタン範囲外だともとの状態
		}
	}
break
case BUTTONSTATE.RELEASED:
	subimage = 2;
	script_execute(buttonScript);
	buttonState = BUTTONSTATE.IDLE;
break

}
