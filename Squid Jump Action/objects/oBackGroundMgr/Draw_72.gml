
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

draw_rectangle_color(0, 0, room_width, _groundPos, 
_topSideColor, _topSideColor, _downSideColor, _downSideColor, false);


