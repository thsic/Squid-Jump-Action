
function drawScoreUi(){
	draw_set_color(c_white);
	draw_text(10, 10, "Score "+string(global.gameScore));
}
function drawSpeedLevel(){
	draw_set_color(c_white);
	draw_text(130, 10, "Speed");
	
	var _sprWidth = sprite_get_width(sSpeedLevelIcon);
	for(var i=0; i<global.speedLevel; i++){
		var _x = 210 + _sprWidth*i
		draw_sprite(sSpeedLevelIcon, 0, _x, 10);
	}
}


drawScoreUi()
drawSpeedLevel();