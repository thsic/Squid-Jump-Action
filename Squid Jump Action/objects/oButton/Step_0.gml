//カメラに追従
x = camera_get_view_x(oCamera.camera) + buttonScreenX;
y = camera_get_view_y(oCamera.camera) + buttonScreenY;

//ボタンの範囲にマウスがあるかどうか

switch(buttonState){
case BUTTONSTATE.IDLE:
	subimage = 0;
	var _sprW = sprite_get_width(buttonSprite);
	var _sprH = sprite_get_height(buttonSprite);
	if(isInPlace(x, y, x+_sprW, y+_sprH, mouse_x, mouse_y)
	and mouse_check_button_pressed(mb_left)){
		buttonState = BUTTONSTATE.PRESSED;
		
	}
	
break
case BUTTONSTATE.PRESSED:
	subimage = 1;
	if(mouse_check_button_released(mb_left)){//ボタンが離された時
		var _sprW = sprite_get_width(buttonSprite);
		var _sprH = sprite_get_height(buttonSprite);
		if(isInPlace(x, y, x+_sprW, y+_sprH, mouse_x, mouse_y)){
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
