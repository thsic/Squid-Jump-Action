
function drawSurfaceScoreText(){
	surface_set_target(global.scoreSurface[surfaceNumber])
	draw_clear_alpha(c_black, 0);
	
	//文字
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	draw_set_font(foMplus16);
	
	var _tx = surfWidth/2;
	var _ty = surfHeight/2;
	var _str = string(drawScore)
	var _os = 1;//outline size;
	
	draw_set_color(outlineColor);
	//アウトライン ごりおし
	draw_text(_tx+_os, _ty, string(_str));
	draw_text(_tx-_os, _ty, string(_str));
	draw_text(_tx+_os, _ty+_os, string(_str));
	draw_text(_tx+_os, _ty-_os, string(_str));
	draw_text(_tx-_os, _ty+_os, string(_str));
	draw_text(_tx-_os, _ty-_os, string(_str));
	draw_text(_tx, _ty+_os, string(_str));
	draw_text(_tx, _ty-_os, string(_str));
	
	//中心
	draw_set_color(textColor);
	draw_text(_tx, _ty, string(_str));
	drawSetDefault();
	
	surface_reset_target();
}


if(!surface_exists(global.scoreSurface[surfaceNumber])){
	//サーフェス存在しないとき
	global.scoreSurface[surfaceNumber] = surface_create(surfWidth, surfHeight);

	drawSurfaceScoreText();
}
if(effectTime = 0){
	//最初
	drawSurfaceScoreText();
}


//サーフェス描画
var _channelXscale = animcurve_get_channel(acScoreEffect, 0);
var _channelYscale = animcurve_get_channel(acScoreEffect, 1);
var _channelAlpha = animcurve_get_channel(acScoreEffect, 2);
var _channelYpos = animcurve_get_channel(acScoreEffect, 3);
var _t = effectTime / effectTotalTime;

var _wScale = animcurve_channel_evaluate(_channelXscale, _t);
var _hScale = animcurve_channel_evaluate(_channelYscale, _t);
var _alpha = animcurve_channel_evaluate(_channelAlpha, _t);
var _yPos = animcurve_channel_evaluate(_channelYpos, _t);

var _width = surfWidth * _wScale;
var _height = surfHeight * _hScale;

var _x1 = x - _width/2;
var _y1 = y - _height/2 - _yPos * riseLength;

//スコアが見きれないように
if(_y1 < 0){
	_y1 = 0;
}

//draw_rectangle(_x1, _y1, _x1+_width, _y1+_height, false);
draw_surface_stretched_ext(global.scoreSurface[surfaceNumber],
_x1, _y1, _width, _height, c_white, _alpha);








