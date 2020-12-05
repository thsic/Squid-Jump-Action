
var _cameraW = camera_get_view_width(oCamera.camera);
var _cameraH = camera_get_view_height(oCamera.camera);

var _winWidth = _cameraW*0.66;
var _winHeight = _cameraH*0.7;
var _winX = _cameraW/2-_winWidth/2;
var _winYFinally = _cameraH*0.15;
var _winYDefault = _cameraH;
var _winY = _winYDefault;

var _gameoverWindowRiseStartTime = 60;
var _gameoverWindowRiseStopTime = 70;


//時間が経過するとgameoverwindowが下から出てくるように
if(gameoverTime > _gameoverWindowRiseStartTime
and gameoverTime < _gameoverWindowRiseStopTime){ 
	
	var _windowRiseTotalTime = _gameoverWindowRiseStopTime - _gameoverWindowRiseStartTime;
	//var _riseTimePercent = 1-(_gameoverWindowRiseStopTime-_gameoverWindowRiseStartTime) / (gameoverTime-_gameoverWindowRiseStartTime)
	var _risePixelPerSecond = (_winYDefault - _winYFinally) / _windowRiseTotalTime;
	//_winY = _winYDefault - (_winYDefault - _winYFinally) * _riseTimePercent;
	_winY = _winYDefault + (_gameoverWindowRiseStartTime - gameoverTime)*_risePixelPerSecond;
	
	usefulWindow(sGameoverWindow, 0, _winX, _winY, _winWidth, _winHeight, 1, 1);
	
	//スコアとか描画
	if(!surface_exists(gameoverWindowTextSurf)){
		gameoverWindowTextSurf = surface_create(_winWidth, _winHeight);
		
	}
	
	surface_set_target(gameoverWindowTextSurf);
	draw_clear_alpha(c_black, 0);
	draw_set_halign(fa_right);
	draw_set_color(c_black);
	draw_text(_winWidth*0.5, _winHeight*0.3, "Score");
	draw_text(_winWidth*0.5, _winHeight*0.5, "HighScore");
	draw_text(_winWidth*0.9, _winHeight*0.3, 0);
	draw_text(_winWidth*0.9, _winHeight*0.5, drawHighScore);
	
	drawSetDefault();
	surface_reset_target();
	
	draw_surface(gameoverWindowTextSurf, _winX, _winY);
	
	var _buttonY = _winY + _winHeight - 70;
	buttonChangeParam(0, noone, _buttonY, noone, false, noone);
	buttonChangeParam(1, noone, _buttonY, noone, false, noone);
	
}
else if(gameoverTime >= _gameoverWindowRiseStopTime){
	
	//ウィンドウ停止
	_winY = _winYFinally;
	
	usefulWindow(sGameoverWindow, 0, _winX, _winY, _winWidth, _winHeight, 1, 1);
	
	surface_set_target(gameoverWindowTextSurf);
	draw_clear_alpha(c_black, 0);
	draw_set_halign(fa_right);
	draw_set_color(c_black);
	draw_text(_winWidth*0.5, _winHeight*0.3, "Score");
	draw_text(_winWidth*0.5, _winHeight*0.5, "HighScore");
	draw_text(_winWidth*0.9, _winHeight*0.3, drawScore);
	draw_text(_winWidth*0.9, _winHeight*0.5, drawHighScore);
	
	drawSetDefault();
	
	surface_reset_target();
	
	draw_surface(gameoverWindowTextSurf, _winX, _winY);
	
}
//ボタン位置調整
if(gameoverTime = _gameoverWindowRiseStopTime){
	var _buttonY = _winY + _winHeight - 70;
	buttonChangeParam(0, noone, _buttonY, noone, false, noone);
	buttonChangeParam(1, noone, _buttonY, noone, false, noone);
}




