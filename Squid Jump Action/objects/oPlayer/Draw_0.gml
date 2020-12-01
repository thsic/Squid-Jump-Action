
//プレーヤー描画
if(invinsibleEnable){
	var _alpha = 0.4;
}
else{
	var _alpha = 1;
}

draw_sprite_ext(sprite_index, 0, x, y, 1, 1, playerDirection, c_white, _alpha);

if(global.playerHp == 2){
	//バリアがある場合はバリアを描画
	draw_sprite_ext(sBarrier, 0, x, y, 1, 1, 0, c_white, 0.5);
}

if(chargeingDash){
	
	draw_circle(swipeStartPointX, swipeStartPointY, 10, false);
	draw_circle(mouse_x, mouse_y, 10, false);
	
	draw_sprite_ext(sArrow, 0, x+40, y, 1, 1, dashDirection, c_white, 1);
	
}

//残りダッシュ回数など描画
var _spriteX = bbox_left + 8;
var _spriteY = bbox_top - 8;
for(var i=0; i<remainDashCount; i++){
	
	draw_sprite_ext(sRemainDash, 0, _spriteX, _spriteY, 1, 1, 0, c_white, 1);
	_spriteX += 16;
	
}

//ジャンプ回数の最大値は1だけどいちおうforで処理
for(var i=0; i<remainJumpCount; i++){
	
	draw_sprite_ext(sRemainJump, 0, _spriteX, _spriteY, 1, 1, 0, c_white, 1);
	_spriteX += 16;
	
}