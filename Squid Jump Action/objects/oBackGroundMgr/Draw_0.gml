
//背景描画 一番うしろ
var _topSideColor = backGroundColor1;
var _downSideColor = backGroundColor2;
var _groundColor = groundColor;

var _groundPosMin = GROUNDPOS - 100;
var _groundPosMax = GROUNDPOS - 200;
var _groundDrawScale = 1-oPlayer.y / GROUNDPOS;
var _hoge = (_groundPosMax - _groundPosMin) * _groundDrawScale;//
var _groundPos = _hoge + _groundPosMin;

if(GROUNDENABLE){
	_groundPos = GROUNDPOS - 50;
	draw_rectangle_color(0, _groundPos, room_width, room_height,
	_downSideColor, _downSideColor, _groundColor, _groundColor, false);
}
else{
	_groundPos = room_height;
}

draw_set_alpha(1);
draw_rectangle_color(0, 0, room_width, _groundPos, 
_topSideColor, _topSideColor, _downSideColor, _downSideColor, false);

drawSetDefault()

//バックグラウンドオブジェクト
for(var i=0; i<ds_grid_height(bgObjParam); i++){
	if(bgObjParam[# BGOBJPARAM.ENABLED, i]){
		var _sprite = bgObjParam[# BGOBJPARAM.SPRITE, i];
		var _X = bgObjParam[# BGOBJPARAM.X, i];
		var _Y = bgObjParam[# BGOBJPARAM.Y, i];
		var _scale = bgObjParam[# BGOBJPARAM.SCALE, i];
		
		//draw_sprite_ext(_sprite, 0, _X, _Y, _scale, _scale, 0, c_white, _scale);

	}
}

//速度が早いときにでるエフェクト
for(var i=0; i<ds_grid_height(dsDashEffect); i++){
	if(dsDashEffect[# DASHEFFECTPARAM.ENABLE, i]){
		var _sprite = dsDashEffect[# DASHEFFECTPARAM.SPRITE, i];
		var _x = dsDashEffect[# DASHEFFECTPARAM.X, i];
		var _y = dsDashEffect[# DASHEFFECTPARAM.Y, i];
		
		draw_sprite_ext(_sprite, 0, _x, _y, 1, 1, 0, c_white, dashEffectAlpha);
	}
}

