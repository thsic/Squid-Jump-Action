
lifeTime--;
if(lifeTime <= 0){
	instance_destroy();
}

x -= global.flySpeed;

var _lifeRatio = 1-(lifeTime / lifeTimeBase);
var _channel = animcurve_get_channel(acBubbleAlpha, 0);
alpha = animcurve_channel_evaluate(_channel, _lifeRatio);
