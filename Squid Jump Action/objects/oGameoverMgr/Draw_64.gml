
function drawResultText(_winX, _winWidth, _winY){
	//resultの文字
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	draw_set_font(foMplus64);
	drawTextOutline(_winX+_winWidth/2, _winY, "RESULT", $b0a645, $292e34, 4);
	drawSetDefault();
}
var _s = oCamera.resScale;
var _cameraW = camera_get_view_width(oCamera.camera) * _s;
var _cameraH = camera_get_view_height(oCamera.camera) * _s;

var _winWidth = _cameraW*0.66;
var _winHeight = _cameraH*0.7;
var _winX = (_cameraW/2-_winWidth/2);
var _winYFinally = _cameraH*0.15;
var _winYDefault = _cameraH;
var _winY = _winYDefault;
var _fontMain = foYasa32;
var _fontSub = foYasa24;
var _colT = $f7eae8;
var _colO = $5f5453;
var _os = 1*_s;

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
	draw_set_color($3b2f2e);
	draw_set_font(_fontMain);
	
	drawTextOutline(_winWidth*0.5, _winHeight*0.17, "Score", _colT, _colO, _os);
	drawTextOutline(_winWidth*0.9, _winHeight*0.17, 0, _colT, _colO, _os);
	
	draw_set_font(_fontSub);
	drawTextOutline(_winWidth*0.5, _winHeight*0.33, "HighScore", _colT, _colO, _os);
	drawTextOutline(_winWidth*0.9, _winHeight*0.33, drawHighScore, _colT, _colO, _os);
	
	
	//距離
	switch(global.language){
	case LANGUAGE.ENGLISH:
		var _meter = "yd"
	break
	default:
		var _meter = "m"
	break
	}
	var _str = string_format(global.swimLength/100, 12, 2);
	draw_set_font(_fontSub);
	drawTextOutline(_winWidth*0.4, _winHeight*0.5, _str+_meter, _colT, _colO, _os);
	
	
	//level
	drawTextOutline(_winWidth*0.8, _winHeight*0.5, "LEVEL "+string(global.nowLevel), _colT, _colO, _os);
	
	drawSetDefault();
	surface_reset_target();
	
	draw_surface(gameoverWindowTextSurf, _winX, _winY);
	
	var _buttonY = _winY + _winHeight - 70 * _s;
	buttonChangeParam(0, noone, _buttonY, noone, false, noone);
	buttonChangeParam(1, noone, _buttonY, noone, false, noone);
	
	drawResultText(_winX, _winWidth, _winY);
}
else if(gameoverTime >= _gameoverWindowRiseStopTime){
	
	//ウィンドウ停止
	_winY = _winYFinally;
	
	usefulWindow(sGameoverWindow, 0, _winX, _winY, _winWidth, _winHeight, 1, 1);
	
	surface_set_target(gameoverWindowTextSurf);
	draw_clear_alpha(c_black, 0);
	draw_set_halign(fa_right);
	draw_set_font(_fontMain);
	drawTextOutline(_winWidth*0.5, _winHeight*0.17, "Score", _colT, _colO, _os);
	drawTextOutline(_winWidth*0.9, _winHeight*0.17, drawScore, _colT, _colO, _os);
	
	draw_set_font(_fontSub);
	drawTextOutline(_winWidth*0.5, _winHeight*0.33, "HighScore", _colT, _colO, _os);
	drawTextOutline(_winWidth*0.9, _winHeight*0.33, drawHighScore, _colT, _colO, _os);
	
	//距離
	switch(global.language){
	case LANGUAGE.ENGLISH:
		var _meter = "yd"
	break
	default:
		var _meter = "m"
	break
	}
	var _str = string_format(global.swimLength/100, 12, 2);
	
	drawTextOutline(_winWidth*0.4, _winHeight*0.5, _str+_meter, _colT, _colO, _os);
	
	
	//level
	drawTextOutline(_winWidth*0.8, _winHeight*0.5, "LEVEL "+string(global.nowLevel), _colT, _colO, _os);
	
	
	if(newRecord){
		draw_set_font(foMplus24);
		var _r = sin(gameoverTime/3) / 10 + 0.25;
		var _nrCol = merge_color($ff9c24, $FFFFFF, _r);
		draw_set_color(_nrCol);
		draw_set_halign(fa_middle);
		draw_text(_winWidth*0.5, _winHeight*0.07, "NEWRECORD!!!");
	}
	
	
	
	drawSetDefault();
	
	surface_reset_target();
	
	draw_surface(gameoverWindowTextSurf, _winX, _winY);
	
	drawResultText(_winX, _winWidth, _winY)
}

//ボタン位置調整
if(gameoverTime = _gameoverWindowRiseStopTime){
	var _buttonY = _winY + _winHeight - 70 * _s;
	buttonChangeParam(0, noone, _buttonY, noone, false, noone);
	buttonChangeParam(1, noone, _buttonY, noone, false, noone);
}




