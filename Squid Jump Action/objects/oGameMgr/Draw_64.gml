
function drawScoreUi(){
	draw_set_color(c_white);
	draw_text(10, 10, "Score "+string(global.gameScore));
}


drawScoreUi()