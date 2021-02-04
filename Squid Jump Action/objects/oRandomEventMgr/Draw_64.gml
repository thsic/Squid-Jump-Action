
function drawRandomEventWindow(_drawIcon){
	var _scale = oCamera.resScale;
	var _iconSize = sprite_get_height(sRandomEventIcon)*_scale;
	var _winW = 300;
	var _winH = _iconSize + 16;
	var _winX = 50;
	var _winY = window_get_height()-_winH - 30;
	
	var _name = dsEventParam[# RANDOMEVENTPARAM.NAME, _drawIcon];
	var _description = dsEventParam[# RANDOMEVENTPARAM.DESCRIPTION, _drawIcon];
	var _time = dsEventParam[# RANDOMEVENTPARAM.TIME, _drawIcon];
	
	
	//プレイヤーがUIとかぶさるとalpha値がかわる
	var _s = oCamera.resScale;
	var _yPos = oPlayer.y + 30*_s;
	var _ratio = clamp((room_height - _yPos) / 70, 0, 1);
	var _uiAlpha = lerp(0.2, 0.6, _ratio);
	var _iconAlpha = lerp(0.3, 0.75, _ratio);
	
	usefulWindow(sRandomEventWindow, 1, _winX, _winY, _winW, _winH, 2, 1, _uiAlpha);
	//draw_rectangle(_winX, _winY, _winX+_winW, _winY+_winH, false);
	
	draw_sprite_ext(sRandomEventIcon, _drawIcon, _winX+8, _winY+8, _scale, _scale, 0, c_white, _iconAlpha);
	draw_set_font(foYasa20ja);
	draw_set_valign(fa_middle);
	draw_set_alpha(_uiAlpha)
	draw_text(_winX+_iconSize+20, _winY+_winH/2, _name);
	drawSetDefault();
}



if(eventRoulette){
	drawRandomEventWindow(rouletteView);
}
else if(randomEventEnable){
	drawRandomEventWindow(eventId);
}


