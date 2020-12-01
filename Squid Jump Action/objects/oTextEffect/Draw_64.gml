
if(useDrawGui){
	var _channel = animcurve_get_channel(acLevelUpTextAlpha, 0);
	var _pos = sequenceLifeTime / sequenceLengthDefault;
	var _alpha = animcurve_channel_evaluate(_channel, _pos);
	draw_set_alpha(_alpha);
	draw_set_color(color);
	draw_text(x, y, text);
	drawSetDefault();
}
