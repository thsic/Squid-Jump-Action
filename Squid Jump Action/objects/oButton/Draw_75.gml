
//stepイベントの当たり判定とdrawGuiで表示するボタンの当たり判定はカメラによってちょっとだけずれる場合があるかも

if(buttonDrawEvent == DRAWEVENT.DRAWGUIEND){
	draw_set_alpha(buttonAlpha);
	draw_sprite(buttonSprite, subimage, buttonScreenX, buttonScreenY);
	drawSetDefault();
}

