// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createScoreEffect(_score, _x, _y, _color){
	with(instance_create_layer(_x, _y, "UI", oScoreEffect)){
		drawScore = _score;
		textColor = _color;
	}
}