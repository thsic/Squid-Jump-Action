
time--;
drawString = "Level "+string(drawLevel);

var _cameraW = camera_get_view_width(oCamera.camera);
var _strW = string_width(drawString);
var _s = oCamera.resScale;

var _startPos = (_cameraW + _strW) * _s;
var _endPos = -_strW * _s;
var _length = abs(_startPos) + abs(_endPos);
var _channel = animcurve_get_channel(acLevelUpText, 0);
var _percentage = animcurve_channel_evaluate(_channel, 1-time/timeBase);

xPos = _length*_percentage + _endPos;

var _channel2 = animcurve_get_channel(acLevelUpTextAlpha, 0);
var _percentage2 = animcurve_channel_evaluate(_channel2, 1-time/timeBase);
alpha = _percentage2;

if(time <= 0){
	instance_destroy();
}
