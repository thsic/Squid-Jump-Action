
function gainScore(_scoreBase, _scoreColor, _drawScore, _enableScoreRatio){
	if(_scoreBase > 0){
		if(_enableScoreRatio){
			var _score = round(_scoreBase *global.scoreRatio);
		}
		else{
			var _score = _scoreBase;
		}
		global.gameScore += _score;
		
		if(_drawScore){
			var _x = oPlayer.x;
			var _y = oPlayer.y - 32;
			//createRiseEffect(_x, _y, 70, 40, _score, 0);
			createScoreEffect(_score, _x, _y, _scoreColor);
		}
	}
}