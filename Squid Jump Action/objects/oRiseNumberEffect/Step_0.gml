

var _timeRatio = 1-remainLifeTime/lifeTimeBase;
var _channel = animcurve_get_channel(riseAnimationCurve, 0);
var _riseRatio = animcurve_channel_evaluate(_channel, _timeRatio);

//時間が流れるほど上に上がる
y = offsetY - riseHeight * _riseRatio;

remainLifeTime--;

if(remainLifeTime <= 0){
	instance_destroy();
}
