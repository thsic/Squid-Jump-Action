
function gainScore(_scoreBase, _scoreColor){
	if(_scoreBase > 0){
		var _score = round(_scoreBase *global.scoreRatio);
		global.gameScore += _score;
		
		var _x = oPlayer.x;
		var _y = oPlayer.y - 32;
		//createRiseEffect(_x, _y, 70, 40, _score, 0);
		createScoreEffect(_score, _x, _y, _scoreColor);
	}
}