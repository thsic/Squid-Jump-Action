
function gainScore(_score){
	global.gameScore += _score;
	
	var _x = oPlayer.x;
	var _y = oPlayer.y - 64;
	createRiseEffect(_x, _y, 70, 40, _score, 0);
}