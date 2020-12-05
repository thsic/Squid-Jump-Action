
switch(pressedButton){
case 0:
	
	var _camera = oCamera.camera;
	if(!buttonActive){
		createFade(MAINROOM, 30, 30, 2, 3, 4, acFadeIn, 0, 
		camera_get_view_height(_camera), 0, camera_get_view_width(_camera), c_black);
	}
	buttonActive = true;
	
	
break
case 1:
	
	buttonActive = true;
	
break
case 2:
	
	buttonActive = true;
	
break
case noone:

break
}

enum PRESSEDTITLEBUTTON{
	PLAYGAME,
	HOWTOPLAY,
	ACHIEVEMENT,
}