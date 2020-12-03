
var _cameraW = camera_get_view_width(oCamera.camera);
var _cameraH = camera_get_view_height(oCamera.camera);

var _winWidth = _cameraW*0.66;
var _winHeight = _cameraH*0.5;
var _winX = _cameraW/2-_winWidth/2;
var _winYFinally = _cameraH/2 - _winHeight/2;
var _winYDefault = _cameraH;
var _winY = _winYDefault;

var _gameoverWindowRiseStartTime = 60;
var _gameoverWindowRiseStopTime = 120;

//時間が経過するとgameoverwindowが下から出てくるように
if(gameoverTime > _gameoverWindowRiseStartTime
and gameoverTime < _gameoverWindowRiseStopTime){ 
	
	var _windowRiseTotalTime = _gameoverWindowRiseStopTime - _gameoverWindowRiseStartTime;
	//var _riseTimePercent = 1-(_gameoverWindowRiseStopTime-_gameoverWindowRiseStartTime) / (gameoverTime-_gameoverWindowRiseStartTime)
	var _risePixelPerSecond = (_winYDefault - _winYFinally) / _windowRiseTotalTime;
	//_winY = _winYDefault - (_winYDefault - _winYFinally) * _riseTimePercent;
	_winY = _winYDefault + (_gameoverWindowRiseStartTime - gameoverTime)*_risePixelPerSecond;

}
else if(gameoverTime >= _gameoverWindowRiseStopTime){
	_winY = _winYFinally;
}


usefulWindow(sGameoverWindow, 0, _winX, _winY, _winWidth, _winHeight, 1, 1);

