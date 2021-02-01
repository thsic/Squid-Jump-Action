//残像
var _trailGridHeight = ds_grid_height(dsTrailGrid)-1;
for(var i=0; i<_trailGridHeight; i++){
	
	var _x = dsTrailGrid[# TRAILPARAM.X, i];
	var _y = dsTrailGrid[# TRAILPARAM.Y, i];
	var _alpha = dsTrailGrid[# TRAILPARAM.ALPHA, i];
	var _dir = dsTrailGrid[# TRAILPARAM.DIRECTION, i];
	var _enable = dsTrailGrid[# TRAILPARAM.ENABLE, i];
	var _trailColor = trailColor;
	if(global.randomEventId == RANDOMEVENT.INBINCIBLE){
		_trailColor = invincibleModeColor;//無敵モード中のみ色がかわる
	}
	draw_sprite_ext(sprite_index, 3, _x, _y, 1, 1, _dir, _trailColor, _alpha);
}

//アウトライン
shTexelHandle = shader_get_uniform(shOutline, "inTexel");
shOutlineColorHandle = shader_get_uniform(shOutline, "outlineColor");

shader_set(shOutline);

var _tex = sprite_get_texture(sprite_index, image_index);
var _tWidth = texture_get_texel_width(_tex)
var _tHeight = texture_get_texel_height(_tex)

if(dashEnable){
	
	//プレイヤーのいろ変える
	var _dashTimePer = dashTime/dashTimeBase;
	var _sprCol = merge_color(c_white, dashingSpriteColor, _dashTimePer*0.5);//プレイヤースプライトの色
	
	var _r = 0.1;
	var _g = 0.2;
	var _b = 0.9;
	var _a = _dashTimePer*0.4;

}
else{
	var _r = 0.0;
	var _g = 0.0;
	var _b = 0.0;
	var _a = 0;
	var _sprCol = c_white;
}

if(global.randomEventId == RANDOMEVENT.INBINCIBLE){
	var _r = 0.1;
	var _g = 0.8;
	var _b = 0.3;
	var _a = 0.6;
	var _sprCol = c_white;
}

shader_set_uniform_f(shTexelHandle, _tWidth, _tHeight);
shader_set_uniform_f(shOutlineColorHandle, _r, _g, _b, _a);


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



draw_sprite_ext(sprite_index, subimage, x, y, 1, 1, _drawDirection, _sprCol, _alpha);

shader_reset();

if(global.playerHp == 2){
	//バリアがある場合はバリアを描画
	draw_sprite_ext(sBarrier, 0, x, y, 1, 1, 0, c_white, 0.5);
}

if(chargeingDash){
	
	var _arrowX = lengthdir_x(16, drawDashDirection) + x;
	var _arrowY = lengthdir_y(16, drawDashDirection) + y;
	draw_sprite_ext(sDashDirArrow, 0, _arrowX, _arrowY, 1, 1, drawDashDirection, c_white, 1);
	
}

//残りダッシュ回数など描画
var _spriteX = bbox_left - 6;
var _spriteY = bbox_top - 16;
var _sprW = sprite_get_width(sRemainDash);


if(!infiniteJumpEnable){
	var _lc = merge_color($ee8d00, c_white, 0.5);
	for(var i=0; i<remainDashCount; i++){
		if(i=remainDashCount-1 and chargeingDash){
			var _col = _lc;
		}
		else{
			var _col = $ee8d00;
		}
		
		draw_sprite_ext(sRemainDash, 0, _spriteX, _spriteY, 1, 1, 0, _col, 1);
		_spriteX += _sprW;
	}
}
else{
	//無限ジャンプ中
	var _lighting = sin(current_time/200)/2 + 0.5;
	var _lc = merge_color($eedc00, c_white, _lighting);
	var _wScale = infiniteJumpTime / MAXINFINITEJUMPTIME;
	draw_sprite_ext(sInfiniteJumpGauge, 0, _spriteX, _spriteY, _wScale, 1, 0, _lc, 1);
	draw_sprite_ext(sInfiniteJumpGaugeFrame, 0, _spriteX-1, _spriteY, 1, 1, 0, c_white, 1);
	
}

//残りドッジ回数
/*var _spriteX = bbox_left + 8;
var _spriteY = bbox_top - 24;
for(var i=0; i<remainDodgeCount; i++){
	
	draw_sprite_ext(sRemainDodge, 0, _spriteX, _spriteY, 1, 1, 0, c_white, 1);
	_spriteX += 16;
	
}*/


//ジャンプ回数の最大値は1だけどいちおうforで処理
for(var i=0; i<remainJumpCount; i++){
	
	draw_sprite_ext(sRemainJump, 0, _spriteX, _spriteY, 1, 1, 0, c_white, 1);
	_spriteX += 16;
	
}

