
gameoverTime++;

var _cameraW = camera_get_view_width(oCamera.camera);
var _cameraH = camera_get_view_height(oCamera.camera);

if(gameoverTime = 60){
	var _buttonY = 500;
	var _titleButtonX = _cameraW*0.35;
	var _retryButtonX = _cameraW*0.65;
	
	createButton(sTitleButton, _titleButtonX, _buttonY, backToTitle, 0, DRAWEVENT.DRAWGUIEND);
	createButton(sRetryButton, _retryButtonX, _buttonY, doRetry, 1, DRAWEVENT.DRAWGUIEND);
	
}

//スコア表示をいい感じにスロットっぽく(????)表示するやつ
var _scoreDrawStart = 150;
var _scoreDrawEnd = 210;
var _scoreDrawTime = _scoreDrawEnd - _scoreDrawStart;

//最初は表示スコア0
if(gameoverTime < _scoreDrawStart){
	drawScore = 0;
}
	
if(gameoverTime > _scoreDrawStart
and gameoverTime < _scoreDrawEnd
and gameoverTime mod 2 = 0){
	//150fから210fにかけて数値が動く & 2fごとに動く
	
	_scoreDrawPer = (gameoverTime - _scoreDrawStart) / _scoreDrawTime;
	drawScore = ceil(gameScore * _scoreDrawPer);
}
else if(gameoverTime >= _scoreDrawEnd){
	drawScore = ceil(gameScore);
}


if(gameoverTime < _scoreDrawEnd){
	drawHighScore = highScoreOld;
	
	//ハイスコア更新した瞬間からハイスコア動き出す
	if(drawHighScore < drawScore){
		drawHighScore = drawScore;
	}
	
}
//newrecord!!とか表示
if(gameoverTime = _scoreDrawEnd){
	if(highScoreOld < gameScore){
		//ハイスコア更新
		drawHighScore = gameScore;
		newRecord = true;
	}
	else{
		//ハイスコア更新してない
		drawHighScore = highScoreOld;
		newRecord = false;
	}
}

