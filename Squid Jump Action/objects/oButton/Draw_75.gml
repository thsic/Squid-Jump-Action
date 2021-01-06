
//stepイベントの当たり判定とdrawGuiで表示するボタンの当たり判定はカメラによってちょっとだけずれる場合があるかも

if(buttonDrawEvent == DRAWEVENT.DRAWGUIEND){
	var _s = oCamera.resScale;
	draw_set_alpha(buttonAlpha);
	draw_sprite_ext(buttonSprite, subimage, buttonScreenX, buttonScreenY, _s, _s, 0, c_white, 1);
	drawSetDefault();
}

