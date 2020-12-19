
//プレーヤー描画
if(invinsibleEnable){
	var _channel = animcurve_get_channel(acInvinsibleAlpha, 0);
	var _timeRatio = 1-invinsibleTime / invinsibleTimeBase;
	var _alpha = animcurve_channel_evaluate(_channel, _timeRatio);
}
else{
	var _alpha = 1;
}

var _drawDirection = playerDirection;
if(chargeingDash){
	_drawDirection = drawDashDirection;
}

draw_sprite_ext(sprite_index, subimage, x, y, 1, 1, _drawDirection, c_white, _alpha);

if(global.playerHp == 2){
	//バリアがある場合はバリアを描画
	draw_sprite_ext(sBarrier, 0, x, y, 1, 1, 0, c_white, 0.5);
}

if(chargeingDash){
	
	draw_sprite_ext(sArrow, 0, x+40, y, 1, 1, dashDirection, c_white, 1);
	
}

//残りダッシュ回数など描画
var _spriteX = bbox_left + 8;
var _spriteY = bbox_top - 8;
for(var i=0; i<remainDashCount; i++){
	
	draw_sprite_ext(sRemainDash, 0, _spriteX, _spriteY, 1, 1, 0, c_white, 1);
	_spriteX += 16;
	
}

//残りドッジ回数
var _spriteX = bbox_left + 8;
var _spriteY = bbox_top - 24;
for(var i=0; i<remainDodgeCount; i++){
	
	draw_sprite_ext(sRemainDodge, 0, _spriteX, _spriteY, 1, 1, 0, c_white, 1);
	_spriteX += 16;
	
}


//ジャンプ回数の最大値は1だけどいちおうforで処理
for(var i=0; i<remainJumpCount; i++){
	
	draw_sprite_ext(sRemainJump, 0, _spriteX, _spriteY, 1, 1, 0, c_white, 1);
	_spriteX += 16;
	
}